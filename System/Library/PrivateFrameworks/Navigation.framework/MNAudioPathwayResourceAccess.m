@implementation MNAudioPathwayResourceAccess

- (MNAudioPathwayResourceAccess)initWithHFPEnabled:(BOOL)a3
{
  MNAudioPathwayResourceAccess *v4;
  MNAudioPathwayResourceAccess *v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *pickableRoutesQueue;
  MNAudioPathwayResourceAccess *v11;
  objc_super v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MNAudioPathwayResourceAccess;
  v4 = -[MNAudioPathwayResourceAccess init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_enableHFPUse = a3;
    GetAudioLogForMNAudioPathwayResourceAccessCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (v5->_enableHFPUse)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_INFO, "ⓟ Initialization : enableHFP=%@", buf, 0xCu);
    }

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.Navigation.PickableRoutesQueue", v8);
    pickableRoutesQueue = v5->_pickableRoutesQueue;
    v5->_pickableRoutesQueue = (OS_dispatch_queue *)v9;

    if (v5->_enableHFPUse)
      -[MNAudioPathwayResourceAccess _updateHFPRoute](v5, "_updateHFPRoute");
    -[MNAudioPathwayResourceAccess _registerForObservation](v5, "_registerForObservation");
    v11 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[MNAudioPathwayResourceAccess setHfpRoute:](self, "setHfpRoute:", 0);
  -[MNAudioPathwayResourceAccess setWantsVolumeControl:](self, "setWantsVolumeControl:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MNAudioPathwayResourceAccess;
  -[MNAudioPathwayResourceAccess dealloc](&v3, sel_dealloc);
}

- (void)_registerForObservation
{
  NSObject *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  GetAudioLogForMNAudioPathwayResourceAccessCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "ⓟ Registering for observation", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)MEMORY[0x1E0D48048];
  v26[0] = *MEMORY[0x1E0D48048];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (uint64_t *)MEMORY[0x1E0D48280];
  v8 = *MEMORY[0x1E0D48280];
  v19 = 0;
  objc_msgSend(v4, "setAttribute:forKey:error:", v6, v8, &v19);
  v9 = v19;
  GetAudioLogForMNAudioPathwayResourceAccessCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = *v7;
      *(_DWORD *)buf = 138412802;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v9;
      v13 = "⒫    Error setting attribute for %@ : attributes %@ : error %@";
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_8:
      _os_log_impl(&dword_1B0AD7000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v17 = *v7;
    *(_DWORD *)buf = 138412546;
    v21 = v17;
    v22 = 2112;
    v23 = v6;
    v13 = "ⓟ    Setting attributes for %@ was successful : attributes %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 22;
    goto LABEL_8;
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__mediaServerConnectionDied, *MEMORY[0x1E0D48200], v4);
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__pickableRoutesChanged, *v5, v4);

}

- (void)_unregisterForObservation
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  GetAudioLogForMNAudioPathwayResourceAccessCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "ⓟ Unregistering from observation", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", 0, *MEMORY[0x1E0D48280], 0);

}

- (void)registerObserver:(id)a3
{
  char *v4;
  char *v5;
  NSObject *v6;
  MNObserverHashTable *v7;
  MNObserverHashTable *observers;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EEF09640) & 1) != 0)
    {
      if (!self->_observers)
      {
        GetAudioLogForMNAudioPathwayResourceAccessCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "ⓟ Creating observer table", buf, 2u);
        }

        v7 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEF09640);
        observers = self->_observers;
        self->_observers = v7;

      }
      GetAudioLogForMNAudioPathwayResourceAccessCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v5;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEBUG, "ⓟ Adding observer : %@", buf, 0xCu);
      }

      -[MNObserverHashTable registerObserver:](self->_observers, "registerObserver:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("⒫ object isn't a MNAudioPathwayResourceAccessObserver : %@"), v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "0";
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }

    }
  }

}

