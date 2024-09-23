@implementation MADHEICSAlphaSequenceWriter

- (MADHEICSAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3 crop:(CGRect *)a4
{
  MADHEICSAlphaSequenceWriter *v5;
  MADHEICSAlphaSequenceWriter *v6;
  CFDictionaryRef DictionaryRepresentation;
  NSDictionary *crop;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MADHEICSAlphaSequenceWriter;
  v5 = -[MADHEICSAlphaSequenceWriter init](&v10, sel_init, a3);
  v6 = v5;
  if (a4 && v5)
  {
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*a4);
    crop = v6->_crop;
    v6->_crop = (NSDictionary *)DictionaryRepresentation;

  }
  return v6;
}

- (int)createPixelBufferPool:(__CVPixelBufferPool *)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(int)a6
{
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  CVReturn v13;
  uint8_t v15[8];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0CA9040];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v16[1] = *MEMORY[0x1E0CA90E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = *MEMORY[0x1E0CA8FF0];
  v17[2] = v11;
  v17[3] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v13 = CVPixelBufferPoolCreate(0, 0, v12, a3);
  if (v13 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create pixel buffer pool", v15, 2u);
  }

  return v13;
}

- (int)copyInputPlaneIndex:(unint64_t)a3 inputPixelBuffer:(__CVBuffer *)a4 toOutputPlaneIndex:(unint64_t)a5 outputPixelBuffer:(__CVBuffer *)a6 bytesPerPixel:(unint64_t)a7
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  size_t v15;
  size_t v16;
  int result;
  char *BaseAddressOfPlane;
  char *v19;
  char *v20;

  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, a3);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, a3);
  if (WidthOfPlane != CVPixelBufferGetWidthOfPlane(a6, a5) || HeightOfPlane != CVPixelBufferGetHeightOfPlane(a6, a5))
    return -50;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, a3);
  v15 = CVPixelBufferGetBytesPerRowOfPlane(a6, a5);
  v16 = WidthOfPlane * a7;
  result = -50;
  if (v16 <= BytesPerRowOfPlane && v16 <= v15)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, a3);
    v19 = (char *)CVPixelBufferGetBaseAddressOfPlane(a6, a5);
    if (HeightOfPlane)
    {
      v20 = v19;
      do
      {
        memcpy(v20, BaseAddressOfPlane, v16);
        BaseAddressOfPlane += BytesPerRowOfPlane;
        v20 += v15;
        --HeightOfPlane;
      }
      while (HeightOfPlane);
    }
    return 0;
  }
  return result;
}

