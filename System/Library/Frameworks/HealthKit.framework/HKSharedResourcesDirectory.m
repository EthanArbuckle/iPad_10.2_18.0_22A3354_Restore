@implementation HKSharedResourcesDirectory

void __HKSharedResourcesDirectory_block_invoke()
{
  void *v0;
  void *v1;
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("SIMULATOR_SHARED_RESOURCES_DIRECTORY"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v2 = v3;
  else
    v2 = CFSTR("/private/var/mobile/");
  objc_storeStrong((id *)&HKSharedResourcesDirectory_sharedResourcesDirectory, v2);

}

@end
