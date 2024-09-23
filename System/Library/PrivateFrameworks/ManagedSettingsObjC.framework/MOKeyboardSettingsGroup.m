@implementation MOKeyboardSettingsGroup

+ (id)groupName
{
  return CFSTR("keyboard");
}

- (NSNumber)denyDictation
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyDictation"));
}

- (void)setDenyDictation:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyDictation"));
}

+ (MOBoolSettingMetadata)denyDictationMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MOKeyboardSettingsGroup_denyDictationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyDictationMetadata_onceToken != -1)
    dispatch_once(&denyDictationMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyDictationMetadata_metadata;
}

void __48__MOKeyboardSettingsGroup_denyDictationMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyDictation"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyDictationMetadata_metadata;
  denyDictationMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyMathSolvingKeyboard
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyMathSolvingKeyboard"));
}

- (void)setDenyMathSolvingKeyboard:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyMathSolvingKeyboard"));
}

+ (MOBoolSettingMetadata)denyMathSolvingKeyboardMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MOKeyboardSettingsGroup_denyMathSolvingKeyboardMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMathSolvingKeyboardMetadata_onceToken != -1)
    dispatch_once(&denyMathSolvingKeyboardMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyMathSolvingKeyboardMetadata_metadata;
}

void __58__MOKeyboardSettingsGroup_denyMathSolvingKeyboardMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyMathSolvingKeyboard"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyMathSolvingKeyboardMetadata_metadata;
  denyMathSolvingKeyboardMetadata_metadata = (uint64_t)v2;

}

@end
