@implementation LiteSynthesis

- (LiteSynthesis)initWithMode:(int64_t)a3
{
  LiteSynthesis *v4;
  LiteSynthesis *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *completionSemaphore;
  LiteSynthesis *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LiteSynthesis;
  v4 = -[LiteSynthesis init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_usage = a3;
    if (!-[LiteSynthesis createModules](v4, "createModules"))
    {
      NSLog(CFSTR("Failed to create sub-modules\n"));
      v8 = 0;
      goto LABEL_6;
    }
    v6 = dispatch_semaphore_create(0);
    completionSemaphore = v5->_completionSemaphore;
    v5->_completionSemaphore = (OS_dispatch_semaphore *)v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (BOOL)createModules
{
  MTLDeviceSPI *v3;
  MTLDeviceSPI *device;
  MTLCommandQueue *v5;
  MTLCommandQueue *commandQueue;
  Backwarp *v7;
  Backwarp *backwarp;
  Forwarp *v9;
  Forwarp *forwarp;
  GPUSynthesis *v11;
  GPUSynthesis *synthesis;

  v3 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  v5 = (MTLCommandQueue *)-[MTLDeviceSPI newCommandQueue](self->_device, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v5;

  v7 = -[Backwarp initWithDevice:interleaved:]([Backwarp alloc], "initWithDevice:interleaved:", self->_device, 0);
  backwarp = self->_backwarp;
  self->_backwarp = v7;

  if (self->_backwarp)
  {
    v9 = -[Forwarp initWithDevice:commmandQueue:mode:]([Forwarp alloc], "initWithDevice:commmandQueue:mode:", self->_device, self->_commandQueue, 10);
    forwarp = self->_forwarp;
    self->_forwarp = v9;

    if (self->_forwarp)
    {
      v11 = -[GPUSynthesis initWithDevice:commmandQueue:]([GPUSynthesis alloc], "initWithDevice:commmandQueue:", self->_device, self->_commandQueue);
      synthesis = self->_synthesis;
      self->_synthesis = v11;

      if (self->_synthesis)
        return 1;
    }
    NSLog(CFSTR("Failed to create Forward Warp\n"));
  }
  else
  {
    NSLog(CFSTR("Failed to create Backwarp\n"));
  }
  return 0;
}

- (BOOL)switchUsageTo:(int64_t)a3
{
  self->_usage = a3;
  return 1;
}

- (void)allocateResources
{
  MTLBuffer *v3;
  MTLBuffer *v4;
  MTLBuffer *v5;
  MTLBuffer *v6;
  MTLBuffer *v7;
  MTLBuffer *v8;
  MTLBuffer *v9;
  MTLBuffer *v10;
  MTLTexture *v11;
  MTLTexture *flowTexture0;
  MTLTexture *v13;
  MTLTexture *flowTexture1;
  __CVBuffer *PixelBuffer;
  MTLTexture *v16;
  MTLTexture *alphaTexture;
  MTLTexture *v18;
  MTLTexture *mapTexture;
  MTLTexture *v20;
  MTLTexture *combinedWarpedTexture;
  MTLTexture *v22;
  MTLTexture *L1Texture0;
  MTLTexture *v24;
  MTLTexture *L1Texture1;
  MTLTexture *v26;
  MTLTexture *v27;
  MTLTexture *v28;
  MTLTexture *v29;
  MTLTexture *v30;
  MTLTexture *v31;
  MTLTexture *v32;
  MTLTexture *v33;
  MTLTexture *v34;
  MTLTexture *v35;
  MTLTexture *v36;
  MTLTexture *v37;
  MTLTexture *v38;
  MTLTexture *v39;
  MTLTexture *v40;
  MTLTexture *v41;
  MTLTexture *v42;
  MTLTexture *v43;
  MTLTexture *v44;
  MTLTexture *v45;
  MTLTexture *v46;
  MTLTexture *v47;
  MTLTexture *v48;
  MTLTexture *v49;
  uint64_t v50;
  uint64_t v51;

  v50 = 0;
  v51 = 0;
  FRCGetAlignedInputFrameSizeForUsage(self->_usage, &v51, &v50);
  -[Forwarp createBestBufferWidth:height:](self->_forwarp, "createBestBufferWidth:height:", v51, v50);
  v3 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  v4 = self->_bestErrorBuffer[0];
  self->_bestErrorBuffer[0] = v3;

  -[Forwarp createBestBufferWidth:height:](self->_forwarp, "createBestBufferWidth:height:", v51, v50);
  v5 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  v6 = self->_bestErrorBuffer[1];
  self->_bestErrorBuffer[1] = v5;

  -[Forwarp createOutputBufferWidth:height:channels:](self->_forwarp, "createOutputBufferWidth:height:channels:", v51, v50, 3);
  v7 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  v8 = self->_warpOutputBuffer[0];
  self->_warpOutputBuffer[0] = v7;

  -[Forwarp createOutputBufferWidth:height:channels:](self->_forwarp, "createOutputBufferWidth:height:channels:", v51, v50, 3);
  v9 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  v10 = self->_warpOutputBuffer[1];
  self->_warpOutputBuffer[1] = v9;

  if (self->_textureFromCVPixelBuffer)
  {
    self->_flowPixelBuffer0 = createPixelBuffer(v51, 2 * v50, 0x4C303068u, 0);
    self->_flowPixelBuffer1 = createPixelBuffer(v51, 2 * v50, 0x4C303068u, 0);
    createTexturesFromCVPixelBuffer(self->_flowPixelBuffer0, self->_device, 1, 2uLL);
    v11 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    flowTexture0 = self->_flowTexture0;
    self->_flowTexture0 = v11;

    createTexturesFromCVPixelBuffer(self->_flowPixelBuffer1, self->_device, 1, 2uLL);
    v13 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    flowTexture1 = self->_flowTexture1;
    self->_flowTexture1 = v13;

    PixelBuffer = createPixelBuffer(v51, v50, 0x4C303068u, 0);
    self->_alphaMap = PixelBuffer;
    createTexturesFromCVPixelBuffer(PixelBuffer, self->_device, 1, 1uLL);
    v16 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    alphaTexture = self->_alphaTexture;
    self->_alphaTexture = v16;

    self->_selectMap = createPixelBuffer(v51, 3 * v50, 0x4C303068u, 0);
    self->_intermediaCVBuffer = createPixelBuffer(v51, 3 * v50, 0x4C303068u, 0);
    createTexturesFromCVPixelBuffer(self->_selectMap, self->_device, 1, 3uLL);
    v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    mapTexture = self->_mapTexture;
    self->_mapTexture = v18;

    createTexturesFromCVPixelBuffer(self->_intermediaCVBuffer, self->_device, 1, 3uLL);
    v20 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    combinedWarpedTexture = self->_combinedWarpedTexture;
    self->_combinedWarpedTexture = v20;

    self->_L1Loss0 = createPixelBuffer(v51, v50, 0x4C303068u, 0);
    self->_L1Loss1 = createPixelBuffer(v51, v50, 0x4C303068u, 0);
    createTexturesFromCVPixelBuffer(self->_L1Loss0, self->_device, 1, 1uLL);
    v22 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    L1Texture0 = self->_L1Texture0;
    self->_L1Texture0 = v22;

    createTexturesFromCVPixelBuffer(self->_L1Loss1, self->_device, 1, 1uLL);
    v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    L1Texture1 = self->_L1Texture1;
    self->_L1Texture1 = v24;

    self->_warpedForwardFeatures[0] = createPixelBuffer(v51, 3 * v50, 0x4C303068u, 0);
    self->_warpedForwardFeatures[1] = createPixelBuffer(v51, 3 * v50, 0x4C303068u, 0);
    createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[0], self->_device, 1, 3uLL);
    v26 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v27 = self->_warpedForwardTextures[0];
    self->_warpedForwardTextures[0] = v26;

    createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[1], self->_device, 1, 3uLL);
  }
  else
  {
    createTextures(self->_device, v51, v50, 1, 1uLL);
    v29 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v30 = self->_alphaTexture;
    self->_alphaTexture = v29;

    createTextures(self->_device, v51, v50, 1, 2uLL);
    v31 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v32 = self->_flowTexture0;
    self->_flowTexture0 = v31;

    createTextures(self->_device, v51, v50, 1, 2uLL);
    v33 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v34 = self->_flowTexture1;
    self->_flowTexture1 = v33;

    createTextures(self->_device, v51, v50, 1, 3uLL);
    v35 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v36 = self->_mapTexture;
    self->_mapTexture = v35;

    createTextures(self->_device, v51, v50, 1, 3uLL);
    v37 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v38 = self->_combinedWarpedTexture;
    self->_combinedWarpedTexture = v37;

    createTextures(self->_device, v51, v50, 1, 1uLL);
    v39 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v40 = self->_L1Texture0;
    self->_L1Texture0 = v39;

    createTextures(self->_device, v51, v50, 1, 1uLL);
    v41 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v42 = self->_L1Texture1;
    self->_L1Texture1 = v41;

    createTextures(self->_device, v51, v50, 1, 3uLL);
    v43 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v44 = self->_warpedForwardTextures[0];
    self->_warpedForwardTextures[0] = v43;

    createTextures(self->_device, v51, v50, 1, 3uLL);
  }
  v28 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v45 = self->_warpedForwardTextures[1];
  self->_warpedForwardTextures[1] = v28;

  createTextures(self->_device, v51, v50, 4, 1uLL);
  v46 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v47 = self->_normalizedFwarpTextures[0];
  self->_normalizedFwarpTextures[0] = v46;

  createTextures(self->_device, v51, v50, 4, 1uLL);
  v48 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v49 = self->_normalizedFwarpTextures[1];
  self->_normalizedFwarpTextures[1] = v48;

}

- (void)releaseResources
{
  MTLTexture *flowTexture0;
  MTLTexture *flowTexture1;
  MTLTexture *L1Texture0;
  MTLTexture *L1Texture1;
  MTLTexture *mapTexture;
  MTLTexture *combinedWarpedTexture;
  MTLBuffer *v9;
  MTLBuffer *v10;
  MTLBuffer *v11;
  MTLBuffer *v12;
  MTLTexture *v13;
  MTLTexture *v14;
  MTLTexture *alphaTexture;
  MTLTexture *v16;
  MTLTexture *v17;

  flowTexture0 = self->_flowTexture0;
  self->_flowTexture0 = 0;

  flowTexture1 = self->_flowTexture1;
  self->_flowTexture1 = 0;

  L1Texture0 = self->_L1Texture0;
  self->_L1Texture0 = 0;

  L1Texture1 = self->_L1Texture1;
  self->_L1Texture1 = 0;

  mapTexture = self->_mapTexture;
  self->_mapTexture = 0;

  combinedWarpedTexture = self->_combinedWarpedTexture;
  self->_combinedWarpedTexture = 0;

  v9 = self->_bestErrorBuffer[0];
  self->_bestErrorBuffer[0] = 0;

  v10 = self->_bestErrorBuffer[1];
  self->_bestErrorBuffer[1] = 0;

  v11 = self->_warpOutputBuffer[0];
  self->_warpOutputBuffer[0] = 0;

  v12 = self->_warpOutputBuffer[1];
  self->_warpOutputBuffer[1] = 0;

  v13 = self->_warpedForwardTextures[0];
  self->_warpedForwardTextures[0] = 0;

  v14 = self->_warpedForwardTextures[1];
  self->_warpedForwardTextures[1] = 0;

  alphaTexture = self->_alphaTexture;
  self->_alphaTexture = 0;

  v16 = self->_normalizedFwarpTextures[0];
  self->_normalizedFwarpTextures[0] = 0;

  v17 = self->_normalizedFwarpTextures[1];
  self->_normalizedFwarpTextures[1] = 0;

  if (self->_textureFromCVPixelBuffer)
  {
    CVPixelBufferRelease(self->_intermediaCVBuffer);
    CVPixelBufferRelease(self->_selectMap);
    CVPixelBufferRelease(self->_flowPixelBuffer0);
    CVPixelBufferRelease(self->_flowPixelBuffer1);
    CVPixelBufferRelease(self->_L1Loss0);
    CVPixelBufferRelease(self->_L1Loss1);
    CVPixelBufferRelease(self->_warpedForwardFeatures[0]);
    CVPixelBufferRelease(self->_warpedForwardFeatures[1]);
    CVPixelBufferRelease(self->_alphaMap);
  }
}

- (void)forwardWarpForFlow:(int)a3 feature:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 warpedOutput:(id)a8 callback:(id)a9
{
  id v16;
  MTLCommandQueue *commandQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  _QWORD v24[4];
  id v25;

  v16 = a9;
  commandQueue = self->_commandQueue;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v23 = a7;
  -[Forwarp encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:](self->_forwarp, "encodeToCommandBuffer:input:flow:error:timeScale:fullWarp:bestError:output:destination:", v22, v21, v20, v19, 1, self->_bestErrorBuffer[a3], v23, self->_warpOutputBuffer[a3], v18);

  kdebug_trace();
  if (v16)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __87__LiteSynthesis_forwardWarpForFlow_feature_flow_error_timeScale_warpedOutput_callback___block_invoke;
    v24[3] = &unk_1E97868A8;
    v25 = v16;
    objc_msgSend(v22, "addCompletedHandler:", v24);

  }
  objc_msgSend(v22, "commit");

}

