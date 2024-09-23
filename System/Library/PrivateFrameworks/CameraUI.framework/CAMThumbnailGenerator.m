@implementation CAMThumbnailGenerator

- (CAMThumbnailGenerator)init
{
  CAMThumbnailGenerator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *generationQueue;
  CAMThumbnailGenerator *v6;
  CAMThumbnailGenerator *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMThumbnailGenerator;
  v2 = -[CAMThumbnailGenerator init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.thumbnail-generator", v3);
    generationQueue = v2->__generationQueue;
    v2->__generationQueue = (OS_dispatch_queue *)v4;

    v8 = v2;
    pl_dispatch_async();
    v6 = v8;

  }
  return v2;
}

void __29__CAMThumbnailGenerator_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)(*(_QWORD *)(a1 + 32) + 16)))
  {
    v2 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __29__CAMThumbnailGenerator_init__block_invoke_cold_1();

  }
  v3 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  for (i = 0; i != 8; ++i)
  {
    v7 = qword_1DB9A7A58[i];
    PLDegreesForImageOrientation();
    v8 = VTImageRotationSessionCreate();
    if (v8)
    {
      v9 = v8;
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v12 = v7;
        v13 = 2048;
        v14 = v9;
        _os_log_error_impl(&dword_1DB760000, v10, OS_LOG_TYPE_ERROR, "Failed to create image rotation session (%ld) for thumbnail generation (%ld)", buf, 0x16u);
      }

    }
  }
}

- (CGImage)newBGRAImageOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingSurface:(void *)a5
{
  NSObject *v9;
  CGImage *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[9];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  if (a5)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[CAMThumbnailGenerator _generationQueue](self, "_generationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke;
    block[3] = &unk_1EA32E440;
    block[6] = a5;
    block[7] = a3;
    block[8] = a4;
    block[4] = self;
    block[5] = &v20;
    dispatch_sync(v9, block);

    v10 = (CGImage *)v21[3];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator newBGRAImageOfFormat:inOrientation:usingSurface:].cold.1(a3, v11, v12, v13, v14, v15, v16, v17);

    return 0;
  }
  return v10;
}

- (OS_dispatch_queue)_generationQueue
{
  return self->__generationQueue;
}

- (OpaqueVTPixelTransferSession)_generationQueuePixelTransferSession
{
  return self->__generationQueuePixelTransferSession;
}

- (NSMapTable)_generationQueueRotationSessionsMapTable
{
  return self->__generationQueueRotationSessionsMapTable;
}

- (id)newJPEGDataOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingSurface:(void *)a5 withMetadata:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  void *v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a6;
  if (a5)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__23;
    v31 = __Block_byref_object_dispose__23;
    v32 = 0;
    -[CAMThumbnailGenerator _generationQueue](self, "_generationQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke;
    v21[3] = &unk_1EA32E3F0;
    v24 = a5;
    v25 = a3;
    v21[4] = self;
    v26 = a4;
    v22 = v10;
    v23 = &v27;
    dispatch_sync(v11, v21);

    v12 = (id)v28[5];
    _Block_object_dispose(&v27, 8);

  }
  else
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator newJPEGDataOfFormat:inOrientation:usingSurface:withMetadata:].cold.1(a3, v13, v14, v15, v16, v17, v18, v19);

    v12 = 0;
  }

  return v12;
}

