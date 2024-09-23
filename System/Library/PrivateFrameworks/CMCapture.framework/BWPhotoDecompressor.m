@implementation BWPhotoDecompressor

- (BWPhotoDecompressor)initWithPoolSize:(int)a3 outputPixelFormat:(unsigned int)a4 outputLargestDimension:(int)a5
{
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  if (a3 < 1 || !a4)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("poolSize must be greater than 0, outputPixelFormat must not be 0");
    goto LABEL_7;
  }
  if (a5 < 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("outputLargestDimension must be 0 or greater");
LABEL_7:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0));
  }
  return (BWPhotoDecompressor *)-[BWPhotoDecompressor _initWithPoolSize:outputPixelFormat:outputPixelBufferPool:outputLargestDimension:](self, a3, a4, 0, a5);
}

- (_DWORD)_initWithPoolSize:(int)a3 outputPixelFormat:(void *)a4 outputPixelBufferPool:(int)a5 outputLargestDimension:
{
  _DWORD *v9;
  _DWORD *v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)BWPhotoDecompressor;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[2] = a2;
    v9[3] = a3;
    *((_QWORD *)v9 + 2) = a4;
    v10[6] = a5;
    *((_BYTE *)v10 + 72) = 0;
  }
  return v10;
}

- (BWPhotoDecompressor)initWithOutputPixelBufferPool:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("outputPixelPool must not be nil"), 0));
  return (BWPhotoDecompressor *)-[BWPhotoDecompressor _initWithPoolSize:outputPixelFormat:outputPixelBufferPool:outputLargestDimension:](self, objc_msgSend(a3, "capacity"), objc_msgSend(a3, "pixelFormat"), a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[BWPhotoDecompressor _releaseResources]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoDecompressor;
  -[BWPhotoDecompressor dealloc](&v3, sel_dealloc);
}

- (void)_releaseResources
{
  const void *v2;
  const void *v3;
  const void *v4;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      CMPhotoDecompressionSessionReleaseHardwareResources();
      CMPhotoDecompressionSessionFlushCachedBuffers();
      v2 = *(const void **)(a1 + 48);
      if (v2)
      {
        CFRelease(v2);
        *(_QWORD *)(a1 + 48) = 0;
      }
    }
    v3 = *(const void **)(a1 + 40);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 40) = 0;
    }

    *(_QWORD *)(a1 + 56) = 0;
    v4 = *(const void **)(a1 + 64);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 64) = 0;
    }
    *(_BYTE *)(a1 + 28) = 0;
  }
}

- (void)flush
{
  if (self->_decompressionSession)
  {
    CMPhotoDecompressionSessionReleaseHardwareResources();
    CMPhotoDecompressionSessionFlushCachedBuffers();
  }
  CMPhotoSurfacePoolDiscardCaches();
  -[BWPixelBufferPool flushToMinimumCapacity:](self->_outputPixelBufferPool, "flushToMinimumCapacity:", 0);
}

- (BWPixelBufferPool)outputPixelBufferPool
{
  return self->_outputPixelBufferPool;
}

- (__CVBuffer)newUncompressedPixelBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return (__CVBuffer *)-[BWPhotoDecompressor _newUncompressedPixelBufferFromSampleBuffer:pixelBufferTrackingTag:]((uint64_t)self, a3);
}

- (uint64_t)_newUncompressedPixelBufferFromSampleBuffer:(uint64_t)result pixelBufferTrackingTag:(CMSampleBufferRef)sbuf
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    CMSampleBufferGetDataBuffer(sbuf);
    if (*(_BYTE *)(v2 + 28) || !-[BWPhotoDecompressor _setupResources](v2))
      CMPhotoDecompressionSessionCreateContainer();
    return 0;
  }
  return result;
}

- (uint64_t)_setupResources
{
  uint64_t v2;

  if (!a1)
    return 0;
  if (*(_QWORD *)(a1 + 16) && !*(_BYTE *)(a1 + 72) || *(_QWORD *)(a1 + 40))
  {
    v2 = 0;
  }
  else
  {
    v2 = -[BWPhotoDecompressor _setupDecompressionSurfacePool](a1);
    if (!*(_QWORD *)(a1 + 40))
    {
LABEL_13:
      FigSignalErrorAt();
      return v2;
    }
  }
  if (!*(_QWORD *)(a1 + 48))
  {
    v2 = -[BWPhotoDecompressor _setupDecompressionSession](a1);
    if (!*(_QWORD *)(a1 + 48))
      goto LABEL_13;
  }
  if (!*(_QWORD *)(a1 + 56))
  {
    v2 = -[BWPhotoDecompressor _setupDecompressionOptions](a1);
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_13;
  }
  *(_BYTE *)(a1 + 28) = 1;
  return v2;
}

