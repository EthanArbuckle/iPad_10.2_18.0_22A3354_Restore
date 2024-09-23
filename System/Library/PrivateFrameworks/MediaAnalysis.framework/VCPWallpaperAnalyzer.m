@implementation VCPWallpaperAnalyzer

+ (id)sharedModelPool
{
  void *v2;
  void *v3;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPWallpaperAnalyzer.sharedModelPool"), &__block_literal_global_18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

VCPObjectPool *__39__VCPWallpaperAnalyzer_sharedModelPool__block_invoke()
{
  return +[VCPObjectPool objectPoolWithAllocator:](VCPObjectPool, "objectPoolWithAllocator:", &__block_literal_global_156);
}

VCPCNNModelEspresso *__39__VCPWallpaperAnalyzer_sharedModelPool__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  VCPCNNModelEspresso *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resourceURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("quantized_9hy8wvx5wz_iteration_47_model.espresso.net"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v2, 0, 0, 0);

  return v3;
}

- (VCPWallpaperAnalyzer)init
{
  VCPWallpaperAnalyzer *v2;
  VCPWallpaperAnalyzer *v3;
  NSString *resConfig;
  void *v5;
  uint64_t v6;
  VCPLoaned *modelEspresso;
  VCPWallpaperAnalyzer *v8;
  VCPWallpaperAnalyzer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VCPWallpaperAnalyzer;
  v2 = -[VCPWallpaperAnalyzer init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    resConfig = v2->_resConfig;
    v2->_resConfig = (NSString *)&stru_1E6B1C190;

    objc_msgSend((id)objc_opt_class(), "sharedModelPool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getObject");
    v6 = objc_claimAutoreleasedReturnValue();
    modelEspresso = v3->_modelEspresso;
    v3->_modelEspresso = (VCPLoaned *)v6;

    if (v3->_modelEspresso)
      v8 = v3;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (int)createModel
{
  VCPWallpaperAnalyzer *v2;
  void *v3;

  v2 = self;
  -[VCPLoaned object](self->_modelEspresso, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v3, "prepareModelWithConfig:", v2->_resConfig);

  return (int)v2;
}

- (int)analyzeWithSceneprint:(id)a3 results:(id *)a4 cancel:(id)a5
{
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  _BYTE buf[12];
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "requestRevision") == 3737841671)
  {
    v8 = (void *)MEMORY[0x1BCCA1B2C]();
    v9 = -[VCPWallpaperAnalyzer createModel](self, "createModel");
    if (v9)
    {
      v10 = 6;
    }
    else
    {
      -[VCPLoaned object](self->_modelEspresso, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "descriptorData");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v11, "espressoForward:", objc_msgSend(v12, "bytes"));

      if (v9)
        v10 = 6;
      else
        v10 = 0;
    }
    objc_autoreleasePoolPop(v8);
    if (!v10)
    {
      -[VCPLoaned object](self->_modelEspresso, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "outputBlob");
      v14 = *(_DWORD *)(*(_QWORD *)buf + 4);

      if (a4)
      {
        v23 = CFSTR("WPResults");
        v20 = CFSTR("wallpaperScore");
        LODWORD(v15) = v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = objc_msgSend(v7, "requestRevision");
      v26 = 2048;
      v27 = 3737841671;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid sceneprint revision: %lu (required %lu)", buf, 0x16u);
    }
    v9 = -50;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
