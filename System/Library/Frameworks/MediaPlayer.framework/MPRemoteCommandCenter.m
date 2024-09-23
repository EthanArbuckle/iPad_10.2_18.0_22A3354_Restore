@implementation MPRemoteCommandCenter

- (void)_commandTargetsDidChangeNotification:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int commandHandlersRegistered;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[MPRemoteCommandCenter isInvalidated](self, "isInvalidated", a3))
  {
    -[MPRemoteCommandCenter _activeCommands](self, "_activeCommands");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "hasTargets") & 1) != 0)
          {
            v9 = 1;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_12:

    os_unfair_lock_lock(&self->_lock);
    commandHandlersRegistered = self->_commandHandlersRegistered;
    if (commandHandlersRegistered != v9)
    {
      self->_commandHandlersRegistered = v9;
      -[MPRemoteCommandCenter _locked_updateCanBeNowPlayingApplicationIfNeeded](self, "_locked_updateCanBeNowPlayingApplicationIfNeeded");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__MPRemoteCommandCenter__commandTargetsDidChangeNotification___block_invoke;
      block[3] = &unk_1E3163508;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    os_unfair_lock_unlock(&self->_lock);
    -[MPRemoteCommandCenter _scheduleSupportedCommandsChanged:](self, "_scheduleSupportedCommandsChanged:", commandHandlersRegistered != v9);

  }
}

- (void)_scheduleSupportedCommandsChanged:(BOOL)a3
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  dispatch_time_t v8;
  _QWORD v9[5];

  if (!self->_scheduledSupportedCommandsChangedNotification || a3)
  {
    v4 = a3;
    v5 = MEMORY[0x1E0C809B0];
    self->_scheduledSupportedCommandsChangedNotification = 1;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __59__MPRemoteCommandCenter__scheduleSupportedCommandsChanged___block_invoke;
    v9[3] = &unk_1E3163508;
    v9[4] = self;
    v6 = (void *)MEMORY[0x19403A810](v9, a2);
    if (v4)
    {
      dispatch_async(MEMORY[0x1E0C80D38], v6);
    }
    else
    {
      v7 = 200000000;
      if ((MSVDeviceIsWatch() & 1) == 0 && !MSVDeviceIsAudioAccessory())
        v7 = 100000000;
      v8 = dispatch_time(0, v7);
      dispatch_after(v8, MEMORY[0x1E0C80D38], v6);
    }

  }
}

- (void)remoteCommandDidMutatePropagatableProperty:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  MRPlayerPath *playerPath;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  MPRemoteCommandCenter *v12;
  __int16 v13;
  MRPlayerPath *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MPRemoteCommandCenter isInvalidated](self, "isInvalidated"))
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      playerPath = self->_playerPath;
      v9 = 138413058;
      v10 = v6;
      v11 = 2048;
      v12 = self;
      v13 = 2112;
      v14 = playerPath;
      v15 = 2112;
      v16 = v4;
      v8 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "<%@: %p (%@)> property mutated after invalidated: %@", (uint8_t *)&v9, 0x2Au);

    }
  }
  else
  {
    -[MPRemoteCommandCenter _scheduleSupportedCommandsChanged:](self, "_scheduleSupportedCommandsChanged:", 0);
  }

}

- (BOOL)isInvalidated
{
  MPRemoteCommandCenter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_activeCommands
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_activeCommands, "copy");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_55_32848);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__MPRemoteCommandCenter__debugCommandDescriptions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)MEMORY[0x1E0C99E08];
  v15[0] = CFSTR("commandType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v2, "mediaRemoteCommandType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("supported");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isSupported"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  v15[2] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  v15[3] = CFSTR("options");
  objc_msgSend(v2, "_mediaRemoteCommandInfoOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = MEMORY[0x1E0C9AA70];
  if (v7)
    v9 = v7;
  v16[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isSupported") & 1) == 0)
  {
    objc_msgSend(v2, "unsupportedReasons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("unsupportedReasons"));

  }
  if ((objc_msgSend(v2, "isEnabled") & 1) == 0)
  {
    objc_msgSend(v2, "disabledReasons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("disabledReasons"));

  }
  return v11;
}

BOOL __79__MPRemoteCommandCenter__createRemoteCommandWithConcreteClass_mediaRemoteType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = objc_opt_class() == *(_QWORD *)(a1 + 32)
    && objc_msgSend(v3, "mediaRemoteCommandType") == *(_DWORD *)(a1 + 40);

  return v4;
}

BOOL __40__MPRemoteCommandCenter__activeCommands__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unsigned int v5;

  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "mediaRemoteCommandType");
  v5 = objc_msgSend(v4, "mediaRemoteCommandType");

  return a2 < v5;
}

id __59__MPRemoteCommandCenter__scheduleSupportedCommandsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isSupported"))
  {
    objc_msgSend(v2, "commandInfoRepresentations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (void)_locked_updateCanBeNowPlayingApplicationIfNeeded
{
  _BOOL4 commandHandlersRegistered;
  _QWORD v4[5];
  BOOL v5;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_invalidated)
  {
    commandHandlersRegistered = self->_commandHandlersRegistered;
    if (self->_commandHandlersRegistered)
      commandHandlersRegistered = !self->_disableAutomaticCanBeNowPlaying;
    if (self->_canBeNowPlayingApplication != commandHandlersRegistered)
    {
      self->_canBeNowPlayingApplication = commandHandlersRegistered;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __73__MPRemoteCommandCenter__locked_updateCanBeNowPlayingApplicationIfNeeded__block_invoke;
      v4[3] = &unk_1E3163468;
      v5 = commandHandlersRegistered;
      v4[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v4);
    }
  }
}

uint64_t __70__MPRemoteCommandCenter_updateLaunchCommandsWithConfigurationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "commandInfoRepresentations");
}

- (id)_createRemoteCommandWithConcreteClass:(Class)a3 mediaRemoteType:(unsigned int)a4
{
  uint64_t v4;
  NSMutableArray *activeCommands;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[5];
  int v15;

  v4 = *(_QWORD *)&a4;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPRemoteCommandCenter.m"), 488, CFSTR("Attempted to create remote command object of unknown class %@"), v13);

  }
  os_unfair_lock_lock(&self->_lock);
  activeCommands = self->_activeCommands;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__MPRemoteCommandCenter__createRemoteCommandWithConcreteClass_mediaRemoteType___block_invoke;
  v14[3] = &__block_descriptor_44_e32_B32__0__MPRemoteCommand_8Q16_B24lu32l8;
  v14[4] = a3;
  v15 = v4;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](activeCommands, "indexOfObjectPassingTest:", v14);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_msgSend([a3 alloc], "initWithMediaRemoteCommandType:", v4);
    objc_msgSend(v10, "setCommandCenter:", self);
    -[NSMutableArray addObject:](self->_activeCommands, "addObject:", v10);
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_activeCommands, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(&self->_lock);
  return v10;
}

