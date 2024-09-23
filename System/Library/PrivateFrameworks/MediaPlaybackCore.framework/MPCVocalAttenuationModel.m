@implementation MPCVocalAttenuationModel

- (void)setTaskIteration:(unint64_t)a3
{
  self->_taskIteration = a3;
}

- (void)setSampleRate:(unint64_t)a3
{
  self->_sampleRate = a3;
}

- (void)setProcessingDelay:(double)a3
{
  self->_processingDelay = a3;
}

- (void)setPlistPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLookaheadSize:(unint64_t)a3
{
  self->_lookaheadSize = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setFiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void)setBasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

uint64_t __55__MPCVocalAttenuationModel_vocalAttenuationModelAtURL___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("plist"));

  return v3;
}

+ (id)_filePathsForModelAtURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBCCD0];
  v6 = *MEMORY[0x24BDBCC60];
  v29[0] = *MEMORY[0x24BDBCCD0];
  v29[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  v20 = v3;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v7, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        v23 = 0;
        objc_msgSend(v14, "getResourceValue:forKey:error:", &v23, v6, 0);
        v15 = v23;
        if ((objc_msgSend(v15, "BOOLValue") & 1) == 0)
        {
          v22 = 0;
          objc_msgSend(v14, "getResourceValue:forKey:error:", &v22, v5, 0);
          v16 = v22;
          if (objc_msgSend(v16, "hasPrefix:", CFSTR(".")))
            objc_msgSend(v9, "skipDescendants");
          else
            objc_msgSend(v21, "addObject:", v14);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_msgSend(v21, "copy");
  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t batchSize;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double processingDelay;
  void *v12;
  NSString *basePath;
  void *v14;
  NSString *plistPath;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  if (self)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ID: %@"), self->_identifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    if (self->_blockSize)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BlockSize: %lu"), self->_blockSize);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
    batchSize = self->_batchSize;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ID: %@"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

    batchSize = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BatchSize: %lu"), batchSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  if (self)
  {
    if (self->_sampleRate)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SampleRate: %luHz"), self->_sampleRate);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

    }
    if (self->_lookaheadSize)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LookaheadSize: %lu"), self->_lookaheadSize);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

    }
    if (self->_taskIteration)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TaskIteration: %lu"), self->_taskIteration);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

    }
    processingDelay = self->_processingDelay;
    if (processingDelay > 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Delay: %3.1fms"), processingDelay * 1000.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

    }
    basePath = self->_basePath;
  }
  else
  {
    basePath = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BasePath: %@"), basePath);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  if (self)
    plistPath = self->_plistPath;
  else
    plistPath = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Plist: %@"), plistPath);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = objc_opt_class();
  objc_msgSend(v3, "msv_compactDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%p - %@> - %@"), self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistPath, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)_plistForModelAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  if (!v9)
  {
    objc_msgSend(v8, "msv_filter:", &__block_literal_global_27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      if ((unint64_t)objc_msgSend(v12, "count") < 2)
      {
        objc_msgSend(v12, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v18, v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend(v12, "count");
        *(_DWORD *)buf = 134218242;
        v22 = v14;
        v23 = 2114;
        v24 = v5;
        v15 = "[AP] - MPCVAModel - More than one [%ld] plist found at %{public}@";
        v16 = v13;
        v17 = 22;
LABEL_11:
        _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      }
    }
    else
    {
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v22 = (uint64_t)v5;
        v15 = "[AP] - MPCVAModel - No plist found at %{public}@";
        v16 = v13;
        v17 = 12;
        goto LABEL_11;
      }
    }

    v11 = 0;
LABEL_14:
    v8 = v12;
    goto LABEL_15;
  }
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v22 = (uint64_t)v5;
    v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "[AP] - MPCVAModel - Unable to retrieve content at %{public}@: %{public}@", buf, 0x16u);
  }

  v11 = 0;
  *a4 = objc_retainAutorelease(v9);
LABEL_15:

  return v11;
}

uint64_t __54__MPCVocalAttenuationModel__plistForModelAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("plist"));

  return v3;
}

@end
