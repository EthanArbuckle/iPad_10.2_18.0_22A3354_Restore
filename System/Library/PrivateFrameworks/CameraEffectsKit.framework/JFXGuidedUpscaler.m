@implementation JFXGuidedUpscaler

- (JFXGuidedUpscaler)initWithDiameter:(int)a3
{
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  JFXGuidedFilter *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  JFXMetalHelpers *v13;
  void *v14;
  CVReturn v15;
  NSObject *v16;
  JFXGuidedUpscaler *v17;
  NSObject *v18;
  const char *v19;
  uint8_t v21[16];
  objc_super v22;

  v3 = *(_QWORD *)&a3;
  v22.receiver = self;
  v22.super_class = (Class)JFXGuidedUpscaler;
  v4 = -[JFXGuidedUpscaler init](&v22, sel_init);
  v5 = v4;
  if (v4)
  {
    v4[64] = 0;
    *(_QWORD *)(v4 + 68) = 0x42C800003F000000;
    v6 = MTLCreateSystemDefaultDevice();
    v7 = -[JFXGuidedFilter initWithDiameter:]([JFXGuidedFilter alloc], "initWithDiameter:", v3);
    v8 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v7;

    objc_storeStrong((id *)v5 + 1, v6);
    if (v6)
    {
      v9 = objc_msgSend(*((id *)v5 + 1), "newCommandQueue");
      v10 = (void *)*((_QWORD *)v5 + 5);
      *((_QWORD *)v5 + 5) = v9;

      if (v9)
      {
        v11 = objc_opt_new();
        v12 = (void *)*((_QWORD *)v5 + 2);
        *((_QWORD *)v5 + 2) = v11;

        if (v11)
        {
          v13 = -[JFXMetalHelpers initWithDevice:]([JFXMetalHelpers alloc], "initWithDevice:", v6);
          v14 = (void *)*((_QWORD *)v5 + 6);
          *((_QWORD *)v5 + 6) = v13;

          if (v13)
          {
            v15 = CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v6, 0, (CVMetalTextureCacheRef *)v5 + 4);
            if (v15)
            {
              JFXLog_matting();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                -[JFXGuidedUpscaler initWithDiameter:].cold.1(v15, v16);

            }
            goto LABEL_11;
          }
          JFXLog_matting();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            v19 = "\"Error: Could not initialize helpers\";
            goto LABEL_20;
          }
LABEL_21:

          v17 = 0;
          goto LABEL_22;
        }
        JFXLog_matting();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        *(_WORD *)v21 = 0;
        v19 = "\"Error: Could not initialize scaler\";
      }
      else
      {
        JFXLog_matting();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        *(_WORD *)v21 = 0;
        v19 = "\"Error: Failed to create a Metal command queue\";
      }
    }
    else
    {
      JFXLog_matting();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)v21 = 0;
      v19 = "\"Error: Metal device must not be NULL\";
    }
LABEL_20:
    _os_log_impl(&dword_2269A9000, v18, OS_LOG_TYPE_DEFAULT, v19, v21, 2u);
    goto LABEL_21;
  }
LABEL_11:
  v17 = (JFXGuidedUpscaler *)v5;