uint64_t __87__LiteSynthesis_forwardWarpForFlow_feature_flow_error_timeScale_warpedOutput_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)combineWarpedTexture:(id)a3 and:(id)a4 normalized0:(id)a5 normalized1:(id)a6 alpha:(id)a7 toOutput:(id)a8 mapTexture:(id)a9 callback:(id)a10
{
  MTLCommandQueue *commandQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v26 = a10;
  commandQueue = self->_commandQueue;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[GPUSynthesis encodeCombineCmdToCommandBuffer:fromBuffer0:buffer1:best0:best1:map:normalized0:normalized1:alpha:flowStats0:flowStats1:toTexture:](self->_synthesis, "encodeCombineCmdToCommandBuffer:fromBuffer0:buffer1:best0:best1:map:normalized0:normalized1:alpha:flowStats0:flowStats1:toTexture:", v25, v24, v23, self->_bestErrorBuffer[0], self->_bestErrorBuffer[1], v18, v22, v21, v20, &self->flowStats0, &self->flowStats1, v19);

  kdebug_trace();
  if (v26)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __101__LiteSynthesis_combineWarpedTexture_and_normalized0_normalized1_alpha_toOutput_mapTexture_callback___block_invoke;
    v27[3] = &unk_1E97868A8;
    v28 = v26;
    objc_msgSend(v25, "addCompletedHandler:", v27);

  }
  objc_msgSend(v25, "commit");

}

