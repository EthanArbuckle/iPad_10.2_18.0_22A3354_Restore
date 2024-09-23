@implementation SFLocationManager

+ (id)sharedLocationManager
{
  if (sharedLocationManager_onceToken != -1)
    dispatch_once(&sharedLocationManager_onceToken, &__block_literal_global_13);
  return (id)sharedLocationManager_shared;
}

void __42__SFLocationManager_sharedLocationManager__block_invoke()
{
  SFLocationManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFLocationManager);
  v1 = (void *)sharedLocationManager_shared;
  sharedLocationManager_shared = (uint64_t)v0;

}

+ (void)setDefaultEffectiveBundleIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C9E3C8], "setDefaultEffectiveBundleIdentifier:", a3);
}

- (SFLocationManager)init
{
  SFLocationManager *v2;
  NSCountedSet *v3;
  NSCountedSet *clients;
  uint64_t v5;
  BKSApplicationStateMonitor *stateMonitor;
  NSMutableSet *v7;
  NSMutableSet *foregroundApplications;
  SFLocationManager *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFLocationManager;
  v2 = -[SFLocationManager init](&v14, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    clients = v2->_clients;
    v2->_clients = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE2F0]), "initWithBundleIDs:states:", 0, 0);
    stateMonitor = v2->_stateMonitor;
    v2->_stateMonitor = (BKSApplicationStateMonitor *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    foregroundApplications = v2->_foregroundApplications;
    v2->_foregroundApplications = v7;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __25__SFLocationManager_init__block_invoke;
    v11[3] = &unk_1E4AC1E08;
    objc_copyWeak(&v12, &location);
    -[BKSApplicationStateMonitor setHandler:](v2->_stateMonitor, "setHandler:", v11);
    v9 = v2;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __25__SFLocationManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__SFLocationManager_init__block_invoke_2;
  v5[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __25__SFLocationManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleApplicationStateChange:", *(_QWORD *)(a1 + 32));

}

- (void)_updateAssertion
{
  int v3;
  CLInUseAssertion *assertion;
  CLInUseAssertion *v5;
  CLInUseAssertion *v6;

  v3 = -[NSMutableSet intersectsSet:](self->_foregroundApplications, "intersectsSet:", self->_clients);
  assertion = self->_assertion;
  if (v3)
  {
    if (assertion)
      return;
    v5 = (CLInUseAssertion *)objc_msgSend(MEMORY[0x1E0C9E3A8], "newAssertionForBundleIdentifier:withReason:level:", CFSTR("com.apple.mobilesafari"), CFSTR("SFSafariViewController is being used by a foreground app."), 1);
  }
  else
  {
    if (!assertion)
      return;
    -[CLInUseAssertion invalidate](assertion, "invalidate");
    v5 = 0;
  }
  v6 = self->_assertion;
  self->_assertion = v5;

}

- (void)_handleApplicationStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    v9 = 0;
    switch(v8)
    {
      case 0:
      case 2:
      case 4:
        goto LABEL_12;
      case 1:
        if (-[NSCountedSet containsObject:](self->_clients, "containsObject:", v6, 0))
        {
          do
            -[NSCountedSet removeObject:](self->_clients, "removeObject:", v6);
          while ((-[NSCountedSet containsObject:](self->_clients, "containsObject:", v6) & 1) != 0);
        }
        goto LABEL_11;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_9;
      case 8:
        goto LABEL_8;
      default:
        if (v8 == 16)
          goto LABEL_12;
        if (v8 == 32)
        {
LABEL_8:
          v9 = 1;
        }
        else
        {
LABEL_9:
          v10 = WBS_LOG_CHANNEL_PREFIXViewService();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[SFLocationManager _handleApplicationStateChange:].cold.1(v8, v10);
LABEL_11:
          v9 = 0;
        }
LABEL_12:
        -[SFLocationManager _setApplication:isForeground:](self, "_setApplication:isForeground:", v6, v9);

        break;
    }
  }

}

- (void)_setApplication:(id)a3 isForeground:(BOOL)a4
{
  int v4;
  NSMutableSet *foregroundApplications;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[NSMutableSet containsObject:](self->_foregroundApplications, "containsObject:") != v4
    && -[NSCountedSet containsObject:](self->_clients, "containsObject:", v7))
  {
    foregroundApplications = self->_foregroundApplications;
    if (v4)
      -[NSMutableSet addObject:](foregroundApplications, "addObject:", v7);
    else
      -[NSMutableSet removeObject:](foregroundApplications, "removeObject:", v7);
    -[SFLocationManager _updateAssertion](self, "_updateAssertion");
  }

}

- (void)_updateApplicationsToMonitor
{
  uint64_t v3;
  BKSApplicationStateMonitor *stateMonitor;
  id v5;

  if (-[NSCountedSet count](self->_clients, "count"))
    v3 = *MEMORY[0x1E0CFE290];
  else
    v3 = 0;
  stateMonitor = self->_stateMonitor;
  -[NSCountedSet allObjects](self->_clients, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BKSApplicationStateMonitor updateInterestedBundleIDs:states:](stateMonitor, "updateInterestedBundleIDs:states:", v5, v3);

}

- (void)addClientForApplication:(id)a3
{
  char v4;
  BKSApplicationStateMonitor *stateMonitor;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[NSCountedSet containsObject:](self->_clients, "containsObject:", v7);
  -[NSCountedSet addObject:](self->_clients, "addObject:", v7);
  if ((v4 & 1) == 0)
    -[SFLocationManager _updateApplicationsToMonitor](self, "_updateApplicationsToMonitor");
  stateMonitor = self->_stateMonitor;
  -[BKSApplicationStateMonitor handler](stateMonitor, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSApplicationStateMonitor applicationInfoForApplication:completion:](stateMonitor, "applicationInfoForApplication:completion:", v7, v6);

}

- (void)removeClientForApplication:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[NSCountedSet containsObject:](self->_clients, "containsObject:", v6);
  v5 = v6;
  if (v4)
  {
    -[NSCountedSet removeObject:](self->_clients, "removeObject:", v6);
    if ((-[NSCountedSet containsObject:](self->_clients, "containsObject:", v6) & 1) == 0)
    {
      -[NSMutableSet removeObject:](self->_foregroundApplications, "removeObject:", v6);
      -[SFLocationManager _updateApplicationsToMonitor](self, "_updateApplicationsToMonitor");
    }
    -[SFLocationManager _updateAssertion](self, "_updateAssertion");
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_foregroundApplications, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)_handleApplicationStateChange:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "Unknown BKSApplicationState value %u", (uint8_t *)v2, 8u);
}

@end
