@implementation BWMotionDataTimeMachine

- (BWMotionDataTimeMachine)initWithCapacity:(unint64_t)a3 synchronizedSlaveMotionDataCachingEnabled:(BOOL)a4 cacheEntireMetadataDictionary:(BOOL)a5
{
  BWMotionDataTimeMachine *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[28];

  v27[27] = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Capacity must be non-zero"), 0));
  v25.receiver = self;
  v25.super_class = (Class)BWMotionDataTimeMachine;
  v8 = -[BWMotionDataTimeMachine init](&v25, sel_init);
  if (v8)
  {
    v8->_cache = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    v8->_capacity = a3;
    v8->_synchronizedSlaveMotionDataCachingEnabled = a4;
    v8->_cacheEntireMetadataDictionary = a5;
    v8->_propertyMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v9 = objc_alloc(MEMORY[0x1E0C99D20]);
    v10 = *MEMORY[0x1E0D06970];
    v27[0] = *MEMORY[0x1E0D06D00];
    v27[1] = v10;
    v11 = *MEMORY[0x1E0D06D08];
    v27[2] = *MEMORY[0x1E0D06CF0];
    v27[3] = v11;
    v12 = *MEMORY[0x1E0D06A08];
    v27[4] = *MEMORY[0x1E0D068B0];
    v27[5] = v12;
    v13 = *MEMORY[0x1E0D06DF0];
    v27[6] = *MEMORY[0x1E0D06B68];
    v27[7] = v13;
    v14 = *MEMORY[0x1E0D06D30];
    v27[8] = *MEMORY[0x1E0D06F30];
    v27[9] = v14;
    v15 = *MEMORY[0x1E0D06D40];
    v27[10] = *MEMORY[0x1E0D06D70];
    v27[11] = v15;
    v16 = *MEMORY[0x1E0D06DF8];
    v27[12] = *MEMORY[0x1E0D06D38];
    v27[13] = v16;
    v17 = *MEMORY[0x1E0D06B50];
    v27[14] = *MEMORY[0x1E0D06CE0];
    v27[15] = v17;
    v18 = *MEMORY[0x1E0D088C8];
    v27[16] = *MEMORY[0x1E0D06F48];
    v27[17] = v18;
    v19 = *MEMORY[0x1E0D06A20];
    v27[18] = *MEMORY[0x1E0D06E58];
    v27[19] = v19;
    v20 = *MEMORY[0x1E0D088C0];
    v27[20] = *MEMORY[0x1E0D06AC0];
    v27[21] = v20;
    v21 = *MEMORY[0x1E0D088B8];
    v27[22] = *MEMORY[0x1E0D06B70];
    v27[23] = v21;
    v22 = *MEMORY[0x1E0D06D20];
    v27[24] = *MEMORY[0x1E0D05E68];
    v27[25] = v22;
    v27[26] = *MEMORY[0x1E0D06CC8];
    v8->_motionMetadataKeys = (NSArray *)objc_msgSend(v9, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 27));
    v23 = objc_alloc(MEMORY[0x1E0C99D20]);
    v26[0] = *MEMORY[0x1E0D05D00];
    v26[1] = 0x1E4928E38;
    v8->_sampleBufferAttachmentKeys = (NSArray *)objc_msgSend(v23, "initWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2));
  }
  return v8;
}

- (unint64_t)addMotionDataToCacheForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  void *v5;
  void *AttachedMedia;
  id v7;
  void *v8;
  unint64_t latestAvailableMotionDataSerialNumber;
  unint64_t earliestAvailableMotionDataSerialNumber;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFStringRef *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;

  v5 = -[BWMotionDataTimeMachine _copyMotionDataForSampleBuffer:]((uint64_t)self, a3);
  if (self->_synchronizedSlaveMotionDataCachingEnabled)
  {
    AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a3, 0x1E495AE38);
    if (AttachedMedia
      || (AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"))) != 0)
    {
      v7 = -[BWMotionDataTimeMachine _copyMotionDataForSampleBuffer:]((uint64_t)self, AttachedMedia);
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
    AttachedMedia = 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  earliestAvailableMotionDataSerialNumber = self->_earliestAvailableMotionDataSerialNumber;
  latestAvailableMotionDataSerialNumber = self->_latestAvailableMotionDataSerialNumber;
  v11 = latestAvailableMotionDataSerialNumber + 1;
  self->_latestAvailableMotionDataSerialNumber = latestAvailableMotionDataSerialNumber + 1;
  if (earliestAvailableMotionDataSerialNumber)
  {
    if (latestAvailableMotionDataSerialNumber - earliestAvailableMotionDataSerialNumber + 2 > self->_capacity)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_cache, "removeObjectAtIndex:", 0);
      v11 = self->_latestAvailableMotionDataSerialNumber;
      ++self->_earliestAvailableMotionDataSerialNumber;
    }
  }
  else
  {
    self->_earliestAvailableMotionDataSerialNumber = v11;
  }
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v13 = *MEMORY[0x1E0D082E8];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D082E8]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11), v13);
  v14 = *MEMORY[0x1E0D05BD8];
  v15 = BWSampleBufferGetAttachedMedia(a3, *MEMORY[0x1E0D05BD8]);
  v16 = (CFStringRef *)MEMORY[0x1E0D05CB0];
  if (v15)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);
    v17 = (void *)CMGetAttachment(a3, *v16, 0);
    if (v17)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D060D0]), *MEMORY[0x1E0D060D0]);
  }
  if (AttachedMedia)
  {
    v18 = BWSampleBufferGetAttachedMedia(AttachedMedia, v14);
    if (v18)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v14);
      v19 = (void *)CMGetAttachment(AttachedMedia, *v16, 0);
      if (v19)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D060D0]), *MEMORY[0x1E0D060D0]);
    }
  }
  v20 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (v8)
    v21 = objc_msgSend(v20, "initWithObjectsAndKeys:", v5, BWMotionDataTimeMachineKeyPrimaryMotionData, v8, BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData, 0);
  else
    v21 = objc_msgSend(v20, "initWithObjectsAndKeys:", v5, BWMotionDataTimeMachineKeyPrimaryMotionData, 0, v24, v25);
  v22 = (void *)v21;
  -[NSMutableArray addObject:](self->_cache, "addObject:", v21);
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);

  return v11;
}

