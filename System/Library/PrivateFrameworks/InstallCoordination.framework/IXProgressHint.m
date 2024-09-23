@implementation IXProgressHint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXProgressHint)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXProgressHint;
  return -[IXProgressHint init](&v3, sel_init);
}

- (IXProgressHint)initWithCoder:(id)a3
{
  id v4;
  IXProgressHint *v5;
  uint64_t v6;
  NSNumber *compressedAppAssetSizeInBytes;
  uint64_t v8;
  NSNumber *uncompressedAppAssetSizeInBytes;
  uint64_t v10;
  NSNumber *filesInAppAssetCount;
  uint64_t v12;
  NSNumber *totalODRAssetSizeInBytes;
  uint64_t v14;
  NSNumber *totalExpectedEssentialAssetSizeInBytes;
  uint64_t v16;
  NSNumber *loadingPhaseProportion;
  uint64_t v18;
  NSNumber *installingPhaseProportion;
  uint64_t v20;
  NSNumber *postProcessingPhaseProportion;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IXProgressHint;
  v5 = -[IXProgressHint init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compressedAppAssetSizeInBytes"));
    v6 = objc_claimAutoreleasedReturnValue();
    compressedAppAssetSizeInBytes = v5->_compressedAppAssetSizeInBytes;
    v5->_compressedAppAssetSizeInBytes = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uncompressedAppAssetSizeInBytes"));
    v8 = objc_claimAutoreleasedReturnValue();
    uncompressedAppAssetSizeInBytes = v5->_uncompressedAppAssetSizeInBytes;
    v5->_uncompressedAppAssetSizeInBytes = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filesInAppAssetCount"));
    v10 = objc_claimAutoreleasedReturnValue();
    filesInAppAssetCount = v5->_filesInAppAssetCount;
    v5->_filesInAppAssetCount = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalODRAssetSizeInBytes"));
    v12 = objc_claimAutoreleasedReturnValue();
    totalODRAssetSizeInBytes = v5->_totalODRAssetSizeInBytes;
    v5->_totalODRAssetSizeInBytes = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalExpectedEssentialAssetSizeInBytes"));
    v14 = objc_claimAutoreleasedReturnValue();
    totalExpectedEssentialAssetSizeInBytes = v5->_totalExpectedEssentialAssetSizeInBytes;
    v5->_totalExpectedEssentialAssetSizeInBytes = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loadingPhaseProportion"));
    v16 = objc_claimAutoreleasedReturnValue();
    loadingPhaseProportion = v5->_loadingPhaseProportion;
    v5->_loadingPhaseProportion = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installingPhaseProportion"));
    v18 = objc_claimAutoreleasedReturnValue();
    installingPhaseProportion = v5->_installingPhaseProportion;
    v5->_installingPhaseProportion = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postProcessingPhaseProportion"));
    v20 = objc_claimAutoreleasedReturnValue();
    postProcessingPhaseProportion = v5->_postProcessingPhaseProportion;
    v5->_postProcessingPhaseProportion = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[IXProgressHint compressedAppAssetSizeInBytes](self, "compressedAppAssetSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("compressedAppAssetSizeInBytes"));

  -[IXProgressHint uncompressedAppAssetSizeInBytes](self, "uncompressedAppAssetSizeInBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uncompressedAppAssetSizeInBytes"));

  -[IXProgressHint filesInAppAssetCount](self, "filesInAppAssetCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("filesInAppAssetCount"));

  -[IXProgressHint totalODRAssetSizeInBytes](self, "totalODRAssetSizeInBytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("totalODRAssetSizeInBytes"));

  -[IXProgressHint totalExpectedEssentialAssetSizeInBytes](self, "totalExpectedEssentialAssetSizeInBytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("totalExpectedEssentialAssetSizeInBytes"));

  -[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("loadingPhaseProportion"));

  -[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("installingPhaseProportion"));

  -[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("postProcessingPhaseProportion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[IXProgressHint compressedAppAssetSizeInBytes](self, "compressedAppAssetSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompressedAppAssetSizeInBytes:", v5);

  -[IXProgressHint uncompressedAppAssetSizeInBytes](self, "uncompressedAppAssetSizeInBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUncompressedAppAssetSizeInBytes:", v6);

  -[IXProgressHint filesInAppAssetCount](self, "filesInAppAssetCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilesInAppAssetCount:", v7);

  -[IXProgressHint totalODRAssetSizeInBytes](self, "totalODRAssetSizeInBytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTotalODRAssetSizeInBytes:", v8);

  -[IXProgressHint totalExpectedEssentialAssetSizeInBytes](self, "totalExpectedEssentialAssetSizeInBytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTotalExpectedEssentialAssetSizeInBytes:", v9);

  -[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:", v10, v11, v12, 0);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  IXProgressHint *v4;
  IXProgressHint *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  _BOOL4 v30;

  v4 = (IXProgressHint *)a3;
  if (v4 == self)
  {
    v20 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = 0;
    goto LABEL_21;
  }
  v5 = v4;
  -[IXProgressHint compressedAppAssetSizeInBytes](self, "compressedAppAssetSizeInBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint compressedAppAssetSizeInBytes](v5, "compressedAppAssetSizeInBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = v9;
  if ((v8 != 0) != (v9 != 0) || v8 && v9 && !objc_msgSend(v8, "isEqual:", v9))
    goto LABEL_16;

  -[IXProgressHint uncompressedAppAssetSizeInBytes](self, "uncompressedAppAssetSizeInBytes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint uncompressedAppAssetSizeInBytes](v5, "uncompressedAppAssetSizeInBytes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v13 = v12;
  v10 = v13;
  if ((v8 != 0) != (v13 != 0) || v8 && v13 && !objc_msgSend(v8, "isEqual:", v13))
    goto LABEL_16;

  -[IXProgressHint filesInAppAssetCount](self, "filesInAppAssetCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint filesInAppAssetCount](v5, "filesInAppAssetCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v16 = v15;
  v10 = v16;
  if ((v8 != 0) != (v16 != 0) || v8 && v16 && !objc_msgSend(v8, "isEqual:", v16))
    goto LABEL_16;

  -[IXProgressHint totalODRAssetSizeInBytes](self, "totalODRAssetSizeInBytes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint totalODRAssetSizeInBytes](v5, "totalODRAssetSizeInBytes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v19 = v18;
  v10 = v19;
  if ((v8 != 0) != (v19 != 0) || v8 && v19 && !objc_msgSend(v8, "isEqual:", v19))
  {
LABEL_16:

    v20 = 0;
  }
  else
  {

    -[IXProgressHint totalExpectedEssentialAssetSizeInBytes](self, "totalExpectedEssentialAssetSizeInBytes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXProgressHint totalExpectedEssentialAssetSizeInBytes](v5, "totalExpectedEssentialAssetSizeInBytes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = _CompareObjects(v22, v23);

    if (!v24)
      goto LABEL_29;
    -[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXProgressHint loadingPhaseProportion](v5, "loadingPhaseProportion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = _CompareObjects(v25, v26);

    if (!v27
      || (-[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion"),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          -[IXProgressHint installingPhaseProportion](v5, "installingPhaseProportion"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v30 = _CompareObjects(v28, v29),
          v29,
          v28,
          !v30))
    {
LABEL_29:
      v20 = 0;
      goto LABEL_18;
    }
    -[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[IXProgressHint postProcessingPhaseProportion](v5, "postProcessingPhaseProportion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = _CompareObjects(v8, v10);
  }

LABEL_18:
LABEL_21:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[IXProgressHint compressedAppAssetSizeInBytes](self, "compressedAppAssetSizeInBytes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[IXProgressHint uncompressedAppAssetSizeInBytes](self, "uncompressedAppAssetSizeInBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[IXProgressHint filesInAppAssetCount](self, "filesInAppAssetCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[IXProgressHint totalODRAssetSizeInBytes](self, "totalODRAssetSizeInBytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[IXProgressHint totalExpectedEssentialAssetSizeInBytes](self, "totalExpectedEssentialAssetSizeInBytes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  -[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  -[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (NSDictionary)progressProportionsDictionaryForLaunchServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, &unk_1E4DD8358);

  -[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, &unk_1E4DD8370);

  -[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, &unk_1E4DD8388);

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v7;
}

- (BOOL)setPhaseProportionsForLoadingPhase:(id)a3 installingPhase:(id)a4 postProcessingPhase:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  BOOL v26;
  double v28;
  double v29;
  double v30;
  double v31;
  NSNumber *v32;
  NSNumber *loadingPhaseProportion;
  NSNumber *v34;
  NSNumber *installingPhaseProportion;
  NSNumber *v36;
  NSNumber *postProcessingPhaseProportion;
  uint64_t v38;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "doubleValue");
  v13 = v12;
  objc_msgSend(v11, "doubleValue");
  v15 = v14;

  if (v10)
    objc_msgSend(v10, "doubleValue");
  else
    v16 = 0.0;
  if (v13 == 0.0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:].cold.1();

    v19 = CFSTR("The loading phase is required and thus cannot be 0 percent of the total progress.");
    v20 = 176;
  }
  else if (v15 == 0.0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:].cold.2();

    v19 = CFSTR("The installing phase is required and thus cannot be 0 percent of the total progress.");
    v20 = 180;
  }
  else if (v13 >= 0.0)
  {
    if (v15 >= 0.0)
    {
      if (v16 >= 0.0)
      {
        v28 = v13 + v15 + v16;
        v29 = v13 / v28;
        v30 = v15 / v28;
        v31 = v16 / v28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
        v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        loadingPhaseProportion = self->_loadingPhaseProportion;
        self->_loadingPhaseProportion = v32;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
        v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        installingPhaseProportion = self->_installingPhaseProportion;
        self->_installingPhaseProportion = v34;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        postProcessingPhaseProportion = self->_postProcessingPhaseProportion;
        self->_postProcessingPhaseProportion = v36;

        v25 = 0;
        v26 = 1;
        goto LABEL_27;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:].cold.5();

      v19 = CFSTR("The post processing installation phase proportion cannot be negative.");
      v20 = 193;
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:].cold.4();

      v19 = CFSTR("The installing installation phase proportion cannot be negative.");
      v20 = 189;
    }
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:].cold.3();

    v19 = CFSTR("The loading installation phase proportion cannot be negative.");
    v20 = 185;
  }
  _CreateError((uint64_t)"-[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:]", v20, CFSTR("IXErrorDomain"), 0x37uLL, 0, 0, v19, v18, v38);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v25 = objc_retainAutorelease(v25);
    v26 = 0;
    *a6 = v25;
  }
  else
  {
    v26 = 0;
  }
LABEL_27:

  return v26;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ loading:%@ installing:%@ postprocessing:%@>"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSNumber)compressedAppAssetSizeInBytes
{
  return self->_compressedAppAssetSizeInBytes;
}

- (void)setCompressedAppAssetSizeInBytes:(id)a3
{
  objc_storeStrong((id *)&self->_compressedAppAssetSizeInBytes, a3);
}

- (NSNumber)uncompressedAppAssetSizeInBytes
{
  return self->_uncompressedAppAssetSizeInBytes;
}

- (void)setUncompressedAppAssetSizeInBytes:(id)a3
{
  objc_storeStrong((id *)&self->_uncompressedAppAssetSizeInBytes, a3);
}

- (NSNumber)filesInAppAssetCount
{
  return self->_filesInAppAssetCount;
}

- (void)setFilesInAppAssetCount:(id)a3
{
  objc_storeStrong((id *)&self->_filesInAppAssetCount, a3);
}

- (NSNumber)totalODRAssetSizeInBytes
{
  return self->_totalODRAssetSizeInBytes;
}

- (void)setTotalODRAssetSizeInBytes:(id)a3
{
  objc_storeStrong((id *)&self->_totalODRAssetSizeInBytes, a3);
}

- (NSNumber)totalExpectedEssentialAssetSizeInBytes
{
  return self->_totalExpectedEssentialAssetSizeInBytes;
}

- (void)setTotalExpectedEssentialAssetSizeInBytes:(id)a3
{
  objc_storeStrong((id *)&self->_totalExpectedEssentialAssetSizeInBytes, a3);
}

- (NSNumber)loadingPhaseProportion
{
  return self->_loadingPhaseProportion;
}

- (NSNumber)installingPhaseProportion
{
  return self->_installingPhaseProportion;
}

- (NSNumber)postProcessingPhaseProportion
{
  return self->_postProcessingPhaseProportion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessingPhaseProportion, 0);
  objc_storeStrong((id *)&self->_installingPhaseProportion, 0);
  objc_storeStrong((id *)&self->_loadingPhaseProportion, 0);
  objc_storeStrong((id *)&self->_totalExpectedEssentialAssetSizeInBytes, 0);
  objc_storeStrong((id *)&self->_totalODRAssetSizeInBytes, 0);
  objc_storeStrong((id *)&self->_filesInAppAssetCount, 0);
  objc_storeStrong((id *)&self->_uncompressedAppAssetSizeInBytes, 0);
  objc_storeStrong((id *)&self->_compressedAppAssetSizeInBytes, 0);
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: The loading phase is required and thus cannot be 0 percent of the total progress. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: The installing phase is required and thus cannot be 0 percent of the total progress. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: The loading installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: The installing installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: The post processing installation phase proportion cannot be negative. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

@end
