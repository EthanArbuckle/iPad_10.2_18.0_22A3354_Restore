@implementation XFocalPlane

- (XFocalPlane)initWithDevice:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  XFocalPlane *v9;
  XFocalPlane *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XFocalPlane;
  v9 = -[XFocalPlane init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
  }

  return v10;
}

- (int)allocateResources
{
  int v3;
  MTLBuffer *v4;
  MTLBuffer *minMaxAtomic_buf;
  MTLBuffer *v6;
  MTLBuffer *minMaxResult_buf;
  MTLBuffer *v8;
  MTLBuffer *zeroShiftResult_buf;

  v3 = -[XFocalPlane _compileShadersWithLibrary:](self, "_compileShadersWithLibrary:", self->_library);
  v4 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 8, 32);
  minMaxAtomic_buf = self->_minMaxAtomic_buf;
  self->_minMaxAtomic_buf = v4;

  if (!self->_minMaxAtomic_buf)
    goto LABEL_7;
  v6 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 16, 32);
  minMaxResult_buf = self->_minMaxResult_buf;
  self->_minMaxResult_buf = v6;

  if (!self->_minMaxResult_buf
    || (v8 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0), zeroShiftResult_buf = self->_zeroShiftResult_buf, self->_zeroShiftResult_buf = v8, zeroShiftResult_buf, !self->_zeroShiftResult_buf))
  {
LABEL_7:
    v3 = -12786;
    goto LABEL_5;
  }
  if (v3)
LABEL_5:
    -[XFocalPlane releaseResources](self, "releaseResources");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[XFocalPlane releaseResources](self, "releaseResources");
  v3.receiver = self;
  v3.super_class = (Class)XFocalPlane;
  -[XFocalPlane dealloc](&v3, sel_dealloc);
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4;
  void *v5;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *disparityRefinementPreprocessingKernel;
  void *v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *minMax0_kernel;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *minMax1_kernel;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *minMax2_kernel;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *calc_kernel;
  int v17;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("disparityRefinementPreprocessing"));
  v6 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  disparityRefinementPreprocessingKernel = self->_disparityRefinementPreprocessingKernel;
  self->_disparityRefinementPreprocessingKernel = v6;

  if (!self->_disparityRefinementPreprocessingKernel)
    goto LABEL_8;
  v8 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("fpr_slm_shiftmap_calcminmax0"));

  v9 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v8, 0);
  minMax0_kernel = self->_minMax0_kernel;
  self->_minMax0_kernel = v9;

  if (!self->_minMax0_kernel)
    goto LABEL_9;
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("fpr_slm_shiftmap_calcminmax1"));

  v11 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  minMax1_kernel = self->_minMax1_kernel;
  self->_minMax1_kernel = v11;

  if (!self->_minMax1_kernel)
  {
LABEL_8:
    v17 = -12786;
    goto LABEL_7;
  }
  v8 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("fpr_slm_shiftmap_calcminmax2"));

  v13 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v8, 0);
  minMax2_kernel = self->_minMax2_kernel;
  self->_minMax2_kernel = v13;

  if (!self->_minMax2_kernel)
  {
LABEL_9:
    v17 = -12786;
    v5 = v8;
    goto LABEL_7;
  }
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("fpr_slm_calc"));

  v15 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](self->_device, "newComputePipelineStateWithFunction:error:", v5, 0);
  calc_kernel = self->_calc_kernel;
  self->_calc_kernel = v15;

  if (!self->_calc_kernel)
    goto LABEL_8;
  v17 = 0;
LABEL_7:

  return v17;
}

