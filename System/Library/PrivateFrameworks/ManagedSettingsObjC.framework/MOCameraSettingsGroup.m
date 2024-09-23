@implementation MOCameraSettingsGroup

+ (id)groupName
{
  return CFSTR("camera");
}

- (NSNumber)denyCamera
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyCamera"));
}

- (void)setDenyCamera:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyCamera"));
}

+ (MOBoolSettingMetadata)denyCameraMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MOCameraSettingsGroup_denyCameraMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyCameraMetadata_onceToken != -1)
    dispatch_once(&denyCameraMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyCameraMetadata_metadata;
}

void __43__MOCameraSettingsGroup_denyCameraMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyCamera"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyCameraMetadata_metadata;
  denyCameraMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyScreenRecording
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyScreenRecording"));
}

- (void)setDenyScreenRecording:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyScreenRecording"));
}

+ (MOBoolSettingMetadata)denyScreenRecordingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MOCameraSettingsGroup_denyScreenRecordingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyScreenRecordingMetadata_onceToken != -1)
    dispatch_once(&denyScreenRecordingMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyScreenRecordingMetadata_metadata;
}

void __52__MOCameraSettingsGroup_denyScreenRecordingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyScreenRecording"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyScreenRecordingMetadata_metadata;
  denyScreenRecordingMetadata_metadata = (uint64_t)v2;

}

@end
