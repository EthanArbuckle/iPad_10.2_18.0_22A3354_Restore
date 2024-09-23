@implementation AFGetNowPlayingInfoDictionary

void ___AFGetNowPlayingInfoDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = ___AFGetNowPlayingInfoDictionary_block_invoke_2;
  block[3] = &unk_1E3A36E10;
  v11 = v5;
  v12 = v6;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

void ___AFGetNowPlayingInfoDictionary_block_invoke_96(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;

  v7 = a5;
  objc_msgSend(a2, "firstObject");
  v8 = (id)MRContentItemCopyNowPlayingInfo();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void ___AFGetNowPlayingInfoDictionary_block_invoke_2(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2 && !a1[5])
  {
    objc_msgSend(v2, "playbackQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v6 = a1[6];
    objc_msgSend(v9, "nowPlayingInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[5];
      *(_DWORD *)buf = 136315394;
      v11 = "_AFGetNowPlayingInfoDictionary_block_invoke_2";
      v12 = 2112;
      v13 = v8;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Failed to get response: %@", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

@end
