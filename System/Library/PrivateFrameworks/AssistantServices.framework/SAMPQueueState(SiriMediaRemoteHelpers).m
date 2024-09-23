@implementation SAMPQueueState(SiriMediaRemoteHelpers)

- (id)_mediaItemIdURLFromNowPlayingInfo:()SiriMediaRemoteHelpers
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  __CFString *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  AFGetCurrentItemAdamIDFromNowPlayingInfo(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("store");
    goto LABEL_3;
  }
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D4CA30]);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = CFSTR("external");
      goto LABEL_3;
    }
  }
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D4CB80]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_17:

    v6 = 0;
    v7 = 0;
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      v18 = 136315650;
      v19 = "_DeviceIdFromNowPlayingInfo";
      v20 = 2112;
      v21 = (id)objc_opt_class();
      v22 = 2112;
      v23 = v13;
      v17 = v21;
      _os_log_impl(&dword_19AF50000, v16, OS_LOG_TYPE_INFO, "%s Bad NowPlaying Info, kMRMediaRemoteNowPlayingInfoUniqueIdentifier gave unexpected item of class %@,  %@", (uint8_t *)&v18, 0x20u);

    }
    goto LABEL_17;
  }
  objc_msgSend(v13, "stringValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  if (v6)
    v7 = CFSTR("device");
  else
    v7 = 0;
LABEL_3:
  _AFMediaIdURLFromHostAndIdentifier(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_mediaTypeFromNowPlayingInfo:()SiriMediaRemoteHelpers
{
  void *v3;
  id *v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D4CAA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4CB70]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4C908]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4C910]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4C8F0]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0D88EA8];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4CB78]))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = (id *)MEMORY[0x1E0D88EB0];
  }
  v5 = *v4;
LABEL_7:

  return v5;
}

- (void)_af_setShuffleModeFromNowPlayingInfo:()SiriMediaRemoteHelpers
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D4CB08]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4 && (v5 = objc_msgSend(v4, "intValue") - 1, v5 <= 2))
    v6 = qword_1E3A34CA8[v5];
  else
    v6 = 0;
  objc_msgSend(a1, "setShuffleEnabled:", v6);

}

- (void)_af_setNowPlayingInfo:()SiriMediaRemoteHelpers mediaType:
{
  void *v6;
  void *v7;
  int v8;
  Class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  double v36;
  NSObject *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  _BYTE v60[24];
  void *v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  AFValidatedNowPlayingInfo(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CA50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = (Class *)0x1E0D881F0;
  if (!v8)
    v9 = (Class *)0x1E0D88248;
  v10 = objc_alloc_init(*v9);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CB40]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4C968]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlbum:", v12);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4C980]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setArtist:", v13);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4C9C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBrandIdentifier:", v14);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CA30]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExternalIdentifier:", v15);

  AFGetCurrentItemAdamIDFromNowPlayingInfo(v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdamIdentifier:", v17);

  switch(a4)
  {
    case 0:
      objc_msgSend(a1, "_mediaTypeFromNowPlayingInfo:", v6);
      v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
      objc_msgSend(v10, "setMediaType:", v19);
      goto LABEL_14;
    case 1:
      v18 = (id *)MEMORY[0x1E0D88EA8];
      goto LABEL_9;
    case 2:
      v18 = (id *)MEMORY[0x1E0D88EB0];
LABEL_9:
      v19 = *v18;
      goto LABEL_11;
  }
  v19 = 0;
LABEL_11:
  if (objc_msgSend(v19, "length"))
    goto LABEL_12;
  objc_msgSend(a1, "_mediaTypeFromNowPlayingInfo:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaType:", v20);

LABEL_14:
  objc_msgSend(a1, "_mediaItemIdURLFromNowPlayingInfo:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v21);

  v22 = objc_alloc_init(MEMORY[0x1E0D88270]);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CA18]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "doubleValue");
    v26 = v25;
    objc_msgSend(v22, "setDurationMillis:", (uint64_t)(v25 * 1000.0));
  }
  else
  {
    v26 = -1.0;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CA20]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (_QWORD *)MEMORY[0x1E0D4CAB0];
  if (v27)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CB38]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "timeIntervalSinceDate:", v29);
      v32 = v31;

      v33 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v60 = 136315394;
        *(_QWORD *)&v60[4] = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_setNowPlayingInfo:mediaType:]";
        *(_WORD *)&v60[12] = 2048;
        *(double *)&v60[14] = v32;
        _os_log_impl(&dword_19AF50000, v33, OS_LOG_TYPE_INFO, "%s infoToNowOffset = %g", v60, 0x16u);
      }
    }
    else
    {
      v32 = 0.0;
    }
    objc_msgSend(v6, "objectForKey:", *v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v60 = 136315394;
      *(_QWORD *)&v60[4] = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_setNowPlayingInfo:mediaType:]";
      *(_WORD *)&v60[12] = 2112;
      *(_QWORD *)&v60[14] = v34;
      _os_log_impl(&dword_19AF50000, v35, OS_LOG_TYPE_INFO, "%s playbackRate = %@", v60, 0x16u);
    }
    if (v34)
    {
      objc_msgSend(v34, "doubleValue");
      v32 = v32 * v36;
      v37 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v60 = 136315394;
        *(_QWORD *)&v60[4] = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_setNowPlayingInfo:mediaType:]";
        *(_WORD *)&v60[12] = 2048;
        *(double *)&v60[14] = v32;
        _os_log_impl(&dword_19AF50000, v37, OS_LOG_TYPE_INFO, "%s adjusted infoToNowOffset = %g", v60, 0x16u);
      }
    }
    objc_msgSend(v27, "doubleValue");
    v39 = v32 + v38;
    if (v39 >= v26)
      v40 = v26;
    else
      v40 = v39;
    if (v26 <= 0.0)
      v41 = v39;
    else
      v41 = v40;
    v42 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v60 = 136315394;
      *(_QWORD *)&v60[4] = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_setNowPlayingInfo:mediaType:]";
      *(_WORD *)&v60[12] = 2048;
      *(double *)&v60[14] = v41;
      _os_log_impl(&dword_19AF50000, v42, OS_LOG_TYPE_INFO, "%s calculatedElapsedTime = %g", v60, 0x16u);
    }
    objc_msgSend(v22, "setPlaybackPositionMillis:", (uint64_t)(v41 * 1000.0));

    v28 = (_QWORD *)MEMORY[0x1E0D4CAB0];
  }
  else if (!v24)
  {
    if ((v8 & 1) != 0)
      goto LABEL_44;
    goto LABEL_40;
  }
  objc_msgSend(v10, "setPlaybackInfo:", v22);
  if ((v8 & 1) != 0)
    goto LABEL_44;