- (int)demuxPixelBuffer:(__CVBuffer *)a3 imagePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5
{
  CVReturn v9;
  size_t v11;
  size_t Width;
  __CVBuffer *v13;
  __CVBuffer *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD v23[6];
  CVReturn v24;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  CVPixelBufferRef v27;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  CVPixelBufferRef v30;
  __int16 v31;
  CVReturn v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (CVPixelBufferGetPixelFormatType(a3) != 1982882104)
    return -50;
  if (self->_imagePixelBufferPool.value_
    || (v11 = CVPixelBufferGetWidth(a3),
        (v9 = -[MADHEICSAlphaSequenceWriter createPixelBufferPool:width:height:pixelFormat:](self, "createPixelBufferPool:width:height:pixelFormat:", &self->_imagePixelBufferPool, v11, CVPixelBufferGetHeight(a3), 875704438)) == 0))
  {
    if (self->_alphaPixelBufferPool.value_
      || (Width = CVPixelBufferGetWidth(a3),
          (v9 = -[MADHEICSAlphaSequenceWriter createPixelBufferPool:width:height:pixelFormat:](self, "createPixelBufferPool:width:height:pixelFormat:", &self->_alphaPixelBufferPool, Width, CVPixelBufferGetHeight(a3), 1278226488)) == 0))
    {
      pixelBufferOut = 0;
      v9 = CVPixelBufferPoolCreatePixelBuffer(0, self->_imagePixelBufferPool.value_, &pixelBufferOut);
      if (!v9)
      {
        v27 = 0;
        v9 = CVPixelBufferPoolCreatePixelBuffer(0, self->_alphaPixelBufferPool.value_, &v27);
        if (!v9)
        {
          v24 = 0;
          pixelBuffer = a3;
          unlockFlags = 1;
          if (a3)
          {
            v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
            v24 = v9;
            if (!v9
              || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
              && (*(_DWORD *)buf = 134218240,
                  v30 = pixelBuffer,
                  v31 = 1024,
                  v32 = v9,
                  _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v9 = v24) == 0))
            {
              CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)buf, pixelBufferOut, 0);
              v9 = *(_DWORD *)buf;
              if (!*(_DWORD *)buf)
              {
                v9 = -[MADHEICSAlphaSequenceWriter copyInputPlaneIndex:inputPixelBuffer:toOutputPlaneIndex:outputPixelBuffer:bytesPerPixel:](self, "copyInputPlaneIndex:inputPixelBuffer:toOutputPlaneIndex:outputPixelBuffer:bytesPerPixel:", 0, a3, 0, pixelBufferOut, 1);
                if (!v9)
                {
                  v9 = -[MADHEICSAlphaSequenceWriter copyInputPlaneIndex:inputPixelBuffer:toOutputPlaneIndex:outputPixelBuffer:bytesPerPixel:](self, "copyInputPlaneIndex:inputPixelBuffer:toOutputPlaneIndex:outputPixelBuffer:bytesPerPixel:", 1, a3, 1, pixelBufferOut, 2);
                  if (!v9)
                  {
                    v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
                    if (!v9)
                    {
                      CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)v23, v27, 0);
                      v9 = v23[0];
                      if (!v23[0])
                      {
                        v9 = -[MADHEICSAlphaSequenceWriter copyInputPlaneIndex:inputPixelBuffer:toOutputPlaneIndex:outputPixelBuffer:bytesPerPixel:](self, "copyInputPlaneIndex:inputPixelBuffer:toOutputPlaneIndex:outputPixelBuffer:bytesPerPixel:", 2, a3, 0, v27, 1);
                        if (!v9)
                        {
                          v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v23);
                          if (!v9)
                          {
                            v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v24);
                            if (!v9)
                            {
                              v13 = pixelBufferOut;
                              if (pixelBufferOut)
                                v13 = (__CVBuffer *)CFRetain(pixelBufferOut);
                              *a4 = v13;
                              v14 = v27;
                              if (v27)
                                v14 = (__CVBuffer *)CFRetain(v27);
                              v9 = 0;
                              *a5 = v14;
                            }
                          }
                        }
                      }
                      CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)v23);
                    }
                  }
                }
              }
              CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)buf);
              if (pixelBuffer
                && !v24
                && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
                && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
              }
            }
          }
          else
          {
            v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v15)
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
            v9 = -50;
          }
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&v27);
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferOut);
    }
  }
  return v9;
}

- (int)_createCompressionSessionLazy
{
  int started;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (self->_compressionSession.value_)
    return 0;
  started = CMPhotoCompressionSessionCreate();
  if (!started)
  {
    v3 = *MEMORY[0x1E0D09308];
    v6[0] = *MEMORY[0x1E0D09318];
    v6[1] = v3;
    v7[0] = &unk_1E6B72638;
    v7[1] = &unk_1E6B72650;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    started = CMPhotoCompressionSessionOpenEmptyContainer();
    if (!started)
      started = CMPhotoCompressionSessionStartImageSequence();

  }
  return started;
}

- (int)_addPixelBuffer420Alpha:(__CVBuffer *)a3 withTime:(id *)a4
{
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *crop;
  void *v13;
  const void *v15;
  const void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v6 = -[MADHEICSAlphaSequenceWriter _createCompressionSessionLazy](self, "_createCompressionSessionLazy");
  if (!v6)
  {
    v15 = 0;
    v16 = 0;
    v6 = -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:](self, "demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:", a3, &v16, &v15);
    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E08];
      v8 = *MEMORY[0x1E0D09418];
      v19[0] = *MEMORY[0x1E0D09378];
      v19[1] = v8;
      v20[0] = &unk_1E6B72668;
      v20[1] = &unk_1E6B72680;
      v19[2] = *MEMORY[0x1E0D09410];
      v17 = *MEMORY[0x1E0D09618];
      v18 = &unk_1E6B722D0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dictionaryWithDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      crop = self->_crop;
      if (crop)
        objc_msgSend(v11, "setObject:forKeyedSubscript:", crop, *MEMORY[0x1E0D09430]);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E6B72698, *MEMORY[0x1E0D093B8]);
      v6 = CMPhotoCompressionSessionAddImageToSequence();
      if (!v6)
        v6 = CMPhotoCompressionSessionAddAuxiliaryImage();

    }
    CF<opaqueCMSampleBuffer *>::~CF(&v15);
    CF<opaqueCMSampleBuffer *>::~CF(&v16);
  }
  return v6;
}

