@implementation MOCellularSettingsGroup

+ (id)groupName
{
  return CFSTR("cellular");
}

- (NSNumber)lockAppCellularData
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockAppCellularData"));
}

- (void)setLockAppCellularData:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockAppCellularData"));
}

+ (MOBoolSettingMetadata)lockAppCellularDataMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MOCellularSettingsGroup_lockAppCellularDataMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockAppCellularDataMetadata_onceToken != -1)
    dispatch_once(&lockAppCellularDataMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockAppCellularDataMetadata_metadata;
}

void __54__MOCellularSettingsGroup_lockAppCellularDataMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockAppCellularData"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)lockAppCellularDataMetadata_metadata;
  lockAppCellularDataMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)lockCellularPlan
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockCellularPlan"));
}

- (void)setLockCellularPlan:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockCellularPlan"));
}

+ (MOBoolSettingMetadata)lockCellularPlanMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MOCellularSettingsGroup_lockCellularPlanMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockCellularPlanMetadata_onceToken != -1)
    dispatch_once(&lockCellularPlanMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockCellularPlanMetadata_metadata;
}

void __51__MOCellularSettingsGroup_lockCellularPlanMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockCellularPlan"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)lockCellularPlanMetadata_metadata;
  lockCellularPlanMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)lockESIM
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockESIM"));
}

- (void)setLockESIM:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockESIM"));
}

+ (MOBoolSettingMetadata)lockESIMMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MOCellularSettingsGroup_lockESIMMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockESIMMetadata_onceToken != -1)
    dispatch_once(&lockESIMMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockESIMMetadata_metadata;
}

void __43__MOCellularSettingsGroup_lockESIMMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockESIM"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)lockESIMMetadata_metadata;
  lockESIMMetadata_metadata = (uint64_t)v2;

}

@end
