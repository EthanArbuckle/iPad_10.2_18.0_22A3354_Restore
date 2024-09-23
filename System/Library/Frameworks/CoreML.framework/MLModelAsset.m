@implementation MLModelAsset

- (id)modelWithError:(id *)a3
{
  void *v5;
  void *v6;

  -[MLModelAsset lastConfiguration](self, "lastConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelAsset modelWithConfiguration:error:](self, "modelWithConfiguration:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)load:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[MLModelAsset modelVendor](self, "modelVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelAsset lastConfiguration](self, "lastConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelWithConfiguration:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (NSDictionary)archiveData
{
  return self->_archiveData;
}

+ (MLModelAsset)modelAssetWithURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:configuration:error:", v8, v9, a5);

  return (MLModelAsset *)v10;
}

- (MLModelAsset)initWithURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  MLModelAsset *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint8_t buf[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_retainAutorelease(v10);
  objc_msgSend(v12, "stringWithCString:encoding:", objc_msgSend(v13, "fileSystemRepresentation"), 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "fileExistsAtPath:", v14);

  if ((v15 & 1) != 0)
  {
    if ((objc_msgSend(v13, "isFileURL") & 1) != 0)
    {
      v36 = 0;
      v16 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v36, *MEMORY[0x1E0C998C8], a5);
      v17 = v36;
      v18 = v17;
      if ((v16 & 1) != 0)
      {
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

          goto LABEL_19;
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "The the canonical path for %@ is not available.", buf, 0xCu);
        }

        if (!a5)
        {
          v18 = 0;
          goto LABEL_16;
        }
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The the canonical path for %@ is not available."), v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v35, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v34);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v18 = 0;
      }
      else
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          _os_log_error_impl(&dword_19C486000, v29, OS_LOG_TYPE_ERROR, "Failed to obtain the canonical path for %@", buf, 0xCu);
        }

        if (!a5)
          goto LABEL_16;
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to obtain the canonical path for %@"), v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v35, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v31);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_15:

LABEL_16:
      v19 = 0;
      goto LABEL_17;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_19C486000, v24, OS_LOG_TYPE_ERROR, "The model URL (%@) must be a file URL.", buf, 0xCu);
    }

    if (a5)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v36 = (id)*MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The model URL (%@) must be a file URL."), v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "The model is not found at URL: %@", buf, 0xCu);
    }

    if (a5)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v36 = (id)*MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The model is not found at URL: %@"), v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      *a5 = v23;
      goto LABEL_15;
    }
  }
  v19 = 0;
LABEL_19:

  if (v19)
  {
    +[MLModelAssetResourceFactory resourceFactoryWithModelURL:error:](MLModelAssetResourceFactory, "resourceFactoryWithModelURL:error:", v19, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      self = -[MLModelAsset initWithResourceFactory:configuration:](self, "initWithResourceFactory:configuration:", v26, v9);
      v27 = self;
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveData, 0);
  objc_storeStrong((id *)&self->_lastConfiguration, 0);
  objc_storeStrong((id *)&self->_structureVendor, 0);
  objc_storeStrong((id *)&self->_modelVendor, 0);
  objc_storeStrong((id *)&self->_descriptionVendor, 0);
  objc_storeStrong((id *)&self->_resourceFactory, 0);
}

