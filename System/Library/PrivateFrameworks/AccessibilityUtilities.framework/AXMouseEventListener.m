@implementation AXMouseEventListener

void __38__AXMouseEventListener_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXMouseEventListener _init]([AXMouseEventListener alloc], "_init");
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

}

- (id)discoveredMouseDevices
{
  os_unfair_lock_s *p_cachedMouseDevicesLock;
  NSSet *cachedMouseDevices;
  id v5;
  NSSet *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const void *v12;
  CFTypeID v13;
  void *v14;
  NSSet *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_cachedMouseDevicesLock = &self->_cachedMouseDevicesLock;
  os_unfair_lock_lock(&self->_cachedMouseDevicesLock);
  cachedMouseDevices = self->_cachedMouseDevices;
  os_unfair_lock_unlock(p_cachedMouseDevicesLock);
  if (!cachedMouseDevices)
  {
    v5 = -[AXDeviceMonitor copyDevices](self->_deviceMonitor, "copyDevices");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(const void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v13 = CFGetTypeID(v12);
          if (v13 == IOHIDDeviceGetTypeID())
          {
            +[AXCustomizableMouse mouseForHIDDevice:](AXCustomizableMouse, "mouseForHIDDevice:", v12, (_QWORD)v18);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14 && !-[NSSet containsObject:](v6, "containsObject:", v14))
              -[NSSet addObject:](v6, "addObject:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    os_unfair_lock_lock(p_cachedMouseDevicesLock);
    v15 = self->_cachedMouseDevices;
    self->_cachedMouseDevices = v6;

    os_unfair_lock_unlock(p_cachedMouseDevicesLock);
  }
  os_unfair_lock_lock(p_cachedMouseDevicesLock);
  -[NSSet allObjects](self->_cachedMouseDevices, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_cachedMouseDevicesLock);
  return v16;
}

- (id)_init
{
  AXMouseEventListener *v2;
  AXMouseEventListener *v3;
  uint64_t v4;
  NSHashTable *observers;
  AXDeviceMonitor *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AXDeviceMonitor *deviceMonitor;
  AXEventProcessor *v11;
  AXEventProcessor *eventProcessor;
  AXEventProcessor *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AXMouseEventListener;
  v2 = -[AXMouseEventListener init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cachedMouseDevicesLock._os_unfair_lock_opaque = 0;
    v2->_observerLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = [AXDeviceMonitor alloc];
    objc_msgSend((id)objc_opt_class(), "_mouseMatching");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXDeviceMonitor initWithMatchingMultiple:callbackRunLoop:](v6, "initWithMatchingMultiple:callbackRunLoop:", v7, v8);
    deviceMonitor = v3->_deviceMonitor;
    v3->_deviceMonitor = (AXDeviceMonitor *)v9;

    -[AXDeviceMonitor setDelegate:](v3->_deviceMonitor, "setDelegate:", v3);
    -[AXDeviceMonitor begin](v3->_deviceMonitor, "begin");
    v11 = -[AXEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]([AXEventProcessor alloc], "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:", CFSTR("AXMouseEventListener"), 70, 0, 0);
    eventProcessor = v3->_eventProcessor;
    v3->_eventProcessor = v11;

    -[AXEventProcessor setHIDEventFilterMask:](v3->_eventProcessor, "setHIDEventFilterMask:", 16);
    objc_initWeak(&location, v3);
    v13 = v3->_eventProcessor;
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __29__AXMouseEventListener__init__block_invoke;
    v19[3] = &unk_1E24C8F48;
    objc_copyWeak(&v20, &location);
    -[AXEventProcessor setHIDEventHandler:](v13, "setHIDEventHandler:", v19);
    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __29__AXMouseEventListener__init__block_invoke_2;
    v17[3] = &unk_1E24C58C0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v15, "registerUpdateBlock:forRetrieveSelector:withListener:", v17, sel_assistiveTouchMouseCustomizedClickActions, v3);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_42);
  return (id)sharedInstance__Shared;
}

+ (id)_mouseMatching
{
  return &unk_1E24F8EA0;
}

uint64_t __29__AXMouseEventListener__init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 3200)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = objc_msgSend(WeakRetained, "_handleMouseButtonEvent:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __29__AXMouseEventListener__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mouseSettingsDidChange");

}

