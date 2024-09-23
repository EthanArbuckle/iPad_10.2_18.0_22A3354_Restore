@implementation LKTFlowGPU

- (LKTFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v11;
  LKTFlowGPU *v12;
  LKTFlowGPU *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MTLCommandQueue *commandQueue;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  LKTFlowGPU *v29;
  objc_super v31;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v11 = a3;
  v31.receiver = self;
  v31.super_class = (Class)LKTFlowGPU;
  v12 = -[LKTFlowGPU init](&v31, sel_init);
  v13 = v12;
  if (!v12 || ((v7 | v8) & 1) != 0)
  {
    v29 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v12->_mtlContext, a3);
    objc_msgSend_commandQueue(v11, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    commandQueue = v13->_commandQueue;
    v13->_commandQueue = (MTLCommandQueue *)v17;

    objc_msgSend__setDefaultParameters(v13, v19, v20, v21);
    objc_msgSend__initMemory_height_nscales_(v13, v22, v8, v7, v6);
    objc_msgSend__setupPipelines(v13, v23, v24, v25);
    objc_msgSend__setupBuffer(v13, v26, v27, v28);
    v29 = v13;
  }

  return v29;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_G0_pxbuf);
  CVPixelBufferRelease(self->_G1_pxbuf);
  CVPixelBufferRelease(self->_C0_pxbuf);
  CVPixelBufferRelease(self->_C1_pxbuf);
  CVPixelBufferRelease(self->_w_pxbuf);
  CVPixelBufferRelease(self->_uv_fwd_pxbuf[0]);
  CVPixelBufferRelease(self->_uv_fwd_pxbuf[1]);
  v3.receiver = self;
  v3.super_class = (Class)LKTFlowGPU;
  -[LKTFlowGPU dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  *(_QWORD *)&self->_current_frame_index = 0;
}

- (void)waitUntilCompleted
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend_commandBuffer(self->_commandQueue, a2, v2, v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v12, v4, (uint64_t)CFSTR("LKT:waitUntilCompleted"), v5);
  objc_msgSend_commit(v12, v6, v7, v8);
  objc_msgSend_waitUntilCompleted(v12, v9, v10, v11);

}

- (BOOL)isBidirectional
{
  return self->_uv_bwd_tex_user_ref != 0;
}

- (MTLBuffer)keypoints
{
  return self->_kpt_buf;
}

- (void)setPreset:(int64_t)a3
{
  uint64_t v3;
  int v4;
  id v5;

  switch(a3)
  {
    case 0:
      objc_msgSend__setDefaultParameters(self, a2, a3, v3);
      return;
    case 1:
      v4 = 1;
      goto LABEL_6;
    case 2:
      v4 = 3;
      goto LABEL_6;
    case 3:
      v4 = 5;
LABEL_6:
      self->_nwarpings = v4;
      self->_useNonLocalRegularization = 0;
      break;
    case 4:
      self->_nwarpings = 6;
      self->_useNonLocalRegularization = 1;
      *(_QWORD *)&self->_nlreg_radius = 0x200000004;
      *(_QWORD *)&self->_nlreg_sigma_l = 0x4040000040C00000;
      self->_nlreg_sigma_w = 0.25;
      break;
    default:
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, (uint64_t)CFSTR("Invalid parameter"), (uint64_t)CFSTR("Unknown preset"), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
  }
}

- (int)setOutputUV:(__CVBuffer *)a3
{
  return MEMORY[0x24BEDD108](self, sel_setOutputUVForward_backward_, a3, 0);
}

- (int)setOutputUVForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4
{
  int Width;
  double Height;
  const char *v9;
  MTLTexture *v10;
  MTLTexture *uv_fwd_tex_user_ref;
  const char *v12;
  MTLTexture *v13;
  MTLTexture *uv_bwd_tex_user_ref;
  int result;
  MTLTexture *v16;
  MTLTexture *v17;

  if (a3)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = (double)(int)CVPixelBufferGetHeight(a3);
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v9, (uint64_t)a3, 65, 7, 0, (double)Width, Height);
    v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
    self->_uv_fwd_tex_user_ref = v10;

    if (!self->_uv_fwd_tex_user_ref)
      return -12786;
    if (a4)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v12, (uint64_t)a4, 65, 7, 0, (double)Width, Height);
      v13 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      uv_bwd_tex_user_ref = self->_uv_bwd_tex_user_ref;
      self->_uv_bwd_tex_user_ref = v13;

      if (!self->_uv_bwd_tex_user_ref)
        return -12786;
    }
    else
    {
      v17 = self->_uv_bwd_tex_user_ref;
      self->_uv_bwd_tex_user_ref = 0;

    }
    result = 0;
    self->_isValid = 1;
  }
  else
  {
    v16 = self->_uv_fwd_tex_user_ref;
    self->_uv_fwd_tex_user_ref = 0;

    return 0;
  }
  return result;
}

- (int)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4
{
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  if (!self->_isValid || self->_streamFrameCount)
    return -12782;
  objc_msgSend_commandBuffer(self->_commandQueue, a2, (uint64_t)a3, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v8, v9, (uint64_t)CFSTR("LKT::Pyramid"), v10);
  objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v11, (uint64_t)v8, (uint64_t)self->_uv_bwd_pxbuf[self->_nscales + 1]);
  if (objc_msgSend_isBidirectional(self, v12, v13, v14))
    objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v15, (uint64_t)v8, (uint64_t)self->_uv_fwd_tex[1][self->_nscales + 9]);
  objc_msgSend__createImagePyramidWithCommandBuffer_in_pixelbuf_I_idx_(self, v15, (uint64_t)v8, (uint64_t)a3, 0);
  objc_msgSend__createImagePyramidWithCommandBuffer_in_pixelbuf_I_idx_(self, v16, (uint64_t)v8, (uint64_t)a4, 1);
  objc_msgSend_commit(v8, v17, v18, v19);

  *(_QWORD *)&self->_current_frame_index = 0;
  if (objc_msgSend_isBidirectional(self, v20, v21, v22))
    objc_msgSend__computeOpticalFlowBidirectional(self, v23, v24, v25);
  else
    objc_msgSend__computeOpticalFlow(self, v23, v24, v25);
  return 0;
}

- (int)estimateFlowStream:(__CVBuffer *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int result;

  if (!self->_isValid)
    return -12782;
  objc_msgSend_commandBuffer(self->_commandQueue, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v6, v7, (uint64_t)CFSTR("LKT::Pyramid"), v8);
  objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v9, (uint64_t)v6, (uint64_t)self->_uv_bwd_pxbuf[self->_nscales + 1]);
  if (objc_msgSend_isBidirectional(self, v10, v11, v12))
    objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_(self, v13, (uint64_t)v6, (uint64_t)self->_uv_fwd_tex[1][self->_nscales + 9]);
  objc_msgSend__createImagePyramidWithCommandBuffer_in_pixelbuf_I_idx_(self, v13, (uint64_t)v6, (uint64_t)a3, self->_current_frame_index);
  objc_msgSend_commit(v6, v14, v15, v16);

  self->_current_frame_index ^= 1u;
  if (self->_streamFrameCount >= 1)
  {
    if (objc_msgSend_isBidirectional(self, v17, v18, v19))
      objc_msgSend__computeOpticalFlowBidirectional(self, v20, v21, v22);
    else
      objc_msgSend__computeOpticalFlow(self, v20, v21, v22);
  }
  result = 0;
  ++self->_streamFrameCount;
  return result;
}

- (int)computeKeypointsFromForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7
{
  uint64_t v8;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = *(_QWORD *)&a6;
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_mtlContext, a2, (uint64_t)a3, 65, 7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_mtlContext, v13, (uint64_t)a4, 65, 7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(self->_commandQueue, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v18, v19, (uint64_t)CFSTR("LKT::KeypointsFromFlow"), v20);
  *(float *)&v21 = a5;
  objc_msgSend__enqueueKeypointsFromFlowWithCommandBuffer_in_uv_fwd_tex_in_uv_bwd_tex_out_kpt_buf_block_size_bidirectional_error_out_num_keypoints_(self, v22, (uint64_t)v18, (uint64_t)v12, v14, self->_kpt_buf, v8, a7, v21);
  objc_msgSend_commit(v18, v23, v24, v25);

  return 0;
}

- (void)_setDefaultParameters
{
  self->_nwarpings = 3;
  self->_useNonLocalRegularization = 0;
  *(_QWORD *)&self->_nlreg_radius = 0x200000004;
  *(_QWORD *)&self->_nlreg_sigma_l = 0x4040000040C00000;
  self->_nlreg_sigma_w = 0.25;
}

- (int)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5
{
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
  int v19;
  int v20;
  int v22;
  MTLTexture *uv_fwd_tex_user_ref;
  int nscales;
  int v25;

  v6 = 0;
  self->_isValid = 0;
  if (a3 >= 8 && a4 >= 8)
  {
    v6 = 0;
    v7 = a4;
    v8 = a3;
    do
    {
      v9 = (v8 & 1) + v8;
      if (v9 >= 0)
        v10 = v9;
      else
        v10 = v9 + 1;
      v11 = v10 >> 1;
      v12 = v9 + 1;
      if (v11 >= 0)
        v13 = v11 & 1;
      else
        v13 = -(v11 & 1);
      v14 = (v7 & 1) + v7;
      if (v14 >= 0)
        v15 = v14;
      else
        v15 = v14 + 1;
      v16 = v15 >> 1;
      v17 = v14 + 1;
      if (v16 >= 0)
        v18 = v16 & 1;
      else
        v18 = -(v16 & 1);
      v19 = v12 + 2 * v13;
      v8 = v19 >> 1;
      v20 = v17 + 2 * v18;
      v7 = v20 >> 1;
      ++v6;
    }
    while (v19 >= 16 && v20 > 15);
  }
  self->_ref_size.width = (double)a3;
  self->_ref_size.height = (double)a4;
  self->_aux_size.width = (double)a3;
  self->_aux_size.height = (double)a4;
  if (a5 >= 0)
    v22 = a5;
  else
    v22 = v6;
  self->_nscales = v22;
  self->_maxThreadExecutionWidth = 0;
  self->_w_pxbuf = 0;
  *(_OWORD *)&self->_G0_pxbuf = 0u;
  *(_OWORD *)&self->_C0_pxbuf = 0u;
  uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
  self->_uv_fwd_tex_user_ref = 0;

  *(_QWORD *)&self->_current_frame_index = 0;
  *(_OWORD *)self->_uv_fwd_pxbuf = 0u;
  *(_OWORD *)self->_uv_bwd_pxbuf = 0u;
  nscales = self->_nscales;
  if (nscales <= 9)
    v25 = -12780;
  else
    v25 = 0;
  if (nscales <= v6)
    return v25;
  else
    return 0;
}

- (void)_setupPipelines
{
  uint64_t v3;
  MTLComputePipelineState **computePipelines;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t maxThreadExecutionWidth;

  v3 = 0;
  computePipelines = self->_computePipelines;
  do
  {
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = (void *)objc_msgSend_initWithUTF8String_(v5, v6, (uint64_t)off_24EFC2B90[v3], v7);
    objc_msgSend_computePipelineStateFor_constants_(self->_mtlContext, v9, (uint64_t)v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&computePipelines[v3], v10);
    v17 = objc_msgSend_threadExecutionWidth(v10, v11, v12, v13);
    maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v17 > maxThreadExecutionWidth)
      maxThreadExecutionWidth = objc_msgSend_threadExecutionWidth(v10, v14, v15, v16);
    self->_maxThreadExecutionWidth = maxThreadExecutionWidth;

    ++v3;
  }
  while (v3 != 22);
}

