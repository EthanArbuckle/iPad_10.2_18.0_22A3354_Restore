@implementation BWIntermediateJPEGCompressor

- (uint64_t)_setupJPEGSurfacePool
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[7];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 24))
    {
      LODWORD(v15[0]) = *(_QWORD *)(result + 24);
      v2 = (void *)MEMORY[0x1E0C99D50];
      v3 = 4;
    }
    else
    {
      v15[0] = xmmword_1A32A22A8;
      v15[1] = unk_1A32A22B8;
      v15[2] = xmmword_1A32A22C8;
      v16 = 0xA0000000800000;
      v2 = (void *)MEMORY[0x1E0C99D50];
      v3 = 56;
    }
    v4 = objc_msgSend(v2, "dataWithBytes:length:", v15, v3);
    v5 = FigCapturePlatformIOSurfaceWiringAssertionEnabled() != 0;
    v13 = *MEMORY[0x1E0D09668];
    v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v1 + 52), *MEMORY[0x1E0D09648]);
    v11[1] = *MEMORY[0x1E0D09620];
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v1 + 56));
    v7 = *MEMORY[0x1E0D09628];
    v12[1] = v6;
    v12[2] = MEMORY[0x1E0C9AAB0];
    v8 = *MEMORY[0x1E0D09650];
    v11[2] = v7;
    v11[3] = v8;
    v9 = *MEMORY[0x1E0D09640];
    v12[3] = v4;
    v12[4] = &unk_1E49F81F0;
    v10 = *MEMORY[0x1E0D09638];
    v11[4] = v9;
    v11[5] = v10;
    v12[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11[6] = *MEMORY[0x1E0D09630];
    v12[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    return CMPhotoSurfacePoolCreate();
  }
  return result;
}

- (BWIntermediateJPEGCompressor)initWithCompressionQuality:(float)a3 compressionRate:(float)a4 jpegSurfacePoolLowWaterBufferCount:(int)a5 jpegSurfacePoolHighWaterBufferCount:(int)a6 compressedBufferPoolAllocationTimeoutMS:(unint64_t)a7 name:(id)a8
{
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  BWIntermediateJPEGCompressor *v18;
  BWStats *v19;
  BWMovingWindowStats *v20;
  objc_super v22;

  if (a4 == 0.0)
  {
    if (a3 >= 0.0 && a3 < 1.0)
      goto LABEL_10;
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Must have 0 < compressionQuality < 1");
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0));
  }
  if (a4 < 0.0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Must have compressionRate > 0");
    goto LABEL_14;
  }
  if (a3 != 0.0)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Must have compressionQuality be 0 when using compressionRate");
    goto LABEL_14;
  }
LABEL_10:
  v22.receiver = self;
  v22.super_class = (Class)BWIntermediateJPEGCompressor;
  v18 = -[BWIntermediateJPEGCompressor init](&v22, sel_init);
  if (v18)
  {
    v18->_name = (NSString *)a8;
    v18->_compressionQuality = a3;
    v18->_compressionRate = a4;
    v18->_jpegSurfacePoolLowWaterBufferCount = a5;
    v18->_jpegSurfacePoolHighWaterBufferCount = a6;
    v18->_compressedBufferPoolAllocationTimeoutMS = a7;
    v19 = objc_alloc_init(BWStats);
    v18->_overallWaitStats = v19;
    -[BWStats setUnitDesignator:](v19, "setUnitDesignator:", CFSTR("ms"));
    v20 = -[BWMovingWindowStats initWithWindowSize:]([BWMovingWindowStats alloc], "initWithWindowSize:", 128);
    v18->_recentWaitStats = v20;
    -[BWStats setUnitDesignator:](v20, "setUnitDesignator:", CFSTR("ms"));
  }
  return v18;
}

