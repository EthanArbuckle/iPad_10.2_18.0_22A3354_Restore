@implementation ASDNotificationCenter

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3884A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_deliverNotifications_, 0, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_deliverProgress_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_deliverViewPresentationRequest_resultHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_deliverViewPresentationRequest_resultHandler_, 0, 1);

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_deliverAuthenticateRequest_withResultHandler_, 1, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_deliverDialogRequest_withResultHandler_, 1, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_deliverEngagementRequest_withResultHandler_, 1, 1);

  return v2;
}

+ (id)defaultCenter
{
  if (qword_1ECFFAB68 != -1)
    dispatch_once(&qword_1ECFFAB68, &__block_literal_global_24);
  return (id)_MergedGlobals_50;
}

- (void)addProgressObserver:(id)a3
{
  os_unfair_lock_s *p_observerLock;
  id v5;

  p_observerLock = &self->_observerLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  -[NSHashTable addObject:](self->_progressObservers, "addObject:", v5);

  os_unfair_lock_unlock(p_observerLock);
}

- (void)addNotificationObserver:(id)a3 forName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_observerLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationObservers, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_notificationObservers, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);
  os_unfair_lock_unlock(&self->_observerLock);

}

void __38__ASDNotificationCenter_defaultCenter__block_invoke()
{
  ASDNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(ASDNotificationCenter);
  v1 = (void *)_MergedGlobals_50;
  _MergedGlobals_50 = (uint64_t)v0;

}

- (ASDNotificationCenter)init
{
  ASDNotificationCenter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  NSMutableSet *v6;
  NSMutableSet *activeProgress;
  NSMutableDictionary *v8;
  NSMutableDictionary *notificationObservers;
  uint64_t v10;
  NSHashTable *progressObservers;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASDNotificationCenter;
  v2 = -[ASDNotificationCenter init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.AppStoreDaemon.ASDNotificationCenter", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_observerLock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeProgress = v2->_activeProgress;
    v2->_activeProgress = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notificationObservers = v2->_notificationObservers;
    v2->_notificationObservers = v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    progressObservers = v2->_progressObservers;
    v2->_progressObservers = (NSHashTable *)v10;

  }
  return v2;
}

- (void)setDialogObserver:(id)a3
{
  os_unfair_lock_s *p_observerLock;
  id v5;

  p_observerLock = &self->_observerLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  objc_storeWeak((id *)&self->_dialogObserver, v5);

  os_unfair_lock_unlock(p_observerLock);
}

- (ASDNotificationCenterDialogObserver)dialogObserver
{
  os_unfair_lock_s *p_observerLock;
  id WeakRetained;

  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dialogObserver);
  os_unfair_lock_unlock(p_observerLock);
  return (ASDNotificationCenterDialogObserver *)WeakRetained;
}

- (void)removeNotificationObserver:(id)a3 forName:(id)a4
{
  os_unfair_lock_s *p_observerLock;
  id v7;
  id v8;
  id v9;

  p_observerLock = &self->_observerLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_observerLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_notificationObservers, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v8);
  os_unfair_lock_unlock(p_observerLock);

}

- (void)removeProgressObserver:(id)a3
{
  os_unfair_lock_s *p_observerLock;
  id v5;

  p_observerLock = &self->_observerLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  -[NSHashTable removeObject:](self->_progressObservers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observerLock);
}

- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ASDNotificationCenter_deliverAuthenticateRequest_withResultHandler___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __70__ASDNotificationCenter_deliverAuthenticateRequest_withResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dialogObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "handleAuthenticateRequest:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 1060, CFSTR("No dialog observer was available to handle the request"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
}

- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ASDNotificationCenter_deliverDialogRequest_withResultHandler___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __64__ASDNotificationCenter_deliverDialogRequest_withResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dialogObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "handleDialogRequest:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 1060, CFSTR("No dialog observer was available to handle the request"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
}

- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ASDNotificationCenter_deliverEngagementRequest_withResultHandler___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__ASDNotificationCenter_deliverEngagementRequest_withResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dialogObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "handleEngagementRequest:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 1060, CFSTR("No dialog observer was available to handle the engagement request"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
}

- (void)deliverNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  ASDNotificationCenter *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v13 = (id)objc_opt_class();
    v14 = 2112;
    v15 = v4;
    v6 = v13;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_INFO, "[%@]: Received notifications: %@", buf, 0x16u);

  }
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__ASDNotificationCenter_deliverNotifications___block_invoke;
  v9[3] = &unk_1E37BDC98;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_async(dispatchQueue, v9);

}