- (id)_neededColorspacePropertiesFromMetadata:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject **v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int16 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CBCB50];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CBCB10];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CBC770];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC770]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find colorspace information during thumbnail generation! Generated thumbnails may not match original image", (uint8_t *)&v17, 2u);
    }
    v15 = 0;
    goto LABEL_11;
  }
  if (v9)
  {
    v23 = v7;
    v24[0] = v3;
    v22 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v24[1] = v8;
    v25[0] = v10;
    v25[1] = v9;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = (NSObject **)v25;
    v13 = v24;
    v14 = 2;
LABEL_10:
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  if ((objc_msgSend(v7, "isEqual:", &unk_1EA3B13C0) & 1) == 0)
  {
    v19 = v7;
    v20 = v3;
    v18 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v21 = v10;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v21;
    v13 = &v20;
    v14 = 1;
    goto LABEL_10;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)dealloc
{
  NSObject *generationQueue;
  objc_super v4;
  _QWORD block[5];

  generationQueue = self->__generationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CAMThumbnailGenerator_dealloc__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(generationQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)CAMThumbnailGenerator;
  -[CAMThumbnailGenerator dealloc](&v4, sel_dealloc);
}

void __32__CAMThumbnailGenerator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  OpaqueVTPixelTransferSession *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(OpaqueVTPixelTransferSession **)(v2 + 16);
  if (v3)
  {
    VTPixelTransferSessionInvalidate(v3);
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 16));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(v2 + 24);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        MEMORY[0x1DF0B5114](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), (_QWORD)v11));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = 0;

}

- (__CVBuffer)_newThumbnailOfSize:(CGSize)a3 inOrientation:(int64_t)a4 withPixelFormat:(unsigned int)a5 usingPixelBuffer:(__CVBuffer *)a6
{
  double height;
  double width;
  OpaqueVTPixelTransferSession *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  size_t v15;
  double v16;
  OSStatus IOSurfaceBackedCVPixelBuffer;
  __CVBuffer *v18;
  BOOL v19;
  OSStatus v21;
  NSObject *v22;
  __CVBuffer *v23;
  __CVBuffer *v24;
  OSStatus v25;
  OSStatus IOSurfaceBackedCVPixelBufferWithAttributes;
  __CVBuffer *v27;
  BOOL v28;
  OSStatus v30;
  void *v32;
  _BYTE destinationBuffer[12];
  __int16 v34;
  void *v35;
  __int16 v36;
  int64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;
  CGSize v41;

  height = a3.height;
  width = a3.width;
  v40 = *MEMORY[0x1E0C80C00];
  if (!a6)
  {
    v22 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator _newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:].cold.1(v22, width, height);
    v23 = 0;
    goto LABEL_36;
  }
  v11 = -[CAMThumbnailGenerator _generationQueuePixelTransferSession](self, "_generationQueuePixelTransferSession");
  -[CAMThumbnailGenerator _generationQueueRotationSessionsMapTable](self, "_generationQueueRotationSessionsMapTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "objectForKey:", v13);

  CVPixelBufferGetPixelFormatType(a6);
  v15 = CVPixelBufferGetWidth(a6);
  v16 = floor((width + 2.0 + -1.0) * 0.5);
  if ((double)v15 / (v16 + v16) > 4.0)
  {
    *(_QWORD *)destinationBuffer = 0;
    IOSurfaceBackedCVPixelBuffer = FigCreateIOSurfaceBackedCVPixelBuffer();
    v18 = 0;
    if (IOSurfaceBackedCVPixelBuffer)
      v19 = 1;
    else
      v19 = *(_QWORD *)destinationBuffer == 0;
    if (v19 || v11 == 0)
    {
      v21 = IOSurfaceBackedCVPixelBuffer;
    }
    else
    {
      v25 = VTPixelTransferSessionTransferImage(v11, a6, 0);
      v21 = v25;
      v18 = *(__CVBuffer **)destinationBuffer;
      if (!v25)
      {
        v24 = CVPixelBufferRetain(*(CVPixelBufferRef *)destinationBuffer);
        v18 = *(__CVBuffer **)destinationBuffer;
        goto LABEL_18;
      }
    }
    v24 = 0;
LABEL_18:
    CVPixelBufferRelease(v18);
    goto LABEL_19;
  }
  v24 = CVPixelBufferRetain(a6);
  v21 = 0;
LABEL_19:
  v23 = 0;
  if (!v21 && v24)
  {
    *(_QWORD *)destinationBuffer = 0;
    PLDegreesForImageOrientation();
    IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
    v27 = 0;
    if (IOSurfaceBackedCVPixelBufferWithAttributes)
      v28 = 1;
    else
      v28 = *(_QWORD *)destinationBuffer == 0;
    if (v28 || v14 == 0)
    {
      v21 = IOSurfaceBackedCVPixelBufferWithAttributes;
    }
    else
    {
      v30 = MEMORY[0x1DF0B5120](v14, v24);
      v21 = v30;
      v27 = *(__CVBuffer **)destinationBuffer;
      if (!v30)
      {
        v23 = CVPixelBufferRetain(*(CVPixelBufferRef *)destinationBuffer);
        v27 = *(__CVBuffer **)destinationBuffer;
        goto LABEL_32;
      }
    }
    v23 = 0;
LABEL_32:
    CVPixelBufferRelease(v27);
  }
  CVPixelBufferRelease(v24);
  if (v21)
  {
    v22 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v41.width = width;
      v41.height = height;
      NSStringFromCGSize(v41);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)destinationBuffer = 136315906;
      *(_QWORD *)&destinationBuffer[4] = "-[CAMThumbnailGenerator _newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:]";
      v34 = 2114;
      v35 = v32;
      v36 = 2048;
      v37 = a4;
      v38 = 2048;
      v39 = v21;
      _os_log_error_impl(&dword_1DB760000, v22, OS_LOG_TYPE_ERROR, "<%s> Failed to generate a thumbnail of size %{public}@ in orientation %ld using a pixel buffer (%ld)", destinationBuffer, 0x2Au);

    }
