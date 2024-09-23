@implementation NSBundle

void __44__NSBundle_DoNotDisturb__dnd_locationBundle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  BSSystemRootDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v6[1] = CFSTR("System");
  v6[2] = CFSTR("Library");
  v6[3] = CFSTR("LocationBundles");
  v6[4] = CFSTR("DoNotDisturb.bundle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPathComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnd_locationBundle_bundle;
  dnd_locationBundle_bundle = v4;

}

void __60__NSBundle_DoNotDisturb__dnd_doNotDisturbLocalizationBundle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  BSSystemRootDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v6[1] = CFSTR("System");
  v6[2] = CFSTR("Library");
  v6[3] = CFSTR("PrivateFrameworks");
  v6[4] = CFSTR("DoNotDisturb.framework");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPathComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dnd_doNotDisturbLocalizationBundle_bundle;
  dnd_doNotDisturbLocalizationBundle_bundle = v4;

}

@end
