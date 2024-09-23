@implementation _MKFAirPlayAccessory

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

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_65318 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_65318, &__block_literal_global_65319);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_65320;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557EAD38;
}

- (MKFAirPlayAccessoryDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFAirPlayAccessoryDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)pairedUsers
{
  void *v2;
  void *v3;

  -[_MKFAirPlayAccessory valueForKey:](self, "valueForKey:", CFSTR("pairedUsers_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addPairedUsersObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("pairedUsers_"), a3);
}

- (void)removePairedUsersObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("pairedUsers_"), a3);
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFAirPlayAccessory"));
}

@end
