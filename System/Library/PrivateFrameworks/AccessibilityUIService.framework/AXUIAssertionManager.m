@implementation AXUIAssertionManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__AXUIAssertionManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)_AXUIAssertionManager;
}

void __38__AXUIAssertionManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_AXUIAssertionManager;
  _AXUIAssertionManager = v0;

}

- (AXUIAssertionManager)init
{
  AXUIAssertionManager *v2;
  uint64_t v3;
  NSMutableSet *clientsWithUIAssertion;
  id v5;
  void *v6;
  uint64_t v7;
  AXDispatchTimer *timerUI;
  uint64_t v9;
  AXDispatchTimer *timerBackground;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXUIAssertionManager;
  v2 = -[AXUIAssertionManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    clientsWithUIAssertion = v2->_clientsWithUIAssertion;
    v2->_clientsWithUIAssertion = (NSMutableSet *)v3;

    v5 = objc_alloc(MEMORY[0x24BDFE490]);
    v6 = (void *)MEMORY[0x24BDAC9B8];
    v7 = objc_msgSend(v5, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    timerUI = v2->_timerUI;
    v2->_timerUI = (AXDispatchTimer *)v7;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_timerUI, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", v6);
    timerBackground = v2->_timerBackground;
    v2->_timerBackground = (AXDispatchTimer *)v9;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_timerBackground, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AXUIAssertionManager _invalidateAssertionUI](self, "_invalidateAssertionUI");
  -[AXUIAssertionManager _invalidateAssertion](self, "_invalidateAssertion");
  v3.receiver = self;
  v3.super_class = (Class)AXUIAssertionManager;
  -[AXUIAssertionManager dealloc](&v3, sel_dealloc);
}

- (void)acquireAssertionIfNeeded
{
  void *v3;
  RBSAssertion *assertionBackground;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  void *v9;
  RBSAssertion *v10;
  RBSAssertion *v11;
  NSObject *v12;
  RBSAssertion *v13;
  _QWORD v14[5];
  uint8_t buf[16];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[AXUIAssertionManager timerBackground](self, "timerBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  assertionBackground = self->_assertionBackground;
  AXLogAssertions();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (assertionBackground)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E2A000, v5, OS_LOG_TYPE_DEFAULT, "Background Assertion was already requested, skip", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E2A000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring Background assertion", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE80D38], "currentProcess");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.AccessibilityUIServer"), CFSTR("AXUIServerBackground"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE80B10]);
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (RBSAssertion *)objc_msgSend(v8, "initWithExplanation:target:attributes:", CFSTR("AXUIServer Running Background Tasks"), v5, v9);
    v11 = self->_assertionBackground;
    self->_assertionBackground = v10;

    AXLogAssertions();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E2A000, v12, OS_LOG_TYPE_DEFAULT, "About to acquire AXUIServer RB assertion com.apple.AccessibilityUIServer::AXUIServerBackground", buf, 2u);
    }

    v13 = self->_assertionBackground;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__AXUIAssertionManager_acquireAssertionIfNeeded__block_invoke;
    v14[3] = &unk_24D49C8E8;
    v14[4] = self;
    -[RBSAssertion acquireWithInvalidationHandler:](v13, "acquireWithInvalidationHandler:", v14);

  }
}

void __48__AXUIAssertionManager_acquireAssertionIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  switch(objc_msgSend(v6, "code"))
  {
    case 0:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated - Unknown Error: %@. %@";
      goto LABEL_14;
    case 1:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated: %@. %@";
      goto LABEL_14;
    case 2:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v8;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_DEFAULT, "RB assertion invalidated - Invalid Parameters: %@. %@. %@", (uint8_t *)&v12, 0x20u);

      goto LABEL_15;
    case 3:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated - Permission Denied: %@. %@";
      goto LABEL_14;
    case 4:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated - Constraint Unmet: %@. %@";
      goto LABEL_14;
    case 5:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated - Conditions Denied: %@. %@";
LABEL_14:
      _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
LABEL_15:

LABEL_16:
LABEL_17:
      v11 = *(_QWORD *)(a1 + 32);
      if (*(id *)(v11 + 16) == v5)
      {
        *(_QWORD *)(v11 + 16) = 0;

      }
      return;
    default:
      goto LABEL_17;
  }
}