uint64_t __101__LiteSynthesis_combineWarpedTexture_and_normalized0_normalized1_alpha_toOutput_mapTexture_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateBlendingMap:(id)a3 and:(id)a4 toAlpha:(id)a5 timeScale:(float)a6 normalized0:(id)a7 normalized1:(id)a8 callback:(id)a9
{
  id v16;
  MTLCommandQueue *commandQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  _QWORD v25[4];
  id v26;

  v16 = a9;
  commandQueue = self->_commandQueue;
  v18 = a8;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = a6;
  -[GPUSynthesis encodeAlphaCmdToCommandBuffer:fromBuffer0:buffer1:toAlpha:timeScale:toNormalized0:toNormalized1:](self->_synthesis, "encodeAlphaCmdToCommandBuffer:fromBuffer0:buffer1:toAlpha:timeScale:toNormalized0:toNormalized1:", v23, v22, v21, v20, v19, v18, v24);

  kdebug_trace();
  if (v16)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __92__LiteSynthesis_generateBlendingMap_and_toAlpha_timeScale_normalized0_normalized1_callback___block_invoke;
    v25[3] = &unk_1E97868A8;
    v26 = v16;
    objc_msgSend(v23, "addCompletedHandler:", v25);

  }
  objc_msgSend(v23, "commit");

}

