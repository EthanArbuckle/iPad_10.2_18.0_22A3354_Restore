@implementation AXPointerDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_19);
  return (id)sharedInstance_deviceManager;
}

void __40__AXPointerDeviceManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXPointerDeviceManager _init]([AXPointerDeviceManager alloc], "_init");
  v1 = (void *)sharedInstance_deviceManager;
  sharedInstance_deviceManager = (uint64_t)v0;

}

- (id)_init
{
  AXPointerDeviceManager *v2;
  AXPointerDeviceManager *v3;
  uint64_t v4;
  NSMutableSet *lock_cachedMousePointerDevices;
  uint64_t v6;
  NSHashTable *lock_observers;
  void *v8;
  uint64_t v9;
  BSInvalidatable *pointerDeviceObserverAssertion;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXPointerDeviceManager;
  v2 = -[AXPointerDeviceManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_devicesLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    lock_cachedMousePointerDevices = v3->_lock_cachedMousePointerDevices;
    v3->_lock_cachedMousePointerDevices = (NSMutableSet *)v4;

    v3->_observersLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v6;

    objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addPointerDeviceObserver:", v3);
    v9 = objc_claimAutoreleasedReturnValue();
    pointerDeviceObserverAssertion = v3->_pointerDeviceObserverAssertion;
    v3->_pointerDeviceObserverAssertion = (BSInvalidatable *)v9;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_pointerDeviceObserverAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AXPointerDeviceManager;
  -[AXPointerDeviceManager dealloc](&v3, sel_dealloc);
}

- (NSArray)connectedDevices
{
  os_unfair_lock_s *p_devicesLock;
  void *v4;

  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  -[NSMutableSet allObjects](self->_lock_cachedMousePointerDevices, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_devicesLock);
  return (NSArray *)v4;
}

- (BOOL)containsTrackpad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AXPointerDeviceManager connectedDevices](self, "connectedDevices");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "senderDescriptor", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "hardwareType");

        if (v7 == 9)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsDragLockCompatibleDevice
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AXPointerDeviceManager connectedDevices](self, "connectedDevices");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "supportsDragLock", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)sendUpdateToObservers
{
  os_unfair_lock_s *p_observersLock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable allObjects](self->_lock_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observersLock);
  -[AXPointerDeviceManager connectedDevices](self, "connectedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "connectedPointerDevicesDidChange:", v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)mousePointerDevicesDidConnect:(id)a3
{
  os_unfair_lock_s *p_devicesLock;
  id v5;

  p_devicesLock = &self->_devicesLock;
  v5 = a3;
  os_unfair_lock_lock(p_devicesLock);
  -[NSMutableSet unionSet:](self->_lock_cachedMousePointerDevices, "unionSet:", v5);

  os_unfair_lock_unlock(p_devicesLock);
  -[AXPointerDeviceManager sendUpdateToObservers](self, "sendUpdateToObservers");
}

- (void)mousePointerDevicesDidDisconnect:(id)a3
{
  os_unfair_lock_s *p_devicesLock;
  id v5;

  p_devicesLock = &self->_devicesLock;
  v5 = a3;
  os_unfair_lock_lock(p_devicesLock);
  -[NSMutableSet minusSet:](self->_lock_cachedMousePointerDevices, "minusSet:", v5);

  os_unfair_lock_unlock(p_devicesLock);
  -[AXPointerDeviceManager sendUpdateToObservers](self, "sendUpdateToObservers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_cachedMousePointerDevices, 0);
  objc_storeStrong((id *)&self->_pointerDeviceObserverAssertion, 0);
}

@end
