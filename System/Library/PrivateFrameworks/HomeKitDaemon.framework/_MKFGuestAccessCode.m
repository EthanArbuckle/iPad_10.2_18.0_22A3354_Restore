@implementation _MKFGuestAccessCode

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_70794 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_70794, &__block_literal_global_70795);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_70796;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557F0758;
}

- (MKFGuestAccessCodeDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFGuestAccessCodeDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFGuestAccessCode"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