uint64_t __92__LiteSynthesis_generateBlendingMap_and_toAlpha_timeScale_normalized0_normalized1_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)postFilterFrom:(id)a3 mapTexture:(id)a4 toTexture:(id)a5 callback:(id)a6
{
  id v10;
  MTLCommandQueue *commandQueue;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  commandQueue = self->_commandQueue;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GPUSynthesis encodePostSmoothFilterCmdToCommandBuffer:map:fromTexture:toTexture:](self->_synthesis, "encodePostSmoothFilterCmdToCommandBuffer:map:fromTexture:toTexture:", v15, v13, v14, v12);

  kdebug_trace();
  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__LiteSynthesis_postFilterFrom_mapTexture_toTexture_callback___block_invoke;
    v16[3] = &unk_1E97868A8;
    v17 = v10;
    objc_msgSend(v15, "addCompletedHandler:", v16);

  }
  objc_msgSend(v15, "commit");

}

uint64_t __62__LiteSynthesis_postFilterFrom_mapTexture_toTexture_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)calcBackwarpLossFirst:(id)a3 second:(id)a4 commandBuffer:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  Backwarp *backwarp;
  MTLTexture *flowTexture0;
  MTLTexture *L1Texture0;
  id v15;
  id v16;
  double v17;
  double v18;
  _QWORD v19[4];
  id v20;

  v10 = a5;
  v11 = a6;
  backwarp = self->_backwarp;
  flowTexture0 = self->_flowTexture0;
  L1Texture0 = self->_L1Texture0;
  v15 = a4;
  v16 = a3;
  LODWORD(v17) = 1.0;
  -[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:](backwarp, "encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:", v10, v16, v15, flowTexture0, L1Texture0, v17);
  LODWORD(v18) = 1.0;
  -[Backwarp encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:](self->_backwarp, "encodeBackwarpLossToCommandBuffer:first:second:flow:timeScale:destination:", v10, v15, v16, self->_flowTexture1, self->_L1Texture1, v18);

  kdebug_trace();
  if (v11)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__LiteSynthesis_calcBackwarpLossFirst_second_commandBuffer_callback___block_invoke;
    v19[3] = &unk_1E97868A8;
    v20 = v11;
    objc_msgSend(v10, "addCompletedHandler:", v19);

  }
  objc_msgSend(v10, "commit");

}

