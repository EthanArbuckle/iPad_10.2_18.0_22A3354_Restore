@implementation AFAddPlaybackStateToQueue

void ___AFAddPlaybackStateToQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    AFStringFromMRPlaybackState(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "_AFAddPlaybackStateToQueue_block_invoke";
    v16 = 2048;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s group=%p MRMediaRemoteGetNowPlayingApplicationPlaybackState gave us state %@", (uint8_t *)&v14, 0x20u);

  }
  if ((_DWORD)a2 == 4)
  {
    v8 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(unsigned int *)(a1 + 48);
      v11 = v8;
      AFStringFromMRPlaybackState(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "_AFAddPlaybackStateToQueue_block_invoke";
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s group=%p Treating kMRPlaybackStateInterrupted as %@", (uint8_t *)&v14, 0x20u);

    }
    LODWORD(a2) = *(_DWORD *)(a1 + 48);
  }
  if ((a2 - 1) > 4)
    v13 = 0;
  else
    v13 = dword_19B0ED6DC[(int)a2 - 1];
  objc_msgSend(*(id *)(a1 + 40), "setState:", v13);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