- (int)_setupBuffer
{
  uint64_t width;
  const char *height;
  double v5;
  double v6;
  unint64_t maxThreadExecutionWidth;
  __CVBuffer *v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  __CVBuffer *v11;
  __CVBuffer *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  MTLBuffer **Adiagb_buf;
  uint64_t v19;
  MTLBuffer **Ixy_buf;
  __CVBuffer **uv_fwd_pxbuf;
  char v22;
  const char *v23;
  uint64_t v24;
  char v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  MTLBuffer *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  MTLBuffer *v36;
  int v37;
  __CVBuffer *v38;
  void *v39;
  const char *v40;
  MTLBuffer *v41;
  MTLBuffer *idt_buf;
  const char *v43;
  uint64_t v44;
  int32x2_t v45;
  int32x2_t v46;
  int v47;
  double v48;
  double v49;
  int v50;
  double v51;
  int v52;
  double v53;
  CGSize *v54;
  CGSize *v55;
  uint64_t v56;
  MTLTexture *v57;
  const char *v58;
  uint64_t v59;
  MTLTexture *v60;
  const char *v61;
  uint64_t v62;
  MTLTexture *v63;
  const char *v64;
  uint64_t v65;
  MTLTexture *v66;
  const char *v67;
  uint64_t v68;
  MTLTexture *v69;
  const char *v70;
  uint64_t v71;
  char v72;
  char v73;
  uint64_t v74;
  MTLTexture **v75;
  MTLTexture *v76;
  const char *v77;
  uint64_t v78;
  MTLTexture *v79;
  uint64_t v80;
  MTLTexture **v81;
  MTLTexture *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  MTLTexture *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  MTLTexture *v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int32x2_t v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  MTLTexture *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  MTLTexture *v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int32x2_t v143;
  MTLTexture **v145;
  MTLTexture **v146;
  MTLTexture *(*I_u32_alias_tex)[10];
  MTLTexture *(*I_tex)[10];
  MTLTexture **w_tex;
  MTLTexture **C1_tex;
  MTLTexture **C0_tex;
  MTLTexture **G1_tex;
  MTLTexture **G0_tex;
  void *v154;
  void *v155;
  int v156;
  int v157;
  int v158;
  int32x2_t v159;
  uint64_t v160;
  int v161;
  int32x2_t v162;

  width = (int)self->_ref_size.width;
  height = (const char *)(int)self->_ref_size.height;
  v5 = self->_aux_size.width;
  v6 = self->_aux_size.height;
  maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  v8 = (__CVBuffer *)sub_227627BD4((int)self->_ref_size.width, height, 0x32433068u);
  self->_G0_pxbuf = v8;
  if (v8)
  {
    v9 = (__CVBuffer *)sub_227627BD4((int)v5, (const char *)(int)v6, 0x32433068u);
    self->_G1_pxbuf = v9;
    if (v9)
    {
      v10 = (__CVBuffer *)sub_227627BD4(width, height, 0x52476841u);
      self->_C0_pxbuf = v10;
      if (v10)
      {
        v11 = (__CVBuffer *)sub_227627BD4((int)v5, (const char *)(int)v6, 0x52476841u);
        self->_C1_pxbuf = v11;
        if (v11)
        {
          v12 = (__CVBuffer *)sub_227627BD4(width, height, 0x4C303068u);
          self->_w_pxbuf = v12;
          if (v12)
          {
            v16 = 0;
            v17 = ((int)width + (int)maxThreadExecutionWidth - 1)
                / (int)maxThreadExecutionWidth
                * maxThreadExecutionWidth
                * (_DWORD)height;
            v160 = 8 * v17;
            Adiagb_buf = self->_Adiagb_buf;
            v157 = v17;
            v19 = 2 * v17;
            Ixy_buf = self->_Ixy_buf;
            uv_fwd_pxbuf = self->_uv_fwd_pxbuf;
            v22 = 1;
            while (1)
            {
              v23 = height;
              v24 = width;
              v25 = v22;
              objc_msgSend_device(self->_mtlContext, v13, v14, v15);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend_newBufferWithLength_options_(v26, v27, v160, 0);
              v29 = Adiagb_buf[v16];
              Adiagb_buf[v16] = (MTLBuffer *)v28;

              if (!Adiagb_buf[v16])
                break;
              objc_msgSend_device(self->_mtlContext, v30, v31, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend_newBufferWithLength_options_(v33, v34, v19, 0);
              v36 = Ixy_buf[v16];
              Ixy_buf[v16] = (MTLBuffer *)v35;

              if (!Ixy_buf[v16])
                break;
              width = v24;
              v37 = v24;
              height = v23;
              v38 = (__CVBuffer *)sub_227627BD4(v37, v23, 0x32433068u);
              uv_fwd_pxbuf[v16] = v38;
              if (!v38)
                break;
              v22 = 0;
              v16 = 1;
              if ((v25 & 1) == 0)
              {
                objc_msgSend_device(self->_mtlContext, v13, v14, v15);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v39, v40, 4 * v157, 0);
                idt_buf = self->_idt_buf;
                self->_idt_buf = v41;

                if (!self->_idt_buf)
                  return -12786;
                if (self->_nscales < 1)
                  return 0;
                v44 = 0;
                v45 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_aux_size));
                G1_tex = self->_G1_tex;
                G0_tex = self->_G0_tex;
                C1_tex = self->_C1_tex;
                C0_tex = self->_C0_tex;
                I_tex = self->_I_tex;
                w_tex = self->_w_tex;
                v46 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_ref_size));
                v146 = self->_I_tex[1];
                I_u32_alias_tex = self->_I_u32_alias_tex;
                v145 = self->_I_u32_alias_tex[1];
LABEL_14:
                v47 = v46.i32[0];
                v48 = (double)v46.i32[0];
                v161 = v46.i32[1];
                v49 = (double)v46.i32[1];
                v50 = v45.i32[0];
                v51 = (double)v45.i32[0];
                v52 = v45.i32[1];
                v53 = (double)v45.i32[1];
                v54 = &self->_ref_pyr_size[v44];
                v54->width = (double)v46.i32[0];
                v54->height = (double)v46.i32[1];
                v55 = &self->_aux_pyr_size[v44];
                v55->width = (double)v45.i32[0];
                v55->height = (double)v45.i32[1];
                objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v43, (uint64_t)self->_G0_pxbuf, 65, 7, 0, (double)v46.i32[0], (double)v46.i32[1]);
                v56 = objc_claimAutoreleasedReturnValue();
                v57 = G0_tex[v44];
                G0_tex[v44] = (MTLTexture *)v56;

                if (G0_tex[v44])
                {
                  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v58, (uint64_t)self->_G1_pxbuf, 65, 7, 0, v51, v53);
                  v59 = objc_claimAutoreleasedReturnValue();
                  v60 = G1_tex[v44];
                  G1_tex[v44] = (MTLTexture *)v59;

                  if (G1_tex[v44])
                  {
                    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v61, (uint64_t)self->_C0_pxbuf, 115, 7, 0, v48, v49);
                    v62 = objc_claimAutoreleasedReturnValue();
                    v63 = C0_tex[v44];
                    C0_tex[v44] = (MTLTexture *)v62;

                    if (C0_tex[v44])
                    {
                      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v64, (uint64_t)self->_C1_pxbuf, 115, 7, 0, v51, v53);
                      v65 = objc_claimAutoreleasedReturnValue();
                      v66 = C1_tex[v44];
                      C1_tex[v44] = (MTLTexture *)v65;

                      if (C1_tex[v44])
                      {
                        v156 = v50;
                        v158 = v52;
                        objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v67, (uint64_t)self->_w_pxbuf, 25, 7, 0, v48, v49);
                        v68 = objc_claimAutoreleasedReturnValue();
                        v69 = w_tex[v44];
                        w_tex[v44] = (MTLTexture *)v68;

                        v71 = 0;
                        v72 = 1;
                        while (1)
                        {
                          v73 = v72;
                          objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v70, (uint64_t)uv_fwd_pxbuf[v71], 65, 7, 0, v48, v49);
                          v74 = objc_claimAutoreleasedReturnValue();
                          v75 = self->_uv_fwd_tex[v71];
                          v76 = v75[v44];
                          v75[v44] = (MTLTexture *)v74;

                          v79 = v75[v44];
                          if (!v79)
                            break;
                          v80 = objc_msgSend_newTextureViewWithPixelFormat_(v79, v77, 53, v78);
                          v81 = self->_uv_fwd_u32_alias_tex[v71];
                          v82 = v81[v44];
                          v81[v44] = (MTLTexture *)v80;

                          v72 = 0;
                          v71 = 1;
                          if ((v73 & 1) == 0)
                          {
                            objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v70, 70, v47, v161, 0);
                            v154 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_setUsage_(v154, v83, 19, v84);
                            objc_msgSend_device(self->_mtlContext, v85, v86, v87);
                            v88 = (void *)objc_claimAutoreleasedReturnValue();
                            v91 = objc_msgSend_newTextureWithDescriptor_(v88, v89, (uint64_t)v154, v90);
                            v92 = (*I_tex)[v44];
                            (*I_tex)[v44] = (MTLTexture *)v91;

                            v95 = objc_msgSend_newTextureViewWithPixelFormat_((*I_tex)[v44], v93, 53, v94);
                            v96 = (*I_u32_alias_tex)[v44];
                            (*I_u32_alias_tex)[v44] = (MTLTexture *)v95;

                            v97 = v47 & 1;
                            if (v47 < 0)
                              v97 = -v97;
                            v98 = v161 & 1;
                            if (v161 < 0)
                              v98 = -v98;
                            v99 = v97 + v47;
                            if (v99 >= 0)
                              v100 = v99;
                            else
                              v100 = v99 + 1;
                            v101 = v100 >> 1;
                            if (v101 >= 0)
                              v102 = v101 & 1;
                            else
                              v102 = -(v101 & 1);
                            v103 = v98 + v161;
                            if (v103 >= 0)
                              v104 = v103;
                            else
                              v104 = v103 + 1;
                            v105 = v104 >> 1;
                            if (v105 >= 0)
                              v106 = v105 & 1;
                            else
                              v106 = -(v105 & 1);
                            v107 = v99 + 2 * v102;
                            if (v107 + 1 >= 0)
                              v108 = v107 + 1;
                            else
                              v108 = v107 + 2;
                            v109 = v108 >> 1;
                            v110 = v103 + 2 * v106;
                            if (v110 + 1 >= 0)
                              v111 = v110 + 1;
                            else
                              v111 = v110 + 2;
                            v112.i32[0] = v109;
                            v112.i32[1] = v111 >> 1;
                            v162 = v112;

                            objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v113, 70, v156, v158, 0);
                            v155 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_setUsage_(v155, v114, 19, v115);
                            objc_msgSend_device(self->_mtlContext, v116, v117, v118);
                            v119 = (void *)objc_claimAutoreleasedReturnValue();
                            v122 = objc_msgSend_newTextureWithDescriptor_(v119, v120, (uint64_t)v155, v121);
                            v123 = v146[v44];
                            v146[v44] = (MTLTexture *)v122;

                            v126 = objc_msgSend_newTextureViewWithPixelFormat_(v146[v44], v124, 53, v125);
                            v127 = v145[v44];
                            v145[v44] = (MTLTexture *)v126;

                            v128 = v156 & 1;
                            if (v156 < 0)
                              v128 = -v128;
                            v129 = v158 & 1;
                            if (v158 < 0)
                              v129 = -v129;
                            v130 = v128 + v156;
                            if (v130 >= 0)
                              v131 = v130;
                            else
                              v131 = v130 + 1;
                            v132 = v131 >> 1;
                            if (v132 >= 0)
                              v133 = v132 & 1;
                            else
                              v133 = -(v132 & 1);
                            v134 = v129 + v158;
                            if (v134 >= 0)
                              v135 = v134;
                            else
                              v135 = v134 + 1;
                            v136 = v135 >> 1;
                            if (v136 >= 0)
                              v137 = v136 & 1;
                            else
                              v137 = -(v136 & 1);
                            v138 = v130 + 2 * v133;
                            if (v138 + 1 >= 0)
                              v139 = v138 + 1;
                            else
                              v139 = v138 + 2;
                            v140 = v139 >> 1;
                            v141 = v134 + 2 * v137;
                            if (v141 + 1 >= 0)
                              v142 = v141 + 1;
                            else
                              v142 = v141 + 2;
                            v143.i32[0] = v140;
                            v143.i32[1] = v142 >> 1;
                            v159 = v143;

                            v45 = v159;
                            v46 = v162;
                            if (++v44 < self->_nscales)
                              goto LABEL_14;
                            return 0;
                          }
                        }
                      }
                    }
                  }
                }
                return -12786;
              }
            }
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_computeOpticalFlow
{
  int nscales;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  MTLTexture *(*uv_fwd_tex)[10];
  int v8;
  void *v9;
  MTLTexture *v10;
  MTLTexture *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int nwarpings;
  int v28;
  MTLTexture *v29;
  int v30;
  id *v31;
  const char *v32;
  id v33;
  MTLTexture *v34;
  MTLTexture **v35;
  MTLTexture *(*I_u32_alias_tex)[10];
  MTLTexture *(*uv_fwd_u32_alias_tex)[10];
  MTLTexture *(*I_tex)[10];
  MTLTexture *v41;
  MTLTexture *v42;
  MTLTexture **w_tex;
  MTLTexture **p_uv_fwd_tex_user_ref;
  MTLTexture **C1_tex;
  MTLTexture **C0_tex;
  MTLTexture **G1_tex;
  MTLTexture **G0_tex;

  nscales = self->_nscales;
  v3 = (nscales - 1);
  if (nscales >= 1)
  {
    v5 = 0;
    v6 = 0;
    I_tex = self->_I_tex;
    G0_tex = self->_G0_tex;
    C0_tex = self->_C0_tex;
    G1_tex = self->_G1_tex;
    uv_fwd_tex = self->_uv_fwd_tex;
    p_uv_fwd_tex_user_ref = &self->_uv_fwd_tex_user_ref;
    C1_tex = self->_C1_tex;
    w_tex = self->_w_tex;
    I_u32_alias_tex = self->_I_u32_alias_tex;
    uv_fwd_u32_alias_tex = self->_uv_fwd_u32_alias_tex;
    v8 = nscales - 1;
    do
    {
      v9 = v5;
      v10 = I_tex[self->_current_frame_index][v3];
      v11 = I_tex[self->_current_frame_index ^ 1][v3];
      objc_msgSend_commandBuffer(self->_commandQueue, v12, v13, v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("LKT:ComputeFlow level %d"), v16, v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLabel_(v5, v18, (uint64_t)v17, v19);

      objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(self, v20, (uint64_t)v5, (uint64_t)v10, G0_tex[v3]);
      objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(self, v21, (uint64_t)v5, (uint64_t)v11, G1_tex[v3]);
      objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(self, v22, (uint64_t)v5, (uint64_t)G0_tex[v3], C0_tex[v3]);
      objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(self, v23, (uint64_t)v5, (uint64_t)G1_tex[v3], C1_tex[v3]);
      nwarpings = self->_nwarpings;
      if (nwarpings < 1)
      {
        v29 = 0;
      }
      else
      {
        v41 = v11;
        v42 = v10;
        v28 = 0;
        v29 = 0;
        do
        {
          v30 = v28 + 1;
          if (v3 || v30 != nwarpings || (v31 = (id *)p_uv_fwd_tex_user_ref, self->_useNonLocalRegularization))
            v31 = (id *)&uv_fwd_tex[v6 ^ 1][v3];
          v33 = *v31;
          if (self->_useNonLocalRegularization && v30 == self->_nwarpings)
          {
            v34 = w_tex[v3];

            v29 = v34;
          }
          objc_msgSend__doSolverWithCommandBuffer_scale_in_uv_tex_in_G0_tex_in_G1_tex_in_C0_tex_in_C1_tex_out_uv_tex_out_w_tex_(self, v32, (uint64_t)v5, v3, uv_fwd_tex[v6][v8], G0_tex[v3], G1_tex[v3], C0_tex[v3], C1_tex[v3], v33, v29);
          v6 ^= 1uLL;

          nwarpings = self->_nwarpings;
          ++v28;
          v8 = v3;
        }
        while (v28 < nwarpings);
        v8 = v3;
        v11 = v41;
        v10 = v42;
      }
      if (self->_useNonLocalRegularization)
      {
        v35 = &uv_fwd_tex[v6 ^ 1][v3];
        if (!v3)
          v35 = p_uv_fwd_tex_user_ref;
        objc_msgSend__doNLRegularizationWithCommandBuffer_in_uv_tex_join_tex_w_tex_out_uv_tex_(self, v24, (uint64_t)v5, (uint64_t)uv_fwd_u32_alias_tex[v6][v3], I_u32_alias_tex[self->_current_frame_index][v3], v29, *v35);
        v6 ^= 1uLL;
      }
      objc_msgSend_commit(v5, v24, v25, v26);

    }
    while (v3-- > 0);

  }
  return 0;
}

- (int)_computeOpticalFlowBidirectional
{
  LKTFlowGPU *v2;
  uint64_t v3;
  uint64_t nscales;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  MTLTexture *v9;
  MTLTexture *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  MTLTexture *v28;
  MTLTexture *v29;
  MTLTexture *v30;
  uint64_t v31;
  BOOL v32;
  id *v33;
  id v34;
  LKTFlowGPU *v35;
  MTLTexture *v36;
  MTLTexture *v37;
  const char *v38;
  MTLTexture *v39;
  MTLTexture **v40;
  BOOL v41;
  id *v42;
  id v43;
  const char *v44;
  int v45;
  MTLTexture *(*I_tex)[10];
  MTLTexture *v48;
  MTLTexture *v49;
  uint64_t v50;
  MTLTexture **v51;
  MTLTexture **p_uv_fwd_tex_user_ref;
  MTLTexture **p_uv_bwd_tex_user_ref;
  MTLTexture *(*uv_fwd_tex)[10];
  id *v55;
  MTLTexture *(*uv_bwd_tex)[10];
  int v57;
  int v58;
  uint64_t v59;
  MTLTexture **C1_tex;
  MTLTexture **C0_tex;
  MTLTexture **G1_tex;
  MTLTexture **G0_tex;
  uint64_t v64;
  void *v65;
  MTLTexture *v66;
  MTLTexture *v67;
  MTLTexture *v68;
  uint64_t v69;
  MTLTexture *v70;
  MTLTexture *v71;

  v2 = self;
  v3 = self->_nscales - 1;
  uv_fwd_tex = self->_uv_fwd_tex;
  v71 = self->_uv_fwd_tex[0][v3];
  uv_bwd_tex = v2->_uv_bwd_tex;
  v70 = v2->_uv_bwd_tex[0][v3];
  if (v2->_uv_bwd_tex_user_ref)
  {
    nscales = v2->_nscales;
    if ((int)nscales < 1)
    {
      v5 = 0;
    }
    else
    {
      v5 = 0;
      v6 = 0;
      I_tex = v2->_I_tex;
      G1_tex = v2->_G1_tex;
      G0_tex = v2->_G0_tex;
      C1_tex = v2->_C1_tex;
      C0_tex = v2->_C0_tex;
      p_uv_fwd_tex_user_ref = &v2->_uv_fwd_tex_user_ref;
      p_uv_bwd_tex_user_ref = &v2->_uv_bwd_tex_user_ref;
      v51 = v2->_uv_bwd_tex[1];
      v58 = v3;
      v57 = v3;
      do
      {
        v7 = v5;
        v50 = nscales;
        v8 = nscales - 1;
        v9 = I_tex[v2->_current_frame_index][(nscales - 1)];
        v10 = I_tex[v2->_current_frame_index ^ 1][v8];
        objc_msgSend_commandBuffer(v2->_commandQueue, v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("LKT:ComputeFlow level %d"), v16, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setLabel_(v14, v18, (uint64_t)v17, v19);

        v49 = v9;
        objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(v2, v20, (uint64_t)v14, (uint64_t)v9, G0_tex[v8]);
        v48 = v10;
        objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_(v2, v21, (uint64_t)v14, (uint64_t)v10, G1_tex[v8]);
        objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(v2, v22, (uint64_t)v14, (uint64_t)G0_tex[v8], C0_tex[v8]);
        v65 = v14;
        objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_(v2, v23, (uint64_t)v14, (uint64_t)G1_tex[v8], C1_tex[v8]);
        v64 = v8;
        if (v2->_nwarpings >= 1)
        {
          v27 = 0;
          v59 = v8;
          v55 = (id *)&(*uv_bwd_tex)[v8];
          do
          {
            if (((v27 + 1) & 1) != 0)
            {
              v68 = G0_tex[v59];
              v67 = G1_tex[v59];
              v66 = C0_tex[v59];
              v28 = C1_tex[v59];
              v40 = uv_fwd_tex[v6];
              v29 = v40[v58];
              v69 = v6 ^ 1;
              v30 = uv_fwd_tex[v6 ^ 1][v59];
              v31 = v64;
              if ((_DWORD)v64)
                v41 = 1;
              else
                v41 = v27 + 3 <= v2->_nwarpings;
              v42 = (id *)&v40[v59];
              if (!v41)
                v42 = (id *)p_uv_fwd_tex_user_ref;
              v43 = *v42;
              v35 = v2;
              v36 = v70;
              v37 = (MTLTexture *)v43;

              v39 = v37;
              v58 = v64;
              v70 = v36;
            }
            else
            {
              v68 = G1_tex[v59];
              v67 = G0_tex[v59];
              v66 = C1_tex[v59];
              v28 = C0_tex[v59];
              v29 = (*uv_bwd_tex)[v57];
              v30 = v51[v59];
              v31 = v64;
              if ((_DWORD)v64)
                v32 = 1;
              else
                v32 = v27 + 3 <= v2->_nwarpings;
              v33 = (id *)p_uv_bwd_tex_user_ref;
              if (v32)
                v33 = v55;
              v34 = *v33;
              v35 = v2;
              v36 = v71;
              v37 = (MTLTexture *)v34;

              v69 = v6 ^ 1;
              v57 = v64;
              v70 = v37;
              v39 = v36;
            }
            v71 = v39;
            objc_msgSend__enqueueFlowConsistencyWithCommandBuffer_in_uv0_tex_in_uv1_tex_out_uv_tex_(v35, v38, (uint64_t)v65, (uint64_t)v36, v29, v30);
            objc_msgSend__doSolverWithCommandBuffer_scale_in_uv_tex_in_G0_tex_in_G1_tex_in_C0_tex_in_C1_tex_out_uv_tex_out_w_tex_(v35, v44, (uint64_t)v65, v31, v30, v68, v67, v66, v28, v37, 0);

            ++v27;
            v2 = v35;
            v6 = v69;
          }
          while (v27 < v35->_nwarpings);
        }
        v5 = v65;
        objc_msgSend_commit(v65, v24, v25, v26);

        nscales = v64;
      }
      while (v50 > 1);
    }
    v45 = 0;
  }
  else
  {
    v5 = 0;
    v45 = -12780;
  }

  return v45;
}

- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_pixelbuf:(__CVBuffer *)a4 I_idx:(int)a5
{
  const char *v8;
  id v9;
  int inputPixelFormat;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t Width;
  uint64_t Height;
  MTLTexture *v40;
  void *BaseAddress;
  size_t BytesPerRow;
  const char *v43;
  uint64_t v44;
  char *v45;
  void *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  _QWORD v55[6];
  _QWORD v56[3];
  _QWORD v57[3];

  v9 = a3;
  inputPixelFormat = self->_inputPixelFormat;
  if (inputPixelFormat)
  {
    if (inputPixelFormat == 2)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_mtlContext, v8, (uint64_t)a4, 10, 7, 0);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (char *)self + 80 * a5;
      v46 = (void *)*((_QWORD *)v45 + 66);
      *((_QWORD *)v45 + 66) = v44;

    }
    else if (inputPixelFormat == 1)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_mtlContext, v8, (uint64_t)a4, 70, 7, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_computeCommandEncoder(v9, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setComputePipelineState_(v15, v16, (uint64_t)self->_computePipelines[0], v17);
      objc_msgSend_setTexture_atIndex_(v15, v18, (uint64_t)v11, 0);
      objc_msgSend_setTexture_atIndex_(v15, v19, (uint64_t)self->_I_tex[a5][0], 1);
      v23 = objc_msgSend_threadExecutionWidth(self->_computePipelines[0], v20, v21, v22);
      v27 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[0], v24, v25, v26) / v23;
      v57[0] = (int)(v23 + objc_msgSend_width(v11, v28, v29, v30) - 1) / v23;
      v57[1] = (int)(v27 + objc_msgSend_height(v11, v31, v32, v33) - 1) / v27;
      v57[2] = 1;
      v56[0] = v23;
      v56[1] = v27;
      v56[2] = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v15, v34, (uint64_t)v57, (uint64_t)v56);
      objc_msgSend_endEncoding(v15, v35, v36, v37);

    }
  }
  else
  {
    Width = (int)CVPixelBufferGetWidth(a4);
    Height = (int)CVPixelBufferGetHeight(a4);
    memset(v55, 0, 24);
    CVPixelBufferLockBaseAddress(a4, 0);
    v40 = self->_I_tex[a5][0];
    BaseAddress = CVPixelBufferGetBaseAddress(a4);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
    v55[3] = Width;
    v55[4] = Height;
    v55[5] = 1;
    objc_msgSend_replaceRegion_mipmapLevel_withBytes_bytesPerRow_(v40, v43, (uint64_t)v55, 0, BaseAddress, BytesPerRow);
    CVPixelBufferUnlockBaseAddress(a4, 0);
  }
  if (self->_nscales >= 2)
  {
    v47 = 0;
    v48 = (char *)self + 80 * a5;
    do
    {
      v49 = &v48[8 * v47];
      v50 = *((_QWORD *)v49 + 67);
      v51 = *((id *)v49 + 66);
      objc_msgSend__downscale2XWithCommandBuffer_in_tex_out_tex_(self, v52, (uint64_t)v9, (uint64_t)v51, v50);

      v53 = v47 + 2;
      ++v47;
    }
    while (v53 < self->_nscales);
  }

  return 0;
}

- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[3];
  _QWORD v35[3];

  v6 = a4;
  objc_msgSend_computeCommandEncoder(a3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v10, v11, (uint64_t)self->_computePipelines[1], v12);
  objc_msgSend_setTexture_atIndex_(v10, v13, (uint64_t)v6, 0);
  v17 = objc_msgSend_threadExecutionWidth(self->_computePipelines[1], v14, v15, v16);
  v21 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[1], v18, v19, v20) / v17;
  v25 = (int)(v17 + objc_msgSend_width(v6, v22, v23, v24) - 1) / v17;
  LODWORD(self) = objc_msgSend_height(v6, v26, v27, v28);

  v35[0] = v25;
  v35[1] = (v21 + (int)self - 1) / v21;
  v35[2] = 1;
  v34[0] = v17;
  v34[1] = v21;
  v34[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v10, v29, (uint64_t)v35, (uint64_t)v34);
  objc_msgSend_endEncoding(v10, v30, v31, v32);

  return 0;
}

- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[3];
  _QWORD v38[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_computePipelines[2], v15);
  objc_msgSend_setTexture_atIndex_(v13, v16, (uint64_t)v9, 0);

  objc_msgSend_setTexture_atIndex_(v13, v17, (uint64_t)v8, 1);
  LODWORD(a3) = objc_msgSend_threadExecutionWidth(self->_computePipelines[2], v18, v19, v20);
  v24 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[2], v21, v22, v23) / (int)a3;
  v28 = (int)((_DWORD)a3 + objc_msgSend_width(v8, v25, v26, v27) - 1) / (int)a3;
  LODWORD(self) = objc_msgSend_height(v8, v29, v30, v31);

  v38[0] = v28;
  v38[1] = (v24 + (int)self - 1) / v24;
  v38[2] = 1;
  v37[0] = (int)a3;
  v37[1] = v24;
  v37[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v13, v32, (uint64_t)v38, (uint64_t)v37);
  objc_msgSend_endEncoding(v13, v33, v34, v35);

  return 0;
}

- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[3];
  _QWORD v37[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_computePipelines[3], v15);
  objc_msgSend_setTexture_atIndex_(v13, v16, (uint64_t)v9, 0);
  objc_msgSend_setTexture_atIndex_(v13, v17, (uint64_t)v8, 1);

  LODWORD(a3) = objc_msgSend_threadExecutionWidth(self->_computePipelines[3], v18, v19, v20);
  LODWORD(v8) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[3], v21, v22, v23) / (int)a3;
  v27 = (int)((_DWORD)a3 + objc_msgSend_width(v9, v24, v25, v26) - 1) / (int)a3;
  LODWORD(self) = objc_msgSend_height(v9, v28, v29, v30);

  v37[0] = v27;
  v37[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v37[2] = 1;
  v36[0] = (int)a3;
  v36[1] = (int)v8;
  v36[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v13, v31, (uint64_t)v37, (uint64_t)v36);
  objc_msgSend_endEncoding(v13, v32, v33, v34);

  return 0;
}

- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[3];
  _QWORD v37[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_computePipelines[5], v15);
  objc_msgSend_setTexture_atIndex_(v13, v16, (uint64_t)v9, 0);
  objc_msgSend_setTexture_atIndex_(v13, v17, (uint64_t)v8, 1);

  LODWORD(a3) = objc_msgSend_threadExecutionWidth(self->_computePipelines[5], v18, v19, v20);
  LODWORD(v8) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[5], v21, v22, v23) / (int)a3;
  v27 = (int)((_DWORD)a3 + objc_msgSend_width(v9, v24, v25, v26) - 1) / (int)a3;
  LODWORD(self) = objc_msgSend_height(v9, v28, v29, v30);

  v37[0] = v27;
  v37[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v37[2] = 1;
  v36[0] = (int)a3;
  v36[1] = (int)v8;
  v36[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v13, v31, (uint64_t)v37, (uint64_t)v36);
  objc_msgSend_endEncoding(v13, v32, v33, v34);

  return 0;
}

- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const float *v34;
  const char *v35;
  float32x2_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  id v111;
  id v112;
  int v113;
  id v114;
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[3];
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[3];
  _DWORD v121[2];
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  float32x2_t v125;
  uint64_t v126;
  uint64_t v127;
  _DWORD v128[3];

  v114 = a11;
  v17 = a10;
  v112 = a9;
  v111 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  LODWORD(a3) = objc_msgSend_width(v17, v22, v23, v24);
  v28 = objc_msgSend_height(v17, v25, v26, v27);
  v113 = (_DWORD)a3 - 1;
  LODWORD(a6) = ((int)a3 - 1 + LODWORD(self->_maxThreadExecutionWidth))
              / SLODWORD(self->_maxThreadExecutionWidth)
              * LODWORD(self->_maxThreadExecutionWidth);
  v128[0] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  v127 = _D0;
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTFlowGPU, v35, (uint64_t)v20, (uint64_t)v17, &v127, v128);
  v121[0] = (_DWORD)a3;
  v121[1] = v28;
  v122 = a6;
  v123 = v127;
  v124 = 0;
  v34 = (const float *)v128;
  v36 = vld1_dup_f32(v34);
  v125 = v36;
  v126 = 0;
  objc_msgSend_computeCommandEncoder(v21, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v40, v41, (uint64_t)self->_computePipelines[16], v42);
  objc_msgSend_setTexture_atIndex_(v40, v43, (uint64_t)v20, 0);
  objc_msgSend_setTexture_atIndex_(v40, v44, (uint64_t)v19, 1);

  objc_msgSend_setTexture_atIndex_(v40, v45, (uint64_t)v18, 2);
  objc_msgSend_setTexture_atIndex_(v40, v46, (uint64_t)v111, 3);

  objc_msgSend_setTexture_atIndex_(v40, v47, (uint64_t)v112, 4);
  objc_msgSend_setBuffer_offset_atIndex_(v40, v48, (uint64_t)self->_Adiagb_buf[0], 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v40, v49, (uint64_t)self->_Ixy_buf[0], 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v40, v50, (uint64_t)self->_idt_buf, 0, 2);
  objc_msgSend_setBytes_length_atIndex_(v40, v51, (uint64_t)v121, 48, 3);
  LODWORD(v19) = objc_msgSend_threadExecutionWidth(self->_computePipelines[16], v52, v53, v54);
  v58 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[16], v55, v56, v57);
  v120[0] = (v113 + (int)v19) / (int)v19;
  v120[1] = (v28 - 1 + v58 / (int)v19) / (v58 / (int)v19);
  v120[2] = 1;
  v119[0] = (int)v19;
  v119[1] = v58 / (int)v19;
  v119[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v40, v59, (uint64_t)v120, (uint64_t)v119);
  objc_msgSend_endEncoding(v40, v60, v61, v62);

  v63 = v21;
  objc_msgSend_computeCommandEncoder(v21, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v67, v68, (uint64_t)self->_computePipelines[17], v69);
  objc_msgSend_setBuffer_offset_atIndex_(v67, v70, (uint64_t)self->_Adiagb_buf[0], 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v67, v71, (uint64_t)self->_Ixy_buf[0], 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v67, v72, (uint64_t)self->_Adiagb_buf[1], 0, 2);
  objc_msgSend_setBuffer_offset_atIndex_(v67, v73, (uint64_t)self->_Ixy_buf[1], 0, 3);
  objc_msgSend_setBytes_length_atIndex_(v67, v74, (uint64_t)v121, 48, 4);
  LODWORD(v19) = objc_msgSend_threadExecutionWidth(self->_computePipelines[17], v75, v76, v77);
  v81 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[17], v78, v79, v80);
  v118[0] = (v113 + (int)v19) / (int)v19;
  v118[1] = (v28 - 1 + v81 / (int)v19) / (v81 / (int)v19);
  v118[2] = 1;
  v117[0] = (int)v19;
  v117[1] = v81 / (int)v19;
  v117[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v67, v82, (uint64_t)v118, (uint64_t)v117);
  objc_msgSend_endEncoding(v67, v83, v84, v85);

  objc_msgSend_computeCommandEncoder(v63, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setComputePipelineState_(v89, v90, (uint64_t)self->_computePipelines[18], v91);
  objc_msgSend_setBuffer_offset_atIndex_(v89, v92, (uint64_t)self->_Adiagb_buf[1], 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v89, v93, (uint64_t)self->_Ixy_buf[1], 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v89, v94, (uint64_t)self->_idt_buf, 0, 2);
  objc_msgSend_setTexture_atIndex_(v89, v95, (uint64_t)v20, 0);

  objc_msgSend_setTexture_atIndex_(v89, v96, (uint64_t)v17, 1);
  objc_msgSend_setTexture_atIndex_(v89, v97, (uint64_t)v114, 2);

  objc_msgSend_setBytes_length_atIndex_(v89, v98, (uint64_t)v121, 48, 3);
  LODWORD(v19) = objc_msgSend_threadExecutionWidth(self->_computePipelines[18], v99, v100, v101);
  v105 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[18], v102, v103, v104);
  v116[0] = (v113 + (int)v19) / (int)v19;
  v116[1] = (v28 - 1 + v105 / (int)v19) / (v105 / (int)v19);
  v116[2] = 1;
  v115[0] = (int)v19;
  v115[1] = v105 / (int)v19;
  v115[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v89, v106, (uint64_t)v116, (uint64_t)v115);
  objc_msgSend_endEncoding(v89, v107, v108, v109);

  return 0;
}

- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const float *v26;
  const char *v27;
  const char *v28;
  float32x2_t v29;
  float32x2_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v59[3];
  _QWORD v60[3];
  _DWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float32x2_t v65;
  float32x2_t v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  LODWORD(a5) = objc_msgSend_width(v10, v14, v15, v16);
  v20 = objc_msgSend_height(v10, v17, v18, v19);
  __asm { FMOV            V0.2S, #1.0 }
  v69 = _D0;
  v70 = _D0;
  v68 = 1065353216;
  v67 = 1065353216;
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTFlowGPU, v27, (uint64_t)v12, (uint64_t)v10, &v70, &v68);
  objc_msgSend__computeScalingFactor_dst_tex_scale_xy_inv_coeff_(LKTFlowGPU, v28, (uint64_t)v11, (uint64_t)v10, &v69, &v67);
  v62 = 0;
  v61[0] = (_DWORD)a5;
  v61[1] = v20;
  v63 = v70;
  v64 = v69;
  v26 = (const float *)&v68;
  v29 = vld1_dup_f32(v26);
  v30 = vld1_dup_f32((const float *)&v67);
  v65 = v29;
  v66 = v30;
  objc_msgSend_computeCommandEncoder(v13, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setComputePipelineState_(v34, v35, (uint64_t)self->_computePipelines[19], v36);
  objc_msgSend_setTexture_atIndex_(v34, v37, (uint64_t)v12, 0);

  objc_msgSend_setTexture_atIndex_(v34, v38, (uint64_t)v11, 1);
  objc_msgSend_setTexture_atIndex_(v34, v39, (uint64_t)v10, 2);
  objc_msgSend_setBytes_length_atIndex_(v34, v40, (uint64_t)v61, 48, 0);
  LODWORD(v11) = objc_msgSend_threadExecutionWidth(self->_computePipelines[19], v41, v42, v43);
  LODWORD(v13) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[19], v44, v45, v46) / (int)v11;
  v50 = (int)((_DWORD)v11 + objc_msgSend_width(v10, v47, v48, v49) - 1) / (int)v11;
  LODWORD(self) = objc_msgSend_height(v10, v51, v52, v53);

  v60[0] = v50;
  v60[1] = ((int)v13 + (int)self - 1) / (int)v13;
  v60[2] = 1;
  v59[0] = (int)v11;
  v59[1] = (int)v13;
  v59[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v34, v54, (uint64_t)v60, (uint64_t)v59);
  objc_msgSend_endEncoding(v34, v55, v56, v57);

  return 0;
}

- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 out_kpt_buf:(id)a6 block_size:(int)a7 bidirectional_error:(float)a8 out_num_keypoints:(unsigned __int16 *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  _QWORD v52[3];
  _QWORD v53[3];
  int v54;
  __int16 v55;
  __int16 v56;
  uint64_t v57;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a3;
  v23 = (int)objc_msgSend_width(v16, v20, v21, v22) / a7;
  v27 = (int)objc_msgSend_height(v16, v24, v25, v26) / a7;
  v54 = a7;
  v56 = v27;
  v55 = v23;
  v57 = LODWORD(a8);
  objc_msgSend_computeCommandEncoder(v19, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27 * v23 > 0x8000)
  {
    v50 = -12780;
  }
  else
  {
    objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)self->_computePipelines[20], v33);
    objc_msgSend_setTexture_atIndex_(v31, v34, (uint64_t)v16, 0);
    objc_msgSend_setTexture_atIndex_(v31, v35, (uint64_t)v17, 1);
    objc_msgSend_setBuffer_offset_atIndex_(v31, v36, (uint64_t)v18, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v31, v37, (uint64_t)&v54, 16, 1);
    v41 = objc_msgSend_threadExecutionWidth(self->_computePipelines[20], v38, v39, v40);
    v45 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[20], v42, v43, v44);
    v53[0] = (v23 + v41 - 1) / v41;
    v53[1] = (v27 + v45 / v41 - 1) / (v45 / v41);
    v53[2] = 1;
    v52[0] = v41;
    v52[1] = v45 / v41;
    v52[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v31, v46, (uint64_t)v53, (uint64_t)v52);
    objc_msgSend_endEncoding(v31, v47, v48, v49);
    v50 = 0;
    *a9 = v27 * v23;
  }

  return v50;
}

- (int)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  __int128 v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  const char *v51;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[2];
  __int128 v60;

  v59[1] = 0;
  v59[0] = *(_QWORD *)&self->_nlreg_radius;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&v17 = vdiv_f32(_D1, vadd_f32(*(float32x2_t *)&self->_nlreg_sigma_l, *(float32x2_t *)&self->_nlreg_sigma_l));
  DWORD2(v17) = DWORD1(v17);
  *((float *)&v17 + 3) = 1.0 / (float)(self->_nlreg_sigma_w + self->_nlreg_sigma_w);
  v60 = v17;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend_computeCommandEncoder(a3, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v25, v26, (uint64_t)self->_computePipelines[21], v27);
  objc_msgSend_setTexture_atIndex_(v25, v28, (uint64_t)v21, 0);
  objc_msgSend_setTexture_atIndex_(v25, v29, (uint64_t)v20, 1);

  objc_msgSend_setTexture_atIndex_(v25, v30, (uint64_t)v19, 2);
  objc_msgSend_setTexture_atIndex_(v25, v31, (uint64_t)v18, 3);

  objc_msgSend_setBytes_length_atIndex_(v25, v32, (uint64_t)v59, 32, 0);
  v36 = objc_msgSend_threadExecutionWidth(self->_computePipelines[21], v33, v34, v35);
  v40 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[21], v37, v38, v39) / v36;
  v44 = objc_msgSend_width(v21, v41, v42, v43);
  if (v44 >= 0)
    v48 = v44;
  else
    v48 = v44 + 1;
  v49 = (v36 + (v48 >> 1) - 1) / v36;
  v50 = objc_msgSend_height(v21, v45, v46, v47);

  if (v50 >= 0)
    v52 = v50;
  else
    v52 = v50 + 1;
  v58[0] = v49;
  v58[1] = (v40 + (v52 >> 1) - 1) / v40;
  v58[2] = 1;
  v57[0] = v36;
  v57[1] = v40;
  v57[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v51, (uint64_t)v58, (uint64_t)v57);
  objc_msgSend_endEncoding(v25, v53, v54, v55);

  return 0;
}

+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4
{
  uint64_t *v4;
  float *v5;
  float *v6;
  uint64_t *v7;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  float v48;
  id v49;

  v6 = v5;
  v7 = v4;
  v49 = a3;
  v9 = a4;
  v13 = (float)(unint64_t)objc_msgSend_width(v9, v10, v11, v12);
  v17 = v13 / (float)(unint64_t)objc_msgSend_width(v49, v14, v15, v16);
  v21 = objc_msgSend_height(v9, v18, v19, v20);
  v25 = objc_msgSend_height(v49, v22, v23, v24);
  LODWORD(v29) = 1.5;
  *(float *)&v30 = (float)(unint64_t)v21 / (float)(unint64_t)v25;
  if (v17 <= 1.5 || *(float *)&v30 <= 1.5)
  {
    v32 = objc_msgSend_width(v9, v26, v27, v28, v29, v30);
    if (v32 != objc_msgSend_width(v49, v33, v34, v35)
      || (v39 = objc_msgSend_height(v9, v36, v37, v38), v39 != objc_msgSend_height(v49, v40, v41, v42)))
    {
      sub_2276496AC();
    }
    __asm { FMOV            V0.2S, #1.0 }
    v48 = 1.0;
  }
  else
  {
    _D0 = 0x3F0000003F000000;
    v48 = 2.0;
  }
  *v6 = v48;
  *v7 = _D0;

}

- (LKTFlowGPU)initWithMetalContext:(id)a3 ICPtransform:(int64_t)a4 width:(int)a5 height:(int)a6 nscales:(int)a7 flowUpperMostScale:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v15;
  LKTFlowGPU *v16;
  LKTFlowGPU *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  MTLCommandQueue *commandQueue;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  LKTFlowGPU *v47;
  objc_super v49;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v12 = a4;
  v15 = a3;
  v49.receiver = self;
  v49.super_class = (Class)LKTFlowGPU;
  v16 = -[LKTFlowGPU init](&v49, sel_init);
  v17 = v16;
  if (!v16 || ((v10 | v11) & 1) != 0)
  {
    v47 = 0;
  }
  else
  {
    objc_storeStrong((id *)&v16->_mtlContext, a3);
    objc_msgSend_commandQueue(v15, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    commandQueue = v17->_commandQueue;
    v17->_commandQueue = (MTLCommandQueue *)v21;

    v17->_p.length_params = v12;
    objc_msgSend__setDefaultParameters(v17, v23, v24, v25);
    objc_msgSend__initMemory_height_nscales_(v17, v26, v11, v10, v9);
    objc_msgSend__setDefaultParametersICP(v17, v27, v28, v29);
    objc_msgSend__initMemoryICP_(v17, v30, v8, v31);
    objc_msgSend__setupPipelines(v17, v32, v33, v34);
    objc_msgSend__setupBufferPyramids(v17, v35, v36, v37);
    objc_msgSend__setupBufferDerivatives(v17, v38, v39, v40);
    objc_msgSend__setupBufferLKT(v17, v41, v42, v43);
    objc_msgSend__setupBufferICP(v17, v44, v45, v46);
    v47 = v17;
  }

  return v47;
}

- (int)setICPWeights:(id)a3
{
  objc_storeStrong((id *)&self->_w_icp_tex_user_ref, a3);
  if (self->_w_icp_tex_user_ref)
    return 0;
  else
    return -12780;
}

- (void)setPresetICP:(int64_t)a3 withRegularizerTerms:(id)a4 decimation_factor:(int)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int nscales;
  BOOL v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  char *v20;

  v8 = (const char *)a4;
  v20 = (char *)v8;
  switch(a3)
  {
    case 1:
      nscales = self->_nscales;
      v12 = __OFSUB__(nscales, 2);
      v13 = nscales - 2;
      if ((v13 < 0) ^ v12 | (v13 == 0))
        v13 = 0;
      self->_nscales_icp = v13;
      v14 = 1;
      goto LABEL_17;
    case 2:
      v16 = self->_nscales;
      v12 = __OFSUB__(v16, 2);
      v17 = v16 - 2;
      if ((v17 < 0) ^ v12 | (v17 == 0))
        v17 = 0;
      goto LABEL_11;
    case 3:
      v17 = self->_nscales;
LABEL_11:
      self->_nscales_icp = v17;
      v14 = 2;
      goto LABEL_17;
    case 4:
      self->_nscales_icp = self->_nscales;
      v14 = 4;
      goto LABEL_17;
    case 5:
      v18 = self->_nscales;
      v12 = __OFSUB__(v18, 2);
      v19 = v18 - 2;
      if ((v19 < 0) ^ v12 | (v19 == 0))
        v19 = 0;
      self->_nscales_icp = v19;
      v14 = 1000;
LABEL_17:
      self->_warping_scheme_icp = v14;
      objc_msgSend__setICPRegularizerTerms_(self, v8, (uint64_t)v8, v10);
      break;
    default:
      objc_msgSend__setDefaultParameters(self, v8, v9, v10);
      objc_msgSend__setICPRegularizerTerms_(self, v20, (uint64_t)v20, v15);
      break;
  }
  self->_decimation_factor_icp = a5;

}

