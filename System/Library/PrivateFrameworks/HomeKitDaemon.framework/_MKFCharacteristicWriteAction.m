@implementation _MKFCharacteristicWriteAction

- (BOOL)validateTargetValue:(id *)a3 error:(id *)a4
{
  return -[NSManagedObject hmd_validateCharacteristicValue:key:error:](self, "hmd_validateCharacteristicValue:key:error:", *a3, CFSTR("targetValue"), a4);
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKFCharacteristicWriteAction;
  -[_MKFModel willSave](&v7, sel_willSave);
  -[_MKFCharacteristicWriteAction service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_MKFCharacteristicWriteAction accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HMFEqualObjects();

    if ((v6 & 1) == 0)
      -[_MKFCharacteristicWriteAction setAccessory:](self, "setAccessory:", v4);
  }

}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MKFCharacteristicWriteAction;
  v5 = -[_MKFModel validateForInsertOrUpdate:](&v9, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    -[_MKFCharacteristicWriteAction service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", CFSTR("service is required"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v7;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (MKFCharacteristicWriteActionDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFCharacteristicWriteActionDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFCharacteristicWriteAction actionSet](self, "actionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

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
  return (Protocol *)&unk_25577D918;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCharacteristicWriteAction"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