LABEL_22:

  return v17;
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  JFXGuidedFilter *guidedFilter;
  MPSImageGaussianBlur *blur;
  MPSImageBilinearScale *scaler;
  JFXMetalHelpers *helpers;
  MTLCommandQueue *commandQueue;
  MTLDevice *device;
  objc_super v10;

  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  guidedFilter = self->_guidedFilter;
  self->_guidedFilter = 0;

  blur = self->_blur;
  self->_blur = 0;

  scaler = self->_scaler;
  self->_scaler = 0;

  helpers = self->_helpers;
  self->_helpers = 0;

  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  -[JFXGuidedUpscaler setPipelineStateSimilarity:](self, "setPipelineStateSimilarity:", 0);
  -[JFXGuidedUpscaler setPipelineStateSmoothing:](self, "setPipelineStateSmoothing:", 0);
  -[JFXGuidedUpscaler setCurrentOutputTexture:](self, "setCurrentOutputTexture:", 0);
  -[JFXGuidedUpscaler setPreviousOutputTexture:](self, "setPreviousOutputTexture:", 0);
  -[JFXGuidedUpscaler setOldScaledGuidance:](self, "setOldScaledGuidance:", 0);
  -[JFXGuidedUpscaler setScaledGuidance:](self, "setScaledGuidance:", 0);
  device = self->_device;
  self->_device = 0;

  v10.receiver = self;
  v10.super_class = (Class)JFXGuidedUpscaler;
  -[JFXGuidedUpscaler dealloc](&v10, sel_dealloc);
}