+ (void)updateLaunchCommandsWithConfigurationHandler:(id)a3
{
  void *v3;
  _MPRemoteLaunchCommandCenter *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _MPRemoteLaunchCommandCenter *);

  v7 = (void (**)(id, _MPRemoteLaunchCommandCenter *))a3;
  v3 = (void *)MEMORY[0x19403A624]();
  v4 = -[MPRemoteCommandCenter initWithPlayerID:]([_MPRemoteLaunchCommandCenter alloc], "initWithPlayerID:", CFSTR("LaunchCommandBuilder"));
  v7[2](v7, v4);
  -[MPRemoteCommandCenter _activeCommands](v4, "_activeCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "msv_flatMap:", &__block_literal_global_32907);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteSetDefaultSupportedCommands();

  objc_autoreleasePoolPop(v3);
}

void __59__MPRemoteCommandCenter__scheduleSupportedCommandsChanged___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidated") & 1) == 0)
  {
    v2 = *(_BYTE **)(a1 + 32);
    if (v2[32])
    {
      objc_msgSend(v2, "_activeCommands");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "msv_flatMap:", &__block_literal_global_83);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)objc_opt_class();
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(v7 + 40);
        v10 = 138413058;
        v11 = v6;
        v12 = 2048;
        v13 = v7;
        v14 = 2112;
        v15 = v8;
        v16 = 2114;
        v17 = v4;
        v9 = v6;
        _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> [MPRemoteCommandCenter] setSupportedCommands %{public}@", (uint8_t *)&v10, 0x2Au);

      }
      MRMediaRemoteSetSupportedCommandsForPlayer();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;

    }
  }
}

void __44__MPRemoteCommandCenter_sharedCommandCenter__block_invoke()
{
  MPRemoteCommandCenter *v0;
  void *v1;

  v0 = -[MPRemoteCommandCenter initWithPlayerID:]([MPRemoteCommandCenter alloc], "initWithPlayerID:", 0);
  v1 = (void *)sharedCommandCenter___sharedCommandCenter;
  sharedCommandCenter___sharedCommandCenter = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  MEMORY[0x194038908](self->_stateHandler, a2);
  -[MPRemoteCommandCenter _stopMediaRemoteSync](self, "_stopMediaRemoteSync");
  if (!-[MPRemoteCommandCenter isInvalidated](self, "isInvalidated"))
  {
    +[MPNowPlayingInfoCenter infoCenterForPlayerPath:](MPNowPlayingInfoCenter, "infoCenterForPlayerPath:", self->_playerPath);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      MRMediaRemoteRemovePlayer();

  }
  v4.receiver = self;
  v4.super_class = (Class)MPRemoteCommandCenter;
  -[MPRemoteCommandCenter dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  MRPlayerPath *playerPath;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  MPRemoteCommandCenter *v11;
  __int16 v12;
  MRPlayerPath *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MPRemoteCommandCenter _stopMediaRemoteSync](self, "_stopMediaRemoteSync");
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  os_unfair_lock_unlock(&self->_lock);
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    playerPath = self->_playerPath;
    v8 = 138412802;
    v9 = v4;
    v10 = 2048;
    v11 = self;
    v12 = 2112;
    v13 = playerPath;
    v6 = v4;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> invalidated", (uint8_t *)&v8, 0x20u);

  }
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend((id)__commandCenterMap, "removeObjectForKey:", self->_playerPath);
  objc_sync_exit(v7);

}

- (MPRemoteCommandCenter)initWithPlayerID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MPRemoteCommandCenter *v11;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5F0]), "initWithIdentifier:displayName:", v4, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4C5F0], "defaultPlayer");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  v7 = objc_alloc(MEMORY[0x1E0D4C5F8]);
  objc_msgSend(MEMORY[0x1E0D4C5B8], "localOrigin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4C510], "localClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithOrigin:client:player:", v8, v9, v6);

  v11 = -[MPRemoteCommandCenter initWithPlayerPath:](self, "initWithPlayerPath:", v10);
  return v11;
}

- (MPRemoteCommandCenter)initWithPlayerPath:(id)a3
{
  id v5;
  MPRemoteCommandCenter *v6;
  MPRemoteCommandCenter *v7;
  uint64_t v8;
  MPRemoteCommandCenter *v9;
  uint64_t v10;
  MRPlayerPath *playerPath;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *activeCommands;
  MPRemoteCommandCenter *v16;
  void *v18;
  _QWORD v19[5];
  _QWORD block[4];
  MPRemoteCommandCenter *v21;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MPRemoteCommandCenter;
  v6 = -[MPRemoteCommandCenter init](&v22, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke;
  block[3] = &unk_1E3163508;
  v9 = v6;
  v21 = v9;
  if (initWithPlayerPath__onceToken_32889 != -1)
  {
    dispatch_once(&initWithPlayerPath__onceToken_32889, block);
    if (v5)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (!v5)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0D4C5F8], "localPlayerPath");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_5:
  v10 = objc_msgSend(v5, "copy");
  playerPath = v9->_playerPath;
  v9->_playerPath = (MRPlayerPath *)v10;

  objc_msgSend((id)objc_opt_class(), "commandCenterForPlayerPath:", v9->_playerPath);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MPRemoteCommandCenter.m"), 121, CFSTR("Cannot have two MPRemoteCommandCenters for the same playerPath: %@"), v5);

  }
  objc_opt_class();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  objc_msgSend((id)__commandCenterMap, "setObject:forKey:", v9, v9->_playerPath);
  objc_sync_exit(v13);

  v9->_lock._os_unfair_lock_opaque = 0;
  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  activeCommands = v9->_activeCommands;
  v9->_activeCommands = v14;

  -[MPRemoteCommandCenter _startMediaRemoteSync](v9, "_startMediaRemoteSync");
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke_2;
  v19[3] = &unk_1E315D7F8;
  v19[4] = v9;
  v16 = v9;
  v16->_stateHandler = __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke_2((uint64_t)v19);

LABEL_8:
  return v7;
}

uint64_t __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("MPRemoteCommandCenter:"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v7, &location);
  v5 = MSVLogAddStateHandler();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v5;
}

+ (id)commandCenterForPlayerPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend((id)__commandCenterMap, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

- (void)_startMediaRemoteSync
{
  NSMutableArray *v3;
  NSMutableArray *eventQueue;
  void *v5;
  id mediaRemoteCommandHandler;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *, void *);
  void *v11;
  id v12;
  id location;

  if (!self->_mediaRemoteCommandHandler)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    eventQueue = self->_eventQueue;
    self->_eventQueue = v3;

    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke;
    v11 = &unk_1E315CA28;
    objc_copyWeak(&v12, &location);
    MRMediaRemoteAddCommandHandlerForPlayer();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    mediaRemoteCommandHandler = self->_mediaRemoteCommandHandler;
    self->_mediaRemoteCommandHandler = v5;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__commandTargetsDidChangeNotification_, CFSTR("MPRemoteCommandTargetsDidChangeNotification"), 0);

}

