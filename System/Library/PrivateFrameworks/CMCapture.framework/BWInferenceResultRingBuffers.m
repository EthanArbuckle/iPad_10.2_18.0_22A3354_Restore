@implementation BWInferenceResultRingBuffers

- (BWInferenceResultRingBuffers)init
{
  BWInferenceResultRingBuffers *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceResultRingBuffers;
  v2 = -[BWInferenceResultRingBuffers init](&v4, sel_init);
  if (v2)
  {
    v2->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v2->_rings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (void)setupRingBuffer:(int)a3 inferencesOfType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  BWObjectRingBuffer *v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  if ((_DWORD)v5)
  {
    v7 = -[BWObjectRingBuffer initWithCapacity:]([BWObjectRingBuffer alloc], "initWithCapacity:", v5);
    -[BWObjectRingBuffer setExpectAscending:](v7, "setExpectAscending:", 1);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rings, "setObject:forKeyedSubscript:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4));

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_rings, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4));
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceResultRingBuffers;
  -[BWInferenceResultRingBuffers dealloc](&v3, sel_dealloc);
}

- (id)retrieveInferencesForType:(int)a3 beginning:(id *)a4 until:(id *)a5
{
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  __int128 v14;
  int64_t var3;
  CMTime time2;
  CMTime time1;

  v7 = *(_QWORD *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  time1 = *(CMTime *)a4;
  time2 = *(CMTime *)a5;
  if (CMTimeCompare(&time1, &time2) < 0
    && (v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rings, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7))) != 0)
  {
    v10 = v9;
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)objc_msgSend(v9, "count"));
    if ((int)objc_msgSend(v10, "count") <= 0)
    {
      FigDebugAssert3();
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __74__BWInferenceResultRingBuffers_retrieveInferencesForType_beginning_until___block_invoke;
      v13[3] = &unk_1E4923FC8;
      v14 = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
      v13[4] = v11;
      time1 = (CMTime)*a4;
      objc_msgSend(v10, "enumerateObjectsStartingAt:usingBlock:", &time1, v13);
    }
  }
  else
  {
    FigDebugAssert3();
    v11 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return v11;
}

uint64_t __74__BWInferenceResultRingBuffers_retrieveInferencesForType_beginning_until___block_invoke(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  CMTime v9;
  CMTime time1;

  time1 = *a3;
  v9 = *(CMTime *)(a1 + 40);
  result = CMTimeCompare(&time1, &v9);
  if ((result & 0x80000000) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  *a5 = 1;
  return result;
}

- (void)bufferingStatsForType:(int)a3 firstOut:(id *)a4 lastOut:(id *)a5 countOut:(int *)a6
{
  uint64_t v9;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  int64_t v17;

  v9 = *(_QWORD *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rings, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9));
  v12 = v11;
  if (a4)
  {
    if (!v11)
    {
      v14 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)&a4->var0 = *MEMORY[0x1E0CA2E18];
      a4->var3 = *(_QWORD *)(v14 + 16);
      if (!a5)
        goto LABEL_10;
      goto LABEL_8;
    }
    objc_msgSend(v11, "firstTime");
    *(_OWORD *)&a4->var0 = v16;
    a4->var3 = v17;
  }
  if (!a5)
    goto LABEL_10;
  if (!v12)
  {
LABEL_8:
    v15 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&a5->var0 = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(v15 + 16);
    goto LABEL_9;
  }
  objc_msgSend(v12, "lastTime");
  *(_OWORD *)&a5->var0 = v16;
  v13 = v17;
LABEL_9:
  a5->var3 = v13;
LABEL_10:
  if (a6)
    *a6 = objc_msgSend(v12, "count");
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)insertInferenceResultsFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSMutableDictionary *rings;
  _QWORD v6[5];

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  rings = self->_rings;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__BWInferenceResultRingBuffers_insertInferenceResultsFromSampleBuffer___block_invoke;
  v6[3] = &__block_descriptor_40_e45_v32__0__NSNumber_8__BWObjectRingBuffer_16_B24l;
  v6[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rings, "enumerateKeysAndObjectsUsingBlock:", v6);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

uint64_t __71__BWInferenceResultRingBuffers_insertInferenceResultsFromSampleBuffer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  void *v5;
  _BYTE v6[24];
  CMTime time2;
  CMTime time1;

  result = BWInferenceGetAttachedInferenceResult(*(const void **)(a1 + 32), objc_msgSend(a2, "longValue"));
  if (result)
  {
    v5 = (void *)result;
    if ((int)objc_msgSend(a3, "count") >= 1)
    {
      if (a3)
        objc_msgSend(a3, "lastTime");
      else
        memset(&time1, 0, sizeof(time1));
      objc_msgSend(v5, "timestamp");
      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        objc_msgSend(a3, "clear");
    }
    objc_msgSend(v5, "timestamp");
    return objc_msgSend(a3, "appendObject:forTime:", v5, v6);
  }
  return result;
}

@end