- (BOOL)scaleImage:(__CVBuffer *)a3 guidanceImage:(__CVBuffer *)a4 destinationImage:(__CVBuffer *)a5
{
  MTLCommandQueue *commandQueue;
  uint64_t v10;
  NSObject *v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  __CVBuffer *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  float v23;
  void *v24;
  MPSImageGaussianBlur *blur;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  JFXMetalHelpers *v29;
  MPSImageGaussianBlur *v30;
  MPSImageBilinearScale *v31;
  NSObject *v32;
  float v33;
  BOOL v34;
  const char *v35;
  const char *v37;
  const char *v38;
  void *v39;
  id v40;
  void *v41;
  MPSImageBilinearScale *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  JFXMetalHelpers *v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  id v55;
  MPSImageBilinearScale *scaler;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  JFXMetalHelpers *helpers;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint8_t buf[16];

  if (!self->_device)
  {
    JFXLog_matting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v35 = "\"Error: Metal device must not be NULL\";
LABEL_52:
    _os_log_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    goto LABEL_53;
  }
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    JFXLog_matting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v35 = "\"Error: Metal command queue must not be NULL\";
    goto LABEL_52;
  }
  if (!self->_textureCache)
  {
    JFXLog_matting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_WORD *)buf = 0;
    v35 = "\"Error: texture cache must not be NULL\";
    goto LABEL_52;
  }
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    v12 = +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:](JFXMetalHelpers, "createCVTextureFromImage:withTextureCache:", a3, self->_textureCache);
    v13 = +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:](JFXMetalHelpers, "createCVTextureFromImage:withTextureCache:", a4, self->_textureCache);
    v14 = +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:](JFXMetalHelpers, "createCVTextureFromImage:withTextureCache:", a5, self->_textureCache);
    CVMetalTextureGetTexture(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CVMetalTextureGetTexture(v13);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    CVMetalTextureGetTexture(v14);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && v68 && v67)
    {
      if (objc_msgSend(v15, "width")
        && objc_msgSend(v15, "height")
        && objc_msgSend(v68, "width")
        && objc_msgSend(v68, "height")
        && objc_msgSend(v67, "width")
        && objc_msgSend(v67, "height"))
      {
        if (!-[JFXGuidedUpscaler initialized](self, "initialized"))
        {
          JFXLog_matting();
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            goto LABEL_60;
          *(_WORD *)buf = 0;
          v37 = "\"Error: Not yet initialized\";
          goto LABEL_59;
        }
        -[JFXGuidedUpscaler scaledGuidance](self, "scaledGuidance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v17 = -[JFXMetalHelpers newTextureWithSameSizeAs:pixelFormat:](self->_helpers, "newTextureWithSameSizeAs:pixelFormat:", v15, objc_msgSend(v68, "pixelFormat"));
          -[JFXGuidedUpscaler setScaledGuidance:](self, "setScaledGuidance:", v17);

          -[JFXGuidedUpscaler scaledGuidance](self, "scaledGuidance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            JFXLog_matting();
            v27 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              goto LABEL_60;
            *(_WORD *)buf = 0;
            v37 = "\"Error: Could not setup scaledGuidance texture\";
            goto LABEL_59;
          }
        }
        scaler = self->_scaler;
        -[JFXGuidedUpscaler scaledGuidance](self, "scaledGuidance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](scaler, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, v68, v19);

        -[JFXGuidedUpscaler currentOutputTexture](self, "currentOutputTexture");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20
          || (v21 = -[JFXMetalHelpers newTextureWithSameSizeAs:pixelFormat:](self->_helpers, "newTextureWithSameSizeAs:pixelFormat:", v67, objc_msgSend(v67, "pixelFormat")), -[JFXGuidedUpscaler setCurrentOutputTexture:](self, "setCurrentOutputTexture:", v21), v21, -[JFXGuidedUpscaler currentOutputTexture](self, "currentOutputTexture"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, v22))
        {
          -[JFXGuidedUpscaler updateRate](self, "updateRate");
          if (v23 <= 0.0)
            goto LABEL_35;
          -[JFXGuidedUpscaler previousOutputTexture](self, "previousOutputTexture");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
            goto LABEL_35;
          blur = self->_blur;
          if (blur)
          {
            -[MPSImageGaussianBlur encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:](blur, "encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:", v11, &self->_oldScaledGuidance, 0);
            -[MPSImageGaussianBlur encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:](self->_blur, "encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:", v11, &self->_scaledGuidance, 0);
          }
          -[NSObject computeCommandEncoder](v11, "computeCommandEncoder");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            -[NSObject pushDebugGroup:](v26, "pushDebugGroup:", CFSTR("JFXGuidedUpscalerSimilarity"));
            -[JFXGuidedUpscaler pipelineStateSimilarity](self, "pipelineStateSimilarity");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v57)
            {
              v58 = -[JFXMetalHelpers newPipelineStateForFunctionWithName:](self->_helpers, "newPipelineStateForFunctionWithName:", CFSTR("JFXGuidedUpscalerSimilarity"));
              -[JFXGuidedUpscaler setPipelineStateSimilarity:](self, "setPipelineStateSimilarity:", v58);

            }
            if (self->_pipelineStateSimilarity)
            {
              -[NSObject setComputePipelineState:](v27, "setComputePipelineState:");
              -[JFXGuidedUpscaler oldScaledGuidance](self, "oldScaledGuidance");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setTexture:atIndex:](v27, "setTexture:atIndex:", v59, 3);

              -[JFXGuidedUpscaler scaledGuidance](self, "scaledGuidance");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setTexture:atIndex:](v27, "setTexture:atIndex:", v60, 2);

              -[JFXGuidedUpscaler similarity](self, "similarity");
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              if (v61)
                goto LABEL_29;
              helpers = self->_helpers;
              -[JFXGuidedUpscaler scaledGuidance](self, "scaledGuidance");
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = helpers;
              v63 = (void *)v28;
              v55 = -[JFXMetalHelpers newTextureWithSameSizeAs:pixelFormat:](v29, "newTextureWithSameSizeAs:pixelFormat:", v28, 10);
              -[JFXGuidedUpscaler setSimilarity:](self, "setSimilarity:", v55);

              -[JFXGuidedUpscaler similarity](self, "similarity");
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              if (v64)
              {
LABEL_29:
                -[JFXGuidedUpscaler similarity](self, "similarity");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setTexture:atIndex:](v27, "setTexture:atIndex:", v65, 4);

                -[NSObject setBytes:length:atIndex:](v27, "setBytes:length:atIndex:", &self->_temporalSmoothing, 4, 0);
                if (-[JFXMetalHelpers runComputeEncoder:pipelineState:referenceTexture:](self->_helpers, "runComputeEncoder:pipelineState:referenceTexture:", v27, self->_pipelineStateSimilarity, self->_similarity))
                {
                  -[NSObject popDebugGroup](v27, "popDebugGroup");
                  -[NSObject endEncoding](v27, "endEncoding");
                  v30 = self->_blur;
                  if (v30)
                    -[MPSImageGaussianBlur encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:](v30, "encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:", v11, &self->_similarity, 0);
                  if (self->_showSimilarity)
                  {
                    v31 = self->_scaler;
                    -[JFXGuidedUpscaler similarity](self, "similarity");
                    v32 = objc_claimAutoreleasedReturnValue();
                    -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](v31, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, v32, v67);
LABEL_34:

LABEL_35:
                    -[NSObject commit](v11, "commit");
                    -[JFXGuidedUpscaler updateRate](self, "updateRate");
                    if (v33 > 0.0)
                    {
                      std::swap[abi:ne180100]<objc_object  {objcproto10MTLTexture}* {__strong}>((void **)&self->_previousOutputTexture, (void **)&self->_currentOutputTexture);
                      std::swap[abi:ne180100]<objc_object  {objcproto10MTLTexture}* {__strong}>((void **)&self->_oldScaledGuidance, (void **)&self->_scaledGuidance);
                    }
                    if (v12)
                      CFRelease(v12);
                    if (v13)
                      CFRelease(v13);
                    if (v14)
                      CFRelease(v14);
                    v34 = 1;
                    goto LABEL_61;
                  }
                  -[JFXGuidedFilter scaleImage:guidanceImage:destinationImage:](self->_guidedFilter, "scaleImage:guidanceImage:destinationImage:", a3, a4, a5);
                  -[JFXGuidedUpscaler currentOutputTexture](self, "currentOutputTexture");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v39
                    || (v40 = -[JFXMetalHelpers newTextureWithSameSizeAs:pixelFormat:](self->_helpers, "newTextureWithSameSizeAs:pixelFormat:", v67, 10), -[JFXGuidedUpscaler setCurrentOutputTexture:](self, "setCurrentOutputTexture:", v40), v40, -[JFXGuidedUpscaler currentOutputTexture](self, "currentOutputTexture"), v41 = (void *)objc_claimAutoreleasedReturnValue(), v41, v41))
                  {
                    v42 = self->_scaler;
                    -[JFXGuidedUpscaler currentOutputTexture](self, "currentOutputTexture");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](v42, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, v67, v43);

                    -[NSObject computeCommandEncoder](v11, "computeCommandEncoder");
                    v44 = objc_claimAutoreleasedReturnValue();
                    v32 = v44;
                    if (v44)
                    {
                      -[NSObject pushDebugGroup:](v44, "pushDebugGroup:", CFSTR("JFXGuidedUpscalerSmoothing"));
                      -[JFXGuidedUpscaler pipelineStateSmoothing](self, "pipelineStateSmoothing");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v45)
                      {
                        v46 = -[JFXMetalHelpers newPipelineStateForFunctionWithName:](self->_helpers, "newPipelineStateForFunctionWithName:", CFSTR("JFXGuidedUpscalerSmoothing"));
                        -[JFXGuidedUpscaler setPipelineStateSmoothing:](self, "setPipelineStateSmoothing:", v46);

                      }
                      -[JFXGuidedUpscaler pipelineStateSmoothing](self, "pipelineStateSmoothing");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v47)
                      {
                        -[NSObject setComputePipelineState:](v32, "setComputePipelineState:", self->_pipelineStateSmoothing);
                        -[JFXGuidedUpscaler currentOutputTexture](self, "currentOutputTexture");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject setTexture:atIndex:](v32, "setTexture:atIndex:", v48, 0);

                        -[JFXGuidedUpscaler previousOutputTexture](self, "previousOutputTexture");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject setTexture:atIndex:](v32, "setTexture:atIndex:", v49, 1);

                        -[JFXGuidedUpscaler similarity](self, "similarity");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject setTexture:atIndex:](v32, "setTexture:atIndex:", v50, 4);

                        -[NSObject setBytes:length:atIndex:](v32, "setBytes:length:atIndex:", &self->_updateRate, 4, 1);
                        v51 = self->_helpers;
                        -[JFXGuidedUpscaler pipelineStateSmoothing](self, "pipelineStateSmoothing");
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        -[JFXGuidedUpscaler previousOutputTexture](self, "previousOutputTexture");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        LOBYTE(v51) = -[JFXMetalHelpers runComputeEncoder:pipelineState:referenceTexture:](v51, "runComputeEncoder:pipelineState:referenceTexture:", v32, v66, v52);

                        if ((v51 & 1) != 0)
                        {
                          -[NSObject popDebugGroup](v32, "popDebugGroup");
                          -[NSObject endEncoding](v32, "endEncoding");
                          -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_scaler, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, self->_currentOutputTexture, v67);
                          goto LABEL_34;
                        }
                        JFXLog_matting();
                        v53 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                          goto LABEL_93;
                        *(_WORD *)buf = 0;
                        v54 = "\"Error: Could not run compute encoder\";
                        goto LABEL_92;
                      }
                      JFXLog_matting();
                      v53 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        v54 = "\"Error: Could not get pipelineStateSmoothing\";
                        goto LABEL_92;
                      }
                    }
                    else
                    {
                      JFXLog_matting();
                      v53 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        v54 = "\"Error: Could not create compute encoder\";
LABEL_92:
                        _os_log_impl(&dword_2269A9000, v53, OS_LOG_TYPE_DEFAULT, v54, buf, 2u);
                      }
                    }
