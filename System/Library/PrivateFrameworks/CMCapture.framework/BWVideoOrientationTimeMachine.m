@implementation BWVideoOrientationTimeMachine

- (BWVideoOrientationTimeMachine)initWithCapacity:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4 metadataLocalID:(unsigned int)a5
{
  BWVideoOrientationTimeMachine *v8;
  BWVideoOrientationTimeMachine *v9;
  opaqueCMFormatDescription *v10;
  objc_super v12;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Capacity must be non-zero"), 0));
  v12.receiver = self;
  v12.super_class = (Class)BWVideoOrientationTimeMachine;
  v8 = -[BWVideoOrientationTimeMachine init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_capacity = a3;
    v8->_cache = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8->_capacity);
    if (a4)
      v10 = (opaqueCMFormatDescription *)CFRetain(a4);
    else
      v10 = 0;
    v9->_formatDescription = v10;
    v9->_metadataLocalID = a5;
    v9->_propertyMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v9;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  objc_super v4;

  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)BWVideoOrientationTimeMachine;
  -[BWVideoOrientationTimeMachine dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  v3 = (void *)-[NSMutableArray copy](self->_cache, "copy");
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v5), self, v3);

  return v6;
}

- (void)addItemToCacheWithPTS:(id *)a3 exifOrientation:(signed __int16)a4
{
  uint64_t v4;
  double Seconds;
  BWVideoOrientationTimeMachineItem *v7;
  void *v8;
  void *v9;
  double v10;
  CMTime v11;

  v4 = a4;
  v11 = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&v11);
  v7 = -[BWVideoOrientationTimeMachineItem initWithPTSSeconds:exifOrientation:]([BWVideoOrientationTimeMachineItem alloc], "initWithPTSSeconds:exifOrientation:", v4, Seconds);
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  v8 = (void *)-[NSMutableArray lastObject](self->_cache, "lastObject");
  if (!v8
    || (v9 = v8, objc_msgSend(v8, "ptsSeconds"), v10 < Seconds)
    && objc_msgSend(v9, "exifOrientation") != (_DWORD)v4)
  {
    if (-[NSMutableArray count](self->_cache, "count") >= self->_capacity)
      -[NSMutableArray removeObjectAtIndex:](self->_cache, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->_cache, "addObject:", v7);
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);

}

- (id)copyVideoOrientationSbufFromPTS:(id *)a3 toPTS:(id *)a4 referencePTS:(id *)a5
{
  double Seconds;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CMSampleBufferRef v17;
  CMSampleBufferRef v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTime v24;
  CMTime time;
  CMTime time2;
  CMTime time1;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((a3->var2 & 1) == 0)
    return 0;
  if ((a4->var2 & 1) == 0)
    return 0;
  time1 = *(CMTime *)a3;
  time2 = *(CMTime *)a4;
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    return 0;
  if ((a5->var2 & 1) == 0)
    return 0;
  time1 = (CMTime)*a5;
  time2 = (CMTime)*a3;
  CMTimeAdd(&time, &time1, &time2);
  Seconds = CMTimeGetSeconds(&time);
  time1 = (CMTime)*a5;
  time2 = (CMTime)*a4;
  CMTimeAdd(&v24, &time1, &time2);
  v10 = -[BWVideoOrientationTimeMachine _cachedItemsFromPTSSeconds:toPTSSeconds:](self, "_cachedItemsFromPTSSeconds:toPTSSeconds:", Seconds, CMTimeGetSeconds(&v24));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v21;
LABEL_7:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v21 != v14)
      objc_enumerationMutation(v10);
    v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
    if (!v13)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    time1 = (CMTime)*a3;
    time2 = (CMTime)*a5;
    v17 = -[BWVideoOrientationTimeMachine _newSbufWithCachedItem:trimAtStartPTS:referencePTS:]((CMSampleBufferRef)self, v16, &time1, &time2);
    if (!v17)
      return v13;
    v18 = v17;
    objc_msgSend(v13, "addObject:", v17);
    CFRelease(v18);
    if (v12 == ++v15)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v12)
        goto LABEL_7;
      return v13;
    }
  }
}

- (CMSampleBufferRef)_newSbufWithCachedItem:(CMTime *)a3 trimAtStartPTS:(CMTime *)a4 referencePTS:
{
  CMSampleBufferRef v6;
  double Seconds;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  const opaqueCMFormatDescription *v12;
  CMTime v13;
  CMTime time;

  if (result)
  {
    v6 = result;
    time = *a3;
    Seconds = CMTimeGetSeconds(&time);
    time = *a4;
    v8 = CMTimeGetSeconds(&time);
    objc_msgSend(a2, "ptsSeconds");
    v10 = v9 - v8;
    if (v10 < Seconds)
      v10 = Seconds;
    memset(&time, 0, sizeof(time));
    CMTimeMakeWithSeconds(&time, v10, a4->timescale);
    v11 = objc_msgSend(a2, "exifOrientation");
    v12 = (const opaqueCMFormatDescription *)*((_QWORD *)v6 + 3);
    v13 = time;
    return FigCaptureMetadataUtilitiesCreateVideoOrientationSampleBuffer((uint64_t)&v13, 0, v11, v12);
  }
  return result;
}

- (id)_cachedItemsFromPTSSeconds:(double)a3 toPTSSeconds:(double)a4
{
  unint64_t v7;
  unint64_t v8;
  double v9;
  void *v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  double v16;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (-[NSMutableArray count](self->_cache, "count"))
  {
    v7 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", v7), "ptsSeconds");
      if (v9 >= a4 && v8 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v9 > a3 && v8 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_17;
      if (v9 < a4)
        v8 = v7;
      if (++v7 >= -[NSMutableArray count](self->_cache, "count"))
      {
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          break;
LABEL_17:
        v13 = v8;
        if (v8 < -[NSMutableArray count](self->_cache, "count"))
        {
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", v8), "ptsSeconds");
          v13 = v8;
          if (v14 < a4)
          {
            v15 = v8;
            do
            {
              v13 = v15++;
              if (v15 >= -[NSMutableArray count](self->_cache, "count"))
                break;
              objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", v15), "ptsSeconds");
            }
            while (v16 < a4);
          }
        }
        v12 = (void *)-[NSMutableArray subarrayWithRange:](self->_cache, "subarrayWithRange:", v8, v13 - v8 + 1);
        goto LABEL_23;
      }
    }
  }
  v12 = 0;
LABEL_23:
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v12;
}

@end