- (id)_debugCommandDescriptions
{
  void *v2;
  void *v3;

  -[MPRemoteCommandCenter _activeCommands](self, "_activeCommands");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_map:", &__block_literal_global_61_32825);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (MPRemoteCommandCenter)sharedCommandCenter
{
  if (sharedCommandCenter___once != -1)
    dispatch_once(&sharedCommandCenter___once, &__block_literal_global_7);
  return (MPRemoteCommandCenter *)(id)sharedCommandCenter___sharedCommandCenter;
}

- (MPRemoteCommand)createRadioStationCommand
{
  MPRemoteCommand *createRadioStationCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  createRadioStationCommand = self->_createRadioStationCommand;
  if (!createRadioStationCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 121);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_createRadioStationCommand;
    self->_createRadioStationCommand = v4;

    createRadioStationCommand = self->_createRadioStationCommand;
  }
  return createRadioStationCommand;
}

- (MPVocalsControlCommand)vocalsControlCommand
{
  MPVocalsControlCommand *vocalsControlCommand;
  MPVocalsControlCommand *v4;
  MPVocalsControlCommand *v5;

  vocalsControlCommand = self->_vocalsControlCommand;
  if (!vocalsControlCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 142);
    v4 = (MPVocalsControlCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_vocalsControlCommand;
    self->_vocalsControlCommand = v4;

    vocalsControlCommand = self->_vocalsControlCommand;
  }
  return vocalsControlCommand;
}

- (MPChangeQueueEndActionCommand)changeQueueEndActionCommand
{
  MPChangeQueueEndActionCommand *changeQueueEndActionCommand;
  MPChangeQueueEndActionCommand *v4;
  MPChangeQueueEndActionCommand *v5;

  changeQueueEndActionCommand = self->_changeQueueEndActionCommand;
  if (!changeQueueEndActionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 135);
    v4 = (MPChangeQueueEndActionCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_changeQueueEndActionCommand;
    self->_changeQueueEndActionCommand = v4;

    changeQueueEndActionCommand = self->_changeQueueEndActionCommand;
  }
  return changeQueueEndActionCommand;
}

- (MPFeedbackCommand)addNowPlayingItemToLibraryCommand
{
  MPFeedbackCommand *addNowPlayingItemToLibraryCommand;
  MPFeedbackCommand *v4;
  MPFeedbackCommand *v5;

  addNowPlayingItemToLibraryCommand = self->_addNowPlayingItemToLibraryCommand;
  if (!addNowPlayingItemToLibraryCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 127);
    v4 = (MPFeedbackCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_addNowPlayingItemToLibraryCommand;
    self->_addNowPlayingItemToLibraryCommand = v4;

    addNowPlayingItemToLibraryCommand = self->_addNowPlayingItemToLibraryCommand;
  }
  return addNowPlayingItemToLibraryCommand;
}

- (MPRatingCommand)ratingCommand
{
  MPRatingCommand *ratingCommand;
  MPRatingCommand *v4;
  MPRatingCommand *v5;

  ratingCommand = self->_ratingCommand;
  if (!ratingCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 20);
    v4 = (MPRatingCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_ratingCommand;
    self->_ratingCommand = v4;

    ratingCommand = self->_ratingCommand;
  }
  return ratingCommand;
}

- (MPChangeShuffleModeCommand)changeShuffleModeCommand
{
  MPChangeShuffleModeCommand *changeShuffleModeCommand;
  MPChangeShuffleModeCommand *v4;
  MPChangeShuffleModeCommand *v5;

  changeShuffleModeCommand = self->_changeShuffleModeCommand;
  if (!changeShuffleModeCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 26);
    v4 = (MPChangeShuffleModeCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_changeShuffleModeCommand;
    self->_changeShuffleModeCommand = v4;

    changeShuffleModeCommand = self->_changeShuffleModeCommand;
  }
  return changeShuffleModeCommand;
}

- (MPRemoteCommand)reshuffleCommand
{
  MPRemoteCommand *reshuffleCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  reshuffleCommand = self->_reshuffleCommand;
  if (!reshuffleCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 134);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_reshuffleCommand;
    self->_reshuffleCommand = v4;

    reshuffleCommand = self->_reshuffleCommand;
  }
  return reshuffleCommand;
}

- (MPSetSleepTimerCommand)setSleepTimerCommand
{
  MPSetSleepTimerCommand *setSleepTimerCommand;
  MPSetSleepTimerCommand *v4;
  MPSetSleepTimerCommand *v5;

  setSleepTimerCommand = self->_setSleepTimerCommand;
  if (!setSleepTimerCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 124);
    v4 = (MPSetSleepTimerCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_setSleepTimerCommand;
    self->_setSleepTimerCommand = v4;

    setSleepTimerCommand = self->_setSleepTimerCommand;
  }
  return setSleepTimerCommand;
}

- (MPAdvanceRepeatModeCommand)advanceRepeatModeCommand
{
  MPAdvanceRepeatModeCommand *advanceRepeatModeCommand;
  MPAdvanceRepeatModeCommand *v4;
  MPAdvanceRepeatModeCommand *v5;

  advanceRepeatModeCommand = self->_advanceRepeatModeCommand;
  if (!advanceRepeatModeCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 7);
    v4 = (MPAdvanceRepeatModeCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_advanceRepeatModeCommand;
    self->_advanceRepeatModeCommand = v4;

    advanceRepeatModeCommand = self->_advanceRepeatModeCommand;
  }
  return advanceRepeatModeCommand;
}

- (MPAdvanceShuffleModeCommand)advanceShuffleModeCommand
{
  MPAdvanceShuffleModeCommand *advanceShuffleModeCommand;
  MPAdvanceShuffleModeCommand *v4;
  MPAdvanceShuffleModeCommand *v5;

  advanceShuffleModeCommand = self->_advanceShuffleModeCommand;
  if (!advanceShuffleModeCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 6);
    v4 = (MPAdvanceShuffleModeCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_advanceShuffleModeCommand;
    self->_advanceShuffleModeCommand = v4;

    advanceShuffleModeCommand = self->_advanceShuffleModeCommand;
  }
  return advanceShuffleModeCommand;
}

- (MPFeedbackCommand)likeCommand
{
  MPFeedbackCommand *likeCommand;
  MPFeedbackCommand *v4;
  MPFeedbackCommand *v5;

  likeCommand = self->_likeCommand;
  if (!likeCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 21);
    v4 = (MPFeedbackCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_likeCommand;
    self->_likeCommand = v4;

    likeCommand = self->_likeCommand;
  }
  return likeCommand;
}

- (MPFeedbackCommand)dislikeCommand
{
  MPFeedbackCommand *dislikeCommand;
  MPFeedbackCommand *v4;
  MPFeedbackCommand *v5;

  dislikeCommand = self->_dislikeCommand;
  if (!dislikeCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 22);
    v4 = (MPFeedbackCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dislikeCommand;
    self->_dislikeCommand = v4;

    dislikeCommand = self->_dislikeCommand;
  }
  return dislikeCommand;
}