LABEL_40:
  objc_msgSend(v10, "title");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43
    || (objc_msgSend(v10, "album"), (v43 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v10, "artist"), (v43 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v10, "identifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v59)
    {

      objc_msgSend(a1, "setListeningToItem:", 0);
      goto LABEL_48;
    }
  }
LABEL_44:
  objc_msgSend(a1, "setListeningToItem:", v10);
  if (v10)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CAD8]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = (_QWORD *)MEMORY[0x1E0D88DE0];
    if (!v44)
      v45 = (_QWORD *)MEMORY[0x1E0D88DD8];
    objc_msgSend(a1, "setSource:", *v45);
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CA90]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCurrentItemSteerable:", objc_msgSend(v46, "BOOLValue"));

  }
LABEL_48:
  v47 = objc_alloc_init(MEMORY[0x1E0D88268]);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CAD0]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setIndex:", objc_msgSend(v48, "unsignedIntegerValue"));
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4CB58]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setQueueSize:", objc_msgSend(v49, "unsignedIntegerValue"));
  objc_msgSend(a1, "setPlaybackQueuePosition:", v47);
  objc_msgSend(v6, "objectForKey:", *v28);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "doubleValue");
  v52 = v51;

  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v52);
  objc_msgSend(a1, "setPlaybackRate:", v53);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4C9E0]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "count"))
  {
    v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)v60 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v60[8] = 3221225472;
    *(_QWORD *)&v60[16] = ___ListeningToContainerFromNowPlayingInfo_block_invoke;
    v61 = &unk_1E3A34B58;
    v56 = v55;
    v62 = v56;
    objc_msgSend(v54, "enumerateKeysAndObjectsUsingBlock:", v60);

  }
  else
  {
    v57 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v60 = 136315138;
      *(_QWORD *)&v60[4] = "_ListeningToContainerFromNowPlayingInfo";
      _os_log_impl(&dword_19AF50000, v57, OS_LOG_TYPE_INFO, "%s No container info", v60, 0xCu);
    }
    v56 = 0;
  }

  objc_msgSend(a1, "setCurrentListeningToContainer:", v56);
  objc_msgSend(a1, "_af_setShuffleModeFromNowPlayingInfo:", v6);
  AFLanguageOptionsForNowPlayingInfo(v6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAudioAndSubtitleLanguageOptions:", v58);

}

- (void)_af_validateAndFinalize
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "applicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    if (objc_msgSend(a1, "state") == 1)
    {
      v3 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v8 = 136315138;
        v9 = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_validateAndFinalize]";
        _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s NowPlaying reports we are playing, but we have no ApplicationDisplayID for who is playing", (uint8_t *)&v8, 0xCu);
      }
    }
    objc_msgSend(a1, "listeningToItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v6 = v5;
        objc_msgSend(a1, "listeningToItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 136315394;
        v9 = "-[SAMPQueueState(SiriMediaRemoteHelpers) _af_validateAndFinalize]";
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s We have a NowPlaying listeningToItem but no ApplicationDisplayID for it %@", (uint8_t *)&v8, 0x16u);

      }
    }
    objc_msgSend(a1, "setState:", 3);
    objc_msgSend(a1, "setListeningToItem:", 0);
    objc_msgSend(a1, "setPlaybackQueuePosition:", 0);
    objc_msgSend(a1, "setSource:", 0);
    objc_msgSend(a1, "setPlaybackRate:", 0);
  }
}

@end
