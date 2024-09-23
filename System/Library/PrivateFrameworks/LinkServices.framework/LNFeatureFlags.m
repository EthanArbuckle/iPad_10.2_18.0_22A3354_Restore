@implementation LNFeatureFlags

+ (BOOL)isConditionallyEnabledIntentsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isVocabularyDonationEnabled
{
  if (isVocabularyDonationOverrideEnabled)
    return 1;
  else
    return _os_feature_enabled_impl();
}

+ (NSDictionary)allFeatures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("Action Transcript");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isActionTranscriptEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("Runtime Metadata Extraction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isRuntimeMetadataSupported"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("Static Metadata Extraction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isStaticMetadataIngestionEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("View Action Annotation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isViewActionAnnotationEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("Vocabulary Donation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isVocabularyDonationEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  v13[5] = CFSTR("Low Power Device");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isLowPowerDeviceEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  v13[6] = CFSTR("Conditionally Enabled Intents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isConditionallyEnabledIntentsEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  v13[7] = CFSTR("Allow Entitled AppShortcuts to omit AppName");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isAppShortcutsOmittingAppNameEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

+ (BOOL)isActionTranscriptEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isRuntimeMetadataSupported
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isStaticMetadataIngestionEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isViewActionAnnotationEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLowPowerDeviceEnabled
{
  return _os_feature_enabled_impl();
}

+ (void)setIsVocabularyDonationOverrideEnabled:(BOOL)a3
{
  isVocabularyDonationOverrideEnabled = a3;
}

+ (BOOL)isAppShortcutsOmittingAppNameEnabled
{
  if (isAppShortcutsOmittingAppNameOverrideEnabled)
    return 1;
  else
    return _os_feature_enabled_impl();
}

+ (void)setIsAppShortcutsOmittingAppNameEnabled:(BOOL)a3
{
  isAppShortcutsOmittingAppNameOverrideEnabled = a3;
}

@end
