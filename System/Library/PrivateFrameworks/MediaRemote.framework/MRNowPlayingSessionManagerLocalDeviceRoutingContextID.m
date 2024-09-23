@implementation MRNowPlayingSessionManagerLocalDeviceRoutingContextID

void __MRNowPlayingSessionManagerLocalDeviceRoutingContextID_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)MRNowPlayingSessionManagerLocalDeviceRoutingContextID___lock;
  MRNowPlayingSessionManagerLocalDeviceRoutingContextID___lock = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("kMRDeviceInfoDidChangeNotification"), 0, 0, &__block_literal_global_54);

}

void __MRNowPlayingSessionManagerLocalDeviceRoutingContextID_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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

    objc_msgSend((id)MRNowPlayingSessionManagerLocalDeviceRoutingContextID___lock, "lock");
    v9 = (void *)MRNowPlayingSessionManagerLocalDeviceRoutingContextID___routingContextID;
    objc_msgSend(v8, "routingContextID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
      v11 = 0;
    else
      v11 = objc_msgSend(v9, "isEqual:", v10) ^ 1;

    objc_msgSend((id)MRNowPlayingSessionManagerLocalDeviceRoutingContextID___lock, "unlock");
    if (!v8 || v11)
    {
      _MRLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = CFSTR("MRNowPlayingSessionManagerLocalDeviceRoutingContextIDDidChange");
        _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("MRNowPlayingSessionManagerLocalDeviceRoutingContextIDDidChange"), 0);

    }
  }

}

@end