- (MPRemoteCommand)leaveSharedPlaybackSessionCommand
{
  MPRemoteCommand *leaveSharedPlaybackSessionCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  leaveSharedPlaybackSessionCommand = self->_leaveSharedPlaybackSessionCommand;
  if (!leaveSharedPlaybackSessionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 139);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_leaveSharedPlaybackSessionCommand;
    self->_leaveSharedPlaybackSessionCommand = v4;

    leaveSharedPlaybackSessionCommand = self->_leaveSharedPlaybackSessionCommand;
  }
  return leaveSharedPlaybackSessionCommand;
}

- (MPFeedbackCommand)addItemToLibraryCommand
{
  MPFeedbackCommand *addItemToLibraryCommand;
  MPFeedbackCommand *v4;
  MPFeedbackCommand *v5;

  addItemToLibraryCommand = self->_addItemToLibraryCommand;
  if (!addItemToLibraryCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 128);
    v4 = (MPFeedbackCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_addItemToLibraryCommand;
    self->_addItemToLibraryCommand = v4;

    addItemToLibraryCommand = self->_addItemToLibraryCommand;
  }
  return addItemToLibraryCommand;
}

- (MPRemoteCommand)prepareVocalsControlCommand
{
  MPRemoteCommand *prepareVocalsControlCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  prepareVocalsControlCommand = self->_prepareVocalsControlCommand;
  if (!prepareVocalsControlCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 143);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prepareVocalsControlCommand;
    self->_prepareVocalsControlCommand = v4;

    prepareVocalsControlCommand = self->_prepareVocalsControlCommand;
  }
  return prepareVocalsControlCommand;
}

- (MPChangeRepeatModeCommand)changeRepeatModeCommand
{
  MPChangeRepeatModeCommand *changeRepeatModeCommand;
  MPChangeRepeatModeCommand *v4;
  MPChangeRepeatModeCommand *v5;

  changeRepeatModeCommand = self->_changeRepeatModeCommand;
  if (!changeRepeatModeCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 25);
    v4 = (MPChangeRepeatModeCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_changeRepeatModeCommand;
    self->_changeRepeatModeCommand = v4;

    changeRepeatModeCommand = self->_changeRepeatModeCommand;
  }
  return changeRepeatModeCommand;
}

- (MPRemoteCommand)specialSeekForwardCommand
{
  MPRemoteCommand *specialSeekForwardCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  specialSeekForwardCommand = self->_specialSeekForwardCommand;
  if (!specialSeekForwardCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 109);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_specialSeekForwardCommand;
    self->_specialSeekForwardCommand = v4;

    specialSeekForwardCommand = self->_specialSeekForwardCommand;
  }
  return specialSeekForwardCommand;
}

- (MPRemoteCommand)specialSeekBackwardCommand
{
  MPRemoteCommand *specialSeekBackwardCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  specialSeekBackwardCommand = self->_specialSeekBackwardCommand;
  if (!specialSeekBackwardCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 110);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_specialSeekBackwardCommand;
    self->_specialSeekBackwardCommand = v4;

    specialSeekBackwardCommand = self->_specialSeekBackwardCommand;
  }
  return specialSeekBackwardCommand;
}

- (MPInsertIntoPlaybackQueueCommand)insertIntoPlaybackQueueCommand
{
  MPInsertIntoPlaybackQueueCommand *insertIntoPlaybackQueueCommand;
  MPInsertIntoPlaybackQueueCommand *v4;
  MPInsertIntoPlaybackQueueCommand *v5;

  insertIntoPlaybackQueueCommand = self->_insertIntoPlaybackQueueCommand;
  if (!insertIntoPlaybackQueueCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 125);
    v4 = (MPInsertIntoPlaybackQueueCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_insertIntoPlaybackQueueCommand;
    self->_insertIntoPlaybackQueueCommand = v4;

    insertIntoPlaybackQueueCommand = self->_insertIntoPlaybackQueueCommand;
  }
  return insertIntoPlaybackQueueCommand;
}

- (MPRemoteCommand)removeFromPlaybackQueueCommand
{
  MPRemoteCommand *removeFromPlaybackQueueCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  removeFromPlaybackQueueCommand = self->_removeFromPlaybackQueueCommand;
  if (!removeFromPlaybackQueueCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 129);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_removeFromPlaybackQueueCommand;
    self->_removeFromPlaybackQueueCommand = v4;

    removeFromPlaybackQueueCommand = self->_removeFromPlaybackQueueCommand;
  }
  return removeFromPlaybackQueueCommand;
}

- (MPReorderQueueCommand)reorderQueueCommand
{
  MPReorderQueueCommand *reorderQueueCommand;
  MPReorderQueueCommand *v4;
  MPReorderQueueCommand *v5;

  reorderQueueCommand = self->_reorderQueueCommand;
  if (!reorderQueueCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 130);
    v4 = (MPReorderQueueCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_reorderQueueCommand;
    self->_reorderQueueCommand = v4;

    reorderQueueCommand = self->_reorderQueueCommand;
  }
  return reorderQueueCommand;
}

- (MPPreloadPlaybackSessionCommand)preloadPlaybackSessionCommand
{
  MPPreloadPlaybackSessionCommand *preloadPlaybackSessionCommand;
  MPPreloadPlaybackSessionCommand *v4;
  MPPreloadPlaybackSessionCommand *v5;

  preloadPlaybackSessionCommand = self->_preloadPlaybackSessionCommand;
  if (!preloadPlaybackSessionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 136);
    v4 = (MPPreloadPlaybackSessionCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_preloadPlaybackSessionCommand;
    self->_preloadPlaybackSessionCommand = v4;

    preloadPlaybackSessionCommand = self->_preloadPlaybackSessionCommand;
  }
  return preloadPlaybackSessionCommand;
}

- (MPPrepareForSetPlaybackQueueCommand)prepareForSetPlaybackQueueCommand
{
  MPPrepareForSetPlaybackQueueCommand *prepareForSetPlaybackQueueCommand;
  MPPrepareForSetPlaybackQueueCommand *v4;
  MPPrepareForSetPlaybackQueueCommand *v5;

  prepareForSetPlaybackQueueCommand = self->_prepareForSetPlaybackQueueCommand;
  if (!prepareForSetPlaybackQueueCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 132);
    v4 = (MPPrepareForSetPlaybackQueueCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prepareForSetPlaybackQueueCommand;
    self->_prepareForSetPlaybackQueueCommand = v4;

    prepareForSetPlaybackQueueCommand = self->_prepareForSetPlaybackQueueCommand;
  }
  return prepareForSetPlaybackQueueCommand;
}

- (MPChangePlaybackRateCommand)changePlaybackRateCommand
{
  MPChangePlaybackRateCommand *changePlaybackRateCommand;
  MPChangePlaybackRateCommand *v4;
  MPChangePlaybackRateCommand *v5;

  changePlaybackRateCommand = self->_changePlaybackRateCommand;
  if (!changePlaybackRateCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 19);
    v4 = (MPChangePlaybackRateCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_changePlaybackRateCommand;
    self->_changePlaybackRateCommand = v4;

    changePlaybackRateCommand = self->_changePlaybackRateCommand;
  }
  return changePlaybackRateCommand;
}

