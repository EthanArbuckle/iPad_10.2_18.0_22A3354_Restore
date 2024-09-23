@implementation VCPImageManager

- (VCPImageManager)init
{
  VCPImageManager *v2;
  VCPImageManager *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *transcodeQueue;
  VCPImageManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPImageManager;
  v2 = -[VCPImageManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_encodeSession = 0;
    v2->_decodeSession = 0;
    v2->_transferSession = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.mediaanalysis.VCPImageManager.transcodeQueue", v4);
    transcodeQueue = v3->_transcodeQueue;
    v3->_transcodeQueue = (OS_dispatch_queue *)v5;

    v7 = v3;
  }

  return v3;
}

- (void)dealloc
{
  CMPhotoCompressionSession *encodeSession;
  CMPhotoDecompressionSession *decodeSession;
  OpaqueVTPixelTransferSession *transferSession;
  objc_super v6;

  if (self->_encodeSession)
  {
    CMPhotoCompressionSessionFlushCachedBuffers();
    encodeSession = self->_encodeSession;
    if (encodeSession)
      CFRelease(encodeSession);
  }
  if (self->_decodeSession)
  {
    CMPhotoDecompressionSessionDiscardCachedBuffers();
    decodeSession = self->_decodeSession;
    if (decodeSession)
      CFRelease(decodeSession);
  }
  transferSession = self->_transferSession;
  if (transferSession)
    CFRelease(transferSession);
  v6.receiver = self;
  v6.super_class = (Class)VCPImageManager;
  -[VCPImageManager dealloc](&v6, sel_dealloc);
}

+ (id)sharedImageManager
{
  void *v2;
  void *v3;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPImageManager"), &__block_literal_global_78);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

VCPImageManager *__37__VCPImageManager_sharedImageManager__block_invoke()
{
  return objc_alloc_init(VCPImageManager);
}

+ (BOOL)canDecodeAcceleratedUniformTypeIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC508]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC510]);
  }

  return v4;
}

+ (BOOL)allowFastPathDecodeWithUniformType:(id)a3 pixelWidth:(unint64_t)a4 andPixelHeight:(unint64_t)a5
{
  BOOL result;

  result = +[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:](VCPImageManager, "canDecodeAcceleratedUniformTypeIdentifier:", a3);
  if (a4 > 0x1000 || a5 > 0x1000)
    return 0;
  return result;
}

+ (BOOL)loggingEnabled
{
  return 0;
}

- (id)dataForResource:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  intptr_t (*v17)(uint64_t);
  void *v18;
  NSObject *v19;
  _QWORD aBlock[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CD1468]);
  objc_msgSend(v4, "setNetworkAccessAllowed:", 0);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__50;
  v25 = __Block_byref_object_dispose__50;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v26 = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__VCPImageManager_dataForResource___block_invoke;
  aBlock[3] = &unk_1E6B1AB78;
  aBlock[4] = &v21;
  v7 = _Block_copy(aBlock);
  v15 = v6;
  v16 = 3221225472;
  v17 = __35__VCPImageManager_dataForResource___block_invoke_2;
  v18 = &unk_1E6B16130;
  v8 = dispatch_semaphore_create(0);
  v19 = v8;
  v9 = _Block_copy(&v15);
  objc_msgSend(MEMORY[0x1E0CD1450], "defaultManager", v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "requestDataForAssetResource:options:dataReceivedHandler:completionHandler:", v3, v4, v7, v9);

  if (v11)
  {
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v12 = (id)v22[5];
  }
  else
  {
    objc_msgSend(v3, "privateFileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v13);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  _Block_object_dispose(&v21, 8);

  return v12;
}

uint64_t __35__VCPImageManager_dataForResource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendData:", a2);
}

intptr_t __35__VCPImageManager_dataForResource___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6
{
  const __CFDictionary *v10;
  CVReturn v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0CA8FF0];
  v14[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = CVPixelBufferCreate(0, a3, a4, a5, v10, a6);
  if (v11 && *a6)
  {
    CFRelease(*a6);
    *a6 = 0;
  }

  return v11;
}

