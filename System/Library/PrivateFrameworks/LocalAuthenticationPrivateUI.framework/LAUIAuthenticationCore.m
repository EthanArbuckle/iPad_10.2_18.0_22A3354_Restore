@implementation LAUIAuthenticationCore

- (LAUIAuthenticationCore)initWithMechanisms:(unint64_t)a3
{
  return -[LAUIAuthenticationCore initWithMechanisms:context:](self, "initWithMechanisms:context:", a3, 0);
}

- (LAUIAuthenticationCore)initWithMechanisms:(unint64_t)a3 context:(id)a4
{
  id v7;
  LAUIAuthenticationCore *v8;
  LAUIAuthenticationCore *v9;
  uint64_t v10;
  LAContext *context;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LAUIAuthenticationCore;
  v8 = -[LAUIAuthenticationCore init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_context, a4);
    }
    else
    {
      v10 = objc_opt_new();
      context = v9->_context;
      v9->_context = (LAContext *)v10;

      v9->_usesInternalContext = 1;
    }
    -[LAUIAuthenticationCore _setupMechanisms:](v9, "_setupMechanisms:", a3);
    -[LAUIAuthenticationCore _setupNotifications:](v9, "_setupNotifications:", 1);
    v9->_applicationActive = 1;
  }

  return v9;
}

- (void)_setupMechanisms:(unint64_t)a3
{
  -[LAUIAuthenticationCore setActiveMechanisms:](self, "setActiveMechanisms:", 0);
  -[LAUIAuthenticationCore _enableAvailableMechanisms:](self, "_enableAvailableMechanisms:", a3);
}

- (void)_enableAvailableMechanisms:(unint64_t)a3
{
  unint64_t v5;

  -[LAUIAuthenticationCore setEnabledMechanisms:](self, "setEnabledMechanisms:", 0);
  if (a3)
  {
    v5 = 1;
    do
    {
      if ((v5 & a3) != 0)
      {
        if (-[LAUIAuthenticationCore isMechanismAvailable:error:](self, "isMechanismAvailable:error:", v5, 0))
          -[LAUIAuthenticationCore setEnabledMechanisms:](self, "setEnabledMechanisms:", -[LAUIAuthenticationCore enabledMechanisms](self, "enabledMechanisms") | v5);
      }
      v5 *= 2;
    }
    while (v5 <= a3);
  }
}