- (MPRemoteCommand)seekBackwardCommand
{
  MPRemoteCommand *seekBackwardCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  seekBackwardCommand = self->_seekBackwardCommand;
  if (!seekBackwardCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 10);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_seekBackwardCommand;
    self->_seekBackwardCommand = v4;

    seekBackwardCommand = self->_seekBackwardCommand;
  }
  return seekBackwardCommand;
}

- (MPRemoteCommand)playItemInQueueCommand
{
  MPRemoteCommand *playItemInQueueCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  playItemInQueueCommand = self->_playItemInQueueCommand;
  if (!playItemInQueueCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 131);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_playItemInQueueCommand;
    self->_playItemInQueueCommand = v4;

    playItemInQueueCommand = self->_playItemInQueueCommand;
  }
  return playItemInQueueCommand;
}

- (MPSkipIntervalCommand)skipBackwardCommand
{
  MPSkipIntervalCommand *skipBackwardCommand;
  MPSkipIntervalCommand *v4;
  MPSkipIntervalCommand *v5;

  skipBackwardCommand = self->_skipBackwardCommand;
  if (!skipBackwardCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 18);
    v4 = (MPSkipIntervalCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_skipBackwardCommand;
    self->_skipBackwardCommand = v4;

    skipBackwardCommand = self->_skipBackwardCommand;
  }
  return skipBackwardCommand;
}

- (MPRemoteCommand)seekForwardCommand
{
  MPRemoteCommand *seekForwardCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  seekForwardCommand = self->_seekForwardCommand;
  if (!seekForwardCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 8);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_seekForwardCommand;
    self->_seekForwardCommand = v4;

    seekForwardCommand = self->_seekForwardCommand;
  }
  return seekForwardCommand;
}

- (MPRemoteCommand)stopCommand
{
  MPRemoteCommand *stopCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  stopCommand = self->_stopCommand;
  if (!stopCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 3);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stopCommand;
    self->_stopCommand = v4;

    stopCommand = self->_stopCommand;
  }
  return stopCommand;
}

- (MPSkipIntervalCommand)skipForwardCommand
{
  MPSkipIntervalCommand *skipForwardCommand;
  MPSkipIntervalCommand *v4;
  MPSkipIntervalCommand *v5;

  skipForwardCommand = self->_skipForwardCommand;
  if (!skipForwardCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 17);
    v4 = (MPSkipIntervalCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_skipForwardCommand;
    self->_skipForwardCommand = v4;

    skipForwardCommand = self->_skipForwardCommand;
  }
  return skipForwardCommand;
}

- (MPRemoteCommand)nextTrackCommand
{
  MPRemoteCommand *nextTrackCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  nextTrackCommand = self->_nextTrackCommand;
  if (!nextTrackCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 4);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nextTrackCommand;
    self->_nextTrackCommand = v4;

    nextTrackCommand = self->_nextTrackCommand;
  }
  return nextTrackCommand;
}

- (MPRemoteCommand)previousTrackCommand
{
  MPRemoteCommand *previousTrackCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  previousTrackCommand = self->_previousTrackCommand;
  if (!previousTrackCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 5);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_previousTrackCommand;
    self->_previousTrackCommand = v4;

    previousTrackCommand = self->_previousTrackCommand;
  }
  return previousTrackCommand;
}

- (MPRemoteCommand)togglePlayPauseCommand
{
  MPRemoteCommand *togglePlayPauseCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  togglePlayPauseCommand = self->_togglePlayPauseCommand;
  if (!togglePlayPauseCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 2);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_togglePlayPauseCommand;
    self->_togglePlayPauseCommand = v4;

    togglePlayPauseCommand = self->_togglePlayPauseCommand;
  }
  return togglePlayPauseCommand;
}

- (MPChangePlaybackPositionCommand)changePlaybackPositionCommand
{
  MPChangePlaybackPositionCommand *changePlaybackPositionCommand;
  MPChangePlaybackPositionCommand *v4;
  MPChangePlaybackPositionCommand *v5;

  changePlaybackPositionCommand = self->_changePlaybackPositionCommand;
  if (!changePlaybackPositionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 24);
    v4 = (MPChangePlaybackPositionCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_changePlaybackPositionCommand;
    self->_changePlaybackPositionCommand = v4;

    changePlaybackPositionCommand = self->_changePlaybackPositionCommand;
  }
  return changePlaybackPositionCommand;
}

- (MPRemoteCommand)pauseCommand
{
  MPRemoteCommand *pauseCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  pauseCommand = self->_pauseCommand;
  if (!pauseCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 1);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pauseCommand;
    self->_pauseCommand = v4;

    pauseCommand = self->_pauseCommand;
  }
  return pauseCommand;
}

- (MPSetPlaybackSessionCommand)setPlaybackSessionCommand
{
  MPSetPlaybackSessionCommand *setPlaybackSessionCommand;
  MPSetPlaybackSessionCommand *v4;
  MPSetPlaybackSessionCommand *v5;

  setPlaybackSessionCommand = self->_setPlaybackSessionCommand;
  if (!setPlaybackSessionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 133);
    v4 = (MPSetPlaybackSessionCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_setPlaybackSessionCommand;
    self->_setPlaybackSessionCommand = v4;

    setPlaybackSessionCommand = self->_setPlaybackSessionCommand;
  }
  return setPlaybackSessionCommand;
}

- (MPSetPlaybackQueueCommand)setPlaybackQueueCommand
{
  MPSetPlaybackQueueCommand *setPlaybackQueueCommand;
  MPSetPlaybackQueueCommand *v4;
  MPSetPlaybackQueueCommand *v5;

  setPlaybackQueueCommand = self->_setPlaybackQueueCommand;
  if (!setPlaybackQueueCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 122);
    v4 = (MPSetPlaybackQueueCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_setPlaybackQueueCommand;
    self->_setPlaybackQueueCommand = v4;

    setPlaybackQueueCommand = self->_setPlaybackQueueCommand;
  }
  return setPlaybackQueueCommand;
}

- (MPRemoteCommand)playCommand
{
  MPRemoteCommand *playCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  playCommand = self->_playCommand;
  if (!playCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 0);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_playCommand;
    self->_playCommand = v4;

    playCommand = self->_playCommand;
  }
  return playCommand;
}

void __62__MPRemoteCommandCenter__commandTargetsDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MPRemoteCommandCenterCommandHandlersRegisteredNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (void)setWantsSerializedEventDelivery:(BOOL)a3
{
  self->_wantsSerializedEventDelivery = a3;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

void __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke()
{
  uint64_t v0;
  void *v1;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__commandCenterMap;
  __commandCenterMap = v0;

  objc_sync_exit(obj);
}

uint64_t __73__MPRemoteCommandCenter__locked_updateCanBeNowPlayingApplicationIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[5];
    objc_msgSend(v4, "_activeCommands");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 67109634;
    v8[1] = v3;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[RCC] _updateCanBeNowPlayingApplicationIfNeeded: canBeNowPlayingApplication=%{BOOL}u playerPath=%{public}@ commands=%{public}@", (uint8_t *)v8, 0x1Cu);

  }
  return MRMediaRemoteSetCanBeNowPlayingForPlayer();
}

