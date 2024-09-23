@implementation VNLKTOpticalFlowGPU

- (VNLKTOpticalFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 numScales:(int)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v13;
  VNLKTOpticalFlowGPU *v14;
  VNLKTOpticalFlowGPU *v15;
  uint64_t v16;
  MTLCommandQueue *commandQueue;
  VNLKTOpticalFlowGPU *v18;
  objc_super v20;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v13 = (os_unfair_lock_s *)a3;
  v20.receiver = self;
  v20.super_class = (Class)VNLKTOpticalFlowGPU;
  v14 = -[VNLKTOpticalFlow initWithWidth:height:numScales:](&v20, sel_initWithWidth_height_numScales_, v10, v9, v8);
  v15 = v14;
  if (!v14)
    goto LABEL_5;
  v14->_current_frame_index = 0;
  objc_storeStrong((id *)&v14->_mtlContext, a3);
  -[VNMetalContext commandQueueReturnError:](v13, a7);
  v16 = objc_claimAutoreleasedReturnValue();
  commandQueue = v15->_commandQueue;
  v15->_commandQueue = (MTLCommandQueue *)v16;

  if (!v15->_commandQueue)
    goto LABEL_6;
  -[VNLKTOpticalFlowGPU _initMemory:height:numScales:](v15, "_initMemory:height:numScales:", v10, v9, v8);
  if (-[VNLKTOpticalFlowGPU _setupPipelinesReturnError:](v15, "_setupPipelinesReturnError:", a7)
    && -[VNLKTOpticalFlowGPU _setupBufferAndReturnError:](v15, "_setupBufferAndReturnError:", a7))
  {
LABEL_5:
    v18 = v15;
  }
  else
  {
LABEL_6:
    v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_G0_pxbuf);
  CVPixelBufferRelease(self->_G1_pxbuf);
  CVPixelBufferRelease(self->_C0_pxbuf);
  CVPixelBufferRelease(self->_C1_pxbuf);
  CVPixelBufferRelease(self->_w_pxbuf);
  CVPixelBufferRelease(self->_uv_pxbuf[0]);
  CVPixelBufferRelease(self->_uv_pxbuf[1]);
  v3.receiver = self;
  v3.super_class = (Class)VNLKTOpticalFlowGPU;
  -[VNLKTOpticalFlowGPU dealloc](&v3, sel_dealloc);
}

- (void)waitUntilCompleted
{
  id v2;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", CFSTR("LKT:waitUntilCompleted"));
  objc_msgSend(v2, "commit");
  objc_msgSend(v2, "waitUntilCompleted");

}

- (BOOL)setOutputUV:(__CVBuffer *)a3 error:(id *)a4
{
  OSType PixelFormatType;
  uint64_t v8;
  MTLTexture *uv_tex_user_ref;
  BOOL v10;
  void *v11;

  if (!a3)
  {
    uv_tex_user_ref = self->_uv_tex_user_ref;
    self->_uv_tex_user_ref = 0;

    -[VNLKTOpticalFlow setIsValid:](self, "setIsValid:", 0);
    return 1;
  }
  if (!-[VNLKTOpticalFlow _validateOutputImage:error:](self, "_validateOutputImage:error:"))
    return 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 843264104)
  {
    v8 = 65;
    goto LABEL_8;
  }
  if (PixelFormatType != 843264102)
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unhandled metal pixel format"));
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    return 0;
  }
  v8 = 105;
LABEL_8:
  -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, a3, v8, a4, self->_pyramid_size[0].width, self->_pyramid_size[0].height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11 != 0;
  if (v11)
  {
    objc_storeStrong((id *)&self->_uv_tex_user_ref, v11);
    -[VNLKTOpticalFlow setIsValid:](self, "setIsValid:", 1);
  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Could not bind pixel buffer to texture"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4 error:(id *)a5
{
  int v9;
  void *v10;
  BOOL result;
  id v12;

  if (-[VNLKTOpticalFlow isValid](self, "isValid"))
  {
    v9 = -[VNLKTOpticalFlow numScales](self, "numScales");
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLabel:", CFSTR("LKT::Pyramid"));
    -[VNLKTOpticalFlowGPU _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v10, self->_uv_pxbuf[v9 + 1]);
    if (-[VNLKTOpticalFlowGPU _createImagePyramidWithCommandBuffer:in_pixelbuf:I_idx:error:](self, "_createImagePyramidWithCommandBuffer:in_pixelbuf:I_idx:error:", v10, a3, 0, a5)&& -[VNLKTOpticalFlowGPU _createImagePyramidWithCommandBuffer:in_pixelbuf:I_idx:error:](self, "_createImagePyramidWithCommandBuffer:in_pixelbuf:I_idx:error:", v10, a4, 1, a5))
    {
      objc_msgSend(v10, "commit");

      self->_current_frame_index = 0;
      -[VNLKTOpticalFlowGPU _computeOpticalFlow](self, "_computeOpticalFlow");
      return 1;
    }

  }
  else if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Optical flow estimation invalid state"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a5 = v12;
    return result;
  }
  return 0;
}