LABEL_93:

                    goto LABEL_85;
                  }
                  JFXLog_matting();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_85;
                  *(_WORD *)buf = 0;
                  v38 = "\"Error: Could not setup destination texture 2\";
                  goto LABEL_84;
                }
                JFXLog_matting();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v38 = "\"Error: Could not run compute encoder\";
                  goto LABEL_84;
                }
              }
              else
              {
                JFXLog_matting();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v38 = "\"Error: Could not setup similarity texture\";
                  goto LABEL_84;
                }
              }
LABEL_85:

              goto LABEL_60;
            }
            JFXLog_matting();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              goto LABEL_85;
            *(_WORD *)buf = 0;
            v38 = "\"Error: Could not get pipelineStateSimilarity\";
          }
          else
          {
            JFXLog_matting();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              goto LABEL_85;
            *(_WORD *)buf = 0;
            v38 = "\"Error: Could not create compute encoder\";
          }
LABEL_84:
          _os_log_impl(&dword_2269A9000, v32, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
          goto LABEL_85;
        }
        JFXLog_matting();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v37 = "\"Error: Could not setup coefficients texture\";
          goto LABEL_59;
        }
LABEL_60:

        v34 = 0;
LABEL_61:

        goto LABEL_54;
      }
      JFXLog_matting();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v37 = "\"Error: Textures must not be empty\";
    }
    else
    {
      JFXLog_matting();
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v37 = "\"Error:Inputs must not be nil\";
    }
