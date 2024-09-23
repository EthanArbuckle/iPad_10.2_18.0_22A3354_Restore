@implementation ADLKTOpticalFlow

- (void)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComputePipelineState:", self->_computePipelines[1]);
  objc_msgSend(v6, "setTexture:atIndex:", v7, 0);
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v6, self->_computePipelines[1], objc_msgSend(v7, "width"), objc_msgSend(v7, "height"));
  objc_msgSend(v6, "endEncoding");

}

- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5 scaling_factor:
{
  float32x2_t v5;
  float32x2_t v6;
  id v10;
  id v11;
  void *v17;
  float32x2_t v19;

  v6 = v5;
  v10 = a4;
  v11 = a5;
  __asm { FMOV            V0.2S, #1.0 }
  v19 = vdiv_f32(_D0, v6);
  objc_msgSend(a3, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setComputePipelineState:", self->_computePipelines[2]);
  objc_msgSend(v17, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v17, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v19, 8, 0);
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v17, self->_computePipelines[2], objc_msgSend(v11, "width"), objc_msgSend(v11, "height"));
  objc_msgSend(v17, "endEncoding");

  return 0;
}

- (void)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  float32x2_t v21;
  uint64_t v22;
  void *v23;
  MTLComputePipelineState *v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  _QWORD v30[2];

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v30[1] = 0;
  v30[0] = *(_QWORD *)&self->_nlreg_radius;
  __asm { FMOV            V1.2S, #1.0 }
  v21 = vdiv_f32(_D1, vadd_f32(*(float32x2_t *)&self->_nlreg_sigma_l, *(float32x2_t *)&self->_nlreg_sigma_l));
  LODWORD(v22) = v21.i32[1];
  *((float *)&v22 + 1) = 1.0 / (float)(self->_nlreg_sigma_w + self->_nlreg_sigma_w);
  objc_msgSend(a3, "computeCommandEncoder", v30[0], 0, *(_QWORD *)&v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setComputePipelineState:", self->_computePipelines[8]);
  objc_msgSend(v23, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v23, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v23, "setTexture:atIndex:", v14, 2);
  objc_msgSend(v23, "setTexture:atIndex:", v15, 3);
  objc_msgSend(v23, "setBytes:length:atIndex:", v30, 32, 0);
  v24 = self->_computePipelines[8];
  v25 = objc_msgSend(v12, "width");
  v26 = objc_msgSend(v12, "height");
  if (v25 >= 0)
    v27 = v25;
  else
    v27 = v25 + 1;
  v28 = (v27 >> 1);
  if (v26 >= 0)
    v29 = v26;
  else
    v29 = v26 + 1;
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v23, v24, v28, (v29 >> 1));
  objc_msgSend(v23, "endEncoding");

}

- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 inOutPyramidsArray:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unsigned int v9;
  unint64_t v10;
  void *v16;
  void *v17;
  float64x2_t v19;

  v7 = a3;
  v8 = a4;
  if (self->_nscales >= 2)
  {
    v9 = 2;
    v10 = 1;
    __asm { FMOV            V0.2D, #-1.0 }
    v19 = _Q0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9 - 2, *(_OWORD *)&v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADLKTOpticalFlow _downscale2XWithCommandBuffer:in_tex:out_tex:scaling_factor:](self, "_downscale2XWithCommandBuffer:in_tex:out_tex:scaling_factor:", v7, v16, v17, COERCE_DOUBLE(vdiv_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)self->_pyramid_size[v10], v19)), vcvt_f32_f64(vaddq_f64(*(float64x2_t *)&self->_nwarpings[4 * v9 + 10], v19)))));

      v10 = v9++;
    }
    while (self->_nscales > v10);
  }

  return 1;
}

- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 in_BGRATex:(id)a4 outPyramidsArray:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", self->_computePipelines[0]);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTexture:atIndex:", v14, 1);

  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v13, self->_computePipelines[0], objc_msgSend(v11, "width"), objc_msgSend(v11, "height"));
  objc_msgSend(v13, "endEncoding");
  -[ADLKTOpticalFlow _createImagePyramidWithCommandBuffer:inOutPyramidsArray:error:](self, "_createImagePyramidWithCommandBuffer:inOutPyramidsArray:error:", v10, v12, a6);

  return 1;
}

- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[3]);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v10, self->_computePipelines[3], objc_msgSend(v8, "width"), objc_msgSend(v8, "height"));
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[4]);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v10, self->_computePipelines[4], objc_msgSend(v8, "width"), objc_msgSend(v8, "height"));
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)_doSolverWithCommandBuffer:(id)a3 currentFeatures:(id)a4 currentDerivitive:(id)a5 previousFeatures:(id)a6 previousDerivitive:(id)a7 scale:(int)a8 coeff:(id)a9 in_uv_tex:(id)a10 out_uv_tex:(id)a11 out_w_tex:
{
  uint64_t v11;
  uint64_t v12;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int maxThreadExecutionWidth;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float32x2_t v28;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _DWORD v43[2];
  uint64_t v44;
  float32x2_t v45;
  uint64_t v46;

  v12 = v11;
  v18 = a3;
  v38 = a4;
  v41 = a5;
  v42 = a6;
  v40 = a7;
  v19 = a9;
  v20 = a10;
  v39 = a11;
  v21 = objc_msgSend(v20, "width");
  v22 = objc_msgSend(v20, "height");
  maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  v24 = objc_msgSend(v20, "width");
  v25 = objc_msgSend(v19, "width");
  v26 = objc_msgSend(v20, "height");
  v27 = objc_msgSend(v19, "height");
  v28.f32[0] = (float)(unint64_t)(v24 - 1) / (float)(unint64_t)(v25 - 1);
  v28.f32[1] = (float)(unint64_t)(v26 - 1) / (float)(unint64_t)(v27 - 1);
  v43[0] = v21;
  v43[1] = v22;
  v44 = (v21 + maxThreadExecutionWidth - 1) / maxThreadExecutionWidth * maxThreadExecutionWidth;
  __asm { FMOV            V1.2S, #1.0 }
  v45 = vdiv_f32(_D1, v28);
  v46 = v12;
  objc_msgSend(v18, "computeCommandEncoder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setComputePipelineState:", self->_computePipelines[5]);
  objc_msgSend(v34, "setTexture:atIndex:", v19, 0);
  objc_msgSend(v34, "setTexture:atIndex:", v38, 1);
  objc_msgSend(v34, "setTexture:atIndex:", v42, 2);
  objc_msgSend(v34, "setTexture:atIndex:", v41, 3);
  objc_msgSend(v34, "setTexture:atIndex:", v40, 4);
  objc_msgSend(v34, "setBuffer:offset:atIndex:", self->_Adiagb_buf[0], 0, 0);
  objc_msgSend(v34, "setBuffer:offset:atIndex:", self->_Ixy_buf[0], 0, 1);
  objc_msgSend(v34, "setBytes:length:atIndex:", v43, 32, 2);
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v34, self->_computePipelines[5], v21, v22);
  objc_msgSend(v34, "endEncoding");

  objc_msgSend(v18, "computeCommandEncoder");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setComputePipelineState:", self->_computePipelines[6]);
  objc_msgSend(v35, "setBuffer:offset:atIndex:", self->_Adiagb_buf[0], 0, 0);
  objc_msgSend(v35, "setBuffer:offset:atIndex:", self->_Ixy_buf[0], 0, 1);
  objc_msgSend(v35, "setBuffer:offset:atIndex:", self->_Adiagb_buf[1], 0, 2);
  objc_msgSend(v35, "setBuffer:offset:atIndex:", self->_Ixy_buf[1], 0, 3);
  objc_msgSend(v35, "setBytes:length:atIndex:", v43, 32, 4);
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v35, self->_computePipelines[6], v21, v22);
  objc_msgSend(v35, "endEncoding");

  objc_msgSend(v18, "computeCommandEncoder");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setComputePipelineState:", self->_computePipelines[7]);
  objc_msgSend(v36, "setBuffer:offset:atIndex:", self->_Adiagb_buf[1], 0, 0);
  objc_msgSend(v36, "setBuffer:offset:atIndex:", self->_Ixy_buf[1], 0, 1);
  objc_msgSend(v36, "setTexture:atIndex:", v19, 0);
  objc_msgSend(v36, "setTexture:atIndex:", v20, 1);
  objc_msgSend(v36, "setTexture:atIndex:", v39, 2);
  objc_msgSend(v36, "setBytes:length:atIndex:", v43, 32, 2);
  +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v36, self->_computePipelines[7], v21, v22);
  objc_msgSend(v36, "endEncoding");

  return 0;
}

