@implementation VCPSceneProcessingImageManager

- (VCPSceneProcessingImageManager)init
{
  VCPSceneProcessingImageManager *v2;
  uint64_t v3;
  NSMutableDictionary *pixelBufferPools;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPSceneProcessingImageManager;
  v2 = -[VCPSceneProcessingImageManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    pixelBufferPools = v2->_pixelBufferPools;
    v2->_pixelBufferPools = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)imageManager
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flushCache");

  v4.receiver = self;
  v4.super_class = (Class)VCPSceneProcessingImageManager;
  -[VCPSceneProcessingImageManager dealloc](&v4, sel_dealloc);
}

- (int)_createPixelBuffer:(__CVBuffer *)a3 withWidth:(unint64_t)a4 andHeight:(unint64_t)a5
{
  const __CFDictionary *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0CA8FF0];
  v11[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = CVPixelBufferCreate(0, a4, a5, 0x42475241u, v8, a3);

  return (int)a3;
}

- (int)_createPixelBuffer:(__CVBuffer *)a3 withMinorDimension:(unint64_t)a4 fromFullPixelBuffer:(__CVBuffer *)a5
{
  size_t Height;
  size_t Width;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  Height = CVPixelBufferGetHeight(a5);
  Width = CVPixelBufferGetWidth(a5);
  if (!Width || !Height)
    return -18;
  v11 = Height / Width;
  if (Width > Height)
    v11 = Width / Height;
  v12 = v11 * a4;
  if (Width <= Height)
    v13 = a4;
  else
    v13 = v12;
  if (Width <= Height)
    v14 = v12;
  else
    v14 = a4;
  return -[VCPSceneProcessingImageManager _createPixelBuffer:withWidth:andHeight:](self, "_createPixelBuffer:withWidth:andHeight:", a3, v13, v14);
}

- (int)_pooledPixelBuffer:(__CVBuffer *)a3 withDimension:(unint64_t)a4
{
  NSMutableDictionary *pixelBufferPools;
  void *v8;
  CVPixelBufferPoolRef v9;
  CVReturn v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  CVPixelBufferPoolRef v17;
  NSMutableDictionary *v18;
  void *v19;
  CVPixelBufferPoolRef v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  pixelBufferPools = self->_pixelBufferPools;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pixelBufferPools, "objectForKeyedSubscript:", v8);
  v9 = (CVPixelBufferPoolRef)objc_claimAutoreleasedReturnValue();

  v20 = v9;
  if (!v9)
  {
    v21[0] = *MEMORY[0x1E0CA90E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v21[1] = *MEMORY[0x1E0CA8FD8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CA9040];
    v22[1] = v12;
    v22[2] = &unk_1E6B74F30;
    v14 = *MEMORY[0x1E0CA8FF0];
    v21[2] = v13;
    v21[3] = v14;
    v22[3] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v10 = CVPixelBufferPoolCreate(0, 0, v15, &v20);
    if (v10)
    {

      return v10;
    }
    v17 = v20;
    v18 = self->_pixelBufferPools;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

    v9 = v20;
  }
  return CVPixelBufferPoolCreatePixelBuffer(0, v9, a3);
}

- (int)fullPixelBuffer:(__CVBuffer *)a3 toScaledBuffer:(__CVBuffer *)a4
{
  CVReturn v6;
  int v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  CVReturn v28;
  CVPixelBufferRef v29;
  CVPixelBufferLockFlags v30;
  vImage_Buffer v31;
  vImage_Buffer buf;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = a3;
  v30 = 1;
  if (a3)
  {
    v6 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v28 = v6;
    if (!v6
      || (v7 = v6, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      && (LODWORD(buf.data) = 134218240,
          *(void **)((char *)&buf.data + 4) = a3,
          WORD2(buf.height) = 1024,
          *(_DWORD *)((char *)&buf.height + 6) = v7,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (v7 = v28) == 0))
    {
      buf.data = CVPixelBufferGetBaseAddress(a3);
      buf.height = CVPixelBufferGetHeight(a3);
      buf.width = CVPixelBufferGetWidth(a3);
      buf.rowBytes = CVPixelBufferGetBytesPerRow(a3);
      pixelBuffer = a4;
      unlockFlags = 0;
      if (a4)
      {
        v7 = CVPixelBufferLockBaseAddress(a4, 0);
        v25 = v7;
        if (!v7
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
          && (LODWORD(v31.data) = 134218240,
              *(void **)((char *)&v31.data + 4) = pixelBuffer,
              WORD2(v31.height) = 1024,
              *(_DWORD *)((char *)&v31.height + 6) = v7,
              _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&v31, 0x12u), (v7 = v25) == 0))
        {
          v31.data = CVPixelBufferGetBaseAddress(a4);
          v31.height = CVPixelBufferGetHeight(a4);
          v31.width = CVPixelBufferGetWidth(a4);
          v31.rowBytes = CVPixelBufferGetBytesPerRow(a4);
          v7 = vImageScale_ARGB8888(&buf, &v31, 0, 0x20u);
          if (!v7)
          {
            CVBufferPropagateAttachments(a3, a4);
            v7 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v25);
            if (!v7)
              v7 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v28);
          }
          if (pixelBuffer
            && !v25
            && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
          }
        }
      }
      else
      {
        v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v17)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
        v7 = -50;
      }
      if (v29
        && !v28
        && CVPixelBufferUnlockBaseAddress(v29, v30)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
      }
    }
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v8)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    return -50;
  }
  return v7;
}

