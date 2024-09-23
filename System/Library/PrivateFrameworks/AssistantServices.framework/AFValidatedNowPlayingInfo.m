@implementation AFValidatedNowPlayingInfo

void __AFValidatedNowPlayingInfo_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
    }
    else
    {
      v7 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v8 = v7;
        v10 = 136315906;
        v11 = "AFValidatedNowPlayingInfo_block_invoke";
        v12 = 2112;
        v13 = a3;
        v14 = 2112;
        v15 = v5;
        v16 = 2112;
        v17 = (id)objc_opt_class();
        v9 = v17;
        _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s Bad NowPlaying Info, expected %@ for key %@ but got %@", (uint8_t *)&v10, 0x2Au);

      }
    }
  }

}

@end
