@implementation AFAddNowPlayingItemInfoToQueue

void ___AFAddNowPlayingItemInfoToQueue_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[4];
  const char *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D4C8E8]);

    if (v12 && ((v13 = objc_msgSend(v10, "code"), v13 == 35) || v13 == 4))
    {
      v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
        v71 = 2048;
        v72 = v15;
        _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s group=%p No NowPlaying info because nothing is playing right now.", buf, 0x16u);
      }
    }
    else
    {
      v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v49 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
        v71 = 2048;
        v72 = v49;
        v73 = 2112;
        v74 = (uint64_t)v10;
        _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, "%s group=%p Error getting NowPlaying queue %@", buf, 0x20u);
      }
    }
  }
  v17 = objc_msgSend(v8, "count");
  v18 = AFSiriLogContextDaemon;
  v50 = v10;
  if (!v17 && os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
    v71 = 2048;
    v72 = v19;
    _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, "%s group=%p no contentItems", buf, 0x16u);
    v18 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
    v71 = 2048;
    v72 = v20;
    v73 = 2048;
    v74 = v17;
    v75 = 2048;
    v76 = a3;
    _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, "%s group=%p contentItems has %lu items location %ld", buf, 0x2Au);
  }
  if (v17 >= 1)
  {
    v21 = 0;
    v55 = v8;
    v51 = a1;
    v52 = a3;
    v53 = v17;
    do
    {
      v22 = v21 + a3;
      v23 = objc_msgSend(v8, "objectAtIndex:", v21, v50);
      if (v21 + a3)
      {
        objc_msgSend(MEMORY[0x1E0D88248], "_af_mediaItemWithMRContentItemRef:", v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (v22 == 1)
        {
          v44 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            v45 = a3;
            v46 = *(_QWORD *)(a1 + 32);
            v47 = v44;
            objc_msgSend(v24, "title");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
            v71 = 2048;
            v72 = v46;
            a3 = v45;
            v8 = v55;
            v73 = 2112;
            v74 = (uint64_t)v48;
            _os_log_impl(&dword_19AF50000, v47, OS_LOG_TYPE_INFO, "%s group=%p next: %@", buf, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 40), "setNextListeningToItem:", v24);
        }
        else if (v22 == -1)
        {
          v25 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            v26 = a3;
            v27 = *(_QWORD *)(a1 + 32);
            v28 = v25;
            objc_msgSend(v24, "title");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v70 = "_AFAddNowPlayingItemInfoToQueue_block_invoke";
            v71 = 2048;
            v72 = v27;
            a3 = v26;
            v8 = v55;
            v73 = 2112;
            v74 = (uint64_t)v29;
            _os_log_impl(&dword_19AF50000, v28, OS_LOG_TYPE_INFO, "%s group=%p previous: %@", buf, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 40), "setPreviousListenedToItem:", v24);
        }
      }
      else
      {
        v30 = (void *)MRContentItemCopyNowPlayingInfo();
        v31 = *(_QWORD *)(a1 + 32);
        v24 = v30;
        v32 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          v33 = (void *)MEMORY[0x1E0CB37E8];
          v34 = v32;
          objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v70 = "_LogNowPlayingInfo";
          v71 = 2048;
          v72 = v31;
          v73 = 2112;
          v74 = (uint64_t)v35;
          _os_log_impl(&dword_19AF50000, v34, OS_LOG_TYPE_INFO, "%s group=%p got NowPlaying info with %@ keys:", buf, 0x20u);

        }
        v56 = v21;
        if (AFIsInternalInstall_onceToken != -1)
          dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
        if (AFIsInternalInstall_isInternal)
        {
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v54 = v24;
          v36 = v24;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v58;
            do
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v58 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
                objc_msgSend(v36, "objectForKey:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = AFSiriLogContextDaemon;
                if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v61 = 136315906;
                  v62 = "_LogNowPlayingInfo";
                  v63 = 2048;
                  v64 = v31;
                  v65 = 2112;
                  v66 = v41;
                  v67 = 2112;
                  v68 = v42;
                  _os_log_impl(&dword_19AF50000, v43, OS_LOG_TYPE_INFO, "%s %p         %@ -> %@:", v61, 0x2Au);
                }

              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, buf, 16);
            }
            while (v38);
          }

          v24 = v54;
          v8 = v55;
          a1 = v51;
          a3 = v52;
        }

        objc_msgSend(*(id *)(a1 + 40), "_af_setNowPlayingInfo:mediaType:", v24, MRContentItemGetMediaType());
        v17 = v53;
        v21 = v56;
      }

      ++v21;
    }
    while (v21 != v17);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
