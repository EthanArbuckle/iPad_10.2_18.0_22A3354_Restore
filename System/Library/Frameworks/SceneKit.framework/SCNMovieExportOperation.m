@implementation SCNMovieExportOperation

- (SCNMovieExportOperation)initWithRenderer:(id)a3 size:(CGSize)a4 attributes:(id)a5 outputURL:(id)a6
{
  double height;
  double width;
  SCNMovieExportOperation *v11;
  id v12;
  float v13;
  int v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  AVAssetWriter *v27;
  NSObject *v28;
  AVAssetWriter *assetWriter;
  _QWORD v31[3];
  uint64_t v32;
  objc_super v33;

  height = a4.height;
  width = a4.width;
  v33.receiver = self;
  v33.super_class = (Class)SCNMovieExportOperation;
  v11 = -[SCNMovieExportOperation init](&v33, sel_init);
  if (v11)
  {
    v12 = (id)objc_msgSend(a5, "mutableCopy");
    if (!v12)
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("kExportPointOfViewAttribute"));
    objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("rate")), "floatValue");
    v11->_rate = v13;
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("rate"));
    if (v11->_rate == 0.0)
      v11->_rate = 0.033333;
    v14 = objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("SCNExportMovieFrameRate")), "intValue");
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("SCNExportMovieFrameRate"));
    if (v14)
      v11->_rate = 1.0 / (float)v14;
    v11->_mirrored = objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("SCNExportMovieMirrored")), "BOOLValue");
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("SCNExportMovieMirrored"));
    objc_msgSend((id)objc_msgSend(v12, "valueForKey:", CFSTR("SCNExportMovieSupersamplingFactor")), "floatValue");
    v11->_supersampling = v15;
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("SCNExportMovieSupersamplingFactor"));
    if (v11->_supersampling == 0.0)
      v11->_supersampling = 1.0;
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("QTAddImageCodecType"));
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("QTMovieRateAttribute"));
    v16 = *MEMORY[0x1E0C8AE68];
    if (!objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C8AE68]))
      objc_msgSend(v12, "setValue:forKey:", *MEMORY[0x1E0C8AE58], v16);
    v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)width);
    objc_msgSend(v12, "setValue:forKey:", v17, *MEMORY[0x1E0C8AF60]);
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)height);
    objc_msgSend(v12, "setValue:forKey:", v18, *MEMORY[0x1E0C8AEF0]);
    v19 = objc_alloc(MEMORY[0x1E0C8B020]);
    v11->_assetWriterInput = (AVAssetWriterInput *)objc_msgSend(v19, "initWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v12);
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](v11->_assetWriterInput, "setExpectsMediaDataInRealTime:", 0);
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1111970369);
    objc_msgSend(v20, "setObject:forKey:", v21, *MEMORY[0x1E0CA9040]);
    v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)width);
    objc_msgSend(v20, "setObject:forKey:", v22, *MEMORY[0x1E0CA90E0]);
    v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)height);
    objc_msgSend(v20, "setObject:forKey:", v23, *MEMORY[0x1E0CA8FD8]);
    v24 = objc_msgSend(a3, "device");
    v25 = (_QWORD *)MEMORY[0x1E0CA8F78];
    if (v24)
      v25 = (_QWORD *)MEMORY[0x1E0CA9010];
    objc_msgSend(v20, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *v25);
    v11->_avAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B038]), "initWithAssetWriterInput:sourcePixelBufferAttributes:", v11->_assetWriterInput, v20);
    v32 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a6, 0);
    v26 = objc_alloc(MEMORY[0x1E0C8B018]);
    v27 = (AVAssetWriter *)objc_msgSend(v26, "initWithURL:fileType:error:", a6, *MEMORY[0x1E0C8A2E8], &v32);
    v11->_assetWriter = v27;
    if (-[AVAssetWriter status](v27, "status") == AVAssetWriterStatusFailed)
    {
      v28 = scn_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SCNMovieExportOperation initWithRenderer:size:attributes:outputURL:].cold.1((uint64_t)a6, &v32, v28);

      return 0;
    }
    else
    {
      -[AVAssetWriter addInput:](v11->_assetWriter, "addInput:", v11->_assetWriterInput);
      -[AVAssetWriter startWriting](v11->_assetWriter, "startWriting");
      assetWriter = v11->_assetWriter;
      v31[0] = 0;
      v31[1] = 0x100000001;
      v31[2] = 0;
      -[AVAssetWriter startSessionAtSourceTime:](assetWriter, "startSessionAtSourceTime:", v31);
      -[_SCNExportOperation setRenderer:](v11, "setRenderer:", a3);
      -[_SCNExportOperation setSize:](v11, "setSize:", width, height);
      -[_SCNExportOperation setAttributes:](v11, "setAttributes:", v12);
      objc_msgSend((id)objc_msgSend(a3, "scene"), "startTime");
      -[_SCNExportOperation setStartTime:](v11, "setStartTime:");
      objc_msgSend((id)objc_msgSend(a3, "scene"), "endTime");
      -[_SCNExportOperation setEndTime:](v11, "setEndTime:");
      -[_SCNExportOperation setOutputURL:](v11, "setOutputURL:", a6);
      -[_SCNExportOperation setPointOfView:](v11, "setPointOfView:", objc_msgSend(a5, "objectForKey:", CFSTR("kExportPointOfViewAttribute")));

    }
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMovieExportOperation;
  -[_SCNExportOperation dealloc](&v3, sel_dealloc);
}