- (uint64_t)estimatePanoRegistration:(double)a3 metadata:(double)a4 initTForm:(uint64_t)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  v12 = a7;
  if (*(_BYTE *)(a1 + 2168))
  {
    objc_msgSend_commandBuffer(*(void **)(a1 + 16), v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLabel_(v13, v14, (uint64_t)CFSTR("LKT::Pyramid"), v15);
    objc_msgSend__zeroFlowWithCommandBuffer_uv_tex_((void *)a1, v16, (uint64_t)v13, *(_QWORD *)(a1 + 8 * *(int *)(a1 + 2176) + 1352));
    objc_msgSend__createImagePyramidWithCommandBuffer_in_pixelbuf_I_idx_((void *)a1, v17, (uint64_t)v13, a6, *(unsigned int *)(a1 + 2000));
    objc_msgSend_commit(v13, v18, v19, v20);

    *(_DWORD *)(a1 + 2000) ^= 1u;
    if (*(int *)(a1 + 2004) < 1)
    {
      objc_msgSend_commandBuffer(*(void **)(a1 + 16), v21, v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLabel_(v25, v26, (uint64_t)CFSTR("ICP::Init weights"), v27);
      objc_msgSend__initICPWeightsWithCommandBuffer_((void *)a1, v28, (uint64_t)v25, v29);
      objc_msgSend_commit(v25, v30, v31, v32);
      objc_msgSend__setParametricTransformFromGyro_((void *)a1, v33, v34, v35, a2, a3, a4);
      objc_msgSend__resetLoss((void *)a1, v36, v37, v38);

    }
    else
    {
      objc_msgSend__panoRegistration_metadata_((void *)a1, v21, (uint64_t)v12, v23, a2, a3, a4);
    }
    v24 = 0;
    ++*(_DWORD *)(a1 + 2004);
  }
  else
  {
    v24 = 4294954514;
  }

  return v24;
}

- (int)resetCurrentFrameIndex
{
  self->_current_frame_index ^= 1u;
  return 0;
}

- (uint64_t)getParametricTransform
{
  return MEMORY[0x24BEDD108](a1, sel__parametricTransformToMatrix3x3, a3, a4);
}

- (int)getMaxNumberOfScales
{
  return 10;
}

- (int)_initMemoryICP:(int)a3
{
  MTLBuffer *icp_reduc_buf;
  MTLTexture *w_icp_tex_user_ref;

  self->_flow_upper_most_scale = a3;
  icp_reduc_buf = self->_icp_reduc_buf;
  self->_icp_reduc_buf = 0;

  w_icp_tex_user_ref = self->_w_icp_tex_user_ref;
  self->_w_icp_tex_user_ref = 0;

  *(_QWORD *)&self->_icp_regularizer_term[8] = 0;
  *(_OWORD *)self->_icp_regularizer_term = 0u;
  *(_OWORD *)&self->_icp_regularizer_term[4] = 0u;
  return 0;
}

- (int)_setupBufferPyramids
{
  uint64_t v3;
  int32x2_t v4;
  CGSize *aux_pyr_size;
  MTLTexture *(*I_tex)[10];
  int64x2_t v7;
  int v8;
  int v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  MTLTexture *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  MTLTexture *v24;
  __int128 v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  MTLTexture *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  MTLTexture *v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int32x2_t v72;
  __int128 v74;
  int32x2_t v75;

  if (self->_nscales >= 1)
  {
    v3 = 0;
    v75 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_aux_size));
    v4 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_ref_size));
    aux_pyr_size = self->_aux_pyr_size;
    I_tex = self->_I_tex;
    do
    {
      v7.i64[0] = v4.i32[0];
      v7.i64[1] = v4.i32[1];
      aux_pyr_size[-10] = (CGSize)vcvtq_f64_s64(v7);
      v7.i64[0] = v75.i32[0];
      v7.i64[1] = v75.i32[1];
      *(float64x2_t *)aux_pyr_size = vcvtq_f64_s64(v7);
      v8 = v4.i32[0];
      v9 = v4.i32[1];
      objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], a2, 70, v4.i32[0], v4.i32[1], 0, v74);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsage_(v10, v11, 19, v12);
      objc_msgSend_device(self->_mtlContext, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend_newTextureWithDescriptor_(v16, v17, (uint64_t)v10, v18);
      v20 = (*I_tex)[0];
      (*I_tex)[0] = (MTLTexture *)v19;

      v23 = objc_msgSend_newTextureViewWithPixelFormat_((*I_tex)[0], v21, 53, v22);
      v24 = (*I_tex)[20];
      (*I_tex)[20] = (MTLTexture *)v23;

      v26 = v8 & 1;
      if (v8 < 0)
        v26 = -v26;
      v27 = v9 & 1;
      if (v9 < 0)
        v27 = -v27;
      v28 = v26 + v8;
      if (v28 >= 0)
        v29 = v28;
      else
        v29 = v28 + 1;
      v30 = v29 >> 1;
      if (v30 >= 0)
        v31 = v30 & 1;
      else
        v31 = -(v30 & 1);
      v32 = v27 + v9;
      if (v32 >= 0)
        v33 = v32;
      else
        v33 = v32 + 1;
      v34 = v33 >> 1;
      if (v34 >= 0)
        v35 = v34 & 1;
      else
        v35 = -(v34 & 1);
      v36 = v28 + 2 * v31;
      if (v36 + 1 >= 0)
        v37 = v36 + 1;
      else
        v37 = v36 + 2;
      v38 = v37 >> 1;
      v39 = v32 + 2 * v35;
      if (v39 + 1 >= 0)
        v40 = v39 + 1;
      else
        v40 = v39 + 2;
      LODWORD(v25) = v38;
      DWORD1(v25) = v40 >> 1;
      v74 = v25;

      objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v41, 70, v75.i32[0], v75.i32[1], 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsage_(v42, v43, 19, v44);
      objc_msgSend_device(self->_mtlContext, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_newTextureWithDescriptor_(v48, v49, (uint64_t)v42, v50);
      v52 = (*I_tex)[10];
      (*I_tex)[10] = (MTLTexture *)v51;

      v55 = objc_msgSend_newTextureViewWithPixelFormat_((*I_tex)[10], v53, 53, v54);
      v56 = (*I_tex)[30];
      (*I_tex)[30] = (MTLTexture *)v55;

      v57 = v75.i8[0] & 1;
      if (v75.i32[0] < 0)
        v57 = -v57;
      v58 = v75.i8[4] & 1;
      if (v75.i32[1] < 0)
        v58 = -v58;
      v59 = v57 + v75.i32[0];
      if (v59 >= 0)
        v60 = v59;
      else
        v60 = v59 + 1;
      v61 = v60 >> 1;
      if (v61 >= 0)
        v62 = v61 & 1;
      else
        v62 = -(v61 & 1);
      v63 = v58 + v75.i32[1];
      if (v63 >= 0)
        v64 = v63;
      else
        v64 = v63 + 1;
      v65 = v64 >> 1;
      if (v65 >= 0)
        v66 = v65 & 1;
      else
        v66 = -(v65 & 1);
      v67 = v59 + 2 * v62;
      if (v67 + 1 >= 0)
        v68 = v67 + 1;
      else
        v68 = v67 + 2;
      v69 = v68 >> 1;
      v70 = v63 + 2 * v66;
      if (v70 + 1 >= 0)
        v71 = v70 + 1;
      else
        v71 = v70 + 2;
      v72.i32[0] = v69;
      v72.i32[1] = v71 >> 1;
      v75 = v72;

      v4 = (int32x2_t)v74;
      ++v3;
      ++aux_pyr_size;
      I_tex = (MTLTexture *(*)[10])((char *)I_tex + 8);
    }
    while (v3 < self->_nscales);
  }
  return 0;
}

