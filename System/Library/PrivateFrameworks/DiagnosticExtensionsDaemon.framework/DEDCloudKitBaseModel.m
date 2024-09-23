@implementation DEDCloudKitBaseModel

- (id)initModelWithDictionary:(id)a3
{
  id v4;
  DEDCloudKitBaseModel *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  os_log_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DEDCloudKitBaseModel;
  v5 = -[DEDCloudKitBaseModel init](&v30, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDB91D8]);
    -[DEDCloudKitBaseModel modelName](v5, "modelName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithRecordType:", v7);
    -[DEDCloudKitBaseModel setCloudKitModel:](v5, "setCloudKitModel:", v8);

    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = os_log_create((const char *)objc_msgSend(v9, "loggingSubsystem"), "ded-cloudkit-model");
    -[DEDCloudKitBaseModel setLog:](v5, "setLog:", v10);

    v11 = (void *)objc_opt_new();
    -[DEDCloudKitBaseModel setDependencies:](v5, "setDependencies:", v11);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v4;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (!v13)
      goto LABEL_14;
    v14 = v13;
    v15 = *(_QWORD *)v27;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v16);
        -[DEDCloudKitBaseModel cloudKitModel](v5, "cloudKitModel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v17);
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", &stru_24D1E6AF0);

          if (!v23)
            goto LABEL_12;
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[DEDCloudKitBaseModel cloudKitModel](v5, "cloudKitModel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v17);
        }

LABEL_12:
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (!v14)
      {
LABEL_14:

        v4 = v25;
        break;
      }
    }
  }

  return v5;
}

- (void)addReferenceForModel:(id)a3 referenceKey:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x24BDB9218];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v8, "cloudKitModel");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "initWithRecord:action:", v12, 1);
  -[DEDCloudKitBaseModel cloudKitModel](self, "cloudKitModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v7);

}

- (void)addDependency:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDCloudKitBaseModel dependencies](self, "dependencies");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSString)modelName
{
  NSObject *v2;

  -[DEDCloudKitBaseModel log](self, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[DEDCloudKitBaseModel modelName].cold.1(v2);

  return (NSString *)&stru_24D1E6AF0;
}

- (CKRecord)cloudKitModel
{
  return self->_cloudKitModel;
}

- (void)setCloudKitModel:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitModel, a3);
}

- (NSMutableArray)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_dependencies, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_cloudKitModel, 0);
}

- (void)modelName
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "No DEDCloudKitModel name is defined", v1, 2u);
}

@end
