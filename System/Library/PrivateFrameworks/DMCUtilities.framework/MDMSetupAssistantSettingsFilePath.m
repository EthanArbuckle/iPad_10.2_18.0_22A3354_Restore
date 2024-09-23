@implementation MDMSetupAssistantSettingsFilePath

void __MDMSetupAssistantSettingsFilePath_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (MCSystemProfileStorageDirectory_once != -1)
    dispatch_once(&MCSystemProfileStorageDirectory_once, &__block_literal_global_123);
  v0 = (id)MCSystemProfileStorageDirectory_str;
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("SetupAssistantSettings.plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)MDMSetupAssistantSettingsFilePath_str;
  MDMSetupAssistantSettingsFilePath_str = v1;

}

@end
