@implementation MPCAssistantAvailability

- (int64_t)assistantStreamingGetAvailability
{
  return -[MPCAssistantAvailability assistantStreamingGetAvailability:](self, "assistantStreamingGetAvailability:", 0);
}

- (int64_t)assistantStreamingGetAvailability:(id)a3
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int IsWiFi;
  int IsWired;
  int IsCellular;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  int64_t v18;
  int v20;
  _BYTE v21[10];
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "Device supports streaming", (uint8_t *)&v20, 2u);
  }

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "networkType");

  IsWiFi = ICEnvironmentNetworkTypeIsWiFi();
  IsWired = ICEnvironmentNetworkTypeIsWired();
  IsCellular = ICEnvironmentNetworkTypeIsCellular();
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "preferredMusicLowBandwidthResolution");

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134217984;
    *(_QWORD *)v21 = v5;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "Network type: %ld", (uint8_t *)&v20, 0xCu);
  }

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109888;
    *(_DWORD *)v21 = IsWiFi;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = IsWired;
    v22 = 1024;
    v23 = IsCellular;
    v24 = 1024;
    v25 = v10 > 0;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "Wifi: %{BOOL}u Wired: %{BOOL}u Cellular: %{BOOL}u Allowed: %{BOOL}u", (uint8_t *)&v20, 0x1Au);
  }
  v13 = v10 > 0;

  if (IsWired | IsWiFi | IsCellular ^ 1)
    v14 = IsWired | IsWiFi;
  else
    v14 = v13;
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109120;
    *(_DWORD *)v21 = v14;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "Network streaming available: %{BOOL}u", (uint8_t *)&v20, 8u);
  }

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "Network connection is available", (uint8_t *)&v20, 2u);
    }
    v18 = 4;
  }
  else
  {
    if (v17)
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "No network connection available", (uint8_t *)&v20, 2u);
    }
    v18 = 1;
  }

  return v18;
}

- (void)assistantRadioGetAvailability:(id)a3
{
  -[MPCAssistantAvailability assistantRadioGetAvailability:completion:](self, "assistantRadioGetAvailability:completion:", 0, a3);
}

- (void)assistantRadioGetAvailability:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  const __CFString *v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD);
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int64_t v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v20 = -[MPCAssistantAvailability assistantStreamingGetAvailability:](self, "assistantStreamingGetAvailability:", *(unsigned int *)&a3);
  if (v18[3] == 4)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE7CBD0]);
    if (objc_msgSend(v7, "hasLoadedRadioAvailability"))
    {
      v8 = objc_msgSend(v7, "isRadioAvailable");
      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = v8;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "Using cached availability: %{BOOL}u", buf, 8u);
      }

      v10 = 4;
      if (!v8)
        v10 = 0;
      v18[3] = v10;
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v18[3] - 1;
        if (v12 > 3)
          v13 = CFSTR("MPCAssistantStreamingAvailabilityNone");
        else
          v13 = off_24CAB3A30[v12];
        *(_DWORD *)buf = 138543362;
        v22 = v13;
        _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "Radio availability: %{public}@", buf, 0xCu);
      }

      v6[2](v6, v18[3]);
    }
    else
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __69__MPCAssistantAvailability_assistantRadioGetAvailability_completion___block_invoke;
      v14[3] = &unk_24CAB3A10;
      v16 = &v17;
      v15 = v6;
      objc_msgSend(v7, "getRadioAvailabilityWithCompletionHandler:", v14);

    }
  }
  else
  {
    ((void (*)(void (**)(id, _QWORD)))v6[2])(v6);
  }
  _Block_object_dispose(&v17, 8);

}

void __69__MPCAssistantAvailability_assistantRadioGetAvailability_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "Error fetching radio availability: %{public}@", (uint8_t *)&v12, 0xCu);
    }

  }
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 67109120;
    LODWORD(v13) = a2;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "Using fetched availability: %{BOOL}u", (uint8_t *)&v12, 8u);
  }

  v8 = 4;
  if (!a2)
    v8 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) - 1;
    if (v10 > 3)
      v11 = CFSTR("MPCAssistantStreamingAvailabilityNone");
    else
      v11 = off_24CAB3A30[v10];
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "Radio availability: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