- (void)_setupPipelines
{
  void *v3;
  void *v4;
  MTLDevice *device;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t maxThreadExecutionWidth;
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:subdirectory:", CFSTR("default"), CFSTR("metallib"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  device = self->_device;
  v15 = 0;
  v6 = (void *)-[MTLDevice newLibraryWithURL:error:](device, "newLibraryWithURL:error:", v4, &v15);
  v14 = v15;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", (&kKernelNames)[v7]);
    v10 = (void *)objc_msgSend(v6, "newFunctionWithName:", v9);

    v11 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v10, 0);
    objc_storeStrong((id *)&self->_computePipelines[v7], v11);
    v12 = objc_msgSend(v11, "threadExecutionWidth");
    maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v12 > maxThreadExecutionWidth)
      maxThreadExecutionWidth = objc_msgSend(v11, "threadExecutionWidth", v14);
    self->_maxThreadExecutionWidth = maxThreadExecutionWidth;

    ++v7;
    v8 = v10;
  }
  while (v7 != 9);

}

- (void)setPyramidSizes
{
  CGSize *pyramid_size;
  unsigned int v4;
  unint64_t v5;
  _QWORD *p_width;
  uint64_t v7;
  uint64_t v8;

  self->_pyramid_size[0].width = (double)self->_resX;
  pyramid_size = self->_pyramid_size;
  self->_pyramid_size[0].height = (double)self->_resY;
  if (self->_nscales >= 2)
  {
    v4 = 2;
    v5 = 1;
    do
    {
      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:");
      p_width = (_QWORD *)&pyramid_size[v5].width;
      *p_width = v7;
      p_width[1] = v8;
      v5 = v4++;
    }
    while (self->_nscales > v5);
  }
}

- (void)dealloc
{
  __CVBuffer *w_pxbuf;
  __CVBuffer *v4;
  __CVBuffer *v5;
  objc_super v6;

  w_pxbuf = self->_w_pxbuf;
  if (w_pxbuf)
    CVPixelBufferRelease(w_pxbuf);
  v4 = self->_uv_pxbuf[0];
  if (v4)
    CVPixelBufferRelease(v4);
  v5 = self->_uv_pxbuf[1];
  if (v5)
    CVPixelBufferRelease(v5);
  v6.receiver = self;
  v6.super_class = (Class)ADLKTOpticalFlow;
  -[ADLKTOpticalFlow dealloc](&v6, sel_dealloc);
}