LABEL_59:
    _os_log_impl(&dword_2269A9000, v27, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    goto LABEL_60;
  }
  JFXLog_matting();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v35 = "\"Error: failed to create a Metal command buffer\";
    goto LABEL_52;
  }
LABEL_53:
  v34 = 0;
LABEL_54:

  return v34;
}

- (BOOL)initialized
{
  return self->_device != 0;
}

- (void)setSimilarityGaussianBlur:(float)a3
{
  MPSImageGaussianBlur *blur;
  float v6;
  id v7;
  double v8;
  MPSImageGaussianBlur *v9;
  MPSImageGaussianBlur *v10;
  MPSImageGaussianBlur *v11;
  void *guidedFilter;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (!-[JFXGuidedUpscaler initialized](self, "initialized"))
  {
    JFXLog_matting();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[JFXGuidedUpscaler setSimilarityGaussianBlur:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_9:

    return;
  }
  blur = self->_blur;
  if (!blur || (-[MPSImageGaussianBlur sigma](blur, "sigma"), v6 != a3))
  {
    if (a3 <= 0.0)
    {
      guidedFilter = self->_blur;
      self->_blur = 0;
      goto LABEL_12;
    }
    v7 = objc_alloc(MEMORY[0x24BDDE3C8]);
    *(float *)&v8 = a3;
    v9 = (MPSImageGaussianBlur *)objc_msgSend(v7, "initWithDevice:sigma:", self->_device, v8);
    v10 = self->_blur;
    self->_blur = v9;

    v11 = self->_blur;
    if (v11)
    {
      -[MPSImageGaussianBlur setEdgeMode:](v11, "setEdgeMode:", 1);
      guidedFilter = self->_guidedFilter;
      self->_guidedFilter = 0;
LABEL_12:

      return;
    }
    JFXLog_matting();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[JFXGuidedUpscaler setSimilarityGaussianBlur:].cold.1(v13, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_9;
  }
}

- (float)updateRate
{
  return self->_updateRate;
}

- (void)setUpdateRate:(float)a3
{
  self->_updateRate = a3;
}

- (BOOL)showSimilarity
{
  return self->_showSimilarity;
}

- (void)setShowSimilarity:(BOOL)a3
{
  self->_showSimilarity = a3;
}

- (float)temporalSmoothing
{
  return self->_temporalSmoothing;
}

- (void)setTemporalSmoothing:(float)a3
{
  self->_temporalSmoothing = a3;
}

- (MTLTexture)scaledGuidance
{
  return self->_scaledGuidance;
}

- (void)setScaledGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_scaledGuidance, a3);
}