- (NSURL)compiledModelURL
{
  void *v2;
  void *v3;

  -[MLModelAsset resourceFactory](self, "resourceFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compiledModelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (MLModelAsset)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  MLModelConfiguration *v7;
  MLModelAsset *v8;

  v6 = a3;
  v7 = objc_alloc_init(MLModelConfiguration);
  v8 = -[MLModelAsset initWithURL:configuration:error:](self, "initWithURL:configuration:error:", v6, v7, a4);

  return v8;
}

- (MLModelAsset)initWithResourceFactory:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  MLModelAsset *v9;
  MLModelAssetDescriptionVendor *v10;
  MLModelAssetModelVendor *v11;
  MLModelAssetModelStructureVendor *v12;
  uint64_t v13;
  MLModelConfiguration *lastConfiguration;
  MLModelConfiguration *v15;
  MLModelConfiguration *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MLModelAsset;
  v9 = -[MLModelAsset init](&v18, sel_init);
  if (v9)
  {
    v10 = -[MLModelAssetDescriptionVendor initWithResourceFactory:]([MLModelAssetDescriptionVendor alloc], "initWithResourceFactory:", v7);
    v11 = -[MLModelAssetModelVendor initWithResourceFactory:]([MLModelAssetModelVendor alloc], "initWithResourceFactory:", v7);
    objc_storeStrong((id *)&v9->_resourceFactory, a3);
    objc_storeStrong((id *)&v9->_descriptionVendor, v10);
    objc_storeStrong((id *)&v9->_modelVendor, v11);
    v12 = -[MLModelAssetModelStructureVendor initWithResourceFactory:]([MLModelAssetModelStructureVendor alloc], "initWithResourceFactory:", v7);
    objc_storeStrong((id *)&v9->_structureVendor, v12);
    v13 = objc_msgSend(v8, "copy");
    lastConfiguration = v9->_lastConfiguration;
    v9->_lastConfiguration = (MLModelConfiguration *)v13;

    if (!v9->_lastConfiguration)
    {
      v15 = objc_alloc_init(MLModelConfiguration);
      v16 = v9->_lastConfiguration;
      v9->_lastConfiguration = v15;

    }
  }

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MLModelAsset compiledModelURL](self, "compiledModelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("MLModelAsset(URL: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)functionNamesWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MLModelAsset descriptionVendor](self, "descriptionVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "functionNamesWithCompletionHandler:", v5);

}

- (void)modelDescriptionWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MLModelAsset descriptionVendor](self, "descriptionVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelDescriptionWithCompletionHandler:", v5);

}

- (void)modelDescriptionOfFunctionNamed:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MLModelAsset descriptionVendor](self, "descriptionVendor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelDescriptionOfFunctionNamed:completionHandler:", v8, v6);

}

- (void)modelStructureWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MLModelAsset structureVendor](self, "structureVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelStructureWithCompletionHandler:", v5);

}

- (MLModel)model
{
  return (MLModel *)-[MLModelAsset modelWithError:](self, "modelWithError:", 0);
}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MLModelAsset modelVendor](self, "modelVendor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MLModelAsset modelVendor](self, "modelVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelWithConfiguration:error:", v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

    if (a4)
      -[MLModelAsset setLastConfiguration:](self, "setLastConfiguration:", v6);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "MLModelAsset has not been initialized properly.", v14, 2u);
    }

    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MLModelAsset has not been initialized properly."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (MLClassifier)classifier
{
  return (MLClassifier *)-[MLModelAsset classifierWithError:](self, "classifierWithError:", 0);
}

- (id)classifierWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[MLModelAsset modelWithError:](self, "modelWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "classifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Model is not a classifier", v14, 2u);
      }

      if (a3)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v15 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model is not a classifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v12);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MLRegressor)regressor
{
  return (MLRegressor *)-[MLModelAsset regressorWithError:](self, "regressorWithError:", 0);
}

- (id)regressorWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[MLModelAsset modelWithError:](self, "modelWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "regressor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "The model is not a regressor.", v14, 2u);
      }

      if (a3)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v15 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The model is not a regressor."));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v12);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)storageType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[MLModelAsset resourceFactory](self, "resourceFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compiledModelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (MLModelAsset)initWithArchiveData:(id)a3
{
  void *v4;
  MLModelConfiguration *v5;
  MLModelAsset *v6;

  +[MLModelAssetResourceFactory resourceFactoryWithArchiveData:](MLModelAssetResourceFactory, "resourceFactoryWithArchiveData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MLModelConfiguration);
  v6 = -[MLModelAsset initWithResourceFactory:configuration:](self, "initWithResourceFactory:configuration:", v4, v5);

  return v6;
}

- (MLModelAssetResourceFactory)resourceFactory
{
  return self->_resourceFactory;
}

- (MLModelAssetDescriptionVendor)descriptionVendor
{
  return self->_descriptionVendor;
}

- (MLModelAssetModelVendor)modelVendor
{
  return self->_modelVendor;
}

- (MLModelAssetModelStructureVendor)structureVendor
{
  return self->_structureVendor;
}

- (MLModelConfiguration)lastConfiguration
{
  return self->_lastConfiguration;
}

- (void)setLastConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setArchiveData:(id)a3
{
  objc_storeStrong((id *)&self->_archiveData, a3);
}

+ (MLModelAsset)modelAssetWithURL:(id)a3 error:(id *)a4
{
  id v6;
  MLModelConfiguration *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(MLModelConfiguration);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:configuration:error:", v6, v7, a4);

  return (MLModelAsset *)v8;
}

+ (MLModelAsset)modelAssetWithSpecification:(void *)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelAssetWithSpecification:compilerOptions:error:", a3, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLModelAsset *)v8;
}

