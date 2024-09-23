@implementation MRUAudioModuleController

- (MRUSpatialAudioController)spatialAudioController
{
  MRUSpatialAudioController *spatialAudioController;
  MRUSpatialAudioController *v4;
  MRUSpatialAudioController *v5;

  spatialAudioController = self->_spatialAudioController;
  if (!spatialAudioController)
  {
    v4 = -[MRUSpatialAudioController initWithOutputDeviceRouteController:]([MRUSpatialAudioController alloc], "initWithOutputDeviceRouteController:", self->_outputDeviceRouteController);
    v5 = self->_spatialAudioController;
    self->_spatialAudioController = v4;

    -[MRUSpatialAudioController setDelegate:](self->_spatialAudioController, "setDelegate:", self);
    spatialAudioController = self->_spatialAudioController;
  }
  return spatialAudioController;
}

- (MRUListeningModeController)listeningModeController
{
  MRUListeningModeController *listeningModeController;
  MRUListeningModeController *v4;
  MRUListeningModeController *v5;

  listeningModeController = self->_listeningModeController;
  if (!listeningModeController)
  {
    v4 = -[MRUListeningModeController initWithOutputDeviceRouteController:]([MRUListeningModeController alloc], "initWithOutputDeviceRouteController:", self->_outputDeviceRouteController);
    v5 = self->_listeningModeController;
    self->_listeningModeController = v4;

    -[MRUListeningModeController setDelegate:](self->_listeningModeController, "setDelegate:", self);
    listeningModeController = self->_listeningModeController;
  }
  return listeningModeController;
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUConversationAwarenessController)conversationAwarenessController
{
  MRUConversationAwarenessController *conversationAwarenessController;
  MRUConversationAwarenessController *v4;
  MRUConversationAwarenessController *v5;

  conversationAwarenessController = self->_conversationAwarenessController;
  if (!conversationAwarenessController)
  {
    v4 = -[MRUConversationAwarenessController initWithOutputDeviceRouteController:]([MRUConversationAwarenessController alloc], "initWithOutputDeviceRouteController:", self->_outputDeviceRouteController);
    v5 = self->_conversationAwarenessController;
    self->_conversationAwarenessController = v4;

    -[MRUConversationAwarenessController setDelegate:](self->_conversationAwarenessController, "setDelegate:", self);
    conversationAwarenessController = self->_conversationAwarenessController;
  }
  return conversationAwarenessController;
}

- (void)spatialAudioController:(id)a3 didChangeAvailableSpatialModes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioModuleController:spatialAudioController:didChangeAvailableSpatialModes:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (MRUSystemVolumeController)volumeController
{
  MRUSystemVolumeController *volumeController;
  MRUSystemVolumeController *v4;
  MRUSystemVolumeController *v5;

  volumeController = self->_volumeController;
  if (!volumeController)
  {
    v4 = -[MRUSystemVolumeController initWithOutputDeviceRouteController:]([MRUSystemVolumeController alloc], "initWithOutputDeviceRouteController:", self->_outputDeviceRouteController);
    v5 = self->_volumeController;
    self->_volumeController = v4;

    -[MRUSystemVolumeController setDelegate:](self->_volumeController, "setDelegate:", self);
    volumeController = self->_volumeController;
  }
  return volumeController;
}

- (void)spatialAudioController:(id)a3 didChangeSelectedSpatialMode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioModuleController:spatialAudioController:didChangeSelectedSpatialMode:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)spatialAudioController:(id)a3 didChangeNowPlayingInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioModuleController:spatialAudioController:didChangeNowPlayingInfo:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

+ (MRUAudioModuleController)sharedController
{
  if (sharedController___once_0 != -1)
    dispatch_once(&sharedController___once_0, &__block_literal_global_7);
  return (MRUAudioModuleController *)(id)sharedController___sharedController_0;
}

void __44__MRUAudioModuleController_sharedController__block_invoke()
{
  MRUAudioModuleController *v0;
  void *v1;

  v0 = objc_alloc_init(MRUAudioModuleController);
  v1 = (void *)sharedController___sharedController_0;
  sharedController___sharedController_0 = (uint64_t)v0;

}

- (MRUAudioModuleController)init
{
  void *v3;
  MRUAudioModuleController *v4;

  +[MRUSystemOutputDeviceRouteController sharedController](MRUSystemOutputDeviceRouteController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MRUAudioModuleController initWithOutputDeviceRouteController:](self, "initWithOutputDeviceRouteController:", v3);

  return v4;
}

- (MRUAudioModuleController)initWithOutputDeviceRouteController:(id)a3
{
  id v5;
  MRUAudioModuleController *v6;
  uint64_t v7;
  NSHashTable *observers;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRUAudioModuleController;
  v6 = -[MRUAudioModuleController init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    -[MRUSystemOutputDeviceRouteController addObserver:](v6->_outputDeviceRouteController, "addObserver:", v6);
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "audioModuleController:systemOutputDeviceRouteControllerDidUpdateOutputDevices:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "audioModuleController:systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)conversationAwarenessController:(id)a3 didChangeConversationAwarenessEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "audioModuleController:conversationAwarenessController:didChangeConversationAwarenessEnabled:", self, v6, v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)conversationAwarenessController:(id)a3 didChangeConversationAwarenessSupported:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "audioModuleController:conversationAwarenessController:didChangeConversationAwarenessSupported:", self, v6, v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)listeningModeController:(id)a3 didChangeAvailablePrimaryListeningMode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioModuleController:listeningModeController:didChangeAvailablePrimaryListeningMode:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)listeningModeController:(id)a3 didChangePrimaryListeningMode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioModuleController:listeningModeController:didChangePrimaryListeningMode:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)listeningModeController:(id)a3 didChangeAvailableSecondaryListeningModes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioModuleController:listeningModeController:didChangeAvailableSecondaryListeningModes:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)listeningModeController:(id)a3 didChangeSecondaryListeningMode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "audioModuleController:listeningModeController:didChangeSecondaryListeningMode:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)systemVolumeController:(id)a3 didChangeVolumeControlCapabilities:(unsigned int)a4 effectiveVolumeValue:(float)a5 forType:(int64_t)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v8 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          *(float *)&v17 = a5;
          objc_msgSend(v16, "audioModuleController:volumeController:didChangeVolumeControlCapabilities:effectiveVolumeValue:forType:", self, v10, v8, a6, v17);
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_spatialAudioController, 0);
  objc_storeStrong((id *)&self->_listeningModeController, 0);
  objc_storeStrong((id *)&self->_conversationAwarenessController, 0);
}

@end