- (int)_setupBufferDerivatives
{
  int width;
  const char *height;
  double v5;
  double v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  const char *v11;
  uint64_t v12;
  MTLTexture **C1_tex;
  CGFloat *i;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  MTLTexture *v29;

  width = (int)self->_ref_size.width;
  height = (const char *)(int)self->_ref_size.height;
  v5 = self->_aux_size.width;
  v6 = self->_aux_size.height;
  v7 = (__CVBuffer *)sub_227627BD4(width, height, 0x32433068u);
  self->_G0_pxbuf = v7;
  if (v7)
  {
    v8 = (__CVBuffer *)sub_227627BD4((int)v5, (const char *)(int)v6, 0x32433068u);
    self->_G1_pxbuf = v8;
    if (v8)
    {
      v9 = (__CVBuffer *)sub_227627BD4(width, height, 0x52476841u);
      self->_C0_pxbuf = v9;
      if (v9)
      {
        v10 = (__CVBuffer *)sub_227627BD4((int)v5, (const char *)(int)v6, 0x52476841u);
        self->_C1_pxbuf = v10;
        if (v10)
        {
          if (self->_nscales < 1)
            return 0;
          v12 = 0;
          C1_tex = self->_C1_tex;
          for (i = &self->_aux_pyr_size[0].height; ; i += 2)
          {
            v15 = *(i - 21);
            v16 = *(i - 20);
            v17 = *(i - 1);
            v18 = *i;
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v11, (uint64_t)self->_G0_pxbuf, 65, 7, 0, v15, v16);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = *(C1_tex - 32);
            *(C1_tex - 32) = (MTLTexture *)v19;

            if (!*(C1_tex - 32))
              break;
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v21, (uint64_t)self->_G1_pxbuf, 65, 7, 0, v17, v18);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = *(C1_tex - 22);
            *(C1_tex - 22) = (MTLTexture *)v22;

            if (!*(C1_tex - 22))
              break;
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v24, (uint64_t)self->_C0_pxbuf, 115, 7, 0, v15, v16);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = *(C1_tex - 10);
            *(C1_tex - 10) = (MTLTexture *)v25;

            if (!*(C1_tex - 10))
              break;
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v27, (uint64_t)self->_C1_pxbuf, 115, 7, 0, v17, v18);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = *C1_tex;
            *C1_tex = (MTLTexture *)v28;

            if (!*C1_tex)
              break;
            ++v12;
            ++C1_tex;
            if (v12 >= self->_nscales)
              return 0;
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_setupBufferLKT
{
  uint64_t v2;
  uint64_t v3;
  int width;
  int height;
  int flow_upper_most_scale;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  int maxThreadExecutionWidth;
  __CVBuffer *v15;
  uint64_t v16;
  int v17;
  MTLBuffer **Adiagb_buf;
  uint64_t v19;
  MTLBuffer **Ixy_buf;
  __CVBuffer **uv_fwd_pxbuf;
  char v22;
  uint64_t v23;
  char v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  MTLBuffer *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  MTLBuffer *v35;
  __CVBuffer *v36;
  void *v37;
  const char *v38;
  MTLBuffer *v39;
  MTLBuffer *idt_buf;
  const char *v41;
  uint64_t v42;
  MTLTexture **w_tex;
  CGSize *v44;
  double v45;
  double v46;
  uint64_t v47;
  MTLTexture *v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  MTLTexture **v53;
  MTLTexture *v54;
  const char *v55;
  uint64_t v56;
  MTLTexture *v57;
  uint64_t v58;
  MTLTexture **v59;
  MTLTexture *v60;
  uint64_t v62;
  uint64_t v63;

  width = (int)self->_ref_size.width;
  height = (int)self->_ref_size.height;
  flow_upper_most_scale = self->_flow_upper_most_scale;
  if (width >= 0)
    v8 = (int)self->_ref_size.width;
  else
    v8 = width + 1;
  v9 = v8 >> 1;
  if (height >= 0)
    v10 = (int)self->_ref_size.height;
  else
    v10 = height + 1;
  v11 = v10 >> 1;
  if (flow_upper_most_scale >= 1)
    v12 = v9;
  else
    v12 = width;
  if (flow_upper_most_scale >= 1)
    v13 = v11;
  else
    v13 = height;
  maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
  if (!self->_useNonLocalRegularization
    || (v15 = (__CVBuffer *)sub_227627BD4(v12, (const char *)v13, 0x4C303068u), (self->_w_pxbuf = v15) != 0))
  {
    v16 = 0;
    v17 = ((int)v12 + maxThreadExecutionWidth - 1) / maxThreadExecutionWidth * maxThreadExecutionWidth * v13;
    v62 = v17;
    v63 = 8 * v17;
    Adiagb_buf = self->_Adiagb_buf;
    v19 = 2 * v17;
    Ixy_buf = self->_Ixy_buf;
    uv_fwd_pxbuf = self->_uv_fwd_pxbuf;
    v22 = 1;
    while (1)
    {
      v23 = v12;
      v24 = v22;
      objc_msgSend_device(self->_mtlContext, a2, v2, v3, v62);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_newBufferWithLength_options_(v25, v26, v63, 0);
      v28 = Adiagb_buf[v16];
      Adiagb_buf[v16] = (MTLBuffer *)v27;

      if (!Adiagb_buf[v16])
        break;
      objc_msgSend_device(self->_mtlContext, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend_newBufferWithLength_options_(v32, v33, v19, 0);
      v35 = Ixy_buf[v16];
      Ixy_buf[v16] = (MTLBuffer *)v34;

      if (!Ixy_buf[v16])
        break;
      v12 = v23;
      v36 = (__CVBuffer *)sub_227627BD4(v23, (const char *)v13, 0x32433068u);
      uv_fwd_pxbuf[v16] = v36;
      if (!v36)
        break;
      v22 = 0;
      v16 = 1;
      if ((v24 & 1) == 0)
      {
        objc_msgSend_device(self->_mtlContext, a2, v2, v3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v37, v38, 4 * (_DWORD)v62, 0);
        idt_buf = self->_idt_buf;
        self->_idt_buf = v39;

        if (!self->_idt_buf)
          return -12786;
        v42 = self->_flow_upper_most_scale;
        if ((int)v42 >= self->_nscales)
          return 0;
        w_tex = self->_w_tex;
LABEL_23:
        v44 = &self->_ref_pyr_size[v42];
        v45 = v44->width;
        v46 = v44->height;
        if (self->_useNonLocalRegularization)
        {
          objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v41, (uint64_t)self->_w_pxbuf, 25, 7, 0, v45, v46);
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = w_tex[v42];
          w_tex[v42] = (MTLTexture *)v47;

        }
        v49 = 0;
        v50 = 1;
        while (1)
        {
          v51 = v50;
          objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_mtlContext, v41, (uint64_t)uv_fwd_pxbuf[v49], 65, 23, 0, v45, v46);
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = self->_uv_fwd_tex[v49];
          v54 = v53[v42];
          v53[v42] = (MTLTexture *)v52;

          v57 = v53[v42];
          if (!v57)
            return -12786;
          v58 = objc_msgSend_newTextureViewWithPixelFormat_(v57, v55, 53, v56);
          v59 = self->_uv_fwd_u32_alias_tex[v49];
          v60 = v59[v42];
          v59[v42] = (MTLTexture *)v58;

          v50 = 0;
          v49 = 1;
          if ((v51 & 1) == 0)
          {
            if (++v42 < self->_nscales)
              goto LABEL_23;
            return 0;
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_setupBufferICP
{
  int width;
  int height;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  MTLBuffer *v11;
  MTLBuffer *icp_reduc_buf;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  MTLBuffer *v18;
  MTLBuffer *icp_param_tform_buf;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  MTLBuffer *v25;
  MTLBuffer *icp_param_tform_extra_buf;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  MTLTexture *v37;
  MTLTexture *icp_derivatives_tg_sum;
  const char *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  MTLTexture *v50;
  MTLTexture *icp_active_tg_indices_tex;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  MTLBuffer *v57;
  MTLBuffer *icp_loss_buf;
  int v59;
  _QWORD v61[3];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  width = (int)self->_ref_size.width;
  height = (int)self->_ref_size.height;
  v62 = 0;
  v63 = 0;
  v64 = 0;
  memset(v61, 0, sizeof(v61));
  objc_msgSend__computeICPThreadgroupsWithSize_threadsPerThreadgroupForPass1_threadgroupsPerGridForPass1_threadsPerThreadgroupForPass2_threadgroupsPerGridForPass2_threadsPerThreadgroupForPass3_threadgroupsPerGridForPass3_(self, a2, 0, (uint64_t)&v62, 0, v61, 0, 0, (double)width, (double)height);
  if ((unint64_t)(192 * v62 * v63) <= 0x7D0)
    v8 = 2000;
  else
    v8 = 192 * v62 * v63;
  objc_msgSend_device(self->_mtlContext, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v9, v10, v8, 0);
  icp_reduc_buf = self->_icp_reduc_buf;
  self->_icp_reduc_buf = v11;

  if (!self->_icp_reduc_buf)
    goto LABEL_13;
  objc_msgSend_device(self->_mtlContext, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v16, v17, 4 * self->_p.length_params, 0);
  icp_param_tform_buf = self->_icp_param_tform_buf;
  self->_icp_param_tform_buf = v18;

  if (!self->_icp_param_tform_buf
    || (objc_msgSend_device(self->_mtlContext, v20, v21, v22),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v23, v24, 4 * self->_p.length_params, 0),
        icp_param_tform_extra_buf = self->_icp_param_tform_extra_buf,
        self->_icp_param_tform_extra_buf = v25,
        icp_param_tform_extra_buf,
        v23,
        !self->_icp_param_tform_extra_buf))
  {
LABEL_13:
    v28 = 0;
    goto LABEL_14;
  }
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v27, 25, (int)v62, (int)v63, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUsage_(v28, v29, 3, v30);
  objc_msgSend_device(self->_mtlContext, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v34, v35, (uint64_t)v28, v36);
  icp_derivatives_tg_sum = self->_icp_derivatives_tg_sum;
  self->_icp_derivatives_tg_sum = v37;

  if (!self->_icp_derivatives_tg_sum)
  {
LABEL_14:
    v59 = -12786;
    goto LABEL_12;
  }
  objc_msgSend__computeICPThreadgroupsForDecimation_threadsPerThreadgroupForUniform_threadsPerThreadgroupForPass1_threadgroupsPerGridForPass1_(self, v39, 2, 0, 0, &v62);
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v40, 63, (int)v62, (int)v63, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUsage_(v41, v42, 3, v43);
  objc_msgSend_device(self->_mtlContext, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v47, v48, (uint64_t)v41, v49);
  icp_active_tg_indices_tex = self->_icp_active_tg_indices_tex;
  self->_icp_active_tg_indices_tex = v50;

  if (self->_icp_active_tg_indices_tex
    && (objc_msgSend_device(self->_mtlContext, v52, v53, v54),
        v55 = (void *)objc_claimAutoreleasedReturnValue(),
        v57 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v55, v56, 168, 0),
        icp_loss_buf = self->_icp_loss_buf,
        self->_icp_loss_buf = v57,
        icp_loss_buf,
        v55,
        self->_icp_loss_buf))
  {
    v59 = 0;
  }
  else
  {
    v59 = -12786;
  }
  v28 = v41;
LABEL_12:

  return v59;
}

- (void)_setDefaultParametersICP
{
  objc_msgSend_setPresetICP_withRegularizerTerms_decimation_factor_(self, a2, 5, 0, 4);
}

- (void)_setICPRegularizerTerms:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t nscales_icp;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  id v20;

  v20 = a3;
  if ((unint64_t)objc_msgSend_count(v20, v4, v5, v6) > 0xA)
    v10 = 10;
  else
    v10 = objc_msgSend_count(v20, v7, v8, v9);
  nscales_icp = self->_nscales_icp;
  if (v10 >= nscales_icp)
    goto LABEL_9;
  if ((unint64_t)objc_msgSend_count(v20, v7, v8, v9) <= 0xA)
  {
    nscales_icp = objc_msgSend_count(v20, v7, v12, v9);
LABEL_9:
    v13 = v20;
    if (!v20)
      goto LABEL_15;
    if (!nscales_icp)
    {
LABEL_14:
      bzero(&self->_icp_regularizer_term[nscales_icp], 40 - 4 * nscales_icp);
      v13 = v20;
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  v13 = v20;
  if (!v20)
    goto LABEL_15;
  nscales_icp = 10;
LABEL_11:
  for (i = 0; i != nscales_icp; ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v7, i, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v15, v16, v17, v18);
    self->_icp_regularizer_term[i] = v19;

    v13 = v20;
  }
  if (nscales_icp <= 9)
    goto LABEL_14;
LABEL_15:

}

- (int)_initICPWeightsWithCommandBuffer:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  MTLTexture *w_icp_tex_user_ref;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[3];
  _QWORD v31[3];

  objc_msgSend_computeCommandEncoder(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v5, v6, (uint64_t)self->_computePipelines[11], v7);
  objc_msgSend_setTexture_atIndex_(v5, v8, (uint64_t)self->_w_icp_tex_user_ref, 0);
  v12 = objc_msgSend_threadExecutionWidth(self->_computePipelines[11], v9, v10, v11);
  v16 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[11], v13, v14, v15) / v12;
  v20 = v12 + objc_msgSend_width(self->_w_icp_tex_user_ref, v17, v18, v19) - 1;
  w_icp_tex_user_ref = self->_w_icp_tex_user_ref;
  v31[0] = v20 / v12;
  v31[1] = (int)(v16 + objc_msgSend_height(w_icp_tex_user_ref, v22, v23, v24) - 1) / v16;
  v31[2] = 1;
  v30[0] = v12;
  v30[1] = v16;
  v30[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v5, v25, (uint64_t)v31, (uint64_t)v30);
  objc_msgSend_endEncoding(v5, v26, v27, v28);

  return 0;
}

- (int)_computeFeaturesAndTGSumWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[3];
  _QWORD v39[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v13, v14, (uint64_t)self->_computePipelines[4], v15);
  objc_msgSend_setTexture_atIndex_(v13, v16, (uint64_t)v9, 0);
  objc_msgSend_setTexture_atIndex_(v13, v17, (uint64_t)v8, 1);

  objc_msgSend_setTexture_atIndex_(v13, v18, (uint64_t)self->_w_icp_tex_user_ref, 2);
  objc_msgSend_setTexture_atIndex_(v13, v19, (uint64_t)self->_icp_derivatives_tg_sum, 3);
  LODWORD(a3) = objc_msgSend_threadExecutionWidth(self->_computePipelines[4], v20, v21, v22);
  LODWORD(v8) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[4], v23, v24, v25) / (int)a3;
  v29 = (int)((_DWORD)a3 + objc_msgSend_width(v9, v26, v27, v28) - 1) / (int)a3;
  LODWORD(self) = objc_msgSend_height(v9, v30, v31, v32);

  v39[0] = v29;
  v39[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v39[2] = 1;
  v38[0] = (int)a3;
  v38[1] = (int)v8;
  v38[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v13, v33, (uint64_t)v39, (uint64_t)v38);
  objc_msgSend_endEncoding(v13, v34, v35, v36);

  return 0;
}

- (int)_resampleTransformWithCommandBuffer:(id)a3 from:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int64x2_t v35;
  uint64_t v36;
  int64x2_t v37;
  uint64_t v38;
  _DWORD v39[4];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v8 = a5;
  v9 = a4;
  objc_msgSend_computeCommandEncoder(a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  v39[0] = objc_msgSend_width(v9, v14, v15, v16);
  LODWORD(a3) = objc_msgSend_height(v9, v17, v18, v19);

  v39[1] = (_DWORD)a3;
  v39[2] = objc_msgSend_width(v8, v20, v21, v22);
  LODWORD(a3) = objc_msgSend_height(v8, v23, v24, v25);

  v39[3] = (_DWORD)a3;
  objc_msgSend_setComputePipelineState_(v13, v26, (uint64_t)self->_computePipelines[10], v27);
  objc_msgSend_setBuffer_offset_atIndex_(v13, v28, (uint64_t)self->_icp_param_tform_buf, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v13, v29, (uint64_t)v39, 96, 1);
  v37 = vdupq_n_s64(1uLL);
  v38 = 1;
  v35 = v37;
  v36 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v13, v30, (uint64_t)&v37, (uint64_t)&v35);
  objc_msgSend_endEncoding(v13, v31, v32, v33);

  return 0;
}

- (void)_computeICPThreadgroupsWithSize:(id *)a3 computePipeline:(id)a4 threadsPerThreadgroup:(id *)a5 threadgroupsPerGrid:(id *)a6 debug_string:(char *)a7
{
  unint64_t var1;
  unint64_t var0;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;

  var0 = a3->var0;
  var1 = a3->var1;
  v11 = a4;
  v15 = (int)objc_msgSend_threadExecutionWidth(v11, v12, v13, v14);
  v19 = objc_msgSend_maxTotalThreadsPerThreadgroup(v11, v16, v17, v18);

  v20 = v19 / v15;
  if (a5)
  {
    a5->var0 = v15;
    a5->var1 = v20;
    a5->var2 = 1;
  }
  if (a6)
  {
    a6->var0 = (var0 + v15 - 1) / v15;
    a6->var1 = (var1 + v20 - 1) / v20;
    a6->var2 = 1;
  }
}

- (void)_computeICPThreadgroupsWithSize:(CGSize)a3 threadsPerThreadgroupForPass1:(id *)a4 threadgroupsPerGridForPass1:(id *)a5 threadsPerThreadgroupForPass2:(id *)a6 threadgroupsPerGridForPass2:(id *)a7 threadsPerThreadgroupForPass3:(id *)a8 threadgroupsPerGridForPass3:(id *)a9
{
  MTLComputePipelineState *v16;
  const char *v17;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *v19;
  const char *v20;
  __int128 v21;
  unint64_t var2;

  v16 = self->_computePipelines[6];
  *(_QWORD *)&v21 = (unint64_t)a3.width;
  *((_QWORD *)&v21 + 1) = (unint64_t)a3.height;
  var2 = 1;
  objc_msgSend__computeICPThreadgroupsWithSize_computePipeline_threadsPerThreadgroup_threadgroupsPerGrid_debug_string_(self, a2, (uint64_t)&v21, (uint64_t)v16, a4, a5, "pass1");
  if (!a4 || a4->var0 == 32 && a4->var1 == 32)
  {
    v18 = self->_computePipelines[7];
    v21 = *(_OWORD *)&a5->var0;
    var2 = a5->var2;
    objc_msgSend__computeICPThreadgroupsWithSize_computePipeline_threadsPerThreadgroup_threadgroupsPerGrid_debug_string_(self, v17, (uint64_t)&v21, (uint64_t)v18, a6, a7, "pass2");
    v19 = self->_computePipelines[7];
    v21 = *(_OWORD *)&a7->var0;
    var2 = a7->var2;
    objc_msgSend__computeICPThreadgroupsWithSize_computePipeline_threadsPerThreadgroup_threadgroupsPerGrid_debug_string_(self, v20, (uint64_t)&v21, (uint64_t)v19, a8, a9, "pass3");
  }
}

- (void)_computeICPThreadgroupsForDecimation:(unint64_t)a3 threadsPerThreadgroupForUniform:(id *)a4 threadsPerThreadgroupForPass1:(id *)a5 threadgroupsPerGridForPass1:(id *)a6
{
  if (a3)
  {
    if (a6)
      a6->var1 /= a3;
    if (a4)
    {
      if (a5)
        *(_OWORD *)&a4->var0 = *(_OWORD *)&a5->var0;
    }
  }
  else if (a4)
  {
    a4->var0 = 0;
    a4->var1 = 0;
  }
}

- (void)_computeICPThreadgroupsForActivation:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    a3->var0 = (unint64_t)objc_msgSend_width(self->_icp_derivatives_tg_sum, a2, (uint64_t)a3, v3) >> 1;
    a3->var1 = (unint64_t)objc_msgSend_height(self->_icp_derivatives_tg_sum, v6, v7, v8) >> 1;
    a3->var2 = 1;
  }
}

- (int)_getICPNWarp:(int)a3 scale:(int)a4
{
  int v4;

  if (a4 < 2)
    v4 = 2;
  else
    v4 = 3;
  if (a3 == 1000)
    return v4;
  else
    return a3;
}