- (void)unregisterObserver:(id)a3
{
  char *v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  void *observers;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EEF09640) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("⒫ object isn't a MNAudioPathwayResourceAccessObserver : %@"), v5);
      observers = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "0";
        v12 = 2112;
        v13 = observers;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", buf, 0x16u);
      }

      goto LABEL_12;
    }
    GetAudioLogForMNAudioPathwayResourceAccessCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_DEBUG, "ⓟ Removing observer : %@", buf, 0xCu);
    }

    -[MNObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v5);
    if (!-[MNObserverHashTable hasObservers](self->_observers, "hasObservers"))
    {
      GetAudioLogForMNAudioPathwayResourceAccessCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEBUG, "ⓟ Observer table empty; destroying", buf, 2u);
      }

      observers = self->_observers;
      self->_observers = 0;
LABEL_12:

    }
  }

}

- (void)setHfpRoute:(id)a3
{
  NSDictionary *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSDictionary *hfpRoute;
  void *v11;
  char v12;
  NSObject *v13;
  NSDictionary *v14;
  int v15;
  NSDictionary *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (NSDictionary *)a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "setBTHFPRoute:availableForVoicePrompts:", v5, 1);

    GetAudioLogForMNAudioPathwayResourceAccessCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_INFO, "ⓟ Setting HFP route to %@", (uint8_t *)&v15, 0xCu);
      }

      objc_storeStrong((id *)&self->_hfpRoute, a3);
      -[MNObserverHashTable audioPathwayResourceAccess:didActivateHFPOutput:](self->_observers, "audioPathwayResourceAccess:didActivateHFPOutput:", self, self->_hfpRoute);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "⒫ Unable to set voice prompt for route (this is an error in AVSystemController) : %@", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  else
  {
    hfpRoute = self->_hfpRoute;
    if (hfpRoute)
    {
      objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "setBTHFPRoute:availableForVoicePrompts:", self->_hfpRoute, 0);

      if ((v12 & 1) == 0)
      {
        GetAudioLogForMNAudioPathwayResourceAccessCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = self->_hfpRoute;
          v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "⒫ Unable to clear voice prompt for route (this is an error in AVSystemController) : %@", (uint8_t *)&v15, 0xCu);
        }

      }
      -[MNObserverHashTable audioPathwayResourceAccess:didDeactivateHFPOutput:](self->_observers, "audioPathwayResourceAccess:didDeactivateHFPOutput:", self, self->_hfpRoute);
      hfpRoute = self->_hfpRoute;
    }
    self->_hfpRoute = 0;

  }
}

- (void)setEnableHFPUse:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  GetAudioLogForMNAudioPathwayResourceAccessCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[MNAudioPathwayResourceAccess setEnableHFPUse:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "ⓟ %s : enableHFPUse=%@", (uint8_t *)&v7, 0x16u);
  }

  self->_enableHFPUse = v3;
  if (!v3)
    -[MNAudioPathwayResourceAccess setHfpRoute:](self, "setHfpRoute:", 0);
}

- (void)setWantsVolumeControl:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  const __CFString *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_wantsVolumeControl = a3;
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wantsVolumeControl);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (uint64_t *)MEMORY[0x1E0D47E90];
  v7 = *MEMORY[0x1E0D47E90];
  v19 = 0;
  objc_msgSend(v4, "setAttribute:forKey:error:", v5, v7, &v19);
  v8 = v19;

  GetAudioLogForMNAudioPathwayResourceAccessCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *v6;
      if (self->_wantsVolumeControl)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v8;
      v13 = "⒫    Error setting attribute for %@ : attributes %@ : error %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_11:
      _os_log_impl(&dword_1B0AD7000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v17 = *v6;
    v18 = CFSTR("YES");
    if (!self->_wantsVolumeControl)
      v18 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v13 = "ⓟ    Setting attributes for %@ was successful : attributes %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 22;
    goto LABEL_11;
  }

}