- (void)invalidateAssertionIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[AXUIAssertionManager timerBackground](self, "timerBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__AXUIAssertionManager_invalidateAssertionIfNeeded__block_invoke;
  v4[3] = &unk_24D49C910;
  v4[4] = self;
  objc_msgSend(v3, "afterDelay:processBlock:", v4, 30.0);

}

void __51__AXUIAssertionManager_invalidateAssertionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  AXLogAssertions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215E2A000, v2, OS_LOG_TYPE_DEFAULT, "invalidateAssertionIfNeeded timer", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "assertionBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[AXUIServiceManager sharedServiceManager](AXUIServiceManager, "sharedServiceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_servicesCount");

    if (v5)
    {
      AXLogAssertions();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_215E2A000, v6, OS_LOG_TYPE_DEFAULT, "Can't invalidate Background Assertion, still services are registered", v7, 2u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidateAssertion");
    }
  }
}

- (void)acquireAssertionUIIfNeeded
{
  void *v3;
  RBSAssertion *assertionUI;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  RBSAssertion *v11;
  RBSAssertion *v12;
  RBSAssertion *v13;
  _QWORD v14[5];
  uint8_t buf[8];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  -[AXUIAssertionManager timerUI](self, "timerUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  assertionUI = self->_assertionUI;
  AXLogAssertions();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (assertionUI)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E2A000, v5, OS_LOG_TYPE_DEFAULT, "UI Assertion was already requested, skip", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E2A000, v5, OS_LOG_TYPE_DEFAULT, "Acquiring UI assertion", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE80D38], "currentProcess");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.AccessibilityUIServer"), CFSTR("LegacyUIOverlay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B98], "grantWithNamespace:endowment:", CFSTR("com.apple.frontboard.visibility"), MEMORY[0x24BDBD1C8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x24BE80B10]);
    v16[0] = v7;
    v16[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (RBSAssertion *)objc_msgSend(v9, "initWithExplanation:target:attributes:", CFSTR("AXUIServer Showing UI"), v5, v10);
    v12 = self->_assertionUI;
    self->_assertionUI = v11;

    v13 = self->_assertionUI;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __50__AXUIAssertionManager_acquireAssertionUIIfNeeded__block_invoke;
    v14[3] = &unk_24D49C8E8;
    v14[4] = self;
    -[RBSAssertion acquireWithInvalidationHandler:](v13, "acquireWithInvalidationHandler:", v14);

  }
}

void __50__AXUIAssertionManager_acquireAssertionUIIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  switch(objc_msgSend(v6, "code"))
  {
    case 0:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated - Unknown Error: %@. %@";
      goto LABEL_14;
    case 1:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated: %@. %@";
      goto LABEL_14;
    case 2:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v8;
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_DEFAULT, "RB assertion invalidated - Invalid Parameters: %@. %@. %@", (uint8_t *)&v12, 0x20u);

      goto LABEL_15;
    case 3:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated - Permission Denied: %@. %@";
      goto LABEL_14;
    case 4:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated - Constraint Unmet: %@. %@";
      goto LABEL_14;
    case 5:
      AXLogAssertions();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v8;
      v9 = "RB assertion invalidated - Conditions Denied: %@. %@";
LABEL_14:
      _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
LABEL_15:

LABEL_16:
LABEL_17:
      v11 = *(_QWORD *)(a1 + 32);
      if (*(id *)(v11 + 8) == v5)
      {
        *(_QWORD *)(v11 + 8) = 0;

      }
      return;
    default:
      goto LABEL_17;
  }
}

- (void)invalidateAssertionUIIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[AXUIAssertionManager timerUI](self, "timerUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__AXUIAssertionManager_invalidateAssertionUIIfNeeded__block_invoke;
  v4[3] = &unk_24D49C910;
  v4[4] = self;
  objc_msgSend(v3, "afterDelay:processBlock:", v4, 30.0);

}

