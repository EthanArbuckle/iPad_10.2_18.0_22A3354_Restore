@implementation GPUSynthesis

- (GPUSynthesis)initWithDevice:(id)a3 commmandQueue:(id)a4
{
  GPUSynthesis *v4;
  GPUSynthesis *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GPUSynthesis;
  v4 = -[FRCMetalBase initWithDevice:commmandQueue:](&v7, sel_initWithDevice_commmandQueue_, a3, a4);
  v5 = v4;
  if (v4)
    -[GPUSynthesis setupMetal](v4, "setupMetal");
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GPUSynthesis;
  -[GPUSynthesis dealloc](&v2, sel_dealloc);
}

- (BOOL)setupMetal
{
  MTLComputePipelineState *v3;
  MTLComputePipelineState *combine2Textures;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *postSmoothFilter;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *averageErrorMap;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *generateAlphaMap;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("combineFloatBuffer2Texture"));
  v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  combine2Textures = self->_combine2Textures;
  self->_combine2Textures = v3;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("postSmoothFilter"));
  v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  postSmoothFilter = self->_postSmoothFilter;
  self->_postSmoothFilter = v5;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("averageMinErrorMap"));
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  averageErrorMap = self->_averageErrorMap;
  self->_averageErrorMap = v7;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("generateBlendingFactor"));
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  generateAlphaMap = self->_generateAlphaMap;
  self->_generateAlphaMap = v9;

  return 1;
}

- (void)encodeCombineCmdToCommandBuffer:(id)a3 fromBuffer0:(id)a4 buffer1:(id)a5 best0:(id)a6 best1:(id)a7 map:(id)a8 normalized0:(id)a9 normalized1:(id)a10 alpha:(id)a11 flowStats0:(id *)a12 flowStats1:(id *)a13 toTexture:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  int64x2_t v31;
  uint64_t v32;
  _QWORD v33[3];

  v30 = a4;
  v29 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a14;
  objc_msgSend(a3, "computeCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 32, 0);
    objc_msgSend(v27, "setComputePipelineState:", self->_combine2Textures);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", v30, 0, 0);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", v29, 0, 1);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", v20, 0, 2);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", v21, 0, 3);
    objc_msgSend(v27, "setBuffer:offset:atIndex:", v28, 0, 4);
    objc_msgSend(v27, "setTexture:atIndex:", v26, 0);
    objc_msgSend(v27, "setTexture:atIndex:", v22, 1);
    objc_msgSend(v27, "setTexture:atIndex:", v23, 2);
    objc_msgSend(v27, "setTexture:atIndex:", v24, 3);
    objc_msgSend(v27, "setTexture:atIndex:", v25, 4);
    v33[0] = (unint64_t)(objc_msgSend(v26, "width") + 15) >> 4;
    v33[1] = (unint64_t)(objc_msgSend(v26, "height") + 15) >> 4;
    v33[2] = 1;
    v31 = vdupq_n_s64(0x10uLL);
    v32 = 1;
    objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", v33, &v31);
    objc_msgSend(v27, "endEncoding");

  }
}

- (void)encodeAlphaCmdToCommandBuffer:(id)a3 fromBuffer0:(id)a4 buffer1:(id)a5 toAlpha:(id)a6 timeScale:(float)a7 toNormalized0:(id)a8 toNormalized1:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  int64x2_t v23;
  uint64_t v24;
  _QWORD v25[3];

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  objc_msgSend(a3, "computeCommandEncoder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 4, 0));
    *(float *)objc_msgSend(v22, "contents") = a7;
    objc_msgSend(v21, "setComputePipelineState:", self->_generateAlphaMap);
    objc_msgSend(v21, "setBuffer:offset:atIndex:", v16, 0, 0);
    objc_msgSend(v21, "setBuffer:offset:atIndex:", v17, 0, 1);
    objc_msgSend(v21, "setBuffer:offset:atIndex:", v22, 0, 2);
    objc_msgSend(v21, "setTexture:atIndex:", v18, 0);
    objc_msgSend(v21, "setTexture:atIndex:", v19, 1);
    objc_msgSend(v21, "setTexture:atIndex:", v20, 2);
    v25[0] = (unint64_t)(objc_msgSend(v18, "width") + 15) >> 4;
    v25[1] = (unint64_t)(objc_msgSend(v18, "height") + 15) >> 4;
    v25[2] = 1;
    v23 = vdupq_n_s64(0x10uLL);
    v24 = 1;
    objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", v25, &v23);
    objc_msgSend(v21, "endEncoding");

  }
}

- (void)encodePostSmoothFilterCmdToCommandBuffer:(id)a3 map:(id)a4 fromTexture:(id)a5 toTexture:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int64x2_t v15;
  uint64_t v16;
  _QWORD v17[3];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setComputePipelineState:", self->_postSmoothFilter);
    objc_msgSend(v14, "setTexture:atIndex:", v11, 0);
    objc_msgSend(v14, "setTexture:atIndex:", v10, 1);
    objc_msgSend(v14, "setTexture:atIndex:", v12, 2);
    v17[0] = (unint64_t)(objc_msgSend(v12, "width") + 15) >> 4;
    v17[1] = (unint64_t)(objc_msgSend(v12, "height") + 15) >> 4;
    v17[2] = 1;
    v15 = vdupq_n_s64(0x10uLL);
    v16 = 1;
    objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v17, &v15);
    objc_msgSend(v14, "endEncoding");
  }

}

- (void)encodeAverageErrorCmdToCommandBuffer:(id)a3 minErrorMap0:(id)a4 minErrorMap1:(id)a5 avgErrorMap0:(id)a6 avgErrorMap1:(id)a7 width:(int)a8 height:(int)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  int *v21;
  int64x2_t v22;
  uint64_t v23;
  uint64x2_t v24;
  uint64_t v25;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(a3, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 8, 0));
    v21 = (int *)objc_msgSend(v20, "contents");
    *v21 = a8;
    v21[1] = a9;
    objc_msgSend(v19, "setComputePipelineState:", self->_averageErrorMap);
    objc_msgSend(v19, "setBuffer:offset:atIndex:", v20, 0, 0);
    objc_msgSend(v19, "setBuffer:offset:atIndex:", v15, 0, 1);
    objc_msgSend(v19, "setBuffer:offset:atIndex:", v16, 0, 2);
    objc_msgSend(v19, "setBuffer:offset:atIndex:", v17, 0, 3);
    objc_msgSend(v19, "setBuffer:offset:atIndex:", v18, 0, 4);
    v24 = vshrq_n_u64((uint64x2_t)vaddw_s32(vdupq_n_s64(0xFuLL), (int32x2_t)__PAIR64__(a9, a8)), 4uLL);
    v25 = 1;
    v22 = vdupq_n_s64(0x10uLL);
    v23 = 1;
    objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", &v24, &v22);
    objc_msgSend(v19, "endEncoding");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generateAlphaMap, 0);
  objc_storeStrong((id *)&self->_averageErrorMap, 0);
  objc_storeStrong((id *)&self->_postSmoothFilter, 0);
  objc_storeStrong((id *)&self->_combine2Textures, 0);
}

@end