- (int)convertPixelBuffer:(__CVBuffer *)a3 toPixelFormat:(int)a4 flushCache:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  OpaqueVTPixelTransferSession **p_transferSession;
  size_t Width;
  OSStatus v11;
  CVPixelBufferRef destinationBuffer;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  p_transferSession = &self->_transferSession;
  if (self->_transferSession || (v11 = VTPixelTransferSessionCreate(0, p_transferSession)) == 0)
  {
    destinationBuffer = 0;
    Width = CVPixelBufferGetWidth(*a3);
    v11 = -[VCPImageManager createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:](self, "createPixelBufferWithWidth:height:pixelFormat:pixelBuffer:", Width, CVPixelBufferGetHeight(*a3), v6, &destinationBuffer);
    if (!v11)
    {
      v11 = VTPixelTransferSessionTransferImage(*p_transferSession, *a3, destinationBuffer);
      if (v5 && *p_transferSession)
      {
        CFRelease(*p_transferSession);
        *p_transferSession = 0;
      }
      if (v11)
      {
        if (destinationBuffer)
          CFRelease(destinationBuffer);
      }
      else
      {
        CFRelease(*a3);
        *a3 = destinationBuffer;
      }
    }
  }
  return v11;
}

- (int)acceleratedDecodeImageData:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5 pixelBuffer:(__CVBuffer *)a6 orientation:(unsigned int *)a7 flushCache:(BOOL)a8
{
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int Container;

  v13 = a3;
  if (a4 == 1111970369)
    v14 = 1111970369;
  else
    v14 = 875704422;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v16, *MEMORY[0x1E0D09570]);

  if (!a7)
    objc_msgSend(v15, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09548]);
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v17, *MEMORY[0x1E0D09568]);

    objc_msgSend(v15, "setValue:forKey:", &unk_1E6B74CD8, *MEMORY[0x1E0D09598]);
  }
  if (self->_decodeSession || (Container = CMPhotoDecompressionSessionCreate()) == 0)
  {
    Container = CMPhotoDecompressionSessionCreateContainer();
    if (!Container)
    {
      Container = CMPhotoDecompressionContainerCreateDictionaryDescription();
      if (!Container)
        Container = -50;
    }
  }
  if (*a6)
  {
    CFRelease(*a6);
    *a6 = 0;
  }

  return Container;
}