- (BOOL)estimateFlowStream:(__CVBuffer *)a3 error:(id *)a4
{
  int v7;
  void *v8;
  BOOL result;
  id v10;

  if (-[VNLKTOpticalFlow isValid](self, "isValid"))
  {
    v7 = -[VNLKTOpticalFlow numScales](self, "numScales");
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLabel:", CFSTR("LKT::Pyramid"));
    -[VNLKTOpticalFlowGPU _zeroFlowWithCommandBuffer:uv_tex:](self, "_zeroFlowWithCommandBuffer:uv_tex:", v8, self->_uv_pxbuf[v7 + 1]);
    if (-[VNLKTOpticalFlowGPU _createImagePyramidWithCommandBuffer:in_pixelbuf:I_idx:error:](self, "_createImagePyramidWithCommandBuffer:in_pixelbuf:I_idx:error:", v8, a3, self->_current_frame_index, a4))
    {
      objc_msgSend(v8, "commit");

      self->_current_frame_index ^= 1u;
      -[VNLKTOpticalFlowGPU _computeOpticalFlow](self, "_computeOpticalFlow");
      return 1;
    }

  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Optical flow estimation invalid state"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v10;
    return result;
  }
  return 0;
}

- (void)_initMemory:(int)a3 height:(int)a4 numScales:(int)a5
{
  MTLTexture *uv_tex_user_ref;

  self->_maxThreadExecutionWidth = 0;
  self->_G0_pxbuf = 0;
  self->_G1_pxbuf = 0;
  self->_C0_pxbuf = 0;
  self->_C1_pxbuf = 0;
  self->_w_pxbuf = 0;
  uv_tex_user_ref = self->_uv_tex_user_ref;
  self->_uv_tex_user_ref = 0;

  self->_uv_pxbuf[0] = 0;
  self->_uv_pxbuf[1] = 0;
}

- (BOOL)_setupPipelinesReturnError:(id *)a3
{
  void *v4;
  VNMetalContext *mtlContext;
  VNMetalContext *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t maxThreadExecutionWidth;

  -[VNMetalContext libraryReturnError:]((os_unfair_lock_s *)self->_mtlContext, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    mtlContext = self->_mtlContext;
    if (mtlContext)
      mtlContext = (VNMetalContext *)mtlContext->_device;
    v6 = mtlContext;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", kKernelNames[v7]);
      v10 = (void *)objc_msgSend(v4, "newFunctionWithName:", v9);

      v11 = (void *)-[VNMetalContext newComputePipelineStateWithFunction:error:](v6, "newComputePipelineStateWithFunction:error:", v10, 0);
      objc_storeStrong((id *)&self->_computePipelines[v7], v11);
      v12 = objc_msgSend(v11, "threadExecutionWidth");
      maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
      if (v12 > maxThreadExecutionWidth)
        maxThreadExecutionWidth = objc_msgSend(v11, "threadExecutionWidth");
      self->_maxThreadExecutionWidth = maxThreadExecutionWidth;

      ++v7;
      v8 = v10;
    }
    while (v7 != 9);

  }
  return v4 != 0;
}

