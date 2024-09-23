@implementation BRRuntimeBehavior

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_18);
  return isInternalBuild_isInternalBuild;
}

uint64_t __36__BRRuntimeBehavior_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  isInternalBuild_isInternalBuild = result;
  return result;
}

+ (BOOL)isSeedBuild
{
  if (isSeedBuild_onceToken != -1)
    dispatch_once(&isSeedBuild_onceToken, &__block_literal_global_2);
  return isSeedBuild_isSeedBuild;
}

void __32__BRRuntimeBehavior_isSeedBuild__block_invoke()
{
  void *v0;
  id v1;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2050000000;
  v0 = (void *)getSDBuildInfoClass_softClass;
  v6 = getSDBuildInfoClass_softClass;
  if (!getSDBuildInfoClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getSDBuildInfoClass_block_invoke;
    v2[3] = &unk_1E3DA6310;
    v2[4] = &v3;
    __getSDBuildInfoClass_block_invoke((uint64_t)v2);
    v0 = (void *)v4[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v3, 8);
  if (v1)
    isSeedBuild_isSeedBuild = objc_msgSend(v1, "currentBuildIsSeed");
}

+ (BOOL)isRunningInDaemonBundle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.bird"));
  return (char)v2;
}

+ (BOOL)isRunningOnMacOS
{
  return 0;
}

+ (BOOL)isRunningOnIOS
{
  return 1;
}

@end