- (int)drawImage:(CGImage *)a3 pixelFormat:(int)a4 withOrientation:(unsigned int)a5 maxDimension:(unint64_t)a6 pixelBuffer:(__CVBuffer *)a7
{
  size_t Width;
  size_t Height;
  unint64_t v14;
  double v15;
  size_t v16;
  size_t v17;
  CVReturn v19;
  size_t v20;
  CGFloat *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  size_t v30;
  size_t v31;
  uint32_t v32;
  OSType v33;
  CGColorSpace *ColorSpace;
  CGColorSpace *v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *BaseAddress;
  size_t v54;
  size_t v55;
  size_t BytesPerRow;
  CGContext *v57;
  __CVBuffer *v58;
  _BOOL8 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  CGContextRef c;
  CVReturn v68;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  CVPixelBufferRef pixelBufferOut;
  CFDictionaryRef pixelBufferAttributes;
  void *value;
  CFTypeRef cf;
  CGAffineTransform buf;
  uint64_t v76;
  CGRect v77;

  v76 = *MEMORY[0x1E0C80C00];
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  if (Width <= Height)
    v14 = Height;
  else
    v14 = Width;
  v15 = 1.0;
  if (a6 && v14 > a6)
    v15 = (double)a6 / (double)v14;
  *a7 = 0;
  v16 = CGImageGetWidth(a3);
  v17 = CGImageGetHeight(a3);
  if (v15 > 0.0 && v15 <= 1.0)
  {
    v20 = v17;
    v21 = (CGFloat *)MEMORY[0x1E0C9BAA8];
    v23 = *MEMORY[0x1E0C9BAA8];
    v22 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
    v25 = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
    v24 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
    v26 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
    v27 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
    if (v15 >= 1.0)
    {
      v28 = v16;
      v29 = v17;
    }
    else
    {
      v28 = (unint64_t)(v15 * (double)v16) & 0xFFFFFFFFFFFFFFFELL;
      v29 = (unint64_t)(v15 * (double)v17) & 0xFFFFFFFFFFFFFFFELL;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 134218752;
        *(_QWORD *)((char *)&buf.a + 4) = v16;
        WORD2(buf.b) = 2048;
        *(_QWORD *)((char *)&buf.b + 6) = v20;
        HIWORD(buf.c) = 2048;
        *(_QWORD *)&buf.d = (unint64_t)(v15 * (double)v16) & 0xFFFFFFFFFFFFFFFELL;
        LOWORD(buf.tx) = 2048;
        *(_QWORD *)((char *)&buf.tx + 2) = v29;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CGImage->CVPixelBuffer] Downscaling %zux%zu --> %zux%zu", (uint8_t *)&buf, 0x2Au);
      }
    }
    v30 = v28;
    v31 = v29;
    if (a5 >= 2)
    {
      if (a5 <= 4)
        v30 = v28;
      else
        v30 = v29;
      if (a5 <= 4)
        v31 = v29;
      else
        v31 = v28;
      v24 = 0.0;
      v25 = 1.0;
      v22 = 1.0;
      v26 = 0.0;
      v27 = 0.0;
      v23 = 0.0;
      switch(a5)
      {
        case 2u:
          v26 = (double)v28;
          v23 = -1.0;
          v24 = 1.0;
          goto LABEL_30;
        case 3u:
          v26 = (double)v28;
          v27 = (double)v29;
          v24 = -1.0;
          v22 = 0.0;
          v25 = 0.0;
          v23 = -1.0;
          break;
        case 4u:
          v27 = (double)v29;
          v23 = 1.0;
          v24 = -1.0;
LABEL_30:
          v22 = 0.0;
          v25 = 0.0;
          break;
        case 5u:
          v26 = (double)v29;
          v27 = (double)v28;
          v22 = -1.0;
          goto LABEL_34;
        case 6u:
          v27 = (double)v28;
          v22 = -1.0;
          break;
        case 7u:
          break;
        case 8u:
          v26 = (double)v29;
LABEL_34:
          v25 = -1.0;
          break;
        default:
          v23 = *v21;
          v22 = v21[1];
          v25 = v21[2];
          v24 = v21[3];
          v26 = v21[4];
          v27 = v21[5];
          break;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 67109120;
        HIDWORD(buf.a) = a5;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[CGImage->CVPixelBuffer] Rotating image (orientation %u) to upright", (uint8_t *)&buf, 8u);
      }
    }
    cf = 0;
    if (a4 == 32)
      v32 = 2;
    else
      v32 = 8194;
    if (a4 == 32)
      v33 = 32;
    else
      v33 = 1111970369;
    ColorSpace = CGImageGetColorSpace(a3);
    v35 = ColorSpace;
    if (!ColorSpace)
      goto LABEL_49;
    if (CGColorSpaceSupportsOutput(ColorSpace) && CGColorSpaceGetNumberOfComponents(v35) == 1)
    {
      v32 = 0;
      v33 = 1278226488;
    }
    if (!CGColorSpaceSupportsOutput(v35) || CGColorSpaceUsesExtendedRange(v35))
    {
LABEL_49:
      v35 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
      cf = v35;
      buf.a = 0.0;
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
    }
    value = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    pixelBufferAttributes = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(pixelBufferAttributes, (const void *)*MEMORY[0x1E0CA8FF0], value);
    pixelBufferOut = 0;
    CVPixelBufferCreate(0, v30, v31, v33, pixelBufferAttributes, &pixelBufferOut);
    if (pixelBufferOut)
    {
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8CD8], v35, kCVAttachmentMode_ShouldPropagate);
      pixelBuffer = pixelBufferOut;
      unlockFlags = 0;
      if (pixelBufferOut)
      {
        v19 = CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
        v68 = v19;
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
        }
        else
        {
          BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
          v54 = CVPixelBufferGetWidth(pixelBufferOut);
          v55 = CVPixelBufferGetHeight(pixelBufferOut);
          BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
          v57 = CGBitmapContextCreate(BaseAddress, v54, v55, 8uLL, BytesPerRow, v35, v32);
          c = v57;
          if (v57)
          {
            buf.a = v23;
            buf.b = v22;
            buf.c = v25;
            buf.d = v24;
            buf.tx = v26;
            buf.ty = v27;
            CGContextConcatCTM(v57, &buf);
            v77.size.width = (double)v28;
            v77.size.height = (double)v29;
            v77.origin.x = 0.0;
            v77.origin.y = 0.0;
            CGContextDrawImage(c, v77, a3);
            v19 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v68);
            if (!v19)
            {
              v58 = pixelBufferOut;
              if (pixelBufferOut)
                v58 = (__CVBuffer *)CFRetain(pixelBufferOut);
              v19 = 0;
              *a7 = v58;
            }
          }
          else
          {
            v59 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v59)
              CGImage_CreateCVPixelBuffer(v59, v60, v61, v62, v63, v64, v65, v66);
            v19 = -18;
          }
          CF<opaqueCMSampleBuffer *>::~CF((const void **)&c);
          if (pixelBuffer
            && !v68
            && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:].cold.1();
          }
        }
      }
      else
      {
        v44 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v44)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v44, v45, v46, v47, v48, v49, v50, v51);
        v19 = -50;
      }
    }
    else
    {
      v36 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v36)
        CGImage_CreateCVPixelBuffer(v36, v37, v38, v39, v40, v41, v42, v43);
      v19 = -18;
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferOut);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferAttributes);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&value);
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VCPImageManager drawImage:pixelFormat:withOrientation:maxDimension:pixelBuffer:].cold.1(v15);
    return -50;
  }
  return v19;
}

