@implementation _MKFHomeManagerHome

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557A2AB8;
}

- (MKFHomeManagerHomeDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHomeManagerHomeDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHomeManagerHome"));
}

- (id)hmd_modelsWithChangeType:(unint64_t)a3 detached:(BOOL)a4 error:(id *)a5
{
  HMDHomeManagerHomeModel *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v6 = -[HMDBackingStoreModelObject initWithManagedObject:changeType:detached:error:]([HMDHomeManagerHomeModel alloc], "initWithManagedObject:changeType:detached:error:", self, a3, a4, a5);
  if (v6)
  {
    -[_MKFHomeManagerHome handle](self, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeManagerHomeModel setHandle:](v6, "setHandle:", v7);

    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
