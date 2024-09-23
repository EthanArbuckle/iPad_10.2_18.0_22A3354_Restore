@implementation MNAudioSystemOptions

- (MNAudioSystemOptions)initWithTempUserOptions:(id)a3
{
  MNAudioSystemOptions *v3;
  uint64_t v4;
  GEOObserverHashTable *observers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *guidanceLevels;
  void *v13;
  NSObject *v14;
  MNAudioSystemOptions *v15;
  objc_super v17;
  uint8_t buf[4];
  MNAudioSystemOptions *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)MNAudioSystemOptions;
  v3 = -[MNAudioSystemOptions init](&v17, sel_init, a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D272B8]), "initWithProtocol:queue:", &unk_1EEED6258, 0);
    observers = v3->_observers;
    v3->_observers = (GEOObserverHashTable *)v4;

    v6 = (void *)MEMORY[0x1E0C99E08];
    v20[0] = &unk_1E620F128;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", GEOConfigGetInteger());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    v20[1] = &unk_1E620F140;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", GEOConfigGetInteger());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    v20[2] = &unk_1E620F158;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", GEOConfigGetInteger());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    guidanceLevels = v3->_guidanceLevels;
    v3->_guidanceLevels = (NSMutableDictionary *)v11;

    v3->_useHFP = GEOConfigGetBOOL();
    v3->_pauseSpokenAudio = GEOConfigGetBOOL();
    v13 = (void *)MEMORY[0x1E0C80D38];
    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    _GEOConfigAddDelegateListenerForKey();
    GetAudioLogForMNAudioSystemOptionsCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEFAULT, "Initializing audio system options: %@", buf, 0xCu);
    }

    v15 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)MNAudioSystemOptions;
  -[MNAudioSystemOptions dealloc](&v3, sel_dealloc);
}

- (unint64_t)guidanceLevelForTransportType:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *guidanceLevelOverrides;
  void *v6;
  void *v7;
  unint64_t v8;
  NSMutableDictionary *guidanceLevels;
  void *v10;
  void *v11;

  v3 = *(_QWORD *)&a3;
  guidanceLevelOverrides = self->_guidanceLevelOverrides;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](guidanceLevelOverrides, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
  }
  else
  {
    guidanceLevels = self->_guidanceLevels;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](guidanceLevels, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v8 = objc_msgSend(v11, "integerValue");
    else
      v8 = 0;

  }
  return v8;
}

- (void)setGuidanceLevelOverride:(unint64_t)a3 transportType:(int)a4
{
  uint64_t v4;
  unint64_t v7;
  NSMutableDictionary *guidanceLevelOverrides;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  unint64_t v14;

  v4 = *(_QWORD *)&a4;
  v7 = -[MNAudioSystemOptions guidanceLevelForTransportType:](self, "guidanceLevelForTransportType:", *(_QWORD *)&a4);
  guidanceLevelOverrides = self->_guidanceLevelOverrides;
  if (a3 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](guidanceLevelOverrides, "removeObjectForKey:", v11);
  }
  else
  {
    if (!guidanceLevelOverrides)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v10 = self->_guidanceLevelOverrides;
      self->_guidanceLevelOverrides = v9;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_guidanceLevelOverrides;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  v14 = -[MNAudioSystemOptions guidanceLevelForTransportType:](self, "guidanceLevelForTransportType:", v4);
  if (v14 != v7)
    -[GEOObserverHashTable audioSystemOptions:didChangeGuidanceLevel:transportType:](self->_observers, "audioSystemOptions:didChangeGuidanceLevel:transportType:", self, v14, v4);
}