- (int)decodeImageSource:(CGImageSource *)a3 withUniformTypeIdentifier:(id)a4 pixelFormat:(int)a5 maxDimension:(unint64_t)a6 orientation:(unsigned int *)a7 pixelBuffer:(__CVBuffer *)a8
{
  void *v11;
  CFDictionaryRef v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  int v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  float v30;
  int v31;
  uint64_t v32;
  void *v33;
  CFDictionaryRef v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __IOSurface *IOSurfaceAtIndex;
  NSObject *v39;
  const char *v40;
  __CVBuffer *v41;
  int v42;
  CGImageRef ImageAtIndex;
  signed int PixelFormatType;
  uint64_t v45;
  int v46;
  unsigned int *v49;
  id v51;
  uint8_t v53[16];
  _BYTE buf[12];
  __int16 v55;
  double v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v51 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = a7;
  objc_msgSend(v11, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CBD240]);
  objc_msgSend(v11, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD2B8]);
  if (!a6)
    goto LABEL_29;
  v12 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  -[__CFDictionary objectForKey:](v12, "objectForKey:", *MEMORY[0x1E0CBD048]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKey:](v12, "objectForKey:", *MEMORY[0x1E0CBD040]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKey:](v12, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  v17 = v14;
  v18 = v15;
  if (!objc_msgSend(v16, "intValue") || !objc_msgSend(v17, "intValue"))
  {
    v24 = *MEMORY[0x1E0C9D820];
    v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_14;
  }
  if (!v18)
    goto LABEL_11;
  v19 = objc_msgSend(v18, "unsignedIntValue");
  v20 = v19;
  if (v19 - 9 <= 0xFFFFFFF7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Orientation value %u invalid, assuming kCGImagePropertyOrientationUp", buf, 8u);
    }
    v21 = objc_msgSend(v16, "intValue");
    v22 = objc_msgSend(v17, "intValue");
    goto LABEL_13;
  }
  if (v19 > 4)
  {
    v21 = objc_msgSend(v17, "intValue");
    v22 = objc_msgSend(v16, "intValue");
  }
  else
  {
LABEL_11:
    v21 = objc_msgSend(v16, "intValue");
    v22 = objc_msgSend(v17, "intValue");
  }
LABEL_13:
  v23 = (double)v22;
  v24 = (double)v21;
LABEL_14:

  if (v24 < v23)
    v25 = v23;
  else
    v25 = v24;
  if (v25 > (double)a6)
  {
    v26 = objc_msgSend(v51, "conformsToType:", *MEMORY[0x1E0CEC580]);
    v27 = log2(v25 / (double)a6);
    v28 = ceil(v27);
    v29 = floor(v27);
    if (v26)
      v29 = v28;
    v30 = v29;
    v31 = (int)exp2f(v30);
    if (v31 >= 32)
      v32 = 32;
    else
      v32 = v31;
    if ((int)v32 > 1)
    {
      if (+[VCPImageManager loggingEnabled](VCPImageManager, "loggingEnabled")
        && (int)MediaAnalysisLogLevel() >= 6
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218752;
        *(double *)&buf[4] = v24;
        v55 = 2048;
        v56 = v23;
        v57 = 2048;
        v58 = a6;
        v59 = 1024;
        v60 = v32;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Decode] %.0fx%.0f --> %zu; subsampling %dx on decode",
          buf,
          0x26u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setValue:forKey:", v33, *MEMORY[0x1E0CBD290]);

    }
  }
