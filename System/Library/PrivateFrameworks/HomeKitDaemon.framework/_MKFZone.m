@implementation _MKFZone

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[_MKFZone rooms](self, "rooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75___MKFZone_ResidentSyncCoding__shouldIncludeForRestrictedGuestWithContext___block_invoke;
  v9[3] = &unk_24E789FD0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
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

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_177820 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_177820, &__block_literal_global_177821);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_177822;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255868908;
}

- (MKFZoneDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFZoneDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)rooms
{
  void *v2;
  void *v3;

  -[_MKFZone valueForKey:](self, "valueForKey:", CFSTR("rooms_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addRoomsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("rooms_"), a3);
}

- (void)removeRoomsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("rooms_"), a3);
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFZone"));
}

@end