uint64_t __69__LiteSynthesis_calcBackwarpLossFirst_second_commandBuffer_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)upScaleforwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 outputTexture:(id)a5 commandBuffer:(id)a6
{
  id v10;
  size_t Width;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a6;
  v10 = a5;
  Width = CVPixelBufferGetWidth(a3);
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "width");

  if (v14 == Width)
  {
    objc_storeStrong((id *)&self->_flowTexture0, v12);
    objc_storeStrong((id *)&self->_flowTexture1, v13);
  }
  else
  {
    -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v15, v12, self->_flowTexture0);
    -[Backwarp encodeUpscaleFlowToCommandBuffer:source:destination:](self->_backwarp, "encodeUpscaleFlowToCommandBuffer:source:destination:", v15, v13, self->_flowTexture1);
  }

}

- (void)forwarpFirstTexture:(id)a3 SecondTexture:(id)a4 timeScale:(float)a5 needWait:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  MTLTexture *flowTexture0;
  MTLTexture *L1Texture0;
  MTLTexture *v15;
  uint64_t v16;
  double v17;
  void *v18;
  MTLTexture *flowTexture1;
  MTLTexture *L1Texture1;
  double v21;
  MTLTexture *v22;
  _QWORD v23[5];
  BOOL v24;
  _QWORD v25[5];
  BOOL v26;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1D825AFCC]();
  flowTexture0 = self->_flowTexture0;
  L1Texture0 = self->_L1Texture0;
  v15 = self->_warpedForwardTextures[0];
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__LiteSynthesis_forwarpFirstTexture_SecondTexture_timeScale_needWait___block_invoke;
  v25[3] = &unk_1E9786B78;
  v26 = v6;
  v25[4] = self;
  *(float *)&v17 = a5;
  -[LiteSynthesis forwardWarpForFlow:feature:flow:error:timeScale:warpedOutput:callback:](self, "forwardWarpForFlow:feature:flow:error:timeScale:warpedOutput:callback:", 0, v10, flowTexture0, L1Texture0, v15, v25, v17);
  if (v6)
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_autoreleasePoolPop(v12);
  v18 = (void *)MEMORY[0x1D825AFCC]();
  flowTexture1 = self->_flowTexture1;
  L1Texture1 = self->_L1Texture1;
  *(float *)&v21 = 1.0 - a5;
  v22 = self->_warpedForwardTextures[1];
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __70__LiteSynthesis_forwarpFirstTexture_SecondTexture_timeScale_needWait___block_invoke_2;
  v23[3] = &unk_1E9786B78;
  v24 = v6;
  v23[4] = self;
  -[LiteSynthesis forwardWarpForFlow:feature:flow:error:timeScale:warpedOutput:callback:](self, "forwardWarpForFlow:feature:flow:error:timeScale:warpedOutput:callback:", 1, v11, flowTexture1, L1Texture1, v22, v23, v21);
  if (v6)
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_autoreleasePoolPop(v18);

}

