@implementation CVAFilterInfimumConvolution

- (CVAFilterInfimumConvolution)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 bufferWidth:(unint64_t)a6 bufferHeight:(unint64_t)a7 error:(id *)a8
{
  id v15;
  CVAFilterInfimumConvolution *v16;
  CVAFilterInfimumConvolution *v17;
  void **p_device;
  uint64_t v19;
  MTLTexture *v20;
  uint64_t v21;
  MTLTexture *v22;
  CVAFilterInfimumConvolution *v23;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v15 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CVAFilterInfimumConvolution;
  v16 = -[ImageSaverRegistrator init](&v27, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_5;
  p_device = (void **)&v16->_device;
  objc_storeStrong((id *)&v16->_device, a3);
  objc_storeStrong((id *)&v17->_library, a4);
  objc_storeStrong((id *)&v17->_pipelineLibrary, a5);
  v17->_width = a6;
  v17->_height = a7;
  sub_1B56A2A64(*p_device, 10, v17->_width, a7, 0, a8);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v17->_tmpOutHalf[0];
  v17->_tmpOutHalf[0] = (MTLTexture *)v19;

  sub_1B56A2A64(*p_device, 10, v17->_width, v17->_height, 0, a8);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v17->_tmpOutHalf[1];
  v17->_tmpOutHalf[1] = (MTLTexture *)v21;

  sub_1B5674B88((void **)&v17->_infimumKernel, v17->_library, v17->_pipelineLibrary, *p_device, CFSTR("infimum"), a8, 0);
  if (!v17->_infimumKernel)
    goto LABEL_5;
  sub_1B5674B88((void **)&v17->_infimumConvolutionKernel, v17->_library, v17->_pipelineLibrary, *p_device, CFSTR("infimumConvolution"), a8, 0);
  if (v17->_infimumConvolutionKernel)
    v23 = v17;
  else
LABEL_5:
    v23 = 0;

  return v23;
}

- (void)encodeToCommandBufferInternal:(double)a3 sourceTexture:(double)a4 destinationTexture:(double)a5 config:(uint64_t)a6
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64x2_t v17;
  __int128 v18;
  uint64_t v19;
  uint64x2_t v20;
  uint64_t v21;
  _QWORD v22[4];

  *(double *)v22 = a2;
  *(double *)&v22[1] = a3;
  *(double *)&v22[2] = a4;
  *(double *)&v22[3] = a5;
  v12 = a8;
  v13 = a9;
  objc_msgSend(a7, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLabel:", CFSTR("_infimumConvolutionKernel"));
  objc_msgSend(v14, "setComputePipelineState:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v14, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v14, "setBytes:length:atIndex:", v22, 32, 0);
  v15 = objc_msgSend(v12, "width");
  v16 = objc_msgSend(v12, "height");
  v17.i64[0] = v15;
  v17.i64[1] = v16;
  v20 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v17, 1uLL), 4uLL);
  v21 = 1;
  v19 = 1;
  v18 = xmmword_1B56AC968;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v20, &v18);
  objc_msgSend(v14, "endEncoding");

}

