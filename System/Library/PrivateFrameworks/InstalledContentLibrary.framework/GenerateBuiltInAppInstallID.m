@implementation GenerateBuiltInAppInstallID

void ___GenerateBuiltInAppInstallID_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)_CFCopySystemVersionDictionary();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v0, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_GenerateBuiltInAppInstallID_osVersion;
  _GenerateBuiltInAppInstallID_osVersion = v2;

}

@end
