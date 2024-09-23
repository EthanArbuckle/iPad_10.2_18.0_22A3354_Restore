@implementation HMDCloudZoneInformationModel

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
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
  if (properties_onceToken_120616 != -1)
    dispatch_once(&properties_onceToken_120616, &__block_literal_global_120617);
  return (id)properties__properties_120618;
}

void __42__HMDCloudZoneInformationModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("ownerName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_120618;
  properties__properties_120618 = v1;

}

@end
