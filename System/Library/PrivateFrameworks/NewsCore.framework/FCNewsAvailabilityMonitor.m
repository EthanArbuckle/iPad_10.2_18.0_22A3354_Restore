@implementation FCNewsAvailabilityMonitor

- (FCNewsAvailabilityMonitor)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNewsAvailabilityMonitor init]";
    v9 = 2080;
    v10 = "FCNewsAvailabilityMonitor.m";
    v11 = 1024;
    v12 = 60;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCNewsAvailabilityMonitor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCNewsAvailabilityMonitor)initWithApplicationProxy:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  FCNewsAvailabilityMonitor *v8;
  uint64_t v9;
  NSMutableArray *blocks;
  uint64_t v11;
  LSApplicationProxy *applicationProxy;
  __CFNotificationCenter *DistributedCenter;
  __CFNotificationCenter *v14;
  __CFNotificationCenter *v15;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "applicationProxy");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCNewsAvailabilityMonitor initWithApplicationProxy:queue:]";
    v22 = 2080;
    v23 = "FCNewsAvailabilityMonitor.m";
    v24 = 1024;
    v25 = 65;
    v26 = 2114;
    v27 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "queue");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCNewsAvailabilityMonitor initWithApplicationProxy:queue:]";
    v22 = 2080;
    v23 = "FCNewsAvailabilityMonitor.m";
    v24 = 1024;
    v25 = 66;
    v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v19.receiver = self;
  v19.super_class = (Class)FCNewsAvailabilityMonitor;
  v8 = -[FCNewsAvailabilityMonitor init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    blocks = v8->_blocks;
    v8->_blocks = (NSMutableArray *)v9;

    v11 = objc_msgSend(v6, "copy");
    applicationProxy = v8->_applicationProxy;
    v8->_applicationProxy = (LSApplicationProxy *)v11;

    objc_storeStrong((id *)&v8->_queue, a4);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v8, (CFNotificationCallback)applicationStateNotificationCallback, CFSTR("com.apple.LaunchServices.applicationStateChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v14 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v14, v8, (CFNotificationCallback)applicationRegisteredAndUnregisteredNotificationCallback, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v15 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v15, v8, (CFNotificationCallback)applicationRegisteredAndUnregisteredNotificationCallback, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[FCNewsAvailabilityMonitor _updateAvailability](v8, "_updateAvailability");
  }

  return v8;
}

- (FCNewsAvailabilityMonitor)initWithProcessVariant:(unint64_t)a3 queue:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  FCNewsAvailabilityMonitor *v13;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "queue");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCNewsAvailabilityMonitor initWithProcessVariant:queue:]";
    v18 = 2080;
    v19 = "FCNewsAvailabilityMonitor.m";
    v20 = 1024;
    v21 = 104;
    v22 = 2114;
    v23 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a3 - 1 >= 2)
  {
    if (a3)
    {
      v7 = 0;
    }
    else
    {
      v8 = (objc_class *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      FCCheckedDynamicCast(v8, (uint64_t)v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (objc_class *)objc_opt_class();
      objc_msgSend(v10, "containingBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      FCCheckedDynamicCast(v11, (uint64_t)v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.news"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[FCNewsAvailabilityMonitor initWithApplicationProxy:queue:](self, "initWithApplicationProxy:queue:", v7, v6);

  return v13;
}

- (FCNewsAvailabilityMonitor)initWithProcessVariant:(unint64_t)a3
{
  return -[FCNewsAvailabilityMonitor initWithProcessVariant:queue:](self, "initWithProcessVariant:queue:", a3, MEMORY[0x1E0C80D38]);
}

- (void)setNewsIsAvailable:(BOOL)a3
{
  self->_NewsIsAvailable = a3;
}

- (void)dealloc
{
  __CFNotificationCenter *DistributedCenter;
  objc_super v4;

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)FCNewsAvailabilityMonitor;
  -[FCNewsAvailabilityMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)isNewsAvailable
{
  return self->_NewsIsAvailable;
}

- (void)addNotificationBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "notificationBlock");
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCNewsAvailabilityMonitor addNotificationBlock:]";
    v10 = 2080;
    v11 = "FCNewsAvailabilityMonitor.m";
    v12 = 1024;
    v13 = 162;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCNewsAvailabilityMonitor blocks](self, "blocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(v4);
  objc_msgSend(v5, "addObject:", v6);

}

- (void)_updateAvailability
{
  int NewsIsAvailable;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  NewsIsAvailable = self->_NewsIsAvailable;
  v4 = -[FCNewsAvailabilityMonitor _isNewsAvailable](self, "_isNewsAvailable");
  if (NewsIsAvailable != v4)
  {
    self->_NewsIsAvailable = v4;
    -[FCNewsAvailabilityMonitor blocks](self, "blocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)_isNewsAvailable
{
  void *v2;
  void *v3;
  char v4;

  -[FCNewsAvailabilityMonitor applicationProxy](self, "applicationProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isRestricted") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isInstalled");

  return v4;
}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void)setBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_blocks, a3);
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (void)setApplicationProxy:(id)a3
{
  objc_storeStrong((id *)&self->_applicationProxy, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