intptr_t __70__LiteSynthesis_forwarpFirstTexture_SecondTexture_timeScale_needWait___block_invoke(intptr_t result)
{
  if (*(_BYTE *)(result + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(result + 32) + 48));
  return result;
}

intptr_t __70__LiteSynthesis_forwarpFirstTexture_SecondTexture_timeScale_needWait___block_invoke_2(intptr_t result)
{
  if (*(_BYTE *)(result + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(result + 32) + 48));
  return result;
}

- (LiteSynthesis)liteSynthesisWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 firstFeature:(id)a5 secondFeature:(id)a6 outputTexture:(id)a7 timeScale:(float)a8 frameIndex:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  double v19;
  uint64_t v20;
  void *v21;
  MTLBuffer *v22;
  MTLBuffer *v23;
  MTLTexture *alphaTexture;
  MTLTexture *v25;
  MTLTexture *v26;
  double v27;
  MTLBuffer *v28;
  MTLBuffer *v29;
  MTLTexture *v30;
  MTLTexture *v31;
  MTLTexture *v32;
  MTLTexture *combinedWarpedTexture;
  MTLTexture *mapTexture;
  MTLTexture *v35;
  MTLTexture *v36;
  double v37;
  LiteSynthesis *result;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[5];
  _QWORD v43[5];
  char v44;
  _QWORD v45[5];
  char v46;
  _QWORD v47[5];
  char v48;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  self->flowStats0.timeScale = a8;
  self->flowStats1.timeScale = 1.0 - a8;
  v20 = MEMORY[0x1E0C809B0];
  if (!a9)
  {
    v21 = (void *)MEMORY[0x1D825AFCC](-[LiteSynthesis upScaleforwardFlow:backwardFlow:outputTexture:commandBuffer:](self, "upScaleforwardFlow:backwardFlow:outputTexture:commandBuffer:", a3, a4, v18, v39));
    v47[0] = v20;
    v47[1] = 3221225472;
    v47[2] = __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke;
    v47[3] = &unk_1E9786B78;
    v48 = 0;
    v47[4] = self;
    -[LiteSynthesis calcBackwarpLossFirst:second:commandBuffer:callback:](self, "calcBackwarpLossFirst:second:commandBuffer:callback:", v16, v17, v39, v47);
    objc_autoreleasePoolPop(v21);
  }
  *(float *)&v19 = a8;
  -[LiteSynthesis forwarpFirstTexture:SecondTexture:timeScale:needWait:](self, "forwarpFirstTexture:SecondTexture:timeScale:needWait:", v16, v17, 0, v19);
  v22 = self->_warpOutputBuffer[0];
  v23 = self->_warpOutputBuffer[1];
  alphaTexture = self->_alphaTexture;
  v25 = self->_normalizedFwarpTextures[0];
  v26 = self->_normalizedFwarpTextures[1];
  v45[0] = v20;
  v45[1] = 3221225472;
  v45[2] = __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_2;
  v45[3] = &unk_1E9786B78;
  v46 = 0;
  v45[4] = self;
  *(float *)&v27 = a8;
  -[LiteSynthesis generateBlendingMap:and:toAlpha:timeScale:normalized0:normalized1:callback:](self, "generateBlendingMap:and:toAlpha:timeScale:normalized0:normalized1:callback:", v22, v23, alphaTexture, v25, v26, v45, v27);
  v28 = self->_warpOutputBuffer[0];
  v29 = self->_warpOutputBuffer[1];
  v30 = self->_normalizedFwarpTextures[0];
  v31 = self->_normalizedFwarpTextures[1];
  v32 = self->_alphaTexture;
  mapTexture = self->_mapTexture;
  combinedWarpedTexture = self->_combinedWarpedTexture;
  v43[0] = v20;
  v43[1] = 3221225472;
  v43[2] = __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_3;
  v43[3] = &unk_1E9786B78;
  v44 = 0;
  v43[4] = self;
  -[LiteSynthesis combineWarpedTexture:and:normalized0:normalized1:alpha:toOutput:mapTexture:callback:](self, "combineWarpedTexture:and:normalized0:normalized1:alpha:toOutput:mapTexture:callback:", v28, v29, v30, v31, v32, combinedWarpedTexture, mapTexture, v43);
  v36 = self->_mapTexture;
  v35 = self->_combinedWarpedTexture;
  v42[0] = v20;
  v42[1] = 3221225472;
  v42[2] = __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_4;
  v42[3] = &unk_1E9786BA0;
  v42[4] = self;
  -[LiteSynthesis postFilterFrom:mapTexture:toTexture:callback:](self, "postFilterFrom:mapTexture:toTexture:callback:", v35, v36, v18, v42);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_enableMemDump)
  {
    v40 = 0;
    v41 = 0;
    FRCGetAlignedInputFrameSizeForUsage(self->_usage, &v41, &v40);
    *(float *)&v37 = a8;
    -[LiteSynthesis dumpMemoryAt:frameIndex:width:height:channels:](self, "dumpMemoryAt:frameIndex:width:height:channels:", a9, v41, v40, 3, v37);
  }

  return result;
}

