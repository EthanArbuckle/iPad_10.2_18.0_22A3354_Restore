@implementation VCPBackwarp

- (VCPBackwarp)initWithDevice:(id)a3
{
  id v5;
  VCPBackwarp *v6;
  VCPBackwarp *v7;
  VCPBackwarp *v8;
  VCPBackwarp *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPBackwarp;
  v6 = -[VCPBackwarp init](&v11, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_device, a3), -[VCPBackwarp configureGPU](v7, "configureGPU")))
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
  MTLComputePipelineState *backwarpKernel;
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

  v8 = (void *)-[MTLLibrary newFunctionWithName:](self->_mtlLibrary, "newFunctionWithName:", CFSTR("backwarpNonInterleaved"));
  if (v8)
  {
    v9 = self->_device;
    v15 = v6;
    v10 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v9, "newComputePipelineStateWithFunction:error:", v8, &v15);
    v11 = v15;

    backwarpKernel = self->_backwarpKernel;
    self->_backwarpKernel = v10;

    if (self->_backwarpKernel)
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

- (int)encodeToCommandBuffer:(id)a3 input:(id)a4 output:(id)a5 flow:(id)a6 upscaledFlow:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int64x2_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  v18 = -50;
  if (v13 && v14 && v15 && v16)
  {
    objc_msgSend(v12, "computeCommandEncoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = objc_msgSend(v17, "width");
      v21 = objc_msgSend(v15, "width");
      v22 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0));
      *(float *)objc_msgSend(v22, "contents") = (float)v20 / (float)v21;
      v23 = objc_msgSend(v13, "width");
      v24 = objc_msgSend(v13, "height");
      objc_msgSend(v19, "setComputePipelineState:", self->_backwarpKernel);
      objc_msgSend(v19, "setTexture:atIndex:", v13, 0);
      objc_msgSend(v19, "setTexture:atIndex:", v14, 1);
      objc_msgSend(v19, "setTexture:atIndex:", v15, 2);
      objc_msgSend(v19, "setTexture:atIndex:", v17, 3);
      objc_msgSend(v19, "setBuffer:offset:atIndex:", v22, 0, 0);
      v28[0] = (unint64_t)(v23 + 15) >> 4;
      v28[1] = (unint64_t)(v24 + 15) >> 4;
      v28[2] = 1;
      v26 = vdupq_n_s64(0x10uLL);
      v27 = 1;
      objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", v28, &v26);
      objc_msgSend(v19, "endEncoding");

      v18 = 0;
    }
    else
    {
      v18 = -108;
    }

  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_backwarpKernel, 0);
}

@end