- (BOOL)_setupBufferAndReturnError:(id *)a3
{
  int maxThreadExecutionWidth;
  int v6;
  int v7;
  int v8;
  size_t v9;
  size_t v10;
  __CVBuffer *v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  int v16;
  VNMetalContext *mtlContext;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  MTLBuffer *v23;
  MTLBuffer *v24;
  MTLBuffer *v25;
  MTLBuffer *v26;
  __CVBuffer *v27;
  int v28;
  uint64_t v29;
  CGSize *pyramid_size;
  int v31;
  double v32;
  double v33;
  double *p_width;
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
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  MTLTexture **v49;
  MTLTexture *v50;
  MTLTexture *v51;
  uint64_t v52;
  MTLTexture **v53;
  MTLTexture *v54;
  void *v55;
  MTLTexture *v56;
  MTLTexture *v57;
  uint64_t v58;
  char *v59;
  void *v60;
  MTLTexture *v61;
  MTLTexture *v62;
  uint64_t v63;
  char *v64;
  void *v65;
  int v66;
  int v67;
  BOOL v68;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  VNMetalContext *v75;

  maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  if (!maxThreadExecutionWidth)
    return 0;
  v6 = -[VNLKTOpticalFlow width](self, "width");
  v7 = -[VNLKTOpticalFlow height](self, "height");
  v8 = -[VNLKTOpticalFlow numScales](self, "numScales");
  v9 = v6;
  v10 = v7;
  v11 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 843264104, a3);
  self->_G0_pxbuf = v11;
  if (!v11)
    return 0;
  v74 = v8;
  v12 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 843264104, a3);
  self->_G1_pxbuf = v12;
  if (!v12)
    return 0;
  v13 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 1380411457, a3);
  self->_C0_pxbuf = v13;
  if (!v13)
    return 0;
  v14 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 1380411457, a3);
  self->_C1_pxbuf = v14;
  if (!v14)
    return 0;
  v15 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v6, v7, 1278226536, a3);
  self->_w_pxbuf = v15;
  if (!v15)
    return 0;
  v16 = (maxThreadExecutionWidth + v6 - 1) / maxThreadExecutionWidth * maxThreadExecutionWidth;
  mtlContext = self->_mtlContext;
  v72 = v6;
  if (mtlContext)
    mtlContext = (VNMetalContext *)mtlContext->_device;
  v75 = mtlContext;
  v18 = 0;
  v70 = v7;
  v19 = 8 * v16 * v7;
  v20 = 2 * v16 * v7;
  v21 = 1;
  do
  {
    v22 = v21;
    v23 = (MTLBuffer *)-[VNMetalContext newBufferWithLength:options:](v75, "newBufferWithLength:options:", v19, 0);
    v24 = self->_Adiagb_buf[v18];
    self->_Adiagb_buf[v18] = v23;

    if (!self->_Adiagb_buf[v18]
      || (v25 = (MTLBuffer *)-[VNMetalContext newBufferWithLength:options:](v75, "newBufferWithLength:options:", v20, 0), v26 = self->_Ixy_buf[v18], self->_Ixy_buf[v18] = v25, v26, !self->_Ixy_buf[v18]))
    {
      if (a3)
      {
        +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
        v68 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    v27 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v9, v10, 843264104, a3);
    self->_uv_pxbuf[v18] = v27;
    if (!v27)
      goto LABEL_34;
    v21 = 0;
    v18 = 1;
  }
  while ((v22 & 1) != 0);
  v28 = v72;
  if (v74 >= 1)
  {
    v29 = 0;
    pyramid_size = self->_pyramid_size;
    v31 = v70;
LABEL_16:
    v32 = (double)v28;
    v71 = v31;
    v33 = (double)v31;
    p_width = &pyramid_size[v29].width;
    *p_width = (double)v28;
    p_width[1] = (double)v31;
    -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_G0_pxbuf, 65, a3, (double)v28, (double)v31);
    v35 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v36 = self->_G0_tex[v29];
    self->_G0_tex[v29] = v35;

    if (self->_G0_tex[v29])
    {
      -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_G1_pxbuf, 65, a3, (double)v28, (double)v31);
      v37 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v38 = self->_G1_tex[v29];
      self->_G1_tex[v29] = v37;

      if (self->_G1_tex[v29])
      {
        -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_C0_pxbuf, 115, a3, (double)v28, (double)v31);
        v39 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v40 = self->_C0_tex[v29];
        self->_C0_tex[v29] = v39;

        if (self->_C0_tex[v29])
        {
          -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_C1_pxbuf, 115, a3, (double)v28, (double)v31);
          v41 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          v42 = self->_C1_tex[v29];
          self->_C1_tex[v29] = v41;

          if (self->_C1_tex[v29])
          {
            v73 = v28;
            -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_w_pxbuf, 25, a3, (double)v28, (double)v31);
            v43 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
            v44 = self->_w_tex[v29];
            self->_w_tex[v29] = v43;

            if (self->_w_tex[v29])
            {
              v45 = 0;
              v46 = 1;
              while (1)
              {
                v47 = v46;
                -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:error:](self->_mtlContext, self->_uv_pxbuf[v45], 65, a3, v32, v33);
                v48 = objc_claimAutoreleasedReturnValue();
                v49 = self->_uv_tex[v45];
                v50 = v49[v29];
                v49[v29] = (MTLTexture *)v48;

                v51 = v49[v29];
                if (!v51)
                  break;
                v52 = -[MTLTexture newTextureViewWithPixelFormat:](v51, "newTextureViewWithPixelFormat:", 53);
                v53 = self->_uv_u32_alias_tex[v45];
                v54 = v53[v29];
                v53[v29] = (MTLTexture *)v52;

                v46 = 0;
                v45 = 1;
                if ((v47 & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, v73, v71, 0);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "setUsage:", 19);
                  v56 = (MTLTexture *)-[VNMetalContext newTextureWithDescriptor:](v75, "newTextureWithDescriptor:", v55);
                  v57 = self->_I_tex[0][v29];
                  self->_I_tex[0][v29] = v56;

                  v58 = -[VNMetalContext newTextureWithDescriptor:](v75, "newTextureWithDescriptor:", v55);
                  v59 = (char *)self->_I_tex + 8 * v29;
                  v60 = (void *)*((_QWORD *)v59 + 10);
                  v59 += 80;
                  *(_QWORD *)v59 = v58;

                  v61 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:](self->_I_tex[0][v29], "newTextureViewWithPixelFormat:", 53);
                  v62 = self->_I_u32_alias_tex[0][v29];
                  self->_I_u32_alias_tex[0][v29] = v61;

                  v63 = objc_msgSend(*(id *)v59, "newTextureViewWithPixelFormat:", 53);
                  v64 = (char *)self->_I_u32_alias_tex + 8 * v29;
                  v65 = (void *)*((_QWORD *)v64 + 10);
                  *((_QWORD *)v64 + 10) = v63;

                  v66 = v73 + 2;
                  if (v73 >= -1)
                    v66 = v73 + 1;
                  v67 = v71 + 2;
                  if (v71 >= -1)
                    v67 = v71 + 1;
                  v28 = ((v66 >> 1) & 1) + (v66 >> 1);
                  v31 = ((v67 >> 1) & 1) + (v67 >> 1);

                  ++v29;
                  v68 = 1;
                  pyramid_size = self->_pyramid_size;
                  if (v29 != v74)
                    goto LABEL_16;
                  goto LABEL_35;
                }
              }
            }
          }
        }
      }
    }
