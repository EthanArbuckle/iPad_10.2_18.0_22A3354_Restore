@implementation CMIStyleEngineCommonSettings

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  return (id)sharedInstance_instance_0;
}

void __46__CMIStyleEngineCommonSettings_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;

  v0 = -[CMIStyleEngineCommonSettings initLoadingStyleEngineSettings]([CMIStyleEngineCommonSettings alloc]);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (void)initLoadingStyleEngineSettings
{
  id v1;
  void *v2;
  objc_super v4;

  if (!a1)
    return 0;
  v4.receiver = a1;
  v4.super_class = (Class)CMIStyleEngineCommonSettings;
  v1 = objc_msgSendSuper2(&v4, sel_init);
  v2 = v1;
  if (!v1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v2;
  }
  if ((-[CMIStyleEngineCommonSettings setupConfigurations]((uint64_t)v1) & 1) == 0
    || (-[CMIStyleEngineCommonSettings loadTuningParameters]((uint64_t)v2) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v2;
}

+ (id)configurationForUseCase:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[CMIStyleEngineCommonSettings sharedInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMISmartStyleCommonSettings configurationForVariant:]((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

+ (id)tuningParametersForUseCase:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[CMIStyleEngineCommonSettings sharedInstance]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMISmartStyleCommonSettings tuningParametersForVariant:]((uint64_t)v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

+ (unint64_t)styleEngineSettingsVersion
{
  return 20240629;
}

- (uint64_t)setupConfigurations
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v2)
    goto LABEL_14;
  v3 = (void *)objc_opt_new();
  if (!v3)
    goto LABEL_14;
  v4 = v3;
  objc_msgSend(v3, "setThumbnailSize:", 256.0, 192.0);
  objc_msgSend(v4, "setLinearSystemType:", 1);
  objc_msgSend(v4, "setLinearSystemOrder:", 1);
  objc_msgSend(v4, "setLinearSystemSolver:", 2);
  objc_msgSend(v4, "setWeightPlaneCount:", 8);
  objc_msgSend(v4, "setSpotlightCount:", COERCE_DOUBLE(0x90000000CLL));
  objc_msgSend(v4, "setShouldFlushCVMTLTextureCacheAfterProcessing:", 1);
  objc_msgSend(v4, "setShouldFlushCVMTLBufferCacheAfterProcessing:", 1);
  objc_msgSend(v4, "setApplyDithering:", 1);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, &unk_1E9513DB0);
  v5 = (void *)objc_opt_new();

  if (!v5)
    goto LABEL_14;
  objc_msgSend(v5, "setThumbnailSize:", 128.0, 96.0);
  objc_msgSend(v5, "setLinearSystemType:", 1);
  objc_msgSend(v5, "setLinearSystemOrder:", 0);
  objc_msgSend(v5, "setLinearSystemSolver:", 2);
  objc_msgSend(v5, "setWeightPlaneCount:", 8);
  objc_msgSend(v5, "setSpotlightCount:", COERCE_DOUBLE(0x600000008));
  objc_msgSend(v5, "setCreateAndSolveGlobalLinearSystem:", 1);
  LODWORD(v6) = 0.5;
  objc_msgSend(v5, "setGlobalLinearSystemMixFactor:", v6);
  objc_msgSend(v5, "setShouldFlushCVMTLTextureCacheAfterProcessing:", 0);
  objc_msgSend(v5, "setShouldFlushCVMTLBufferCacheAfterProcessing:", 1);
  objc_msgSend(v5, "setUseBicubicIntegration:", 1);
  objc_msgSend(v5, "setApplyDithering:", 0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, &unk_1E9513DC8);
  v7 = (void *)objc_opt_new();

  if (!v7)
    goto LABEL_14;
  objc_msgSend(v7, "setThumbnailSize:", 128.0, 96.0);
  objc_msgSend(v7, "setLinearSystemType:", 1);
  objc_msgSend(v7, "setLinearSystemOrder:", 0);
  objc_msgSend(v7, "setLinearSystemSolver:", 2);
  objc_msgSend(v7, "setWeightPlaneCount:", 8);
  objc_msgSend(v7, "setSpotlightCount:", COERCE_DOUBLE(0x600000008));
  objc_msgSend(v7, "setCreateAndSolveGlobalLinearSystem:", 0);
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setGlobalLinearSystemMixFactor:", v8);
  objc_msgSend(v7, "setShouldFlushCVMTLTextureCacheAfterProcessing:", 0);
  objc_msgSend(v7, "setShouldFlushCVMTLBufferCacheAfterProcessing:", 1);
  objc_msgSend(v7, "setApplyDithering:", 0);
  objc_msgSend(v7, "setOutputCoefficientsF16:", 1);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, &unk_1E9513DE0);
  v9 = (void *)objc_opt_new();

  if (!v9)
    goto LABEL_14;
  objc_msgSend(v9, "setThumbnailSize:", 128.0, 96.0);
  objc_msgSend(v9, "setLinearSystemType:", 1);
  objc_msgSend(v9, "setLinearSystemOrder:", 0);
  objc_msgSend(v9, "setLinearSystemSolver:", 2);
  objc_msgSend(v9, "setWeightPlaneCount:", 4);
  objc_msgSend(v9, "setSpotlightCount:", COERCE_DOUBLE(0x300000004));
  objc_msgSend(v9, "setCreateAndSolveGlobalLinearSystem:", 0);
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setGlobalLinearSystemMixFactor:", v10);
  objc_msgSend(v9, "setShouldFlushCVMTLTextureCacheAfterProcessing:", 0);
  objc_msgSend(v9, "setShouldFlushCVMTLBufferCacheAfterProcessing:", 1);
  objc_msgSend(v9, "setOutputCoefficientsF16:", 1);
  objc_msgSend(v9, "setApplyDithering:", 0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, &unk_1E9513DF8);
  v11 = (void *)objc_opt_new();

  if (!v11)
    goto LABEL_14;
  objc_msgSend(v11, "setThumbnailSize:", 128.0, 96.0);
  objc_msgSend(v11, "setLinearSystemType:", 1);
  objc_msgSend(v11, "setLinearSystemOrder:", 1);
  objc_msgSend(v11, "setLinearSystemSolver:", 0);
  objc_msgSend(v11, "setWeightPlaneCount:", 8);
  objc_msgSend(v11, "setSpotlightCount:", COERCE_DOUBLE(0x90000000CLL));
  objc_msgSend(v11, "setApplyDithering:", 0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, &unk_1E9513E10);
  v12 = (void *)objc_opt_new();

  if (!v12)
    goto LABEL_14;
  objc_msgSend(v12, "setThumbnailSize:", 256.0, 192.0);
  objc_msgSend(v12, "setLinearSystemType:", 1);
  objc_msgSend(v12, "setLinearSystemOrder:", 1);
  objc_msgSend(v12, "setLinearSystemSolver:", 0);
  objc_msgSend(v12, "setWeightPlaneCount:", 8);
  objc_msgSend(v12, "setSpotlightCount:", COERCE_DOUBLE(0xC00000010));
  objc_msgSend(v12, "setApplyDithering:", 0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, &unk_1E9513E28);
  v13 = (void *)objc_opt_new();

  if (!v13)
    goto LABEL_14;
  objc_msgSend(v13, "setThumbnailSize:", 32.0, 24.0);
  objc_msgSend(v13, "setLinearSystemType:", 1);
  objc_msgSend(v13, "setLinearSystemOrder:", 1);
  objc_msgSend(v13, "setLinearSystemSolver:", 0);
  objc_msgSend(v13, "setWeightPlaneCount:", 4);
  objc_msgSend(v13, "setSpotlightCount:", COERCE_DOUBLE(0x100000001));
  objc_msgSend(v13, "setInputIsLinear:", 1);
  objc_msgSend(v13, "setInputThumbnailIsLinear:", 1);
  objc_msgSend(v13, "setTargetThumbnailIsLinear:", 1);
  objc_msgSend(v13, "setApplyDithering:", 0);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, &unk_1E9513E40);
  v14 = (void *)objc_opt_new();

  if (v14)
  {
    objc_msgSend(v14, "setThumbnailSize:", 256.0, 192.0);
    v15 = 1;
    objc_msgSend(v14, "setLinearSystemType:", 1);
    objc_msgSend(v14, "setLinearSystemOrder:", 1);
    objc_msgSend(v14, "setLinearSystemSolver:", 2);
    objc_msgSend(v14, "setWeightPlaneCount:", 8);
    objc_msgSend(v14, "setSpotlightCount:", COERCE_DOUBLE(0x90000000CLL));
    objc_msgSend(v14, "setShouldFlushCVMTLTextureCacheAfterProcessing:", 1);
    objc_msgSend(v14, "setShouldFlushCVMTLBufferCacheAfterProcessing:", 1);
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, &unk_1E9513E58);
    objc_storeStrong((id *)(a1 + 8), v2);

  }
  else
  {
LABEL_14:
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
  }

  return v15;
}

- (uint64_t)loadTuningParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_24:
    v6 = 0;
    goto LABEL_17;
  }
  v4 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("StyleEngineTuning"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("StyleEngineV1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
      if (v9)
      {
        v10 = (void *)v9;
        v23 = v3;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = v8;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v11, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(&unk_1E95142F0, "objectForKeyedSubscript:", v16);
              v18 = objc_claimAutoreleasedReturnValue();
              if (!v18)
              {
                fig_log_get_emitter();
                FigDebugAssert3();

                v6 = 0;
                goto LABEL_16;
              }
              v19 = (void *)v18;
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v13)
              continue;
            break;
          }
        }

        v20 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v10;
        v21 = v10;

        v6 = 1;
LABEL_16:
        v3 = v23;
        goto LABEL_17;
      }
      fig_log_get_emitter();
      FigDebugAssert3();

    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }

    goto LABEL_24;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_17:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParametersByUseCase, 0);
  objc_storeStrong((id *)&self->_configurationByUseCase, 0);
}

@end
