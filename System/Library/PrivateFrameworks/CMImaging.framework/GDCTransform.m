@implementation GDCTransform

- (GDCTransform)initWithOptionalCommandQueue:(id)a3
{
  id v4;
  GDCTransform *v5;
  FigMetalContext *v6;
  void *v7;
  uint64_t v8;
  FigMetalContext *metalContext;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDCTransform;
  v5 = -[GDCTransform init](&v11, sel_init);
  if (v5)
  {
    v6 = [FigMetalContext alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v6, "initWithbundle:andOptionalCommandQueue:", v7, v4);
    metalContext = v5->_metalContext;
    v5->_metalContext = (FigMetalContext *)v8;

    if (!v5->_metalContext
      || -[GDCTransform _compileShaders](v5, "_compileShaders")
      || -[GDCTransform _setSamplersWithNormalizedCoordinates:](v5, "_setSamplersWithNormalizedCoordinates:", 1))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v5 = 0;
    }
  }

  return v5;
}

- (int)transformFrom:(id)a3 to:(id)a4 withParameters:(id *)a5 withScale:(float)a6 withMode:(int)a7 andCommandBuffer:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  uint64_t var13;
  void *v18;
  void *v19;
  void *v20;
  MTLComputePipelineState *v21;
  int v22;
  int64x2_t v24;
  uint64_t v25;
  _QWORD v26[3];
  _OWORD v27[8];
  __int128 v28;
  __int128 v29;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  var13 = a5->var13;
  if (var13 >= 3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    v20 = 0;
    v22 = -12780;
    v18 = v16;
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    memset(v27, 0, sizeof(v27));
    -[GDCTransform _legacyParametersToUniforms:withScale:andMode:](self, "_legacyParametersToUniforms:withScale:andMode:", a5, v9, COERCE_DOUBLE((unint64_t)LODWORD(a6)));
    v18 = v16;
    if (v16
      || (-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v19, "commandBuffer"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v18))
    {
      objc_msgSend(v18, "computeCommandEncoder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_pipelineStates[0];
      objc_msgSend(v20, "setComputePipelineState:", v21);
      objc_msgSend(v20, "setTexture:atIndex:", v14, 0);
      objc_msgSend(v20, "setTexture:atIndex:", v15, 1);
      objc_msgSend(v20, "setBytes:length:atIndex:", v27, 160, 0);
      objc_msgSend(v20, "setBytes:length:atIndex:", a5->var14, 48 * (int)v28, 1);
      objc_msgSend(v20, "setSamplerState:atIndex:", self->_samplers[var13], 0);
      objc_msgSend(v20, "setImageblockWidth:height:", 32, 32);
      v26[0] = objc_msgSend(v15, "width");
      v26[1] = objc_msgSend(v15, "height");
      v26[2] = 1;
      v24 = vdupq_n_s64(0x20uLL);
      v25 = 1;
      objc_msgSend(v20, "dispatchThreads:threadsPerThreadgroup:", v26, &v24);
      objc_msgSend(v20, "endEncoding");
      if (!v16)
        objc_msgSend(v18, "commit");
      v22 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v22 = FigSignalErrorAt();
      v21 = 0;
      v20 = 0;
    }
  }

  return v22;
}

- (int)_compileShaders
{
  MTLComputePipelineState *v3;
  MTLComputePipelineState *v4;

  -[FigMetalContext computePipelineStateFor:constants:](self->_metalContext, "computePipelineStateFor:constants:", CFSTR("gdcKernel"), 0);
  v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v4 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v3;

  if (self->_pipelineStates[0])
    return 0;
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12786;
}

