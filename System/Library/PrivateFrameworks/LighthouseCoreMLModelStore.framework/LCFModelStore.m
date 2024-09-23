@implementation LCFModelStore

- (id)init:(id)a3 modelStoreRootURL:(id)a4 originalEmptyModelURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  LCFModelStore *v12;
  uint64_t v13;
  NSURL *modelStoreRootWithKeyURL;
  void *v15;
  NSURL *v16;
  char v17;
  id v18;
  NSObject *v19;
  NSURL *v20;
  LCFModelStoreModelMetadataProvider *v21;
  LCFModelStoreModelMetadataProvider *modelMetadataProvider;
  NSURL **p_originalEmptyModelURL;
  NSURL *v24;
  void *v25;
  uint64_t v26;
  NSURL *emptyModelURL;
  NSURL **p_emptyModelURL;
  NSURL *v29;
  BOOL v30;
  id v31;
  NSObject *v32;
  NSURL *v33;
  void *v34;
  NSURL *v35;
  NSURL *v36;
  char v37;
  NSObject *v38;
  NSURL *v39;
  NSURL *v40;
  LCFModelStoreModelMetadataProvider *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  LCFModelStoreModelMetadataProvider *v46;
  void *v47;
  id v49;
  id v50;
  id v51;
  objc_super v52;
  uint8_t buf[4];
  NSURL *v54;
  __int16 v55;
  NSURL *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v52.receiver = self;
  v52.super_class = (Class)LCFModelStore;
  v12 = -[LCFModelStore init](&v52, sel_init);
  if (v12)
  {
    LCFModelStoreLoggingUtilsInit();
    objc_storeStrong((id *)&v12->_key, a3);
    objc_storeStrong((id *)&v12->_modelStoreRootURL, a4);
    -[NSURL URLByAppendingPathComponent:](v12->_modelStoreRootURL, "URLByAppendingPathComponent:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    modelStoreRootWithKeyURL = v12->_modelStoreRootWithKeyURL;
    v12->_modelStoreRootWithKeyURL = (NSURL *)v13;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12->_modelStoreRootWithKeyURL;
    v51 = 0;
    v17 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v51);
    v18 = v51;

    v19 = LCFLogModelStore;
    if ((v17 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
      {
        v20 = v12->_modelStoreRootWithKeyURL;
        *(_DWORD *)buf = 138412290;
        v54 = v20;
        _os_log_impl(&dword_240341000, v19, OS_LOG_TYPE_INFO, "created store directory %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
    {
      -[LCFModelStore init:modelStoreRootURL:originalEmptyModelURL:].cold.2();
    }
    v21 = -[LCFModelStoreModelMetadataProvider init:]([LCFModelStoreModelMetadataProvider alloc], "init:", v12->_modelStoreRootWithKeyURL);
    modelMetadataProvider = v12->_modelMetadataProvider;
    v12->_modelMetadataProvider = v21;

    if (v11)
    {
      p_originalEmptyModelURL = &v12->_originalEmptyModelURL;
      objc_storeStrong((id *)&v12->_originalEmptyModelURL, a5);
      v24 = v12->_modelStoreRootWithKeyURL;
      -[NSURL lastPathComponent](v12->_originalEmptyModelURL, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByAppendingPathComponent:](v24, "URLByAppendingPathComponent:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      p_emptyModelURL = &v12->_emptyModelURL;
      emptyModelURL = v12->_emptyModelURL;
      v12->_emptyModelURL = (NSURL *)v26;

      v29 = v12->_emptyModelURL;
      v50 = v18;
      v30 = -[NSURL checkResourceIsReachableAndReturnError:](v29, "checkResourceIsReachableAndReturnError:", &v50);
      v31 = v50;

      if (v30)
      {
        v32 = LCFLogModelStore;
        if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
        {
          v33 = *p_emptyModelURL;
          *(_DWORD *)buf = 138412290;
          v54 = v33;
          _os_log_impl(&dword_240341000, v32, OS_LOG_TYPE_INFO, "emptyModel exists in %@", buf, 0xCu);
        }
        v18 = v31;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *p_originalEmptyModelURL;
        v36 = *p_emptyModelURL;
        v49 = v31;
        v37 = objc_msgSend(v34, "copyItemAtURL:toURL:error:", v35, v36, &v49);
        v18 = v49;

        v38 = LCFLogModelStore;
        if ((v37 & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
          {
            v39 = *p_originalEmptyModelURL;
            v40 = *p_emptyModelURL;
            *(_DWORD *)buf = 138412546;
            v54 = v39;
            v55 = 2112;
            v56 = v40;
            _os_log_impl(&dword_240341000, v38, OS_LOG_TYPE_INFO, "copied emptyModel from %@ to %@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
        {
          -[LCFModelStore init:modelStoreRootURL:originalEmptyModelURL:].cold.1();
        }
      }
      v41 = v12->_modelMetadataProvider;
      -[NSURL lastPathComponent](v12->_emptyModelURL, "lastPathComponent", v10);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[LCFModelStoreModelMetadataProvider getModelMetadata:](v41, "getModelMetadata:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "setIsOriginalEmptyModel:", 1);
      objc_msgSend(v43, "setIsAvailable:", 1);
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setDateCreated:", v44);

      +[LCFModelStoreUtils sha256ForURL:](LCFModelStoreUtils, "sha256ForURL:", v12->_emptyModelURL);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setSha256:", v45);

      v46 = v12->_modelMetadataProvider;
      -[NSURL lastPathComponent](v12->_emptyModelURL, "lastPathComponent");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:](v46, "setModelMetadata:metadata:", v47, v43);

    }
  }

  return v12;
}

- (id)init:(id)a3 modelStoreRootURL:(id)a4
{
  id v7;
  id v8;
  LCFModelStore *v9;
  uint64_t v10;
  NSURL *modelStoreRootWithKeyURL;
  void *v12;
  NSURL *v13;
  char v14;
  id v15;
  NSObject *v16;
  NSURL *v17;
  LCFModelStoreModelMetadataProvider *v18;
  LCFModelStoreModelMetadataProvider *modelMetadataProvider;
  NSURL *originalEmptyModelURL;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  NSURL *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)LCFModelStore;
  v9 = -[LCFModelStore init](&v23, sel_init);
  if (v9)
  {
    LCFModelStoreLoggingUtilsInit();
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v9->_modelStoreRootURL, a4);
    -[NSURL URLByAppendingPathComponent:](v9->_modelStoreRootURL, "URLByAppendingPathComponent:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    modelStoreRootWithKeyURL = v9->_modelStoreRootWithKeyURL;
    v9->_modelStoreRootWithKeyURL = (NSURL *)v10;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9->_modelStoreRootWithKeyURL;
    v22 = 0;
    v14 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v22);
    v15 = v22;

    v16 = LCFLogModelStore;
    if ((v14 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
      {
        v17 = v9->_modelStoreRootWithKeyURL;
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl(&dword_240341000, v16, OS_LOG_TYPE_INFO, "created store directory %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
    {
      -[LCFModelStore init:modelStoreRootURL:originalEmptyModelURL:].cold.2();
    }
    v18 = -[LCFModelStoreModelMetadataProvider init:]([LCFModelStoreModelMetadataProvider alloc], "init:", v9->_modelStoreRootWithKeyURL);
    modelMetadataProvider = v9->_modelMetadataProvider;
    v9->_modelMetadataProvider = v18;

    originalEmptyModelURL = v9->_originalEmptyModelURL;
    v9->_originalEmptyModelURL = 0;

  }
  return v9;
}

- (id)storeModel:(id)a3
{
  return -[LCFModelStore storeModel:modelConfig:](self, "storeModel:modelConfig:", a3, 0);
}

- (id)storeModel:(id)a3 modelConfig:(id)a4
{
  id v6;
  id v7;
  NSURL *modelStoreRootWithKeyURL;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  LCFModelStoreModelMetadataProvider *modelMetadataProvider;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  LCFModelStoreModelMetadataProvider *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  modelStoreRootWithKeyURL = self->_modelStoreRootWithKeyURL;
  objc_msgSend(v6, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](modelStoreRootWithKeyURL, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

    if (v17)
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
        -[LCFModelStore storeModel:modelConfig:].cold.1();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v19 = objc_msgSend(v18, "copyItemAtURL:toURL:error:", v6, v10, &v37);
      v20 = v37;

      v21 = LCFLogModelStore;
      if ((v19 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v39 = v6;
          v40 = 2112;
          v41 = v10;
          _os_log_impl(&dword_240341000, v21, OS_LOG_TYPE_INFO, "copied model from %@ to %@", buf, 0x16u);
        }

        goto LABEL_11;
      }
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
        -[LCFModelStore storeModel:modelConfig:].cold.2();

    }
    v35 = 0;
    goto LABEL_20;
  }
  v14 = LCFLogModelStore;
  if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl(&dword_240341000, v14, OS_LOG_TYPE_INFO, "sourceModelURL %@ already exists.", buf, 0xCu);
  }
LABEL_11:
  v22 = v13 ^ 1u;
  modelMetadataProvider = self->_modelMetadataProvider;
  objc_msgSend(v10, "lastPathComponent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCFModelStoreModelMetadataProvider getModelMetadata:](modelMetadataProvider, "getModelMetadata:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setIsImported:", v22);
  objc_msgSend(v25, "setIsAvailable:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDateCreated:", v26);

  +[LCFModelStoreUtils sha256ForURL:](LCFModelStoreUtils, "sha256ForURL:", v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSha256:", v27);

  v28 = self->_modelMetadataProvider;
  objc_msgSend(v10, "lastPathComponent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:](v28, "setModelMetadata:metadata:", v29, v25);

  if (v7)
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v7, "encodeWithCoder:", v30);
    objc_msgSend(v30, "finishEncoding");
    objc_msgSend(v30, "encodedData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByDeletingPathExtension");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "URLByAppendingPathExtension:", CFSTR("modelconfig"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = LCFLogModelStore;
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v33;
      _os_log_impl(&dword_240341000, v34, OS_LOG_TYPE_INFO, "save model config to %@", buf, 0xCu);
    }
    objc_msgSend(v31, "writeToURL:atomically:", v33, 1);

  }
  objc_msgSend(v10, "lastPathComponent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v35;
}

- (id)getBaseModelURL:(id)a3 modelConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  NSURL *emptyModelURL;
  char v15;
  id v16;
  NSObject *v17;
  NSURL *v18;
  LCFModelStoreModelMetadataProvider *modelMetadataProvider;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  LCFModelStoreModelMetadataProvider *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSURL *v29;
  NSObject *v30;
  id v32;
  uint8_t buf[4];
  NSURL *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSURL URLByAppendingPathComponent:](self->_modelStoreRootWithKeyURL, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
      -[LCFModelStore getBaseModelURL:modelConfig:].cold.1();
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    emptyModelURL = self->_emptyModelURL;
    v32 = 0;
    v15 = objc_msgSend(v13, "copyItemAtURL:toURL:error:", emptyModelURL, v8, &v32);
    v16 = v32;

    v17 = LCFLogModelStore;
    if ((v15 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
      {
        v18 = self->_emptyModelURL;
        *(_DWORD *)buf = 138412546;
        v34 = v18;
        v35 = 2112;
        v36 = v8;
        _os_log_impl(&dword_240341000, v17, OS_LOG_TYPE_INFO, "copied model from %@ to %@", buf, 0x16u);
      }
      modelMetadataProvider = self->_modelMetadataProvider;
      objc_msgSend(v8, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LCFModelStoreModelMetadataProvider getModelMetadata:](modelMetadataProvider, "getModelMetadata:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setIsLocal:", 1);
      objc_msgSend(v21, "setIsAvailable:", 1);
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDateCreated:", v22);

      +[LCFModelStoreUtils sha256ForURL:](LCFModelStoreUtils, "sha256ForURL:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSha256:", v23);

      v24 = self->_modelMetadataProvider;
      objc_msgSend(v8, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:](v24, "setModelMetadata:metadata:", v25, v21);

      if (v7)
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
        objc_msgSend(v7, "encodeWithCoder:", v26);
        objc_msgSend(v26, "finishEncoding");
        objc_msgSend(v26, "encodedData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLByDeletingPathExtension");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "URLByAppendingPathExtension:", CFSTR("modelconfig"));
        v29 = (NSURL *)objc_claimAutoreleasedReturnValue();

        v30 = LCFLogModelStore;
        if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v29;
          _os_log_impl(&dword_240341000, v30, OS_LOG_TYPE_INFO, "save model config to %@", buf, 0xCu);
        }
        objc_msgSend(v27, "writeToURL:atomically:", v29, 1);

      }
      v12 = v8;

    }
    else
    {
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
        -[LCFModelStore getBaseModelURL:modelConfig:].cold.2();
      v12 = 0;
    }

  }
  return v12;
}

- (id)getModelURL:(id)a3
{
  return -[NSURL URLByAppendingPathComponent:](self->_modelStoreRootWithKeyURL, "URLByAppendingPathComponent:", a3);
}

- (id)getModelConfig:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[NSURL URLByAppendingPathComponent:](self->_modelStoreRootWithKeyURL, "URLByAppendingPathComponent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("modelconfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = LCFLogModelStore;
  if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_240341000, v6, OS_LOG_TYPE_INFO, "get model config to %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v23 = 0;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v10, &v23);
      v12 = v23;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFD8]), "initWithCoder:", v11);
      if ((!v13 || v12) && os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
        -[LCFModelStore getModelConfig:].cold.1();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v14 = LCFLogModelStore;
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
      -[LCFModelStore getModelConfig:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
    v13 = 0;
  }

  return v13;
}

- (BOOL)markModelTrained:(id)a3
{
  NSURL *modelStoreRootWithKeyURL;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  modelStoreRootWithKeyURL = self->_modelStoreRootWithKeyURL;
  v5 = a3;
  -[NSURL URLByAppendingPathComponent:](modelStoreRootWithKeyURL, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCFModelStoreModelMetadataProvider getModelMetadata:](self->_modelMetadataProvider, "getModelMetadata:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsLocal:", 1);
  objc_msgSend(v7, "setIsAvailable:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateTrained:", v8);

  +[LCFModelStoreUtils sha256ForURL:](LCFModelStoreUtils, "sha256ForURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSha256:", v9);

  -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:](self->_modelMetadataProvider, "setModelMetadata:metadata:", v5, v7);
  return 1;
}

- (BOOL)deleteModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v4 = a3;
  -[NSURL URLByAppendingPathComponent:](self->_modelStoreRootWithKeyURL, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v5, &v20);
    v11 = v20;

    if ((v10 & 1) != 0)
    {
      -[LCFModelStoreModelMetadataProvider removeModelMetadata:](self->_modelMetadataProvider, "removeModelMetadata:", v4);
    }
    else
    {
      v12 = LCFLogModelStore;
      if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
        -[LCFModelStore deleteModel:].cold.1((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
      -[LCFModelStore deleteModel:].cold.2();
    v10 = 0;
  }

  return v10;
}

- (BOOL)clear
{
  void *v3;
  NSURL *modelStoreRootWithKeyURL;
  char v5;
  id v6;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  modelStoreRootWithKeyURL = self->_modelStoreRootWithKeyURL;
  v8 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", modelStoreRootWithKeyURL, &v8);
  v6 = v8;

  if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
    -[LCFModelStore clear].cold.1();

  return v5;
}

- (id)listModelNames
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[LCFModelStoreModelMetadataProvider getMetadata](self->_modelMetadataProvider, "getMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v2, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v23 != v5)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v2, "objectForKeyedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isAvailable"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqual:", &unk_2510A3838);

          if (v10)
            objc_msgSend(v20, "addObject:", v7);
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v4);
    }

  }
  else
  {
    v11 = LCFLogModelStore;
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
      -[LCFModelStore listModelNames].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    v20 = 0;
  }

  return v20;
}