LABEL_36:

  }
  return v23;
}

- (__CVBuffer)_newThumbnailOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 withPixelFormat:(unsigned int)a5 usingPixelBuffer:(__CVBuffer *)a6
{
  uint64_t v7;
  size_t Width;

  v7 = *(_QWORD *)&a5;
  Width = CVPixelBufferGetWidth(a6);
  objc_msgSend(MEMORY[0x1E0D73130], "scaledSizeForSize:format:capLength:", a3, 1, (double)Width, (double)CVPixelBufferGetHeight(a6));
  return -[CAMThumbnailGenerator _newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:](self, "_newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:", a4, v7, a6);
}

- (__CVBuffer)_newRotatedPixelBuffer:(__CVBuffer *)a3 withOrientation:(int64_t)a4
{
  int v7;
  int IsMirrored;
  NSObject *v9;
  int IOSurfaceBackedCVPixelBufferWithAttributes;
  void *v12;
  void *v13;
  NSObject *v14;
  __CVBuffer *texture;

  if (a3)
  {
    texture = 0;
    v7 = PLDegreesForImageOrientation();
    IsMirrored = PLImageOrientationIsMirrored();
    if (!v7 && !IsMirrored)
      return CVPixelBufferRetain(a3);
    CVPixelBufferGetWidth(a3);
    CVPixelBufferGetHeight(a3);
    CVPixelBufferGetPixelFormatType(a3);
    IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
    -[CAMThumbnailGenerator _generationQueueRotationSessionsMapTable](self, "_generationQueueRotationSessionsMapTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);

    CVPixelBufferRelease(0);
    if (IOSurfaceBackedCVPixelBufferWithAttributes)
    {
      texture = 0;
      v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CAMThumbnailGenerator _newRotatedPixelBuffer:withOrientation:].cold.2(IOSurfaceBackedCVPixelBufferWithAttributes, a4, v14);

    }
    return texture;
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator _newRotatedPixelBuffer:withOrientation:].cold.1();

    return 0;
  }
}