- (void)registerObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)unregisterObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceLevelOverrides, "objectForKeyedSubscript:", &unk_1E620F128);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceLevels, "objectForKeyedSubscript:", &unk_1E620F128);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = v7 + 1;
  if (v4)
  {
    if (v8 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E61D32B0[v8];
    }
    v10 = objc_msgSend(v4, "unsignedIntegerValue");
    if ((unint64_t)(v10 + 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E61D32B0[v10 + 1];
    }
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Driving guidance level: %@ | Override: %@"), v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  else
  {
    if (v8 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E61D32B0[v8];
    }
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Driving guidance level: %@"), v9);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceLevelOverrides, "objectForKeyedSubscript:", &unk_1E620F140);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceLevels, "objectForKeyedSubscript:", &unk_1E620F140);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");
  v17 = v16 + 1;
  if (v13)
  {
    if ((unint64_t)(v16 + 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E61D32B0[v17];
    }
    v19 = objc_msgSend(v13, "unsignedIntegerValue");
    if ((unint64_t)(v19 + 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E61D32B0[v19 + 1];
    }
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Walking guidance level: %@ | Override: %@"), v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  else
  {
    if ((unint64_t)(v16 + 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E61D32B0[v17];
    }
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Walking guidance level: %@"), v18);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceLevelOverrides, "objectForKeyedSubscript:", &unk_1E620F158);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3940];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_guidanceLevels, "objectForKeyedSubscript:", &unk_1E620F158);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "unsignedIntegerValue");
  v26 = v25 + 1;
  if (v22)
  {
    if ((unint64_t)(v25 + 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v25);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E61D32B0[v26];
    }
    v28 = objc_msgSend(v22, "unsignedIntegerValue");
    if ((unint64_t)(v28 + 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E61D32B0[v28 + 1];
    }
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Cycling guidance level: %@ | Override: %@"), v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  else
  {
    if ((unint64_t)(v25 + 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v25);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E61D32B0[v26];
    }
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Cycling guidance level: %@"), v27);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use HFP: %d"), self->_useHFP);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Pause Spoken Audio: %d"), self->_pauseSpokenAudio);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  v33 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n\t"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("MNAudioSystemOptions:\n\t%@"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v35;
}

- (void)_updateGuidanceLevelFromUserSetting:(unint64_t)a3 transportType:(int)a4
{
  uint64_t v4;
  unint64_t v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  NSMutableDictionary *guidanceLevels;
  void *v16;
  NSMutableDictionary *guidanceLevelOverrides;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = -[MNAudioSystemOptions guidanceLevelForTransportType:](self, "guidanceLevelForTransportType:", *(_QWORD *)&a4);
  GetAudioLogForMNAudioSystemOptionsCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E61D3278[(int)v4];
    }
    v10 = v9;
    if (v7 + 1 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v7);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E61D32B0[v7 + 1];
    }
    v12 = v11;
    if (a3 + 1 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN: %lu"), a3);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E61D32B0[a3 + 1];
    }
    *(_DWORD *)buf = 138412802;
    v20 = v10;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Guidance level for \"%@\" changed from %@ to %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  guidanceLevels = self->_guidanceLevels;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](guidanceLevels, "setObject:forKeyedSubscript:", v14, v16);

  guidanceLevelOverrides = self->_guidanceLevelOverrides;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](guidanceLevelOverrides, "removeObjectForKey:", v18);

  if (v7 != a3)
    -[GEOObserverHashTable audioSystemOptions:didChangeGuidanceLevel:transportType:](self->_observers, "audioSystemOptions:didChangeGuidanceLevel:transportType:", self, a3, v4);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  uint64_t v9;
  NSObject *v10;
  _BOOL4 pauseSpokenAudio;
  uint64_t Integer;
  MNAudioSystemOptions *v13;
  uint64_t v14;
  uint64_t BOOL;
  NSObject *v16;
  _BOOL4 useHFP;
  int v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3.var0 == (_DWORD)NavigationConfig_SpokenGuidanceLevel_Driving && a3.var1 == off_1EEECA620)
  {
    Integer = GEOConfigGetInteger();
    v13 = self;
    v14 = 0;
LABEL_28:
    -[MNAudioSystemOptions _updateGuidanceLevelFromUserSetting:transportType:](v13, "_updateGuidanceLevelFromUserSetting:transportType:", Integer, v14);
    return;
  }
  if (a3.var0 == (_DWORD)NavigationConfig_SpokenGuidanceLevel_Walking && a3.var1 == off_1EEECA630)
  {
    Integer = GEOConfigGetInteger();
    v13 = self;
    v14 = 2;
    goto LABEL_28;
  }
  if (a3.var0 == (_DWORD)NavigationConfig_SpokenGuidanceLevel_Cycling && a3.var1 == off_1EEECA640)
  {
    Integer = GEOConfigGetInteger();
    v13 = self;
    v14 = 3;
    goto LABEL_28;
  }
  if (a3.var0 == (_DWORD)NavigationConfig_SpokenGuidanceUseHFP && a3.var1 == off_1EEECA660)
  {
    BOOL = GEOConfigGetBOOL();
    GetAudioLogForMNAudioSystemOptionsCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      useHFP = self->_useHFP;
      v18 = 67109376;
      v19 = useHFP;
      v20 = 1024;
      v21 = BOOL;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEFAULT, "UseHFP changed from %d to %d", (uint8_t *)&v18, 0xEu);
    }

    self->_useHFP = BOOL;
    -[GEOObserverHashTable audioSystemOptions:didUpdateUseHFP:](self->_observers, "audioSystemOptions:didUpdateUseHFP:", self, BOOL);
  }
  else if (a3.var0 == (_DWORD)NavigationConfig_SpokenGuidancePauseSpokenAudio && a3.var1 == off_1EEECA650)
  {
    v9 = GEOConfigGetBOOL();
    GetAudioLogForMNAudioSystemOptionsCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      pauseSpokenAudio = self->_pauseSpokenAudio;
      v18 = 67109376;
      v19 = pauseSpokenAudio;
      v20 = 1024;
      v21 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_DEFAULT, "UseHFP changed from %d to %d", (uint8_t *)&v18, 0xEu);
    }

    self->_pauseSpokenAudio = v9;
    -[GEOObserverHashTable audioSystemOptions:didUpdatePauseSpokenAudio:](self->_observers, "audioSystemOptions:didUpdatePauseSpokenAudio:", self, v9);
  }
}

- (BOOL)useHFP
{
  return self->_useHFP;
}

- (BOOL)pauseSpokenAudio
{
  return self->_pauseSpokenAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceLevelOverrides, 0);
  objc_storeStrong((id *)&self->_guidanceLevels, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
