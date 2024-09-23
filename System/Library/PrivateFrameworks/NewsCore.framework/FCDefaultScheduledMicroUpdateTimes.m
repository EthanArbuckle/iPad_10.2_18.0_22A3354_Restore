@implementation FCDefaultScheduledMicroUpdateTimes

void __FCDefaultScheduledMicroUpdateTimes_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  void *v4;

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contentStoreFrontID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("143441"));

  v3 = (void *)MEMORY[0x1E0C9AA70];
  v4 = (void *)_MergedGlobals_197;
  if (v2)
    v3 = &unk_1E470D470;
  _MergedGlobals_197 = (uint64_t)v3;

}

@end