LABEL_34:
    v68 = 0;
    goto LABEL_35;
  }
  v68 = 1;
LABEL_35:

  return v68;
}

- (void)_computeOpticalFlow
{
  int v3;
  int v4;
  BOOL v5;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v15;
  int v16;
  double v17;
  double v18;
  float64x2_t *v19;
  float32x2_t v20;
  float32x2_t v21;
  void *v22;
  int v23;
  MTLTexture *v24;
  MTLTexture *v25;
  char v27;
  MTLTexture **p_uv_tex_user_ref;
  MTLTexture *v29;
  char v30;
  MTLTexture *v31;
  void *v32;
  MTLTexture **v33;
  MTLTexture *v34;
  uint64_t v36;
  MTLTexture *(*I_tex)[10];
  MTLTexture *v38;
  MTLTexture *v39;
  char v40;
  id v41;

  v3 = -[VNLKTOpticalFlow numScales](self, "numScales");
  v4 = -[VNLKTOpticalFlow numWarpings](self, "numWarpings");
  v5 = -[VNLKTOpticalFlow useNonLocalRegularization](self, "useNonLocalRegularization");
  _VF = __OFSUB__(v3, 1);
  v7 = (v3 - 1);
  if ((int)v7 < 0 == _VF)
  {
    v8 = v5;
    v9 = 0;
    v10 = 0;
    I_tex = self->_I_tex;
    v40 = !v5;
    __asm
    {
      FMOV            V10.2S, #1.0
      FMOV            V11.2S, #-1.0
    }
    v15 = v7;
    v16 = v7;
    v36 = v7;
    do
    {
      v39 = I_tex[self->_current_frame_index][v15];
      v38 = I_tex[self->_current_frame_index ^ 1][v15];
      v17 = _D10;
      v18 = _D10;
      if (v15 != v7)
      {
        v19 = (float64x2_t *)&self->_pyramid_size[v15];
        v20 = vcvt_f32_f64(*v19);
        v21 = vcvt_f32_f64(v19[1]);
        v18 = COERCE_DOUBLE(vdiv_f32(v20, v21));
        v17 = COERCE_DOUBLE(vdiv_f32(vadd_f32(v21, _D11), vadd_f32(v20, _D11)));
      }
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v41 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LKT:ComputeFlow level %d"), v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setLabel:", v22);

      -[VNLKTOpticalFlowGPU _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:");
      -[VNLKTOpticalFlowGPU _computeFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesWithCommandBuffer:in_tex:out_tex:");
      -[VNLKTOpticalFlowGPU _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:");
      -[VNLKTOpticalFlowGPU _computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_computeFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:");
      v23 = v4;
      if (v4 < 1)
      {
        v25 = 0;
        v29 = 0;
      }
      else
      {
        v24 = 0;
        v25 = 0;
        do
        {
          if (v15)
            _ZF = 0;
          else
            _ZF = v23 == 1;
          if (_ZF)
            v27 = v8;
          else
            v27 = 1;
          if ((v27 & 1) != 0)
            p_uv_tex_user_ref = &self->_uv_tex[v10 ^ 1][v15];
          else
            p_uv_tex_user_ref = &self->_uv_tex_user_ref;
          v29 = *p_uv_tex_user_ref;

          v30 = v40;
          if (v23 != 1)
            v30 = 1;
          if ((v30 & 1) == 0)
          {
            v31 = self->_w_tex[v15];

            v25 = v31;
          }
          -[VNLKTOpticalFlowGPU _doSolverWithCommandBuffer:scale:scale_xy_inv:coeff:in_uv_tex:out_uv_tex:out_w_tex:](self, "_doSolverWithCommandBuffer:scale:scale_xy_inv:coeff:in_uv_tex:out_uv_tex:out_w_tex:", v41, v15, self->_uv_tex[v10][v16], v29, v25, v17, v18);
          v10 ^= 1uLL;
          v24 = v29;
          v18 = _D10;
          v17 = _D10;
          v16 = v15;
          --v23;
        }
        while (v23);
        v16 = v15;
      }
      v7 = v36;
      v32 = v41;
      if ((v8 & 1) != 0)
      {
        if (v15)
          v33 = &self->_uv_tex[v10 ^ 1][v15];
        else
          v33 = &self->_uv_tex_user_ref;
        v34 = *v33;

        -[VNLKTOpticalFlowGPU _doNLRegularizationWithCommandBuffer:in_uv_tex:join_tex:w_tex:out_uv_tex:](self, "_doNLRegularizationWithCommandBuffer:in_uv_tex:join_tex:w_tex:out_uv_tex:", v41, self->_uv_u32_alias_tex[v10][v15], self->_I_u32_alias_tex[self->_current_frame_index][v15], v25, v34);
        v10 ^= 1uLL;
        v32 = v41;
      }
      else
      {
        v34 = v29;
      }
      objc_msgSend(v32, "commit");

      v9 = v41;
    }
    while (v15-- > 0);

  }
}

- (BOOL)_createImagePyramidWithCommandBuffer:(id)a3 in_pixelbuf:(__CVBuffer *)a4 I_idx:(int)a5 error:(id *)a6
{
  id v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  MTLTexture **v20;
  _QWORD v22[3];
  _QWORD v23[3];

  v10 = a3;
  v11 = -[VNLKTOpticalFlow width](self, "width");
  v12 = -[VNLKTOpticalFlow height](self, "height");
  -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](self->_mtlContext, a4, 80, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "computeCommandEncoder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setComputePipelineState:", self->_computePipelines[0]);
    objc_msgSend(v14, "setTexture:atIndex:", v13, 0);
    objc_msgSend(v14, "setTexture:atIndex:", self->_I_tex[a5][0], 1);
    v15 = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[0], "threadExecutionWidth");
    v16 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[0], "maxTotalThreadsPerThreadgroup");
    v23[0] = (v11 + v15 - 1) / v15;
    v23[1] = (v12 + v16 / v15 - 1) / (v16 / v15);
    v23[2] = 1;
    v22[0] = v15;
    v22[1] = v16 / v15;
    v22[2] = 1;
    objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v23, v22);
    objc_msgSend(v14, "endEncoding");

    v17 = -[VNLKTOpticalFlow numScales](self, "numScales");
    if (v17 >= 2)
    {
      v18 = a5;
      v19 = v17 - 1;
      v20 = &self->_I_u32_alias_tex[v18][1];
      do
      {
        -[VNLKTOpticalFlowGPU _downscale2XWithCommandBuffer:in_u32_alias_tex:out_u32_alias_tex:](self, "_downscale2XWithCommandBuffer:in_u32_alias_tex:out_u32_alias_tex:", v10, *(v20 - 1), *v20);
        ++v20;
        --v19;
      }
      while (v19);
    }
  }

  return v13 != 0;
}

