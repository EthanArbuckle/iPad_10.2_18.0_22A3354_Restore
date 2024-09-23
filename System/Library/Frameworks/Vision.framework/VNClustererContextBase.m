@implementation VNClustererContextBase

- (BOOL)_checkInitInputs:(id)a3 cachePath:(id)a4 checkType:(id)a5 requestRevision:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  char v16;
  BOOL v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v12, &v28);

  if (v28)
    v16 = v15;
  else
    v16 = 0;
  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Clusterer cache directory: %@"), v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v18);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v11, "isEqualToString:", v13) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Clusterer type: %@"), v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v18);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  if (!+[VNRequest supportsAnyRevision:](VNCreateFaceprintRequest, "supportsAnyRevision:", a6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Faceprint revision: %lu"), a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v18);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_16:
    v19 = objc_retainAutorelease(v18);
    v20 = objc_msgSend(v19, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v21, v22, v23, v24, v25, v26, v20);

    v17 = 0;
    goto LABEL_17;
  }
  v17 = 1;
LABEL_17:

  return v17;
}

- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 requestRevision:(unint64_t)a8 error:(id *)a9
{
  return -[VNClustererContextBase initWithType:cachePath:state:readOnly:threshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:readOnly:threshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a6, a8, 1, a9);
}

- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 requestRevision:(unint64_t)a8 torsoprintRequestRevision:(unint64_t)a9 error:(id *)a10
{
  id v17;
  id v18;
  VNClustererContextBase *v19;
  VNClustererContextBase *v20;
  double v21;
  uint64_t v22;
  NSNumber *threshold;
  NSNumber *torsoThreshold;
  VNClustererContextBase *v25;
  objc_super v27;

  v17 = a3;
  v18 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VNClustererContextBase;
  v19 = -[VNClustererContextBase init](&v27, sel_init);
  v20 = v19;
  if (!v19)
  {
    if (a10)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v25 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v25 = 0;
    goto LABEL_7;
  }
  if (!-[VNClustererContextBase _checkInitInputs:cachePath:checkType:requestRevision:error:](v19, "_checkInitInputs:cachePath:checkType:requestRevision:error:", v17, v18, CFSTR("VNClusteringAlgorithm_Greedy"), a8, a10))goto LABEL_6;
  objc_storeStrong((id *)&v20->_type, a3);
  *(float *)&v21 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  threshold = v20->_threshold;
  v20->_threshold = (NSNumber *)v22;

  torsoThreshold = v20->_torsoThreshold;
  v20->_torsoThreshold = (NSNumber *)&unk_1E459C418;

  objc_storeStrong((id *)&v20->_cacheDirectoryPath, a4);
  v20->_readOnly = a6;
  v20->_faceprintRequestRevision = a8;
  v20->_torsoprintRequestRevision = a9;
  v25 = v20;
LABEL_7:

  return v25;
}

- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 torsoThreshold:(float)a8 requestRevision:(unint64_t)a9 error:(id *)a10
{
  return -[VNClustererContextBase initWithType:cachePath:state:readOnly:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:](self, "initWithType:cachePath:state:readOnly:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:error:", a3, a4, a5, a6, a9, 1, a10);
}

- (VNClustererContextBase)initWithType:(id)a3 cachePath:(id)a4 state:(id)a5 readOnly:(BOOL)a6 threshold:(float)a7 torsoThreshold:(float)a8 requestRevision:(unint64_t)a9 torsoprintRequestRevision:(unint64_t)a10 error:(id *)a11
{
  id v19;
  id v20;
  VNClustererContextBase *v21;
  VNClustererContextBase *v22;
  double v23;
  uint64_t v24;
  NSNumber *threshold;
  double v26;
  uint64_t v27;
  NSNumber *torsoThreshold;
  VNClustererContextBase *v29;
  objc_super v31;

  v19 = a3;
  v20 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VNClustererContextBase;
  v21 = -[VNClustererContextBase init](&v31, sel_init);
  v22 = v21;
  if (!v21)
  {
    if (a11)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v29 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v29 = 0;
    goto LABEL_7;
  }
  if (!-[VNClustererContextBase _checkInitInputs:cachePath:checkType:requestRevision:error:](v21, "_checkInitInputs:cachePath:checkType:requestRevision:error:", v19, v20, CFSTR("VNClusteringAlgorithm_GreedyWithTorso"), a9, a11))goto LABEL_6;
  objc_storeStrong((id *)&v22->_type, a3);
  *(float *)&v23 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v24 = objc_claimAutoreleasedReturnValue();
  threshold = v22->_threshold;
  v22->_threshold = (NSNumber *)v24;

  *(float *)&v26 = a8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = objc_claimAutoreleasedReturnValue();
  torsoThreshold = v22->_torsoThreshold;
  v22->_torsoThreshold = (NSNumber *)v27;

  objc_storeStrong((id *)&v22->_cacheDirectoryPath, a4);
  v22->_readOnly = a6;
  v22->_faceprintRequestRevision = a9;
  v22->_torsoprintRequestRevision = a10;
  v29 = v22;
LABEL_7:

  return v29;
}

- (id)_createGreedyClusterer:(Class)a3 state:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VNClustererContextBase _initializeGreedyClustererOptions:](self, "_initializeGreedyClustererOptions:", v9);
  if (v8)
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("VNClusterOptionRestoreClusteringState"));
  v10 = (void *)objc_msgSend([a3 alloc], "initWithOptions:error:", v9, a5);
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    if (a5)
    {
      objc_msgSend(*a5, "localizedDescription");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create clusterer; Error = %@"), a5);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v15, v16, v17, v18, v19, v20, v14);

  }
  return v11;
}

- (void)_initializeGreedyClustererOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_type, CFSTR("VNClusterOptionClusteringAlgorithm"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_cacheDirectoryPath, CFSTR("VNClusterOptionCacheFolderPath"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_threshold, CFSTR("VNClusterOptionInputThreshold"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_torsoThreshold, CFSTR("VNClusterOptionInputTorsoThreshold"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_readOnly);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("VNClusterOptionVectorMapReadOnlyFlag"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_faceprintRequestRevision);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("VNClusterOptionFaceprintRevision"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_torsoprintRequestRevision);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("VNClusterOptionTorsoprintRevision"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryPath, 0);
  objc_storeStrong((id *)&self->_torsoThreshold, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