- (BOOL)commandHandlersRegistered
{
  MPRemoteCommandCenter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_commandHandlersRegistered;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __70__MPRemoteCommandCenter_updateLaunchCommandsWithConfigurationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "msv_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Updated launch commands error=%{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Updated launch commands", (uint8_t *)&v6, 2u);
  }

}

uint64_t __44__MPRemoteCommandCenter_initWithPlayerPath___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_stateDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5[2](v5, v9);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)getPendingCommandTypesWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)MRMediaRemoteCopyPendingCommands();
  v3[2](v3, v4, 0);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clearUpNextCommand, 0);
  objc_storeStrong((id *)&self->_setSleepTimerCommand, 0);
  objc_storeStrong((id *)&self->_vocalsControlCommand, 0);
  objc_storeStrong((id *)&self->_prepareVocalsControlCommand, 0);
  objc_storeStrong((id *)&self->_postEventNoticeCommand, 0);
  objc_storeStrong((id *)&self->_leaveSharedPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_changeQueueEndActionCommand, 0);
  objc_storeStrong((id *)&self->_reshuffleCommand, 0);
  objc_storeStrong((id *)&self->_discardPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_setPriorityForPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_preloadPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_setPlaybackSessionCommand, 0);
  objc_storeStrong((id *)&self->_addItemToLibraryCommand, 0);
  objc_storeStrong((id *)&self->_addNowPlayingItemToLibraryCommand, 0);
  objc_storeStrong((id *)&self->_playItemInQueueCommand, 0);
  objc_storeStrong((id *)&self->_reorderQueueCommand, 0);
  objc_storeStrong((id *)&self->_removeFromPlaybackQueueCommand, 0);
  objc_storeStrong((id *)&self->_insertIntoPlaybackQueueCommand, 0);
  objc_storeStrong((id *)&self->_prepareForSetPlaybackQueueCommand, 0);
  objc_storeStrong((id *)&self->_setPlaybackQueueCommand, 0);
  objc_storeStrong((id *)&self->_createRadioStationCommand, 0);
  objc_storeStrong((id *)&self->_advanceRepeatModeCommand, 0);
  objc_storeStrong((id *)&self->_advanceShuffleModeCommand, 0);
  objc_storeStrong((id *)&self->_specialSeekBackwardCommand, 0);
  objc_storeStrong((id *)&self->_specialSeekForwardCommand, 0);
  objc_storeStrong((id *)&self->_changeShuffleModeCommand, 0);
  objc_storeStrong((id *)&self->_changeRepeatModeCommand, 0);
  objc_storeStrong((id *)&self->_changePlaybackPositionCommand, 0);
  objc_storeStrong((id *)&self->_bookmarkCommand, 0);
  objc_storeStrong((id *)&self->_dislikeCommand, 0);
  objc_storeStrong((id *)&self->_likeCommand, 0);
  objc_storeStrong((id *)&self->_changePlaybackRateCommand, 0);
  objc_storeStrong((id *)&self->_performDialogActionCommand, 0);
  objc_storeStrong((id *)&self->_ratingCommand, 0);
  objc_storeStrong((id *)&self->_seekBackwardCommand, 0);
  objc_storeStrong((id *)&self->_seekForwardCommand, 0);
  objc_storeStrong((id *)&self->_skipBackwardCommand, 0);
  objc_storeStrong((id *)&self->_skipForwardCommand, 0);
  objc_storeStrong((id *)&self->_previousTrackCommand, 0);
  objc_storeStrong((id *)&self->_nextTrackCommand, 0);
  objc_storeStrong((id *)&self->_disableLanguageOptionCommand, 0);
  objc_storeStrong((id *)&self->_enableLanguageOptionCommand, 0);
  objc_storeStrong((id *)&self->_togglePlayPauseCommand, 0);
  objc_storeStrong((id *)&self->_stopCommand, 0);
  objc_storeStrong((id *)&self->_playCommand, 0);
  objc_storeStrong((id *)&self->_pauseCommand, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong(&self->_mediaRemoteCommandHandler, 0);
  objc_storeStrong((id *)&self->_activeCommands, 0);
}

- (NSString)playerID
{
  void *v2;
  void *v3;
  void *v4;

  -[MRPlayerPath player](self->_playerPath, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (BOOL)canBeNowPlayingApplication
{
  MPRemoteCommandCenter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canBeNowPlayingApplication;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_pushMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  int v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v6 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((v6 - 100) > 5)
  {
    if ((_DWORD)v6 == 11)
    {
      v10 = 10;
    }
    else
    {
      v10 = v6;
      if ((_DWORD)v6 == 9)
        v10 = 8;
    }
  }
  else if (((1 << (v6 - 100)) & 0x15) != 0)
  {
    v10 = 109;
  }
  else
  {
    v10 = 110;
  }
  -[MPRemoteCommandCenter _activeCommands](self, "_activeCommands");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "isSupported", (_QWORD)v17)
          && v10 == objc_msgSend(v15, "mediaRemoteCommandType"))
        {
          v12 = v15;
          goto LABEL_20;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_20:

  v16 = (void *)objc_msgSend(v12, "newCommandEventWithCommandType:options:", v6, v8);
  -[MPRemoteCommandCenter dispatchCommandEvent:completion:](self, "dispatchCommandEvent:completion:", v16, v9);

}

- (void)dispatchCommandEvent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  MRPlayerPath *playerPath;
  id v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  MRPlayerPath *v17;
  id v18;
  NSObject *v19;
  id v20;
  MRPlayerPath *v21;
  NSMutableArray *eventQueue;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  void (**v27)(id, _QWORD);
  id v28;
  id location;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  MPRemoteCommandCenter *v33;
  __int16 v34;
  MRPlayerPath *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[MPRemoteCommandCenter isInvalidated](self, "isInvalidated"))
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      playerPath = self->_playerPath;
      *(_DWORD *)buf = 138413058;
      v31 = v9;
      v32 = 2048;
      v33 = self;
      v34 = 2112;
      v35 = playerPath;
      v36 = 2048;
      v37 = v6;
      v11 = v9;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: dispatchCommandEvent: ignoring [command center was invalidated] event=%p", buf, 0x2Au);

    }
