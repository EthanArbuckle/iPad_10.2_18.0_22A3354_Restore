@implementation VCPSceneprintDescriptor

+ (BOOL)usePHAssetData
{
  return 1;
}

+ (int)preferredPixelFormat
{
  return 1111970369;
}

+ (id)descriptorWithImage:(__CVBuffer *)a3
{
  return -[VCPSceneprintDescriptor initWithImage:]([VCPSceneprintDescriptor alloc], "initWithImage:", a3);
}

+ (id)descriptorWithData:(id)a3
{
  id v3;
  VCPSceneprintDescriptor *v4;

  v3 = a3;
  v4 = -[VCPSceneprintDescriptor initWithData:]([VCPSceneprintDescriptor alloc], "initWithData:", v3);

  return v4;
}

- (VCPSceneprintDescriptor)initWithImage:(__CVBuffer *)a3
{
  VCPSceneprintDescriptor *v4;
  void *v5;
  id v6;
  VCPSceneprintDescriptor *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  VNSceneprint *sceneprint;
  int v26;
  int v27;
  VCPSceneprintDescriptor *v28;
  id v30;
  uint8_t buf[8];
  id v32;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)VCPSceneprintDescriptor;
  v4 = -[VCPSceneprintDescriptor init](&v33, sel_init);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_33;
  }
  v5 = (void *)MEMORY[0x1BCCA1B2C]();
  v6 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v7 = (VCPSceneprintDescriptor *)objc_msgSend(v6, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
  if (!v7)
  {
    v27 = 4;
    v26 = -108;
    goto LABEL_28;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CEDE40]);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setPreferBackgroundProcessing:", 1);
    if (DeviceHasANE())
    {
      objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProcessingDevice:", v10);

    }
    v32 = 0;
    v11 = objc_msgSend(v9, "setRevision:error:", 3737841671, &v32);
    v12 = v32;
    if ((v11 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error -[VNCreateSceneprintRequest setRevision:error:]", buf, 2u);
      }
      v27 = 4;
      v26 = -18;
      goto LABEL_26;
    }
    v34[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v12;
    v14 = -[VCPSceneprintDescriptor performRequests:error:](v7, "performRequests:error:", v13, &v30);
    v15 = v30;

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v9, "results");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count") == 1;

      if (v17)
      {
        objc_msgSend(v9, "results");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "results");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sceneprints");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = objc_claimAutoreleasedReturnValue();
          sceneprint = v4->_sceneprint;
          v4->_sceneprint = (VNSceneprint *)v24;

          if (v4->_sceneprint)
            v26 = 0;
          else
            v26 = -18;
          v27 = 4 * (v4->_sceneprint == 0);
          goto LABEL_25;
        }
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error -[VNImageRequestHandler requestHandler:error:]", buf, 2u);
    }
    v27 = 4;
    v26 = -18;
LABEL_25:
    v12 = v15;
LABEL_26:

    goto LABEL_27;
  }
  v27 = 4;
  v26 = -18;
LABEL_27:

LABEL_28:
  objc_autoreleasePoolPop(v5);
  if ((v27 | 4) == 4)
  {
    if (v26)
      v28 = 0;
    else
      v28 = v4;
    v7 = v28;
  }
LABEL_33:

  return v7;
}

- (VCPSceneprintDescriptor)initWithData:(id)a3
{
  id v4;
  VCPSceneprintDescriptor *v5;
  uint64_t v6;
  id v7;
  VNSceneprint *sceneprint;
  VCPSceneprintDescriptor *v9;
  void *v10;
  VCPSceneprintDescriptor *v11;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VCPSceneprintDescriptor;
  v5 = -[VCPSceneprintDescriptor init](&v14, sel_init);
  if (v5)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v13);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v13;
    sceneprint = v5->_sceneprint;
    v5->_sceneprint = (VNSceneprint *)v6;

    v9 = v5;
    if (!v5->_sceneprint)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "NSKeyedUnarchiver error: %@", buf, 0xCu);

      }
      v9 = 0;
    }
    v11 = v9;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)serialize
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_sceneprint, 1, 0);
}

- (int)computeDistance:(float *)a3 toDescriptor:(id)a4
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  VNSceneprint *sceneprint;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  int v14;
  int v15;
  id v17;

  v6 = (uint64_t *)a4;
  v7 = v6;
  if (v6 && (v8 = v6[1]) != 0)
  {
    sceneprint = self->_sceneprint;
    v17 = 0;
    -[VNSceneprint computeDistance:withDistanceFunction:error:](sceneprint, "computeDistance:withDistanceFunction:error:", v8, 1, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = v11;
    if (v10)
      v13 = v11 == 0;
    else
      v13 = 0;
    if (v13)
    {
      objc_msgSend(v10, "floatValue");
      v14 = 0;
      *(_DWORD *)a3 = v15;
    }
    else
    {
      v14 = -18;
    }

  }
  else
  {
    v14 = -18;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneprint, 0);
}

@end
