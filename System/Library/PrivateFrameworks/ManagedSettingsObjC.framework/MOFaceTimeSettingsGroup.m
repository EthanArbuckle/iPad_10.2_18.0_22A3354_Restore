@implementation MOFaceTimeSettingsGroup

+ (id)groupName
{
  return CFSTR("faceTime");
}

- (NSNumber)denyFaceTime
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyFaceTime"));
}

- (void)setDenyFaceTime:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyFaceTime"));
}

+ (MOBoolSettingMetadata)denyFaceTimeMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MOFaceTimeSettingsGroup_denyFaceTimeMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyFaceTimeMetadata_onceToken != -1)
    dispatch_once(&denyFaceTimeMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyFaceTimeMetadata_metadata;
}

void __47__MOFaceTimeSettingsGroup_denyFaceTimeMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyFaceTime"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyFaceTimeMetadata_metadata;
  denyFaceTimeMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denySharePlay
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denySharePlay"));
}

- (void)setDenySharePlay:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denySharePlay"));
}

+ (MOBoolSettingMetadata)denySharePlayMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MOFaceTimeSettingsGroup_denySharePlayMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySharePlayMetadata_onceToken != -1)
    dispatch_once(&denySharePlayMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denySharePlayMetadata_metadata;
}

void __48__MOFaceTimeSettingsGroup_denySharePlayMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denySharePlay"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denySharePlayMetadata_metadata;
  denySharePlayMetadata_metadata = (uint64_t)v2;

}

@end
