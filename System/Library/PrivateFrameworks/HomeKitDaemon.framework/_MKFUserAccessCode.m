@implementation _MKFUserAccessCode

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_97667 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_97667, &__block_literal_global_97668);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_97669;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255811430;
}

- (MKFUserAccessCodeDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFUserAccessCodeDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFUserAccessCode user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

- (NSUUID)hmd_parentModelID
{
  uint64_t v3;
  void *v4;
  void *v5;
  HMDUserAccessCodeModel *v7;
  SEL v8;
  id v9;
  id v10;
  id v11;

  v3 = objc_opt_class();
  if ((HMDManagedObjectClassIsBSORepresentable(v3) & 1) != 0)
  {
    -[NSManagedObject hmd_lastKnownValueForKey:](self, "hmd_lastKnownValueForKey:", CFSTR("user"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      || (-[NSManagedObject hmd_lastKnownValueForKey:](self, "hmd_lastKnownValueForKey:", CFSTR("guest")),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v4, "hmd_modelID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    return (NSUUID *)v5;
  }
  else
  {
    v7 = (HMDUserAccessCodeModel *)_HMFPreconditionFailure();
    return (NSUUID *)-[HMDUserAccessCodeModel cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](v7, v8, v9, v10, v11);
  }
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFUserAccessCode"));
}

@end