- (void)_setupNotifications:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[LAUIAuthenticationCore notificationNames](self, "notificationNames", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__notification_, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isMechanismAvailable:(unint64_t)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id LAErrorHelperClass;

  v5 = a3 == 4;
  if (a3 != 4)
  {
    if (!a4)
      return 0;
    LAErrorHelperClass = getLAErrorHelperClass();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported mechanism: %d"), a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(LAErrorHelperClass, "internalErrorWithMessage:", v11);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[LAUIAuthenticationCore context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    -[LAUIAuthenticationCore setContext:](self, "setContext:", v8);

  }
  -[LAUIAuthenticationCore context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canEvaluatePolicy:error:", v5, a4);

  if (!-[LAUIAuthenticationCore biometryType](self, "biometryType"))
  {
    -[LAUIAuthenticationCore context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_biometryType = objc_msgSend(v11, "biometryType");
LABEL_8:

  }
  return v10;
}

- (BOOL)isMechanismEnabled:(unint64_t)a3
{
  return (-[LAUIAuthenticationCore enabledMechanisms](self, "enabledMechanisms") & a3) != 0;
}

- (BOOL)isMechanismActive:(unint64_t)a3
{
  return (-[LAUIAuthenticationCore activeMechanisms](self, "activeMechanisms") & a3) != 0;
}

- (BOOL)enableMechanism:(unint64_t)a3 error:(id *)a4
{
  return -[LAUIAuthenticationCore _mechanism:enable:error:](self, "_mechanism:enable:error:", a3, 1, a4);
}

- (BOOL)disableMechanism:(unint64_t)a3 error:(id *)a4
{
  return -[LAUIAuthenticationCore _mechanism:enable:error:](self, "_mechanism:enable:error:", a3, 0, a4);
}

- (BOOL)_mechanism:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  NSObject *v9;
  void *v10;
  const char *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, int);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  LA_LOG_LAUIAuthenticationCore();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[LAUIAuthenticationCore delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = "disabling";
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    if (v6)
      v11 = "enabling";
    v25 = 2082;
    v26 = v11;
    v27 = 1024;
    v28 = a3;
    _os_log_impl(&dword_209E00000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is %{public}s mechanism: %d", buf, 0x1Cu);

  }
  if (v6)
  {
    v22 = 0;
    v12 = -[LAUIAuthenticationCore isMechanismAvailable:error:](self, "isMechanismAvailable:error:", a3, &v22);
    v13 = v22;
    if (v12)
    {
      -[LAUIAuthenticationCore setEnabledMechanisms:](self, "setEnabledMechanisms:", -[LAUIAuthenticationCore enabledMechanisms](self, "enabledMechanisms") | a3);
      if (a3 == 4
        && -[LAUIAuthenticationCore biometryType](self, "biometryType") == 2
        && (-[LAUIAuthenticationCore activeMechanisms](self, "activeMechanisms") & 4) != 0)
      {
        objc_initWeak((id *)buf, self);
        -[LAUIAuthenticationCore context](self, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = MEMORY[0x24BDAC760];
        v18 = 3221225472;
        v19 = __50__LAUIAuthenticationCore__mechanism_enable_error___block_invoke;
        v20 = &unk_24C27ECB8;
        objc_copyWeak(&v21, (id *)buf);
        objc_msgSend(v14, "retryProcessedEvent:reply:", 7, &v17);

        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
    }
    if (v13)
    {
      v15 = 0;
      if (!a5)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else
  {
    -[LAUIAuthenticationCore setEnabledMechanisms:](self, "setEnabledMechanisms:", -[LAUIAuthenticationCore enabledMechanisms](self, "enabledMechanisms") & ~a3);
  }
  -[LAUIAuthenticationCore startOrStopBackgroundMechanisms](self, "startOrStopBackgroundMechanisms", v17, v18, v19, v20);
  v13 = 0;
  v15 = 1;
  if (a5)
LABEL_16:
    *a5 = objc_retainAutorelease(v13);
LABEL_17:

  return v15;
}

void __50__LAUIAuthenticationCore__mechanism_enable_error___block_invoke(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
    WeakRetained[8] = 0;

}

- (void)setEnabledMechanisms:(unint64_t)a3
{
  unint64_t enabledMechanisms;
  int v4;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  enabledMechanisms = self->_enabledMechanisms;
  if (enabledMechanisms != a3)
  {
    v4 = a3;
    self->_enabledMechanisms = a3;
    LA_LOG_LAUIAuthenticationCore();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[LAUIAuthenticationCore delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v7;
      v10 = 1024;
      v11 = enabledMechanisms;
      v12 = 1024;
      v13 = v4;
      _os_log_debug_impl(&dword_209E00000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ has changed enabled mechanisms from %d to %d", (uint8_t *)&v8, 0x18u);

    }
  }
}

- (void)setActiveMechanisms:(unint64_t)a3
{
  unint64_t activeMechanisms;
  int v4;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  activeMechanisms = self->_activeMechanisms;
  if (activeMechanisms != a3)
  {
    v4 = a3;
    self->_activeMechanisms = a3;
    LA_LOG_LAUIAuthenticationCore();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[LAUIAuthenticationCore delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v7;
      v10 = 1024;
      v11 = activeMechanisms;
      v12 = 1024;
      v13 = v4;
      _os_log_debug_impl(&dword_209E00000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ has changed active mechanisms from %d to %d", (uint8_t *)&v8, 0x18u);

    }
  }
}

- (void)startOrStopBackgroundMechanisms
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[LAUIAuthenticationCore startOrStopBackgroundMechanisms]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_209E00000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (int64_t)_policyForBackgroundMechanisms
{
  return -[LAUIAuthenticationCore isMechanismEnabled:](self, "isMechanismEnabled:", 4);
}

- (void)_startBackgroundMechanisms
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  LAContext *context;
  void *v8;
  void *v9;
  int64_t v10;
  unint64_t v11;
  int v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  LAContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_usesInternalContext)
  {
    -[LAUIAuthenticationCore context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    v4 = (void *)objc_opt_new();
    -[LAUIAuthenticationCore setContext:](self, "setContext:", v4);

  }
  LA_LOG_LAUIAuthenticationCore();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[LAUIAuthenticationCore delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2114;
    v22 = context;
    _os_log_impl(&dword_209E00000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will use %{public}@", buf, 0x16u);

  }
  -[LAUIAuthenticationCore context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAUIAuthenticationCore context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUiDelegate:", self);

  v10 = -[LAUIAuthenticationCore _policyForBackgroundMechanisms](self, "_policyForBackgroundMechanisms");
  if (v10)
  {
    v11 = -[LAUIAuthenticationCore enabledMechanisms](self, "enabledMechanisms") & 4;
    -[LAUIAuthenticationCore setActiveMechanisms:](self, "setActiveMechanisms:", -[LAUIAuthenticationCore activeMechanisms](self, "activeMechanisms") | v11);
    v18 = 0;
    v12 = objc_msgSend(v8, "canEvaluatePolicy:error:", v10, &v18);
    v13 = v18;
    if (v12)
    {
      objc_initWeak((id *)buf, self);
      -[LAUIAuthenticationCore _optionsForBackgroundMechanism](self, "_optionsForBackgroundMechanism");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __52__LAUIAuthenticationCore__startBackgroundMechanisms__block_invoke;
      v15[3] = &unk_24C27ECE0;
      objc_copyWeak(v17, (id *)buf);
      v17[1] = (id)v11;
      v16 = v8;
      objc_msgSend(v16, "evaluatePolicy:options:reply:", v10, v14, v15);

      objc_destroyWeak(v17);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[LAUIAuthenticationCore _handleBackgroundMechanismsResult:error:context:](self, "_handleBackgroundMechanismsResult:error:context:", 0, v13, v8);
    }

  }
}

void __52__LAUIAuthenticationCore__startBackgroundMechanisms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setActiveMechanisms:", objc_msgSend(WeakRetained, "activeMechanisms") & ~*(_QWORD *)(a1 + 48));
    objc_msgSend(v7, "_handleBackgroundMechanismsResult:error:context:", v8, v5, *(_QWORD *)(a1 + 32));
  }

}

- (id)_optionsForBackgroundMechanism
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", MEMORY[0x24BDBD1C8], &unk_24C284F48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LAUIAuthenticationCore isMechanismEnabled:](self, "isMechanismEnabled:", 4))
  {
    -[LAUIAuthenticationCore delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callerIconPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[LAUIAuthenticationCore delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callerIconBundlePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "length");
    v9 = v5;
    if (v8 || (v10 = objc_msgSend(v7, "length", v5), v9 = v7, v10))
      objc_msgSend(v3, "setObject:forKey:", v9, &unk_24C284F60);
    -[LAUIAuthenticationCore delegate](self, "delegate", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedCallerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v3, "setObject:forKey:", v12, &unk_24C284F78);
    if (-[LAUIAuthenticationCore biometryType](self, "biometryType") == 2)
    {
      v16 = &unk_24C284FA8;
      v17 = &unk_24C284FA8;
      v18 = &unk_24C284F90;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v14, &unk_24C284FC0);

    }
  }
  return v3;
}

- (void)_handleBackgroundMechanismsResult:(id)a3 error:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  -[LAUIAuthenticationCore context](self, "context");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    if (v17)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", &unk_24C284FD8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "BOOLValue"))
      {
        v13 = -[LAUIAuthenticationCore biometryType](self, "biometryType");

        if (v13 == 2)
        {
          objc_storeStrong((id *)&self->_faceIdResult, a3);
          goto LABEL_12;
        }
      }
      else
      {

      }
      -[LAUIAuthenticationCore delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v17;
    }
    else
    {
      if ((objc_msgSend(getLAErrorHelperClass(), "error:hasCode:", v9, -9) & 1) != 0)
        goto LABEL_12;
      -[LAUIAuthenticationCore delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = 0;
    }
    objc_msgSend(v14, "authenticationResult:error:context:", v16, v9, v10);

    goto LABEL_12;
  }
  objc_msgSend(v10, "invalidate");
LABEL_12:

}

- (void)_stopBackgroundMechanisms
{
  NSObject *v3;
  void *v4;
  LAContext *context;
  LAContext *v6;
  int v7;
  void *v8;
  __int16 v9;
  LAContext *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_context && self->_usesInternalContext)
  {
    LA_LOG_LAUIAuthenticationCore();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[LAUIAuthenticationCore delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      context = self->_context;
      v7 = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = context;
      _os_log_impl(&dword_209E00000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will discard %{public}@", (uint8_t *)&v7, 0x16u);

    }
    -[LAContext invalidate](self->_context, "invalidate");
    v6 = self->_context;
    self->_context = 0;

  }
  -[LAUIAuthenticationCore setActiveMechanisms:](self, "setActiveMechanisms:", -[LAUIAuthenticationCore activeMechanisms](self, "activeMechanisms") & (~-[LAUIAuthenticationCore enabledMechanisms](self, "enabledMechanisms") | 0xFFFFFFFFFFFFFFFBLL));
  if (-[LAUIAuthenticationCore isMechanismEnabled:](self, "isMechanismEnabled:", 4))
    -[LAUIAuthenticationCore _biometryState:](self, "_biometryState:", 0);
}

- (id)notificationNames
{
  if (notificationNames_onceToken != -1)
    dispatch_once(&notificationNames_onceToken, &__block_literal_global_4);
  return (id)notificationNames_notificationNames;
}

void __43__LAUIAuthenticationCore_notificationNames__block_invoke()
{
  void *v0;

  v0 = (void *)notificationNames_notificationNames;
  notificationNames_notificationNames = MEMORY[0x24BDBD1A8];

}

- (void)_notification:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__LAUIAuthenticationCore__notification___block_invoke;
  v5[3] = &unk_24C27EA18;
  objc_copyWeak(&v6, &location);
  -[LAUIAuthenticationCore _processActivityChangeForNotification:block:](self, "_processActivityChangeForNotification:block:", v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __40__LAUIAuthenticationCore__notification___block_invoke(uint64_t a1)
{

}

- (void)checkView
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__LAUIAuthenticationCore_checkView__block_invoke;
  v3[3] = &unk_24C27EA18;
  objc_copyWeak(&v4, &location);
  -[LAUIAuthenticationCore _processActivityChangeForNotification:block:](self, "_processActivityChangeForNotification:block:", 0, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __35__LAUIAuthenticationCore_checkView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyWindow:", objc_msgSend(v3, "isKeyWindow"));

    WeakRetained = v4;
  }

}

- (void)setView:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_storeWeak((id *)&self->_view, v4);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__LAUIAuthenticationCore_setView___block_invoke;
  v6[3] = &unk_24C27ED08;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[LAUIAuthenticationCore _processActivityChangeForNotification:block:](self, "_processActivityChangeForNotification:block:", 0, v6);
  -[LAUIAuthenticationCore startOrStopBackgroundMechanisms](self, "startOrStopBackgroundMechanisms");

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __34__LAUIAuthenticationCore_setView___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setKeyWindow:", objc_msgSend(v2, "isKeyWindow"));

  }
}

- (void)_processActivityChangeForNotification:(id)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  _BOOL4 v7;
  _BOOL8 v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = -[LAUIAuthenticationCore isUiActive](self, "isUiActive");
  if (v6)
    v6[2](v6);
  if (-[LAUIAuthenticationCore isApplicationActive](self, "isApplicationActive"))
    v8 = -[LAUIAuthenticationCore isKeyWindow](self, "isKeyWindow");
  else
    v8 = 0;
  -[LAUIAuthenticationCore setUiActive:](self, "setUiActive:", v8);
  if (v7 != -[LAUIAuthenticationCore isUiActive](self, "isUiActive"))
  {
    -[LAUIAuthenticationCore startOrStopBackgroundMechanisms](self, "startOrStopBackgroundMechanisms");
    -[LAUIAuthenticationCore delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[LAUIAuthenticationCore delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "notification:original:mechanism:", -[LAUIAuthenticationCore isUiActive](self, "isUiActive"), v12, 0);

    }
  }

}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  LAUIAuthenticationCore *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t v22[16];

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24C284FF0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");
  if (a3 == 7 || a3 == 1)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24C285008);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      self->_mirroringToDefaultUI = objc_msgSend(v12, "BOOLValue");
      -[LAUIAuthenticationCore _biometryState:](self, "_biometryState:", self->_lastState);
    }
    if (v10)
    {
      self->_doneMatching = v11 ^ 1;
      v14 = v11;
      v15 = self;
    }
    else if (-[LAUIAuthenticationCore _simpleStatusInParams:touchId:faceId:](self, "_simpleStatusInParams:touchId:faceId:", v8, 0, 0))
    {
      v15 = self;
      v14 = 2;
    }
    else
    {
      if (-[LAUIAuthenticationCore _simpleStatusInParams:touchId:faceId:](self, "_simpleStatusInParams:touchId:faceId:", v8, 1, 1))
      {
        goto LABEL_13;
      }
      if (-[LAUIAuthenticationCore _simpleStatusInParams:touchId:faceId:](self, "_simpleStatusInParams:touchId:faceId:", v8, 2, 2))
      {
        v15 = self;
        v14 = 4;
        goto LABEL_14;
      }
      if (-[LAUIAuthenticationCore _simpleStatusInParams:touchId:faceId:](self, "_simpleStatusInParams:touchId:faceId:", v8, -1, 10))
      {
LABEL_13:
        v15 = self;
        v14 = 1;
        goto LABEL_14;
      }
      if (!-[LAUIAuthenticationCore _simpleStatusInParams:touchId:faceId:](self, "_simpleStatusInParams:touchId:faceId:", v8, -1, 11))
      {
        if (-[LAUIAuthenticationCore _simpleStatusInParams:touchId:faceId:](self, "_simpleStatusInParams:touchId:faceId:", v8, 3, 3))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24C285020);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16
            || (objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24C285038),
                (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[LAUIAuthenticationCore setEnabledMechanisms:](self, "setEnabledMechanisms:", -[LAUIAuthenticationCore enabledMechanisms](self, "enabledMechanisms") & 0xFFFFFFFFFFFFFFFBLL);
          }
          -[LAUIAuthenticationCore _biometryState:](self, "_biometryState:", 5);
          -[LAUIAuthenticationCore _biometricNoMatchWithBiolockoutError:](self, "_biometricNoMatchWithBiolockoutError:", v16);

        }
        else
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24C285050);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24C285050);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "integerValue");

            if (v20 == 11)
            {
              LA_LOG_LAUIAuthenticationCore();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v22 = 0;
                _os_log_impl(&dword_209E00000, v21, OS_LOG_TYPE_DEFAULT, "Face mask detected. Will shortcircuit bio-auth.", v22, 2u);
              }

              -[LAContext failProcessedEvent:failureError:reply:](self->_context, "failProcessedEvent:failureError:reply:", a3, 0, &__block_literal_global_28);
            }
          }
        }
        goto LABEL_15;
      }
      v15 = self;
      v14 = 0;
    }