- (CFDictionaryRef)_setCVColorProperties:(CMSampleBufferRef)sbuf fromSourceBuffer:
{
  const opaqueCMFormatDescription *FormatDescription;
  CFDictionaryRef v5;
  uint64_t v6;
  void *v7;
  CFDictionaryRef v8;
  uint64_t v9;
  CFDictionaryRef v10;
  const __CFString *v11;
  const void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    result = CMFormatDescriptionGetExtensions(FormatDescription);
    if (result)
    {
      v5 = result;
      v6 = *MEMORY[0x1E0CA8E98];
      v18[0] = *MEMORY[0x1E0CA8EE8];
      v18[1] = v6;
      v18[2] = *MEMORY[0x1E0CA8D68];
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      result = (CFDictionaryRef)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (result)
      {
        v8 = result;
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v7);
            v11 = *(const __CFString **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
            v12 = (const void *)-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v11);
            if (v12)
              CVBufferSetAttachment(a2, v11, v12, kCVAttachmentMode_ShouldPropagate);
            v10 = (CFDictionaryRef)((char *)v10 + 1);
          }
          while (v8 != v10);
          result = (CFDictionaryRef)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          v8 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)newUncompressedSampleBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[BWPhotoDecompressor _newUncompressedSampleBufferFromSampleBuffer:pixelBufferTrackingTag:]((__CVBuffer *)self, a3);
}

- (__CVBuffer)_newUncompressedSampleBufferFromSampleBuffer:(__CVBuffer *)result pixelBufferTrackingTag:(opaqueCMSampleBuffer *)a2
{
  __CVBuffer *v3;
  __CVBuffer *v4;
  CMSampleBufferRef v5;

  if (result)
  {
    v3 = result;
    v5 = 0;
    result = (__CVBuffer *)-[BWPhotoDecompressor _newUncompressedPixelBufferFromSampleBuffer:pixelBufferTrackingTag:]((uint64_t)result, a2);
    if (result)
    {
      v4 = result;
      BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, result, (CFTypeRef *)v3 + 8, &v5);
      CFRelease(v4);
      return v5;
    }
  }
  return result;
}

- (uint64_t)_setupDecompressionSurfacePool
{
  uint64_t v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = FigCapturePlatformIOSurfaceWiringAssertionEnabled() != 0;
    v3 = *(unsigned int *)(v1 + 8);
    v7[0] = *MEMORY[0x1E0D09660];
    v5[0] = *MEMORY[0x1E0D09648];
    v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v5[1] = *MEMORY[0x1E0D09620];
    v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v5[2] = *MEMORY[0x1E0D09638];
    v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
    v5[3] = *MEMORY[0x1E0D09630];
    v6[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
    v7[1] = *MEMORY[0x1E0D09640];
    v8[0] = v4;
    v8[1] = &unk_1E49F8700;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    return CMPhotoSurfacePoolCreate();
  }
  return result;
}

- (uint64_t)_setupDecompressionSession
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = *(_QWORD *)(result + 40);
    if (v1)
    {
      v2 = *MEMORY[0x1E0D095B0];
      v3[0] = v1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
    }
    return CMPhotoDecompressionSessionCreate();
  }
  return result;
}

- (uint64_t)_setupDecompressionOptions
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_alloc(MEMORY[0x1E0C99E08]);
    v3 = *MEMORY[0x1E0D09558];
    v7[0] = *MEMORY[0x1E0D09560];
    v7[1] = v3;
    v8[0] = MEMORY[0x1E0C9AAB0];
    v8[1] = MEMORY[0x1E0C9AAA0];
    v7[2] = *MEMORY[0x1E0D09570];
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v1 + 12));
    v7[3] = *MEMORY[0x1E0D09530];
    v8[2] = v4;
    v8[3] = &unk_1E49F8718;
    v5 = objc_msgSend(v2, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
    *(_QWORD *)(v1 + 56) = v5;
    if (*(int *)(v1 + 24) >= 1)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      objc_msgSend(*(id *)(v1 + 56), "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D09568]);
      v5 = *(_QWORD *)(v1 + 56);
    }
    if (v5)
      return 0;
    else
      return 4294954510;
  }
  return result;
}

@end
