@implementation MCMVolumeChangeMonitor

- (MCMVolumeChangeMonitor)initWithWorkloop:(id)a3 mountPointURL:(id)a4
{
  NSObject *v6;
  id v7;
  MCMVolumeChangeMonitor *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *notificationQueue;
  uint64_t v13;
  NSHashTable *observers;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MCMVolumeChangeMonitor;
  v8 = -[MCMVolumeChangeMonitor init](&v16, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.volume_change_notification", v10, v6);
    notificationQueue = v8->_notificationQueue;
    v8->_notificationQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v13;

    objc_storeStrong((id *)&v8->_mountPointURL, a4);
    v8->_state = 0;
    v8->_notifier = 0;

  }
  return v8;
}

- (void)addObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MCMVolumeChangeMonitor observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MCMVolumeChangeMonitor observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MCMVolumeChangeMonitor observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[MCMVolumeChangeMonitor observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)start
{
  void *v3;
  mach_port_t v4;
  IONotificationPortRef v5;
  IONotificationPort *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  const __CFDictionary *v15;
  io_service_t MatchingService;
  io_service_t v17;
  mach_error_t v18;
  NSObject *v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  NSObject *v25;
  IONotificationPort *v26;
  MCMVolumeChangeMonitor *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  uint64_t v34;
  uint8_t buf[32];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!-[MCMVolumeChangeMonitor started](self, "started"))
  {
    -[MCMVolumeChangeMonitor setStarted:](self, "setStarted:", 1);
    -[MCMVolumeChangeMonitor _volumesToMonitor](self, "_volumesToMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0CBBAA8];
    v5 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
    if (!v5)
    {
      v37 = 0u;
      v38 = 0u;
      v36 = 0u;
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      v33 = 134217984;
      v34 = 0;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
    v6 = v5;
    v27 = self;
    -[MCMVolumeChangeMonitor notificationQueue](self, "notificationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v26 = v6;
    IONotificationPortSetDispatchQueue(v6, v7);

    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v3;
      _os_log_impl(&dword_1CF807000, v8, OS_LOG_TYPE_DEFAULT, "Monitoring [%@]", buf, 0xCu);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i));
          v15 = IOBSDNameMatching(v4, 0, (const char *)objc_msgSend(v14, "UTF8String"));
          MatchingService = IOServiceGetMatchingService(v4, v15);
          if (MatchingService)
          {
            v17 = MatchingService;
            if (IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
            {
              v18 = IOServiceAddInterestNotification(v26, v17, "IOGeneralInterest", (IOServiceInterestCallback)_MCMVolumeChangeMonitorCallback, v27, &v27->_notifier);
              container_log_handle_for_category();
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = v19;
              if (v18)
              {
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v21 = mach_error_string(v18);
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v14;
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = v21;
                  v22 = v20;
                  v23 = "failed to register volume interest notification for: %@ with error: %s";
                  v24 = 22;
                  goto LABEL_20;
                }
              }
              else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v14;
                _os_log_impl(&dword_1CF807000, v20, OS_LOG_TYPE_DEFAULT, "registered volume interest notification for: %@", buf, 0xCu);
              }
            }
            else
            {
              container_log_handle_for_category();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v14;
                v22 = v20;
                v23 = "unable to monitor: %@ for freeze notifications, not an APFS volume";
                v24 = 12;
LABEL_20:
                _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, v23, buf, v24);
              }
            }

            IOObjectRelease(v17);
            continue;
          }
          container_log_handle_for_category();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v14;
            _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "failed to find IOKit object for volume: %@", buf, 0xCu);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
      }
      while (v11);
    }

  }
}

- (void)dealloc
{
  io_object_t notifier;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  notifier = self->_notifier;
  if (notifier)
    IOObjectRelease(notifier);
  v4.receiver = self;
  v4.super_class = (Class)MCMVolumeChangeMonitor;
  -[MCMVolumeChangeMonitor dealloc](&v4, sel_dealloc);
}