- (MTLTexture)oldScaledGuidance
{
  return self->_oldScaledGuidance;
}

- (void)setOldScaledGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_oldScaledGuidance, a3);
}

- (MTLTexture)currentOutputTexture
{
  return self->_currentOutputTexture;
}

- (void)setCurrentOutputTexture:(id)a3
{
  objc_storeStrong((id *)&self->_currentOutputTexture, a3);
}

- (MTLTexture)previousOutputTexture
{
  return self->_previousOutputTexture;
}

- (void)setPreviousOutputTexture:(id)a3
{
  objc_storeStrong((id *)&self->_previousOutputTexture, a3);
}

- (MTLTexture)similarity
{
  return self->_similarity;
}

- (void)setSimilarity:(id)a3
{
  objc_storeStrong((id *)&self->_similarity, a3);
}

- (MTLComputePipelineState)pipelineStateSimilarity
{
  return self->_pipelineStateSimilarity;
}

- (void)setPipelineStateSimilarity:(id)a3
{
  objc_storeStrong((id *)&self->_pipelineStateSimilarity, a3);
}

- (MTLComputePipelineState)pipelineStateSmoothing
{
  return self->_pipelineStateSmoothing;
}

- (void)setPipelineStateSmoothing:(id)a3
{
  objc_storeStrong((id *)&self->_pipelineStateSmoothing, a3);
}

- (float)similarityGaussianBlur
{
  return self->_similarityGaussianBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineStateSmoothing, 0);
  objc_storeStrong((id *)&self->_pipelineStateSimilarity, 0);
  objc_storeStrong((id *)&self->_similarity, 0);
  objc_storeStrong((id *)&self->_previousOutputTexture, 0);
  objc_storeStrong((id *)&self->_currentOutputTexture, 0);
  objc_storeStrong((id *)&self->_oldScaledGuidance, 0);
  objc_storeStrong((id *)&self->_scaledGuidance, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_blur, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)initWithDiameter:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to create a Metal texture cache CVReturn = %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)setSimilarityGaussianBlur:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2269A9000, a1, a3, "Error: Could not initialize gaussian blur", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setSimilarityGaussianBlur:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2269A9000, a1, a3, "Cannot set similarity blur before initializing upscaler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
