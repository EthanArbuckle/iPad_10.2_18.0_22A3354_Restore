@implementation MRNowPlayingPlayerResponse

- (BOOL)deviceHasPlayedRecently
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;

  -[MRNowPlayingPlayerResponse deviceLastPlayingDate](self, "deviceLastPlayingDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = -v3;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaRecentlyPlayedInterval");
  v7 = v6 > v4;

  return v7;
}

- (BOOL)playerHasPlayedRecently
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;

  -[MRNowPlayingPlayerResponse playerLastPlayingDate](self, "playerLastPlayingDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = -v3;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaRecentlyPlayedInterval");
  v7 = v6 > v4;

  return v7;
}

- (NSDate)playerLastPlayingDate
{
  NSDate *v3;
  NSDate *playerLastPlayingDate;

  if (MRMediaRemotePlaybackStateIsAdvancing(-[MRNowPlayingPlayerResponse playbackState](self, "playbackState")))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    playerLastPlayingDate = self->_playerLastPlayingDate;
    if (playerLastPlayingDate)
    {
      v3 = playerLastPlayingDate;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (NSDate)deviceLastPlayingDate
{
  void *v3;
  void *v4;
  void *v5;
  MRPlayerPath *v6;
  void *v7;
  void *v8;
  MRPlayerPath *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [MRPlayerPath alloc];
  -[MRNowPlayingPlayerResponse playerPath](self, "playerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MRPlayerPath initWithOrigin:client:player:](v6, "initWithOrigin:client:player:", v8, 0, 0);

  v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("[MRNowPlayingPlayerResponse deviceLastPlayingDate]"), v4);
  -[MRNowPlayingPlayerResponse playerPath](self, "playerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MRNowPlayingPlayerResponse playerPath](self, "playerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v10, "appendFormat:", CFSTR(" for %@"), v12);

  }
  _MRLogForCategory(0xAuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v10;
    _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v14 = (void *)MRGetSharedService();
  v47 = 0;
  MRMediaRemoteServiceGetLastPlayingDateForPlayerSync(v14, v9, &v47);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v47;
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15, "timeIntervalSinceNow");
  objc_msgSend(v18, "numberWithDouble:", -v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("deviceLastPlayingDate = %@. Time since playing = %@ seconds."), v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRNowPlayingPlayerResponse playerPath](self, "playerPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0xAuLL);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v16 && v21)
  {
    v25 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v25)
      {
        -[MRNowPlayingPlayerResponse playerPath](self, "playerPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceDate:", v5);
        *(_DWORD *)buf = 138544386;
        v49 = CFSTR("[MRNowPlayingPlayerResponse deviceLastPlayingDate]");
        v50 = 2114;
        v51 = v4;
        v52 = 2112;
        v53 = v21;
        v54 = 2114;
        v55 = v26;
        v56 = 2048;
        v57 = v28;
        v29 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v30 = v24;
        v31 = 52;
LABEL_17:
        _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);

LABEL_25:
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    if (!v25)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", v5);
    *(_DWORD *)buf = 138544130;
    v49 = CFSTR("[MRNowPlayingPlayerResponse deviceLastPlayingDate]");
    v50 = 2114;
    v51 = v4;
    v52 = 2112;
    v53 = v21;
    v54 = 2048;
    v55 = v38;
    v39 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v40 = v24;
    v41 = 42;
    goto LABEL_24;
  }
  if (!v16)
  {
    v36 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v36)
      {
        -[MRNowPlayingPlayerResponse playerPath](self, "playerPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceDate:", v5);
        *(_DWORD *)buf = 138544130;
        v49 = CFSTR("[MRNowPlayingPlayerResponse deviceLastPlayingDate]");
        v50 = 2114;
        v51 = v4;
        v52 = 2114;
        v53 = v26;
        v54 = 2048;
        v55 = v37;
        v29 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v30 = v24;
        v31 = 42;
        goto LABEL_17;
      }
LABEL_26:

      v42 = v15;
      goto LABEL_27;
    }
    if (!v36)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", v5);
    *(_DWORD *)buf = 138543874;
    v49 = CFSTR("[MRNowPlayingPlayerResponse deviceLastPlayingDate]");
    v50 = 2114;
    v51 = v4;
    v52 = 2048;
    v53 = v43;
    v39 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v40 = v24;
    v41 = 32;
LABEL_24:
    _os_log_impl(&dword_193827000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
    goto LABEL_25;
  }
  v32 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
  if (v22)
  {
    if (v32)
    {
      -[MRNowPlayingPlayerResponse playerPath](self, "playerPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", v5);
      *(_DWORD *)buf = 138544386;
      v49 = CFSTR("[MRNowPlayingPlayerResponse deviceLastPlayingDate]");
      v50 = 2114;
      v51 = v4;
      v52 = 2114;
      v53 = v16;
      v54 = 2114;
      v55 = v33;
      v56 = 2048;
      v57 = v35;
      _os_log_error_impl(&dword_193827000, v24, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

LABEL_29:
    }
  }
  else if (v32)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeIntervalSinceDate:", v5);
    *(_DWORD *)buf = 138544130;
    v49 = CFSTR("[MRNowPlayingPlayerResponse deviceLastPlayingDate]");
    v50 = 2114;
    v51 = v4;
    v52 = 2114;
    v53 = v16;
    v54 = 2048;
    v55 = v46;
    _os_log_error_impl(&dword_193827000, v24, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
    goto LABEL_29;
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
  v44 = v42;

  return (NSDate *)v44;
}

- (NSArray)proxiableSupportedCommands
{
  void *v2;
  void *v3;

  -[MRNowPlayingPlayerResponse supportedCommands](self, "supportedCommands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mr_filter:", &__block_literal_global_90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

BOOL __56__MRNowPlayingPlayerResponse_proxiableSupportedCommands__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoDoNotProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (int)shuffleMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[MRNowPlayingPlayerResponse supportedCommands](self, "supportedCommands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_20_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoShuffleMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  return v6;
}

BOOL __41__MRNowPlayingPlayerResponse_shuffleMode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "command") == 26 || objc_msgSend(v2, "command") == 6;

  return v3;
}

- (int)repeatMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[MRNowPlayingPlayerResponse supportedCommands](self, "supportedCommands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_21_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoRepeatMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  return v6;
}

BOOL __40__MRNowPlayingPlayerResponse_repeatMode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "command") == 25 || objc_msgSend(v2, "command") == 7;

  return v3;
}

