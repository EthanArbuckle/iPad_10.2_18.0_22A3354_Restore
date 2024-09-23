@implementation CMImagingShaderPrecompilation

+ (void)prewarmShaders
{
  objc_msgSend(a1, "prewarmShadersForFeatures:", -1);
}

+ (void)prewarmShadersForFeatures:(unint64_t)a3
{
  char v3;
  void *v4;
  FigRegToolboxGPU *v5;
  GDCTransform *v6;
  CMIWarpStage *v7;
  CMISharpnessScore *v8;
  FigRegWarpPPGPU *v9;
  FigRegWarpPPGPU *v10;
  FigRegWarpPPGPU *v11;
  CMIStyleEngineProcessor *v12;
  CMIStyleEngineProcessor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FigMetalContext *v22;
  void *v23;
  FigMetalContext *v24;
  void *v25;
  void *v26;
  CMISmartStyleMetalRendererV1 *v27;
  CMIStyleEngineCoefficientsFilter *v28;
  CMISmartStyleProxyRendererV1 *v29;
  void *v30;
  _OWORD v31[2];
  __int128 v32;

  v3 = a3;
  +[FigMetalContext metalDevice](FigMetalContext, "metalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(FigRegToolboxGPU);
  if (!v5)
  {
    FigDebugAssert3();
    v8 = 0;
    v7 = 0;
    v6 = 0;
    goto LABEL_23;
  }
  if (objc_msgSend(v4, "supportsFamily:", 1004))
  {
    v6 = -[GDCTransform initWithOptionalCommandQueue:]([GDCTransform alloc], "initWithOptionalCommandQueue:", 0);
    if (!v6)
    {
      FigDebugAssert3();
      v8 = 0;
      v7 = 0;
      goto LABEL_23;
    }
    v7 = -[CMIWarpStage initWithOptionalCommandQueue:allocator:]([CMIWarpStage alloc], "initWithOptionalCommandQueue:allocator:", 0, 0);
    if (!v7)
    {
      FigDebugAssert3();
      v8 = 0;
      goto LABEL_23;
    }
    v8 = -[CMISharpnessScore initWithOptionalCommandQueue:kernelWeights:]([CMISharpnessScore alloc], "initWithOptionalCommandQueue:kernelWeights:", 0, 0);
    if (!v8)
      goto LABEL_27;
    v32 = 0u;
    memset(v31, 0, sizeof(v31));
    BYTE12(v32) = 1;
    v9 = -[FigRegWarpPPGPU initWithOptionalCommandQueue:config:]([FigRegWarpPPGPU alloc], "initWithOptionalCommandQueue:config:", 0, v31);
    if (!v9
      || (v10 = v9,
          BYTE12(v32) = 0,
          v11 = -[FigRegWarpPPGPU initWithOptionalCommandQueue:config:]([FigRegWarpPPGPU alloc], "initWithOptionalCommandQueue:config:", 0, v31), v10, !v11))
    {
LABEL_27:
      FigDebugAssert3();
      goto LABEL_23;
    }

    if ((v3 & 1) != 0)
    {
      v12 = -[CMIStyleEngineProcessor initWithOptionalMetalCommandQueue:]([CMIStyleEngineProcessor alloc], "initWithOptionalMetalCommandQueue:", 0);
      v13 = v12;
      if (!v12)
        goto LABEL_33;
      -[CMIStyleEngineProcessor setTuningParameters:](v12, "setTuningParameters:", &unk_1E95142A0);
      -[CMIStyleEngineProcessor tuningParameters](v13, "tuningParameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_33;
      v15 = (void *)objc_opt_new();
      -[CMIStyleEngineProcessor setConfiguration:](v13, "setConfiguration:", v15);

      -[CMIStyleEngineProcessor configuration](v13, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_33;
      -[CMIStyleEngineProcessor configuration](v13, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLinearSystemType:", 1);

      -[CMIStyleEngineProcessor configuration](v13, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLinearSystemOrder:", 1);

      -[CMIStyleEngineProcessor configuration](v13, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLinearSystemSolver:", 2);

      -[CMIStyleEngineProcessor configuration](v13, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWeightPlaneCount:", 2);

      -[CMIStyleEngineProcessor configuration](v13, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSpotlightCount:", COERCE_DOUBLE(0x100000001));

      if (-[CMIStyleEngineProcessor setup](v13, "setup") || -[CMIStyleEngineProcessor prewarm](v13, "prewarm"))
      {
LABEL_33:
        FigDebugAssert3();

        goto LABEL_23;
      }

    }
    v22 = [FigMetalContext alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v22, "initWithbundle:andOptionalCommandQueue:", v23, 0);

    if (v24
      && (v25 = (void *)objc_opt_new(),
          -[FigMetalContext setAllocator:](v24, "setAllocator:", v25),
          v25,
          -[FigMetalContext allocator](v24, "allocator"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v26,
          v26))
    {
      v27 = -[CMISmartStyleMetalRendererV1 initWithMetalContext:]([CMISmartStyleMetalRendererV1 alloc], "initWithMetalContext:", v24);
      if (-[CMISmartStyleMetalRendererV1 prewarm](v27, "prewarm"))
      {
        FigDebugAssert3();
      }
      else
      {
        v28 = -[CMIStyleEngineCoefficientsFilter initWithMetalContext:]([CMIStyleEngineCoefficientsFilter alloc], "initWithMetalContext:", v24);
        v29 = -[CMISmartStyleProxyRendererV1 initWithOptionalMetalCommandQueue:]([CMISmartStyleProxyRendererV1 alloc], "initWithOptionalMetalCommandQueue:", 0);
        if (!-[CMISmartStyleProxyRendererV1 prewarm](v29, "prewarm"))
        {

          goto LABEL_21;
        }
        FigDebugAssert3();

      }
    }
    else
    {
      FigDebugAssert3();
    }

    goto LABEL_23;
  }
  v8 = 0;
  v7 = 0;
  v6 = 0;
LABEL_21:
  if (objc_msgSend(v4, "supportsFamily:", 1006))
  {
    v30 = (void *)objc_opt_new();
    objc_msgSend(v30, "prewarmWithTuningParameters:", 0);

  }
LABEL_23:

}

@end