+ (MLModelAsset)modelAssetWithSpecification:(void *)a3 compilerOptions:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  void *v16;
  void *v17;
  void *__p;
  char v20;
  _QWORD v21[2];
  std::__shared_weak_count *v22;
  int v23;
  void *v24;
  char v25;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueDirectoryURLInPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("model.mlmodel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CoreML::Model::Model((CoreML::Model *)v21, *(const CoreML::Specification::Model **)a3);
    v12 = objc_retainAutorelease(v11);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v12, "fileSystemRepresentation"));
    CoreML::Model::save((uint64_t)&v23, (uint64_t)v21);
    if (v20 < 0)
      operator delete(__p);
    v21[0] = &off_1E3D597D0;
    v13 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if ((v23 & 0xFFFFFFEF) != 0)
    {
      if (a5)
      {
        v16 = &v24;
        if (v25 < 0)
          v16 = v24;
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%s"), v16);
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      +[MLModelAsset modelAssetWithSpecificationURL:compilerOptions:error:](MLModelAsset, "modelAssetWithSpecificationURL:compilerOptions:error:", v12, v7, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "removeItemAndReturnError:", 0);
    if (v25 < 0)
      operator delete(v24);

  }
  else
  {
    v17 = 0;
  }

  return (MLModelAsset *)v17;
}

+ (MLModelAsset)modelAssetWithSpecificationURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelAssetWithSpecificationURL:compilerOptions:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLModelAsset *)v8;
}

+ (MLModelAsset)modelAssetWithSpecificationURL:(id)a3 compilerOptions:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;

  +[MLModel _compileModelAtURL:options:error:](MLModel, "_compileModelAtURL:options:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:error:", v7, a5);
  else
    v8 = 0;

  return (MLModelAsset *)v8;
}

+ (BOOL)isANESupported
{
  uint64_t context;

  context = espresso_create_context();
  if (context)
    espresso_context_destroy();
  return context != 0;
}

+ (id)fetchNetworkURLFromCompiledModelAtURL:(id)a3 error:(id *)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  void *v22;
  id v24;
  id v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _QWORD v44[4];

  v44[1] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__7237;
  v37 = __Block_byref_object_dispose__7238;
  v38 = 0;
  v25 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C999D0];
  v44[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __60__MLModelAsset_fetchNetworkURLFromCompiledModelAtURL_error___block_invoke;
  v32[3] = &unk_1E3D662A0;
  v32[4] = &v33;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v24, v6, 16, v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34[5])
    goto LABEL_16;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v22;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        obj = 0;
        v27 = 0;
        v12 = v34;
        v13 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v27, v5, &obj, v22);
        v14 = v27;
        objc_storeStrong(v12 + 5, obj);
        if ((v13 & 1) == 0)
        {

          goto LABEL_15;
        }
        if ((objc_msgSend(v14, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v11, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "hasSuffix:", CFSTR(".espresso.net"));

          if ((v16 & 1) != 0)
          {
            objc_msgSend(v11, "relativePath");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "URLByAppendingPathComponent:isDirectory:", v17, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "addObject:", v18);
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

  if (v34[5])
  {
LABEL_16:
    +[MLLogging coreChannel](MLLogging, "coreChannel", v22);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v34[5], "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v24;
      v41 = 2112;
      v42 = v21;
      _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch Espresso Nets for compiled models at %@ with error %@", buf, 0x16u);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v34[5]);

    v25 = 0;
  }

  _Block_object_dispose(&v33, 8);
  return v25;
}

+ (BOOL)needsANECompilationForModelAtURL:(id)a3 result:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t has_network;
  BOOL v18;
  NSObject *v19;
  BOOL v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    if (!objc_msgSend(a1, "isANESupported"))
    {
      v18 = 0;
      v11 = 0;
      v10 = 0;
      v20 = 1;
      goto LABEL_26;
    }
    v28 = 0;
    objc_msgSend(a1, "fetchNetworkURLFromCompiledModelAtURL:error:", v8, &v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v28;
    if (v9)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            *(_DWORD *)buf = -1;
            v16 = objc_retainAutorelease(v15);
            objc_msgSend(v16, "fileSystemRepresentation");
            has_network = espresso_ane_cache_has_network();
            if ((_DWORD)has_network)
            {
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to check cached ANE binary because espresso_ane_cache_has_network returned status=%d for network at %@."), has_network, v16, (_QWORD)v24);
              v21 = objc_claimAutoreleasedReturnValue();

              v18 = 0;
              v10 = (id)v21;
              goto LABEL_25;
            }
            if (!*(_DWORD *)buf)
            {
              v18 = 1;
              goto LABEL_25;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v12)
            continue;
          break;
        }
      }
      v18 = 0;