- (void)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  _QWORD v10[3];
  _QWORD v11[3];

  v6 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComputePipelineState:", self->_computePipelines[1]);
  objc_msgSend(v7, "setTexture:atIndex:", v6, 0);
  v8 = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[1], "threadExecutionWidth");
  v9 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[1], "maxTotalThreadsPerThreadgroup");
  v11[0] = (v8 + -[VNLKTOpticalFlow width](self, "width") - 1) / v8;
  v11[1] = (v9 / v8 + -[VNLKTOpticalFlow height](self, "height") - 1) / (v9 / v8);
  v11[2] = 1;
  v10[0] = v8;
  v10[1] = v9 / v8;
  v10[2] = 1;
  objc_msgSend(v7, "dispatchThreadgroups:threadsPerThreadgroup:", v11, v10);
  objc_msgSend(v7, "endEncoding");

}

- (void)_downscale2XWithCommandBuffer:(id)a3 in_u32_alias_tex:(id)a4 out_u32_alias_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MTLComputePipelineState **computePipelines;
  _QWORD v12[3];
  _QWORD v13[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  computePipelines = self->_computePipelines;
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[2]);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  LODWORD(self) = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[2], "threadExecutionWidth");
  LODWORD(computePipelines) = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](computePipelines[2], "maxTotalThreadsPerThreadgroup");
  v13[0] = (int)((_DWORD)self + objc_msgSend(v9, "width") - 1) / (int)self;
  v13[1] = (int)((int)computePipelines / (int)self + objc_msgSend(v9, "height") - 1)
         / ((int)computePipelines
          / (int)self);
  v13[2] = 1;
  v12[0] = (int)self;
  v12[1] = (int)computePipelines / (int)self;
  v12[2] = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, v12);
  objc_msgSend(v10, "endEncoding");

}

