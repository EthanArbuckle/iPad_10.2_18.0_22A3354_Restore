@implementation ARCrashReporterKey

void __ARCrashReporterKey_block_invoke()
{
  uint64_t v0;
  void *v1;

  if (ARInternalOSBuild_onceToken != -1)
    dispatch_once(&ARInternalOSBuild_onceToken, &__block_literal_global_11);
  if (ARInternalOSBuild_internalVersion)
  {
    v0 = MGCopyAnswer();
    v1 = (void *)ARCrashReporterKey_crashReporterKey;
    ARCrashReporterKey_crashReporterKey = v0;

  }
}

@end
