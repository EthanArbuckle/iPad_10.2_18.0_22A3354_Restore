@implementation VNRShaders

- (VNRShaders)initWithMetalDevice:(id)a3
{
  id v4;
  VNRShaders *v5;
  void *v6;
  uint64_t v7;
  id v8;
  MTLLibrary *library;
  MTLLibrary *v10;
  void *v11;
  uint64_t v12;
  id v13;
  MTLComputePipelineState *simpleCopy;
  void *v15;
  uint64_t v16;
  MTLComputePipelineState *lumaInDownsample;
  uint64_t v18;
  MTLComputePipelineState *lumaInOutDownsampleDeghost;
  uint64_t v20;
  MTLComputePipelineState *chromaInDownsample;
  uint64_t v22;
  MTLComputePipelineState *chromaInOutDownsampleDeghost;
  uint64_t v24;
  MTLComputePipelineState *deghostPropagateLuma;
  uint64_t v26;
  MTLComputePipelineState *deghostPropagateLumaChroma;
  uint64_t v28;
  MTLComputePipelineState *fusionInitialTopLuma;
  uint64_t v30;
  MTLComputePipelineState *fusionTopLuma;
  uint64_t v32;
  MTLComputePipelineState *fusionInitialMidLuma;
  uint64_t v34;
  MTLComputePipelineState *fusionMidLuma;
  uint64_t v36;
  MTLComputePipelineState *fusionInitialBottomLuma;
  uint64_t v38;
  MTLComputePipelineState *fusionBottomLuma;
  uint64_t v40;
  MTLComputePipelineState *fusionInitialTopChroma;
  uint64_t v42;
  MTLComputePipelineState *fusionTopChroma;
  uint64_t v44;
  MTLComputePipelineState *fusionInitialMidChroma;
  uint64_t v46;
  MTLComputePipelineState *fusionMidChroma;
  uint64_t v48;
  MTLComputePipelineState *fusionInitialBottomChroma;
  uint64_t v50;
  MTLComputePipelineState *fusionBottomChroma;
  VNRShaders *v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;

  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)VNRShaders;
  v5 = -[VNRShaders init](&v62, sel_init);
  if (!v5)
  {
    v52 = 0;
    v6 = 0;
LABEL_39:
    v8 = 0;
LABEL_41:
    v11 = 0;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v52 = 0;
    goto LABEL_39;
  }
  v61 = 0;
  v7 = objc_msgSend(v4, "newDefaultLibraryWithBundle:error:", v6, &v61);
  v8 = v61;
  library = v5->_library;
  v5->_library = (MTLLibrary *)v7;

  v10 = v5->_library;
  if (!v10)
  {
    v52 = 0;
    goto LABEL_41;
  }
  v11 = (void *)-[MTLLibrary newFunctionWithName:](v10, "newFunctionWithName:", CFSTR("vnrSimpleCopy"));
  if (!v11)
    goto LABEL_34;
  v60 = v8;
  v12 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v11, &v60);
  v13 = v60;

  simpleCopy = v5->_simpleCopy;
  v5->_simpleCopy = (MTLComputePipelineState *)v12;

  if (!v5->_simpleCopy)
  {
LABEL_33:
    v52 = 0;
    goto LABEL_31;
  }
  v15 = (void *)-[MTLLibrary newFunctionWithName:](v5->_library, "newFunctionWithName:", CFSTR("vnrLumaInDownsample"));

  if (!v15)
  {
LABEL_35:
    v52 = 0;
    v11 = 0;
    goto LABEL_31;
  }
  v59 = v13;
  v16 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v15, &v59);
  v8 = v59;

  lumaInDownsample = v5->_lumaInDownsample;
  v5->_lumaInDownsample = (MTLComputePipelineState *)v16;

  if (!v5->_lumaInDownsample)
  {
LABEL_36:
    v52 = 0;
    v11 = v15;
    goto LABEL_32;
  }
  v11 = (void *)-[MTLLibrary newFunctionWithName:](v5->_library, "newFunctionWithName:", CFSTR("vnrLumaInOutDownsampleDeghost"));

  if (!v11)
  {
LABEL_34:
    v52 = 0;
    goto LABEL_32;
  }
  v58 = v8;
  v18 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v11, &v58);
  v13 = v58;

  lumaInOutDownsampleDeghost = v5->_lumaInOutDownsampleDeghost;
  v5->_lumaInOutDownsampleDeghost = (MTLComputePipelineState *)v18;

  if (!v5->_lumaInOutDownsampleDeghost)
    goto LABEL_33;
  v15 = (void *)-[MTLLibrary newFunctionWithName:](v5->_library, "newFunctionWithName:", CFSTR("vnrChromaInDownsample"));

  if (!v15)
    goto LABEL_35;
  v57 = v13;
  v20 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v15, &v57);
  v8 = v57;

  chromaInDownsample = v5->_chromaInDownsample;
  v5->_chromaInDownsample = (MTLComputePipelineState *)v20;

  if (!v5->_chromaInDownsample)
    goto LABEL_36;
  v11 = (void *)-[MTLLibrary newFunctionWithName:](v5->_library, "newFunctionWithName:", CFSTR("vnrChromaInOutDownsampleDeghost"));

  if (!v11)
    goto LABEL_34;
  v56 = v8;
  v22 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v11, &v56);
  v13 = v56;

  chromaInOutDownsampleDeghost = v5->_chromaInOutDownsampleDeghost;
  v5->_chromaInOutDownsampleDeghost = (MTLComputePipelineState *)v22;

  if (!v5->_chromaInOutDownsampleDeghost)
    goto LABEL_33;
  v15 = (void *)-[MTLLibrary newFunctionWithName:](v5->_library, "newFunctionWithName:", CFSTR("vnrDeghostPropagateLuma"));

  if (!v15)
    goto LABEL_35;
  v55 = v13;
  v24 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v15, &v55);
  v8 = v55;

  deghostPropagateLuma = v5->_deghostPropagateLuma;
  v5->_deghostPropagateLuma = (MTLComputePipelineState *)v24;

  if (!v5->_deghostPropagateLuma)
    goto LABEL_36;
  v11 = (void *)-[MTLLibrary newFunctionWithName:](v5->_library, "newFunctionWithName:", CFSTR("vnrDeghostPropagateLumaChroma"));

  if (!v11)
    goto LABEL_34;
  v54 = v8;
  v26 = objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v11, &v54);
  v13 = v54;

  deghostPropagateLumaChroma = v5->_deghostPropagateLumaChroma;
  v5->_deghostPropagateLumaChroma = (MTLComputePipelineState *)v26;

  if (!v5->_deghostPropagateLumaChroma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 0, 1, 1, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  fusionInitialTopLuma = v5->_fusionInitialTopLuma;
  v5->_fusionInitialTopLuma = (MTLComputePipelineState *)v28;

  if (!v5->_fusionInitialTopLuma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 0, 0, 1, 0);
  v30 = objc_claimAutoreleasedReturnValue();
  fusionTopLuma = v5->_fusionTopLuma;
  v5->_fusionTopLuma = (MTLComputePipelineState *)v30;

  if (!v5->_fusionTopLuma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 0, 1, 0, 0);
  v32 = objc_claimAutoreleasedReturnValue();
  fusionInitialMidLuma = v5->_fusionInitialMidLuma;
  v5->_fusionInitialMidLuma = (MTLComputePipelineState *)v32;

  if (!v5->_fusionInitialMidLuma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 0, 0, 0, 0);
  v34 = objc_claimAutoreleasedReturnValue();
  fusionMidLuma = v5->_fusionMidLuma;
  v5->_fusionMidLuma = (MTLComputePipelineState *)v34;

  if (!v5->_fusionMidLuma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 0, 1, 0, 1);
  v36 = objc_claimAutoreleasedReturnValue();
  fusionInitialBottomLuma = v5->_fusionInitialBottomLuma;
  v5->_fusionInitialBottomLuma = (MTLComputePipelineState *)v36;

  if (!v5->_fusionInitialBottomLuma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 0, 0, 0, 1);
  v38 = objc_claimAutoreleasedReturnValue();
  fusionBottomLuma = v5->_fusionBottomLuma;
  v5->_fusionBottomLuma = (MTLComputePipelineState *)v38;

  if (!v5->_fusionBottomLuma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 1, 1, 1, 0);
  v40 = objc_claimAutoreleasedReturnValue();
  fusionInitialTopChroma = v5->_fusionInitialTopChroma;
  v5->_fusionInitialTopChroma = (MTLComputePipelineState *)v40;

  if (!v5->_fusionInitialTopChroma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 1, 0, 1, 0);
  v42 = objc_claimAutoreleasedReturnValue();
  fusionTopChroma = v5->_fusionTopChroma;
  v5->_fusionTopChroma = (MTLComputePipelineState *)v42;

  if (!v5->_fusionTopChroma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 1, 1, 0, 0);
  v44 = objc_claimAutoreleasedReturnValue();
  fusionInitialMidChroma = v5->_fusionInitialMidChroma;
  v5->_fusionInitialMidChroma = (MTLComputePipelineState *)v44;

  if (!v5->_fusionInitialMidChroma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 1, 0, 0, 0);
  v46 = objc_claimAutoreleasedReturnValue();
  fusionMidChroma = v5->_fusionMidChroma;
  v5->_fusionMidChroma = (MTLComputePipelineState *)v46;

  if (!v5->_fusionMidChroma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 1, 1, 0, 1);
  v48 = objc_claimAutoreleasedReturnValue();
  fusionInitialBottomChroma = v5->_fusionInitialBottomChroma;
  v5->_fusionInitialBottomChroma = (MTLComputePipelineState *)v48;

  if (!v5->_fusionInitialBottomChroma)
    goto LABEL_33;
  -[VNRShaders createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:](v5, "createFusionShaderUsingMetalDevice:colorChannel:isFirstFrame:isTopBand:isBottomBand:", v4, 1, 0, 0, 1);
  v50 = objc_claimAutoreleasedReturnValue();
  fusionBottomChroma = v5->_fusionBottomChroma;
  v5->_fusionBottomChroma = (MTLComputePipelineState *)v50;

  if (!v5->_fusionBottomChroma)
    goto LABEL_33;
  v52 = v5;
LABEL_31:
  v8 = v13;
LABEL_32:

  return v52;
}

