@implementation MLPixelBufferPool

- (MLPixelBufferPool)init
{
  MLPixelBufferPool *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pixelBufferPoolCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLPixelBufferPool;
  v2 = -[MLPixelBufferPool init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pixelBufferPoolCache = v2->_pixelBufferPoolCache;
    v2->_pixelBufferPoolCache = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (__CVPixelBufferPool)_pixelBufferPoolWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  double height;
  double width;
  void *v10;
  PixelBufferPoolKey *v11;
  os_unfair_lock_s *p_cacheLock;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  __CVPixelBufferPool *v24;
  CVPixelBufferPoolRef poolOut;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  _QWORD v43[5];
  _QWORD v44[7];

  v6 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  v44[5] = *MEMORY[0x1E0C80C00];
  -[MLPixelBufferPool pixelBufferPoolCache](self, "pixelBufferPoolCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PixelBufferPoolKey initWithSize:pixelFormatType:]([PixelBufferPoolKey alloc], "initWithSize:pixelFormatType:", v6, width, height);
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(p_cacheLock);
  poolOut = (CVPixelBufferPoolRef)objc_msgSend(v10, "objectForKey:", v11);
  if (!poolOut)
  {
    v43[0] = *MEMORY[0x1E0CA9040];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v13;
    v43[1] = *MEMORY[0x1E0CA90E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v14;
    v43[2] = *MEMORY[0x1E0CA8FD8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CA8FF0];
    v44[2] = v15;
    v44[3] = MEMORY[0x1E0C9AA70];
    v17 = *MEMORY[0x1E0CA8F68];
    v43[3] = v16;
    v43[4] = v17;
    v44[4] = &unk_1E3DA2398;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
    v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v19 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v18, &poolOut);
    if ((_DWORD)v19)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110656;
        v30 = (int)width;
        v31 = 1024;
        v32 = (int)height;
        v33 = 1024;
        v34 = BYTE3(v6);
        v35 = 1024;
        v36 = BYTE2(v6);
        v37 = 1024;
        v38 = BYTE1(v6);
        v39 = 1024;
        v40 = v6;
        v41 = 1024;
        v42 = v19;
        _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "Faield to create a CVPixelBufferPool for frame size %d x %d with pixel format type %c%c%c%c because CVPixelBufferPoolCreate returned %d.", buf, 0x2Cu);
      }

      if (!a5)
        goto LABEL_9;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Faield to create a CVPixelBufferPool for frame size %d x %d with pixel format type %c%c%c%c because CVPixelBufferPoolCreate returned %d."), (int)width, (int)height, BYTE3(v6), BYTE2(v6), BYTE1(v6), v6, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = poolOut;
      objc_msgSend(v10, "setObject:forKeyedSubscript:", poolOut, v11);
    }

LABEL_9:
  }
  os_unfair_lock_unlock(p_cacheLock);
  v24 = poolOut;

  return v24;
}

- (__CVBuffer)createPixelBufferWithSize:(CGSize)a3 pixelFormatType:(unsigned int)a4 error:(id *)a5
{
  double height;
  double width;
  __CVBuffer *result;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  height = a3.height;
  width = a3.width;
  v32 = *MEMORY[0x1E0C80C00];
  result = -[MLPixelBufferPool _pixelBufferPoolWithSize:pixelFormatType:error:](self, "_pixelBufferPoolWithSize:pixelFormatType:error:");
  if (result)
  {
    pixelBufferOut = 0;
    v10 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], result, &pixelBufferOut);
    if ((_DWORD)v10)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110656;
        v19 = (int)width;
        v20 = 1024;
        v21 = (int)height;
        v22 = 1024;
        v23 = HIBYTE(a4);
        v24 = 1024;
        v25 = BYTE2(a4);
        v26 = 1024;
        v27 = BYTE1(a4);
        v28 = 1024;
        v29 = a4;
        v30 = 1024;
        v31 = v10;
        _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Faield to create a CVPixelBuffer for frame size %d x %d with pixel format type %c%c%c%c because CVPixelBufferPoolCreatePixelBuffer returned %d.", buf, 0x2Cu);
      }

      if (a5)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Faield to create a CVPixelBuffer for frame size %d x %d with pixel format type %c%c%c%c because CVPixelBufferPoolCreatePixelBuffer returned %d."), (int)width, (int)height, HIBYTE(a4), BYTE2(a4), BYTE1(a4), a4, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v14);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    return pixelBufferOut;
  }
  return result;
}

- (NSMutableDictionary)pixelBufferPoolCache
{
  return self->_pixelBufferPoolCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferPoolCache, 0);
}

@end
