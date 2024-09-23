@implementation _MKFModel

- (void)deleteObjects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_MKFModel managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27___MKFModel_deleteObjects___block_invoke;
  v7[3] = &unk_24E78F998;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);

}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  return 1;
}

- (MKFModelDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFModelDatabaseID alloc], "initWithMKFObject:", self);
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_MKFModel;
  -[_MKFModel willSave](&v22, sel_willSave);
  if ((-[_MKFModel isDeleted](self, "isDeleted") & 1) == 0)
  {
    if (-[_MKFModel isInserted](self, "isInserted"))
    {
      -[_MKFModel writerTimestamp](self, "writerTimestamp");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        return;
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFModel setWriterTimestamp:](self, "setWriterTimestamp:", v4);
      goto LABEL_12;
    }
    if (-[_MKFModel hasChanges](self, "hasChanges"))
    {
      -[_MKFModel managedObjectContext](self, "managedObjectContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hmd_transactionAuthor");

      if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        -[_MKFModel changedValues](self, "changedValues");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "count"))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("writerTimestamp"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v7)
          {
            v18 = 0;
            v19 = &v18;
            v20 = 0x2020000000;
            v21 = 0;
            -[_MKFModel entity](self, "entity");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "attributesByName");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = MEMORY[0x24BDAC760];
            v13 = 3221225472;
            v14 = __21___MKFModel_willSave__block_invoke;
            v15 = &unk_24E78F9C0;
            v10 = v9;
            v16 = v10;
            v17 = &v18;
            objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v12);
            if (*((_BYTE *)v19 + 24))
            {
              objc_msgSend(MEMORY[0x24BDBCE60], "now", v12, v13, v14, v15);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MKFModel setWriterTimestamp:](self, "setWriterTimestamp:", v11);

            }
            _Block_object_dispose(&v18, 8);
          }
        }
LABEL_12:

      }
    }
  }
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[_MKFModel entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = -[_MKFModel validateForInsertOrUpdateWithParentKey:error:](self, "validateForInsertOrUpdateWithParentKey:error:", v7, a3);
  return (char)a3;
}

- (BOOL)validateForInsertOrUpdateWithParentKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MKFModel;
  if (-[HMDManagedObject validateForInsertOrUpdate:](&v12, sel_validateForInsertOrUpdate_, a4))
  {
    -[_MKFModel entity](self, "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (-[_MKFModel valueForKey:](self, "valueForKey:", v6),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {
      if (a4)
      {
        v10 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is required"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmd_validationErrorWithDescription:managedObject:attributeName:", v11, self, v6);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      LOBYTE(a4) = 1;
    }

  }
  else
  {
    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)validateModelID:(id *)a3 error:(id *)a4
{
  char v6;
  void *v7;
  _MKFModel *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", *a3, CFSTR("modelID"), a4);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *a3;
      v13 = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = CFSTR("modelID");
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %@: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  return v6;
}

- (BOOL)validateWriterTimestamp:(id *)a3 error:(id *)a4
{
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _MKFModel *v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = *a3;
  if (!*a3)
  {
    if ((-[_MKFModel isInserted](self, "isInserted") & 1) != 0)
      return 1;
    v7 = *a3;
  }
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v8 = v11 != 0;
  if (!v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *a3;
      v18 = 138543874;
      v19 = v15;
      v20 = 2112;
      v21 = CFSTR("writerTimestamp");
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %@: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("writerTimestamp"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)hmd_debugIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MKFModel;
  -[NSManagedObject hmd_debugIdentifier](&v8, sel_hmd_debugIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFModel modelID](self, "modelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[_MKFModel modelID](self, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[_MKFModel objectID](self, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmd_debugIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MKFModel;
    -[HMDManagedObject description](&v9, sel_description);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v7;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[_MKFModel modelID](self, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[_MKFModel objectID](self, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmd_debugIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %lu>"), v6, objc_msgSend(v3, "hash"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MKFModel;
    -[HMDManagedObject redactedDescription](&v9, sel_redactedDescription);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)modelWithModelID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("modelID"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(v10, "setFetchBatchSize:", 1);
  v16[0] = CFSTR("modelID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v12);

  objc_msgSend(v8, "executeFetchRequest:error:", v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)modelWithModelID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  objc_msgSend(a1, "modelWithModelID:context:error:", v6, v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch model with modelID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

  return v8;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255772890;
}

@end