- (void)encodeInfimumToCommandBufferInternal:(id)a3 sourceTexture:(id)a4 smallSourceTexture:(id)a5 destinationTexture:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64x2_t v16;
  __int128 v17;
  uint64_t v18;
  uint64x2_t v19;
  uint64_t v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", CFSTR("_infimumKernel"));
  objc_msgSend(v13, "setComputePipelineState:", self->_infimumKernel);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 2);
  v14 = objc_msgSend(v10, "width");
  v15 = objc_msgSend(v10, "height");
  v16.i64[0] = v14;
  v16.i64[1] = v15;
  v19 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v16, 1uLL), 4uLL);
  v20 = 1;
  v18 = 1;
  v17 = xmmword_1B56AC968;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", &v19, &v17);
  objc_msgSend(v13, "endEncoding");

}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 smallSourceTexture:(id)a5 destinationTexture:(id)a6 orientation:(float)a7 majorRadius:(float)a8 minorRadius:(float)a9 iterations:(unsigned int)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  id v23;
  double v24;
  MTLTexture *v26;
  MTLTexture *v27;
  float v28;
  __float2 v29;
  float32x2_t v30;
  double v31;
  double v32;
  float32x2_t v33;
  double v34;
  unsigned int v35;
  MTLTexture *v36;
  void *v37;
  MTLTexture *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];

  v43 = *(double *)&a9;
  v41 = *(double *)&a8;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v22 = v41;
  v21 = v43;
  v23 = v20;
  LODWORD(v24) = 1.0;
  if (*(float *)&v41 < 0.0 || *(float *)&v41 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v24, v43, v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterInfimumConvolution.mm"), 131, CFSTR("CVAInfimumConvolution: majorRadius not in [0,1]"));

    v21 = v43;
    if (*(float *)&v43 >= 0.0)
    {
LABEL_6:
      LODWORD(v24) = 0.5;
      if (*(float *)&v21 <= 0.5)
        goto LABEL_7;
    }
  }
  else if (*(float *)&v43 >= 0.0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v24, v21, v22);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CVAFilterInfimumConvolution.mm"), 135, CFSTR("CVAInfimumConvolution: minorRadius not in [0,0.5]"));

LABEL_7:
  v26 = self->_tmpOutHalf[0];
  v27 = self->_tmpOutHalf[1];
  if (a10)
  {
    v28 = fmodf(a7 + 0.7854, 3.1416);
    v29 = __sincosf_stret(v28 + -0.7854);
    v30.f32[0] = -(float)(*(float *)&v41 * v29.__sinval);
    *(float *)&v31 = v29.__cosval * *(float *)&v41;
    *((float *)&v31 + 1) = v30.f32[0];
    *(float *)&v32 = -(float)(v29.__cosval * *(float *)&v41);
    v30.f32[1] = *(float *)&v32;
    v33 = vmul_n_f32(vdiv_f32(v30, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v41, 0)), *(float *)&v43);
    v34 = COERCE_DOUBLE(vneg_f32(v33));
    *((float *)&v32 + 1) = -(float)(v29.__sinval * (float)-*(float *)&v41);
    v42 = v32;
    v44 = v31;
    -[CVAFilterInfimumConvolution encodeToCommandBufferInternal:sourceTexture:destinationTexture:config:](self, "encodeToCommandBufferInternal:sourceTexture:destinationTexture:config:", v17, v19, v26, v31, *(double *)&v33);
    v35 = a10 - 1;
    if (a10 == 1)
    {
      v36 = v27;
    }
    else
    {
      do
      {
        v36 = v26;
        v26 = v27;
        -[CVAFilterInfimumConvolution encodeToCommandBufferInternal:sourceTexture:destinationTexture:config:](self, "encodeToCommandBufferInternal:sourceTexture:destinationTexture:config:", v17, v36, v27, v44, *(double *)&v33, v42, v34);
        v27 = v36;
        --v35;
      }
      while (v35);
    }
    v27 = v26;
    v38 = v26;
    v26 = v36;
    -[CVAFilterInfimumConvolution encodeInfimumToCommandBufferInternal:sourceTexture:smallSourceTexture:destinationTexture:](self, "encodeInfimumToCommandBufferInternal:sourceTexture:smallSourceTexture:destinationTexture:", v17, v18, v38, v23);
  }
  else
  {
    objc_msgSend(v17, "blitCommandEncoder");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v47, 0, sizeof(v47));
    v46[0] = objc_msgSend(v18, "width");
    v46[1] = objc_msgSend(v18, "height");
    v46[2] = 1;
    memset(v45, 0, sizeof(v45));
    objc_msgSend(v37, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v18, 0, 0, v47, v46, v23, 0, 0, v45);
    objc_msgSend(v37, "endEncoding");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infimumConvolutionKernel, 0);
  objc_storeStrong((id *)&self->_infimumKernel, 0);
  objc_storeStrong((id *)&self->_tmpOutHalf[1], 0);
  objc_storeStrong((id *)self->_tmpOutHalf, 0);
  objc_storeStrong((id *)&self->_tmpBlurHalf, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