- (void)dealloc
{
  objc_super v3;

  -[AXEventProcessor cleanup](self->_eventProcessor, "cleanup");
  -[AXMouseEventListener endFilteringButtonEvents](self, "endFilteringButtonEvents");
  -[AXDeviceMonitor invalidate](self->_deviceMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AXMouseEventListener;
  -[AXMouseEventListener dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  NSUInteger v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_observerLock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  os_unfair_lock_unlock(&self->_observerLock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    os_unfair_lock_lock(&self->_cachedMouseDevicesLock);
    v4 = -[NSSet count](self->_cachedMouseDevices, "count");
    os_unfair_lock_unlock(&self->_cachedMouseDevicesLock);
    if (v4)
      objc_msgSend(v5, "mouseDevicesChanged:", self);
  }

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observerLock;
  id v5;

  p_observerLock = &self->_observerLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observerLock);
}

- (void)beginFilteringButtonEvents
{
  -[AXEventProcessor beginHandlingHIDEventsForReason:](self->_eventProcessor, "beginHandlingHIDEventsForReason:", CFSTR("Filtering mouse events for AXMouseEventListener"));
}

- (void)endFilteringButtonEvents
{
  if (-[AXEventProcessor isHandlingHIDEvents](self->_eventProcessor, "isHandlingHIDEvents"))
    -[AXEventProcessor endHandlingHIDEventsForReason:](self->_eventProcessor, "endHandlingHIDEventsForReason:", CFSTR("Filtering mouse events for AXMouseEventListener"));
}

- (BOOL)currentDevicesHaveAssistiveTouchCustomActions
{
  void *v2;
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AXMouseEventListener discoveredMouseDevices](self, "discoveredMouseDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "customActionsRequireAssistiveTouch") & 1) != 0)
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

- (void)mouseSettingsDidChange
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  os_unfair_lock_s *p_cachedMouseDevicesLock;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  AXMouseEventListener *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[AXMouseEventListener discoveredMouseDevices](self, "discoveredMouseDevices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v3)
  {
    v22 = obj;
LABEL_35:

    return;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v36;
  v28 = self;
  p_cachedMouseDevicesLock = &self->_cachedMouseDevicesLock;
  v8 = obj;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v36 != v6)
        objc_enumerationMutation(v8);
      v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v10, "identifier", v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXCustomizableMouse _existingMouseForIdentifier:vendorId:productId:](AXCustomizableMouse, "_existingMouseForIdentifier:vendorId:productId:", v11, objc_msgSend(v10, "vendorId"), objc_msgSend(v10, "productId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "hasCustomActions"))
        v13 = v12 == 0;
      else
        v13 = 0;
      if (v13)
      {
        ASTLogMouse();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18C62B000, v19, OS_LOG_TYPE_INFO, "device removed all custom actions", buf, 2u);
        }

        v5 = 1;
      }
      else if (v12)
      {
        os_unfair_lock_lock(p_cachedMouseDevicesLock);
        objc_msgSend(v12, "buttonMap");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "buttonMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToDictionary:", v15);

        if ((v16 & 1) == 0)
        {
          ASTLogMouse();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18C62B000, v17, OS_LOG_TYPE_INFO, "device updated custom actions", buf, 2u);
          }

          objc_msgSend(v12, "buttonMap");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setButtonMap:", v18);

          v5 = 1;
        }
        os_unfair_lock_unlock(p_cachedMouseDevicesLock);
        v8 = obj;
      }

    }
    v4 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  }
  while (v4);

  if ((v5 & 1) != 0)
  {
    os_unfair_lock_lock(&v28->_observerLock);
    -[NSHashTable allObjects](v28->_observers, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&v28->_observerLock);
    ASTLogMouse();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C62B000, v21, OS_LOG_TYPE_INFO, "notifying observers that custom actions did change", buf, 2u);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v27, "mouseCustomActionsDidChange:", v28);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v24);
    }

    goto LABEL_35;
  }
}

- (void)deviceMonitorDidDetectDeviceEvent:(id)a3
{
  os_unfair_lock_s *p_cachedMouseDevicesLock;
  NSSet *cachedMouseDevices;
  void *v6;
  id v7;
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

  v18 = *MEMORY[0x1E0C80C00];
  p_cachedMouseDevicesLock = &self->_cachedMouseDevicesLock;
  os_unfair_lock_lock(&self->_cachedMouseDevicesLock);
  cachedMouseDevices = self->_cachedMouseDevices;
  self->_cachedMouseDevices = 0;

  os_unfair_lock_unlock(p_cachedMouseDevicesLock);
  os_unfair_lock_lock(&self->_observerLock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_observerLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
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
          objc_msgSend(v12, "mouseDevicesChanged:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)_handleMouseButtonEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v14[5];
  id v15;
  double v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "pointerControllerInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "creatorHIDServiceClient");
  v7 = 0;
  if (v5)
  {
    v8 = v6;
    if (v6)
    {
      objc_msgSend(v5, "pointerButtonMask");
      if (v9 != 0.0
        && (v10 = v9, objc_msgSend(v5, "pointerButtonNumber"), (uint64_t)v11 == 1)
        && (objc_msgSend(v5, "pointerButtonClickCount"), (uint64_t)v12))
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __48__AXMouseEventListener__handleMouseButtonEvent___block_invoke;
        v14[3] = &unk_1E24C90D8;
        v14[4] = self;
        v15 = v4;
        v16 = v10;
        v17 = v8;
        dispatch_async(MEMORY[0x1E0C80D38], v14);

        v7 = 1;
      }
      else
      {
        v7 = 0;
      }
    }
  }

  return v7;
}

uint64_t __48__AXMouseEventListener__handleMouseButtonEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishHandlingMouseButtonEvent:buttonMask:creatorHIDServiceClient:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(double *)(a1 + 48));
}

- (void)_finishHandlingMouseButtonEvent:(id)a3 buttonMask:(double)a4 creatorHIDServiceClient:(__IOHIDServiceClient *)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v6 = 0;
  v20 = *MEMORY[0x1E0C80C00];
  while (((a4 >> v6) & 1) == 0)
  {
    if ((_DWORD)++v6 == 65534)
      return;
  }
  +[AXCustomizableMouse mouseForHIDServiceClient:](AXCustomizableMouse, "mouseForHIDServiceClient:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    os_unfair_lock_lock(&self->_observerLock);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_observerLock);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "mouseEventListener:customizableMouse:interceptedMouseButton:", self, v7, v6 + 1, (_QWORD)v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedMouseDevices, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
}

@end
