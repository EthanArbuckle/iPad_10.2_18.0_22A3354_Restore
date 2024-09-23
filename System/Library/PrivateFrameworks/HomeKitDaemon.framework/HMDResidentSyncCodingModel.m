@implementation HMDResidentSyncCodingModel

void __HMDResidentSyncCodingModel_block_invoke()
{
  HMDManagedObjectCodingModel *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [HMDManagedObjectCodingModel alloc];
  +[HMDCoreData managedObjectModel](HMDCoreData, "managedObjectModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[HMDManagedObjectCodingModel initWithModel:configNamespace:rootEntityName:](v0, "initWithModel:configNamespace:rootEntityName:", v3, CFSTR("residentSync"), CFSTR("MKFHome"));
  v2 = (void *)HMDResidentSyncCodingModel__hmf_once_v1;
  HMDResidentSyncCodingModel__hmf_once_v1 = v1;

}

@end