- (void)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MTLComputePipelineState **computePipelines;
  _QWORD v12[3];
  _QWORD v13[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  computePipelines = self->_computePipelines;
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[3]);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  LODWORD(self) = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[3], "threadExecutionWidth");
  LODWORD(computePipelines) = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](computePipelines[3], "maxTotalThreadsPerThreadgroup");
  v13[0] = (int)((_DWORD)self + objc_msgSend(v8, "width") - 1) / (int)self;
  v13[1] = (int)((int)computePipelines / (int)self + objc_msgSend(v8, "height") - 1)
         / ((int)computePipelines
          / (int)self);
  v13[2] = 1;
  v12[0] = (int)self;
  v12[1] = (int)computePipelines / (int)self;
  v12[2] = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, v12);
  objc_msgSend(v10, "endEncoding");

}

- (void)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  MTLComputePipelineState **computePipelines;
  _QWORD v12[3];
  _QWORD v13[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  computePipelines = self->_computePipelines;
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[4]);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  LODWORD(self) = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[4], "threadExecutionWidth");
  LODWORD(computePipelines) = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](computePipelines[4], "maxTotalThreadsPerThreadgroup");
  v13[0] = (int)((_DWORD)self + objc_msgSend(v8, "width") - 1) / (int)self;
  v13[1] = (int)((int)computePipelines / (int)self + objc_msgSend(v8, "height") - 1)
         / ((int)computePipelines
          / (int)self);
  v13[2] = 1;
  v12[0] = (int)self;
  v12[1] = (int)computePipelines / (int)self;
  v12[2] = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, v12);
  objc_msgSend(v10, "endEncoding");

}