void __53__AXUIAssertionManager_invalidateAssertionUIIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  AXLogAssertions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_215E2A000, v2, OS_LOG_TYPE_DEFAULT, "invalidateAssertionUIIfNeeded timer", (uint8_t *)&v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "assertionUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientsWithUIAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      AXLogAssertions();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "clientsWithUIAssertion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v7;
        _os_log_impl(&dword_215E2A000, v6, OS_LOG_TYPE_DEFAULT, "Can't invalidate UI Assertion, still clients with UI assertion %@", (uint8_t *)&v11, 0xCu);

      }
    }
    else
    {
      +[AXUIDisplayManager sharedDisplayManager](AXUIDisplayManager, "sharedDisplayManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allWindowsHidden");

      if ((v9 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_invalidateAssertionUI");
      }
      else
      {
        AXLogAssertions();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_215E2A000, v10, OS_LOG_TYPE_DEFAULT, "Can't invalidate UI Assertion, still UI is presented", (uint8_t *)&v11, 2u);
        }

      }
    }
  }
}

- (void)acquireAssertionUIIfNeededForService:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v6, "serviceTypeForClientWithIdentifier:", v7);
  else
    v8 = 0;
  AXLogAssertions();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109634;
    v11[1] = v8;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_215E2A000, v9, OS_LOG_TYPE_DEFAULT, "serviceType: %d, client: %@, service: %@", (uint8_t *)v11, 0x1Cu);
  }

  if (v8)
  {
    -[AXUIAssertionManager _serviceClientIDForService:clientIdentifier:](self, "_serviceClientIDForService:clientIdentifier:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[NSMutableSet addObject:](self->_clientsWithUIAssertion, "addObject:", v10);
    -[AXUIAssertionManager acquireAssertionUIIfNeeded](self, "acquireAssertionUIIfNeeded");

  }
}

- (void)invalidateAssertionUIIfNeededForService:(id)a3 clientIdentifier:(id)a4
{
  id v5;

  -[AXUIAssertionManager _serviceClientIDForService:clientIdentifier:](self, "_serviceClientIDForService:clientIdentifier:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_clientsWithUIAssertion, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_clientsWithUIAssertion, "removeObject:", v5);
    -[AXUIAssertionManager invalidateAssertionUIIfNeeded](self, "invalidateAssertionUIIfNeeded");
  }

}

- (void)_invalidateAssertion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215E2A000, v3, v4, "RB assertion invalidation error: %@. %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_invalidateAssertionUI
{
  RBSAssertion *assertionUI;
  RBSAssertion **p_assertionUI;
  id v4;
  NSObject *v5;
  RBSAssertion *v6;
  NSObject *v7;
  uint8_t v8[8];
  id v9;

  p_assertionUI = &self->_assertionUI;
  assertionUI = self->_assertionUI;
  v9 = 0;
  -[RBSAssertion invalidateWithError:](assertionUI, "invalidateWithError:", &v9);
  v4 = v9;
  if (v4)
  {
    AXLogAssertions();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXUIAssertionManager _invalidateAssertion].cold.1((uint64_t)p_assertionUI, v4);

  }
  v6 = *p_assertionUI;
  *p_assertionUI = 0;

  AXLogAssertions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_DEFAULT, "Invalidated UI assertion", v8, 2u);
  }

}

- (id)_serviceClientIDForService:(id)a3 clientIdentifier:(id)a4
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a4;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (RBSAssertion)assertionUI
{
  return self->_assertionUI;
}

- (void)setAssertionUI:(id)a3
{
  objc_storeStrong((id *)&self->_assertionUI, a3);
}

- (RBSAssertion)assertionBackground
{
  return self->_assertionBackground;
}

- (void)setAssertionBackground:(id)a3
{
  objc_storeStrong((id *)&self->_assertionBackground, a3);
}

- (AXDispatchTimer)timerUI
{
  return self->_timerUI;
}

- (void)setTimerUI:(id)a3
{
  objc_storeStrong((id *)&self->_timerUI, a3);
}

- (AXDispatchTimer)timerBackground
{
  return self->_timerBackground;
}

- (void)setTimerBackground:(id)a3
{
  objc_storeStrong((id *)&self->_timerBackground, a3);
}

- (NSMutableSet)clientsWithUIAssertion
{
  return self->_clientsWithUIAssertion;
}

- (void)setClientsWithUIAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_clientsWithUIAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsWithUIAssertion, 0);
  objc_storeStrong((id *)&self->_timerBackground, 0);
  objc_storeStrong((id *)&self->_timerUI, 0);
  objc_storeStrong((id *)&self->_assertionBackground, 0);
  objc_storeStrong((id *)&self->_assertionUI, 0);
}

@end