- (opaqueCMSampleBuffer)newJPEGSampleBufferFromUncompressedSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v6;
  unint64_t compressedBufferPoolAllocationTimeoutMS;
  dispatch_time_t v8;
  BWIntermediateJPEGCompressedBufferAssociatedSemaphore *v9;
  OpaqueCMClock *HostTimeClock;
  double Seconds;
  OpaqueCMClock *v12;
  Float64 v13;
  BWIntermediateJPEGCompressedBufferAssociatedSemaphore *v14;
  OS_dispatch_semaphore *backPressureSemaphore;
  NSString *name;
  size_t v18;
  int v19;
  CMTime v20;
  CMTime v21;
  CMTime time;
  CMSampleTimingInfo timingInfoOut;
  opaqueCMSampleBuffer *v24;
  CFTypeRef v25;

  v24 = 0;
  v25 = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    FigSignalErrorAt();
    v9 = 0;
    goto LABEL_17;
  }
  v6 = ImageBuffer;
  memset(&timingInfoOut, 0, sizeof(timingInfoOut));
  if (CMSampleBufferGetSampleTimingInfo(a3, 0, &timingInfoOut))
  {
LABEL_22:
    v9 = 0;
    goto LABEL_15;
  }
  if (self->_setupIsComplete
    || !-[BWIntermediateJPEGCompressor _setupJPEGEncodeResourcesForSourcePixelBuffer:]((uint64_t)self, v6))
  {
    if (!self->_backPressureSemaphore)
    {
      v9 = 0;
LABEL_12:
      if (!CMPhotoCompressionSessionOpenEmptyContainer()
        && !CMPhotoCompressionSessionAddImage())
      {
        v19 = 0;
        v18 = 0;
        if (!CMPhotoCompressionSessionCloseContainerAndCopyBacking())
          goto LABEL_17;
      }
      goto LABEL_15;
    }
    compressedBufferPoolAllocationTimeoutMS = self->_compressedBufferPoolAllocationTimeoutMS;
    if (compressedBufferPoolAllocationTimeoutMS == -1)
      v8 = -1;
    else
      v8 = dispatch_time(0, 1000000 * compressedBufferPoolAllocationTimeoutMS);
    ++self->_numberOfTimesWaitedOnBackPressureSemaphore;
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&time, HostTimeClock);
    Seconds = CMTimeGetSeconds(&time);
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_backPressureSemaphore, v8))
    {
      v12 = CMClockGetHostTimeClock();
      CMClockGetTime(&v21, v12);
      v13 = (CMTimeGetSeconds(&v21) - Seconds) * 1000.0;
      -[BWMovingWindowStats addDataPoint:](self->_recentWaitStats, "addDataPoint:", v13);
      -[BWStats addDataPoint:](self->_overallWaitStats, "addDataPoint:", v13);
      v14 = [BWIntermediateJPEGCompressedBufferAssociatedSemaphore alloc];
      name = self->_name;
      backPressureSemaphore = self->_backPressureSemaphore;
      CMSampleBufferGetPresentationTimeStamp(&v20, a3);
      v9 = -[BWIntermediateJPEGCompressedBufferAssociatedSemaphore initWithSemaphore:name:presentationTimeStamp:](v14, "initWithSemaphore:name:presentationTimeStamp:", backPressureSemaphore, name, &v20);
      goto LABEL_12;
    }
    goto LABEL_22;
  }
  v9 = 0;
LABEL_15:
  if (CMPhotoCompressionSessionIsContainerOpen())
    CMPhotoCompressionSessionCloseContainer();
LABEL_17:
  if (v25)
    CFRelease(v25);
  if (v9)
    CFRelease(v9);
  return v24;
}

- (uint64_t)_setupJPEGFormatDescriptionFromSourceBuffer:(uint64_t)result
{
  uint64_t v3;
  const opaqueCMFormatDescription *FormatDescription;
  CFDictionaryRef Extensions;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const opaqueCMFormatDescription *v13;
  CMVideoDimensions Dimensions;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    Extensions = CMFormatDescriptionGetExtensions(FormatDescription);
    if (Extensions)
    {
      v6 = *MEMORY[0x1E0CA8E98];
      v20[0] = *MEMORY[0x1E0CA8EE8];
      v20[1] = v6;
      v20[2] = *MEMORY[0x1E0CA8D68];
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v7);
            objc_msgSend(v8, "setObject:forKeyedSubscript:", -[__CFDictionary objectForKeyedSubscript:](Extensions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12)), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }
      if (objc_msgSend(v8, "count"))
        Extensions = (CFDictionaryRef)v8;
      else
        Extensions = 0;
    }
    v13 = CMSampleBufferGetFormatDescription(sbuf);
    Dimensions = CMVideoFormatDescriptionGetDimensions(v13);
    return CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6A706567u, Dimensions.width, Dimensions.height, Extensions, (CMVideoFormatDescriptionRef *)(v3 + 104));
  }
  return result;
}

- (uint64_t)_setupJPEGEncodeResourcesForSourcePixelBuffer:(uint64_t)result
{
  uint64_t v2;
  size_t Width;
  __int16 v5;

  if (result)
  {
    v2 = result;
    if (*(float *)(result + 44) <= 0.0)
    {
      *(_QWORD *)(result + 24) = 0;
    }
    else
    {
      Width = CVPixelBufferGetWidth(pixelBuffer);
      *(_QWORD *)(v2 + 24) = (*MEMORY[0x1E0C85AD8]
                            + (unint64_t)((double)(CVPixelBufferGetHeight(pixelBuffer) * Width)
                                               * 1.5
                                               / *(float *)(v2 + 44))
                            - 1) & -*MEMORY[0x1E0C85AD8];
    }
    if (*(_QWORD *)(v2 + 64))
    {
      v5 = 0;
    }
    else
    {
      v5 = -[BWIntermediateJPEGCompressor _setupJPEGSurfacePool](v2);
      if (!*(_QWORD *)(v2 + 64))
        goto LABEL_19;
      if (*(_QWORD *)(v2 + 32))
        *(_QWORD *)(v2 + 16) = dispatch_semaphore_create(*(int *)(v2 + 56));
    }
    if (*(_QWORD *)(v2 + 72)
      || (v5 = -[BWIntermediateJPEGCompressor _setupJPEGCompressionSession](v2), *(_QWORD *)(v2 + 72)))
    {
      if (*(_QWORD *)(v2 + 80)
        || (v5 = -[BWIntermediateJPEGCompressor _setupJPEGContainerOptions](v2), *(_QWORD *)(v2 + 80)))
      {
        if (*(_QWORD *)(v2 + 96)
          || (v5 = -[BWIntermediateJPEGCompressor _setupJPEGCompressionOptions](v2), *(_QWORD *)(v2 + 96)))
        {
          *(_BYTE *)(v2 + 60) = 1;
          return v5;
        }
      }
    }
LABEL_19:
    FigSignalErrorAt();
    return v5;
  }
  return result;
}