void __46__ASDNotificationCenter_deliverNotifications___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "addObject:", v8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__ASDNotificationCenter_deliverNotifications___block_invoke_2;
  v13[3] = &unk_1E37BFA08;
  v13[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v13);

}

void __46__ASDNotificationCenter_deliverNotifications___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  id v18;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v7 = (os_unfair_lock_s *)(v6 + 32);
    v8 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v6 + 32));
    objc_msgSend(*(id *)(v6 + 24), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v9, "copy");
    os_unfair_lock_unlock(v7);
    v11 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  dispatch_get_global_queue(21, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ASDNotificationCenter_deliverNotifications___block_invoke_3;
  block[3] = &unk_1E37BDE50;
  v16 = v10;
  v17 = v11;
  v18 = v5;
  v13 = v5;
  v14 = v10;
  dispatch_async(v12, block);

}

void __46__ASDNotificationCenter_deliverNotifications___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x19AEC59A8](v3);
        objc_msgSend(v7, "notificationCenter:receivedNotifications:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v9);
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = v3;
    }
    while (v3);
  }

}

- (void)deliverProgress:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v12 = (id)objc_opt_class();
    v13 = 2112;
    v14 = v4;
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_INFO, "[%@]: Received progress: %@", buf, 0x16u);

  }
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__ASDNotificationCenter_deliverProgress___block_invoke;
  v9[3] = &unk_1E37BDC98;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(dispatchQueue, v9);

}

void __41__ASDNotificationCenter_deliverProgress___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  float v10;
  float v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = v2;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v31 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v8, "bundleID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            if (objc_msgSend(v8, "completedUnitCount"))
            {
              v10 = (float)objc_msgSend(v8, "completedUnitCount");
              v11 = v10 / (float)objc_msgSend(v8, "totalUnitCount");
            }
            else
            {
              v11 = 0.0;
            }
            if ((objc_msgSend(*(id *)(v1 + 8), "containsObject:", v9) & 1) != 0)
            {
              if (v11 >= 1.0)
              {
                ASDLogHandleForCategory(12);
                v12 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  v13 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138543874;
                  v35 = v13;
                  v36 = 2114;
                  v37 = v9;
                  v38 = 2048;
                  v39 = v11;
                  v14 = v13;
                  _os_log_impl(&dword_19A03B000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Completed progress reporting progress at: %.2f", buf, 0x20u);

                }
                if (objc_msgSend(*(id *)(v1 + 8), "containsObject:", v9))
                  objc_msgSend(*(id *)(v1 + 8), "removeObject:", v9);
              }
            }
            else
            {
              ASDLogHandleForCategory(12);
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                v16 = (void *)objc_opt_class();
                v17 = v16;
                v18 = objc_msgSend(v8, "completedUnitCount");
                *(_DWORD *)buf = 138544130;
                v35 = v16;
                v36 = 2114;
                v37 = v9;
                v38 = 2048;
                v39 = v11;
                v40 = 2048;
                v41 = v18;
                _os_log_impl(&dword_19A03B000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Starting progress reporting at: %.2f complete: %lld", buf, 0x2Au);

              }
              objc_msgSend(*(id *)(v1 + 8), "addObject:", v9);
            }
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v5);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
    v2 = v24;
  }

  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
  {
    v20 = (os_unfair_lock_s *)(v19 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v19 + 32));
    v19 = objc_msgSend(*(id *)(v19 + 40), "copy");
    os_unfair_lock_unlock(v20);
    v21 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v21 = 0;
  }
  dispatch_get_global_queue(21, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ASDNotificationCenter_deliverProgress___block_invoke_2;
  block[3] = &unk_1E37BDE50;
  v27 = (id)v19;
  v28 = v21;
  v29 = *(id *)(a1 + 40);
  v23 = (id)v19;
  dispatch_async(v22, block);

}

void __41__ASDNotificationCenter_deliverProgress___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x19AEC59A8](v3);
        objc_msgSend(v7, "notificationCenter:receivedProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v9);
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = v3;
    }
    while (v3);
  }

}

- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ASDNotificationCenter_deliverViewPresentationRequest_resultHandler___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __70__ASDNotificationCenter_deliverViewPresentationRequest_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "dialogObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "handleViewPresentationRequest:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 48);
    ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 1060, CFSTR("No dialog observer was available to handle the request"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  }
}

- (void)isDialogObserverAvailableWithReplyHandler:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[ASDNotificationCenter dialogObserver](self, "dialogObserver");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, BOOL))a3 + 2))(v5, v6 != 0);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dialogObserver);
  objc_storeStrong((id *)&self->_progressObservers, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeProgress, 0);
}

@end