- (void)_doSolverWithCommandBuffer:(VNLKTOpticalFlowGPU *)self scale:(SEL)a2 scale_xy_inv:(id)a3 coeff:(int)a4 in_uv_tex:(id)a5 out_uv_tex:(id)a6 out_w_tex:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  id v16;
  id v17;
  int maxThreadExecutionWidth;
  int32x2_t v19;
  __int32 v20;
  void *v21;
  id *computePipelines;
  MTLBuffer **Adiagb_buf;
  MTLBuffer **Ixy_buf;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  __int32 v30;
  id v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[6];

  v12 = v8;
  v13 = v7;
  v16 = a3;
  v17 = a5;
  v32 = a6;
  v31 = a7;
  maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  v19 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_pyramid_size[a4]));
  v20 = v19.i32[0] - 1;
  v30 = v19.i32[1];
  v39[0] = v19;
  v39[1] = ((v19.i32[0] - 1 + maxThreadExecutionWidth) / maxThreadExecutionWidth * maxThreadExecutionWidth);
  v39[2] = v13;
  v39[3] = v12;
  objc_msgSend(v16, "computeCommandEncoder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  computePipelines = (id *)self->_computePipelines;
  objc_msgSend(v21, "setComputePipelineState:", self->_computePipelines[5]);
  objc_msgSend(v21, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v21, "setTexture:atIndex:", self->_G0_tex[a4], 1);
  objc_msgSend(v21, "setTexture:atIndex:", self->_G1_tex[a4], 2);
  objc_msgSend(v21, "setTexture:atIndex:", self->_C0_tex[a4], 3);
  objc_msgSend(v21, "setTexture:atIndex:", self->_C1_tex[a4], 4);
  Adiagb_buf = self->_Adiagb_buf;
  objc_msgSend(v21, "setBuffer:offset:atIndex:", self->_Adiagb_buf[0], 0, 0);
  Ixy_buf = self->_Ixy_buf;
  objc_msgSend(v21, "setBuffer:offset:atIndex:", self->_Ixy_buf[0], 0, 1);
  objc_msgSend(v21, "setBytes:length:atIndex:", v39, 32, 2);
  LODWORD(self) = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[5], "threadExecutionWidth");
  v25 = objc_msgSend(computePipelines[5], "maxTotalThreadsPerThreadgroup");
  v38[0] = (v20 + (int)self) / (int)self;
  v38[1] = (v30 - 1 + v25 / (int)self) / (v25 / (int)self);
  v38[2] = 1;
  v37[0] = (int)self;
  v37[1] = v25 / (int)self;
  v37[2] = 1;
  objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", v38, v37);
  objc_msgSend(v21, "endEncoding");

  objc_msgSend(v16, "computeCommandEncoder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setComputePipelineState:", computePipelines[6]);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", *Adiagb_buf, 0, 0);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", *Ixy_buf, 0, 1);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", Adiagb_buf[1], 0, 2);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", Ixy_buf[1], 0, 3);
  objc_msgSend(v26, "setBytes:length:atIndex:", v39, 32, 4);
  LODWORD(self) = objc_msgSend(computePipelines[6], "threadExecutionWidth");
  v27 = objc_msgSend(computePipelines[6], "maxTotalThreadsPerThreadgroup");
  v36[0] = (v20 + (int)self) / (int)self;
  v36[1] = (v30 - 1 + v27 / (int)self) / (v27 / (int)self);
  v36[2] = 1;
  v35[0] = (int)self;
  v35[1] = v27 / (int)self;
  v35[2] = 1;
  objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", v36, v35);
  objc_msgSend(v26, "endEncoding");

  objc_msgSend(v16, "computeCommandEncoder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setComputePipelineState:", computePipelines[7]);
  objc_msgSend(v28, "setBuffer:offset:atIndex:", Adiagb_buf[1], 0, 0);
  objc_msgSend(v28, "setBuffer:offset:atIndex:", Ixy_buf[1], 0, 1);
  objc_msgSend(v28, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v28, "setTexture:atIndex:", v32, 1);
  objc_msgSend(v28, "setTexture:atIndex:", v31, 2);
  objc_msgSend(v28, "setBytes:length:atIndex:", v39, 32, 2);
  LODWORD(self) = objc_msgSend(computePipelines[7], "threadExecutionWidth");
  v29 = objc_msgSend(computePipelines[7], "maxTotalThreadsPerThreadgroup");
  v34[0] = (v20 + (int)self) / (int)self;
  v34[1] = (v30 - 1 + v29 / (int)self) / (v29 / (int)self);
  v34[2] = 1;
  v33[0] = (int)self;
  v33[1] = v29 / (int)self;
  v33[2] = 1;
  objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", v34, v33);
  objc_msgSend(v28, "endEncoding");

}