void __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke(uint64_t a1)
{
  __IOSurface *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t PixelFormat;
  __CVBuffer *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t EXIFJPEGData;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = *(__IOSurface **)(a1 + 56);
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0, &pixelBufferOut);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  PixelFormat = IOSurfaceGetPixelFormat(v2);
  v7 = (__CVBuffer *)objc_msgSend(v3, "_newThumbnailOfFormat:inOrientation:withPixelFormat:usingPixelBuffer:", v4, v5, PixelFormat, pixelBufferOut);
  CVPixelBufferGetIOSurface(v7);
  v8 = *MEMORY[0x1E0D09418];
  v26[0] = &unk_1EA3B13A8;
  v9 = *MEMORY[0x1E0D09410];
  v25[0] = v8;
  v25[1] = v9;
  v23 = *MEMORY[0x1E0D09618];
  v24 = &unk_1EA3B3B70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = PFFigJPEGDataFromImage();
  v13 = 0;
  v14 = v13;
  if (v12)
  {
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_2();
  }
  else
  {
    if (!v13)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 32), "_neededColorspacePropertiesFromMetadata:", *(_QWORD *)(a1 + 40));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      EXIFJPEGData = CGImageCreateEXIFJPEGData();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = EXIFJPEGData;
    }
    else
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v20 = v14;
      v18 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v20;
    }

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v21 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_1();

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
    }
  }

LABEL_5:
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v7);

}

- (id)newJPEGDataInOrientation:(int64_t)a3 usingSurface:(void *)a4 withMetadata:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a5;
  if (a4)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__23;
    v22 = __Block_byref_object_dispose__23;
    v23 = 0;
    -[CAMThumbnailGenerator _generationQueue](self, "_generationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke;
    block[3] = &unk_1EA32E418;
    v16 = a4;
    v17 = a3;
    block[4] = self;
    v14 = v8;
    v15 = &v18;
    dispatch_sync(v9, block);

    v10 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator newJPEGDataInOrientation:usingSurface:withMetadata:].cold.1();

    v10 = 0;
  }

  return v10;
}

void __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke(uint64_t a1)
{
  __IOSurface *v2;
  __CVBuffer *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t EXIFJPEGData;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v2 = *(__IOSurface **)(a1 + 56);
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0, &pixelBufferOut);
  v3 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newRotatedPixelBuffer:withOrientation:", pixelBufferOut, *(_QWORD *)(a1 + 64));
  CVPixelBufferGetIOSurface(v3);
  v4 = *MEMORY[0x1E0D09418];
  v22[0] = &unk_1EA3B13A8;
  v5 = *MEMORY[0x1E0D09410];
  v21[0] = v4;
  v21[1] = v5;
  v19 = *MEMORY[0x1E0D09618];
  v20 = &unk_1EA3B3B70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = PFFigJPEGDataFromImage();
  v9 = 0;
  v10 = v9;
  if (v8)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke_cold_2();
  }
  else
  {
    if (!v9)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 32), "_neededColorspacePropertiesFromMetadata:", *(_QWORD *)(a1 + 40));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      EXIFJPEGData = CGImageCreateEXIFJPEGData();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = EXIFJPEGData;
    }
    else
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = v10;
      v14 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v16;
    }

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_1();

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
    }
  }

LABEL_5:
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v3);

}

void __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke(uint64_t a1)
{
  __IOSurface *v2;
  __CVBuffer *v3;
  NSObject *v4;
  CVPixelBufferRef pixelBufferOut;

  v2 = *(__IOSurface **)(a1 + 48);
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0, &pixelBufferOut);
  v3 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newThumbnailOfFormat:inOrientation:withPixelFormat:usingPixelBuffer:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1111970369, pixelBufferOut);
  if (CVPixelBufferGetIOSurface(v3))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = UICreateCGImageFromIOSurface();
  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1();

  }
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v3);
}