intptr_t __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke(intptr_t result)
{
  if (*(_BYTE *)(result + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(result + 32) + 48));
  return result;
}

intptr_t __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_2(intptr_t result)
{
  if (*(_BYTE *)(result + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(result + 32) + 48));
  return result;
}

intptr_t __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_3(intptr_t result)
{
  if (*(_BYTE *)(result + 40))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(result + 32) + 48));
  return result;
}

intptr_t __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 48));
}

- (__CVBuffer)synthesizeFrameForTimeScale:(float)a3 frameIndex:(unint64_t)a4
{
  return -[LiteSynthesis synthesizeFrameFromFirstImage:secondImage:flowForward:flowBackward:timeScale:frameIndex:](self, "synthesizeFrameFromFirstImage:secondImage:flowForward:flowBackward:timeScale:frameIndex:", self->_normalizedFirst, self->_normalizedSecond, self->_forwardFlow, self->_backwardFlow, a4);
}

- (__CVBuffer)synthesizeFrameFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 frameIndex:(unint64_t)a8
{
  __CVBuffer *PixelBuffer;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v21;
  size_t v22;

  v21 = 0;
  v22 = 0;
  FRCGetAlignedInputFrameSizeForUsage(self->_usage, (uint64_t *)&v22, &v21);
  PixelBuffer = createPixelBuffer(v22, 3 * v21, 0x4C303068u, 0);
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  createTexturesFromCVPixelBuffer(PixelBuffer, self->_device, 1, 3uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v19 = a7;
  -[LiteSynthesis liteSynthesisWithFlowForward:flowBackward:firstFeature:secondFeature:outputTexture:timeScale:frameIndex:](self, "liteSynthesisWithFlowForward:flowBackward:firstFeature:secondFeature:outputTexture:timeScale:frameIndex:", a5, a6, v16, v17, v18, a8, v19);

  return PixelBuffer;
}

- (BOOL)dumpMemoryAt:(float)a3 frameIndex:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 channels:(unint64_t)a7
{
  void *v12;
  void *v13;
  id v14;
  id v15;
  FILE *v16;
  void *v17;
  id v18;
  FILE *v19;
  id v20;
  FILE *v21;
  void *v22;
  id v23;
  FILE *v24;
  unint64_t v25;
  void *v26;
  id v27;
  FILE *v28;
  void *v29;
  id v30;
  FILE *v31;
  void *v32;
  id v33;
  FILE *v34;
  BOOL v35;
  id v37;
  void *v38;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldx%ld.float"), a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts%d_%@"), (int)(float)(a3 * 1000.0), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if ((objc_msgSend(v14, "fileExistsAtPath:", CFSTR("/var/mobile/tmp/")) & 1) != 0
    || (objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/tmp/"), 1, 0, 0) & 1) != 0)
  {
    v37 = v14;
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("/var/mobile/tmp/"), CFSTR("flow0"), v12);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = fopen((const char *)objc_msgSend(v15, "UTF8String"), "wb");
      writeBufferFlt32(v16, self->_flowPixelBuffer0);
      fclose(v16);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("/var/mobile/tmp/"), CFSTR("flow1"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_retainAutorelease(v17);
      v19 = fopen((const char *)objc_msgSend(v18, "UTF8String"), "wb");
      writeBufferFlt32(v19, self->_flowPixelBuffer1);
      fclose(v19);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("/var/mobile/tmp/"), CFSTR("map"), v13);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = v12;
    v21 = fopen((const char *)objc_msgSend(v20, "UTF8String"), "wb");
    writeBufferFlt32(v21, self->_selectMap);
    saveTextureBufferFlt32(v21, self->_bestErrorBuffer[0], a5, a6, 0.0000001);
    saveTextureBufferFlt32(v21, self->_bestErrorBuffer[1], a5, a6, 0.0000001);
    fclose(v21);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("/var/mobile/tmp/"), CFSTR("warpOutput0"), v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_retainAutorelease(v22);
    v24 = fopen((const char *)objc_msgSend(v23, "UTF8String"), "wb");
    v25 = a6 + a6 * a7;
    saveTextureBufferFlt32(v24, self->_warpOutputBuffer[0], a5, v25, 0.0000001);
    fclose(v24);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("/var/mobile/tmp/"), CFSTR("warpOutput1"), v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_retainAutorelease(v26);
    v28 = fopen((const char *)objc_msgSend(v27, "UTF8String"), "wb");
    saveTextureBufferFlt32(v28, self->_warpOutputBuffer[1], a5, v25, 0.0000001);
    fclose(v28);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("/var/mobile/tmp/"), CFSTR("loss0"), v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_retainAutorelease(v29);
    v31 = fopen((const char *)objc_msgSend(v30, "UTF8String"), "wb");
    writeBufferFlt32(v31, self->_L1Loss0);
    fclose(v31);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("/var/mobile/tmp/"), CFSTR("loss1"), v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_retainAutorelease(v32);
    v34 = fopen((const char *)objc_msgSend(v33, "UTF8String"), "wb");
    writeBufferFlt32(v34, self->_L1Loss1);
    fclose(v34);

    v14 = v37;
    v12 = v38;
    v35 = 1;
  }
  else
  {
    NSLog(CFSTR("%@ could not be created !"), CFSTR("/var/mobile/tmp/"));
    v35 = 0;
  }

  return v35;
}

- (void)createFeaturesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  self->_forwardFlow = CVPixelBufferRetain(a5);
  self->_backwardFlow = CVPixelBufferRetain(a6);
  self->_normalizedFirst = CVPixelBufferRetain(a3);
  self->_normalizedSecond = CVPixelBufferRetain(a4);
}