- (CGImage)_copySnapshot:(CGSize)a3
{
  double height;
  double width;
  SCNRenderer *v6;
  double systemTime;
  CFTimeInterval v8;

  height = a3.height;
  width = a3.width;
  v6 = -[_SCNExportOperation renderer](self, "renderer");
  systemTime = self->super._systemTime;
  if (systemTime == 0.0)
    v8 = CACurrentMediaTime();
  else
    v8 = systemTime + self->_rate;
  self->super._systemTime = v8;
  return CGImageRetain(-[UIImage CGImage](-[SCNRenderer snapshotAtTime:withSize:antialiasingMode:](v6, "snapshotAtTime:withSize:antialiasingMode:", -[_SCNExportOperation antialiasingMode](self, "antialiasingMode"), v8, width, height), "CGImage"));
}

- (void)_finishedExport
{
  id v3;

  if (!-[_SCNExportOperation error](self, "error"))
    -[_SCNExportOperation setSucceded:](self, "setSucceded:", 1);
  v3 = -[_SCNExportOperation delegate](self, "delegate");
  -[_SCNExportOperation didEndSelector](self, "didEndSelector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, -[_SCNExportOperation didEndSelector](self, "didEndSelector"), self, -[_SCNExportOperation userInfo](self, "userInfo"));
}

- (void)appendImage:(CGImage *)a3 withPresentationTime:(id *)a4 usingAdaptor:(id)a5
{
  uint64_t v10;
  __CVPixelBufferPool *v11;
  unint64_t Width;
  unint64_t Height;
  CGColorSpace *ColorSpace;
  void *BaseAddress;
  size_t BytesPerRow;
  CGContext *v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v20;
  int64_t var3;
  CVPixelBufferRef pixelBufferOut;
  CGRect v23;
  CGRect v24;

  pixelBufferOut = 0;
  v10 = objc_msgSend(a5, "pixelBufferPool");
  if (v10)
  {
    v11 = (__CVPixelBufferPool *)v10;
    Width = CGImageGetWidth(a3);
    Height = CGImageGetHeight(a3);
    if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, &pixelBufferOut))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCNExport.m"), 391, CFSTR("SceneKit: Couldn't create pixel buffer"));
    ColorSpace = CGImageGetColorSpace(a3);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    v17 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, ColorSpace, 0x2006u);
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = (double)Width;
    v23.size.height = (double)Height;
    CGContextClearRect(v17, v23);
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = (double)Width;
    v24.size.height = (double)Height;
    CGContextDrawImage(v17, v24, a3);
    CGContextFlush(v17);
    CFRelease(v17);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    v20 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    if ((objc_msgSend(a5, "appendPixelBuffer:withPresentationTime:", pixelBufferOut, &v20) & 1) == 0)
    {
      v18 = scn_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SCNMovieExportOperation appendImage:withPresentationTime:usingAdaptor:].cold.2();
    }
    CFRelease(pixelBufferOut);
  }
  else
  {
    v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SCNMovieExportOperation appendImage:withPresentationTime:usingAdaptor:].cold.1();
  }
}

