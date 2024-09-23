@implementation MPMusicPlayerGetBundleInfoPair

void ___MPMusicPlayerGetBundleInfoPair_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v0 = v15;
    objc_msgSend(v0, "bundleIdentifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "length"))
    {
      v2 = v1;
      v3 = (void *)_MPMusicPlayerGetBundleInfoPair___bundleIdentifier;
      _MPMusicPlayerGetBundleInfoPair___bundleIdentifier = (uint64_t)v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)_MPMusicPlayerGetBundleInfoPair___bundleIdentifier;
      _MPMusicPlayerGetBundleInfoPair___bundleIdentifier = v4;

    }
    objc_msgSend(v0, "shortVersionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "bundleVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "length");
    v9 = v6;
    if (v8 || (v10 = objc_msgSend(v7, "length"), v9 = v7, v10))
      objc_storeStrong((id *)&_MPMusicPlayerGetBundleInfoPair___bundleVersion, v9);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E31E5938);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (_MPMusicPlayerGetBundleInfoPair___bundleIdentifier && objc_msgSend(v11, "containsObject:"))
  {
    v13 = (void *)_MPMusicPlayerGetBundleInfoPair___bundleIdentifier;
    _MPMusicPlayerGetBundleInfoPair___bundleIdentifier = (uint64_t)&stru_1E3163D10;

    v14 = (void *)_MPMusicPlayerGetBundleInfoPair___bundleVersion;
    _MPMusicPlayerGetBundleInfoPair___bundleVersion = (uint64_t)&stru_1E3163D10;

  }
}

@end
