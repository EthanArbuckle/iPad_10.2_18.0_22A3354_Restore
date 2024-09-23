@implementation _GCCurrentApplicationForegroundMonitor

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_Shared;
}

- (_GCCurrentApplicationForegroundMonitor)init
{
  _GCCurrentApplicationForegroundMonitor *v2;
  uint64_t v3;
  NSMutableSet *observers;
  _GCCurrentApplicationForegroundMonitor *v5;
  void (**v6)(_QWORD);
  _GCCurrentApplicationForegroundMonitor *v7;
  _QWORD v9[4];
  _GCCurrentApplicationForegroundMonitor *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_GCCurrentApplicationForegroundMonitor;
  v2 = -[_GCCurrentApplicationForegroundMonitor init](&v11, sel_init);
  v3 = objc_opt_new();
  observers = v2->_observers;
  v2->_observers = (NSMutableSet *)v3;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46___GCCurrentApplicationForegroundMonitor_init__block_invoke;
  v9[3] = &unk_24D2B2B20;
  v5 = v2;
  v10 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x2199DEBB0](v9);
  if (+[NSThread isMainThread](&off_254DF2490, "isMainThread"))
    v6[2](v6);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v6);
  v7 = v5;

  return v7;
}

- (BOOL)isAppInBackground
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_appInBackground);
  return v2 & 1;
}

- (void)addObserver:(int)a3 notifyCurrent:
{
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a2;
  if (a1)
  {
    if (a3)
    {
      if (+[NSThread isMainThread](&off_254DF2490, "isMainThread"))
      {
        -[_GCCurrentApplicationForegroundMonitor addObserver:](a1, v5);
        if (objc_msgSend(a1, "isAppInBackground"))
          objc_msgSend(v5, "CBApplicationWillResignActive");
        else
          objc_msgSend(v5, "CBApplicationDidBecomeActive");
      }
      else
      {
        v6[0] = MEMORY[0x24BDAC760];
        v6[1] = 3221225472;
        v6[2] = __68___GCCurrentApplicationForegroundMonitor_addObserver_notifyCurrent___block_invoke;
        v6[3] = &unk_24D2B2B48;
        v6[4] = a1;
        v7 = v5;
        dispatch_async(MEMORY[0x24BDAC9B8], v6);

      }
    }
    else
    {
      -[_GCCurrentApplicationForegroundMonitor addObserver:](a1, v5);
    }
  }

}

- (void)addObserver:(void *)a1
{
  id *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    objc_msgSend(v3[1], "addObject:", v4);
    objc_sync_exit(v3);

  }
}

- (void)removeObserver:(void *)a1
{
  id *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    objc_msgSend(v3[1], "removeObject:", v4);
    objc_sync_exit(v3);

  }
}

- (void)CBApplicationDidBecomeActive
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  os_activity_scope_state_s state;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    v2 = a1;
    objc_sync_enter(v2);
    v3 = (void *)objc_msgSend(*((id *)v2 + 1), "copy");
    objc_sync_exit(v2);

    v4 = _os_activity_create(&dword_215181000, "Notify ApplicationDidBecomeActive ", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    objc_msgSend(v2, "willChangeValueForKey:", CFSTR("appInBackground"));
    atomic_store(0, (unsigned __int8 *)v2 + 16);
    objc_msgSend(v2, "didChangeValueForKey:", CFSTR("appInBackground"));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "CBApplicationDidBecomeActive", (_QWORD)v10);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v6);
    }

    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCApplicationDidBecomeActiveNotification"), 0, 0);

    os_activity_scope_leave(&state);
  }
}

- (void)CBApplicationWillResignActive
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  os_activity_scope_state_s state;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    v2 = a1;
    objc_sync_enter(v2);
    v3 = (void *)objc_msgSend(*((id *)v2 + 1), "copy");
    objc_sync_exit(v2);

    v4 = _os_activity_create(&dword_215181000, "Notify ApplicationWillResignActive ", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    objc_msgSend(v2, "willChangeValueForKey:", CFSTR("appInBackground"));
    atomic_store(1u, (unsigned __int8 *)v2 + 16);
    objc_msgSend(v2, "didChangeValueForKey:", CFSTR("appInBackground"));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "CBApplicationWillResignActive", (_QWORD)v10);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v6);
    }

    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCApplicationWillResignActiveNotification"), 0, 0);

    os_activity_scope_leave(&state);
  }
}

- (void)CBApplicationDidBecomeActive:(id)a3
{
  _QWORD block[5];

  if (+[NSThread isMainThread](&off_254DF2490, "isMainThread", a3))
  {
    -[_GCCurrentApplicationForegroundMonitor CBApplicationDidBecomeActive](self);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71___GCCurrentApplicationForegroundMonitor_CBApplicationDidBecomeActive___block_invoke;
    block[3] = &unk_24D2B2B20;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)CBApplicationWillResignActive:(id)a3
{
  _QWORD block[5];

  if (+[NSThread isMainThread](&off_254DF2490, "isMainThread", a3))
  {
    -[_GCCurrentApplicationForegroundMonitor CBApplicationWillResignActive](self);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72___GCCurrentApplicationForegroundMonitor_CBApplicationWillResignActive___block_invoke;
    block[3] = &unk_24D2B2B20;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