- (float)playbackRate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  -[MRNowPlayingPlayerResponse playbackQueue](self, "playbackQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackRate");
  v7 = v6;

  return v7;
}

- (MRPlayerPath)playerPath
{
  void *v2;
  void *v3;

  -[MRNowPlayingPlayerResponse destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRPlayerPath *)v3;
}

- (void)setPlayerPath:(id)a3
{
  id v4;
  MRDestination *v5;

  v4 = a3;
  v5 = -[MRDestination initWithPlayerPath:]([MRDestination alloc], "initWithPlayerPath:", v4);

  -[MRNowPlayingPlayerResponse setDestination:](self, "setDestination:", v5);
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRNowPlayingPlayerResponse playerPath](self, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("playerPath"));

  -[MRNowPlayingPlayerResponse playbackQueue](self, "playbackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("queueIdentifier"));

  -[MRNowPlayingPlayerResponse playbackQueue](self, "playbackQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("queueProperties"));

  -[MRNowPlayingPlayerResponse playbackQueue](self, "playbackQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auxiliaryNowPlayingInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("auxiliaryNowPlayingInfo"));

  -[MRNowPlayingPlayerResponse playbackQueue](self, "playbackQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "hasLocation");

  if ((_DWORD)v10)
  {
    -[MRNowPlayingPlayerResponse playbackQueue](self, "playbackQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentItemWithOffset:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = MRContentItemCopyMinimalReadableDescription(v13);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("nowPlayingItemIdentifier"));

      v15 = (void *)MEMORY[0x1E0CB37E8];
      -[MRNowPlayingPlayerResponse playbackRate](self, "playbackRate");
      objc_msgSend(v15, "numberWithFloat:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("playbackRate"));

      objc_msgSend(v13, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("title"));

    }
  }
  -[MRNowPlayingPlayerResponse supportedCommands](self, "supportedCommands");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[MRNowPlayingPlayerResponse supportedCommands](self, "supportedCommands");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("supportedCommandsCount"));

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[MRNowPlayingPlayerResponse supportedCommands](self, "supportedCommands", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      v27 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v29, "command") == 133 && objc_msgSend(v29, "isEnabled"))
          {
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("migrationEnabled"));
            objc_msgSend(v29, "options");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("migrationTypes"));

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v25);
    }

  }
  if (self->_playerLastPlayingDate)
  {
    -[MRNowPlayingPlayerResponse playerLastPlayingDate](self, "playerLastPlayingDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("playerLastPlayingDate"));

  }
  if (-[MRNowPlayingPlayerResponse playbackState](self, "playbackState"))
  {
    v32 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(-[MRNowPlayingPlayerResponse playbackState](self, "playbackState"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("playbackState"));

  }
  -[MRNowPlayingPlayerResponse clientProperties](self, "clientProperties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("clientProperties"));

  if (-[MRNowPlayingPlayerResponse repeatMode](self, "repeatMode") >= 1)
  {
    v34 = (__CFString *)MRMediaRemoteCopyRepeatModeDescription(-[MRNowPlayingPlayerResponse repeatMode](self, "repeatMode"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("repeatMode"));

  }
  if (-[MRNowPlayingPlayerResponse shuffleMode](self, "shuffleMode") >= 1)
  {
    v35 = (__CFString *)MRMediaRemoteCopyShuffleModeDescription(-[MRNowPlayingPlayerResponse shuffleMode](self, "shuffleMode"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("shuffleMode"));

  }
  return v3;
}

- (id)debugDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MRNowPlayingPlayerResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MRNowPlayingPlayerResponse playbackQueue](self, "playbackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("playbackQueue"));

  -[MRNowPlayingPlayerResponse supportedCommands](self, "supportedCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("supportedCommands"));

  return v4;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRNowPlayingPlayerResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRNowPlayingPlayerResponse debugDictionaryRepresentation](self, "debugDictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRNowPlayingPlayerResponse destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDestination:", v7);

  -[MRNowPlayingPlayerResponse supportedCommands](self, "supportedCommands");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setSupportedCommands:", v9);

  objc_msgSend(v5, "setPlaybackState:", -[MRNowPlayingPlayerResponse playbackState](self, "playbackState"));
  -[MRNowPlayingPlayerResponse playbackQueue](self, "playbackQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlaybackQueue:", v11);

  -[MRNowPlayingPlayerResponse playerLastPlayingDate](self, "playerLastPlayingDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlayerLastPlayingDate:", v13);

  -[MRNowPlayingPlayerResponse clientProperties](self, "clientProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setClientProperties:", v15);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MRPlaybackQueue *playbackQueue;
  void *v5;
  id v6;

  playbackQueue = self->_playbackQueue;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", playbackQueue, CFSTR("playbackQueue"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_destination, CFSTR("destination"));
  objc_msgSend(v6, "encodeInt:forKey:", self->_playbackState, CFSTR("playbackState"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_playerLastPlayingDate, CFSTR("playerLastPlayingDate"));
  +[MRCommandInfo dataFromCommandInfos:](MRCommandInfo, "dataFromCommandInfos:", self->_supportedCommands);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("supportedCommandsData"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_clientProperties, CFSTR("clientProperties"));
}

- (MRNowPlayingPlayerResponse)initWithCoder:(id)a3
{
  id v4;
  MRNowPlayingPlayerResponse *v5;
  uint64_t v6;
  MRPlaybackQueue *playbackQueue;
  uint64_t v8;
  MRDestination *destination;
  uint64_t v10;
  NSDate *playerLastPlayingDate;
  void *v12;
  uint64_t v13;
  NSArray *supportedCommands;
  uint64_t v15;
  MRClient *clientProperties;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRNowPlayingPlayerResponse;
  v5 = -[MRNowPlayingPlayerResponse init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playbackQueue"));
    v6 = objc_claimAutoreleasedReturnValue();
    playbackQueue = v5->_playbackQueue;
    v5->_playbackQueue = (MRPlaybackQueue *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destination"));
    v8 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (MRDestination *)v8;

    v5->_playbackState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("playbackState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playerLastPlayingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    playerLastPlayingDate = v5->_playerLastPlayingDate;
    v5->_playerLastPlayingDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportedCommandsData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRCommandInfo commandInfosFromData:](MRCommandInfo, "commandInfosFromData:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    supportedCommands = v5->_supportedCommands;
    v5->_supportedCommands = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientProperties"));
    v15 = objc_claimAutoreleasedReturnValue();
    clientProperties = v5->_clientProperties;
    v5->_clientProperties = (MRClient *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MRPlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (void)setPlaybackQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(unsigned int)a3
{
  self->_playbackState = a3;
}

- (MRClient)clientProperties
{
  return self->_clientProperties;
}

- (void)setClientProperties:(id)a3
{
  objc_storeStrong((id *)&self->_clientProperties, a3);
}

- (void)setDeviceLastPlayingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setPlayerLastPlayingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerLastPlayingDate, 0);
  objc_storeStrong((id *)&self->_deviceLastPlayingDate, 0);
  objc_storeStrong((id *)&self->_clientProperties, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
