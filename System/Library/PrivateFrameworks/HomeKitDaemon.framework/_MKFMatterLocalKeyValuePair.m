@implementation _MKFMatterLocalKeyValuePair

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MKFMatterLocalKeyValuePair;
  v5 = -[HMDManagedObject validateForInsertOrUpdate:](&v11, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    -[_MKFMatterLocalKeyValuePair valueForKey:](self, "valueForKey:", CFSTR("home"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is required"), CFSTR("home"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hmd_validationErrorWithDescription:managedObject:attributeName:", v8, self, CFSTR("home"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
        *a3 = objc_retainAutorelease(v9);

      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (MKFMatterLocalKeyValuePairDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFMatterLocalKeyValuePairDatabaseID alloc], "initWithMKFObject:", self);
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t1 != -1)
    dispatch_once(&homeRelation__hmf_once_t1, &__block_literal_global_154365);
  return (NSPredicate *)(id)homeRelation__hmf_once_v2;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2558513B8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFMatterLocalKeyValuePair"));
}

@end