- (uint64_t)_panoRegistration:(double)a3 metadata:(double)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  int v46;
  id *v47;
  const char *v48;
  id v49;
  id v50;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  char v57;
  uint64_t v58;
  int ICPNWarp_scale;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  void *v94;
  void *v95;
  id *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v103;
  int v105;
  uint64_t v107;

  v7 = a6;
  objc_msgSend__setParametricTransformFromGyro_((void *)a1, v8, v9, v10, a2, a3, a4);
  objc_msgSend__copyTransfromToGPU((void *)a1, v11, v12, v13);
  v17 = *(_DWORD *)(a1 + 2176);
  v18 = (v17 - 1);
  if (v17 >= 1)
  {
    v86 = v7;
    v19 = 0;
    v20 = 0;
    v21 = a1 + 864;
    v98 = a1 + 1040;
    v90 = a1 + 1120;
    v91 = a1 + 528;
    v103 = a1 + 1360;
    v96 = (id *)(a1 + 2008);
    v97 = a1 + 1248;
    v87 = a1 + 688;
    v88 = a1 + 1680;
    v107 = a1;
    v89 = a1 + 2104;
    v105 = v17 - 1;
    v99 = a1 + 864;
    v100 = a1 + 944;
    do
    {
      v22 = v19;
      v23 = *(id *)(v91 + 80 * *(int *)(v107 + 2000) + 8 * v18);
      v24 = *(id *)(v91 + 80 * (*(_DWORD *)(v107 + 2000) ^ 1) + 8 * v18);
      objc_msgSend_commandBuffer(*(void **)(v107 + 16), v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v29, (uint64_t)CFSTR("Panorama:panoRegistration level %d"), v30, v18);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLabel_(v28, v32, (uint64_t)v31, v33);

      if (v18 || (v36 = *(int *)(v107 + 2192), !(_DWORD)v36))
      {
        objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_((void *)v107, v34, (uint64_t)v28, (uint64_t)v23, *(_QWORD *)(v21 + 8 * v18));
        v92 = 0;
        v36 = 0;
      }
      else
      {
        objc_msgSend__computeFeaturesAndTGSumWithCommandBuffer_in_tex_out_tex_((void *)v107, v34, (uint64_t)v28, (uint64_t)v23, *(_QWORD *)(v107 + 864));
        v92 = 1;
      }
      objc_msgSend__computeFeaturesWithCommandBuffer_in_tex_out_tex_((void *)v107, v35, (uint64_t)v28, (uint64_t)v24, *(_QWORD *)(v100 + 8 * v18));
      objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_((void *)v107, v37, (uint64_t)v28, *(_QWORD *)(v21 + 8 * v18), *(_QWORD *)(v98 + 8 * v18));
      objc_msgSend__computeFeaturesDerivativesWithCommandBuffer_in_tex_out_tex_((void *)v107, v38, (uint64_t)v28, *(_QWORD *)(v100 + 8 * v18), *(_QWORD *)(v90 + 8 * v18));
      v42 = v107;
      v94 = v24;
      v95 = v23;
      if (v18 >= *(int *)(v107 + 2196))
      {
        v44 = *(_DWORD *)(v107 + 2180);
        if (v44 < 1)
        {
          v101 = 0;
        }
        else
        {
          v45 = (uint64_t)v28;
          v46 = 0;
          v101 = 0;
          do
          {
            if (v46 + 1 != v44 || v18 != *(_DWORD *)(v42 + 2196) || (v47 = v96, *(_BYTE *)(v42 + 2169)))
              v47 = (id *)(v103 + 80 * (v20 ^ 1) + 8 * v18);
            v49 = *v47;
            if (*(_BYTE *)(v107 + 2169) && v46 + 1 == *(_DWORD *)(v107 + 2180))
            {
              v50 = *(id *)(v97 + 8 * v18);

              v101 = v50;
            }
            objc_msgSend__doSolverWithCommandBuffer_scale_in_uv_tex_in_G0_tex_in_G1_tex_in_C0_tex_in_C1_tex_out_uv_tex_out_w_tex_((void *)v107, v48, v45, v18, *(_QWORD *)(v103 + 80 * v20 + 8 * v105), *(_QWORD *)(v99 + 8 * v18), *(_QWORD *)(v100 + 8 * v18), *(_QWORD *)(v98 + 8 * v18), *(_QWORD *)(v90 + 8 * v18), v49, v101);
            v20 ^= 1uLL;

            v42 = v107;
            v44 = *(_DWORD *)(v107 + 2180);
            ++v46;
            v105 = v18;
          }
          while (v46 < v44);
          v105 = v18;
          v28 = (void *)v45;
        }
        if (*(_BYTE *)(v42 + 2169))
        {
          v51 = v20 ^ 1;
          v52 = v96;
          if (v18 != *(_DWORD *)(v42 + 2196))
            v52 = (id *)(v103 + 80 * (v20 ^ 1) + 8 * v18);
          v53 = *(_QWORD *)(v88 + 80 * v20 + 8 * v18);
          v43 = v28;
          objc_msgSend__doNLRegularizationWithCommandBuffer_in_uv_tex_join_tex_w_tex_out_uv_tex_((void *)v107, v39, (uint64_t)v28, v53, *(_QWORD *)(v87 + 80 * *(int *)(v42 + 2000) + 8 * v18), v101, *v52);
          v42 = v107;
          v93 = v51;
        }
        else
        {
          v93 = v20;
          v43 = v28;
        }
      }
      else
      {
        v93 = v20;
        v43 = v28;
        v101 = 0;
      }
      v54 = *(int *)(v42 + 2184);
      v55 = v99;
      if (v18 < v54)
      {
        if (v18 < v54 - 1)
        {
          v56 = (_QWORD *)(v91 + 80 * *(int *)(v107 + 2000) + 8 * v18);
          objc_msgSend__resampleTransformWithCommandBuffer_from_to_((void *)v107, v39, (uint64_t)v43, v56[1], *v56);
        }
        v57 = v92 ^ 1;
        if (v18)
          v57 = 1;
        v58 = v107;
        if ((v57 & 1) == 0)
        {
          objc_msgSend__computeActiveThreadgroupsWithCommandBuffer_((void *)v107, v39, (uint64_t)v43, v41);
          v58 = v107;
        }
        ICPNWarp_scale = objc_msgSend__getICPNWarp_scale_((void *)v58, v39, *(unsigned int *)(v58 + 2188), v18);
        v55 = v99;
        v61 = v100;
        if (ICPNWarp_scale >= 1)
        {
          v62 = (ICPNWarp_scale + 1);
          v63 = 1;
          do
          {
            v64 = *(_QWORD *)(v61 + 8 * v18);
            LODWORD(v60) = *(_DWORD *)(v89 + 4 * v18);
            v65 = v61;
            v66 = v55;
            objc_msgSend__computeHomographyWithCommandBuffer_in_tex0_in_tex1_in_tex2_weight_tex_regularizer_term_decimation_factor_scale_nwarp_((void *)v58, v39, (uint64_t)v43, *(_QWORD *)(v55 + 8 * v18), v64, *(_QWORD *)(v98 + 8 * v18), *(_QWORD *)(v58 + 2144), v36, v60, v18, v63);
            v55 = v66;
            v61 = v65;
            ++v63;
          }
          while (v62 != v63);
        }
      }
      v21 = v55;
      objc_msgSend_commit(v43, v39, v40, v41);

      v67 = v18-- <= 0;
      v19 = v43;
      v20 = v93;
    }
    while (!v67);

    v7 = v86;
    a1 = v107;
  }
  objc_msgSend_commandBuffer(*(void **)(a1 + 16), v14, v15, v16);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v69, (uint64_t)CFSTR("Fang weights and residuals"), v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v68, v72, (uint64_t)v71, v73);

  objc_msgSend__computeICPWeights_weights_flow_((void *)a1, v74, (uint64_t)v68, *(_QWORD *)(a1 + 2144), *(_QWORD *)(a1 + 2008));
  objc_msgSend__computeICPResiduals_flow_((void *)a1, v75, (uint64_t)v68, *(_QWORD *)(a1 + 2008));
  objc_msgSend_commit(v68, v76, v77, v78);
  objc_msgSend_waitUntilCompleted(v68, v79, v80, v81);
  objc_msgSend__copyTransfromFromGPU((void *)a1, v82, v83, v84);

  return 0;
}

- (int)_computeICPWeights:(id)a3 weights:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD v110[3];
  _QWORD v111[3];
  int64x2_t v112;
  uint64_t v113;
  int64x2_t v114;
  uint64_t v115;
  _QWORD v116[4];
  __int128 v117;
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[3];

  v120[1] = *MEMORY[0x24BDAC8D0];
  v120[0] = 0x4220000041200000;
  if (self->_flow_upper_most_scale >= 1)
    v120[0] = 0x41A0000040A00000;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_computeCommandEncoder(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v14, v15, (uint64_t)self->_computePipelines[12], v16);
  objc_msgSend_setTexture_atIndex_(v14, v17, (uint64_t)v9, 0);
  objc_msgSend_setTexture_atIndex_(v14, v18, (uint64_t)v8, 1);

  objc_msgSend_setBuffer_offset_atIndex_(v14, v19, (uint64_t)self->_icp_param_tform_extra_buf, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v14, v20, (uint64_t)v120, 8, 1);
  LODWORD(v8) = objc_msgSend_threadExecutionWidth(self->_computePipelines[12], v21, v22, v23);
  v27 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[12], v24, v25, v26) / (int)v8;
  v119[0] = (int)((_DWORD)v8 + objc_msgSend_width(v9, v28, v29, v30) - 1) / (int)v8;
  v119[1] = (int)(v27 + objc_msgSend_height(v9, v31, v32, v33) - 1) / v27;
  v119[2] = 1;
  v118[0] = (int)v8;
  v118[1] = v27;
  v118[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v14, v34, (uint64_t)v119, (uint64_t)v118);
  objc_msgSend_endEncoding(v14, v35, v36, v37);
  v116[0] = 256;
  memset(&v116[1], 0, 24);
  __asm { FMOV            V0.4S, #1.0 }
  v117 = _Q0;
  v43 = objc_alloc(MEMORY[0x24BDDE3D8]);
  objc_msgSend_device(self->_mtlContext, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend_initWithDevice_histogramInfo_(v43, v48, (uint64_t)v47, (uint64_t)v116);

  v53 = objc_msgSend_pixelFormat(v9, v50, v51, v52);
  v56 = objc_msgSend_histogramSizeForSourceFormat_(v49, v54, v53, v55);
  objc_msgSend_device(self->_mtlContext, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend_newBufferWithLength_options_(v60, v61, v56, 0);

  objc_msgSend_encodeToCommandBuffer_sourceTexture_histogram_histogramOffset_(v49, v63, (uint64_t)v10, (uint64_t)v9, v62, 0);
  objc_msgSend_device(self->_mtlContext, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend_newBufferWithLength_options_(v67, v68, 4, 0);

  objc_msgSend_computeCommandEncoder(v10, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setComputePipelineState_(v73, v74, (uint64_t)self->_computePipelines[13], v75);
  objc_msgSend_setBuffer_offset_atIndex_(v73, v76, (uint64_t)v62, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v73, v77, (uint64_t)v116, 8, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v73, v78, (uint64_t)v69, 0, 2);
  v114 = vdupq_n_s64(1uLL);
  v115 = 1;
  v112 = v114;
  v113 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v73, v79, (uint64_t)&v114, (uint64_t)&v112);
  objc_msgSend_endEncoding(v73, v80, v81, v82);
  objc_msgSend_computeCommandEncoder(v10, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setComputePipelineState_(v86, v87, (uint64_t)self->_computePipelines[14], v88);
  objc_msgSend_setTexture_atIndex_(v86, v89, (uint64_t)v9, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v86, v90, (uint64_t)v69, 0, 0);
  LODWORD(v10) = objc_msgSend_threadExecutionWidth(self->_computePipelines[14], v91, v92, v93);
  LODWORD(v73) = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[14], v94, v95, v96) / (int)v10;
  v100 = (int)((_DWORD)v10 + objc_msgSend_width(v9, v97, v98, v99) - 1) / (int)v10;
  v104 = objc_msgSend_height(v9, v101, v102, v103);

  v111[0] = v100;
  v111[1] = ((int)v73 + v104 - 1) / (int)v73;
  v111[2] = 1;
  v110[0] = (int)v10;
  v110[1] = (int)v73;
  v110[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v86, v105, (uint64_t)v111, (uint64_t)v110);
  objc_msgSend_endEncoding(v86, v106, v107, v108);

  return 0;
}

- (int)_computeICPResiduals:(id)a3 flow:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[3];
  _QWORD v36[3];

  v6 = a4;
  objc_msgSend_computeCommandEncoder(a3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v10, v11, (uint64_t)self->_computePipelines[15], v12);
  objc_msgSend_setTexture_atIndex_(v10, v13, (uint64_t)v6, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v10, v14, (uint64_t)self->_icp_param_tform_extra_buf, 0, 0);
  v18 = objc_msgSend_threadExecutionWidth(self->_computePipelines[15], v15, v16, v17);
  v22 = (int)objc_msgSend_maxTotalThreadsPerThreadgroup(self->_computePipelines[15], v19, v20, v21) / v18;
  v26 = (int)(v18 + objc_msgSend_width(v6, v23, v24, v25) - 1) / v18;
  LODWORD(self) = objc_msgSend_height(v6, v27, v28, v29);

  v36[0] = v26;
  v36[1] = (v22 + (int)self - 1) / v22;
  v36[2] = 1;
  v35[0] = v18;
  v35[1] = v22;
  v35[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v10, v30, (uint64_t)v36, (uint64_t)v35);
  objc_msgSend_endEncoding(v10, v31, v32, v33);

  return 0;
}

- (int)_computeActiveThreadgroupsWithCommandBuffer:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  uint64_t v19;
  int64x2_t v20;
  uint64_t v21;
  _OWORD v22[6];
  __int128 v23;
  uint64_t v24;

  objc_msgSend_computeCommandEncoder(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0uLL;
  v24 = 0;
  objc_msgSend__computeICPThreadgroupsForActivation_(self, v6, (uint64_t)&v23, v7);
  memset(v22, 0, sizeof(v22));
  LODWORD(v22[0]) = self->_decimation_factor_icp;
  DWORD2(v22[0]) = v23;
  objc_msgSend_setComputePipelineState_(v5, v8, (uint64_t)self->_computePipelines[8], v9);
  objc_msgSend_setTexture_atIndex_(v5, v10, (uint64_t)self->_icp_derivatives_tg_sum, 0);
  objc_msgSend_setTexture_atIndex_(v5, v11, (uint64_t)self->_icp_active_tg_indices_tex, 1);
  objc_msgSend_setBytes_length_atIndex_(v5, v12, (uint64_t)v22, 96, 0);
  v20 = vdupq_n_s64(1uLL);
  v21 = 1;
  v18 = v23;
  v19 = v24;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v5, v13, (uint64_t)&v20, (uint64_t)&v18);
  objc_msgSend_endEncoding(v5, v14, v15, v16);

  return 0;
}

- (int)_computeHomographyWithCommandBuffer:(id)a3 in_tex0:(id)a4 in_tex1:(id)a5 in_tex2:(id)a6 weight_tex:(id)a7 regularizer_term:(float)a8 decimation_factor:(unint64_t)a9 scale:(unint64_t)a10 nwarp:(unint64_t)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  int32x4_t v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  int64x2_t v89;
  uint64_t v90;
  int64x2_t v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  int32x4_t v95;
  __int128 v96;
  int32x4_t v97;
  int32x4_t v98;
  int32x4_t v99;
  __int128 v100;
  int32x4_t v101;
  uint64_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int32x4_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  _DWORD v109[2];
  _BYTE v110[24];
  __int128 v111;
  int32x4_t v112;
  int32x4_t v113;
  __int128 v114;
  int32x4_t v115;
  uint64_t v116;
  int32x4_t v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  int32x4_t v121;
  uint64_t v122;
  int32x4_t v123;
  uint64_t v124;
  int32x4_t v125;
  uint64_t v126;
  int32x4_t v127;
  uint64_t v128;

  v18 = a4;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  objc_msgSend_computeCommandEncoder(a3, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0uLL;
  v128 = 0;
  v125 = 0uLL;
  v126 = 0;
  v123 = 0uLL;
  v124 = 0;
  v121 = 0uLL;
  v122 = 0;
  v119 = 0uLL;
  v120 = 0;
  v117 = 0uLL;
  v118 = 0;
  v29 = (double)(unint64_t)objc_msgSend_width(v18, v26, v27, v28);
  v33 = objc_msgSend_height(v18, v30, v31, v32);
  objc_msgSend__computeICPThreadgroupsWithSize_threadsPerThreadgroupForPass1_threadgroupsPerGridForPass1_threadsPerThreadgroupForPass2_threadgroupsPerGridForPass2_threadsPerThreadgroupForPass3_threadgroupsPerGridForPass3_(self, v34, (uint64_t)&v127, (uint64_t)&v125, &v123, &v121, &v119, &v117, v29, (double)(unint64_t)v33);
  v115 = 0uLL;
  v116 = 0;
  objc_msgSend__computeICPThreadgroupsForDecimation_threadsPerThreadgroupForUniform_threadsPerThreadgroupForPass1_threadgroupsPerGridForPass1_(self, v35, a9, (uint64_t)&v115, &v127, &v125);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  *(_OWORD *)&v110[8] = 0u;
  v109[0] = objc_msgSend_width(v18, v36, v37, v38);
  v109[1] = objc_msgSend_height(v18, v39, v40, v41);
  *(int32x4_t *)v110 = vuzp1q_s32(v125, v115);
  v87 = *(int32x4_t *)(MEMORY[0x24BDAEDF8] + 16);
  v88 = *(int32x4_t *)MEMORY[0x24BDAEDF8];
  v111 = *MEMORY[0x24BDAEDF8];
  v112 = v87;
  v86 = *(int32x4_t *)(MEMORY[0x24BDAEDF8] + 32);
  v113 = v86;
  LODWORD(v114) = 0;
  objc_msgSend_setComputePipelineState_(v25, v42, (uint64_t)self->_computePipelines[6], v43);
  objc_msgSend_setTexture_atIndex_(v25, v44, (uint64_t)v18, 0);
  objc_msgSend_setTexture_atIndex_(v25, v45, (uint64_t)v21, 1);

  objc_msgSend_setTexture_atIndex_(v25, v46, (uint64_t)v20, 2);
  objc_msgSend_setTexture_atIndex_(v25, v47, (uint64_t)v19, 3);

  objc_msgSend_setTexture_atIndex_(v25, v48, (uint64_t)self->_icp_active_tg_indices_tex, 4);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v49, (uint64_t)self->_icp_reduc_buf, 0, 0);
  objc_msgSend_setBytes_length_atIndex_(v25, v50, (uint64_t)v109, 96, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v51, (uint64_t)self->_icp_param_tform_buf, 0, 2);
  objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v52, 1024, 0);
  v103 = v125;
  v104.i64[0] = v126;
  v95 = v127;
  *(_QWORD *)&v96 = v128;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v53, (uint64_t)&v103, (uint64_t)&v95);
  v57 = 0uLL;
  if (v125.i64[1] * v125.i64[0] >= 2uLL)
  {
    v103 = vuzp1q_s32(v125, v121);
    v104 = 0uLL;
    v104.i32[1] = 0;
    v105 = v88;
    v106 = v87;
    v107 = v86;
    v108 = 0uLL;
    objc_msgSend_setComputePipelineState_(v25, v54, (uint64_t)self->_computePipelines[7], v56);
    objc_msgSend_setBuffer_offset_atIndex_(v25, v58, (uint64_t)self->_icp_reduc_buf, 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v25, v59, (uint64_t)&v103, 96, 1);
    objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v60, 5120, 0);
    objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v61, 1024, 1);
    v95 = v121;
    *(_QWORD *)&v96 = v122;
    v101 = v123;
    v102 = v124;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v62, (uint64_t)&v95, (uint64_t)&v101);
    if (v121.i64[1] * v121.i64[0] >= 2uLL)
    {
      v95 = vuzp1q_s32(v121, v117);
      v96 = 0u;
      DWORD1(v96) = 0;
      v97 = v88;
      v98 = v87;
      v99 = v86;
      v100 = 0u;
      objc_msgSend_setComputePipelineState_(v25, v54, (uint64_t)self->_computePipelines[7], v56);
      objc_msgSend_setBuffer_offset_atIndex_(v25, v63, (uint64_t)self->_icp_reduc_buf, 0, 0);
      objc_msgSend_setBytes_length_atIndex_(v25, v64, (uint64_t)&v95, 96, 1);
      objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v65, 5120, 0);
      objc_msgSend_setThreadgroupMemoryLength_atIndex_(v25, v66, 1024, 1);
      v101 = v117;
      v102 = v118;
      v93 = v119;
      v94 = v120;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v25, v67, (uint64_t)&v101, (uint64_t)&v93);
    }
    v57 = 0uLL;
  }
  v107 = v57;
  v108 = v57;
  v105 = v57;
  v106 = v57;
  v103 = v57;
  v104 = v57;
  v68 = objc_msgSend_width(v18, v54, v55, v56);
  *(float *)v108.i32 = (float)(unint64_t)(objc_msgSend_height(v18, v69, v70, v71) * v68) * a8;
  v95.i16[0] = a10;
  v95.i16[1] = a11 - 1;
  objc_msgSend_setComputePipelineState_(v25, v72, (uint64_t)self->_computePipelines[9], v73);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v74, (uint64_t)self->_icp_reduc_buf, 0, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v75, (uint64_t)self->_icp_param_tform_buf, 0, 1);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v76, (uint64_t)self->_icp_param_tform_extra_buf, 0, 2);
  objc_msgSend_setBuffer_offset_atIndex_(v25, v77, (uint64_t)self->_icp_loss_buf, 0, 3);
  objc_msgSend_setBytes_length_atIndex_(v25, v78, (uint64_t)&v103, 96, 4);
  objc_msgSend_setBytes_length_atIndex_(v25, v79, (uint64_t)&self->_flow_upper_most_scale, 4, 5);
  objc_msgSend_setBytes_length_atIndex_(v25, v80, (uint64_t)&v95, 4, 6);
  v91 = vdupq_n_s64(1uLL);
  v92 = 1;
  v89 = v91;
  v90 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v25, v81, (uint64_t)&v91, (uint64_t)&v89);
  objc_msgSend_endEncoding(v25, v82, v83, v84);

  return 0;
}