- (int)_addPixelBufferBGRA:(__CVBuffer *)a3 withTime:(id *)a4
{
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *crop;
  void *v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = -[MADHEICSAlphaSequenceWriter _createCompressionSessionLazy](self, "_createCompressionSessionLazy");
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    v7 = *MEMORY[0x1E0D09418];
    v16[0] = *MEMORY[0x1E0D09378];
    v16[1] = v7;
    v17[0] = &unk_1E6B72668;
    v17[1] = &unk_1E6B72680;
    v16[2] = *MEMORY[0x1E0D09410];
    v14 = *MEMORY[0x1E0D09618];
    v15 = &unk_1E6B722D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    crop = self->_crop;
    if (crop)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", crop, *MEMORY[0x1E0D09430]);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E6B72698, *MEMORY[0x1E0D093B8]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D093C0]);
    v5 = CMPhotoCompressionSessionAddImageToSequence();

  }
  return v5;
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4
{
  int result;
  OSType PixelFormatType;
  int v9;
  __int128 v10;
  int64_t var3;
  __int128 v12;
  int64_t v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = self->_status;
  if (!result)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType == 1111970369)
    {
      v10 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      result = -[MADHEICSAlphaSequenceWriter _addPixelBufferBGRA:withTime:](self, "_addPixelBufferBGRA:withTime:", a3, &v10);
    }
    else
    {
      v9 = PixelFormatType;
      if (PixelFormatType == 1982882104)
      {
        v12 = *(_OWORD *)&a4->var0;
        v13 = a4->var3;
        result = -[MADHEICSAlphaSequenceWriter _addPixelBuffer420Alpha:withTime:](self, "_addPixelBuffer420Alpha:withTime:", a3, &v12);
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110144;
          v15 = v9 >> 24;
          v16 = 1024;
          v17 = v9 << 8 >> 24;
          v18 = 1024;
          v19 = (__int16)v9 >> 8;
          v20 = 1024;
          v21 = (char)v9;
          v22 = 1024;
          v23 = v9;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported pixel format '%c%c%c%c' (%d)", buf, 0x20u);
        }
        result = -50;
      }
    }
    self->_status = result;
  }
  return result;
}

- (int)_finishWithEndTime:(id *)a3 outputData:(id *)a4
{
  int v5;
  id obj;

  v5 = CMPhotoCompressionSessionEndImageSequence();
  if (!v5)
  {
    obj = 0;
    v5 = CMPhotoCompressionSessionCloseContainerAndCopyBacking();
    if (!v5)
      objc_storeStrong(a4, obj);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&obj);
  }
  return v5;
}

- (id)finishWithEndTime:(id *)a3
{
  id v5;
  uint8_t v6[16];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  id v8;

  if (self->_status)
    return 0;
  v7 = *a3;
  v8 = 0;
  if (-[MADHEICSAlphaSequenceWriter _finishWithEndTime:outputData:](self, "_finishWithEndTime:outputData:", &v7, &v8)
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to finalize HEIC sequence", v6, 2u);
  }
  self->_status = -18;
  v5 = v8;

  return v5;
}

+ (int)getOutputWidth:(unint64_t *)a3 outputHeight:(unint64_t *)a4 sequenceData:(id)a5
{
  id v7;
  int Container;
  const void *v10;
  const void *v11;

  v7 = a5;
  *a4 = 0;
  *a3 = 0;
  v11 = 0;
  Container = CMPhotoDecompressionSessionCreate();
  if (!Container)
  {
    v10 = 0;
    Container = CMPhotoDecompressionSessionCreateContainer();
    if (!Container)
    {
      Container = CMPhotoDecompressionContainerGetImageGeometryForIndex();
      if (!Container)
      {
        *a3 = 0;
        *a4 = 0;
      }
    }
    CF<opaqueCMSampleBuffer *>::~CF(&v10);
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v11);

  return Container;
}

+ (id)transcodeSequenceData:(id)a3 maxDimension:(unint64_t)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6
{
  id v9;
  MADHEICSAlphaSequenceTranscoder *v10;
  void *v11;
  id v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v9 = a3;
  v10 = -[MADHEICSAlphaSequenceTranscoder initWithSequenceData:maxDimension:qualityValue:]([MADHEICSAlphaSequenceTranscoder alloc], "initWithSequenceData:maxDimension:qualityValue:", v9, a4, 0.5);
  -[MADHEICSAlphaSequenceTranscoder run](v10, "run");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (objc_msgSend((id)objc_opt_class(), "getOutputWidth:outputHeight:sequenceData:", a5, a6, v11)
      && (int)MediaAnalysisLogLevel() >= 4
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to query HEIC sequence output dimensions", v14, 2u);
    }
    v12 = v11;
  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to transcode HEIC sequence", buf, 2u);
  }

  return v11;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_alphaPixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_imagePixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_compressionSession.value_);
  objc_storeStrong((id *)&self->_crop, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

- (void)demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
