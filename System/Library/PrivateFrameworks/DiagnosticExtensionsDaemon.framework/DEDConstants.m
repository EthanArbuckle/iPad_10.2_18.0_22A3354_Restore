@implementation DEDConstants

+ (id)allPlatforms
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("ios"), CFSTR("homepod"), CFSTR("macos"), CFSTR("watchos"), CFSTR("tvos"), CFSTR("unspecified"), CFSTR("visionos"), 0);
}

+ (id)DEDExtensionHostAppKey
{
  return CFSTR("DEExtensionHostAppKey");
}

+ (id)DEDExtensionAttachmentsParamBundleIDKey
{
  return CFSTR("DEExtensionAttachmentsParamBundleIDKey");
}

+ (id)DEDExtensionCompressOnAttach
{
  return CFSTR("DEDExtensionCompressOnAttach");
}

+ (id)DEDAddEmptyFile
{
  return CFSTR("DEDExtensionAddsStubFile");
}

+ (id)processName
{
  if (processName_onceToken != -1)
    dispatch_once(&processName_onceToken, &__block_literal_global_6);
  return (id)processName_processName;
}

void __27__DEDConstants_processName__block_invoke()
{
  uint64_t v0;
  void *v1;
  __CFString *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
    v2 = (__CFString *)v0;
  else
    v2 = CFSTR("Unknown");
  objc_storeStrong((id *)&processName_processName, v2);

}

@end