- (void)renderAndAppendWithPresentationTime:(id *)a3 usingAdaptor:(id)a4 metalTextureCache:(__CVMetalTextureCache *)a5 cvQueue:(id)a6 completionBlock:(id)a7
{
  __CVPixelBufferPool *v14;
  const __CFAllocator *v15;
  MTLPixelFormat v16;
  unint64_t WidthOfPlane;
  unint64_t HeightOfPlane;
  double systemTime;
  CFTimeInterval v20;
  NSObject *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[11];
  __int128 v34;
  int64_t var3;
  double v36;
  double v37;
  double v38;
  double v39;
  CVMetalTextureRef textureOut;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  v14 = (__CVPixelBufferPool *)objc_msgSend(a4, "pixelBufferPool");
  if (v14)
  {
    v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, &pixelBufferOut))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SCNExport.m"), 431, CFSTR("SceneKit: Couldn't create pixel buffer"));
    textureOut = 0;
    if (C3DLinearRenderingIsEnabled())
      v16 = MTLPixelFormatBGRA8Unorm_sRGB;
    else
      v16 = MTLPixelFormatBGRA8Unorm;
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBufferOut, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, 0);
    CVMetalTextureCacheCreateTextureFromImage(v15, a5, pixelBufferOut, 0, v16, WidthOfPlane, HeightOfPlane, 0, &textureOut);
    systemTime = self->super._systemTime;
    v32 = a7;
    if (systemTime == 0.0)
      v20 = CACurrentMediaTime();
    else
      v20 = systemTime + self->_rate;
    self->super._systemTime = v20;
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 2);
    v23 = -[SCNMaterialProperty contents](-[SCNScene background](-[SCNRenderer scene](-[_SCNExportOperation renderer](self, "renderer"), "scene"), "background"), "contents");
    objc_opt_class();
    v24 = 1.0;
    v25 = 1.0;
    v26 = 1.0;
    v27 = 1.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = 0.0;
      v37 = 0.0;
      v38 = 0.0;
      v36 = 0.0;
      objc_msgSend(v23, "getRed:green:blue:alpha:", &v39, &v38, &v37, &v36);
      v24 = v39;
      v26 = v37;
      v25 = v38;
      v27 = v36;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", v24, v25, v26, v27);
    v28 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v16, WidthOfPlane, HeightOfPlane, 0);
    if (SCNMTLDeviceSupportsMemorylessStorage(-[SCNRenderer device](-[_SCNExportOperation renderer](self, "renderer"), "device")))
      v29 = 3;
    else
      v29 = 2;
    objc_msgSend(v28, "setStorageMode:", v29);
    objc_msgSend(v28, "setUsage:", 5);
    if (-[_SCNExportOperation antialiasingMode](self, "antialiasingMode"))
    {
      objc_msgSend(v28, "setSampleCount:", 1 << -[_SCNExportOperation antialiasingMode](self, "antialiasingMode"));
      objc_msgSend(v28, "setTextureType:", 4);
      v30 = (void *)-[MTLDevice newTextureWithDescriptor:](-[SCNRenderer device](-[_SCNExportOperation renderer](self, "renderer"), "device"), "newTextureWithDescriptor:", v28);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", v30);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setResolveTexture:", CVMetalTextureGetTexture(textureOut));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setStoreAction:", 2);

    }
    else
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", CVMetalTextureGetTexture(textureOut));
    }
    v31 = (void *)-[MTLCommandQueue commandBuffer](-[SCNRenderer commandQueue](-[_SCNExportOperation renderer](self, "renderer"), "commandQueue"), "commandBuffer");
    -[SCNRenderer renderAtTime:viewport:commandBuffer:passDescriptor:](-[_SCNExportOperation renderer](self, "renderer"), "renderAtTime:viewport:commandBuffer:passDescriptor:", v31, v22, self->super._systemTime, 0.0, 0.0, (double)WidthOfPlane, (double)HeightOfPlane);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __118__SCNMovieExportOperation_renderAndAppendWithPresentationTime_usingAdaptor_metalTextureCache_cvQueue_completionBlock___block_invoke;
    v33[3] = &unk_1EA5A3E98;
    v33[4] = a6;
    v33[5] = self;
    v34 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v33[8] = pixelBufferOut;
    v33[9] = textureOut;
    v33[10] = a5;
    v33[6] = a4;
    v33[7] = v32;
    objc_msgSend(v31, "addCompletedHandler:", v33);
    objc_msgSend(v31, "commit");
  }
  else
  {
    v21 = scn_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SCNMovieExportOperation appendImage:withPresentationTime:usingAdaptor:].cold.1();
  }
}

