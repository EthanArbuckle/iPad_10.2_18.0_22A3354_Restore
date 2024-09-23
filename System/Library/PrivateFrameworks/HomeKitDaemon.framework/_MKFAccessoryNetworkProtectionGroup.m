@implementation _MKFAccessoryNetworkProtectionGroup

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFAccessoryNetworkProtectionGroup"));
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_179030 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_179030, &__block_literal_global_179031);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_179032;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2558690E0;
}

- (MKFAccessoryNetworkProtectionGroupDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFAccessoryNetworkProtectionGroupDatabaseID alloc], "initWithMKFObject:", self);
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