LABEL_25:

      v20 = 1;
      goto LABEL_26;
    }
  }
  else
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:format:](MLModelErrorUtils, "parameterErrorWithUnderlyingError:format:", 0, CFSTR("Failed to check cached ANE binary: argument result must not be nil"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v10, "localizedDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v8;
    v31 = 2112;
    v32 = v23;
    _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Failed to check cached ANE binary for compiled models at %@ with error %@", buf, 0x16u);

  }
  if (a5)
  {
    v10 = objc_retainAutorelease(v10);
    v20 = 0;
    v11 = 0;
    v18 = 0;
    *a5 = v10;
    if (!a4)
      goto LABEL_27;
  }
  else
  {
    v20 = 0;
    v11 = 0;
    v18 = 0;
    if (!a4)
      goto LABEL_27;
  }
LABEL_26:
  *a4 = v18;
LABEL_27:

  return v20;
}

+ (BOOL)purgeANEBinaryForModelAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(a1, "isANESupported") & 1) == 0)
  {
    v8 = 0;
    v9 = 0;
LABEL_13:
    v15 = 1;
    goto LABEL_21;
  }
  v24 = 0;
  objc_msgSend(a1, "fetchNetworkURLFromCompiledModelAtURL:error:", v6, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i));
          objc_msgSend(v13, "fileSystemRepresentation");
          v14 = espresso_ane_cache_purge_network();
          if ((_DWORD)v14)
          {
            +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to purge cached ANE binary because espresso_ane_cache_purge_network returned status=%d for network at %@"), v14, v13, (_QWORD)v20);
            v16 = objc_claimAutoreleasedReturnValue();

            v8 = (id)v16;
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        if (v10)
          continue;
        break;
      }
    }

    goto LABEL_13;
  }
LABEL_15:
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "localizedDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = v19;
    _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "Failed to purge cached ANE binary for compiled models at %@ with error: %@", buf, 0x16u);

  }
  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v15 = 0;
    *a4 = v8;
  }
  else
  {
    v15 = 0;
  }
  v9 = v7;
LABEL_21:

  return v15;
}

