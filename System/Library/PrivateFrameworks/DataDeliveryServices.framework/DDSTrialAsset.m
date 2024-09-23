@implementation DDSTrialAsset

+ (id)attributesWithLocalURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("Info"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("MobileAssetProperties"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("MobileAssetProperties"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)createWithExperimentIdentifiers:(id)a3 localURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  DDSTrialAsset *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "attributesWithLocalURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("AssetData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

    if ((v12 & 1) != 0)
    {
      v13 = -[DDSTrialAsset initWithExperimentIdentifiers:attributes:localURL:]([DDSTrialAsset alloc], "initWithExperimentIdentifiers:attributes:localURL:", v6, v8, v9);
    }
    else
    {
      DefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[DDSTrialAsset createWithExperimentIdentifiers:localURL:].cold.2((uint64_t)v9, v21, v22, v23, v24, v25, v26, v27);

      v13 = 0;
    }
    v7 = v9;
  }
  else
  {
    DefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[DDSTrialAsset createWithExperimentIdentifiers:localURL:].cold.1((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);

    v13 = 0;
  }

  return v13;
}

- (DDSTrialAsset)initWithExperimentIdentifiers:(id)a3 attributes:(id)a4 localURL:(id)a5
{
  id v8;
  id v9;
  DDSTrialAsset *v10;
  uint64_t v11;
  DDSTrialExperimentIdentifiers *experimentIdentifiers;
  void *v13;
  uint64_t v14;
  NSString *description;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DDSTrialAsset;
  v10 = -[DDSAsset initWithAttributes:localURL:](&v17, sel_initWithAttributes_localURL_, a4, v9);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    experimentIdentifiers = v10->_experimentIdentifiers;
    v10->_experimentIdentifiers = (DDSTrialExperimentIdentifiers *)v11;

    v18[0] = CFSTR("localURL");
    v18[1] = CFSTR("experimentIdentifiers");
    v19[0] = v9;
    v19[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = objc_claimAutoreleasedReturnValue();
    description = v10->_description;
    v10->_description = (NSString *)v14;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)DDSTrialAsset,
        -[DDSAsset isEqual:](&v11, sel_isEqual_, v6)))
  {
    -[DDSTrialAsset experimentIdentifiers](self, "experimentIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DDSTrialAsset;
  v3 = -[DDSAsset hash](&v7, sel_hash);
  -[DDSTrialAsset experimentIdentifiers](self, "experimentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  return objc_getProperty(self, a2, 120, 1);
}

- (DDSTrialExperimentIdentifiers)experimentIdentifiers
{
  return (DDSTrialExperimentIdentifiers *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

+ (void)createWithExperimentIdentifiers:(uint64_t)a3 localURL:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, a2, a3, "Failed to create trial asset for url attributes missing: %@", a5, a6, a7, a8, 2u);
}

+ (void)createWithExperimentIdentifiers:(uint64_t)a3 localURL:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DA990000, a2, a3, "Failed to create trial asset, AssetData directory doesn't exist: %@", a5, a6, a7, a8, 2u);
}

@end