- ($6EE8458BECDEDEA03A2E3419CFE6D4F1)_legacyParametersToUniforms:(SEL)a3 withScale:(id *)a4 andMode:(float)a5
{
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  float32x4_t v12;
  uint64_t v13;
  float64x2_t v14;

  HIDWORD(v6) = 0;
  *(_OWORD *)&retstr[2].var0[2] = 0u;
  *(_OWORD *)&retstr[2].var0[6] = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  v7 = MEMORY[0x1E0C83FE8];
  v8 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  *(_OWORD *)&retstr[1].var0[1] = *MEMORY[0x1E0C83FE8];
  *(_OWORD *)&retstr[1].var0[5] = v8;
  v9 = *(_OWORD *)(v7 + 32);
  *(_OWORD *)&retstr[1].var3 = v9;
  *(_OWORD *)&retstr[1].var7 = 0u;
  if (a6 == 2)
  {
    *(float *)&v6 = a4->var10[0];
    *(float *)&v9 = a4->var10[1];
    DWORD1(v6) = LODWORD(a4->var10[3]);
    DWORD2(v6) = LODWORD(a4->var10[6]);
    DWORD1(v9) = LODWORD(a4->var10[4]);
    DWORD2(v9) = LODWORD(a4->var10[7]);
    *(float *)&v8 = a4->var10[2];
    DWORD1(v8) = LODWORD(a4->var10[5]);
    DWORD2(v8) = LODWORD(a4->var10[8]);
    *(_OWORD *)&retstr[1].var0[1] = v6;
    *(_OWORD *)&retstr[1].var0[5] = v9;
    *(_OWORD *)&retstr[1].var3 = v8;
    v10 = *(_OWORD *)a4->var0;
    v11 = *(_OWORD *)&a4->var0[4];
  }
  else
  {
    if (a6 != 1)
      goto LABEL_6;
    *(float *)&v6 = a4->var9[0];
    *(float *)&v9 = a4->var9[1];
    DWORD1(v6) = LODWORD(a4->var9[3]);
    DWORD2(v6) = LODWORD(a4->var9[6]);
    DWORD1(v9) = LODWORD(a4->var9[4]);
    DWORD2(v9) = LODWORD(a4->var9[7]);
    *(float *)&v8 = a4->var9[2];
    DWORD1(v8) = LODWORD(a4->var9[5]);
    DWORD2(v8) = LODWORD(a4->var9[8]);
    *(_OWORD *)&retstr[1].var0[1] = v6;
    *(_OWORD *)&retstr[1].var0[5] = v9;
    *(_OWORD *)&retstr[1].var3 = v8;
    v10 = *(_OWORD *)a4->var1;
    v11 = *(_OWORD *)&a4->var1[4];
  }
  *(_OWORD *)&retstr->var2 = v10;
  *(_OWORD *)&retstr->var6 = v11;
LABEL_6:
  if (a4->var17)
  {
    LOBYTE(retstr[2].var0[4]) = 1;
    LODWORD(retstr[2].var0[2]) = a4->var15;
    retstr[2].var0[3] = a4->var16;
  }
  v12 = *(float32x4_t *)&a4->var4;
  *(float32x4_t *)retstr->var0 = v12;
  v13 = *(_QWORD *)&a4->var2;
  *(float32x2_t *)&retstr->var0[4] = vcvt_f32_f64((float64x2_t)a4->var11);
  *(_QWORD *)&retstr->var0[6] = v13;
  retstr[1].var7 = a4->var8;
  *(float *)&retstr[1].var8 = a5;
  LODWORD(retstr[2].var0[0]) = a6;
  LOBYTE(retstr[2].var0[1]) = a4->var12;
  v14.f64[0] = a4->var19.size.width;
  if (v14.f64[0] > 1.0 && a4->var19.size.height > 1.0)
  {
    v14.f64[1] = a4->var19.size.height;
    v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)a4->var19.origin), v14);
  }
  *(float32x4_t *)&retstr[2].var0[6] = v12;
  return self;
}

- (int)_setSamplersWithNormalizedCoordinates:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  MTLSamplerState *v7;
  MTLSamplerState *v8;
  MTLSamplerState *v9;
  MTLSamplerState *v10;
  MTLSamplerState *v11;
  MTLSamplerState *v12;
  int v13;

  v3 = a3;
  -[FigMetalContext device](self->_metalContext, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setMinFilter:", 0);
  objc_msgSend(v6, "setMagFilter:", 0);
  objc_msgSend(v6, "setSAddressMode:", 0);
  objc_msgSend(v6, "setTAddressMode:", 0);
  objc_msgSend(v6, "setNormalizedCoordinates:", v3);
  v7 = (MTLSamplerState *)objc_msgSend(v5, "newSamplerStateWithDescriptor:", v6);
  v8 = self->_samplers[0];
  self->_samplers[0] = v7;

  if (!self->_samplers[0])
    goto LABEL_6;
  objc_msgSend(v6, "setMinFilter:", 1);
  objc_msgSend(v6, "setMagFilter:", 1);
  objc_msgSend(v6, "setSAddressMode:", 0);
  objc_msgSend(v6, "setTAddressMode:", 0);
  objc_msgSend(v6, "setNormalizedCoordinates:", v3);
  v9 = (MTLSamplerState *)objc_msgSend(v5, "newSamplerStateWithDescriptor:", v6);
  v10 = self->_samplers[1];
  self->_samplers[1] = v9;

  if (!self->_samplers[1])
    goto LABEL_6;
  objc_msgSend(v6, "setMinFilter:", 2);
  objc_msgSend(v6, "setMagFilter:", 2);
  objc_msgSend(v6, "setSAddressMode:", 0);
  objc_msgSend(v6, "setTAddressMode:", 0);
  objc_msgSend(v6, "setNormalizedCoordinates:", v3);
  v11 = (MTLSamplerState *)objc_msgSend(v5, "newSamplerStateWithDescriptor:", v6);
  v12 = self->_samplers[2];
  self->_samplers[2] = v11;

  if (self->_samplers[2])
  {
    v13 = 0;
  }
  else
  {
LABEL_6:
    fig_log_get_emitter();
    FigDebugAssert3();
    v13 = -12786;
  }

  return v13;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_metalContext, 0);
  for (i = 32; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)self->_pipelineStates, 0);
}

@end