- (id)getModelMetadata:(id)a3
{
  return -[LCFModelStoreModelMetadataProvider getModelMetadata:](self->_modelMetadataProvider, "getModelMetadata:", a3);
}

- (BOOL)setModelMetadata:(id)a3 key:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[LCFModelStoreModelMetadataProvider getModelMetadata:](self->_modelMetadataProvider, "getModelMetadata:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "custom");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithDictionary:", v13);

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v9);
    objc_msgSend(v11, "setCustom:", v14);
    v15 = -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:](self->_modelMetadataProvider, "setModelMetadata:metadata:", v8, v11);

  }
  else
  {
    v16 = LCFLogModelStore;
    if (os_log_type_enabled((os_log_t)LCFLogModelStore, OS_LOG_TYPE_ERROR))
      -[LCFModelStore listModelNames].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    v15 = 0;
  }

  return v15;
}

- (NSString)key
{
  return self->_key;
}

- (NSURL)modelStoreRootURL
{
  return self->_modelStoreRootURL;
}

- (NSURL)emptyModelURL
{
  return self->_emptyModelURL;
}

- (LCFModelStoreModelMetadataProvider)modelMetadataProvider
{
  return self->_modelMetadataProvider;
}

- (NSURL)originalEmptyModelURL
{
  return self->_originalEmptyModelURL;
}