- (void)_copyMotionDataForSampleBuffer:(uint64_t)a1
{
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  const __CFString *v20;
  CFTypeRef v21;
  uint64_t v22;
  const __CFAllocator *v23;
  CFDictionaryRef v24;
  CMTime v26;
  CMTime v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v5 = *(unsigned __int8 *)(a1 + 57);
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  if (v5)
  {
    v7 = (void *)objc_msgSend(v6, "initWithDictionary:", v4);
  }
  else
  {
    v7 = (void *)objc_msgSend(v6, "initWithCapacity:", 0);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = *(void **)(a1 + 16);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v14 = objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          if (v14)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = *(void **)(a1 + 24);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(const __CFString **)(*((_QWORD *)&v28 + 1) + 8 * j);
        v21 = CMGetAttachment(target, v20, 0);
        if (v21)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v17);
  }
  v22 = *MEMORY[0x1E0D05D00];
  if (!objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]))
  {
    memset(&v27, 0, sizeof(v27));
    CMSampleBufferGetPresentationTimeStamp(&v27, (CMSampleBufferRef)target);
    v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v26 = v27;
    v24 = CMTimeCopyAsDictionary(&v26, v23);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, v22);
    if (v24)
      CFRelease(v24);
  }
  return v7;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWMotionDataTimeMachine;
  -[BWMotionDataTimeMachine dealloc](&v3, sel_dealloc);
}

- (BOOL)synchronizedSlaveMotionDataCachingEnabled
{
  return self->_synchronizedSlaveMotionDataCachingEnabled;
}

- (unint64_t)earliestAvailableMotionDataSerialNumber
{
  unint64_t earliestAvailableMotionDataSerialNumber;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  earliestAvailableMotionDataSerialNumber = self->_earliestAvailableMotionDataSerialNumber;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return earliestAvailableMotionDataSerialNumber;
}

- (unint64_t)latestAvailableMotionDataSerialNumber
{
  unint64_t latestAvailableMotionDataSerialNumber;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  latestAvailableMotionDataSerialNumber = self->_latestAvailableMotionDataSerialNumber;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return latestAvailableMotionDataSerialNumber;
}

- (id)copyMotionDataForSerialNumber:(unint64_t)a3
{
  unint64_t earliestAvailableMotionDataSerialNumber;
  id v7;
  void *v8;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  earliestAvailableMotionDataSerialNumber = self->_earliestAvailableMotionDataSerialNumber;
  if (a3 < earliestAvailableMotionDataSerialNumber || self->_latestAvailableMotionDataSerialNumber < a3)
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
    return 0;
  }
  v7 = (id)-[NSMutableArray objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", a3 - earliestAvailableMotionDataSerialNumber);
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  if (!v7)
    return 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v7);

  return v8;
}

- (id)copyMotionDataForStartingSerialNumber:(unint64_t)a3 endingSerialNumber:(unint64_t)a4
{
  unint64_t v4;
  unint64_t earliestAvailableMotionDataSerialNumber;
  BOOL v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a4 - a3;
  if (a4 < a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  earliestAvailableMotionDataSerialNumber = self->_earliestAvailableMotionDataSerialNumber;
  v9 = a3 >= earliestAvailableMotionDataSerialNumber;
  v10 = a3 - earliestAvailableMotionDataSerialNumber;
  if (v9 && self->_latestAvailableMotionDataSerialNumber >= a4)
  {
    v15 = v4 + 1;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    if (self->_synchronizedSlaveMotionDataCachingEnabled)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    else
      v12 = 0;
    if (v10 < v10 + v15)
    {
      do
      {
        v16 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", v10);
        v17 = objc_alloc(MEMORY[0x1E0C99E08]);
        v18 = (void *)objc_msgSend(v17, "initWithDictionary:", objc_msgSend(v16, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeyPrimaryMotionData));
        objc_msgSend(v11, "addObject:", v18);

        if (self->_synchronizedSlaveMotionDataCachingEnabled)
        {
          v19 = objc_alloc(MEMORY[0x1E0C99E08]);
          v20 = (void *)objc_msgSend(v19, "initWithDictionary:", objc_msgSend(v16, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData));
          objc_msgSend(v12, "addObject:", v20);

        }
        ++v10;
        --v15;
      }
      while (v15);
    }
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
    if (v11)
    {
      v21 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (v12)
        v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v11, BWMotionDataTimeMachineKeyPrimaryMotionData, v12, BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData, 0);
      else
        v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v11, BWMotionDataTimeMachineKeyPrimaryMotionData, 0, v23, v24);
      v13 = (void *)v22;
      goto LABEL_7;
    }
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
    v11 = 0;
    v12 = 0;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

@end