- (CGImage)newBGRAImageInOrientation:(int64_t)a3 usingSurface:(void *)a4
{
  NSObject *v7;
  CGImage *v8;
  NSObject *v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    -[CAMThumbnailGenerator _generationQueue](self, "_generationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__CAMThumbnailGenerator_newBGRAImageInOrientation_usingSurface___block_invoke;
    v11[3] = &unk_1EA32E468;
    v11[6] = a4;
    v11[7] = a3;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    v8 = (CGImage *)v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator newBGRAImageInOrientation:usingSurface:].cold.1();

    return 0;
  }
  return v8;
}

void __64__CAMThumbnailGenerator_newBGRAImageInOrientation_usingSurface___block_invoke(uint64_t a1)
{
  __IOSurface *v2;
  double Width;
  size_t Height;
  __CVBuffer *v5;
  NSObject *v6;
  CVPixelBufferRef pixelBufferOut;

  v2 = *(__IOSurface **)(a1 + 48);
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0, &pixelBufferOut);
  Width = (double)CVPixelBufferGetWidth(pixelBufferOut);
  Height = CVPixelBufferGetHeight(pixelBufferOut);
  v5 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:", *(_QWORD *)(a1 + 56), 1111970369, pixelBufferOut, Width, (double)Height);
  if (CVPixelBufferGetIOSurface(v5))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = UICreateCGImageFromIOSurface();
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1();

  }
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v5);
}

- (id)newJPEGDataInOrientation:(int64_t)a3 usingPixelBuffer:(__CVBuffer *)a4
{
  NSObject *v7;
  id v8;
  NSObject *v10;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (a4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__23;
    v16 = __Block_byref_object_dispose__23;
    v17 = 0;
    -[CAMThumbnailGenerator _generationQueue](self, "_generationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__CAMThumbnailGenerator_newJPEGDataInOrientation_usingPixelBuffer___block_invoke;
    v11[3] = &unk_1EA32E468;
    v11[6] = a4;
    v11[7] = a3;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    return v8;
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator newJPEGDataInOrientation:usingSurface:withMetadata:].cold.1();

    return 0;
  }
}

void __67__CAMThumbnailGenerator_newJPEGDataInOrientation_usingPixelBuffer___block_invoke(uint64_t a1)
{
  __CVBuffer *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newRotatedPixelBuffer:withOrientation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = *MEMORY[0x1E0D09418];
  v16[0] = &unk_1EA3B13A8;
  v4 = *MEMORY[0x1E0D09410];
  v15[0] = v3;
  v15[1] = v4;
  v13 = *MEMORY[0x1E0D09618];
  v14 = &unk_1EA3B3B70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = PFFigJPEGDataFromImage();
  v8 = 0;
  v9 = v8;
  if (v7)
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke_cold_2();
  }
  else if (v8)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = v8;
    v10 = *(NSObject **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_1();
  }

  CVPixelBufferRelease(v2);
}

- (CGImage)newBGRAImageInOrientation:(int64_t)a3 usingPixelBuffer:(__CVBuffer *)a4
{
  NSObject *v7;
  CGImage *v8;
  NSObject *v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    -[CAMThumbnailGenerator _generationQueue](self, "_generationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__CAMThumbnailGenerator_newBGRAImageInOrientation_usingPixelBuffer___block_invoke;
    v11[3] = &unk_1EA32E468;
    v11[6] = a4;
    v11[7] = a3;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    v8 = (CGImage *)v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator newBGRAImageInOrientation:usingPixelBuffer:].cold.1();

    return 0;
  }
  return v8;
}

void __68__CAMThumbnailGenerator_newBGRAImageInOrientation_usingPixelBuffer___block_invoke(uint64_t a1)
{
  double Width;
  __CVBuffer *v3;
  NSObject *v4;

  Width = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  v3 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newThumbnailOfSize:inOrientation:withPixelFormat:usingPixelBuffer:", *(_QWORD *)(a1 + 56), 1111970369, *(_QWORD *)(a1 + 48), Width, (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48)));
  if (CVPixelBufferGetIOSurface(v3))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = UICreateCGImageFromIOSurface();
  }
  else
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1();

  }
  CVPixelBufferRelease(v3);
}