LABEL_29:
  v34 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  -[__CFDictionary objectForKey:](v34, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
    v37 = objc_msgSend(v35, "unsignedIntValue");
  else
    v37 = 1;

  if (v49 || (_DWORD)v37 == 1)
  {
    IOSurfaceAtIndex = (__IOSurface *)CGImageSourceCreateIOSurfaceAtIndex();
    *(_QWORD *)buf = IOSurfaceAtIndex;
    if (IOSurfaceAtIndex)
    {
      if (!CVPixelBufferCreateWithIOSurface(0, IOSurfaceAtIndex, 0, a8))
      {
        if (v49)
          *v49 = v37;
        goto LABEL_45;
      }
      if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
LABEL_45:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
        goto LABEL_46;
      }
      *(_WORD *)v53 = 0;
      v39 = MEMORY[0x1E0C81028];
      v40 = "[Decode] Failed to create CVPixelBuffer from IOSurface; falling back to rendering path";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_45;
      *(_WORD *)v53 = 0;
      v39 = MEMORY[0x1E0C81028];
      v40 = "[Decode] Failed to obtain IOSurface; falling back to rendering path";
    }
    _os_log_impl(&dword_1B6C4A000, v39, OS_LOG_TYPE_DEFAULT, v40, v53, 2u);
    goto LABEL_45;
  }