- (NSURL)modelStoreRootWithKeyURL
{
  return self->_modelStoreRootWithKeyURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStoreRootWithKeyURL, 0);
  objc_storeStrong((id *)&self->_originalEmptyModelURL, 0);
  objc_storeStrong((id *)&self->_modelMetadataProvider, 0);
  objc_storeStrong((id *)&self->_emptyModelURL, 0);
  objc_storeStrong((id *)&self->_modelStoreRootURL, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)init:modelStoreRootURL:originalEmptyModelURL:.cold.1()
{
  uint64_t v0;
  _QWORD *v1;
  os_log_t v2;
  _BYTE v3[24];

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = v0;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *v1;
  OUTLINED_FUNCTION_0(&dword_240341000, (uint64_t)v1, v2, "failed to copy emptyModel from %@ to %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)init:modelStoreRootURL:originalEmptyModelURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3(&dword_240341000, v0, v1, "failed to create store directory %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)storeModel:modelConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_240341000, v0, v1, "the model name already exists %@ %@");
  OUTLINED_FUNCTION_2();
}

- (void)storeModel:modelConfig:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_240341000, v0, v1, "failed to copy model from %@ to %@");
  OUTLINED_FUNCTION_2();
}

- (void)getBaseModelURL:modelConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_240341000, v0, v1, "a model already exist %@ %@");
  OUTLINED_FUNCTION_2();
}

- (void)getBaseModelURL:modelConfig:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_240341000, v0, v1, "failed to copy model from %@ to %@");
  OUTLINED_FUNCTION_2();
}

- (void)getModelConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_240341000, v0, v1, "failed to copy model from %@ to %@");
  OUTLINED_FUNCTION_2();
}

- (void)getModelConfig:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_240341000, a1, a3, "model config file doesn't exist", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)deleteModel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_240341000, a2, a3, "failed to delete model url directory %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)deleteModel:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_240341000, v0, v1, "a model does not exist %@ %@");
  OUTLINED_FUNCTION_2();
}

- (void)clear
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3(&dword_240341000, v0, v1, "failed to delete store directory %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)listModelNames
{
  OUTLINED_FUNCTION_4(&dword_240341000, a1, a3, "failed to get metadata.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

@end