- (CGImage)newBGRAImageOfFormat:(int64_t)a3 inOrientation:(int64_t)a4 usingPixelBuffer:(__CVBuffer *)a5
{
  NSObject *v9;
  CGImage *v10;
  NSObject *v11;
  _QWORD block[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (a5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    -[CAMThumbnailGenerator _generationQueue](self, "_generationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingPixelBuffer___block_invoke;
    block[3] = &unk_1EA32E440;
    block[6] = a3;
    block[7] = a4;
    block[8] = a5;
    block[4] = self;
    block[5] = &v14;
    dispatch_sync(v9, block);

    v10 = (CGImage *)v15[3];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAMThumbnailGenerator newBGRAImageInOrientation:usingPixelBuffer:].cold.1();

    return 0;
  }
  return v10;
}

void __77__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingPixelBuffer___block_invoke(uint64_t a1)
{
  __CVBuffer *v2;
  NSObject *v3;

  v2 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "_newThumbnailOfFormat:inOrientation:withPixelFormat:usingPixelBuffer:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1111970369, *(_QWORD *)(a1 + 64));
  if (CVPixelBufferGetIOSurface(v2))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = UICreateCGImageFromIOSurface();
  }
  else
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1();

  }
  CVPixelBufferRelease(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__generationQueueRotationSessionsMapTable, 0);
  objc_storeStrong((id *)&self->__generationQueue, 0);
}

void __29__CAMThumbnailGenerator_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to create pixel transfer session for thumbnail generation (%ld)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_newThumbnailOfSize:(double)a3 inOrientation:withPixelFormat:usingPixelBuffer:.cold.1(NSObject *a1, double a2, double a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1DB760000, a1, OS_LOG_TYPE_ERROR, "Attempting to generate a thumbnail of size %{public}@ with an invalid pixel buffer.", (uint8_t *)&v5, 0xCu);

}

- (void)_newRotatedPixelBuffer:withOrientation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Attempting to rotate an invalid pixel buffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_newRotatedPixelBuffer:(os_log_t)log withOrientation:.cold.2(int a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[CAMThumbnailGenerator _newRotatedPixelBuffer:withOrientation:]";
  v5 = 2048;
  v6 = a2;
  v7 = 2048;
  v8 = a1;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "<%s> Failed to generate a thumbnail in orientation %ld using a pixel buffer (%ld)", (uint8_t *)&v3, 0x20u);
}

- (void)newJPEGDataOfFormat:(uint64_t)a3 inOrientation:(uint64_t)a4 usingSurface:(uint64_t)a5 withMetadata:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Attempting to generate JPEG thumbnail data of format %ld with an invalid surface.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Failed to generate thumbnail with EXIF data! Generated thumbnails may not match original image!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __85__CAMThumbnailGenerator_newJPEGDataOfFormat_inOrientation_usingSurface_withMetadata___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to encode YUV preview surface to JPEG during local persistence (%ld)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)newJPEGDataInOrientation:usingSurface:withMetadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Attempting to generate JPEG thumbnail data with an invalid surface.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __76__CAMThumbnailGenerator_newJPEGDataInOrientation_usingSurface_withMetadata___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, v0, v1, "Failed to encode surface to JPEG during local persistence (%ld)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)newBGRAImageOfFormat:(uint64_t)a3 inOrientation:(uint64_t)a4 usingSurface:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Attempting to generate BGRA thumbnail data of format %ld with an invalid surface.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __73__CAMThumbnailGenerator_newBGRAImageOfFormat_inOrientation_usingSurface___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Failed to encode YUV preview surface to BGRA.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newBGRAImageInOrientation:usingSurface:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Attempting to generate BGRA thumbnail data with an invalid surface.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newBGRAImageInOrientation:usingPixelBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Attempting to generate BGRA thumbnail data with an invalid pixelBuffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
