@implementation _MKFCharacteristicRangeEvent

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCharacteristicRangeEvent"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)validateMin:(id *)a3 error:(id *)a4
{
  return -[NSManagedObject hmd_validateCharacteristicValue:key:error:](self, "hmd_validateCharacteristicValue:key:error:", *a3, CFSTR("min"), a4);
}

- (BOOL)validateMax:(id *)a3 error:(id *)a4
{
  return -[NSManagedObject hmd_validateCharacteristicValue:key:error:](self, "hmd_validateCharacteristicValue:key:error:", *a3, CFSTR("max"), a4);
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MKFCharacteristicRangeEvent;
  v5 = -[_MKFCharacteristicEvent validateForInsertOrUpdate:](&v10, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    -[_MKFCharacteristicRangeEvent max](self, "max");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

LABEL_5:
      LOBYTE(v5) = 1;
      return v5;
    }
    -[_MKFCharacteristicRangeEvent min](self, "min");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_5;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", CFSTR("Must have at least one of min or max"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v8;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (MKFCharacteristicRangeEventDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFCharacteristicRangeEventDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFCharacteristicRangeEvent trigger](self, "trigger");
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
  return (Protocol *)&unk_2558BABE8;
}

@end