- (void)releaseFeatures
{
  CVPixelBufferRelease(self->_forwardFlow);
  CVPixelBufferRelease(self->_backwardFlow);
  CVPixelBufferRelease(self->_normalizedFirst);
  CVPixelBufferRelease(self->_normalizedSecond);
  *(_OWORD *)&self->_normalizedFirst = 0u;
  *(_OWORD *)&self->_forwardFlow = 0u;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (BOOL)enableMemDump
{
  return self->_enableMemDump;
}

- (void)setEnableMemDump:(BOOL)a3
{
  self->_enableMemDump = a3;
}

- (BOOL)textureFromCVPixelBuffer
{
  return self->_textureFromCVPixelBuffer;
}

- (void)setTextureFromCVPixelBuffer:(BOOL)a3
{
  self->_textureFromCVPixelBuffer = a3;
}

- (BOOL)framePipeline
{
  return self->_framePipeline;
}

- (void)setFramePipeline:(BOOL)a3
{
  self->_framePipeline = a3;
}

- (BOOL)temporalFiltering
{
  return self->_temporalFiltering;
}

- (void)setTemporalFiltering:(BOOL)a3
{
  self->_temporalFiltering = a3;
}

- (BOOL)linearSplatting
{
  return self->_linearSplatting;
}

- (void)setLinearSplatting:(BOOL)a3
{
  self->_linearSplatting = a3;
}

- (BOOL)frameSyncRequired
{
  return self->_frameSyncRequired;
}

- (void).cxx_destruct
{
  uint64_t v3;
  MTLTexture **v4;
  uint64_t i;
  uint64_t j;
  uint64_t k;

  v3 = 0;
  v4 = &self->_normalizedFwarpTextures[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_warpedForwardTextures[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_warpOutputBuffer[j + 1], 0);
  for (k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_bestErrorBuffer[k + 1], 0);
  objc_storeStrong((id *)&self->_combinedWarpedTexture, 0);
  objc_storeStrong((id *)&self->_mapTexture, 0);
  objc_storeStrong((id *)&self->_L1Texture1, 0);
  objc_storeStrong((id *)&self->_L1Texture0, 0);
  objc_storeStrong((id *)&self->_flowTexture1, 0);
  objc_storeStrong((id *)&self->_flowTexture0, 0);
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_synthesis, 0);
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_forwarp, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
