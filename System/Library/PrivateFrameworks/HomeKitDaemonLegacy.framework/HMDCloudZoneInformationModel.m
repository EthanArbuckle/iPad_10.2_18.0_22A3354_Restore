@implementation HMDCloudZoneInformationModel

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (BOOL)requiresHomeManagerUpdate
{
  return self->_requiresHomeManagerUpdate;
}

- (void)setRequiresHomeManagerUpdate:(BOOL)a3
{
  self->_requiresHomeManagerUpdate = a3;
}

+ (id)properties
{
  if (properties_onceToken_84503 != -1)
    dispatch_once(&properties_onceToken_84503, &__block_literal_global_84504);
  return (id)properties__properties_84505;
}

void __42__HMDCloudZoneInformationModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("ownerName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_84505;
  properties__properties_84505 = v1;

}

@end
