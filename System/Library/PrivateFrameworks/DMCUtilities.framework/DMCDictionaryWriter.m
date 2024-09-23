@implementation DMCDictionaryWriter

- (DMCDictionaryWriter)initWithDictionary:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  DMCDictionaryWriter *v9;
  DMCDictionaryWriter *v10;
  uint64_t v11;
  NSString *path;
  DMCFileAccessRepairTool *repairTool;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DMCDictionaryWriter;
  v9 = -[DMCDictionaryWriter init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dictionary, a3);
    v11 = objc_msgSend(v8, "copy");
    path = v10->_path;
    v10->_path = (NSString *)v11;

    repairTool = v10->_repairTool;
    v10->_repairTool = 0;

    -[DMCDictionaryWriter reset](v10, "reset");
  }

  return v10;
}

- (void)reset
{
  NSError *serializeError;
  NSError *writeError;
  NSError *beforeWriteRepairError;
  NSError *afterWriteRepairError;

  serializeError = self->_serializeError;
  self->_serializeError = 0;

  writeError = self->_writeError;
  self->_writeError = 0;

  beforeWriteRepairError = self->_beforeWriteRepairError;
  self->_beforeWriteRepairError = 0;

  afterWriteRepairError = self->_afterWriteRepairError;
  self->_afterWriteRepairError = 0;

}

- (DMCFileAccessRepairTool)repairTool
{
  DMCFileAccessRepairTool *repairTool;
  DMCFileAccessRepairTool *v4;
  DMCFileAccessRepairTool *v5;

  repairTool = self->_repairTool;
  if (!repairTool)
  {
    -[DMCDictionaryWriter createRepairTool](self, "createRepairTool");
    v4 = (DMCFileAccessRepairTool *)objc_claimAutoreleasedReturnValue();
    v5 = self->_repairTool;
    self->_repairTool = v4;

    repairTool = self->_repairTool;
  }
  return repairTool;
}

- (id)createRepairTool
{
  return (id)objc_opt_new();
}

- (id)serializedData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB38B0];
  -[DMCDictionaryWriter dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;

  if (!v5)
    -[DMCDictionaryWriter setSerializeError:](self, "setSerializeError:", v6);

  return v5;
}

- (BOOL)write
{
  -[DMCDictionaryWriter reset](self, "reset");
  -[DMCDictionaryWriter logStartOfWrite](self, "logStartOfWrite");
  -[DMCDictionaryWriter serializeDataAndWriteToStorage](self, "serializeDataAndWriteToStorage");
  -[DMCDictionaryWriter logResultOfWrite](self, "logResultOfWrite");
  return -[DMCDictionaryWriter didWriteSucceed](self, "didWriteSucceed");
}

- (BOOL)didWriteSucceed
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[DMCDictionaryWriter serializeError](self, "serializeError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[DMCDictionaryWriter writeError](self, "writeError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[DMCDictionaryWriter afterWriteRepairError](self, "afterWriteRepairError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 == 0;

    }
  }

  return v4;
}

- (void)logStartOfWrite
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = DMCLogObjects()[3];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[DMCDictionaryWriter dictionary](self, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[DMCDictionaryWriter path](self, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134218242;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to write dictionary with %lu entries to path %{public}@...", (uint8_t *)&v8, 0x16u);

  }
}

