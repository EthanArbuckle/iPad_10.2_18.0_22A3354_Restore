@implementation FHModel

- (FHModel)initWithModelURL:(id)a3
{
  id v4;
  FHModel *v5;
  FHModel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FHModel;
  v5 = -[FHModel init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_modelVersion, CFSTR("0"));
    -[FHModel _loadModel:](v6, "_loadModel:", v4);
  }

  return v6;
}

- (FHModel)initWithModelURL:(id)a3 modelName:(id)a4
{
  id v6;
  id v7;
  FHModel *v8;
  FHModel *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FHModel;
  v8 = -[FHModel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelVersion, CFSTR("0"));
    objc_storeStrong((id *)&v9->_modelName, a4);
    -[FHModel _loadModel:](v9, "_loadModel:", v6);
  }

  return v9;
}

- (BOOL)_loadModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSURL *v13;
  NSURL *compiledModelURL;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSURL *v21;
  MLModel *v22;
  MLModel *mlModel;
  BOOL v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id *p_modelVersion;
  NSString *modelVersion;
  int v37;
  id *v38;
  id v39;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDBCF48];
    FHModelDirectory();
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0;
    LOBYTE(v9) = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v45);
    v11 = v45;
    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.mlmodelc"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLByAppendingPathComponent:", v12);
      v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
      compiledModelURL = self->_compiledModelURL;
      self->_compiledModelURL = v13;

      v15 = (void *)MEMORY[0x24BDBFF70];
      objc_msgSend(MEMORY[0x24BDBFF78], "defaultOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v11;
      objc_msgSend(v15, "compileSpecificationAtURL:toURL:options:error:", v4, v10, v16, &v44);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v44;

      if (v17)
      {
        v19 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
        -[FHModel modelName](self, "modelName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setModelDisplayName:](v19, "setModelDisplayName:", v20);

        v21 = self->_compiledModelURL;
        v43 = v18;
        objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v21, v19, &v43);
        v22 = (MLModel *)objc_claimAutoreleasedReturnValue();
        v11 = v43;

        mlModel = self->_mlModel;
        self->_mlModel = v22;

        v24 = v11 == 0;
        if (v11)
        {
          FinHealthLogObject(CFSTR("FinHealthCore"));
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "path");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "localizedDescription");
            v26 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v47 = "-[FHModel _loadModel:]";
            v48 = 2112;
            v49 = v41;
            v50 = 2112;
            v51 = v26;
            v27 = (void *)v26;
            _os_log_impl(&dword_23B4A2000, v25, OS_LOG_TYPE_ERROR, "%s failed to load model %@ with error: %@", buf, 0x20u);

          }
        }
        else
        {
          v42 = v7;
          -[MLModel modelDescription](self->_mlModel, "modelDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "metadata");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKey:", *MEMORY[0x24BDBFF50]);
          v34 = objc_claimAutoreleasedReturnValue();
          modelVersion = self->_modelVersion;
          p_modelVersion = (id *)&self->_modelVersion;
          *p_modelVersion = (id)v34;

          if (!*p_modelVersion
            || (v37 = objc_msgSend(*p_modelVersion, "isEqualToString:", &stru_250C67C70), v38 = p_modelVersion, v37))
          {
            v38 = (id *)defaultPredictedRealtimeVersion;
          }
          v39 = *v38;
          v25 = *p_modelVersion;
          *p_modelVersion = v39;
          v7 = v42;
        }

      }
      else
      {
        FinHealthLogObject(CFSTR("FinHealthCore"));
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "path");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v47 = "-[FHModel _loadModel:]";
          v48 = 2112;
          v49 = v4;
          v50 = 2112;
          v51 = (uint64_t)v30;
          v52 = 2112;
          v53 = v31;
          _os_log_impl(&dword_23B4A2000, v19, OS_LOG_TYPE_ERROR, "%s failed to compile modelURL spec at path: %@ to tempDir path: %@ with error: %@", buf, 0x2Au);

        }
        v24 = 0;
        v11 = v18;
      }

    }
    else
    {
      FinHealthLogObject(CFSTR("FinHealthCore"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v47 = "-[FHModel _loadModel:]";
        v48 = 2112;
        v49 = v28;
        v50 = 2112;
        v51 = (uint64_t)v29;
        _os_log_impl(&dword_23B4A2000, v17, OS_LOG_TYPE_ERROR, "%s failed to create directory at path: %@ with error: %@", buf, 0x20u);

      }
      v24 = 0;
    }

  }
  else
  {
    v24 = 1;
  }

  return v24;
}

- (id)_predict:(id)a3
{
  MLModel *mlModel;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSString *modelName;
  void *v13;
  id v14;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  mlModel = self->_mlModel;
  if (!mlModel)
    return 0;
  v5 = (objc_class *)MEMORY[0x24BDBFF80];
  v6 = a3;
  v17 = 0;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDictionary:error:", v6, &v17);

  v8 = v17;
  v16 = v8;
  -[MLModel predictionFromFeatures:error:](mlModel, "predictionFromFeatures:error:", v7, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (v10)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      modelName = self->_modelName;
      objc_msgSend(v10, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v19 = "-[FHModel _predict:]";
      v20 = 2112;
      v21 = modelName;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_23B4A2000, v11, OS_LOG_TYPE_ERROR, "%s Error in getting predictions for model %@ Error %@", buf, 0x20u);

    }
    v14 = 0;
  }
  else
  {
    v14 = v9;
  }

  return v14;
}

- (id)predictClassProbabilities:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[FHModel _predict:](self, "_predict:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureValueForName:", CFSTR("classProbability"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)cleanUp
{
  -[FHModel _deleteModelFile:](self, "_deleteModelFile:", self->_compiledModelURL);
}

- (void)_deleteModelFile:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[FHModel _deleteModelFile:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_23B4A2000, v5, OS_LOG_TYPE_DEBUG, "%s Deleting file %@", buf, 0x16u);

  }
  v12 = 0;
  v7 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v12);
  v8 = v12;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (!v10)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[FHModel _deleteModelFile:]";
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_23B4A2000, v11, OS_LOG_TYPE_ERROR, "%s Error deleting file %@", buf, 0x16u);
    }

  }
}

- (void)recordModelScore:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __28__FHModel_recordModelScore___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", *(_QWORD *)(a1 + 32));
  FinHealthLogObject(CFSTR("FinHealthCore"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v1;
    _os_log_impl(&dword_23B4A2000, v2, OS_LOG_TYPE_DEBUG, "fhAnalyticsRecord: %@", (uint8_t *)&v4, 0xCu);
  }

  return v1;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MLModel)mlModel
{
  return self->_mlModel;
}

- (void)setMlModel:(id)a3
{
  objc_storeStrong((id *)&self->_mlModel, a3);
}

- (NSURL)compiledModelURL
{
  return self->_compiledModelURL;
}

- (void)setCompiledModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_compiledModelURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiledModelURL, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end