LABEL_14:
    -[LAUIAuthenticationCore _biometryState:](v15, "_biometryState:", v14);
LABEL_15:

  }
  (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x24BDBD1B8], 0);

}

- (BOOL)_simpleStatusInParams:(id)a3 touchId:(int64_t)a4 faceId:(int64_t)a5
{
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v8 = a3;
  v9 = -[LAUIAuthenticationCore biometryType](self, "biometryType");
  if (v9 == 1)
  {
    v10 = &unk_24C285068;
  }
  else
  {
    if (v9 != 2)
    {
LABEL_7:
      v13 = 0;
      goto LABEL_8;
    }
    v10 = &unk_24C285080;
    a4 = a5;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_7;
  v12 = v11;
  v13 = objc_msgSend(v11, "integerValue") == a4;

LABEL_8:
  return v13;
}

- (void)_biometryState:(int64_t)a3
{
  _BOOL4 doneMatching;
  _BOOL4 mirroringToDefaultUI;
  void *v7;
  int64_t v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  self->_lastState = a3;
  doneMatching = self->_doneMatching;
  if (a3 == 4)
    self->_doneMatching = 1;
  if (!doneMatching)
  {
    mirroringToDefaultUI = self->_mirroringToDefaultUI;
    objc_initWeak(&location, self);
    -[LAUIAuthenticationCore delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (mirroringToDefaultUI && a3 < 3)
      v9 = 3;
    else
      v9 = a3;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __41__LAUIAuthenticationCore__biometryState___block_invoke;
    v10[3] = &unk_24C27EAE8;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    objc_msgSend(v7, "biometryState:completionHandler:", v9, v10);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __41__LAUIAuthenticationCore__biometryState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 40) == 4)
    {
      v7 = WeakRetained;
      v3 = objc_msgSend(WeakRetained, "biometryType") == 2;
      WeakRetained = v7;
      if (v3)
      {
        objc_msgSend(v7, "delegate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "faceIdResult");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "context");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "authenticationResult:error:context:", v5, 0, v6);

        WeakRetained = v7;
      }
    }
  }

}

- (void)_biometricNoMatchWithBiolockoutError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[LAUIAuthenticationCore delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "biometricNoMatch");

  if (v7)
  {
    -[LAUIAuthenticationCore delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAUIAuthenticationCore context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authenticationResult:error:context:", 0, v7, v6);

  }
}

+ (void)performBlockOnMainThread:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x24BDD17F0];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

- (LAUIAuthenticationCoreDelegate)delegate
{
  return (LAUIAuthenticationCoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (unint64_t)enabledMechanisms
{
  return self->_enabledMechanisms;
}

- (unint64_t)activeMechanisms
{
  return self->_activeMechanisms;
}

- (BOOL)isApplicationActive
{
  return self->_applicationActive;
}

- (void)setApplicationActive:(BOOL)a3
{
  self->_applicationActive = a3;
}

- (BOOL)isKeyWindow
{
  return self->_keyWindow;
}

- (void)setKeyWindow:(BOOL)a3
{
  self->_keyWindow = a3;
}

- (BOOL)isUiActive
{
  return self->_uiActive;
}

- (void)setUiActive:(BOOL)a3
{
  self->_uiActive = a3;
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSDictionary)faceIdResult
{
  return self->_faceIdResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIdResult, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