+ (id)_modelAssetWithSpecificationData:(id)a3 blobMapping:(id)a4 error:(id *)a5
{
  NSData *v7;
  id v8;
  CoreML::Specification::Model *v9;
  void *v10;
  double v11;
  std::string::size_type p_size;
  void *v13;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  MLModelAsset *v24;
  id v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  int v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  NSObject *v37;
  std::string::size_type v38;
  uint64_t v39;
  id v40;
  void *v41;
  std::string::size_type size;
  std::string *p_buf;
  std::string *v44;
  const std::string::value_type *v45;
  std::string::size_type v46;
  std::string *v47;
  void *v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  std::string::size_type v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  std::__shared_weak_count *v66;
  char *v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  unsigned __int8 v71;
  std::string v72;
  std::string buf;
  char **v74;
  char *v75[6];

  v75[3] = *(char **)MEMORY[0x1E0C80C00];
  v7 = (NSData *)a3;
  v8 = a4;
  v9 = _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((CoreML::Specification::Model **)&v69);
  v10 = (void *)MEMORY[0x1A1AD6ED8](v9);
  CoreML::Model::Model((CoreML::Model *)&v72);
  Archiver::_MemoryIStream::_MemoryIStream((Archiver::_MemoryIStream *)&v64, v7);
  v11 = CoreML::Model::load((uint64_t)&buf, &v64, (uint64_t)&v72);
  if (((uint64_t)buf.__r_.__value_.__l.__data_ & 0xFFFFFFEF) != 0)
  {
    p_size = (std::string::size_type)&buf.__r_.__value_.__l.__size_;
    if (SHIBYTE(v74) < 0)
      p_size = buf.__r_.__value_.__l.__size_;
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Error reading protobuf spec. %s"), v11, p_size);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _MLModelSpecification::_MLModelSpecification((_MLModelSpecification *)&v70, (const CoreML::Specification::Model **)&v72);
    v14 = v70;
    v70 = 0uLL;
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
    v69 = v14;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v70 + 1);
    if (*((_QWORD *)&v70 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v70 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v13 = 0;
  }
  if (SHIBYTE(v74) < 0)
    operator delete((void *)buf.__r_.__value_.__l.__size_);
  Archiver::_MemoryIStream::~_MemoryIStream(&v64);
  MEMORY[0x1A1AD61C4](&v68);
  v72.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E3D597D0;
  v21 = (std::__shared_weak_count *)v72.__r_.__value_.__r.__words[2];
  if (v72.__r_.__value_.__r.__words[2])
  {
    v22 = (unint64_t *)(v72.__r_.__value_.__r.__words[2] + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  objc_autoreleasePoolPop(v10);
  if (v13)
  {
    v24 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    goto LABEL_92;
  }
  v62 = (void *)objc_opt_new();
  v60 = (void *)objc_opt_new();
  std::string::basic_string[abi:ne180100]<0>(&v70, ".");
  v25 = v60;
  v26 = (std::__shared_weak_count *)operator new(0x108uLL);
  v26->__shared_owners_ = 0;
  v27 = (unint64_t *)&v26->__shared_owners_;
  v26->__shared_weak_owners_ = 0;
  v26->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5BF78;
  std::string::basic_string[abi:ne180100]<0>(&v72, ".");
  Archiver::_OArchiveMemoryImpl::_OArchiveMemoryImpl((uint64_t)&v26[1], (__int128 *)&v72, (uint64_t)&v70, v25);
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v72.__r_.__value_.__l.__data_);
  buf.__r_.__value_.__s.__data_[0] = 0;
  buf.__r_.__value_.__l.__size_ = (std::string::size_type)&v26[1];
  buf.__r_.__value_.__r.__words[2] = (std::string::size_type)v26;
  do
    v28 = __ldxr(v27);
  while (__stxr(v28 + 1, v27));
  v75[0] = 0;
  v75[1] = 0;
  v74 = v75;
  do
    v29 = __ldaxr(v27);
  while (__stlxr(v29 - 1, v27));
  if (!v29)
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }

  _MLModelOutputArchiver::_MLModelOutputArchiver((uint64_t)&v64, (uint64_t)&buf);
  std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v75[0]);
  v30 = (std::__shared_weak_count *)buf.__r_.__value_.__r.__words[2];
  if (buf.__r_.__value_.__r.__words[2])
  {
    v31 = (unint64_t *)(buf.__r_.__value_.__r.__words[2] + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if ((char)v71 < 0)
    operator delete((void *)v70);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unnamed_Model");
  v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v33 = MLLoggingAllowsInstrumentation(1, (const char *)objc_msgSend(v63, "UTF8String"));
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = os_signpost_id_generate(v34);

  if (v33)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      v38 = objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
      LODWORD(buf.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v38;
      _os_signpost_emit_with_name_impl(&dword_19C486000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "MLModel_Compile", "Model-name:%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  if (v8)
  {
    +[MLCompiler compileSpecification:blobMapping:toArchive:options:error:](MLCompiler, "compileSpecification:blobMapping:toArchive:options:error:", &v69, v8, &v64, v62, a5);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v8;
    v61 = (void *)v39;
    std::string::basic_string[abi:ne180100]<0>(&buf, "BlobMapping");
    (*(void (**)(uint64_t, std::string *, id))(*(_QWORD *)v65 + 32))(v65, &buf, v40);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (*(char *)(v65 + 55) < 0)
      std::string::__init_copy_ctor_external(&v72, *(const std::string::value_type **)(v65 + 32), *(_QWORD *)(v65 + 40));
    else
      v72 = *(std::string *)(v65 + 32);
    std::string::basic_string[abi:ne180100]<0>(&v70, "BlobMapping");
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v72.__r_.__value_.__r.__words[2]);
    else
      size = v72.__r_.__value_.__l.__size_;
    p_buf = &buf;
    std::string::basic_string[abi:ne180100]((uint64_t)&buf, size + 1);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    if (size)
    {
      if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v44 = &v72;
      else
        v44 = (std::string *)v72.__r_.__value_.__r.__words[0];
      memmove(p_buf, v44, size);
    }
    *(_WORD *)((char *)&p_buf->__r_.__value_.__l.__data_ + size) = 47;
    if ((v71 & 0x80u) == 0)
      v45 = (const std::string::value_type *)&v70;
    else
      v45 = (const std::string::value_type *)v70;
    if ((v71 & 0x80u) == 0)
      v46 = v71;
    else
      v46 = *((_QWORD *)&v70 + 1);
    v47 = std::string::append(&buf, v45, v46);
    v48 = (void *)v47->__r_.__value_.__r.__words[0];
    v49 = SHIBYTE(v47->__r_.__value_.__r.__words[2]);
    v47->__r_.__value_.__r.__words[0] = 0;
    v47->__r_.__value_.__l.__size_ = 0;
    v47->__r_.__value_.__r.__words[2] = 0;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if ((char)v71 < 0)
      operator delete((void *)v70);
    if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v72.__r_.__value_.__l.__data_);

    if (v49 < 0)
      operator delete(v48);
    v41 = v61;
    if (!v33)
      goto LABEL_83;
    goto LABEL_79;
  }
  +[MLCompiler compileSpecification:toArchive:options:error:](MLCompiler, "compileSpecification:toArchive:options:error:", &v69, &v64, v62, a5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
LABEL_79:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      v52 = objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
      LODWORD(buf.__r_.__value_.__l.__data_) = 136446210;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v52;
      _os_signpost_emit_with_name_impl(&dword_19C486000, v51, OS_SIGNPOST_INTERVAL_END, v35, "MLModel_Compile", "Model-name:%{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
LABEL_83:
  if (v41)
    v24 = -[MLModelAsset initWithArchiveData:]([MLModelAsset alloc], "initWithArchiveData:", v25);
  else
    v24 = 0;

  std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v67);
  v53 = v66;
  if (v66)
  {
    v54 = (unint64_t *)&v66->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }

LABEL_92:
  v56 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
  if (*((_QWORD *)&v69 + 1))
  {
    v57 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
  }

  return v24;
}

+ (MLModelAsset)modelAssetWithSpecificationData:(id)a3 blobMapping:(id)a4 error:(id *)a5
{
  objc_msgSend(a1, "_modelAssetWithSpecificationData:blobMapping:error:", a3, a4, a5);
  return (MLModelAsset *)(id)objc_claimAutoreleasedReturnValue();
}

+ (MLModelAsset)modelAssetWithSpecificationData:(NSData *)specificationData error:(NSError *)error
{
  objc_msgSend(a1, "_modelAssetWithSpecificationData:blobMapping:error:", specificationData, 0, error);
  return (MLModelAsset *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL __60__MLModelAsset_fetchNetworkURLFromCompiledModelAtURL_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);

  return v5 == 0;
}

+ (id)modelAssetDataByResolvingBlobFileReferencesIntoInMemoryValuesInModelSpecificationAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __n128 (*v23)(__n128 *, __n128 *);
  uint64_t v24;
  size_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  int v28;
  google::protobuf::_anonymous_namespace_ *v29;
  google::protobuf::_anonymous_namespace_ *v30;
  const google::protobuf::MessageLite *v31;
  uint64_t v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v44;
  void *v45;
  void **v46;
  id v47;
  int v48;
  void *__p[2];
  char v50;
  _QWORD v51[10];
  uint64_t v52;
  _QWORD v53[2];
  std::__shared_weak_count *v54;
  _QWORD v55[5];
  uint64_t v56;
  void *v57;
  void *v58[2];
  char v59;
  uint64_t v60;
  _BYTE buf[24];
  __n128 (*v62)(__n128 *, __n128 *);
  uint64_t (*v63)(uint64_t);
  const char *v64;
  _QWORD *v65;
  std::__shared_weak_count *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "URLByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v18 = 0;
    goto LABEL_36;
  }
  CoreML::Model::Model((CoreML::Model *)v53);
  v8 = objc_retainAutorelease(v7);
  v9 = CoreML::Model::load((uint64_t)&v48, v51, (uint64_t)v53);
  if ((v48 & 0xFFFFFFEF) == 0)
  {
    objc_msgSend(v6, "URLByDeletingLastPathComponent", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v53[1];
    v14 = v19;
    v47 = v5;
    v21 = operator new();
    *(_QWORD *)(v21 + 32) = 0;
    *(_OWORD *)v21 = 0u;
    *(_OWORD *)(v21 + 16) = 0u;
    *(_DWORD *)(v21 + 32) = 1065353216;
    v60 = v21;
    objc_msgSend(v14, "path");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v58, (char *)objc_msgSend(v22, "UTF8String"));

    *(_QWORD *)buf = &off_1E3D5B888;
    *(_QWORD *)&buf[8] = v60;
    *(_QWORD *)&buf[16] = v58;
    v62 = (__n128 (*)(__n128 *, __n128 *))buf;
    v23 = v62;
    if ((char *)v62 == buf)
    {
      v24 = 4;
      v23 = (__n128 (*)(__n128 *, __n128 *))buf;
    }
    else
    {
      if (!v62)
        goto LABEL_15;
      v24 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v23 + 8 * v24))();
LABEL_15:
    v25 = CoreML::Specification::Model::ByteSizeLong((CoreML::Specification::Model *)v20);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x4012000000;
    v62 = __Block_byref_object_copy__16394;
    v63 = __Block_byref_object_dispose__16395;
    v64 = "";
    v26 = (std::__shared_weak_count *)operator new(0x30uLL);
    v26->__shared_owners_ = 0;
    v26->__shared_weak_owners_ = 0;
    v26->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5C1E0;
    v65 = std::vector<unsigned char>::vector(&v26[1].__vftable, v25);
    v66 = v26;
    v27 = **(_QWORD **)(*(_QWORD *)&buf[8] + 48);
    v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 96))(v20);
    if (v28 <= (int)v25)
    {
      v29 = (google::protobuf::_anonymous_namespace_ *)((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v20 + 112))(v20, v27)- v27);
      if (v29 != (google::protobuf::_anonymous_namespace_ *)v28)
      {
        v30 = (google::protobuf::_anonymous_namespace_ *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 96))(v20);
      }
    }
    v32 = *(_QWORD *)(v20 + 16);
    if (v32)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
    *(_QWORD *)(v20 + 21) = 0;
    *(_QWORD *)(v20 + 16) = 0;
    CoreML::Specification::Model::clear_Type(v20);
    v33 = objc_alloc(MEMORY[0x1E0C99D50]);
    v34 = *(uint64_t **)(*(_QWORD *)&buf[8] + 48);
    v35 = *v34;
    v36 = v34[1] - *v34;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = ___ZN12_GLOBAL__N_118SerializeModelSpecERN6CoreML13Specification5ModelE_block_invoke;
    v55[3] = &unk_1E3D664E8;
    v55[4] = buf;
    v18 = (void *)objc_msgSend(v33, "initWithBytesNoCopy:length:deallocator:", v35, v36, v55);
    _Block_object_dispose(buf, 8);
    v37 = v66;
    v5 = v47;
    if (v66)
    {
      p_shared_owners = (unint64_t *)&v66->__shared_owners_;
      do
        v39 = __ldaxr(p_shared_owners);
      while (__stlxr(v39 - 1, p_shared_owners));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    if (v59 < 0)
      operator delete(v58[0]);

    goto LABEL_28;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "path");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    v46 = __p;
    if (v50 < 0)
      v46 = (void **)__p[0];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v44;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v46;
    _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Failed to read model specification: path=%@, error=%s", buf, 0x16u);

  }
  if (a4)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v56 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (id)v13;
    v15 = __p;
    if (v50 < 0)
      v15 = (void **)__p[0];
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed to read model specification: path=%@, error=%s"), v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v18 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v18 = 0;
LABEL_29:
  if (v50 < 0)
    operator delete(__p[0]);
  std::istream::~istream();
  MEMORY[0x1A1AD61C4](&v52);
  std::streambuf::~streambuf();
  v53[0] = &off_1E3D597D0;
  v40 = v54;
  if (v54)
  {
    v41 = (unint64_t *)&v54->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
LABEL_36:

  return v18;
}

