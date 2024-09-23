@implementation _MKFRoom

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFRoom"));
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_71276 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_71276, &__block_literal_global_71277);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_71278;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557F08D0;
}

- (MKFRoomDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFRoomDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)accessories
{
  void *v2;
  void *v3;

  -[_MKFRoom valueForKey:](self, "valueForKey:", CFSTR("accessories_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("applicationData"), CFSTR("MKFApplicationData"), 0, a3);
}

- (NSArray)zones
{
  void *v2;
  void *v3;

  -[_MKFRoom valueForKey:](self, "valueForKey:", CFSTR("zones_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  id v4;
  void *v5;
  _MKFRoom *v6;
  void *v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[_MKFRoom home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultRoom");
  v6 = (_MKFRoom *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v8 = 1;
  }
  else
  {
    -[_MKFRoom accessories](self, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __75___MKFRoom_ResidentSyncCoding__shouldIncludeForRestrictedGuestWithContext___block_invoke;
    v10[3] = &unk_24E789FA8;
    v11 = v4;
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  return v8;
}

@end