- (id)createFusionShaderUsingMetalDevice:(id)a3 colorChannel:(int)a4 isFirstFrame:(BOOL)a5 isTopBand:(BOOL)a6 isBottomBand:(BOOL)a7
{
  id v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  void *v16;
  MTLLibrary *library;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;

  v12 = a3;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v13 = CFSTR("vnrChromaFusion");
  if (!a4)
    v13 = CFSTR("vnrLumaFusion");
  v14 = v13;
  v15 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setConstantValue:type:atIndex:", &v28, 53, 0);
    objc_msgSend(v16, "setConstantValue:type:atIndex:", &v27, 53, 1);
    objc_msgSend(v16, "setConstantValue:type:atIndex:", &v26, 53, 2);
    library = self->_library;
    v25 = 0;
    v18 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](library, "newFunctionWithName:constantValues:error:", v14, v16, &v25);
    v19 = v25;
    v20 = v19;
    if (v18)
    {
      v24 = v19;
      v21 = (void *)objc_msgSend(v12, "newComputePipelineStateWithFunction:error:", v18, &v24);
      v22 = v24;

      v20 = v22;
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
    v18 = 0;
    v20 = 0;
  }

  return v21;
}

- (MTLComputePipelineState)simpleCopy
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 16, 1);
}

- (MTLComputePipelineState)lumaInDownsample
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 24, 1);
}