- (void)releaseResources
{
  MTLComputePipelineState *disparityRefinementPreprocessingKernel;
  MTLComputePipelineState *minMax0_kernel;
  MTLComputePipelineState *minMax1_kernel;
  MTLComputePipelineState *minMax2_kernel;
  MTLComputePipelineState *calc_kernel;
  MTLBuffer *minMaxAtomic_buf;
  MTLBuffer *minMaxResult_buf;
  MTLBuffer *zeroShiftResult_buf;

  disparityRefinementPreprocessingKernel = self->_disparityRefinementPreprocessingKernel;
  self->_disparityRefinementPreprocessingKernel = 0;

  minMax0_kernel = self->_minMax0_kernel;
  self->_minMax0_kernel = 0;

  minMax1_kernel = self->_minMax1_kernel;
  self->_minMax1_kernel = 0;

  minMax2_kernel = self->_minMax2_kernel;
  self->_minMax2_kernel = 0;

  calc_kernel = self->_calc_kernel;
  self->_calc_kernel = 0;

  minMaxAtomic_buf = self->_minMaxAtomic_buf;
  self->_minMaxAtomic_buf = 0;

  minMaxResult_buf = self->_minMaxResult_buf;
  self->_minMaxResult_buf = 0;

  zeroShiftResult_buf = self->_zeroShiftResult_buf;
  self->_zeroShiftResult_buf = 0;

}

- (int)encodeDisparityRefinementPreprocessingOn:(id)a3 alphaTexture:(id)a4 inputDisparityTexture:(id)a5 outputDisparityTexture:(id)a6 configuration:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  _QWORD v23[3];
  _QWORD v24[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  self->_config.zeroShiftPercentile = a7->var0;
  v16 = -[XFocalPlane encodeFocalPlaneCalcOn:disparityTexture:](self, "encodeFocalPlaneCalcOn:disparityTexture:", v12, v14);
  if (v16)
  {
    v21 = v16;
  }
  else
  {
    objc_msgSend(v12, "computeCommandEncoder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v17, "setLabel:", CFSTR("encoder _disparityRefinementPreprocessingKernel"));
      objc_msgSend(v18, "setComputePipelineState:", self->_disparityRefinementPreprocessingKernel);
      objc_msgSend(v18, "setTexture:atIndex:", v13, 0);
      objc_msgSend(v18, "setTexture:atIndex:", v14, 1);
      objc_msgSend(v18, "setTexture:atIndex:", v15, 2);
      objc_msgSend(v18, "setBytes:length:atIndex:", a7, 44, 0);
      objc_msgSend(v18, "setBytes:length:atIndex:", &self->_config, 20, 1);
      objc_msgSend(v18, "setBuffer:offset:atIndex:", self->_zeroShiftResult_buf, 0, 2);
      v19 = -[MTLComputePipelineState threadExecutionWidth](self->_disparityRefinementPreprocessingKernel, "threadExecutionWidth");
      v20 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_disparityRefinementPreprocessingKernel, "maxTotalThreadsPerThreadgroup")/ v19;
      v24[0] = (int)(v19 + objc_msgSend(v15, "width") - 1) / v19;
      v24[1] = (int)(v20 + objc_msgSend(v15, "height") - 1) / v20;
      v24[2] = 1;
      v23[0] = v19;
      v23[1] = v20;
      v23[2] = 1;
      objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v24, v23);
      objc_msgSend(v18, "endEncoding");

      v21 = 0;
    }
    else
    {
      v21 = -1;
    }
  }

  return v21;
}