LABEL_4:

    v7[2](v7, MEMORY[0x1E0C9AA60]);
    goto LABEL_15;
  }
  if (!v6)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v17 = self->_playerPath;
      *(_DWORD *)buf = 138412802;
      v31 = v16;
      v32 = 2048;
      v33 = self;
      v34 = 2112;
      v35 = v17;
      v18 = v16;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: dispatchCommandEvent: received nil commandEvent", buf, 0x20u);

    }
    goto LABEL_4;
  }
  objc_msgSend(v6, "command");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__MPRemoteCommandCenter_dispatchCommandEvent_completion___block_invoke;
  v24[3] = &unk_1E315C898;
  objc_copyWeak(&v28, &location);
  v13 = v12;
  v25 = v13;
  v14 = v6;
  v26 = v14;
  v27 = v7;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v24);
  if (objc_msgSend(v13, "skipSerializedEventDelivery"))
  {
    ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, &__block_literal_global_31_32873);
  }
  else
  {
    v19 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (id)objc_opt_class();
      -[MPRemoteCommandCenter playerPath](self, "playerPath");
      v21 = (MRPlayerPath *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v31 = v20;
      v32 = 2048;
      v33 = self;
      v34 = 2112;
      v35 = v21;
      v36 = 2114;
      v37 = v13;
      v38 = 2048;
      v39 = v14;
      _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: enqueue: command=%{public}@ event=%p", buf, 0x34u);

    }
    os_unfair_lock_lock(&self->_lock);
    eventQueue = self->_eventQueue;
    v23 = (void *)MEMORY[0x19403A810](v15);
    -[NSMutableArray addObject:](eventQueue, "addObject:", v23);

    os_unfair_lock_unlock(&self->_lock);
    -[MPRemoteCommandCenter _flushEventQueue](self, "_flushEventQueue");
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

LABEL_15:
}

- (void)_flushEventQueue
{
  BOOL v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v3 = -[MPRemoteCommandCenter wantsSerializedEventDelivery](self, "wantsSerializedEventDelivery");
  os_unfair_lock_lock(&self->_lock);
  if (v3)
  {
    if (self->_processingEvent
      || (-[NSMutableArray firstObject](self->_eventQueue, "firstObject"),
          (v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
      -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0);
      self->_processingEvent = 1;
      os_unfair_lock_unlock(&self->_lock);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __41__MPRemoteCommandCenter__flushEventQueue__block_invoke_2;
      v12[3] = &unk_1E3163508;
      v12[4] = self;
      ((void (**)(_QWORD, _QWORD, _QWORD *))v11)[2](v11, 0, v12);

    }
  }
  else
  {
    v4 = (void *)-[NSMutableArray copy](self->_eventQueue, "copy");
    -[NSMutableArray removeAllObjects](self->_eventQueue, "removeAllObjects");
    os_unfair_lock_unlock(&self->_lock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i) + 16))();
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)getPendingCommandTypesWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v3 = (void (**)(id, void *, _QWORD))a3;
  MRNowPlayingPlayerPathGetPlayer();
  v4 = (void *)MRMediaRemoteCopyPendingCommands();
  v3[2](v3, v4, 0);

}

- (void)setDisableAutomaticCanBeNowPlaying:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_disableAutomaticCanBeNowPlaying = a3;
  -[MPRemoteCommandCenter _locked_updateCanBeNowPlayingApplicationIfNeeded](self, "_locked_updateCanBeNowPlayingApplicationIfNeeded");
  os_unfair_lock_unlock(p_lock);
}

- (MPRemoteCommand)enableLanguageOptionCommand
{
  MPRemoteCommand *enableLanguageOptionCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  enableLanguageOptionCommand = self->_enableLanguageOptionCommand;
  if (!enableLanguageOptionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 27);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_enableLanguageOptionCommand;
    self->_enableLanguageOptionCommand = v4;

    enableLanguageOptionCommand = self->_enableLanguageOptionCommand;
  }
  return enableLanguageOptionCommand;
}

- (MPRemoteCommand)disableLanguageOptionCommand
{
  MPRemoteCommand *disableLanguageOptionCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  disableLanguageOptionCommand = self->_disableLanguageOptionCommand;
  if (!disableLanguageOptionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 28);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_disableLanguageOptionCommand;
    self->_disableLanguageOptionCommand = v4;

    disableLanguageOptionCommand = self->_disableLanguageOptionCommand;
  }
  return disableLanguageOptionCommand;
}

- (MPRemoteCommand)performDialogActionCommand
{
  MPRemoteCommand *performDialogActionCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  performDialogActionCommand = self->_performDialogActionCommand;
  if (!performDialogActionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 145);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_performDialogActionCommand;
    self->_performDialogActionCommand = v4;

    performDialogActionCommand = self->_performDialogActionCommand;
  }
  return performDialogActionCommand;
}

- (MPFeedbackCommand)bookmarkCommand
{
  MPFeedbackCommand *bookmarkCommand;
  MPFeedbackCommand *v4;
  MPFeedbackCommand *v5;

  bookmarkCommand = self->_bookmarkCommand;
  if (!bookmarkCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 23);
    v4 = (MPFeedbackCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bookmarkCommand;
    self->_bookmarkCommand = v4;

    bookmarkCommand = self->_bookmarkCommand;
  }
  return bookmarkCommand;
}

- (MPSetPriorityForPlaybackSessionCommand)setPriorityForPlaybackSessionCommand
{
  MPSetPriorityForPlaybackSessionCommand *setPriorityForPlaybackSessionCommand;
  MPSetPriorityForPlaybackSessionCommand *v4;
  MPSetPriorityForPlaybackSessionCommand *v5;

  setPriorityForPlaybackSessionCommand = self->_setPriorityForPlaybackSessionCommand;
  if (!setPriorityForPlaybackSessionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 137);
    v4 = (MPSetPriorityForPlaybackSessionCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_setPriorityForPlaybackSessionCommand;
    self->_setPriorityForPlaybackSessionCommand = v4;

    setPriorityForPlaybackSessionCommand = self->_setPriorityForPlaybackSessionCommand;
  }
  return setPriorityForPlaybackSessionCommand;
}

- (MPRemoteCommand)discardPlaybackSessionCommand
{
  MPRemoteCommand *discardPlaybackSessionCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  discardPlaybackSessionCommand = self->_discardPlaybackSessionCommand;
  if (!discardPlaybackSessionCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 138);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_discardPlaybackSessionCommand;
    self->_discardPlaybackSessionCommand = v4;

    discardPlaybackSessionCommand = self->_discardPlaybackSessionCommand;
  }
  return discardPlaybackSessionCommand;
}

- (MPRemoteCommand)postEventNoticeCommand
{
  MPRemoteCommand *postEventNoticeCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  postEventNoticeCommand = self->_postEventNoticeCommand;
  if (!postEventNoticeCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 140);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_postEventNoticeCommand;
    self->_postEventNoticeCommand = v4;

    postEventNoticeCommand = self->_postEventNoticeCommand;
  }
  return postEventNoticeCommand;
}

