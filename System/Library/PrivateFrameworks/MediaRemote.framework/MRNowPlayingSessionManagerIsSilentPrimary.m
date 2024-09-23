@implementation MRNowPlayingSessionManagerIsSilentPrimary

void __MRNowPlayingSessionManagerIsSilentPrimary_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)MRNowPlayingSessionManagerIsSilentPrimary___lock;
  MRNowPlayingSessionManagerIsSilentPrimary___lock = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("kMRDeviceInfoDidChangeNotification"), 0, 0, &__block_literal_global_60);

}

void __MRNowPlayingSessionManagerIsSilentPrimary_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  const char *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MRGetOriginFromUserInfo(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocal");

  if (v5)
  {
    objc_msgSend(v2, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MRGetDeviceInfoFromUserInfo(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)MRNowPlayingSessionManagerIsSilentPrimary___lock, "lock");
    v9 = objc_msgSend(v8, "isProxyGroupPlayer");
    v10 = MRNowPlayingSessionManagerIsSilentPrimary___isSilentPrimary;
    objc_msgSend((id)MRNowPlayingSessionManagerIsSilentPrimary___lock, "unlock");
    if (!v8 || v10 != v9)
    {
      _MRLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = CFSTR("MRNowPlayingSessionManagerIsSilentPrimaryDidChange");
        _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v13, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:object:", CFSTR("MRNowPlayingSessionManagerIsSilentPrimaryDidChange"), 0);

    }
  }

}

@end