+ (id)modelAssetDataByLoadingBlobFileReferencesInModelSpecificationAtURL:(id)a3 blobMapping:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void **v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _DWORD *v22;
  id v23;
  uint8_t *v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void **v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  int v37;
  void *__p[2];
  char v39;
  _QWORD v40[10];
  uint64_t v41;
  _QWORD v42[2];
  std::__shared_weak_count *v43;
  void *v44;
  char v45;
  id v46;
  id v47;
  id *v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void **v55;
  uint8_t *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "URLByStandardizingPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 1, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v20 = 0;
    goto LABEL_36;
  }
  CoreML::Model::Model((CoreML::Model *)v42);
  v10 = objc_retainAutorelease(v9);
  v11 = CoreML::Model::load((uint64_t)&v37, v40, (uint64_t)v42);
  if ((v37 & 0xFFFFFFEF) == 0)
  {
    objc_msgSend(v8, "URLByDeletingLastPathComponent", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (_DWORD *)v42[1];
    v16 = v21;
    v48 = a5;
    v49 = v16;
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v44, (char *)objc_msgSend(v23, "UTF8String"));

    v24 = (uint8_t *)operator new(0x28uLL);
    *(_QWORD *)v24 = &off_1E3D5B830;
    *((_QWORD *)v24 + 1) = &v47;
    *((_QWORD *)v24 + 2) = &v49;
    *((_QWORD *)v24 + 3) = &v48;
    *((_QWORD *)v24 + 4) = &v46;
    v56 = v24;
    v25 = v56;
    if (v56 == buf)
    {
      v26 = 4;
      v25 = buf;
    }
    else
    {
      if (!v56)
      {
LABEL_15:
        if (v47 && v48)
        {
          v27 = objc_retainAutorelease(v47);
          *v48 = v27;
        }
        v28 = v46;
        v29 = v28;
        if (v45 < 0)
        {
          operator delete(v44);
          v29 = v46;
        }

        if (v28)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v28);
          v20 = v10;

          goto LABEL_28;
        }
LABEL_27:
        v20 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v26 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v25 + 8 * v26))();
    goto LABEL_15;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "path");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = __p;
    if (v39 < 0)
      v32 = (void **)__p[0];
    *(_DWORD *)buf = 138412546;
    v53 = v30;
    v54 = 2080;
    v55 = v32;
    _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Failed to read model specification: path=%@, error=%s.", buf, 0x16u);

  }
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "path");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (id)v15;
    v17 = __p;
    if (v39 < 0)
      v17 = (void **)__p[0];
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Failed to read model specification: path=%@, error=%s."), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  v20 = 0;
LABEL_29:
  if (v39 < 0)
    operator delete(__p[0]);
  std::istream::~istream();
  MEMORY[0x1A1AD61C4](&v41);
  std::streambuf::~streambuf();
  v42[0] = &off_1E3D597D0;
  v33 = v43;
  if (v43)
  {
    p_shared_owners = (unint64_t *)&v43->__shared_owners_;
    do
      v35 = __ldaxr(p_shared_owners);
    while (__stlxr(v35 - 1, p_shared_owners));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
LABEL_36:

  return v20;
}

@end
