@implementation BWDeferredMetadataCache

- (void)setNumberOfExpectedSampleBuffersForEachPTS:(int)a3
{
  if (a3 <= 1)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't set the expected number of sample buffers for each PTS to a number smaller than 2 (if you don't expect multiple per PTS, why use to cache"), 0));
  if (self->_numberOfExpectedSampleBuffersForEachPTS != a3)
    self->_numberOfExpectedSampleBuffersForEachPTS = a3;
}

- (BWDeferredMetadataCache)initWithCaptureStream:(id)a3 atomicTransactions:(BOOL)a4
{
  _BOOL4 v4;
  BWDeferredMetadataCache *v6;
  objc_super v8;

  if (a3)
  {
    v4 = a4;
    v8.receiver = self;
    v8.super_class = (Class)BWDeferredMetadataCache;
    v6 = -[BWDeferredMetadataCache init](&v8, sel_init);
    if (v6)
    {
      v6->_stream = (BWFigCaptureStream *)a3;
      if (v4)
        v6->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      v6->_numberOfExpectedSampleBuffersForEachPTS = 2;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dmc_removeAllCacheEntries((uint64_t)self->_cache);
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredMetadataCache;
  -[BWDeferredMetadataCache dealloc](&v3, sel_dealloc);
}

- (void)addMetadataAttachmentToSampleBuffer:(opaqueCMSampleBuffer *)a3 withDutyCycleMetadataCache:(id)a4
{
  OpaqueFigSimpleMutex *lock;
  uint64_t v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  signed __int16 *p_age;
  int v13;
  uint64_t v14;
  const void *v15;
  int v16;
  signed __int16 *v17;
  BWDeferredMetadataCacheEntry *v18;
  CFMutableDictionaryRef MutableCopy;
  const void **v20;
  signed __int16 v21;
  CFMutableDictionaryRef v22;
  CFMutableDictionaryRef v23;
  uint64_t v24;
  const void *v25;
  OpaqueFigSimpleMutex *v26;
  CMTime v27;
  CMTime v28;
  CMTime time2;
  CMTime time1;

  if (a3)
  {
    memset(&v28, 0, sizeof(v28));
    CMSampleBufferGetPresentationTimeStamp(&v28, a3);
    lock = self->_lock;
    if (lock)
      pthread_mutex_lock((pthread_mutex_t *)lock);
    v8 = 0;
    v27 = v28;
    while (1)
    {
      if (self->_cache[v8].metadataDict)
      {
        time1 = (CMTime)self->_cache[v8].pts;
        time2 = v27;
        if (!CMTimeCompare(&time1, &time2))
          break;
      }
      if (++v8 == 5)
      {
        if (!-[BWFigCaptureStream addAttachmentsToSampleBuffer:options:](self->_stream, "addAttachmentsToSampleBuffer:options:", a3, 0))
        {
          if (a4)
            FigCaptureMetadataUtilitiesAddMissingDutyCycleMetadata(a3, a4);
          memset(&time1, 0, sizeof(time1));
          CMSampleBufferGetPresentationTimeStamp(&time1, a3);
          v9 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          if (v9 && (time1.flags & 1) != 0)
          {
            v10 = v9;
            v11 = 0;
            p_age = &self->_cache[0].age;
            v13 = -1;
            v14 = MEMORY[0x1E0CA2E18];
            do
            {
              v15 = *(const void **)(p_age - 5);
              if (v15)
              {
                v16 = ++*p_age;
                if (v16 >= 5)
                {
                  v17 = p_age - 17;
                  *(_OWORD *)v17 = *(_OWORD *)v14;
                  *((_QWORD *)v17 + 2) = *(_QWORD *)(v14 + 16);
                  CFRelease(v15);
                  *(_QWORD *)(p_age - 5) = 0;
                  *(_DWORD *)(p_age - 1) = 0;
                  if (v13 == -1)
                    v13 = v11;
                }
              }
              else
              {
                v13 = v11;
              }
              ++v11;
              p_age += 20;
            }
            while (v11 != 5);
            if (v13 < 0)
              -[BWDeferredMetadataCache addMetadataAttachmentToSampleBuffer:withDutyCycleMetadataCache:].cold.1();
            v18 = &self->_cache[v13];
            v18->useCount = 1;
            MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v10);
            v18->pts = ($95D729B680665BEAEFA1D6FCA8238556)time1;
            v18->metadataDict = MutableCopy;
            v18->age = 0;
          }
        }
        goto LABEL_29;
      }
    }
    v20 = (const void **)((char *)&self->super.isa + v8 * 40);
    v21 = self->_cache[v8].useCount + 1;
    self->_cache[v8].useCount = v21;
    if (self->_numberOfExpectedSampleBuffersForEachPTS <= v21)
    {
      dmc_attachMetadataDictToSampleBufferAndPixelBufferAndCleanupPrivateCaptureStreamAttachments(a3, v20[7]);
      v24 = MEMORY[0x1E0CA2E18];
      *((_OWORD *)v20 + 2) = *MEMORY[0x1E0CA2E18];
      v20[6] = *(const void **)(v24 + 16);
      v25 = v20[7];
      if (v25)
      {
        CFRelease(v25);
        v20[7] = 0;
      }
      *((_WORD *)v20 + 32) = 0;
      self->_cache[v8].age = 0;
    }
    else
    {
      v22 = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFDictionaryRef)v20[7]);
      if (v22)
      {
        v23 = v22;
        dmc_attachMetadataDictToSampleBufferAndPixelBufferAndCleanupPrivateCaptureStreamAttachments(a3, v22);
        CFRelease(v23);
      }
    }
LABEL_29:
    v26 = self->_lock;
    if (v26)
      pthread_mutex_unlock((pthread_mutex_t *)v26);
  }
}

- (void)flush
{
  OpaqueFigSimpleMutex *lock;
  OpaqueFigSimpleMutex *v4;

  lock = self->_lock;
  if (lock)
    pthread_mutex_lock((pthread_mutex_t *)lock);
  dmc_removeAllCacheEntries((uint64_t)self->_cache);
  v4 = self->_lock;
  if (v4)
    pthread_mutex_unlock((pthread_mutex_t *)v4);
}

- (int)numberOfExpectedSampleBuffersForEachPTS
{
  return self->_numberOfExpectedSampleBuffersForEachPTS;
}

- (void)addMetadataAttachmentToSampleBuffer:withDutyCycleMetadataCache:.cold.1()
{
  __assert_rtn("dmc_addCacheEntryForSampleBuffer", "BWMultiStreamCameraSourceNodeUtilities.m", 270, "cacheIndexToUse >= 0");
}

@end