- (uint64_t)_setParametricTransformFromGyro:(uint64_t)a3
{
  uint64_t result;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend__matrix3x3ToParametricTransform_(a1, a2, a3, a4);
  if (a1[546] >= 2)
  {
    v7 = 0;
    do
    {
      v8 = (uint64_t)&a1[20 * a1[500] + 2 * v7++];
      result = objc_msgSend__resampleTransform_to_(a1, v6, *(_QWORD *)(v8 + 528), *(_QWORD *)(v8 + 536));
    }
    while (v7 < a1[546] - 1);
  }
  return result;
}

- (double)_matrix3x3ToParametricTransform:(__n128)a3
{
  uint64_t v4;
  int v5;
  unint64_t *v6;
  __int128 v7;
  int8x16_t v8;
  __n128 v9;
  __int128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;

  v4 = 0;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  do
  {
    v5 = 0;
    v6 = &v12.n128_u64[2 * v4];
    v7 = *(_OWORD *)v6;
    do
    {
      v11 = v7;
      *(float *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3))) = *(float *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)))
                                                                                   / v14.n128_f32[2];
      v7 = v11;
      *((_DWORD *)v6 + 2) = DWORD2(v11);
      *v6 = v7;
      ++v5;
    }
    while (v5 != 3);
    ++v4;
  }
  while (v4 != 3);
  if (*(_DWORD *)(a1 + 2064) == 8)
  {
    v8 = (int8x16_t)v12;
    v9 = v13;
    *(float *)(a1 + 2032) = v12.n128_f32[0] + -1.0;
    *(int8x8_t *)(a1 + 2036) = vext_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), 4uLL);
    *(_DWORD *)(a1 + 2044) = v9.n128_u32[0];
    *(float *)(a1 + 2048) = v9.n128_f32[1] + -1.0;
    *(_DWORD *)(a1 + 2052) = v9.n128_u32[2];
    *(_QWORD *)&v7 = v14.n128_u64[0];
    *(_QWORD *)(a1 + 2056) = v14.n128_u64[0];
  }
  return *(double *)&v7;
}

- (__n64)_parametricTransformToMatrix3x3
{
  __n64 result;

  if (*(_DWORD *)(a1 + 2064) == 8)
  {
    result.n64_f32[0] = *(float *)(a1 + 2032) + 1.0;
    result.n64_u32[1] = *(_DWORD *)(a1 + 2036);
    __asm { FMOV            V2.4S, #1.0 }
  }
  else
  {
    return (__n64)1065353216;
  }
  return result;
}

- (void)_resampleTransform:(id)a3 to:(id)a4
{
  if (self->_p.length_params == 8)
    MEMORY[0x24BEDD108](self, sel__resampleHomography_to_, a3, a4);
}

- (void)_resampleHomography:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float32x2_t v23;
  float32x2_t v29;
  float32_t v30;

  v6 = a4;
  v7 = a3;
  v11 = (float)(unint64_t)objc_msgSend_width(v6, v8, v9, v10);
  v30 = v11 / (float)(unint64_t)objc_msgSend_width(v7, v12, v13, v14);
  v18 = objc_msgSend_height(v6, v15, v16, v17);

  v22 = objc_msgSend_height(v7, v19, v20, v21);
  v23.f32[0] = (float)(unint64_t)v22;
  self->_p.params[2] = v30 * self->_p.params[2];
  __asm { FMOV            V1.2S, #1.0 }
  _D1.f32[0] = (float)(unint64_t)v18;
  v23.f32[1] = v30;
  v29 = vdiv_f32(_D1, v23);
  *(float32x2_t *)&self->_p.params[5] = vmul_f32(v29, *(float32x2_t *)&self->_p.params[5]);
  self->_p.params[7] = (float)(1.0 / v29.f32[0]) * self->_p.params[7];
}

- (void)_copyTransfromFromGPU
{
  uint64_t v2;
  uint64_t v3;
  float *v5;
  uint64_t length_params;
  parametric_transform *p_p;
  float v8;

  v5 = (float *)objc_msgSend_contents(self->_icp_param_tform_buf, a2, v2, v3);
  length_params = self->_p.length_params;
  if ((int)length_params >= 1)
  {
    p_p = &self->_p;
    do
    {
      v8 = *v5++;
      p_p->params[0] = v8;
      p_p = (parametric_transform *)((char *)p_p + 4);
      --length_params;
    }
    while (length_params);
  }
}

- (void)_copyTransfromToGPU
{
  uint64_t v2;
  uint64_t v3;
  float *v5;
  uint64_t length_params;
  parametric_transform *p_p;
  float v8;

  v5 = (float *)objc_msgSend_contents(self->_icp_param_tform_buf, a2, v2, v3);
  length_params = self->_p.length_params;
  if ((int)length_params >= 1)
  {
    p_p = &self->_p;
    do
    {
      v8 = p_p->params[0];
      p_p = (parametric_transform *)((char *)p_p + 4);
      *v5++ = v8;
      --length_params;
    }
    while (length_params);
  }
}

- (void)_resetLoss
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = objc_msgSend_contents(self->_icp_loss_buf, a2, v2, v3);
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_OWORD *)(v4 + 128) = 0u;
  *(_OWORD *)(v4 + 144) = 0u;
  *(_QWORD *)(v4 + 160) = 0;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (int)inputPixelFormat
{
  return self->_inputPixelFormat;
}

- (void)setInputPixelFormat:(int)a3
{
  self->_inputPixelFormat = a3;
}

- (CGSize)ref_size
{
  double width;
  double height;
  CGSize result;

  width = self->_ref_size.width;
  height = self->_ref_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)aux_size
{
  double width;
  double height;
  CGSize result;

  width = self->_aux_size.width;
  height = self->_aux_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)nscales
{
  return self->_nscales;
}

- (int)streamFrameCount
{
  return self->_streamFrameCount;
}

- (int)nwarpings
{
  return self->_nwarpings;
}

- (void)setNwarpings:(int)a3
{
  self->_nwarpings = a3;
}

- (int)nscales_icp
{
  return self->_nscales_icp;
}

- (int)warping_scheme_icp
{
  return self->_warping_scheme_icp;
}

- (void)setWarping_scheme_icp:(int)a3
{
  self->_warping_scheme_icp = a3;
}

- (int)decimation_factor_icp
{
  return self->_decimation_factor_icp;
}

- (void)setDecimation_factor_icp:(int)a3
{
  self->_decimation_factor_icp = a3;
}

- (int)flow_upper_most_scale
{
  return self->_flow_upper_most_scale;
}

- (void)setFlow_upper_most_scale:(int)a3
{
  self->_flow_upper_most_scale = a3;
}

- (BOOL)useNonLocalRegularization
{
  return self->_useNonLocalRegularization;
}

- (void)setUseNonLocalRegularization:(BOOL)a3
{
  self->_useNonLocalRegularization = a3;
}

- (int)nlreg_radius
{
  return self->_nlreg_radius;
}

- (void)setNlreg_radius:(int)a3
{
  self->_nlreg_radius = a3;
}

- (int)nlreg_padding
{
  return self->_nlreg_padding;
}

- (void)setNlreg_padding:(int)a3
{
  self->_nlreg_padding = a3;
}

- (float)nlreg_sigma_l
{
  return self->_nlreg_sigma_l;
}

- (void)setNlreg_sigma_l:(float)a3
{
  self->_nlreg_sigma_l = a3;
}

- (float)nlreg_sigma_c
{
  return self->_nlreg_sigma_c;
}

- (void)setNlreg_sigma_c:(float)a3
{
  self->_nlreg_sigma_c = a3;
}

- (float)nlreg_sigma_w
{
  return self->_nlreg_sigma_w;
}

- (void)setNlreg_sigma_w:(float)a3
{
  self->_nlreg_sigma_w = a3;
}

- (parametric_transform)p
{
  __int128 v3;

  v3 = *(_OWORD *)&self[56].length_params;
  *(_OWORD *)retstr->params = *(_OWORD *)&self[56].params[4];
  *(_OWORD *)&retstr->params[4] = v3;
  retstr->length_params = LODWORD(self[57].params[3]);
  return self;
}

- (void)setP:(parametric_transform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)a3->params;
  v4 = *(_OWORD *)&a3->params[4];
  self->_p.length_params = a3->length_params;
  *(_OWORD *)&self->_p.params[4] = v4;
  *(_OWORD *)self->_p.params = v3;
}

- (void)setIsBidirectional:(BOOL)a3
{
  self->_isBidirectional = a3;
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
  uint64_t i3;
  uint64_t i4;

  objc_storeStrong((id *)&self->_icp_active_tg_indices_tex, 0);
  objc_storeStrong((id *)&self->_icp_derivatives_tg_sum, 0);
  objc_storeStrong((id *)&self->_w_icp_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_icp_reduc_buf, 0);
  objc_storeStrong((id *)&self->_icp_loss_buf, 0);
  objc_storeStrong((id *)&self->_icp_param_tform_extra_buf, 0);
  objc_storeStrong((id *)&self->_icp_param_tform_buf, 0);
  objc_storeStrong((id *)&self->_kpt_buf, 0);
  objc_storeStrong((id *)&self->_uv_bwd_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_uv_fwd_tex_user_ref, 0);
  for (i = 0; i != -20; --i)
    objc_storeStrong((id *)&self->_uv_bwd_u32_alias_tex[1][i + 9], 0);
  for (j = 0; j != -20; --j)
    objc_storeStrong((id *)&self->_uv_fwd_u32_alias_tex[1][j + 9], 0);
  for (k = 0; k != -20; --k)
    objc_storeStrong((id *)&self->_uv_bwd_tex[1][k + 9], 0);
  for (m = 0; m != -20; --m)
    objc_storeStrong((id *)&self->_uv_fwd_tex[1][m + 9], 0);
  for (n = 0; n != -10; --n)
    objc_storeStrong((id *)&self->_w_tex[n + 9], 0);
  objc_storeStrong((id *)&self->_idt_buf, 0);
  for (ii = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_Ixy_buf[ii + 1], 0);
  for (jj = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_Adiagb_buf[jj + 1], 0);
  for (kk = 0; kk != -10; --kk)
    objc_storeStrong((id *)&self->_C1_tex[kk + 9], 0);
  for (mm = 0; mm != -10; --mm)
    objc_storeStrong((id *)&self->_C0_tex[mm + 9], 0);
  for (nn = 0; nn != -10; --nn)
    objc_storeStrong((id *)&self->_G1_tex[nn + 9], 0);
  for (i1 = 0; i1 != -10; --i1)
    objc_storeStrong((id *)&self->_G0_tex[i1 + 9], 0);
  for (i2 = 0; i2 != -20; --i2)
    objc_storeStrong((id *)&self->_I_u32_alias_tex[1][i2 + 9], 0);
  for (i3 = 0; i3 != -20; --i3)
    objc_storeStrong((id *)&self->_I_tex[1][i3 + 9], 0);
  for (i4 = 192; i4 != 16; i4 -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i4), 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end