- (BOOL)_setupBufferAndReturnErrorWithDevice:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t maxThreadExecutionWidth;
  size_t resX;
  size_t resY;
  const __CFDictionary *BufferAttributes;
  const __CFAllocator *v11;
  CVReturn v12;
  __CVBuffer *v13;
  uint64_t v14;
  uint64_t v15;
  MTLBuffer *v16;
  MTLBuffer *v17;
  uint64_t v18;
  MTLBuffer *v19;
  MTLBuffer *v20;
  size_t v21;
  size_t v22;
  const __CFDictionary *v23;
  CVReturn v24;
  __CVBuffer *v25;
  MTLBuffer *v26;
  MTLBuffer *v27;
  MTLBuffer *v28;
  MTLBuffer *v29;
  size_t v30;
  size_t v31;
  const __CFDictionary *v32;
  CVReturn v33;
  __CVBuffer *v34;
  unint64_t v35;
  double v36;
  MTLTexture **w_tex;
  MTLTexture *(*uv_tex)[10];
  double v39;
  MTLTexture *(*uv_u32_alias_tex)[10];
  unsigned int v41;
  double *p_width;
  uint64_t v43;
  MTLTexture *v44;
  uint64_t v45;
  MTLTexture *v46;
  MTLTexture *v47;
  uint64_t v48;
  MTLTexture *v49;
  uint64_t v50;
  MTLTexture **v51;
  MTLTexture *v52;
  MTLTexture *v53;
  uint64_t v54;
  MTLTexture **v55;
  MTLTexture *v56;
  double v57;
  double v58;
  BOOL v59;
  CGSize *pyramid_size;
  CVPixelBufferRef pixelBufferOut;

  v6 = a3;
  maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  if ((_DWORD)maxThreadExecutionWidth)
  {
    resX = self->_resX;
    resY = self->_resY;
    pixelBufferOut = 0;
    BufferAttributes = (const __CFDictionary *)getBufferAttributes();
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], resX, resY, 0x4C303068u, BufferAttributes, &pixelBufferOut);
    v13 = pixelBufferOut;
    if (v12)
      v13 = 0;
    self->_w_pxbuf = v13;
    if (v13)
    {
      v14 = ((int)maxThreadExecutionWidth + (int)resX - 1) / (int)maxThreadExecutionWidth * (int)maxThreadExecutionWidth;
      v15 = 8 * v14;
      v16 = (MTLBuffer *)objc_msgSend(v6, "newBufferWithLength:options:", 8 * v14 * self->_resY, 0);
      v17 = self->_Adiagb_buf[0];
      self->_Adiagb_buf[0] = v16;

      if (self->_Adiagb_buf[0])
      {
        v18 = 2 * v14;
        v19 = (MTLBuffer *)objc_msgSend(v6, "newBufferWithLength:options:", 2 * v14 * self->_resY, 0);
        v20 = self->_Ixy_buf[0];
        self->_Ixy_buf[0] = v19;

        if (self->_Ixy_buf[0])
        {
          v21 = self->_resX;
          v22 = self->_resY;
          pixelBufferOut = 0;
          v23 = (const __CFDictionary *)getBufferAttributes();
          v24 = CVPixelBufferCreate(v11, v21, v22, 0x32433068u, v23, &pixelBufferOut);
          v25 = pixelBufferOut;
          if (v24)
            v25 = 0;
          self->_uv_pxbuf[0] = v25;
          if (v25)
          {
            v26 = (MTLBuffer *)objc_msgSend(v6, "newBufferWithLength:options:", v15 * self->_resY, 0);
            v27 = self->_Adiagb_buf[1];
            self->_Adiagb_buf[1] = v26;

            if (self->_Adiagb_buf[1])
            {
              v28 = (MTLBuffer *)objc_msgSend(v6, "newBufferWithLength:options:", v18 * self->_resY, 0);
              v29 = self->_Ixy_buf[1];
              self->_Ixy_buf[1] = v28;

              if (self->_Ixy_buf[1])
              {
                v30 = self->_resX;
                v31 = self->_resY;
                pixelBufferOut = 0;
                v32 = (const __CFDictionary *)getBufferAttributes();
                v33 = CVPixelBufferCreate(v11, v30, v31, 0x32433068u, v32, &pixelBufferOut);
                v34 = pixelBufferOut;
                if (v33)
                  v34 = 0;
                self->_uv_pxbuf[1] = v34;
                if (v34)
                {
                  if (!self->_nscales)
                  {
                    v59 = 1;
                    goto LABEL_23;
                  }
                  v35 = 0;
                  v36 = (double)self->_resX;
                  pyramid_size = self->_pyramid_size;
                  w_tex = self->_w_tex;
                  uv_tex = self->_uv_tex;
                  v39 = (double)self->_resY;
                  uv_u32_alias_tex = self->_uv_u32_alias_tex;
                  v41 = 1;
                  while (1)
                  {
                    p_width = &pyramid_size[v35].width;
                    *p_width = v36;
                    p_width[1] = v39;
                    +[ADMetalUtils bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:", self->_w_pxbuf, 25, 0, self->_device, a4, v36, v39, pyramid_size);
                    v43 = objc_claimAutoreleasedReturnValue();
                    v44 = w_tex[v35];
                    w_tex[v35] = (MTLTexture *)v43;

                    if (!w_tex[v35])
                      break;
                    +[ADMetalUtils bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:", self->_uv_pxbuf[0], 65, 0, self->_device, a4, v36, v39);
                    v45 = objc_claimAutoreleasedReturnValue();
                    v46 = (*uv_tex)[v35];
                    (*uv_tex)[v35] = (MTLTexture *)v45;

                    v47 = (*uv_tex)[v35];
                    if (!v47)
                      break;
                    v48 = -[MTLTexture newTextureViewWithPixelFormat:](v47, "newTextureViewWithPixelFormat:", 53);
                    v49 = (*uv_u32_alias_tex)[v35];
                    (*uv_u32_alias_tex)[v35] = (MTLTexture *)v48;

                    +[ADMetalUtils bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:](ADMetalUtils, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:metalDevice:error:", self->_uv_pxbuf[1], 65, 0, self->_device, a4, v36, v39);
                    v50 = objc_claimAutoreleasedReturnValue();
                    v51 = &(*uv_tex)[v35];
                    v52 = v51[10];
                    v51[10] = (MTLTexture *)v50;

                    v53 = v51[10];
                    if (!v53)
                      break;
                    v54 = -[MTLTexture newTextureViewWithPixelFormat:](v53, "newTextureViewWithPixelFormat:", 53);
                    v55 = &(*uv_u32_alias_tex)[v35];
                    v56 = v55[10];
                    v55[10] = (MTLTexture *)v54;

                    +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v36, v39);
                    v36 = v57;
                    v39 = v58;
                    v35 = v41++;
                    v59 = 1;
                    if (self->_nscales <= v35)
                      goto LABEL_23;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v59 = 0;
LABEL_23:

  return v59;
}

- (ADLKTOpticalFlow)initWithDevice:(id)a3 inputSize:(CGSize)a4 scales:(unint64_t)a5
{
  double height;
  double width;
  id v9;
  id v10;
  _QWORD v12[2];
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  __int128 v17;
  uint64_t v18;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  +[ADLKTOpticalFlow defaultConfig](ADLKTOpticalFlow, "defaultConfig");
  v15 = a5;
  v12[0] = a5;
  v10 = v16;
  v12[1] = v10;
  v13 = v17;
  v14 = v18;
  if (self)
    self = -[ADLKTOpticalFlow initWithDevice:inputSize:config:](self, "initWithDevice:inputSize:config:", v9, v12, width, height);
  else

  return self;
}

- (ADLKTOpticalFlow)initWithDevice:(id)a3 inputSize:(CGSize)a4 config:(id *)a5
{
  double height;
  double width;
  id v10;
  ADLKTOpticalFlow *v11;
  ADLKTOpticalFlow *v12;
  ADLKTOpticalFlow *v13;
  unint64_t var0;
  unint64_t v15;
  unsigned int v16;
  void *v17;
  ADLKTOpticalFlow *v18;
  objc_super v20;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ADLKTOpticalFlow;
  v11 = -[ADLKTOpticalFlow init](&v20, sel_init);
  v12 = v11;
  v13 = v11;
  if (!v11)
    goto LABEL_6;
  v11->_resX = (int)width;
  v11->_resY = (int)height;
  var0 = a5->var0;
  v11->_nscales = a5->var0;
  if (var0)
  {
    v15 = 0;
    v16 = 1;
    do
    {
      objc_msgSend(a5->var1, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_nwarpings[v15] = objc_msgSend(v17, "unsignedIntValue");

      v15 = v16++;
    }
    while (v13->_nscales > v15);
  }
  v13->_useNonLocalRegularization = a5->var2;
  v13->_nlreg_radius = a5->var3;
  v13->_nlreg_padding = a5->var4;
  v13->_nlreg_sigma_l = a5->var5;
  v13->_nlreg_sigma_c = a5->var6;
  v13->_nlreg_sigma_w = a5->var7;
  objc_storeStrong((id *)&v12->_device, a3);
  -[ADLKTOpticalFlow _setupPipelines](v13, "_setupPipelines");
  -[ADLKTOpticalFlow setPyramidSizes](v13, "setPyramidSizes");
  if (!-[ADLKTOpticalFlow _setupBufferAndReturnErrorWithDevice:error:](v13, "_setupBufferAndReturnErrorWithDevice:error:", v13->_device, 0))v18 = 0;
  else
LABEL_6:
    v18 = v13;

  return v18;
}

- (int64_t)encodePyramidFeaturesToCommandBuffer:(id)a3 colorTexture:(id)a4 outPyramidsArray:(id)a5 outFeaturesArray:(id)a6 outDerivitiveArray:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  kdebug_trace();
  if (objc_msgSend(v13, "pixelFormat") == 80)
  {
    -[ADLKTOpticalFlow _createImagePyramidWithCommandBuffer:in_BGRATex:outPyramidsArray:error:](self, "_createImagePyramidWithCommandBuffer:in_BGRATex:outPyramidsArray:error:", v12, v13, v14, 0);
    if ((int)self->_nscales >= 1)
    {
      v17 = self->_nscales + 1;
      do
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", (v17 - 2));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", (v17 - 2));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADLKTOpticalFlow _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:", v12, v18, v19);

        objc_msgSend(v15, "objectAtIndexedSubscript:", (v17 - 2));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", (v17 - 2));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADLKTOpticalFlow _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:", v12, v20, v21);

        --v17;
      }
      while (v17 > 1);
    }
    v22 = 0;
  }
  else
  {
    v23 = objc_msgSend(v13, "pixelFormat");
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v23 == 53)
    {
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "MTLPixelFormatR32Uint support is temporarily disabled", buf, 2u);
      }
      v22 = -22952;
    }
    else
    {
      if (v24)
      {
        *(_DWORD *)buf = 134217984;
        v27 = objc_msgSend(v13, "pixelFormat");
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Not supported pixel format: %lu", buf, 0xCu);
      }
      v22 = -22951;
    }
  }
  kdebug_trace();

  return v22;
}

- (int64_t)encodeOpticalFlowSolverToCommandBuffer:(id)a3 currentFeaturesArray:(id)a4 currentDerivitiveArray:(id)a5 previousFeaturesArray:(id)a6 previousDerivitiveArray:(id)a7 currentPyramidsArray:(id)a8 outShiftMap:(id)a9
{
  id v15;
  unint64_t nscales;
  uint64_t v17;
  uint64_t v18;
  BOOL v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  unsigned int v27;
  MTLTexture *v29;
  MTLTexture *v30;
  MTLTexture *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  unsigned int i;
  MTLTexture *v38;
  MTLTexture *v39;
  MTLTexture *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  MTLTexture *v45;
  MTLTexture *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  id v52;
  unint64_t v53;
  MTLTexture **w_tex;
  MTLTexture *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  MTLTexture *v61;
  unsigned int *nwarpings;
  MTLTexture *(*uv_tex)[10];

  v15 = a3;
  v59 = a4;
  v58 = a5;
  v57 = a6;
  v56 = a7;
  v52 = a8;
  v55 = (MTLTexture *)a9;
  kdebug_trace();
  uv_tex = self->_uv_tex;
  v60 = v15;
  -[ADLKTOpticalFlow _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v15, self->_uv_pxbuf[self->_nscales + 1]);
  nscales = self->_nscales;
  if ((int)nscales >= 1)
  {
    v17 = 0;
    v61 = 0;
    nwarpings = self->_nwarpings;
    v53 = nscales - 1;
    w_tex = self->_w_tex;
    v18 = self->_nscales;
    __asm { FMOV            V8.2S, #1.0 }
    while (1)
    {
      v24 = v18 - 1;
      v25 = (v18 - 1);
      v26 = _D8;
      if (v18 != LODWORD(self->_nscales))
        v26 = COERCE_DOUBLE(vdiv_f32(vcvt_f32_f64((float64x2_t)self->_pyramid_size[v25]), vcvt_f32_f64((float64x2_t)self->_pyramid_size[v18])));
      v27 = nwarpings[v25];
      if (v27)
      {
        _ZF = v27 == 1 && (_DWORD)v18 == 1;
        if (!_ZF || (v29 = v55, self->_useNonLocalRegularization))
          v29 = uv_tex[v17 ^ 1][v25];
        v30 = v29;
        if (self->_useNonLocalRegularization && nwarpings[v25] == 1)
        {
          v31 = w_tex[v25];

          v61 = v31;
        }
        objc_msgSend(v59, "objectAtIndexedSubscript:", (v18 - 1));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", (v18 - 1));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndexedSubscript:", (v18 - 1));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectAtIndexedSubscript:", (v18 - 1));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADLKTOpticalFlow _doSolverWithCommandBuffer:currentFeatures:currentDerivitive:previousFeatures:previousDerivitive:scale:coeff:in_uv_tex:out_uv_tex:out_w_tex:](self, "_doSolverWithCommandBuffer:currentFeatures:currentDerivitive:previousFeatures:previousDerivitive:scale:coeff:in_uv_tex:out_uv_tex:out_w_tex:", v60, v32, v33, v34, v35, v18 - 1, v26, uv_tex[v17][v53], v30, v61);

        v17 ^= 1uLL;
        v36 = nwarpings[v25];
        if (v36 >= 2)
        {
          v51 = v18;
          for (i = 2; i <= v36; ++i)
          {
            if (i != v36 || (_DWORD)v24 || (v38 = v55, self->_useNonLocalRegularization))
              v38 = uv_tex[v17 ^ 1][v25];
            v39 = v38;
            if (self->_useNonLocalRegularization && i == nwarpings[v25])
            {
              v40 = w_tex[v25];

              v61 = v40;
            }
            objc_msgSend(v59, "objectAtIndexedSubscript:", v25);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectAtIndexedSubscript:", v25);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "objectAtIndexedSubscript:", v25);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectAtIndexedSubscript:", v25);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[ADLKTOpticalFlow _doSolverWithCommandBuffer:currentFeatures:currentDerivitive:previousFeatures:previousDerivitive:scale:coeff:in_uv_tex:out_uv_tex:out_w_tex:](self, "_doSolverWithCommandBuffer:currentFeatures:currentDerivitive:previousFeatures:previousDerivitive:scale:coeff:in_uv_tex:out_uv_tex:out_w_tex:", v60, v41, v42, v43, v44, v24, _D8, uv_tex[v17][v25], v39, v61);

            v17 ^= 1uLL;
            v36 = nwarpings[v25];
          }
          v53 = v25;
          v15 = v60;
          v18 = v51;
          if (!self->_useNonLocalRegularization)
            goto LABEL_3;
LABEL_31:
          v45 = uv_tex[v17 ^ 1][v25];
          if (!(_DWORD)v24)
          {
            v46 = v55;

            v45 = v46;
          }
          v47 = (void *)-[MTLTexture newTextureViewWithPixelFormat:](uv_tex[v17][v25], "newTextureViewWithPixelFormat:", 53);
          objc_msgSend(v52, "objectAtIndexedSubscript:", v25);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (void *)objc_msgSend(v48, "newTextureViewWithPixelFormat:", 53);

          -[ADLKTOpticalFlow _doNLRegularizationWithCommandBuffer:in_uv_tex:join_tex:w_tex:out_uv_tex:](self, "_doNLRegularizationWithCommandBuffer:in_uv_tex:join_tex:w_tex:out_uv_tex:", v60, v47, v49, v61, v45);
          v17 ^= 1uLL;
          v15 = v60;
          goto LABEL_3;
        }
        v53 = (v18 - 1);
        v15 = v60;
      }
      if (self->_useNonLocalRegularization)
        goto LABEL_31;
LABEL_3:
      v23 = v18 <= 1;
      v18 = v24;
      if (v23)
      {

        break;
      }
    }
  }
  kdebug_trace();

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_w_tex[9], 0);
  objc_storeStrong((id *)&self->_w_tex[8], 0);
  objc_storeStrong((id *)&self->_w_tex[7], 0);
  objc_storeStrong((id *)&self->_w_tex[6], 0);
  objc_storeStrong((id *)&self->_w_tex[5], 0);
  objc_storeStrong((id *)&self->_w_tex[4], 0);
  objc_storeStrong((id *)&self->_w_tex[3], 0);
  objc_storeStrong((id *)&self->_w_tex[2], 0);
  objc_storeStrong((id *)&self->_w_tex[1], 0);
  objc_storeStrong((id *)self->_w_tex, 0);
  objc_storeStrong((id *)&self->_Ixy_buf[1], 0);
  objc_storeStrong((id *)self->_Ixy_buf, 0);
  objc_storeStrong((id *)&self->_Adiagb_buf[1], 0);
  objc_storeStrong((id *)self->_Adiagb_buf, 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][9], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][8], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][7], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][6], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][5], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][4], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][3], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][2], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[1][1], 0);
  objc_storeStrong((id *)self->_uv_u32_alias_tex[1], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][9], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][8], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][7], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][6], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][5], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][4], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][3], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][2], 0);
  objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][1], 0);
  objc_storeStrong((id *)self->_uv_u32_alias_tex[0], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][9], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][8], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][7], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][6], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][5], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][4], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][3], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][2], 0);
  objc_storeStrong((id *)&self->_uv_tex[1][1], 0);
  objc_storeStrong((id *)self->_uv_tex[1], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][9], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][8], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][7], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][6], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][5], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][4], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][3], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][2], 0);
  objc_storeStrong((id *)&self->_uv_tex[0][1], 0);
  objc_storeStrong((id *)self->_uv_tex[0], 0);
  objc_storeStrong((id *)&self->_computePipelines[8], 0);
  objc_storeStrong((id *)&self->_computePipelines[7], 0);
  objc_storeStrong((id *)&self->_computePipelines[6], 0);
  objc_storeStrong((id *)&self->_computePipelines[5], 0);
  objc_storeStrong((id *)&self->_computePipelines[4], 0);
  objc_storeStrong((id *)&self->_computePipelines[3], 0);
  objc_storeStrong((id *)&self->_computePipelines[2], 0);
  objc_storeStrong((id *)&self->_computePipelines[1], 0);
  objc_storeStrong((id *)self->_computePipelines, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (CGSize)getNextPyramidLevelSize:(CGSize)a3
{
  int height;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  double v19;
  double v20;
  CGSize result;

  height = (int)a3.height;
  v4 = (int)a3.width & 1;
  if ((int)a3.width < 0)
    v4 = -v4;
  v5 = (int)a3.height & 1;
  if (height < 0)
    v5 = -v5;
  v6 = v4 + (int)a3.width;
  if (v6 >= 0)
    v7 = v4 + (int)a3.width;
  else
    v7 = v6 + 1;
  v8 = v7 >> 1;
  if (v8 >= 0)
    v9 = v8 & 1;
  else
    v9 = -(v8 & 1);
  v10 = v5 + height;
  if (v10 >= 0)
    v11 = v10;
  else
    v11 = v10 + 1;
  v12 = v11 >> 1;
  if (v12 >= 0)
    v13 = v12 & 1;
  else
    v13 = -(v12 & 1);
  v14 = v6 + 2 * v9;
  if (v14 + 1 >= 0)
    v15 = v14 + 1;
  else
    v15 = v14 + 2;
  v16 = v15 >> 1;
  v17 = v10 + 2 * v13;
  if (v17 + 1 >= 0)
    v18 = v17 + 1;
  else
    v18 = v17 + 2;
  v19 = (double)v16;
  v20 = (double)(v18 >> 1);
  result.height = v20;
  result.width = v19;
  return result;
}

+ (unsigned)MaxScales
{
  return 10;
}

+ ($9F5C386A951B3C504AD39AFD20B040BC)defaultConfig
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  $9F5C386A951B3C504AD39AFD20B040BC *result;

  v4 = +[ADLKTOpticalFlow defaultConfig]::defaultConfig;
  if (!+[ADLKTOpticalFlow defaultConfig]::defaultConfig)
  {
    v5 = operator new();
    +[ADLKTOpticalFlow defaultConfig]::defaultConfig = v5;
    *(_BYTE *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 20) = 0x100000002;
    *(_QWORD *)(v5 + 28) = 0x4040000040C00000;
    *(_DWORD *)(v5 + 36) = 1048576000;
    *(_QWORD *)v5 = 5;
    *(_QWORD *)(v5 + 8) = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8);
    *(_QWORD *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8) = v6;

    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434EC0, 0);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434ED8, 1);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434EF0, 2);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434F08, 3);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434F08, 4);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434F08, 5);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434F08, 6);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434F08, 7);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434F08, 8);
    objc_msgSend(*(id *)(+[ADLKTOpticalFlow defaultConfig]::defaultConfig + 8), "setObject:atIndexedSubscript:", &unk_24C434F08, 9);
    v4 = +[ADLKTOpticalFlow defaultConfig]::defaultConfig;
  }
  v8 = *(void **)(v4 + 8);
  retstr->var0 = *(_QWORD *)v4;
  result = v8;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)(v4 + 16);
  *(_QWORD *)&retstr->var6 = *(_QWORD *)(v4 + 32);
  return result;
}

@end