- (int)_createPixelBuffer:(__CVBuffer *)a3 withColorSpace:(CGColorSpace *)a4 fromPixelBuffer:(__CVBuffer *)a5
{
  unint64_t Height;
  size_t Width;
  uint64_t BaseAddress;
  size_t v12;
  __CVBuffer *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t BytesPerRow;
  uint32_t BitmapInfo;
  CGContext *v31;
  int v32;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  CGImageRef imageOut;
  CGRect v36;

  Height = CVPixelBufferGetHeight(a5);
  Width = CVPixelBufferGetWidth(a5);
  LODWORD(BaseAddress) = -18;
  if (Width)
  {
    if (Height)
    {
      v12 = Width;
      LODWORD(BaseAddress) = -[VCPSceneProcessingImageManager _createPixelBuffer:withWidth:andHeight:](self, "_createPixelBuffer:withWidth:andHeight:", a3, Width, Height);
      if (!(_DWORD)BaseAddress)
      {
        imageOut = 0;
        VTCreateCGImageFromCVPixelBuffer(a5, 0, &imageOut);
        if (imageOut)
        {
          v13 = *a3;
          pixelBuffer = v13;
          unlockFlags = 0;
          if (v13)
          {
            BaseAddress = CVPixelBufferLockBaseAddress(v13, 0);
            v32 = BaseAddress;
            if ((_DWORD)BaseAddress)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)v13, BaseAddress, v14, v15, v16, v17, v18, v19);
            }
            else
            {
              BaseAddress = (uint64_t)CVPixelBufferGetBaseAddress(v13);
              BytesPerRow = CVPixelBufferGetBytesPerRow(v13);
              BitmapInfo = CGImageGetBitmapInfo(imageOut);
              v31 = CGBitmapContextCreate((void *)BaseAddress, v12, Height, 8uLL, BytesPerRow, a4, BitmapInfo);
              v36.size.width = (double)v12;
              v36.size.height = (double)Height;
              v36.origin.x = 0.0;
              v36.origin.y = 0.0;
              CGContextDrawImage(v31, v36, imageOut);
              CVBufferSetAttachment(v13, (CFStringRef)*MEMORY[0x1E0CA8CD8], a4, kCVAttachmentMode_ShouldPropagate);
              LODWORD(BaseAddress) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v32);
              CF<opaqueCMSampleBuffer *>::~CF((const void **)&v31);
              if (pixelBuffer
                && !v32
                && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
                && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
              }
            }
          }
          else
          {
            v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v20)
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
            LODWORD(BaseAddress) = -50;
          }
        }
        else
        {
          LODWORD(BaseAddress) = -18;
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&imageOut);
      }
    }
  }
  return BaseAddress;
}

