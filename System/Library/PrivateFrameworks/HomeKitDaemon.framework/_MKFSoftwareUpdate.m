@implementation _MKFSoftwareUpdate

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFSoftwareUpdate"));
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_133736 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_133736, &__block_literal_global_133737);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_133738;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255841240;
}

- (MKFSoftwareUpdateDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFSoftwareUpdateDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFSoftwareUpdate accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