__n128 __118__SCNMovieExportOperation_renderAndAppendWithPresentationTime_usingAdaptor_metalTextureCache_cvQueue_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__SCNMovieExportOperation_renderAndAppendWithPresentationTime_usingAdaptor_metalTextureCache_cvQueue_completionBlock___block_invoke_2;
  block[3] = &unk_1EA5A3E70;
  v2 = *(_OWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 104);
  v4 = *(_OWORD *)(a1 + 72);
  v11 = v3;
  v10 = v4;
  v5 = *(_OWORD *)(a1 + 56);
  v8 = v2;
  v9 = v5;
  dispatch_async(v1, block);
  return result;
}

uint64_t __118__SCNMovieExportOperation_renderAndAppendWithPresentationTime_usingAdaptor_metalTextureCache_cvQueue_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  __int128 v6;
  uint64_t v7;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "isReadyForMoreMediaData") & 1) == 0)
  {
    do
      usleep(0x3E8u);
    while (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "isReadyForMoreMediaData"));
  }
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 96);
  if ((objc_msgSend(v2, "appendPixelBuffer:withPresentationTime:", v3, &v6) & 1) == 0)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCNMovieExportOperation appendImage:withPresentationTime:usingAdaptor:].cold.2();
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 64));
  CVMetalTextureCacheFlush(*(CVMetalTextureCacheRef *)(a1 + 72), 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)main
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: error while exporting movie: %@", buf, 0xCu);
}

void __31__SCNMovieExportOperation_main__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  CGImage *v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  _QWORD v18[6];
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  _QWORD v23[5];

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    objc_msgSend(*(id *)(a1 + 40), "setCanceled:", 1);
  if ((objc_msgSend(*(id *)(a1 + 40), "canceled") & 1) != 0
    || *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + *(double *)(a1 + 88) * -0.5 > *(double *)(a1 + 96))
  {
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __31__SCNMovieExportOperation_main__block_invoke_3;
      v18[3] = &unk_1EA59F420;
      v2 = *(NSObject **)(a1 + 48);
      v3 = *(_QWORD *)(a1 + 56);
      v18[4] = *(_QWORD *)(a1 + 40);
      v18[5] = v3;
      dispatch_async(v2, v18);
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1DF0D4CF4]();
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "renderer"), "setSceneTime:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    if (*(_BYTE *)(a1 + 120))
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v5 = *(_QWORD *)(a1 + 72);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = (int)(float)(1000.0 / *(float *)(v6 + 408));
      v9 = *(_QWORD *)(v6 + 392);
      v10 = 1000 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v22 = 0;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[2] = __31__SCNMovieExportOperation_main__block_invoke_2;
      v23[3] = &unk_1EA59DF80;
      v11 = *(_QWORD *)(a1 + 104);
      v23[1] = 3221225472;
      v23[4] = v5;
      v19 = v10;
      v20 = v8;
      v21 = 1;
      objc_msgSend((id)v6, "renderAndAppendWithPresentationTime:usingAdaptor:metalTextureCache:cvQueue:completionBlock:", &v19, v9, v11, v7, v23);
    }
    else
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v12, "size");
      v13 = objc_msgSend(v12, "_copySnapshot:");
      if (v13)
      {
        v14 = (CGImage *)v13;
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 384), "isReadyForMoreMediaData") & 1) == 0)
        {
          do
            usleep(0x3E8u);
          while (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 384), "isReadyForMoreMediaData"));
        }
        v15 = *(_QWORD *)(a1 + 40);
        v16 = 1000.0 / *(float *)(v15 + 408);
        v17 = *(_QWORD *)(v15 + 392);
        v19 = 1000 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v20 = (int)v16;
        v21 = 1;
        v22 = 0;
        objc_msgSend((id)v15, "appendImage:withPresentationTime:usingAdaptor:", v14, &v19, v17);
        CGImageRelease(v14);
      }
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 88)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "setProgress:", (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) - *(double *)(a1 + 112))/ (*(double *)(a1 + 96) - *(double *)(a1 + 112)));
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    objc_autoreleasePoolPop(v4);
  }
}

uint64_t __31__SCNMovieExportOperation_main__block_invoke_2(uint64_t result)
{
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

intptr_t __31__SCNMovieExportOperation_main__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "markAsFinished");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __31__SCNMovieExportOperation_main__block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)initWithRenderer:(os_log_t)log size:attributes:outputURL:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: AVAssetWriter can't create a movie at %@ (error:%@)", (uint8_t *)&v4, 0x16u);
}

- (void)appendImage:withPresentationTime:usingAdaptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: appendImage: failed to get a pixelBuffer from CVPixelBufferPoolRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)appendImage:withPresentationTime:usingAdaptor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: append pixel buffer failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