LABEL_46:
  v41 = *a8;
  if (*a8)
    goto LABEL_47;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, (CFDictionaryRef)v11);
  *(_QWORD *)buf = ImageAtIndex;
  if (ImageAtIndex)
  {
    v42 = -[VCPImageManager drawImage:pixelFormat:withOrientation:maxDimension:pixelBuffer:](self, "drawImage:pixelFormat:withOrientation:maxDimension:pixelBuffer:", ImageAtIndex, a5, v37, a6, a8);
    if (!v42)
    {
      CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
      v41 = *a8;
LABEL_47:
      if (CVPixelBufferGetPixelFormatType(v41) == a5)
      {
        v42 = 0;
        goto LABEL_66;
      }
      PixelFormatType = CVPixelBufferGetPixelFormatType(*a8);
      v45 = 0;
      if (PixelFormatType <= 875704437)
      {
        if (PixelFormatType == 32)
          goto LABEL_60;
        v46 = 875704422;
      }
      else
      {
        if (PixelFormatType == 875704438 || PixelFormatType == 1111970369)
          goto LABEL_60;
        v46 = 1278226488;
      }
      if (PixelFormatType != v46)
        v45 = 1;
LABEL_60:
      v42 = -[VCPImageManager convertPixelBuffer:toPixelFormat:flushCache:](self, "convertPixelBuffer:toPixelFormat:flushCache:", a8, a5, v45);
      if (!v42)
        goto LABEL_66;
      goto LABEL_64;
    }
  }
  else
  {
    v42 = -18;
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
LABEL_64:
  if (*a8)
  {
    CFRelease(*a8);
    *a8 = 0;
  }
LABEL_66:

  return v42;
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromData:(id)a5 withUniformTypeIdentifier:(id)a6 flushCache:(BOOL)a7 orientation:(unsigned int *)a8
{
  id v14;
  id v15;
  void *v16;
  NSObject *transcodeQueue;
  __CVBuffer *v18;
  _QWORD block[4];
  id v21;
  VCPImageManager *v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  unsigned int *v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (v14)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    if (a8)
      *a8 = 1;
    transcodeQueue = self->_transcodeQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __115__VCPImageManager_pixelBufferWithFormat_andMaxDimension_fromData_withUniformTypeIdentifier_flushCache_orientation___block_invoke;
    block[3] = &unk_1E6B1ABA0;
    v21 = v15;
    v22 = self;
    v27 = a3;
    v23 = v14;
    v24 = &v29;
    v25 = a4;
    v26 = a8;
    v28 = a7;
    dispatch_sync(transcodeQueue, block);
    v18 = (__CVBuffer *)v30[3];

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __115__VCPImageManager_pixelBufferWithFormat_andMaxDimension_fromData_withUniformTypeIdentifier_flushCache_orientation___block_invoke(uint64_t a1)
{
  CGImageSourceRef v2;
  uint64_t v3;
  const void *v4;
  void *v5;
  _BOOL4 v6;
  MADImageASTCFormatReader *v7;
  MADImageASTCFormatReader *v8;
  CGImageSource *v9;
  uint64_t v10;
  const void *v11;
  uint8_t v12[16];

  if (+[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:](VCPImageManager, "canDecodeAcceleratedUniformTypeIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "acceleratedDecodeImageData:pixelFormat:maxDimension:pixelBuffer:orientation:flushCache:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24, *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 84)))return;
    if (+[VCPImageManager loggingEnabled](VCPImageManager, "loggingEnabled")
      && (int)MediaAnalysisLogLevel() >= 5
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[Decode] Accelerated decode failed; falling back to CGImage",
        v12,
        2u);
    }
  }
  v2 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 48), 0);
  if (objc_msgSend(*(id *)(a1 + 40), "decodeImageSource:withUniformTypeIdentifier:pixelFormat:maxDimension:orientation:pixelBuffer:", v2, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(const void **)(v3 + 24);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(v3 + 24) = 0;
    }
    if (v2)
      CFRelease(v2);
    objc_msgSend(*(id *)(a1 + 32), "preferredFilenameExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[MADImageASTCFormatReader isValidASTCExtension:](MADImageASTCFormatReader, "isValidASTCExtension:", v5);

    if (v6)
    {
      v7 = -[MADImageASTCFormatReader initWithData:]([MADImageASTCFormatReader alloc], "initWithData:", *(_QWORD *)(a1 + 48));
      v8 = v7;
      if (v7)
      {
        v9 = -[MADImageASTCFormatReader readNextImageSource](v7, "readNextImageSource");
        if (v9)
        {
          if (objc_msgSend(*(id *)(a1 + 40), "decodeImageSource:withUniformTypeIdentifier:pixelFormat:maxDimension:orientation:pixelBuffer:", v9, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          {
            v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v11 = *(const void **)(v10 + 24);
            if (v11)
            {
              CFRelease(v11);
              *(_QWORD *)(v10 + 24) = 0;
            }
          }
          CFRelease(v9);
        }
      }

    }
  }
  else if (v2)
  {
    CFRelease(v2);
  }
}

- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CVBuffer *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  -[VCPImageManager dataForResource:](self, "dataForResource:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vcp_uniformTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:](self, "pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:", v4, 0, v8, v9, 1, 0);

  objc_autoreleasePoolPop(v7);
  return v10;
}

- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  __CVBuffer *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (a5 >= 2)
  {
    v10 = (void *)MEMORY[0x1BCCA1B2C]();
    -[VCPImageManager dataForResource:](self, "dataForResource:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vcp_uniformTypeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:](self, "pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:", v6, a5, v11, v12, 1, 0);

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5 orientation:(unsigned int *)a6
{
  uint64_t v8;
  id v10;
  __CVBuffer *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  if (a5 >= 2)
  {
    v12 = (void *)MEMORY[0x1BCCA1B2C]();
    -[VCPImageManager dataForResource:](self, "dataForResource:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vcp_uniformTypeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:](self, "pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:", v8, a5, v13, v14, 1, a6);

    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 fromImageURL:(id)a4 flushCache:(BOOL)a5
{
  return -[VCPImageManager pixelBufferWithFormat:fromImageURL:flushCache:orientation:](self, "pixelBufferWithFormat:fromImageURL:flushCache:orientation:", *(_QWORD *)&a3, a4, a5, 0);
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5 flushCache:(BOOL)a6 orientation:(unsigned int *)a7
{
  _BOOL8 v8;
  uint64_t v10;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  __CVBuffer *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v8 = a6;
  v10 = *(_QWORD *)&a3;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = (void *)MEMORY[0x1BCCA1B2C]();
  if (v12)
  {
    v31 = 0;
    objc_msgSend(v12, "getResourceValue:forKey:error:", &v31, *MEMORY[0x1E0C998E0], 0);
    v14 = v31;
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v12, 1, &v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v30;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a4;
      v18 = v14;
      v19 = -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:](self, "pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:", v10, v17, v16, v14, v8, a7);

    }
    else if ((int)MediaAnalysisLogLevel() < 3)
    {
      v19 = 0;
      v18 = v14;
    }
    else
    {
      v18 = v14;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v12;
        v34 = 2112;
        v35 = v29;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load url %@ (%@)", buf, 0x16u);
      }
      v19 = 0;
    }

  }
  else
  {
    v20 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v20)
      -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromImageURL:flushCache:orientation:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    v19 = 0;
  }
  objc_autoreleasePoolPop(v13);

  return v19;
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 fromImageURL:(id)a4 flushCache:(BOOL)a5 orientation:(unsigned int *)a6
{
  return -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromImageURL:flushCache:orientation:](self, "pixelBufferWithFormat:andMaxDimension:fromImageURL:flushCache:orientation:", *(_QWORD *)&a3, 0, a4, a5, a6);
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5
{
  return -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromImageURL:orientation:](self, "pixelBufferWithFormat:andMaxDimension:fromImageURL:orientation:", *(_QWORD *)&a3, a4, a5, 0);
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5 orientation:(unsigned int *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  __CVBuffer *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v8 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = v10;
  if (a4 < 2)
  {
LABEL_2:
    v12 = 0;
    goto LABEL_13;
  }
  if (!v10)
  {
    v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v17)
      -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromImageURL:flushCache:orientation:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_2;
  }
  v13 = (void *)MEMORY[0x1BCCA1B2C]();
  v27 = 0;
  objc_msgSend(v11, "getResourceValue:forKey:error:", &v27, *MEMORY[0x1E0C998E0], 0);
  v14 = v27;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v11, 1, &v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v26;
  if (v15)
  {
    v12 = -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:](self, "pixelBufferWithFormat:andMaxDimension:fromData:withUniformTypeIdentifier:flushCache:orientation:", v8, a4, v15, v14, 1, a6);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v11;
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load url %@ (%@)", buf, 0x16u);
    }
    v12 = 0;
  }

  objc_autoreleasePoolPop(v13);
LABEL_13:

  return v12;
}

- (void)flushCache
{
  if (self->_decodeSession)
    CMPhotoDecompressionSessionDiscardCachedBuffers();
}

+ (BOOL)_exportReencodedJPEG
{
  return 0;
}

- (int)compressCVPixelBuffer:(__CVBuffer *)a3 toJPEGData:(id *)a4 targetBitStreamLength:(unint64_t)a5 padding:(BOOL)a6
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *transcodeQueue;
  id v21;
  id v22;
  int v23;
  NSObject *v24;
  const char *v25;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t *v30;
  unint64_t v31;
  __CVBuffer *v32;
  id *v33;
  BOOL v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -50;
    *(_WORD *)buf = 0;
    v24 = MEMORY[0x1E0C81028];
    v25 = "[ImageManagerEncode] inputCVPixelBuffer cannot be NULL";
    goto LABEL_14;
  }
  if (!a4)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -50;
    *(_WORD *)buf = 0;
    v24 = MEMORY[0x1E0C81028];
    v25 = "[ImageManagerEncode] outputJPEGData cannot be nil";
    goto LABEL_14;
  }
  if (!a5)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -50;
    *(_WORD *)buf = 0;
    v24 = MEMORY[0x1E0C81028];
    v25 = "[ImageManagerEncode] targetBitStreamLength cannot be 0";
