@implementation LCFModelStoreModelMetadataProvider

- (id)init:(id)a3
{
  id v5;
  LCFModelStoreModelMetadataProvider *v6;
  uint64_t v7;
  NSURL *metadataPlistFileURL;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LCFModelStoreModelMetadataProvider;
  v6 = -[LCFModelStoreModelMetadataProvider init](&v10, sel_init);
  if (v6)
  {
    LCFModelStoreLoggingUtilsInit();
    objc_storeStrong((id *)&v6->_modelStoreRootWithKeyURL, a3);
    -[NSURL URLByAppendingPathComponent:](v6->_modelStoreRootWithKeyURL, "URLByAppendingPathComponent:", CFSTR("metadata.plist"));
    v7 = objc_claimAutoreleasedReturnValue();
    metadataPlistFileURL = v6->_metadataPlistFileURL;
    v6->_metadataPlistFileURL = (NSURL *)v7;

  }
  return v6;
}

- (id)getMetadata
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", self->_metadataPlistFileURL);
}

- (id)getModelMetadata:(id)a3
{
  id v4;
  void *v5;
  LCFModelMetadata *v6;
  void *v7;
  LCFModelMetadata *v8;

  v4 = a3;
  -[LCFModelStoreModelMetadataProvider getMetadata](self, "getMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [LCFModelMetadata alloc];
    objc_msgSend(v5, "valueForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[LCFModelMetadata init:](v6, "init:", v7);

  }
  else
  {
    v8 = objc_alloc_init(LCFModelMetadata);
  }

  return v8;
}

- (BOOL)setModelMetadata:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSURL **p_metadataPlistFileURL;
  NSURL *metadataPlistFileURL;
  char v13;
  id v14;
  NSObject *v15;
  NSURL *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  uint8_t buf[4];
  NSURL *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a4, "toDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[LCFModelStoreModelMetadataProvider getMetadata](self, "getMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDictionary:", v9);

  objc_msgSend(v10, "setValue:forKey:", v7, v6);
  metadataPlistFileURL = self->_metadataPlistFileURL;
  p_metadataPlistFileURL = &self->_metadataPlistFileURL;
  v24 = 0;
  v13 = objc_msgSend(v10, "writeToURL:error:", metadataPlistFileURL, &v24);
  v14 = v24;
  v15 = LCFLogModelStoreModelMetadata;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)LCFLogModelStoreModelMetadata, OS_LOG_TYPE_INFO))
    {
      v16 = *p_metadataPlistFileURL;
      *(_DWORD *)buf = 138412290;
      v26 = v16;
      _os_log_impl(&dword_240341000, v15, OS_LOG_TYPE_INFO, "succeeded to write metadata %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)LCFLogModelStoreModelMetadata, OS_LOG_TYPE_ERROR))
  {
    -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:].cold.1((uint64_t)p_metadataPlistFileURL, v15, v17, v18, v19, v20, v21, v22);
  }

  return v13;
}

- (BOOL)removeModelMetadata:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSURL **p_metadataPlistFileURL;
  NSURL *metadataPlistFileURL;
  char v11;
  id v12;
  NSObject *v13;
  NSURL *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  uint8_t buf[4];
  NSURL *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a3;
  v6 = [v4 alloc];
  -[LCFModelStoreModelMetadataProvider getMetadata](self, "getMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

  objc_msgSend(v8, "setValue:forKey:", 0, v5);
  metadataPlistFileURL = self->_metadataPlistFileURL;
  p_metadataPlistFileURL = &self->_metadataPlistFileURL;
  v22 = 0;
  v11 = objc_msgSend(v8, "writeToURL:error:", metadataPlistFileURL, &v22);
  v12 = v22;
  v13 = LCFLogModelStoreModelMetadata;
  if ((v11 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)LCFLogModelStoreModelMetadata, OS_LOG_TYPE_INFO))
    {
      v14 = *p_metadataPlistFileURL;
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_240341000, v13, OS_LOG_TYPE_INFO, "succeeded to write metadata %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)LCFLogModelStoreModelMetadata, OS_LOG_TYPE_ERROR))
  {
    -[LCFModelStoreModelMetadataProvider setModelMetadata:metadata:].cold.1((uint64_t)p_metadataPlistFileURL, v13, v15, v16, v17, v18, v19, v20);
  }

  return v11;
}

- (NSURL)modelStoreRootWithKeyURL
{
  return self->_modelStoreRootWithKeyURL;
}

- (NSURL)metadataPlistFileURL
{
  return self->_metadataPlistFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataPlistFileURL, 0);
  objc_storeStrong((id *)&self->_modelStoreRootWithKeyURL, 0);
}

- (void)setModelMetadata:(uint64_t)a3 metadata:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_240341000, a2, a3, "failed to write metadata %@", a5, a6, a7, a8, 2u);
}

@end
