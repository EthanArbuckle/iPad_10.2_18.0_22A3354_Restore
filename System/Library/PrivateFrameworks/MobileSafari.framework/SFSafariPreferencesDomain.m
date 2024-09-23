@implementation SFSafariPreferencesDomain

void ___SFSafariPreferencesDomain_block_invoke()
{
  int v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v7, "safari_currentProcessIsContainerized");

  if (v0)
  {
    v1 = (id)*MEMORY[0x1E0D8A010];
    v2 = (void *)_SFSafariPreferencesDomain::domain;
    _SFSafariPreferencesDomain::domain = (uint64_t)v1;
  }
  else
  {
    _SFSafariContainerPath();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      _SFSafariContainerPath();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library/Preferences/com.apple.mobilesafari"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)_SFSafariPreferencesDomain::domain;
      _SFSafariPreferencesDomain::domain = v4;

    }
    else
    {
      v6 = (id)*MEMORY[0x1E0D8A010];
      v3 = (void *)_SFSafariPreferencesDomain::domain;
      _SFSafariPreferencesDomain::domain = (uint64_t)v6;
    }

    v2 = v8;
  }

}

@end