LABEL_14:
    _os_log_impl(&dword_1B6C4A000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    return -50;
  }
  v11 = *MEMORY[0x1E0D09320];
  v43[0] = *MEMORY[0x1E0D09318];
  v43[1] = v11;
  v44[0] = &unk_1E6B74CF0;
  v44[1] = &unk_1E6B74CF0;
  v43[2] = *MEMORY[0x1E0D09308];
  v44[2] = &unk_1E6B74D08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D093A8];
  v41[0] = *MEMORY[0x1E0D09378];
  v41[1] = v13;
  v14 = MEMORY[0x1E0C9AAB0];
  v42[0] = &unk_1E6B74D20;
  v42[1] = MEMORY[0x1E0C9AAB0];
  v15 = *MEMORY[0x1E0D09418];
  v42[2] = &unk_1E6B74D38;
  v16 = *MEMORY[0x1E0D09410];
  v41[2] = v15;
  v41[3] = v16;
  v39 = *MEMORY[0x1E0D09600];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = *MEMORY[0x1E0D093F0];
  v42[3] = v18;
  v42[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  v36 = buf;
  v37 = 0x2020000000;
  v38 = 0;
  transcodeQueue = self->_transcodeQueue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__VCPImageManager_compressCVPixelBuffer_toJPEGData_targetBitStreamLength_padding___block_invoke;
  v27[3] = &unk_1E6B1ABC8;
  v27[4] = self;
  v28 = v12;
  v29 = v19;
  v30 = buf;
  v31 = a5;
  v32 = a3;
  v34 = a6;
  v33 = a4;
  v21 = v19;
  v22 = v12;
  dispatch_sync(transcodeQueue, v27);
  v23 = *((_DWORD *)v36 + 6);

  _Block_object_dispose(buf, 8);
  return v23;
}