- (uint64_t)_setupJPEGContainerOptions
{
  uint64_t v1;
  uint64_t v2;
  CFTypeRef v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *MEMORY[0x1E0D09308];
    v4[0] = *MEMORY[0x1E0D09318];
    v4[1] = v2;
    v5[0] = &unk_1E49F8208;
    v5[1] = &unk_1E49F8220;
    v3 = (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
    if (v3)
      v3 = CFRetain(v3);
    *(_QWORD *)(v1 + 80) = v3;
    if (v3)
      return 0;
    else
      return 4294954510;
  }
  return result;
}

- (uint64_t)_setupJPEGCompressionSession
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = *MEMORY[0x1E0D09478];
    v4[0] = *MEMORY[0x1E0D09480];
    v4[1] = v1;
    v2 = *(_QWORD *)(result + 64);
    v5[0] = MEMORY[0x1E0C9AAB0];
    v5[1] = v2;
    v3 = *MEMORY[0x1E0D09460];
    v4[2] = *MEMORY[0x1E0D09470];
    v4[3] = v3;
    v5[2] = MEMORY[0x1E0C9AAA0];
    v5[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
    return CMPhotoCompressionSessionCreate();
  }
  return result;
}

- (uint64_t)_setupJPEGCompressionOptions
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef v11;
  _QWORD v12[9];
  _QWORD v13[9];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (*(float *)(result + 40) == 0.0)
    {
      v14 = *MEMORY[0x1E0D09600];
      v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(result + 24));
      v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v3 = 10;
    }
    else
    {
      v16 = *MEMORY[0x1E0D09618];
      v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v3 = 3;
    }
    *(_QWORD *)(v1 + 88) = objc_msgSend(v2, "mutableCopy");
    v4 = *MEMORY[0x1E0D09400];
    v12[0] = *MEMORY[0x1E0D09378];
    v12[1] = v4;
    v13[0] = &unk_1E49F8238;
    v13[1] = &unk_1E49F8250;
    v5 = *MEMORY[0x1E0D093A8];
    v12[2] = *MEMORY[0x1E0D09420];
    v12[3] = v5;
    v13[2] = MEMORY[0x1E0C9AAB0];
    v13[3] = MEMORY[0x1E0C9AAA0];
    v6 = *MEMORY[0x1E0D093E8];
    v12[4] = *MEMORY[0x1E0D09448];
    v12[5] = v6;
    v13[4] = MEMORY[0x1E0C9AAB0];
    v13[5] = MEMORY[0x1E0C9AAB0];
    v7 = *MEMORY[0x1E0D093B0];
    v13[6] = MEMORY[0x1E0C9AAB0];
    v8 = *MEMORY[0x1E0D09418];
    v12[6] = v7;
    v12[7] = v8;
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v12[8] = *MEMORY[0x1E0D09410];
    v10 = *(_QWORD *)(v1 + 88);
    v13[7] = v9;
    v13[8] = v10;
    v11 = (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 9);
    if (v11)
      v11 = CFRetain(v11);
    *(_QWORD *)(v1 + 96) = v11;
    if (v11)
      return 0;
    else
      return 4294954510;
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  objc_super v5;
  os_log_type_t type;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE94D0)
  {
    v7 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFE94D0)
    {
      v7 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }

  -[BWIntermediateJPEGCompressor _releaseResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWIntermediateJPEGCompressor;
  -[BWIntermediateJPEGCompressor dealloc](&v5, sel_dealloc);
}

- (void)_releaseResources
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      CMPhotoCompressionSessionReleaseHardwareResources();
      CMPhotoCompressionSessionFlushCachedBuffers();
      CMPhotoCompressionSessionInvalidate();
      v2 = *(const void **)(a1 + 72);
      if (v2)
      {
        CFRelease(v2);
        *(_QWORD *)(a1 + 72) = 0;
      }
    }
    v3 = *(const void **)(a1 + 64);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 64) = 0;
    }
    v4 = *(const void **)(a1 + 80);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 80) = 0;
    }

    *(_QWORD *)(a1 + 88) = 0;
    v5 = *(const void **)(a1 + 96);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 96) = 0;
    }
    v6 = *(const void **)(a1 + 104);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(a1 + 104) = 0;
    }

    *(_QWORD *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 48) = 0;
    *(_BYTE *)(a1 + 60) = 0;
  }
}

- (void)flush
{
  if (self->_compressionSession)
  {
    CMPhotoCompressionSessionReleaseHardwareResources();
    CMPhotoCompressionSessionFlushCachedBuffers();
  }
  CMPhotoSurfacePoolDiscardCaches();
}

@end
