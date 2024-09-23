@implementation _MKFHomeManager

- (MKFHomeManagerDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHomeManagerDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)accounts
{
  void *v2;
  void *v3;

  -[_MKFHomeManager valueForKey:](self, "valueForKey:", CFSTR("accounts_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateAccountsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("accounts_"), CFSTR("MKFAccount"), a3, a4);
}

- (id)findAccountsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("accounts_"), CFSTR("MKFAccount"), a3);
}

- (NSArray)homes
{
  void *v2;
  void *v3;

  -[_MKFHomeManager valueForKey:](self, "valueForKey:", CFSTR("homes_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateHomesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("homes_"), CFSTR("MKFHomeManagerHome"), a3, a4);
}

- (id)findHomesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("homes_"), CFSTR("MKFHomeManagerHome"), a3);
}

- (NSArray)incomingInvitations
{
  void *v2;
  void *v3;

  -[_MKFHomeManager valueForKey:](self, "valueForKey:", CFSTR("incomingInvitations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateIncomingInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("incomingInvitations_"), CFSTR("MKFIncomingInvitation"), a3, a4);
}

- (id)findIncomingInvitationsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("incomingInvitations_"), CFSTR("MKFIncomingInvitation"), a3);
}

- (id)materializeOrCreateMetadataRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("metadata"), CFSTR("MKFHAPMetadata"), 0, a3);
}

+ (NSUUID)defaultModelID
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
}

+ (id)fetchWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1758];
  +[_MKFHomeManager defaultModelID](_MKFHomeManager, "defaultModelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("modelID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  v19 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (v11)
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home managers: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v13;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255821150;
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKFHomeManager;
  -[_MKFHomeManager awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend((id)objc_opt_class(), "defaultModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHomeManager setPrimitiveModelID:](self, "setPrimitiveModelID:", v3);

}

- (BOOL)validateModelID:(id *)a3 error:(id *)a4
{
  _BOOL4 v7;
  void *v8;
  char v9;
  void *v10;
  _MKFHomeManager *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)_MKFHomeManager;
  v7 = -[_MKFModel validateModelID:error:](&v17, sel_validateModelID_error_);
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "defaultModelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", *a3);

    if ((v9 & 1) != 0)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *a3;
        *(_DWORD *)buf = 138543874;
        v19 = v13;
        v20 = 2112;
        v21 = CFSTR("modelID");
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("modelID"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = 0;
      *a4 = v15;
    }
  }
  return v7;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHomeManager"));
}

- (id)hmd_modelsWithChangeType:(unint64_t)a3 detached:(BOOL)a4 error:(id *)a5
{
  HMDHomeManagerModel *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HMDHomeManagerModel **v10;
  uint64_t v11;
  void *v12;
  HMDHomeManagerModel *v14;
  HMDHomeManagerModel *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = -[HMDBackingStoreModelObject initWithManagedObject:changeType:detached:error:]([HMDHomeManagerModel alloc], "initWithManagedObject:changeType:detached:error:", self, a3, a4, a5);
  if (v6)
  {
    +[HMDApplicationDataModel cd_modelWithMKFHomeManager:](HMDApplicationDataModel, "cd_modelWithMKFHomeManager:", self);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v15 = v6;
      v16 = v7;
      v9 = (void *)MEMORY[0x24BDBCE30];
      v10 = &v15;
      v11 = 2;
    }
    else
    {
      v14 = v6;
      v9 = (void *)MEMORY[0x24BDBCE30];
      v10 = &v14;
      v11 = 1;
    }
    objc_msgSend(v9, "arrayWithObjects:count:", v10, v11, v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