- (void)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  float v17;
  float v18;
  float v19;
  float v20;
  unsigned int v21;
  __int128 v22;
  unsigned int v23;
  void *v29;
  MTLComputePipelineState **computePipelines;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  unsigned int v38;
  _QWORD v39[3];
  _QWORD v40[3];
  int v41;
  uint64_t v42;
  int v43;
  __int128 v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v43 = 0;
  v41 = -[VNLKTOpticalFlow nlreg_radius](self, "nlreg_radius");
  v42 = -[VNLKTOpticalFlow nlreg_padding](self, "nlreg_padding");
  -[VNLKTOpticalFlow nlreg_sigma_l](self, "nlreg_sigma_l");
  v18 = v17;
  -[VNLKTOpticalFlow nlreg_sigma_c](self, "nlreg_sigma_c");
  v20 = v19;
  -[VNLKTOpticalFlow nlreg_sigma_c](self, "nlreg_sigma_c");
  v38 = v21;
  -[VNLKTOpticalFlow nlreg_sigma_w](self, "nlreg_sigma_w");
  *(float *)&v22 = 1.0 / (float)(v18 + v18);
  __asm { FMOV            V3.2S, #1.0 }
  *((float *)&v22 + 1) = 1.0 / (float)(v20 + v20);
  *((float32x2_t *)&v22 + 1) = vdiv_f32(_D3, vadd_f32((float32x2_t)__PAIR64__(v23, v38), (float32x2_t)__PAIR64__(v23, v38)));
  v44 = v22;
  objc_msgSend(v12, "computeCommandEncoder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  computePipelines = self->_computePipelines;
  objc_msgSend(v29, "setComputePipelineState:", self->_computePipelines[8]);
  objc_msgSend(v29, "setTexture:atIndex:", v13, 0);
  objc_msgSend(v29, "setTexture:atIndex:", v14, 1);
  objc_msgSend(v29, "setTexture:atIndex:", v15, 2);
  objc_msgSend(v29, "setTexture:atIndex:", v16, 3);
  objc_msgSend(v29, "setBytes:length:atIndex:", &v41, 32, 0);
  v31 = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[8], "threadExecutionWidth");
  LODWORD(computePipelines) = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](computePipelines[8], "maxTotalThreadsPerThreadgroup");
  v32 = objc_msgSend(v13, "width");
  v33 = objc_msgSend(v13, "height");
  v34 = (int)computePipelines / v31;
  if (v32 >= 0)
    v35 = v32;
  else
    v35 = v32 + 1;
  v36 = (v31 + (v35 >> 1) - 1) / v31;
  if (v33 >= 0)
    v37 = v33;
  else
    v37 = v33 + 1;
  v40[0] = v36;
  v40[1] = (v34 + (v37 >> 1) - 1) / v34;
  v40[2] = 1;
  v39[0] = v31;
  v39[1] = v34;
  v39[2] = 1;
  objc_msgSend(v29, "dispatchThreadgroups:threadsPerThreadgroup:", v40, v39);
  objc_msgSend(v29, "endEncoding");

}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;
  uint64_t jj;
  uint64_t kk;
  uint64_t mm;
  uint64_t nn;
  uint64_t i1;
  uint64_t i2;

  objc_storeStrong((id *)&self->_uv_tex_user_ref, 0);
  for (i = 19; i != -1; --i)
    objc_storeStrong((id *)&self->_uv_u32_alias_tex[0][i], 0);
  for (j = 19; j != -1; --j)
    objc_storeStrong((id *)&self->_uv_tex[0][j], 0);
  for (k = 9; k != -1; --k)
    objc_storeStrong((id *)&self->_w_tex[k], 0);
  for (m = 1; m != -1; --m)
    objc_storeStrong((id *)&self->_Ixy_buf[m], 0);
  for (n = 1; n != -1; --n)
    objc_storeStrong((id *)&self->_Adiagb_buf[n], 0);
  for (ii = 9; ii != -1; --ii)
    objc_storeStrong((id *)&self->_C1_tex[ii], 0);
  for (jj = 9; jj != -1; --jj)
    objc_storeStrong((id *)&self->_C0_tex[jj], 0);
  for (kk = 9; kk != -1; --kk)
    objc_storeStrong((id *)&self->_G1_tex[kk], 0);
  for (mm = 9; mm != -1; --mm)
    objc_storeStrong((id *)&self->_G0_tex[mm], 0);
  for (nn = 19; nn != -1; --nn)
    objc_storeStrong((id *)&self->_I_u32_alias_tex[0][nn], 0);
  for (i1 = 19; i1 != -1; --i1)
    objc_storeStrong((id *)&self->_I_tex[0][i1], 0);
  for (i2 = 8; i2 != -1; --i2)
    objc_storeStrong((id *)&self->_computePipelines[i2], 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end
