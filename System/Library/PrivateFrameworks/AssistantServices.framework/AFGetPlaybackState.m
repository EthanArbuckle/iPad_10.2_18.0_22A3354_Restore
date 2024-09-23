@implementation AFGetPlaybackState

void ___AFGetPlaybackState_block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = ___AFGetPlaybackState_block_invoke_2;
  block[3] = &unk_1E3A36E10;
  v11 = v6;
  v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

uint64_t ___AFGetPlaybackState_block_invoke_92(uint64_t a1, int a2)
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "_AFGetPlaybackState_block_invoke";
    v8 = 1024;
    v9 = a2;
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s Done MRMediaRemoteGetNowPlayingApplicationPlaybackState() (state = %u)", (uint8_t *)&v6, 0x12u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___AFGetPlaybackState_block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2 || (v5 = (void *)a1[5]) == 0)
  {
    v3 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)a1[5];
      v8 = 136315650;
      v9 = "_AFGetPlaybackState_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v2;
      _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Failed -[MRNowPlayingController performRequestWithCompletion:] (response = %@, error = %@)", (uint8_t *)&v8, 0x20u);
    }
    return (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], 0);
  }
  else
  {
    v6 = AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315394;
      v9 = "_AFGetPlaybackState_block_invoke_2";
      v10 = 2112;
      v11 = v5;
      _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s Succeeded -[MRNowPlayingController performRequestWithCompletion:] (response = %@)", (uint8_t *)&v8, 0x16u);
      v5 = (void *)a1[5];
    }
    return (*(uint64_t (**)(_QWORD, uint64_t))(a1[6] + 16))(a1[6], objc_msgSend(v5, "playbackState"));
  }
}

@end