- (void)logResultOfWrite
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[DMCDictionaryWriter serializeError](self, "serializeError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = DMCLogObjects()[3];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return;
    v5 = v4;
    -[DMCDictionaryWriter path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCDictionaryWriter serializeError](self, "serializeError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    v8 = "Dictionary could not be written to %{public}@, could not serialize data: %{public}@";
    goto LABEL_4;
  }
  -[DMCDictionaryWriter beforeWriteRepairError](self, "beforeWriteRepairError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCDictionaryWriter writeError](self, "writeError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (v10)
    {
      v15 = DMCLogObjects()[3];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        return;
      v5 = v15;
      -[DMCDictionaryWriter path](self, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCDictionaryWriter writeError](self, "writeError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      v8 = "Dictionary could not be written to %{public}@, could not write data: %{public}@";
    }
    else
    {
      -[DMCDictionaryWriter afterWriteRepairError](self, "afterWriteRepairError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = DMCLogObjects()[3];
      if (!v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v5 = v17;
          -[DMCDictionaryWriter path](self, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543362;
          v20 = v18;
          _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_DEFAULT, "Dictionary successfully written to %{public}@", (uint8_t *)&v19, 0xCu);

          goto LABEL_6;
        }
        return;
      }
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        return;
      v5 = v17;
      -[DMCDictionaryWriter path](self, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCDictionaryWriter afterWriteRepairError](self, "afterWriteRepairError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      v8 = "Dictionary successfully written to %{public}@, could not make file readable after write: %{public}@";
    }
LABEL_4:
    _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v19, 0x16u);

LABEL_5:
LABEL_6:

    return;
  }
  v11 = DMCLogObjects()[3];
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (!v10)
  {
    if (!v12)
      return;
    v5 = v11;
    -[DMCDictionaryWriter path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCDictionaryWriter beforeWriteRepairError](self, "beforeWriteRepairError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    v8 = "Dictionary successfully written to %{public}@, but there was a problem repairing the file before writing: %{public}@";
    goto LABEL_4;
  }
  if (v12)
  {
    v5 = v11;
    -[DMCDictionaryWriter path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCDictionaryWriter beforeWriteRepairError](self, "beforeWriteRepairError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCDictionaryWriter writeError](self, "writeError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v6;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_ERROR, "Dictionary could not be written to %{public}@, file could not be repaired before writing: %{public}@ and could not write data: %{public}@", (uint8_t *)&v19, 0x20u);

    goto LABEL_5;
  }
}

- (void)serializeDataAndWriteToStorage
{
  void *v3;
  BOOL v4;
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  id v11;
  id v12;

  -[DMCDictionaryWriter serializedData](self, "serializedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = 0;
    v4 = -[DMCDictionaryWriter repairAccessIfNecessaryWithError:](self, "repairAccessIfNecessaryWithError:", &v12);
    v5 = v12;
    if (!v4)
      -[DMCDictionaryWriter setBeforeWriteRepairError:](self, "setBeforeWriteRepairError:", v5);
    v11 = 0;
    v6 = -[DMCDictionaryWriter writeData:error:](self, "writeData:error:", v3, &v11);
    v7 = v11;
    if (v6)
    {
      v10 = 0;
      v8 = -[DMCDictionaryWriter repairAccessIfNecessaryWithError:](self, "repairAccessIfNecessaryWithError:", &v10);
      v9 = v10;
      if (!v8)
        -[DMCDictionaryWriter setAfterWriteRepairError:](self, "setAfterWriteRepairError:", v9);

    }
    else
    {
      -[DMCDictionaryWriter setWriteError:](self, "setWriteError:", v7);
    }

  }
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  id v11;

  v6 = a3;
  -[DMCDictionaryWriter path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v6, "DMCAtomicWriteToPath:error:", v7, &v11);

  v9 = v11;
  if (a4 && (v8 & 1) == 0)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (BOOL)repairAccessIfNecessaryWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v13;

  -[DMCDictionaryWriter repairTool](self, "repairTool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCDictionaryWriter path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileNeedsRepairAtPath:", v6);

  if (!v7)
    return 1;
  -[DMCDictionaryWriter repairTool](self, "repairTool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCDictionaryWriter path](self, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v8, "repairFileAtPath:error:", v9, &v13);
  v11 = v13;

  if (a3 && (v10 & 1) == 0)
    *a3 = objc_retainAutorelease(v11);

  return v10;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)path
{
  return self->_path;
}

- (void)setRepairTool:(id)a3
{
  objc_storeStrong((id *)&self->_repairTool, a3);
}

- (NSError)serializeError
{
  return self->_serializeError;
}

- (void)setSerializeError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSError)writeError
{
  return self->_writeError;
}

- (void)setWriteError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSError)beforeWriteRepairError
{
  return self->_beforeWriteRepairError;
}

- (void)setBeforeWriteRepairError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSError)afterWriteRepairError
{
  return self->_afterWriteRepairError;
}

- (void)setAfterWriteRepairError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterWriteRepairError, 0);
  objc_storeStrong((id *)&self->_beforeWriteRepairError, 0);
  objc_storeStrong((id *)&self->_writeError, 0);
  objc_storeStrong((id *)&self->_serializeError, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_repairTool, 0);
}

@end