- (int)loadFullPixelBuffer:(__CVBuffer *)a3 scaledPixelBuffer299:(__CVBuffer *)a4 scaledPixelBuffer360:(__CVBuffer *)a5 fromImageURL:(id)a6 abnormalDimension:(unint64_t)a7
{
  id v12;
  VCPSceneProcessingImageManager *v13;
  void *v14;
  CGColorSpaceRef v15;
  int v16;
  int v17;
  __CVBuffer *v19;
  __CVBuffer *v20;
  __CVBuffer *v21;
  int v22;
  CGColorSpace *v23;
  CFTypeRef v24;
  CFTypeRef v25;
  CFTypeRef v26;
  CFTypeRef cf;

  v12 = a6;
  *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v26 = 0;
  v24 = 0;
  v25 = 0;
  v13 = self;
  objc_sync_enter(v13);
  +[VCPImageManager sharedImageManager](VCPImageManager, "sharedImageManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  cf = (CFTypeRef)objc_msgSend(v14, "pixelBufferWithFormat:fromImageURL:flushCache:", 1111970369, v12, 0);
  v23 = 0;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v23);

  if (cf)
  {
    v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v23 = v15;
    if (v26)
    {
      CFRelease(v26);
      v26 = 0;
      v15 = v23;
    }
    v16 = -[VCPSceneProcessingImageManager _createPixelBuffer:withColorSpace:fromPixelBuffer:](v13, "_createPixelBuffer:withColorSpace:fromPixelBuffer:", &v26, v15, cf);
    if (v16)
      goto LABEL_9;
    if (a7)
    {
      if (a4)
      {
        if (v25)
        {
          CFRelease(v25);
          v25 = 0;
        }
        v16 = -[VCPSceneProcessingImageManager _createPixelBuffer:withMinorDimension:fromFullPixelBuffer:](v13, "_createPixelBuffer:withMinorDimension:fromFullPixelBuffer:", &v25, 299, v26);
        if (v16)
          goto LABEL_9;
      }
      if (a5)
      {
        if (v24)
        {
          CFRelease(v24);
          v24 = 0;
        }
        v22 = -[VCPSceneProcessingImageManager _createPixelBuffer:withMinorDimension:fromFullPixelBuffer:](v13, "_createPixelBuffer:withMinorDimension:fromFullPixelBuffer:", &v24, 360, v26);
        goto LABEL_45;
      }
    }
    else
    {
      if (a4)
      {
        if (v25)
        {
          CFRelease(v25);
          v25 = 0;
        }
        v16 = -[VCPSceneProcessingImageManager _pooledPixelBuffer:withDimension:](v13, "_pooledPixelBuffer:withDimension:", &v25, 299);
        if (v16)
          goto LABEL_9;
      }
      if (a5)
      {
        if (v24)
        {
          CFRelease(v24);
          v24 = 0;
        }
        v22 = -[VCPSceneProcessingImageManager _pooledPixelBuffer:withDimension:](v13, "_pooledPixelBuffer:withDimension:", &v24, 360);
LABEL_45:
        v16 = v22;
        if (!v22)
          goto LABEL_46;
LABEL_9:
        v17 = 1;
LABEL_10:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&v23);
        goto LABEL_12;
      }
    }
LABEL_46:
    v16 = 0;
    v17 = 0;
    goto LABEL_10;
  }
  v17 = 1;
  v16 = -18;
LABEL_12:
  objc_sync_exit(v13);

  if (!v17
    && (!a4
     || (v16 = -[VCPSceneProcessingImageManager fullPixelBuffer:toScaledBuffer:](v13, "fullPixelBuffer:toScaledBuffer:", v26, v25)) == 0)&& (!a5|| (v16 = -[VCPSceneProcessingImageManager fullPixelBuffer:toScaledBuffer:](v13, "fullPixelBuffer:toScaledBuffer:", v26, v24)) == 0))
  {
    v19 = (__CVBuffer *)v26;
    if (v26)
      v19 = (__CVBuffer *)CFRetain(v26);
    *a3 = v19;
    if (a4)
    {
      v20 = (__CVBuffer *)v25;
      if (v25)
        v20 = (__CVBuffer *)CFRetain(v25);
      *a4 = v20;
    }
    if (a5)
    {
      v21 = (__CVBuffer *)v24;
      if (v24)
        v21 = (__CVBuffer *)CFRetain(v24);
      v16 = 0;
      *a5 = v21;
    }
    else
    {
      v16 = 0;
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v24);
  CF<opaqueCMSampleBuffer *>::~CF(&v25);
  CF<opaqueCMSampleBuffer *>::~CF(&v26);
  CF<opaqueCMSampleBuffer *>::~CF(&cf);

  return v16;
}

- (int)scalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  VCPSceneProcessingImageManager *v10;
  int v11;
  __CVBuffer *v12;
  CFTypeRef cf;

  cf = 0;
  if (a5 == a6)
  {
    v10 = self;
    objc_sync_enter(v10);
    v11 = -[VCPSceneProcessingImageManager _pooledPixelBuffer:withDimension:](v10, "_pooledPixelBuffer:withDimension:", &cf, a5);
    objc_sync_exit(v10);

    if (v11)
      goto LABEL_9;
  }
  else
  {
    v11 = -[VCPSceneProcessingImageManager _createPixelBuffer:withWidth:andHeight:](self, "_createPixelBuffer:withWidth:andHeight:", &cf, a5, a6);
    if (v11)
      goto LABEL_9;
  }
  v11 = -[VCPSceneProcessingImageManager fullPixelBuffer:toScaledBuffer:](self, "fullPixelBuffer:toScaledBuffer:", a3, cf);
  if (!v11)
  {
    v12 = (__CVBuffer *)cf;
    if (cf)
      v12 = (__CVBuffer *)CFRetain(cf);
    v11 = 0;
    *a4 = v12;
  }
LABEL_9:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferPools, 0);
}

@end