- (void)_callbackWithVolume:(unsigned int)a3 notificationType:(unsigned int)a4 margs:(void *)a5
{
  MCMVolumeChangeMonitor *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;

  v6 = self;
  objc_sync_enter(v6);
  v7 = -[MCMVolumeChangeMonitor state](v6, "state");
  v8 = v7;
  v9 = a4 + 536330234;
  v10 = v7;
  switch(v9)
  {
    case 0u:
      v10 = v7 | 1;
      break;
    case 1u:
      v10 = v7 & 0xFFFFFFFFFFFFFFFELL;
      break;
    case 4u:
      v10 = v7 | 2;
      break;
    case 5u:
      v10 = v7 & 0xFFFFFFFFFFFFFFFDLL;
      break;
    default:
      break;
  }
  -[MCMVolumeChangeMonitor setState:](v6, "setState:", v10);
  objc_sync_exit(v6);

  -[MCMVolumeChangeMonitor _notifyObserversIfNeededWithOldState:newState:](v6, "_notifyObserversIfNeededWithOldState:newState:", v8, v10);
}

- (void)_notifyObserversIfNeededWithOldState:(unint64_t)a3 newState:(unint64_t)a4
{
  if (a3 != a4)
    -[MCMVolumeChangeMonitor _notifyObserversOfEvents:newVolumeState:](self, "_notifyObserversOfEvents:newVolumeState:", -[MCMVolumeChangeMonitor _changeEventStart:end:targetActiveState:fromOldState:newState:](self, "_changeEventStart:end:targetActiveState:fromOldState:newState:", 4, 8, 2, a3, a4) | -[MCMVolumeChangeMonitor _changeEventStart:end:targetActiveState:fromOldState:newState:](self, "_changeEventStart:end:targetActiveState:fromOldState:newState:", 1, 2, 1, a3, a4), a4);
}

- (void)_notifyObserversOfEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MCMVolumeChangeMonitor observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[MCMVolumeChangeMonitor observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_sync_exit(v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v10);
        -[MCMVolumeChangeMonitor _notifyObserver:events:newVolumeState:](self, "_notifyObserver:events:newVolumeState:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), a3, a4);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v11);
  }

}

- (void)_notifyObserver:(id)a3 events:(unint64_t)a4 newVolumeState:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "volumeChangedDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__MCMVolumeChangeMonitor__notifyObserver_events_newVolumeState___block_invoke;
  v10[3] = &unk_1E8CB5938;
  v11 = v7;
  v12 = a4;
  v13 = a5;
  v9 = v7;
  dispatch_async(v8, v10);

}

- (unint64_t)_changeEventStart:(unint64_t)a3 end:(unint64_t)a4 targetActiveState:(unint64_t)a5 fromOldState:(unint64_t)a6 newState:(unint64_t)a7
{
  if ((a7 & a5) != 0)
    a4 = a3;
  if (((a7 ^ a6) & a5) != 0)
    return a4;
  else
    return 0;
}

- (id)_volumesToMonitor
{
  void *v2;
  mach_error_t BootDevice;
  mach_error_t v4;
  NSObject *v5;
  mach_error_t v6;
  mach_error_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BootDevice = APFSContainerGetBootDevice();
  if (BootDevice)
  {
    v4 = BootDevice;
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = mach_error_string(v4);
      _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "APFSContainerGetBootDevice failed; error = %s",
        buf,
        0xCu);
    }
  }
  else
  {
    v17 = 0;
    v5 = objc_retainAutorelease(0);
    -[NSObject UTF8String](v5, "UTF8String");
    v6 = APFSVolumeRoleFind();
    if (v6)
    {
      v7 = v6;
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = mach_error_string(v7);
        _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "APFSVolumeRoleFind failed; error = %s", buf, 0xCu);
      }
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = 0;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "substringFromIndex:", 5, v17);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v13);

          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
        }
        while (v10);
      }

    }
  }

  if (!objc_msgSend(v2, "count"))
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "No volumes to monitor", buf, 2u);
    }

  }
  v15 = (void *)objc_msgSend(v2, "copy", v17);

  return v15;
}

- (NSURL)mountPointURL
{
  return self->_mountPointURL;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_mountPointURL, 0);
}

uint64_t __64__MCMVolumeChangeMonitor__notifyObserver_events_newVolumeState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "volumeChangedWithEvents:newVolumeState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
