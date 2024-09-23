@implementation VCPCorrelation

- (VCPCorrelation)initWithDevice:(id)a3
{
  id v5;
  VCPCorrelation *v6;
  VCPCorrelation *v7;
  VCPCorrelation *v8;
  VCPCorrelation *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPCorrelation;
  v6 = -[VCPCorrelation init](&v11, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_device, a3), -[VCPCorrelation configureGPU](v7, "configureGPU")))
    v8 = 0;
  else
    v8 = v7;
  v9 = v8;

  return v9;
}

- (int)configureGPU
{
  void *v3;
  MTLDevice *device;
  MTLLibrary *v5;
  id v6;
  MTLLibrary *mtlLibrary;
  void *v8;
  MTLDevice *v9;
  MTLComputePipelineState *v10;
  id v11;
  MTLComputePipelineState *correlationKernel;
  int v13;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  v16 = 0;
  v5 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v3, &v16);
  v6 = v16;
  mtlLibrary = self->_mtlLibrary;
  self->_mtlLibrary = v5;

  v8 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("correlationNonInterleaved"));
  if (v8)
  {
    v9 = self->_device;
    v15 = v6;
    v10 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v9, "newComputePipelineStateWithFunction:error:", v8, &v15);
    v11 = v15;

    correlationKernel = self->_correlationKernel;
    self->_correlationKernel = v10;

    if (self->_correlationKernel)
      v13 = 0;
    else
      v13 = -108;
    v6 = v11;
  }
  else
  {
    v13 = -4;
  }

  return v13;
}

- (int)encodeToCommandBuffer:(id)a3 firstInput:(id)a4 secondInput:(id)a5 correlation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int64x2_t v20;
  uint64_t v21;
  _QWORD v22[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v15 = -50;
  if (v11 && v12 && v13)
  {
    objc_msgSend(v10, "computeCommandEncoder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_msgSend(v11, "width");
      v18 = objc_msgSend(v11, "height");
      objc_msgSend(v16, "setComputePipelineState:", self->_correlationKernel);
      objc_msgSend(v16, "setTexture:atIndex:", v11, 0);
      objc_msgSend(v16, "setTexture:atIndex:", v12, 1);
      objc_msgSend(v16, "setTexture:atIndex:", v14, 2);
      v22[0] = (unint64_t)(v17 + 15) >> 4;
      v22[1] = (unint64_t)(v18 + 15) >> 4;
      v22[2] = 1;
      v20 = vdupq_n_s64(0x10uLL);
      v21 = 1;
      objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v22, &v20);
      objc_msgSend(v16, "endEncoding");
      v15 = 0;
    }
    else
    {
      v15 = -108;
    }

  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationKernel, 0);
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