- (MTLComputePipelineState)lumaInOutDownsampleDeghost
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 32, 1);
}

- (MTLComputePipelineState)chromaInDownsample
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 40, 1);
}

- (MTLComputePipelineState)chromaInOutDownsampleDeghost
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 48, 1);
}

- (MTLComputePipelineState)deghostPropagateLuma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 56, 1);
}

- (MTLComputePipelineState)deghostPropagateLumaChroma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 64, 1);
}

- (MTLComputePipelineState)fusionInitialTopLuma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 72, 1);
}

- (MTLComputePipelineState)fusionTopLuma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 80, 1);
}

- (MTLComputePipelineState)fusionInitialMidLuma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 88, 1);
}

- (MTLComputePipelineState)fusionMidLuma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 96, 1);
}

- (MTLComputePipelineState)fusionInitialBottomLuma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 104, 1);
}

- (MTLComputePipelineState)fusionBottomLuma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 112, 1);
}

- (MTLComputePipelineState)fusionInitialTopChroma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 120, 1);
}

- (MTLComputePipelineState)fusionTopChroma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 128, 1);
}

- (MTLComputePipelineState)fusionInitialMidChroma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 136, 1);
}

- (MTLComputePipelineState)fusionMidChroma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 144, 1);
}

- (MTLComputePipelineState)fusionInitialBottomChroma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 152, 1);
}

- (MTLComputePipelineState)fusionBottomChroma
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusionBottomChroma, 0);
  objc_storeStrong((id *)&self->_fusionInitialBottomChroma, 0);
  objc_storeStrong((id *)&self->_fusionMidChroma, 0);
  objc_storeStrong((id *)&self->_fusionInitialMidChroma, 0);
  objc_storeStrong((id *)&self->_fusionTopChroma, 0);
  objc_storeStrong((id *)&self->_fusionInitialTopChroma, 0);
  objc_storeStrong((id *)&self->_fusionBottomLuma, 0);
  objc_storeStrong((id *)&self->_fusionInitialBottomLuma, 0);
  objc_storeStrong((id *)&self->_fusionMidLuma, 0);
  objc_storeStrong((id *)&self->_fusionInitialMidLuma, 0);
  objc_storeStrong((id *)&self->_fusionTopLuma, 0);
  objc_storeStrong((id *)&self->_fusionInitialTopLuma, 0);
  objc_storeStrong((id *)&self->_deghostPropagateLumaChroma, 0);
  objc_storeStrong((id *)&self->_deghostPropagateLuma, 0);
  objc_storeStrong((id *)&self->_chromaInOutDownsampleDeghost, 0);
  objc_storeStrong((id *)&self->_chromaInDownsample, 0);
  objc_storeStrong((id *)&self->_lumaInOutDownsampleDeghost, 0);
  objc_storeStrong((id *)&self->_lumaInDownsample, 0);
  objc_storeStrong((id *)&self->_simpleCopy, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end
