@implementation _MKFRemovedUserAccessCode

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFRemovedUserAccessCode"));
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_232400 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_232400, &__block_literal_global_232401);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_232402;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2558B19C0;
}

- (MKFRemovedUserAccessCodeDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFRemovedUserAccessCodeDatabaseID alloc], "initWithMKFObject:", self);
}

@end