- (void)_mediaServerConnectionDied
{
  NSObject *v3;
  NSDictionary *hfpRoute;
  uint8_t v5[16];

  GetAudioLogForMNAudioPathwayResourceAccessCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "ⓟ Server connection died (unless there are lots of these, this is not an error)", v5, 2u);
  }

  hfpRoute = self->_hfpRoute;
  self->_hfpRoute = 0;

  -[MNAudioPathwayResourceAccess _unregisterForObservation](self, "_unregisterForObservation");
  -[MNAudioPathwayResourceAccess _registerForObservation](self, "_registerForObservation");
}

- (void)_pickableRoutesChanged
{
  if (self->_enableHFPUse)
    -[MNAudioPathwayResourceAccess _updateHFPRoute](self, "_updateHFPRoute");
}

- (void)_updateHFPRoute
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__MNAudioPathwayResourceAccess__updateHFPRoute__block_invoke;
  v2[3] = &unk_1E61D8298;
  v2[4] = self;
  -[MNAudioPathwayResourceAccess _findUsableRouteWithHandler:](self, "_findUsableRouteWithHandler:", v2);
}

uint64_t __47__MNAudioPathwayResourceAccess__updateHFPRoute__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHfpRoute:", a2);
}

- (void)_findUsableRouteWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *pickableRoutesQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    pickableRoutesQueue = self->_pickableRoutesQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__MNAudioPathwayResourceAccess__findUsableRouteWithHandler___block_invoke;
    v7[3] = &unk_1E61D1CE8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(pickableRoutesQueue, v7);

  }
}

void __60__MNAudioPathwayResourceAccess__findUsableRouteWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickableRoutesForCategory:andMode:", CFSTR("MediaPlayback"), CFSTR("VoicePrompt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
      if ((objc_msgSend(*(id *)(a1 + 32), "_routeIsUsable:", v8) & 1) != 0)
        break;
      if (v5 == (id)++v7)
      {
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v5 = v8;

    if (v5 && (objc_msgSend(v5, "isEqualToDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)) & 1) == 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __60__MNAudioPathwayResourceAccess__findUsableRouteWithHandler___block_invoke_2;
      v10[3] = &unk_1E61D16E0;
      v12 = *(id *)(a1 + 40);
      v5 = v5;
      v11 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v10);

      v9 = v12;
      goto LABEL_13;
    }
  }
  else
  {
LABEL_9:
    v9 = v4;
LABEL_13:

  }
}

uint64_t __60__MNAudioPathwayResourceAccess__findUsableRouteWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_routeIsUsable:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "count")
    && !-[MNAudioPathwayResourceAccess _otherAudioIsPlaying](self, "_otherAudioIsPlaying")
    && !-[MNAudioPathwayResourceAccess _routeIsAirTunes:](self, "_routeIsAirTunes:", v4)
    && !-[MNAudioPathwayResourceAccess _routeIsOverride:](self, "_routeIsOverride:", v4)
    && -[MNAudioPathwayResourceAccess _routeIsHFP:](self, "_routeIsHFP:", v4)
    && -[MNAudioPathwayResourceAccess _routeIsForVehicle:](self, "_routeIsForVehicle:", v4)
    && -[MNAudioPathwayResourceAccess _routeIsBluetooth:](self, "_routeIsBluetooth:", v4)
    && -[MNAudioPathwayResourceAccess _routeIsWireless:](self, "_routeIsWireless:", v4);

  return v5;
}

- (BOOL)_otherAudioIsPlaying
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47FF8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)_routeIsAirTunes:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D480C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AirTunes"));

  return v4;
}

- (BOOL)_routeIsOverride:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D481E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D48018]);

  return v4;
}

- (BOOL)_routeIsHFP:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D48138]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)_routeIsForVehicle:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D480D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D48110]);

  return v4;
}

- (BOOL)_routeIsBluetooth:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D48168]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)_routeIsWireless:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D481E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D48020]);

  return v4;
}

- (BOOL)enableHFPUse
{
  return self->_enableHFPUse;
}

- (BOOL)wantsVolumeControl
{
  return self->_wantsVolumeControl;
}

- (NSDictionary)hfpRoute
{
  return self->_hfpRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hfpRoute, 0);
  objc_storeStrong((id *)&self->_pickableRoutesQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