- (int)encodeMinMaxOn:(id)a3 inputTexture:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int64x2_t v13;
  int64x2_t v14;
  uint64_t v15;
  int64x2_t v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[3];
  int64x2_t v20;
  uint64_t v21;
  int64x2_t v22;
  uint64_t v23;

  v6 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setLabel:", CFSTR("encoder _minMax_kernels"));
    objc_msgSend(v8, "setComputePipelineState:", self->_minMax0_kernel);
    objc_msgSend(v8, "setBuffer:offset:atIndex:", self->_minMaxAtomic_buf, 0, 0);
    v13 = vdupq_n_s64(1uLL);
    v22 = v13;
    v23 = 1;
    v20 = v13;
    v21 = 1;
    objc_msgSend(v8, "dispatchThreadgroups:threadsPerThreadgroup:", &v22, &v20);
    objc_msgSend(v8, "setComputePipelineState:", self->_minMax1_kernel);
    objc_msgSend(v8, "setTexture:atIndex:", v6, 0);
    objc_msgSend(v8, "setBuffer:offset:atIndex:", self->_minMaxAtomic_buf, 0, 0);
    v9 = -[MTLComputePipelineState threadExecutionWidth](self->_minMax1_kernel, "threadExecutionWidth");
    v10 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_minMax1_kernel, "maxTotalThreadsPerThreadgroup")/ v9;
    v19[0] = (int)(v9 + objc_msgSend(v6, "width") - 1) / v9;
    v19[1] = (int)(v10 + objc_msgSend(v6, "height") - 1) / v10;
    v19[2] = 1;
    v18[0] = v9;
    v18[1] = v10;
    v18[2] = 1;
    objc_msgSend(v8, "dispatchThreadgroups:threadsPerThreadgroup:", v19, v18);
    objc_msgSend(v8, "setComputePipelineState:", self->_minMax2_kernel);
    objc_msgSend(v8, "setBuffer:offset:atIndex:", self->_minMaxAtomic_buf, 0, 0);
    objc_msgSend(v8, "setBuffer:offset:atIndex:", self->_minMaxResult_buf, 0, 1);
    v16 = v13;
    v17 = 1;
    v14 = v13;
    v15 = 1;
    objc_msgSend(v8, "dispatchThreadgroups:threadsPerThreadgroup:", &v16, &v14);
    objc_msgSend(v8, "endEncoding");
    v11 = 0;
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (int)encodeFocalPlaneCalcOn:(id)a3 disparityTexture:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = -[XFocalPlane encodeMinMaxOn:inputTexture:](self, "encodeMinMaxOn:inputTexture:", v6, v7);
  if (v8)
  {
    v11 = v8;
  }
  else
  {
    objc_msgSend(v6, "computeCommandEncoder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "setLabel:", CFSTR("encode slm_calc_kernel"));
      objc_msgSend(v10, "setComputePipelineState:", self->_calc_kernel);
      objc_msgSend(v10, "setBytes:length:atIndex:", &self->_config, 20, 0);
      objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_minMaxResult_buf, 0, 1);
      objc_msgSend(v10, "setBuffer:offset:atIndex:", self->_zeroShiftResult_buf, 0, 2);
      objc_msgSend(v10, "setTexture:atIndex:", v7, 0);
      objc_msgSend(v10, "setThreadgroupMemoryLength:atIndex:", 1024, 0);
      v15 = vdupq_n_s64(1uLL);
      v16 = 1;
      v13 = xmmword_192495E90;
      v14 = 1;
      objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", &v15, &v13);
      objc_msgSend(v10, "endEncoding");

      v11 = 0;
    }
    else
    {
      v11 = -1;
    }
  }

  return v11;
}

- ($599F175E452E455E49EC8439362DB023)config
{
  $599F175E452E455E49EC8439362DB023 *result;

  objc_copyStruct(retstr, &self->_config, 20, 1, 0);
  return result;
}

- (void)setConfig:(id *)a3
{
  objc_copyStruct(&self->_config, a3, 20, 1, 0);
}

- (MTLBuffer)minMaxAtomic_buf
{
  return (MTLBuffer *)objc_getProperty(self, a2, 64, 1);
}

- (MTLBuffer)minMaxResult_buf
{
  return (MTLBuffer *)objc_getProperty(self, a2, 72, 1);
}

- (MTLBuffer)zeroShiftResult_buf
{
  return (MTLBuffer *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroShiftResult_buf, 0);
  objc_storeStrong((id *)&self->_minMaxResult_buf, 0);
  objc_storeStrong((id *)&self->_minMaxAtomic_buf, 0);
  objc_storeStrong((id *)&self->_calc_kernel, 0);
  objc_storeStrong((id *)&self->_minMax2_kernel, 0);
  objc_storeStrong((id *)&self->_minMax1_kernel, 0);
  objc_storeStrong((id *)&self->_minMax0_kernel, 0);
  objc_storeStrong((id *)&self->_disparityRefinementPreprocessingKernel, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
