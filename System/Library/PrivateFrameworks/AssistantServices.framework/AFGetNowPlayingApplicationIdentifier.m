@implementation AFGetNowPlayingApplicationIdentifier

void ___AFGetNowPlayingApplicationIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___AFGetNowPlayingApplicationIdentifier_block_invoke_2;
  block[3] = &unk_1E3A36E10;
  v11 = v5;
  v12 = v6;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void ___AFGetNowPlayingApplicationIdentifier_block_invoke_94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    MRNowPlayingClientGetBundleIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v6 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v7 = 136315394;
        v8 = "_AFGetNowPlayingApplicationIdentifier_block_invoke";
        v9 = 2112;
        v10 = a3;
        _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s MRMediaRemoteGetNowPlayingClient failed with error %@", (uint8_t *)&v7, 0x16u);
      }
    }
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void ___AFGetNowPlayingApplicationIdentifier_block_invoke_2(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2 && !a1[5])
  {
    v4 = a1[6];
    objc_msgSend(v2, "playerPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
  else
  {
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      *(_DWORD *)buf = 136315394;
      v10 = "_AFGetNowPlayingApplicationIdentifier_block_invoke_2";
      v11 = 2112;
      v12 = v7;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Failed to get response: %@", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

@end
