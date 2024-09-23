@implementation NTKIsSystemAppAlwaysPresent

void ___NTKIsSystemAppAlwaysPresent_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6CA9A60);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKIsSystemAppAlwaysPresent___alwaysPresentAppBundleIdentifiers;
  _NTKIsSystemAppAlwaysPresent___alwaysPresentAppBundleIdentifiers = v0;

}

@end