void __82__VCPImageManager_compressCVPixelBuffer_toJPEGData_targetBitStreamLength_padding___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  const char *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v2 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    v29 = v2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ImageManagerEncode] Encoding CVPixelBuffer -> JPEG (%lu Bytes)", buf, 0xCu);
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CMPhotoCompressionSessionCreate();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v3 = MEMORY[0x1E0C81028];
        v4 = "[ImageManagerEncode] Failed to create compression session";
        goto LABEL_22;
      }
      return;
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CMPhotoCompressionSessionOpenEmptyContainer();
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CMPhotoCompressionSessionAddImage();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v3 = MEMORY[0x1E0C81028];
        v4 = "[ImageManagerEncode] Fail to image buffer";
        goto LABEL_22;
      }
      return;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CMPhotoCompressionSessionCloseContainerAndCopyBacking();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v3 = MEMORY[0x1E0C81028];
        v4 = "[ImageManagerEncode] Fail to get transcoded data";
        goto LABEL_22;
      }
      return;
    }
    if (!*(_BYTE *)(a1 + 88))
      goto LABEL_32;
    v5 = objc_msgSend(0, "length");
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 64);
    v8 = v7 - v5;
    if (v7 < v5)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -18;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v6;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageManagerEncode] Oversized data (%luBytes)", buf, 0xCu);
      }
LABEL_42:

      return;
    }
    if (v7 == v5)
    {
LABEL_32:
      **(_QWORD **)(a1 + 80) = objc_retainAutorelease(0);
    }
    else
    {
      v9 = MediaAnalysisLogLevel();
      if (v9 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v8;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ImageManagerEncode] Padding JPEG with %lu Bytes", buf, 0xCu);
      }
      v10 = (void *)objc_msgSend(0, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendData:", v11);

      v12 = objc_retainAutorelease(v10);
      **(_QWORD **)(a1 + 80) = v12;

    }
    if (objc_msgSend((id)objc_opt_class(), "_exportReencodedJPEG"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ImageManagerEncode] Exporting reencoded JPEGs", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      objc_msgSend(v16, "stringWithFormat:", CFSTR("MADImageManagerEncode_%.3f_unpadded.jpg"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathComponent:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileURLWithPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(0, "writeToURL:atomically:", v20, 1);
      v21 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      objc_msgSend(v23, "stringWithFormat:", CFSTR("MADImageManagerEncode_%.3f_padded.jpg"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingPathComponent:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fileURLWithPath:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(**(id **)(a1 + 80), "writeToURL:atomically:", v27, 1);
    }
    goto LABEL_42;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[ImageManagerEncode] Fail to open compression container";
LABEL_22:
    _os_log_impl(&dword_1B6C4A000, v3, OS_LOG_TYPE_ERROR, v4, buf, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcodeQueue, 0);
}

- (void)drawImage:(double)a1 pixelFormat:withOrientation:maxDimension:pixelBuffer:.cold.1(double a1)
{
  int v1;
  double v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[CGImage->CVPixelBuffer] Invalid downscaling factor %f", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)pixelBufferWithFormat:(uint64_t)a3 andMaxDimension:(uint64_t)a4 fromImageURL:(uint64_t)a5 flushCache:(uint64_t)a6 orientation:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "Failed to load pixel buffer due to invalid nil url", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