- (MPRemoteCommand)clearUpNextCommand
{
  MPRemoteCommand *clearUpNextCommand;
  MPRemoteCommand *v4;
  MPRemoteCommand *v5;

  clearUpNextCommand = self->_clearUpNextCommand;
  if (!clearUpNextCommand)
  {
    -[MPRemoteCommandCenter _createRemoteCommandWithConcreteClass:mediaRemoteType:](self, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 144);
    v4 = (MPRemoteCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_clearUpNextCommand;
    self->_clearUpNextCommand = v4;

    clearUpNextCommand = self->_clearUpNextCommand;
  }
  return clearUpNextCommand;
}

- (BOOL)containsCommand:(id)a3
{
  MPRemoteCommandCenter *v4;

  objc_msgSend(a3, "commandCenter");
  v4 = (MPRemoteCommandCenter *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == self;

  return (char)self;
}

- (id)_stateDictionary
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9[0] = self->_activeCommands;
  v8[0] = CFSTR("activeCommands");
  v8[1] = CFSTR("canBeNowPlayingApplication");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canBeNowPlayingApplication);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("pendingEventsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_eventQueue, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_stopMediaRemoteSync
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id mediaRemoteCommandHandler;
  NSMutableArray *eventQueue;
  void *v7;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray mutableCopy](self->_eventQueue, "mutableCopy");
  mediaRemoteCommandHandler = self->_mediaRemoteCommandHandler;
  if (mediaRemoteCommandHandler)
  {
    if (!self->_invalidated)
    {
      MRMediaRemoteRemoveCommandHandlerBlockForPlayer();
      mediaRemoteCommandHandler = self->_mediaRemoteCommandHandler;
    }
    self->_mediaRemoteCommandHandler = 0;

    eventQueue = self->_eventQueue;
    self->_eventQueue = 0;

  }
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MPRemoteCommandTargetsDidChangeNotification"), 0);
  if (objc_msgSend(v4, "count"))
  {
    v8 = v4;
    msv_dispatch_on_main_queue();

  }
}

- (BOOL)disableAutomaticCanBeNowPlaying
{
  return self->_disableAutomaticCanBeNowPlaying;
}

- (BOOL)wantsSerializedEventDelivery
{
  return self->_wantsSerializedEventDelivery;
}

- (MPRemoteCommandCenterDelegate)delegate
{
  return (MPRemoteCommandCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __45__MPRemoteCommandCenter__stopMediaRemoteSync__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "wantsSerializedEventDelivery") & 1) != 0)
  {
    _serializeBlocksOnMainQueue(*(void **)(a1 + 40));
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

void __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  _QWORD v10[4];
  id v11;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke_2;
    v10[3] = &unk_1E315CA00;
    v11 = v8;
    objc_msgSend(WeakRetained, "_pushMediaRemoteCommand:withOptions:completion:", a2, v7, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "msv_map:", &__block_literal_global_87_32810);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __46__MPRemoteCommandCenter__startMediaRemoteSync__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaRemoteType");
}

void __59__MPRemoteCommandCenter__scheduleSupportedCommandsChanged___block_invoke_84(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "msv_description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "Error setting supported commands error=%{public}@", (uint8_t *)&v5, 0xCu);

    }
  }

}

uint64_t __41__MPRemoteCommandCenter__flushEventQueue__block_invoke_2()
{
  return msv_dispatch_on_main_queue();
}

uint64_t __41__MPRemoteCommandCenter__flushEventQueue__block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  return objc_msgSend(*(id *)(a1 + 32), "_flushEventQueue");
}

void __57__MPRemoteCommandCenter_dispatchCommandEvent_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  os_signpost_id_t v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (a2)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      objc_msgSend(v7, "playerPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413314;
      v39 = (unint64_t)v9;
      v40 = 2048;
      v41 = v7;
      v42 = 2112;
      v43 = v11;
      v44 = 2114;
      v45 = v12;
      v46 = 2048;
      v47 = v13;
      v14 = "<%@: %p (%@)> RCC: dispatchCommandEvent: failing [command center stopped] - command=%{public}@ event=%p";
LABEL_8:
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, v14, buf, 0x34u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (!WeakRetained || objc_msgSend(WeakRetained, "isInvalidated"))
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v10 = v15;
      objc_msgSend(v7, "playerPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413314;
      v39 = (unint64_t)v15;
      v40 = 2048;
      v41 = v7;
      v42 = 2112;
      v43 = v11;
      v44 = 2114;
      v45 = v16;
      v46 = 2048;
      v47 = v17;
      v14 = "<%@: %p (%@)> RCC: dispatchCommandEvent: failing [command center was invalidated] - command=%{public}@ event=%p";
      goto LABEL_8;
    }
LABEL_9:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5[2](v5);
    goto LABEL_10;
  }
  v18 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v19 = os_signpost_id_make_with_pointer(v18, *(const void **)(a1 + 40));

  v20 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_opt_class();
    v22 = v21;
    objc_msgSend(v7, "playerPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    v39 = (unint64_t)v21;
    v40 = 2048;
    v41 = v7;
    v42 = 2112;
    v43 = v23;
    v44 = 2114;
    v45 = v24;
    v46 = 2048;
    v47 = v25;
    _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: dispatchCommandEvent: command=%{public}@ event=%p", buf, 0x34u);

  }
  v26 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v27 = v26;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    v28 = objc_msgSend(*(id *)(a1 + 32), "mediaRemoteCommandType");
    *(_DWORD *)buf = 134217984;
    v39 = v28;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v19, "CommandDispatch", "commandType=%ld", buf, 0xCu);
  }

  v29 = *(void **)(a1 + 32);
  v30 = *(_QWORD *)(a1 + 40);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __57__MPRemoteCommandCenter_dispatchCommandEvent_completion___block_invoke_27;
  v32[3] = &unk_1E315C870;
  v31 = *(id *)(a1 + 48);
  v37 = v19;
  v35 = v31;
  v32[4] = v7;
  v33 = *(id *)(a1 + 32);
  v34 = *(id *)(a1 + 40);
  v36 = v5;
  objc_msgSend(v29, "invokeCommandWithEvent:completion:", v30, v32);

LABEL_10:
}

uint64_t __57__MPRemoteCommandCenter_dispatchCommandEvent_completion___block_invoke_27(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[7] + 16))();
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  v3 = v2;
  v4 = a1[9];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CommandDispatch", (const char *)&unk_193F291C9, (uint8_t *)&v13, 2u);
  }

  v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = (void *)a1[4];
    v8 = v6;
    objc_msgSend(v7, "playerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[5];
    v11 = a1[6];
    v13 = 138413314;
    v14 = v6;
    v15 = 2048;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p (%@)> RCC: dispatchCommandEvent: command finished command=%{public}@ event=%p", (uint8_t *)&v13, 0x34u);

  }
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

+ (id)commandCenterForPlayerID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5F0]), "initWithIdentifier:displayName:", v3, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4C5F0], "defaultPlayer");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  v6 = objc_alloc(MEMORY[0x1E0D4C5F8]);
  objc_msgSend(MEMORY[0x1E0D4C5B8], "localOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4C510], "localClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithOrigin:client:player:", v7, v8, v5);

  objc_msgSend((id)objc_opt_class(), "commandCenterForPlayerPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
