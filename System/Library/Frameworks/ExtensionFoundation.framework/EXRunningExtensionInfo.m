@implementation EXRunningExtensionInfo

void __52___EXRunningExtensionInfo_notifyExtensionMainCalled__block_invoke()
{
  s_extensionMainCalled = 1;
}

void __57___EXRunningExtensionInfo_extensionInfoForCurrentProcess__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_EXRunningExtensionInfo initForCurrentProcess]([_EXRunningExtensionInfo alloc], "initForCurrentProcess");
  v1 = (void *)extensionInfoForCurrentProcess_extensionForCurrentProcess;
  extensionInfoForCurrentProcess_extensionForCurrentProcess = (uint64_t)v0;

}

@end
