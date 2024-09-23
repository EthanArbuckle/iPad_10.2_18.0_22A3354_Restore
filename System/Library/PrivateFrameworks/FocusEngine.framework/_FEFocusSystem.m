@implementation _FEFocusSystem

- (_FEFocusSystem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 112, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (_FEFocusSystem)initWithFocusBehavior:(id)a3
{
  return -[_FEFocusSystem initWithFocusBehavior:enabled:](self, "initWithFocusBehavior:enabled:", a3, 1);
}

- (_FEFocusSystem)initWithFocusBehavior:(id)a3 enabled:(BOOL)a4
{
  id v7;
  _FEFocusSystem *v8;
  _FEFocusSystem *v9;
  _FEFocusMovementPerformer *v10;
  _FEFocusMovementPerformer *movementPerformer;
  _FEFocusMovementPerformer *v12;
  uint64_t v13;
  _FEFocusSystem *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_FEFocusSystem;
  v8 = -[_FEFocusSystem init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_behavior, a3);
    v9->_enabled = a4;
    v10 = (_FEFocusMovementPerformer *)objc_opt_new();
    -[_FEFocusMovementPerformer setDelegate:](v10, "setDelegate:", v9);
    movementPerformer = v9->_movementPerformer;
    v9->_movementPerformer = v10;
    v12 = v10;

    v13 = qword_256BAFC78;
    v14 = v9;
    if (v13 != -1)
      dispatch_once(&qword_256BAFC78, &__block_literal_global_0);
    objc_msgSend((id)_MergedGlobals_4, "addObject:", v14);

    -[_FEFocusSystem _focusBehaviorDidChange](v14, "_focusBehaviorDidChange");
  }

  return v9;
}

- (void)_prepareForTeardown
{
  *(_DWORD *)&self->_flags |= 1u;
}

- (void)_setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  $C26450B17F84A6D740AC00827B43141C flags;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _FEFocusUpdateRequest *pendingFocusUpdateRequest;
  _FEFocusEnvironment *appearingFocusEnvironment;
  _FEFocusEnvironment *disappearingFocusEnvironment;
  _FEFocusUpdateRequest *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
LABEL_10:
    -[_FEFocusSystem setWaitingForFocusMovementAction:](self, "setWaitingForFocusMovementAction:", 0);
    if (self->_enabled == v3)
      return;
    -[_FEFocusSystem _hostFocusSystem](self, "_hostFocusSystem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      logger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = CFSTR("disabled");
        if (v3)
          v11 = CFSTR("enabled");
        v23 = 138543362;
        v24 = v11;
        _os_log_impl(&dword_23C48C000, v10, OS_LOG_TYPE_INFO, "Focus system %{public}@", (uint8_t *)&v23, 0xCu);
      }

    }
    self->_enabled = v3;
    if (!v3)
    {
      -[_FEFocusSystem focusedItem](self, "focusedItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        -[_FEFocusSystem _setNeedsFocusRestoration](self, "_setNeedsFocusRestoration");
      -[_FEFocusSystem _contextForUpdateToEnvironment:](self, "_contextForUpdateToEnvironment:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FEFocusSystem _updateFocusWithContext:report:](self, "_updateFocusWithContext:report:", v17, 0);
      -[_FEFocusSystem setPendingFocusMovementAction:](self, "setPendingFocusMovementAction:", 0);
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = 0;

      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;

      disappearingFocusEnvironment = self->_disappearingFocusEnvironment;
      self->_disappearingFocusEnvironment = 0;

      goto LABEL_30;
    }
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
      self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags & 0xFFFFFFFB);
      -[_FEFocusSystem _previousFocusedItem](self, "_previousFocusedItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FEFocusSystem _contextForUpdateToEnvironment:](self, "_contextForUpdateToEnvironment:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[_FEFocusSystem _shouldRestoreFocusInContext:](self, "_shouldRestoreFocusInContext:", v14))
      {
        -[_FEFocusSystem _configureFocusDeferralIfNecessaryForContext:report:](self, "_configureFocusDeferralIfNecessaryForContext:report:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[_FEFocusSystem _updateFocusWithContext:report:](self, "_updateFocusWithContext:report:", v15, 0);
        if (!self->_pendingFocusUpdateRequest)
          goto LABEL_29;
        goto LABEL_27;
      }

    }
    if (!self->_pendingFocusUpdateRequest)
    {
      v21 = -[_FEFocusUpdateRequest initWithEnvironment:]([_FEFocusUpdateRequest alloc], "initWithEnvironment:", self);
      -[_FEFocusSystem _requestFocusUpdate:](self, "_requestFocusUpdate:", v21);
      -[_FEFocusSystem updateFocusIfNeeded](self, "updateFocusIfNeeded");

      goto LABEL_29;
    }
LABEL_27:
    -[_FEFocusSystem updateFocusIfNeeded](self, "updateFocusIfNeeded");
LABEL_29:
    -[_FEFocusSystem _tickHasSeenFocusedItemTimer:](self, "_tickHasSeenFocusedItemTimer:", 0);
LABEL_30:
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:", CFSTR("_FEFocusSystemEnabledStateDidChangeNotification"), self);

    return;
  }
  -[_FEFocusSystem delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  -[_FEFocusSystem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_shouldWaitForFocusMovementActionToEnableFocusSystem:", self) & 1) == 0)
  {

    goto LABEL_9;
  }
  -[_FEFocusSystem pendingFocusMovementAction](self, "pendingFocusMovementAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_10;
  logger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_23C48C000, v8, OS_LOG_TYPE_INFO, "Tried to enable focus system without receiving focus movement action, waiting until action is received to enable", (uint8_t *)&v23, 2u);
  }

  -[_FEFocusSystem setWaitingForFocusMovementAction:](self, "setWaitingForFocusMovementAction:", 1);
}

- (BOOL)_focusSystemIsValid
{
  return (*(_BYTE *)&self->_flags & 1) == 0;
}

- (_FEFocusItem)focusedItem
{
  _FEFocusItem **p_focusedItem;
  id WeakRetained;
  id v5;
  _FEFocusSystem *v6;
  id v7;

  p_focusedItem = &self->_focusedItem;
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  if (WeakRetained
    && -[_FEFocusSystem _requiresFocusedItemToBeInHierarchy](self, "_requiresFocusedItemToBeInHierarchy"))
  {
    v5 = objc_loadWeakRetained((id *)p_focusedItem);
    _FEFocusEnvironmentRootAncestorEnvironment(v5);
    v6 = (_FEFocusSystem *)objc_claimAutoreleasedReturnValue();
    if (v6 == self)
      v7 = objc_loadWeakRetained((id *)p_focusedItem);
    else
      v7 = 0;

  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_focusedItem);
  }

  return (_FEFocusItem *)v7;
}

- (_FEFocusItem)_focusedItemOrDeferralTarget
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  -[_FEFocusSystem focusedItem](self, "focusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    WeakRetained = v3;
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
  v6 = WeakRetained;

  return (_FEFocusItem *)v6;
}

- (id)_focusItemForValidation
{
  void *v3;
  id WeakRetained;
  void *v5;

  -[_FEFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || -[_FEFocusSystem _isEnabled](self, "_isEnabled"))
    WeakRetained = v3;
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
  v5 = WeakRetained;

  return v5;
}

- (BOOL)_hasValidItemForCurrentDeferralState
{
  BOOL v2;
  int64_t v4;
  void *v5;

  v4 = -[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior");
  if ((unint64_t)(v4 - 1) < 4)
  {
    -[_FEFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v2 = v5 != 0;

    return v2;
  }
  if (!v4)
  {
    -[_FEFocusSystem focusedItem](self, "focusedItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v2;
}

- (void)_setFocusCastingController:(id)a3
{
  _FEFocusCastingController *v5;
  _FEFocusCastingController *focusCastingController;
  _FEFocusCastingController *v7;

  v5 = (_FEFocusCastingController *)a3;
  focusCastingController = self->_focusCastingController;
  if (focusCastingController != v5)
  {
    v7 = v5;
    if (focusCastingController)
    {
      -[_FEFocusCastingController setFocusSystem:](focusCastingController, "setFocusSystem:", 0);
      -[_FEFocusCastingController teardown](self->_focusCastingController, "teardown");
      v5 = v7;
    }
    -[_FEFocusCastingController setFocusSystem:](v5, "setFocusSystem:", self);
    objc_storeStrong((id *)&self->_focusCastingController, a3);
    v5 = v7;
  }

}

- (_FEFocusGroupHistory)_focusGroupHistory
{
  _FEFocusGroupHistory *focusGroupHistory;
  _FEFocusGroupHistory *v4;
  _FEFocusGroupHistory *v5;

  focusGroupHistory = self->_focusGroupHistory;
  if (!focusGroupHistory)
  {
    v4 = (_FEFocusGroupHistory *)objc_opt_new();
    v5 = self->_focusGroupHistory;
    self->_focusGroupHistory = v4;

    focusGroupHistory = self->_focusGroupHistory;
  }
  return focusGroupHistory;
}

- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  switch(-[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior"))
  {
    case 1:
    case 4:
      objc_msgSend(v5, "_request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "allowsDeferral");
      goto LABEL_5;
    case 2:
      v7 = 1;
      break;
    case 3:
      objc_msgSend(v5, "_request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "allowsDeferral"))
      {
        objc_msgSend(v5, "nextFocusedItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (_FEFocusDeferralModeForItem(v9) == 1)
        {
          v7 = 1;
        }
        else if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        {
          v7 = 0;
        }
        else
        {
          objc_msgSend(v5, "nextFocusedItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = _FEFocusDeferralModeForItem(v10) != 2;

        }
      }
      else
      {
        v7 = 0;
      }
LABEL_5:

      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)_configureFocusDeferralIfNecessaryForContext:(id)a3 report:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "nextFocusedItem");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = -[_FEFocusSystem _prefersDeferralForFocusUpdateInContext:](self, "_prefersDeferralForFocusUpdateInContext:", v8);

    if (v11)
    {
      v12 = objc_msgSend(v7, "shouldLog");
      logger();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          objc_msgSend(v8, "nextFocusedItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)MEMORY[0x24BDD17C8];
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v15);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v19 = CFSTR("(nil)");
          }
          +[_FEDebugReportFormatter defaultFormatter](_FEFocusUpdateReportFormatter, "defaultFormatter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringFromReport:", v7);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v19;
          v31 = 2114;
          v32 = v26;
          _os_log_impl(&dword_23C48C000, v13, OS_LOG_TYPE_INFO, "Deferring focus update to item %{public}@:\n%{public}@", buf, 0x16u);

LABEL_15:
        }
      }
      else if (v14)
      {
        objc_msgSend(v8, "nextFocusedItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)MEMORY[0x24BDD17C8];
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v24, v21);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = CFSTR("(nil)");
        }
        *(_DWORD *)buf = 138543362;
        v30 = v19;
        _os_log_impl(&dword_23C48C000, v13, OS_LOG_TYPE_INFO, "Deferring focus update to item %{public}@. No additional info available.", buf, 0xCu);

        goto LABEL_15;
      }

      objc_msgSend(v8, "nextFocusedItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FEFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", v27);

      -[_FEFocusSystem _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:](self, "_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  -[_FEFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", 0);
  v20 = v8;
LABEL_17:

  return v20;
}

- (BOOL)_performDeferredFocusUpdateIfAvailable
{
  id WeakRetained;
  BOOL v4;
  NSObject *v5;
  void *v6;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[_FEFocusSystem _isEnabled](self, "_isEnabled"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
  if (WeakRetained && -[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior") != 2)
  {
    logger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      v9 = WeakRetained;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v14 = v12;
      _os_log_debug_impl(&dword_23C48C000, v5, OS_LOG_TYPE_DEBUG, "Executing previously deferred focus update to item %{public}@", buf, 0xCu);

    }
    -[_FEFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", 0);
    -[_FEFocusSystem _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:](self, "_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:", WeakRetained);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setDeferredUpdate:", 1);
    v4 = -[_FEFocusSystem _updateFocusImmediatelyWithContext:](self, "_updateFocusImmediatelyWithContext:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_tickHasSeenFocusedItemTimer:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior");
  WeakRetained = objc_loadWeakRetained((id *)&self->_hasSeenFocusedItemDidExpireTimer);
  objc_msgSend(WeakRetained, "invalidate");

  -[_FEFocusSystem focusedItem](self, "focusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v5 == 3)
  {
    if (v3)
    {
      logger();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

      logger();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v18 = v12;
          _os_log_debug_impl(&dword_23C48C000, v11, OS_LOG_TYPE_DEBUG, "Disabling focus deferral.\n%{public}@", buf, 0xCu);

        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23C48C000, v11, OS_LOG_TYPE_INFO, "Disabling focus deferral.", buf, 2u);
      }

      *(_DWORD *)&self->_flags |= 0x10u;
    }
    objc_initWeak((id *)buf, self);
    v13 = (void *)MEMORY[0x24BDBCF40];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47___FEFocusSystem__tickHasSeenFocusedItemTimer___block_invoke;
    v15[3] = &unk_250D39E68;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, 60.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_hasSeenFocusedItemDidExpireTimer, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_resetFocusDeferral
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    logger();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    logger();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v7;
        _os_log_debug_impl(&dword_23C48C000, v6, OS_LOG_TYPE_DEBUG, "Starting to defer focus updates.\n%{public}@", (uint8_t *)&v11, 0xCu);

      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_23C48C000, v6, OS_LOG_TYPE_INFO, "Starting to defer focus updates.", (uint8_t *)&v11, 2u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD17F0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hasSeenFocusedItemDidExpire, 0);
  *(_DWORD *)&self->_flags &= ~0x10u;
  -[_FEFocusSystem behavior](self, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "focusCastingMode");

  if (v9 == 2)
  {
    -[_FEFocusSystem _focusCastingController](self, "_focusCastingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "forgetEntryPoint");

  }
}

- (void)_startDeferringFocusIfSupported
{
  int64_t v3;
  _BOOL4 v4;
  id v5;
  id v6;
  id WeakRetained;
  id v8;

  -[_FEFocusSystem _resetFocusDeferral](self, "_resetFocusDeferral");
  v3 = -[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior");
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (v3 != 3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
      goto LABEL_10;
    }
    v5 = objc_loadWeakRetained((id *)&self->_focusedItem);
    v4 = _FEFocusDeferralModeForItem(v5) != 2;

  }
  else
  {
    v4 = 1;
  }
  v6 = objc_loadWeakRetained((id *)&self->_focusedItem);

  if (v6 && v4)
  {
    v8 = objc_loadWeakRetained((id *)&self->_focusedItem);
    -[_FEFocusSystem _dropFocusAndStartDeferring:suppressUpdate:](self, "_dropFocusAndStartDeferring:suppressUpdate:", 0, 1);
    -[_FEFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", v8);
    WeakRetained = v8;
LABEL_10:

  }
}

- (void)_clearDeferredFocusUpdateTarget
{
  -[_FEFocusSystem _setDeferredFocusUpdateTarget:](self, "_setDeferredFocusUpdateTarget:", 0);
}

- (void)_setDeferredFocusUpdateTarget:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_deferredFocusUpdateTarget, obj);
    if ((*((_BYTE *)&self->_flags + 2) & 4) != 0)
    {
      -[_FEFocusSystem delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_focusSystem:didUpdateDeferralTarget:", self, obj);

    }
  }

}

- (int64_t)_effectiveFocusDeferralBehavior
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  -[_FEFocusSystem _overrideFocusDeferralBehavior](self, "_overrideFocusDeferralBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    -[_FEFocusSystem behavior](self, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "focusDeferral");

  }
  return v5;
}

- (void)_setOverrideFocusDeferralBehavior:(id)a3
{
  NSNumber *v5;
  BOOL v6;
  NSNumber *v7;

  v5 = (NSNumber *)a3;
  if (self->_overrideFocusDeferralBehavior != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_overrideFocusDeferralBehavior, a3);
    if (-[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior"))
    {
      -[_FEFocusSystem _startDeferringFocusIfSupported](self, "_startDeferringFocusIfSupported");
LABEL_6:
      v5 = v7;
      goto LABEL_7;
    }
    v6 = -[_FEFocusSystem _performDeferredFocusUpdateIfAvailable](self, "_performDeferredFocusUpdateIfAvailable");
    v5 = v7;
    if (!v6)
    {
      -[_FEFocusSystem requestFocusUpdateToEnvironment:](self, "requestFocusUpdateToEnvironment:", self);
      -[_FEFocusSystem updateFocusIfNeeded](self, "updateFocusIfNeeded");
      goto LABEL_6;
    }
  }
LABEL_7:

}

+ (id)focusSystemForEnvironment:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEFocusSystem.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v6 = (id)_MergedGlobals_4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    _FEFocusEnvironmentRootAncestorEnvironment(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v8))
    {
      if (objc_msgSend(v8, "_focusSystemIsValid"))
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_focusSystemForEnvironment:(id)a3
{
  return +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", a3);
}

+ (NSArray)_allFocusSystems
{
  void *v2;
  void *v3;
  NSArray *v4;

  objc_msgSend((id)_MergedGlobals_4, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (_FEFocusEnvironment)_parentFocusEnvironment
{
  return 0;
}

- (_FEFocusRegionContainer)_focusMapContainer
{
  _FEFocusRegionContainerProxy *v3;
  void *v4;
  _FEFocusRegionContainerProxy *v5;

  v3 = [_FEFocusRegionContainerProxy alloc];
  -[_FEFocusSystem _focusItemContainer](self, "_focusItemContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_FEFocusRegionContainerProxy initWithOwningEnvironment:itemContainer:](v3, "initWithOwningEnvironment:itemContainer:", self, v4);

  -[_FEFocusRegionContainerProxy setAllowsLazyLoading:](v5, "setAllowsLazyLoading:", 0);
  -[_FEFocusRegionContainerProxy setShouldCreateRegionForOwningItem:](v5, "setShouldCreateRegionForOwningItem:", 0);
  -[_FEFocusRegionContainerProxy setShouldCreateRegionForGuideBehavior:](v5, "setShouldCreateRegionForGuideBehavior:", 0);
  return (_FEFocusRegionContainer *)v5;
}

- (_FEFocusItemContainer)_focusItemContainer
{
  _FEFocusSystemDelegate **p_delegate;
  id WeakRetained;
  $C26450B17F84A6D740AC00827B43141C flags;
  void *v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (flags = self->_flags, WeakRetained, (*(_DWORD *)&flags & 0x10000) != 0))
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "_focusItemContainerForFocusSystem:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (_FEFocusItemContainer *)v6;
}

- (CGRect)_clippingRectInCoordinateSpace:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    v8 = a3;
    -[_FEFocusSystem delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_clippingRectForFocusSystem:inCoordinateSpace:", self, v8);
    v3 = v10;
    v4 = v11;
    v5 = v12;
    v6 = v13;

  }
  else
  {
    v3 = *MEMORY[0x24BDBF070];
    v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v14 = v3;
  v15 = v4;
  v16 = v5;
  v17 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)preferredFocusEnvironments
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;

  -[_FEFocusSystem delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || (*(_BYTE *)&self->_flags & 0x80) == 0)
    goto LABEL_3;
  objc_msgSend(v4, "_preferredFocusEnvironmentsForFocusSystem:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 607, CFSTR("Returning nil for a focus system's preferred focus environments is not allowed."));

LABEL_3:
    v6 = 0;
  }
  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x24BDBD1A8];
  v8 = v7;

  return v8;
}

- (void)setNeedsFocusUpdate
{
  -[_FEFocusSystem requestFocusUpdateToEnvironment:](self, "requestFocusUpdateToEnvironment:", self);
}

- (BOOL)_shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_prefersFocusContainment
{
  return 1;
}

+ (BOOL)environment:(id)a3 containsEnvironment:(id)a4
{
  id v7;
  id v8;
  void *v9;
  BOOL IsAncestorOfEnvironment;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEFocusSystem.m"), 639, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_FEFocusSystem.m"), 640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherEnvironment"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  IsAncestorOfEnvironment = _FEFocusEnvironmentIsAncestorOfEnvironment(v7, v9);

  return IsAncestorOfEnvironment;
}

- (void)requestFocusUpdateToEnvironment:(id)a3
{
  _FEFocusUpdateRequest *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 649, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v5 = -[_FEFocusUpdateRequest initWithEnvironment:]([_FEFocusUpdateRequest alloc], "initWithEnvironment:", v7);
  -[_FEFocusSystem _requestFocusUpdate:](self, "_requestFocusUpdate:", v5);

}

- (void)_requestFocusUpdate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  id v23;
  id v24;
  __CFString *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id location;
  id v47;
  _BYTE buf[24];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 656, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  if ((objc_msgSend(v5, "isFocusRemovalRequest") & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v6, "cacheCurrentFocusSystem");
    if (!objc_msgSend(v6, "isValidInFocusSystem:", self))
      goto LABEL_35;
    -[_FEFocusSystem _validatedPendingFocusUpdateRequest](self, "_validatedPendingFocusUpdateRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "canMergeWithRequest:", v6))
    {
      objc_msgSend(v8, "requestByMergingWithRequest:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = 1;
      v6 = (void *)v9;
    }
    else
    {
      objc_msgSend(v6, "environment");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      logger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        v13 = (void *)objc_opt_new();
      else
        v13 = 0;

      v47 = 0;
      v14 = -[_FEFocusSystem _isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:](self, "_isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:", v11, &v47, v13);
      v15 = v47;
      if (!v14)
      {
        logger();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
        if (!v15 || v11 == v15)
        {
          if (v17)
          {
            v24 = v11;
            if (v24)
            {
              v34 = (void *)MEMORY[0x24BDD17C8];
              v35 = (objc_class *)objc_opt_class();
              NSStringFromClass(v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@: %p>"), v36, v24);
              v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v25 = CFSTR("(nil)");
            }

            v37 = (void *)objc_opt_new();
            objc_msgSend(v37, "stringFromReport:", v13);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v25;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v38;
            _os_log_debug_impl(&dword_23C48C000, v16, OS_LOG_TYPE_DEBUG, "Ignoring focus update request for ineligible environment %{public}@.\n%{public}@", buf, 0x16u);

          }
        }
        else
        {
          if (v17)
          {
            v23 = v11;
            if (v23)
            {
              v43 = (void *)MEMORY[0x24BDD17C8];
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "stringWithFormat:", CFSTR("<%@: %p>"), v27, v23);
              v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v42 = CFSTR("(nil)");
            }

            v28 = (void *)MEMORY[0x24BDD17C8];
            v29 = v15;
            v41 = v42;
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p>"), v31, v29);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = (void *)objc_opt_new();
            objc_msgSend(v32, "stringFromReport:", v13);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v42;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v40;
            *(_WORD *)&buf[22] = 2114;
            v49 = v33;
            _os_log_debug_impl(&dword_23C48C000, v16, OS_LOG_TYPE_DEBUG, "Ignoring focus update request for ineligible environment %{public}@. Using fallback environment %{public}@ instead.\n%{public}@", buf, 0x20u);

          }
          objc_msgSend(v6, "requestByRedirectingRequestToEnvironment:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          -[_FEFocusSystem _requestFocusUpdate:](self, "_requestFocusUpdate:", v16);
        }

        goto LABEL_34;
      }

      if (v8)
        v10 = 1;
      else
        v10 = self->_appearingFocusEnvironment != 0;
    }
    objc_storeStrong((id *)&self->_pendingFocusUpdateRequest, v6);
    -[_FEFocusSystem updateThrottle](self, "updateThrottle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19)
    {
      if (!v10)
      {
        objc_initWeak(&location, self);
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __38___FEFocusSystem__requestFocusUpdate___block_invoke;
        v44[3] = &unk_250D39E90;
        objc_copyWeak(&v45, &location);
        v22 = v44;
        if (!qword_256BAFC90)
        {
          *(_OWORD *)buf = xmmword_250D3A038;
          *(_QWORD *)&buf[16] = 0;
          qword_256BAFC90 = _sl_dlopen();
        }
        if (qword_256BAFC90)
        {
          if (qword_256BAFC88 != -1)
            dispatch_once(&qword_256BAFC88, &__block_literal_global_434);
          objc_msgSend((id)qword_256BAFC80, "_performBlockAfterCATransactionCommits:", v22);
        }
        else
        {
          dispatch_async(MEMORY[0x24BDAC9B8], v22);
        }

        objc_destroyWeak(&v45);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      -[_FEFocusSystem updateThrottle](self, "updateThrottle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scheduleProgrammaticFocusUpdate");

      if (objc_msgSend(v6, "resetsUpdateThrottle"))
      {
        -[_FEFocusSystem updateThrottle](self, "updateThrottle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "reset");

      }
    }
LABEL_34:

    goto LABEL_35;
  }
  v6 = v5;
LABEL_35:

}

- (void)_focusEnvironmentWillBecomeInvisible:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  _FEFocusSystem *v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[_FEFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __55___FEFocusSystem__focusEnvironmentWillBecomeInvisible___block_invoke;
    v9 = &unk_250D39EB8;
    v10 = self;
    v11 = v4;
    v5 = &v6;
    if (!qword_256BAFC90)
    {
      v12 = xmmword_250D3A038;
      v13 = 0;
      qword_256BAFC90 = _sl_dlopen();
    }
    if (qword_256BAFC90)
    {
      if (qword_256BAFC88 != -1)
        dispatch_once(&qword_256BAFC88, &__block_literal_global_434);
      objc_msgSend((id)qword_256BAFC80, "_performBlockAfterCATransactionCommits:", v5, v6, v7, v8, v9, v10);
    }
    else
    {
      dispatch_async(MEMORY[0x24BDAC9B8], v5);
    }

  }
}

- (void)_focusEnvironmentWillDisappear:(id)a3
{
  id v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  _FEFocusUpdateRequest *v14;
  _FEFocusUpdateRequest *pendingFocusUpdateRequest;
  void *v16;
  id v17;
  __CFString *v18;
  id v19;
  __CFString *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  __CFString *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  _QWORD v38[4];
  id v39;
  _FEFocusSystem *v40;
  id v41;
  uint8_t buf[4];
  __CFString *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[_FEFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
  {
    -[_FEFocusSystem focusedItem](self, "focusedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = -[_FEFocusSystem _focusedItemIsContainedInEnvironment:includeSelf:](self, "_focusedItemIsContainedInEnvironment:includeSelf:", v5, 1);
    else
      v7 = 0;

    logger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 = (void *)objc_opt_new();
    else
      v9 = 0;

    v41 = 0;
    v10 = -[_FEFocusSystem _isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:](self, "_isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:", v5, &v41, v9);
    v11 = v41;
    if (v10)
    {
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __49___FEFocusSystem__focusEnvironmentWillDisappear___block_invoke;
      v38[3] = &unk_250D39EE0;
      v39 = v5;
      v40 = self;
      _FEFocusEnvironmentEnumerateAncestorEnvironments(v39, v38);
      objc_storeStrong((id *)&self->_disappearingFocusEnvironment, a3);

    }
    else
    {
      logger();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13)
        {
          v17 = v5;
          if (v17)
          {
            v21 = (void *)MEMORY[0x24BDD17C8];
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p>"), v23, v17);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v18 = CFSTR("(nil)");
          }
          v37 = v18;

          v24 = (void *)MEMORY[0x24BDD17C8];
          v25 = v11;
          v26 = v18;
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p>"), v28, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = (void *)objc_opt_new();
          objc_msgSend(v30, "stringFromReport:", v9);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v37;
          v44 = 2114;
          v45 = v29;
          v46 = 2114;
          v47 = v31;
          _os_log_debug_impl(&dword_23C48C000, v12, OS_LOG_TYPE_DEBUG, "Ignoring focus update request for disappearing focus environment %{public}@. Using fallback environment %{public}@ instead.\n%{public}@", buf, 0x20u);

        }
        -[_FEFocusSystem requestFocusUpdateToEnvironment:](self, "requestFocusUpdateToEnvironment:", v11);
      }
      else
      {
        if (v13)
        {
          v19 = v5;
          if (v19)
          {
            v32 = (void *)MEMORY[0x24BDD17C8];
            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@: %p>"), v34, v19);
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v20 = CFSTR("(nil)");
          }

          v35 = (void *)objc_opt_new();
          objc_msgSend(v35, "stringFromReport:", v9);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v20;
          v44 = 2114;
          v45 = v36;
          _os_log_debug_impl(&dword_23C48C000, v12, OS_LOG_TYPE_DEBUG, "Ignoring focus update request for disappearing focus environment %{public}@.\n%{public}@", buf, 0x16u);

        }
      }
    }
    objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
    if (v7
      && -[_FEFocusSystem _isEnabled](self, "_isEnabled")
      && !-[_FEFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:", v5)
      && (*(_BYTE *)&self->_flags & 2) == 0)
    {
      v14 = self->_pendingFocusUpdateRequest;
      -[_FEFocusSystem _dropFocusAndStartDeferring:suppressUpdate:](self, "_dropFocusAndStartDeferring:suppressUpdate:", 0, 1);
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = v14;

    }
    -[_FEFocusSystem _focusMovementCache](self, "_focusMovementCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "environmentWillDisappear:", v5);

  }
}

- (void)_focusEnvironmentDidBecomeVisible:(id)a3
{
  void *v4;
  BOOL HaveCommonHierarchy;
  id v6;

  v6 = a3;
  if (-[_FEFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0
      || (-[_FEFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          HaveCommonHierarchy = _FEFocusEnvironmentsHaveCommonHierarchy(v6, v4),
          v4,
          !HaveCommonHierarchy))
    {
      -[_FEFocusSystem _focusEnvironmentDidAppear:](self, "_focusEnvironmentDidAppear:", v6);
    }
  }

}

- (void)_focusEnvironmentDidAppear:(id)a3
{
  id v4;
  void *v5;
  _FEFocusSystem *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  _FEFocusEnvironment *appearingFocusEnvironment;
  _FEFocusEnvironment **p_appearingFocusEnvironment;
  void *v29;
  _FEFocusUpdateRequest *pendingFocusUpdateRequest;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id location[2];
  CGRect v35;
  CGRect v36;

  v4 = a3;
  if (-[_FEFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
  {
    -[_FEFocusSystem _focusMovementCache](self, "_focusMovementCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environmentDidAppear:", v4);

    if (-[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior"))
    {
      if ((*(_BYTE *)&self->_flags & 2) == 0)
      {
        if (v4)
        {
          _FEFocusEnvironmentRootAncestorEnvironment(v4);
          v6 = (_FEFocusSystem *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = 0;
        }
        if (v6 != self)
          goto LABEL_28;
        objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
        -[_FEFocusSystem _focusItemForValidation](self, "_focusItemForValidation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (!v7)
        {
          if (!self->_pendingFocusUpdateRequest && -[_FEFocusSystem _isEnabled](self, "_isEnabled"))
            -[_FEFocusSystem requestFocusUpdateToEnvironment:](self, "requestFocusUpdateToEnvironment:", self);
          goto LABEL_27;
        }
        _FEFocusEnvironmentFirstCommonAncestor(v7, v4);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9 && (void *)v9 != v8)
        {
          if (!_FEFocusItemIsViewOrRespondsToSelector(v4))
            goto LABEL_16;
          objc_msgSend(v10, "_focusItemContainer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_focusCoordinateSpace");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = _FEFocusItemFrameInCoordinateSpace(v4, v12);
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v20 = _FEFocusItemFrameInCoordinateSpace(v8, v12);
          v22 = v21;
          v24 = v23;
          v26 = v25;
          v35.origin.x = v13;
          v35.origin.y = v15;
          v35.size.width = v17;
          v35.size.height = v19;
          if (!CGRectIsNull(v35))
          {
            v36.origin.x = v20;
            v36.origin.y = v22;
            v36.size.width = v24;
            v36.size.height = v26;
            if (!CGRectIsNull(v36))
            {
              if (_FERectSmartIntersectsRect(v13, v15, v17, v19, v20, v22, v24, v26))
              {

LABEL_16:
                p_appearingFocusEnvironment = &self->_appearingFocusEnvironment;
                appearingFocusEnvironment = self->_appearingFocusEnvironment;
                if (appearingFocusEnvironment)
                {
                  _FEFocusEnvironmentFirstCommonAncestor(appearingFocusEnvironment, v10);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_storeStrong((id *)p_appearingFocusEnvironment, v29);
                  v10 = v29;
                }
                else
                {
                  pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
                  objc_storeStrong((id *)&self->_appearingFocusEnvironment, v10);
                  if (!pendingFocusUpdateRequest)
                  {
                    logger();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                    {
                      LOWORD(location[0]) = 0;
                      _os_log_debug_impl(&dword_23C48C000, v31, OS_LOG_TYPE_DEBUG, "Scheduling focused item validation for appearing environment.", (uint8_t *)location, 2u);
                    }

                    objc_initWeak(location, self);
                    v32[0] = MEMORY[0x24BDAC760];
                    v32[1] = 3221225472;
                    v32[2] = __45___FEFocusSystem__focusEnvironmentDidAppear___block_invoke;
                    v32[3] = &unk_250D39E90;
                    objc_copyWeak(&v33, location);
                    _FEPerformDelayed(v32);
                    objc_destroyWeak(&v33);
                    objc_destroyWeak(location);
                  }
                }
                goto LABEL_26;
              }
            }
          }

        }
LABEL_26:

LABEL_27:
LABEL_28:

      }
    }
  }

}

- (id)_validatedAppearingFocusEnvironmentRequest
{
  _FEFocusEnvironment *v3;
  NSObject *v4;
  void *v5;
  _FEFocusSystem *v6;
  _FEFocusUpdateRequest *v7;
  void *v8;
  _FEFocusMap *v9;
  _FEFocusEnvironment *appearingFocusEnvironment;
  void *v12;
  _FEFocusEnvironment *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = self->_appearingFocusEnvironment;
  if (v3)
  {
    logger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = v3;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v19 = v16;
      _os_log_debug_impl(&dword_23C48C000, v4, OS_LOG_TYPE_DEBUG, "Validating focused item for appearing environment %{public}@.", buf, 0xCu);

    }
    -[_FEFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (_FEFocusEnvironmentRootAncestorEnvironment(v3),
          v6 = (_FEFocusSystem *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6 == self))
    {
      _FEFocusEnvironmentPreferredFocusMapContainer(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[_FEFocusMap initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:]([_FEFocusMap alloc], "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", self, v8, 0, 0, 0);
        if (-[_FEFocusMap verifyFocusabilityForItem:](v9, "verifyFocusabilityForItem:", v5))
        {
          appearingFocusEnvironment = self->_appearingFocusEnvironment;
          self->_appearingFocusEnvironment = 0;

          v7 = 0;
        }
        else
        {
          v7 = -[_FEFocusUpdateRequest initWithFocusSystem:environment:]([_FEFocusUpdateRequest alloc], "initWithFocusSystem:environment:", self, v3);
        }
      }
      else
      {
        logger();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_23C48C000, v17, OS_LOG_TYPE_FAULT, "Unable to find a focus map container. This should never happen.", buf, 2u);
        }

        v7 = 0;
        v9 = (_FEFocusMap *)self->_appearingFocusEnvironment;
        self->_appearingFocusEnvironment = 0;
      }

    }
    else
    {
      v7 = 0;
      v8 = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_validatedPendingFocusUpdateRequest
{
  _FEFocusUpdateRequest *v3;
  _FEFocusUpdateRequest *v4;
  _FEFocusUpdateRequest *v5;
  NSObject *v6;
  _FEFocusUpdateRequest *pendingFocusUpdateRequest;
  void *v9;
  __CFString *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _FEFocusSystem *v15;
  __CFString *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = self->_pendingFocusUpdateRequest;
  v4 = v3;
  if (v3 && !-[_FEFocusUpdateRequest isValidInFocusSystem:](v3, "isValidInFocusSystem:", self))
  {
    logger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[_FEFocusUpdateRequest environment](v4, "environment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = CFSTR("(nil)");
      }
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = self;
      v16 = v10;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v18, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v19;
      _os_log_error_impl(&dword_23C48C000, v6, OS_LOG_TYPE_ERROR, "Found invalid pending focus update request for environment %{public}@ in focus system %{public}@.", buf, 0x16u);

    }
    pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
    self->_pendingFocusUpdateRequest = 0;

    v5 = 0;
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)_topEnvironment
{
  _FEFocusSystem *v2;
  _FEFocusSystem *v3;
  void *v4;
  _FEFocusSystem *v5;
  void *v6;
  _FEFocusEnvironment *disappearingFocusEnvironment;

  v2 = self;
  v3 = v2;
  v4 = v2;
  if ((*(_BYTE *)&v2->_flags & 0x40) == 0
    || (-[_FEFocusSystem delegate](v2, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "_topEnvironmentForFocusSystem:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v6,
        v4)
    && (disappearingFocusEnvironment = v3->_disappearingFocusEnvironment) != 0
    && _FEFocusEnvironmentIsAncestorOfEnvironment(disappearingFocusEnvironment, v4))
  {
    v5 = v3;
  }
  else
  {
    v5 = v4;
    v4 = v5;
  }

  return v5;
}

- (BOOL)_debug_isEnvironmentEligibleForFocusUpdate:(id)a3 debugReport:(id)a4
{
  return -[_FEFocusSystem _isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:](self, "_isEnvironmentEligibleForFocusUpdate:fallbackToEnvironment:debugReport:", a3, 0, a4);
}

- (BOOL)_isEnvironmentEligibleForFocusUpdate:(id)a3 fallbackToEnvironment:(id *)a4 debugReport:(id)a5
{
  _FEFocusSystem *v8;
  id v9;
  void *v10;
  _FEFocusSystem *v11;
  _FEFocusSystem *v12;
  _BOOL4 IsAncestorOfEnvironment;
  _BOOL4 v14;
  void *v15;
  _FEFocusUpdateRequest *v16;
  _FEFocusUpdateRequest *v17;
  int v18;
  void *v19;
  BOOL v20;
  const __CFString *v21;
  void *v22;
  BOOL v23;
  const __CFString *v26;
  void *v27;

  v8 = (_FEFocusSystem *)a3;
  v9 = a5;
  if (!-[_FEFocusSystem _isEnabled](self, "_isEnabled"))
  {
    +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", CFSTR("Focus is not currently enabled in this environment's focus system, updates will be delayed."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIssue:", v10);

  }
  -[_FEFocusSystem _topEnvironment](self, "_topEnvironment");
  v11 = (_FEFocusSystem *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", CFSTR("The current first responder is not a focus environment, no focus updates are allowed as that would force the first responder to change."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIssue:", v15);
    v23 = 0;
LABEL_25:

    goto LABEL_26;
  }
  IsAncestorOfEnvironment = _FEFocusEnvironmentIsAncestorOfEnvironment(v11, v8);
  if (v12 != v8)
  {
    v14 = IsAncestorOfEnvironment;
    -[_FEFocusSystem _focusItemForValidation](self, "_focusItemForValidation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_pendingFocusUpdateRequest;
    v17 = v16;
    if (v16)
    {
      if (v15)
        v18 = 1;
      else
        v18 = v14;
      if (v18 != 1
        || (-[_FEFocusUpdateRequest environment](v16, "environment"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = _FEFocusEnvironmentIsAncestorOfEnvironment(v8, v19),
            v19,
            !v20))
      {
        v21 = CFSTR("An ancestor of this environment has already requested a focus update, which takes priority.");
LABEL_12:
        +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addIssue:", v22);

LABEL_13:
        v23 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    else if (v15)
    {
      if (!_FEFocusEnvironmentIsAncestorOfEnvironment(v8, v15))
      {
        v21 = CFSTR("This environment does not contain the currently focused item.");
        goto LABEL_12;
      }
    }
    else if (v12 == self || !v14)
    {
      if (v12 == self)
        v26 = CFSTR("Nothing is currently focused, so this environment's request will be ignored and focus will be reset to the focus system's preferred focused item.");
      else
        v26 = CFSTR("This environment is not inside the current first responder.");
      +[_FEDebugIssue issueWithDescription:](_FEDebugIssue, "issueWithDescription:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addIssue:", v27);

      if (a4)
      {
        v23 = 0;
        *a4 = objc_retainAutorelease(v12);
        goto LABEL_24;
      }
      goto LABEL_13;
    }
    v23 = 1;
    goto LABEL_24;
  }
  v23 = 1;
LABEL_26:

  return v23;
}

- (void)_updateWantsTreeLocking
{
  void *v3;
  int v4;
  _FETreeLock *treeLock;
  _FETreeLock *v6;
  _FETreeLock *v7;

  -[_FEFocusSystem behavior](self, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsTreeLocking");

  treeLock = self->_treeLock;
  if (v4)
  {
    if (!treeLock)
    {
      v6 = (_FETreeLock *)objc_opt_new();
      v7 = self->_treeLock;
      self->_treeLock = v6;

    }
  }
  else if (treeLock)
  {
    self->_treeLock = 0;

    -[_FEFocusSystem _reevaluateLockedEnvironments](self, "_reevaluateLockedEnvironments");
  }
}

- (BOOL)_isEnvironmentLocked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[_FEFocusSystem treeLock](self, "treeLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "isEnvironmentLocked:", v4);
  else
    v7 = 0;

  return v7;
}

- (void)_lockEnvironment:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_FEFocusSystem treeLock](self, "treeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "lockEnvironmentTree:", v6);

}

- (void)_unlockEnvironment:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_FEFocusSystem treeLock](self, "treeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "unlockEnvironmentTree:", v6))
    -[_FEFocusSystem _reevaluateLockedEnvironments](self, "_reevaluateLockedEnvironments");

}

- (void)updateFocusIfNeeded
{
  $C26450B17F84A6D740AC00827B43141C flags;
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *deepestPreferredFocusableItemCacheForCurrentUpdate;
  void *v10;
  BOOL IsAncestorOfEnvironment;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  _FEFocusUpdateRequest *pendingFocusUpdateRequest;
  _FEFocusEnvironment *appearingFocusEnvironment;
  _FEFocusUpdateRequest *v27;
  id v28;
  NSObject *v29;
  _BOOL4 v30;
  _FEDebugIssueReport *v31;
  _FEDebugLogReport *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  _FEFocusUpdateRequest *v40;
  _FEFocusUpdateRequest *v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _FEFocusEnvironment *disappearingFocusEnvironment;
  void *v56;
  NSObject *v57;
  _BOOL4 v58;
  _FEFocusUpdateReport *v59;
  void *v60;
  NSObject *v61;
  _FEFocusUpdateRequest *v62;
  _FEFocusUpdateRequest *v63;
  _FEFocusEnvironment *v64;
  _FEFocusEnvironment *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  _FEFocusEnvironment *v70;
  _FEFocusEnvironment *v71;
  _FEFocusUpdateRequest *v72;
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  if (!-[_FEFocusSystem _focusSystemIsValid](self, "_focusSystemIsValid"))
    return;
  if (!-[_FEFocusSystem _isEnabled](self, "_isEnabled"))
    return;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 9) != 0)
    return;
  if (self->_appearingFocusEnvironment)
  {
    v5 = -[_FEFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:");
    flags = self->_flags;
    if (v5)
    {
      self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 8);
      return;
    }
  }
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    v6 = *(_BYTE *)&flags & 0x20;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 0x20);
    -[_FEFocusSystem _validatedPendingFocusUpdateRequest](self, "_validatedPendingFocusUpdateRequest");
    v7 = objc_claimAutoreleasedReturnValue();
    -[_FEFocusSystem _validatedAppearingFocusEnvironmentRequest](self, "_validatedAppearingFocusEnvironmentRequest");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8)
    {
      -[_FEFocusSystem _topEnvironment](self, "_topEnvironment");
      deepestPreferredFocusableItemCacheForCurrentUpdate = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend((id)v7, "environment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        IsAncestorOfEnvironment = _FEFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v10);

        if (!IsAncestorOfEnvironment)
        {
          objc_msgSend((id)v7, "requestByRedirectingRequestToEnvironment:", deepestPreferredFocusableItemCacheForCurrentUpdate);
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = v12;
        }
      }
      if (v8)
      {
        objc_msgSend((id)v8, "environment");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = _FEFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v13);

        if (!v14)
        {
          objc_msgSend((id)v8, "environment");
          v15 = objc_claimAutoreleasedReturnValue();

          deepestPreferredFocusableItemCacheForCurrentUpdate = (void *)v15;
        }
        if (v7)
        {
          objc_msgSend((id)v7, "environment");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v8, "environment");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          _FEFocusEnvironmentFirstCommonAncestor(v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1175, CFSTR("The appearing environment and the requested environment are not part of the same focus system."));

          }
          objc_msgSend((id)v7, "environment");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 != v19)
          {
            objc_msgSend((id)v7, "requestByRedirectingRequestToEnvironment:", v18);
            v20 = objc_claimAutoreleasedReturnValue();

            v7 = v20;
          }

        }
        else
        {
          v7 = (uint64_t)(id)v8;
        }
      }
      objc_msgSend((id)v7, "environment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_FEFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:", v22);

      if (v23)
      {
        logger();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)v7, "environment");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v74 = v66;
          _os_log_debug_impl(&dword_23C48C000, v24, OS_LOG_TYPE_DEBUG, "Postponing update for locked environment %@", buf, 0xCu);

        }
        self->_flags = ($C26450B17F84A6D740AC00827B43141C)(v6 | *(_DWORD *)&self->_flags & 0xFFFFFFDF | 8);
        goto LABEL_56;
      }
      v70 = self->_appearingFocusEnvironment;
      pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
      self->_pendingFocusUpdateRequest = 0;

      appearingFocusEnvironment = self->_appearingFocusEnvironment;
      self->_appearingFocusEnvironment = 0;

      v27 = (_FEFocusUpdateRequest *)(id)v7;
      v28 = -[_FEFocusUpdateContext _initWithFocusUpdateRequest:]([_FEFocusUpdateContext alloc], "_initWithFocusUpdateRequest:", v27);
      logger();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);

      if (v30)
      {
        v31 = objc_alloc_init(_FEDebugIssueReport);
        objc_msgSend(v28, "_setValidationReport:", v31);

        v32 = objc_alloc_init(_FEDebugLogReport);
        objc_msgSend(v28, "_setPreferredFocusReport:", v32);

      }
      objc_msgSend(v28, "nextFocusedItem", v70);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v27;
      v34 = v6;
      if (v33 || !deepestPreferredFocusableItemCacheForCurrentUpdate)
      {
        v47 = v28;
LABEL_51:

        v28 = v47;
        v7 = (uint64_t)v27;
      }
      else
      {
        v7 = (uint64_t)v27;
        while (1)
        {
          objc_msgSend((id)v7, "environment");
          v35 = objc_claimAutoreleasedReturnValue();
          if (!v35)
            break;
          v36 = (void *)v35;
          objc_msgSend((id)v7, "environment");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37 == deepestPreferredFocusableItemCacheForCurrentUpdate)
            break;
          objc_msgSend((id)v7, "environment");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (_FEFocusEnvironmentPrefersFocusContainment(v38))
          {
            v39 = -[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior");

            if (v39 == 3)
              -[_FEFocusSystem _resetFocusDeferral](self, "_resetFocusDeferral");
          }
          else
          {

          }
          objc_msgSend((id)v7, "requestByRedirectingRequestToNextContainerEnvironment");
          v40 = (_FEFocusUpdateRequest *)objc_claimAutoreleasedReturnValue();
          if (!v40)
          {
            logger();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_23C48C000, v68, OS_LOG_TYPE_FAULT, "Iterating through container providing environments resulted in a nil request without ever reaching the defined top environment. This should never happen.", buf, 2u);
            }

            break;
          }
          v41 = v40;
          -[_FEFocusUpdateRequest environment](v40, "environment");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = _FEFocusEnvironmentIsAncestorOfEnvironment(deepestPreferredFocusableItemCacheForCurrentUpdate, v42);

          if (!v43)
          {
            objc_msgSend((id)v7, "requestByRedirectingRequestToEnvironment:", deepestPreferredFocusableItemCacheForCurrentUpdate);
            v44 = objc_claimAutoreleasedReturnValue();

            v41 = (_FEFocusUpdateRequest *)v44;
            if (!v44)
              break;
          }
          -[_FEFocusUpdateRequest environment](v41, "environment");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[_FEFocusSystem _isEnvironmentLocked:](self, "_isEnvironmentLocked:", v45);

          if (v46)
          {
            logger();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              -[_FEFocusUpdateRequest environment](v41, "environment");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v74 = v67;
              _os_log_debug_impl(&dword_23C48C000, v61, OS_LOG_TYPE_DEBUG, "Postponing update for locked environment %@", buf, 0xCu);

            }
            *(_DWORD *)&self->_flags |= 8u;
            v62 = self->_pendingFocusUpdateRequest;
            self->_pendingFocusUpdateRequest = v41;
            v63 = v41;

            v64 = self->_appearingFocusEnvironment;
            self->_appearingFocusEnvironment = v71;
            v65 = v71;

            goto LABEL_56;
          }
          v27 = v41;

          v47 = -[_FEFocusUpdateContext _initWithFocusUpdateRequest:]([_FEFocusUpdateContext alloc], "_initWithFocusUpdateRequest:", v27);
          logger();
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG);

          if (v49)
          {
            objc_msgSend(v28, "_preferredFocusReport");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addLineBreak");

            objc_msgSend(v28, "_preferredFocusReport");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "addMessage:", CFSTR(" === unable to find focused item in context. retrying with updated request. === "));

            objc_msgSend(v28, "_preferredFocusReport");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "addLineBreak");

            objc_msgSend(v28, "_validationReport");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "_setValidationReport:", v53);

            objc_msgSend(v28, "_preferredFocusReport");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "_setPreferredFocusReport:", v54);

          }
          objc_msgSend(v47, "nextFocusedItem");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (uint64_t)v27;
          v28 = v47;
          if (v33)
            goto LABEL_51;
        }
      }
      v6 = v34;
      disappearingFocusEnvironment = self->_disappearingFocusEnvironment;
      self->_disappearingFocusEnvironment = 0;

      -[_FEFocusSystem updateThrottle](self, "updateThrottle");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "didCreateProgrammaticFocusUpdateContext:", v28);

      logger();
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG);

      v59 = 0;
      if (v58)
      {
        v59 = -[_FEFocusUpdateReport initWithFocusSystem:]([_FEFocusUpdateReport alloc], "initWithFocusSystem:", self);
        -[_FEFocusUpdateReport setContext:](v59, "setContext:", v28);
      }
      -[_FEFocusSystem _configureFocusDeferralIfNecessaryForContext:report:](self, "_configureFocusDeferralIfNecessaryForContext:report:", v28, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      -[_FEFocusSystem _updateFocusWithContext:report:](self, "_updateFocusWithContext:report:", v60, v59);
    }
    else
    {
      v7 = 0;
    }
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v6);
    deepestPreferredFocusableItemCacheForCurrentUpdate = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
    self->_deepestPreferredFocusableItemCacheForCurrentUpdate = 0;
LABEL_56:

    return;
  }
  logger();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_23C48C000, v21, OS_LOG_TYPE_ERROR, "Calling updateFocusIfNeeded while a focus update is in progress. This call will be ignored.", buf, 2u);
  }

}

- (BOOL)_updateFocusWithContext:(id)a3 report:(id)a4
{
  id v7;
  id v8;
  NSObject *WeakRetained;
  char v10;
  int v11;
  int v12;
  NSObject *v13;
  $C26450B17F84A6D740AC00827B43141C flags;
  void *v15;
  NSObject *v16;
  _FEFocusUpdateRequest *pendingFocusUpdateRequest;
  _FEFocusEnvironment *appearingFocusEnvironment;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1277, CFSTR("Attempting to initiate a focus update with a nil context."));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  objc_msgSend(v7, "_willUpdateFocusFromFocusedItem:", WeakRetained);
  v10 = objc_msgSend(v7, "_isValidInFocusSystem:", self);
  v11 = objc_msgSend(v8, "shouldLog");
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (v11)
    {
      logger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        +[_FEDebugReportFormatter defaultFormatter](_FEFocusUpdateReportFormatter, "defaultFormatter");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringFromReport:", v8);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = v7;
        v41 = 2114;
        v42 = v36;
        _os_log_debug_impl(&dword_23C48C000, v13, OS_LOG_TYPE_DEBUG, "Updating focus with context %{public}@:\n%{public}@", (uint8_t *)&v39, 0x16u);

      }
    }
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1300, CFSTR("_ignoreFocusUpdateIfNeeded should never be YES at the beginning of a focus update."));

      flags = self->_flags;
    }
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 2);
    if ((*(_WORD *)&flags & 0x200) != 0)
    {
      -[_FEFocusSystem delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_focusSystem:willUpdateFocusInContext:", self, v7);

    }
    -[_FEFocusSystem _sendWillUpdateFocusNotificationsInContext:](self, "_sendWillUpdateFocusNotificationsInContext:", v7);
    objc_storeWeak((id *)&self->_previousFocusedItem, WeakRetained);
    objc_msgSend(v7, "nextFocusedItem");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_focusedItem, v16);
    objc_storeWeak((id *)&self->_deepestPreferredFocusEnvironment, 0);
    pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
    self->_pendingFocusUpdateRequest = 0;

    appearingFocusEnvironment = self->_appearingFocusEnvironment;
    self->_appearingFocusEnvironment = 0;

    -[_FEFocusSystem _clearFocusItemAncestorCache](self, "_clearFocusItemAncestorCache");
    -[_FEFocusSystem _sendDidUpdateFocusNotificationsInContext:](self, "_sendDidUpdateFocusNotificationsInContext:", v7);
    if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    {
      -[_FEFocusSystem delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_focusSystem:didUpdateFocusInContext:", self, v7);

    }
    -[_FEFocusSystem _focusCastingController](self, "_focusCastingController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[_FEFocusSystem _focusCastingController](self, "_focusCastingController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateFocusCastingWithContext:", v7);

    }
    -[_FEFocusSystem _focusMovementCache](self, "_focusMovementCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[_FEFocusSystem _focusMovementCache](self, "_focusMovementCache");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateCacheWithContext:", v7);

    }
    -[_FEFocusSystem _didFinishUpdatingFocusInContext:](self, "_didFinishUpdatingFocusInContext:", v7);
    objc_msgSend(v7, "_didUpdateFocus");
    *(_DWORD *)&self->_flags &= ~2u;
    if (v16 && v16 != WeakRetained)
    {
      objc_msgSend(v7, "_focusMovement");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        v25 = 1;
      else
        v25 = objc_msgSend(v7, "_isDeferredUpdate");
      -[_FEFocusSystem _tickHasSeenFocusedItemTimer:](self, "_tickHasSeenFocusedItemTimer:", v25);

    }
    v28 = objc_loadWeakRetained((id *)&self->_previousFocusedItem);
    objc_msgSend(v7, "_previouslyFocusedGroupIdentifier");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v28 && v29)
    {
      objc_msgSend(v7, "_nextFocusedGroupIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (!v31 || (objc_msgSend(v31, "isEqualToString:", v30) & 1) == 0)
      {
        -[_FEFocusSystem _focusGroupHistory](self, "_focusGroupHistory");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setLastFocusedItem:forGroupIdentifier:", v28, v30);

      }
    }

    goto LABEL_36;
  }
  logger();
  v16 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v26)
    {
      +[_FEDebugReportFormatter defaultFormatter](_FEFocusUpdateReportFormatter, "defaultFormatter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringFromReport:", v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v7;
      v41 = 2114;
      v42 = v28;
      _os_log_impl(&dword_23C48C000, v16, OS_LOG_TYPE_INFO, "Failed to update focus with context %{public}@:\n%{public}@", (uint8_t *)&v39, 0x16u);

LABEL_36:
    }
  }
  else if (v26)
  {
    v39 = 138543362;
    v40 = v7;
    _os_log_impl(&dword_23C48C000, v16, OS_LOG_TYPE_INFO, "Failed to update focus with context %{public}@. No additional info available.", (uint8_t *)&v39, 0xCu);
  }

  return v10;
}

- (void)_notifyEnvironment:(id)a3 didUpdateFocusInContext:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "_didUpdateFocusInContext:", v6);
  }
  else if ((*((_BYTE *)&self->_flags + 1) & 0x40) != 0)
  {
    -[_FEFocusSystem delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_focusSystem:environment:didUpdateFocusInContext:", self, v8, v6);

  }
}

- (void)_sendWillUpdateFocusNotificationsInContext:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61___FEFocusSystem__sendWillUpdateFocusNotificationsInContext___block_invoke;
  v8[3] = &unk_250D39F08;
  v9 = v5;
  v6 = v5;
  -[_FEFocusSystem _sendNotificationsForFocusUpdateInContext:usingBlock:](self, "_sendNotificationsForFocusUpdateInContext:usingBlock:", v6, v8);

}

- (void)_sendDidUpdateFocusNotificationsInContext:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60___FEFocusSystem__sendDidUpdateFocusNotificationsInContext___block_invoke;
  v8[3] = &unk_250D39F30;
  v8[4] = self;
  v9 = v5;
  v6 = v5;
  -[_FEFocusSystem _sendNotificationsForFocusUpdateInContext:usingBlock:](self, "_sendNotificationsForFocusUpdateInContext:usingBlock:", v6, v8);

}

- (void)_sendNotificationsForFocusUpdateInContext:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  objc_msgSend(v7, "previouslyFocusedItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextFocusedItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_commonAncestorEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  if (v10)
  {
    if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
    {
      -[_FEFocusSystem delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_focusSystem:willMessageOldFocusNodes:", self, v7);

    }
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __71___FEFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke;
    v20[3] = &unk_250D39F58;
    v21 = v12;
    v22 = v9;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v10, v20);

  }
  if (v11)
  {
    if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
    {
      -[_FEFocusSystem delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_focusSystem:willMessageNewFocusNodes:", self, v7);

    }
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __71___FEFocusSystem__sendNotificationsForFocusUpdateInContext_usingBlock___block_invoke_2;
    v18[3] = &unk_250D39F80;
    v19 = v9;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v11, v18);

  }
}

- (_FEFocusEnvironment)_disappearingFocusEnvironment
{
  return self->_disappearingFocusEnvironment;
}

- (void)_performWithoutFocusUpdates:(id)a3
{
  $C26450B17F84A6D740AC00827B43141C flags;

  if (a3)
  {
    flags = self->_flags;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags | 2);
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | (2
                                                                                              * ((*(unsigned int *)&flags >> 1) & 1)));
  }
}

- (BOOL)_updateFocusImmediatelyWithContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  _FEFocusUpdateReport *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  logger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {

    goto LABEL_7;
  }
  objc_msgSend(v5, "_focusMovement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v8 = -[_FEFocusUpdateReport initWithFocusSystem:]([_FEFocusUpdateReport alloc], "initWithFocusSystem:", self);
  -[_FEFocusUpdateReport setContext:](v8, "setContext:", v5);
LABEL_8:
  -[_FEFocusSystem _configureFocusDeferralIfNecessaryForContext:report:](self, "_configureFocusDeferralIfNecessaryForContext:report:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_FEFocusSystem _updateFocusWithContext:report:](self, "_updateFocusWithContext:report:", v9, v8);
  return v10;
}

- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3 startDeferringOnLostFocus:(BOOL)a4 suppressLostFocusUpdate:(BOOL)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  _FEFocusSystem *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  _QWORD v21[5];
  BOOL v22;
  BOOL v23;
  uint8_t buf[16];

  v8 = a3;
  if ((*(_DWORD *)&self->_flags & 2) != 0)
  {
    logger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_23C48C000, v20, OS_LOG_TYPE_FAULT, "UIKit is trying to programatically move focus while inside another focus update. This typically happens when clients are manipulating state in response to a state change callout for the same state.", buf, 2u);
    }

    if ((*(_DWORD *)&self->_flags & 2) != 0)
      goto LABEL_12;
  }
  if (-[_FEFocusSystem _isEnabled](self, "_isEnabled"))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __105___FEFocusSystem__updateFocusImmediatelyToEnvironment_startDeferringOnLostFocus_suppressLostFocusUpdate___block_invoke;
    v21[3] = &unk_250D39FA8;
    v22 = a4;
    v21[4] = self;
    v23 = a5;
    v9 = (void (**)(_QWORD))MEMORY[0x2426205A4](v21);
    -[_FEFocusSystem _contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:](self, "_contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:", v8, 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8
      && (objc_msgSend(v10, "nextFocusedItem"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      -[_FEFocusSystem _topEnvironment](self, "_topEnvironment");
      v16 = (_FEFocusSystem *)objc_claimAutoreleasedReturnValue();
      if (v16 == self)
      {

        v16 = 0;
      }
      -[_FEFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16 && v17 && !_FEFocusEnvironmentIsAncestorOfEnvironment(v16, v17))
        v9[2](v9);

    }
    else
    {
      if (!-[_FEFocusSystem _isEnabled](self, "_isEnabled"))
      {
        objc_msgSend(v11, "nextFocusedItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&self->_previousFocusedItem, v15);

        -[_FEFocusSystem _setNeedsFocusRestoration](self, "_setNeedsFocusRestoration");
        v14 = 1;
LABEL_24:

        goto LABEL_25;
      }
      if (objc_msgSend(v11, "_isValidInFocusSystem:", self))
      {
        -[_FEFocusSystem _configureFocusDeferralIfNecessaryForContext:report:](self, "_configureFocusDeferralIfNecessaryForContext:report:", v11, 0);
        v13 = objc_claimAutoreleasedReturnValue();

        if (-[_FEFocusSystem _updateFocusImmediatelyWithContext:](self, "_updateFocusImmediatelyWithContext:", v13))
        {
          if (!-[_FEFocusSystem _hasValidItemForCurrentDeferralState](self, "_hasValidItemForCurrentDeferralState"))
            v9[2](v9);
          v14 = 1;
        }
        else
        {
          v14 = 0;
        }
        v11 = (void *)v13;
        goto LABEL_24;
      }
    }
    v14 = 0;
    goto LABEL_24;
  }
  -[_FEFocusSystem _cancelPendingFocusRestoration](self, "_cancelPendingFocusRestoration");
LABEL_12:
  v14 = 0;
LABEL_25:

  return v14;
}

- (BOOL)_updateFocusImmediatelyToEnvironment:(id)a3
{
  return -[_FEFocusSystem _updateFocusImmediatelyToEnvironment:startDeferringOnLostFocus:suppressLostFocusUpdate:](self, "_updateFocusImmediatelyToEnvironment:startDeferringOnLostFocus:suppressLostFocusUpdate:", a3, 1, 0);
}

- (void)_dropFocusAndStartDeferring:(BOOL)a3 suppressUpdate:(BOOL)a4
{
  -[_FEFocusSystem _updateFocusImmediatelyToEnvironment:startDeferringOnLostFocus:suppressLostFocusUpdate:](self, "_updateFocusImmediatelyToEnvironment:startDeferringOnLostFocus:suppressLostFocusUpdate:", 0, a3, a4);
}

- (id)_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:(id)a3
{
  return -[_FEFocusSystem _contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:](self, "_contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:", a3, 0, 0);
}

- (id)_contextForUpdateToEnvironment:(id)a3
{
  return -[_FEFocusSystem _contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:](self, "_contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:", a3, 1, 1);
}

- (id)_contextForUpdateToEnvironment:(id)a3 allowsOverridingPreferedFocusEnvironments:(BOOL)a4 allowsDeferral:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  _FEFocusUpdateRequest *v9;
  _FEFocusUpdateRequest *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = -[_FEFocusUpdateRequest initWithFocusSystem:environment:]([_FEFocusUpdateRequest alloc], "initWithFocusSystem:environment:", self, v8);
  }
  else
  {
    +[_FEFocusUpdateRequest requestForRemovingFocusInFocusSystem:](_FEFocusUpdateRequest, "requestForRemovingFocusInFocusSystem:", self);
    v9 = (_FEFocusUpdateRequest *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  -[_FEFocusUpdateRequest setAllowsOverridingPreferedFocusEnvironments:](v9, "setAllowsOverridingPreferedFocusEnvironments:", v6);
  -[_FEFocusUpdateRequest setAllowsDeferral:](v10, "setAllowsDeferral:", v5);
  v11 = -[_FEFocusUpdateContext _initWithFocusUpdateRequest:]([_FEFocusUpdateContext alloc], "_initWithFocusUpdateRequest:", v10);

  return v11;
}

- (BOOL)_performFocusMovement:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_FEFocusSystem _movementPerformer](self, "_movementPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "performFocusMovement:", v4);

  return v6;
}

- (void)invalidateFocusItemContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_FEFocusSystem _focusMovementCache](self, "_focusMovementCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateFocusItemContainer:", v4);

}

- (_FEFocusEnvironmentPreferenceCache)_deepestPreferredFocusableItemCacheForCurrentUpdate
{
  void *v3;
  int v4;
  _FEFocusEnvironmentPreferenceCache *v5;
  _FEFocusEnvironmentPreferenceCache *deepestPreferredFocusableItemCacheForCurrentUpdate;

  if (!self->_deepestPreferredFocusableItemCacheForCurrentUpdate && (*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    -[_FEFocusSystem behavior](self, "behavior");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "cachesPreferredEnvironmentEnumerationResults");

    if (v4)
    {
      v5 = (_FEFocusEnvironmentPreferenceCache *)objc_opt_new();
      deepestPreferredFocusableItemCacheForCurrentUpdate = self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
      self->_deepestPreferredFocusableItemCacheForCurrentUpdate = v5;

    }
  }
  return self->_deepestPreferredFocusableItemCacheForCurrentUpdate;
}

- (void)_buildFocusItemAncestorCacheIfNecessary
{
  NSHashTable **p_focusItemAncestorCache;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  p_focusItemAncestorCache = &self->_focusItemAncestorCache;
  if (!self->_focusItemAncestorCache)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
    if (WeakRetained)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __57___FEFocusSystem__buildFocusItemAncestorCacheIfNecessary__block_invoke;
      v6[3] = &unk_250D39FD0;
      v7 = v4;
      _FEFocusEnvironmentEnumerateAncestorEnvironments(WeakRetained, v6);
      objc_storeStrong((id *)p_focusItemAncestorCache, v4);

    }
    else
    {
      objc_storeStrong((id *)p_focusItemAncestorCache, v4);
    }

  }
}

- (void)_clearFocusItemAncestorCache
{
  NSHashTable *focusItemAncestorCache;

  focusItemAncestorCache = self->_focusItemAncestorCache;
  self->_focusItemAncestorCache = 0;

}

- (BOOL)_focusedItemIsContainedInEnvironment:(id)a3 includeSelf:(BOOL)a4
{
  id v7;
  BOOL v8;
  id WeakRetained;
  void *v11;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment != nil"));

  }
  -[_FEFocusSystem _buildFocusItemAncestorCacheIfNecessary](self, "_buildFocusItemAncestorCacheIfNecessary");
  if (a4)
  {
    v8 = -[NSHashTable containsObject:](self->_focusItemAncestorCache, "containsObject:", v7);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
    v8 = WeakRetained != v7 && -[NSHashTable containsObject:](self->_focusItemAncestorCache, "containsObject:", v7);

  }
  return v8;
}

- (void)_reevaluateLockedEnvironments
{
  $C26450B17F84A6D740AC00827B43141C flags;
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  uint8_t buf[16];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  flags = self->_flags;
  self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&flags & 0xFFFFFFF7);
  if ((*(_BYTE *)&flags & 8) != 0 && (self->_pendingFocusUpdateRequest || self->_appearingFocusEnvironment))
  {
    logger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_23C48C000, v4, OS_LOG_TYPE_DEBUG, "Trying to execute postponed update...", buf, 2u);
    }

    objc_initWeak(&location, self);
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __47___FEFocusSystem__reevaluateLockedEnvironments__block_invoke;
    v9 = &unk_250D39E90;
    objc_copyWeak(&v10, &location);
    v5 = &v6;
    if (!qword_256BAFC90)
    {
      *(_OWORD *)buf = xmmword_250D3A038;
      v13 = 0;
      qword_256BAFC90 = _sl_dlopen();
    }
    if (qword_256BAFC90)
    {
      if (qword_256BAFC88 != -1)
        dispatch_once(&qword_256BAFC88, &__block_literal_global_434);
      objc_msgSend((id)qword_256BAFC80, "_performBlockAfterCATransactionCommits:", v5, v6, v7, v8, v9);
    }
    else
    {
      dispatch_async(MEMORY[0x24BDAC9B8], v5);
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_setNeedsFocusRestoration
{
  *(_DWORD *)&self->_flags |= 4u;
}

- (void)_cancelPendingFocusRestoration
{
  *(_DWORD *)&self->_flags &= ~4u;
}

- (void)_handleFocusMovementAction:(id)a3
{
  -[_FEFocusSystem setPendingFocusMovementAction:](self, "setPendingFocusMovementAction:", a3);
  if (-[_FEFocusSystem waitingForFocusMovementAction](self, "waitingForFocusMovementAction"))
  {
    -[_FEFocusSystem _setEnabled:](self, "_setEnabled:", 1);
    -[_FEFocusSystem setWaitingForFocusMovementAction:](self, "setWaitingForFocusMovementAction:", 0);
  }
}

- (_FEFocusEnvironment)_deepestPreferredFocusEnvironment
{
  void *v3;
  void *v4;
  id v5;
  _FEFocusEnvironment **p_deepestPreferredFocusEnvironment;
  id WeakRetained;
  _UIDeepestPreferredEnvironmentSearch *v8;
  void *v9;
  void *v10;

  -[_FEFocusSystem _focusedItemOrDeferralTarget](self, "_focusedItemOrDeferralTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    p_deepestPreferredFocusEnvironment = &self->_deepestPreferredFocusEnvironment;
    WeakRetained = objc_loadWeakRetained((id *)&self->_deepestPreferredFocusEnvironment);

    if (!WeakRetained)
    {
      v8 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
      -[_UIDeepestPreferredEnvironmentSearch deepestPreferredFocusEnvironmentForEnvironment:](v8, "deepestPreferredFocusEnvironmentForEnvironment:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)p_deepestPreferredFocusEnvironment, v9);

    }
    v5 = objc_loadWeakRetained((id *)p_deepestPreferredFocusEnvironment);
  }
  v10 = v5;

  return (_FEFocusEnvironment *)v10;
}

- (BOOL)_shouldReverseLayoutDirectionForEnvironment:(id)a3
{
  _FEFocusSystem *v4;
  id v5;
  void *v6;

  if ((*((_BYTE *)&self->_flags + 2) & 0x10) == 0)
    return 0;
  v4 = self;
  v5 = a3;
  -[_FEFocusSystem delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_focusSystem:shouldReverseLayoutDirectionForEnvironment:", v4, v5);

  return (char)v4;
}

- (BOOL)_shouldReverseLinearWrappingForEnvironment:(id)a3
{
  _FEFocusSystem *v4;
  id v5;
  void *v6;

  if ((*((_BYTE *)&self->_flags + 2) & 0x20) == 0)
    return 0;
  v4 = self;
  v5 = a3;
  -[_FEFocusSystem delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_focusSystem:shouldReverseLinearWrappingForEnvironment:", v4, v5);

  return (char)v4;
}

- (BOOL)_requiresFocusedItemToBeInHierarchy
{
  void *v2;
  char v3;

  -[_FEFocusSystem behavior](self, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "modernFocusedItemGetterBehavior") ^ 1;

  return v3;
}

- (BOOL)_postsFocusUpdateNotifications
{
  return 1;
}

- (_FEFocusSystem)_hostFocusSystem
{
  return 0;
}

- (BOOL)_uiktest_updateFocusToItem:(id)a3
{
  _FEFocusSystem *v3;
  void *v4;

  v3 = self;
  -[_FEFocusSystem _simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:](self, "_simulatedNonDeferredProgrammaticFocusUpdateToEnvironment:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[_FEFocusSystem _updateFocusWithContext:report:](v3, "_updateFocusWithContext:report:", v4, 0);

  return (char)v3;
}

- (void)_uiktest_setPreviousFocusedItem:(id)a3
{
  objc_storeWeak((id *)&self->_previousFocusedItem, a3);
}

- (void)_uiktest_disableFocusDeferral
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1766, CFSTR("This method is only to be used during UIKit tests."));

}

- (void)_uiktest_disableThrottle
{
  _FEFocusUpdateThrottle *updateThrottle;

  -[_FEFocusUpdateThrottle teardown](self->_updateThrottle, "teardown");
  updateThrottle = self->_updateThrottle;
  self->_updateThrottle = 0;

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 64;
    else
      v5 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 128;
    else
      v6 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 256;
    else
      v7 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 512;
    else
      v8 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 1024;
    else
      v9 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 2048;
    else
      v10 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 4096;
    else
      v11 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 0x2000;
    else
      v12 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 0x4000;
    else
      v13 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 0x8000;
    else
      v14 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v14);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 0x10000;
    else
      v15 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v15);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 0x20000;
    else
      v16 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 0x40000;
    else
      v17 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v17);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 0x80000;
    else
      v18 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v18);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 0x100000;
    else
      v19 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 0x200000;
    else
      v20 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFDFFFFF | v20);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 0x400000;
    else
      v21 = 0;
    self->_flags = ($C26450B17F84A6D740AC00827B43141C)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v21);
  }

}

- (BOOL)_shouldRestoreFocusInContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char IsAncestorOfEnvironment;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1811, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  -[_FEFocusSystem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    IsAncestorOfEnvironment = objc_msgSend(v6, "_focusSystem:shouldRestoreFocusInContext:", self, v5);
  }
  else
  {
    objc_msgSend(v5, "nextFocusedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsAncestorOfEnvironment = _FEFocusEnvironmentIsAncestorOfEnvironment(self, v8);

  }
  return IsAncestorOfEnvironment;
}

- (void)_didFinishUpdatingFocusInContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusSystem.m"), 1823, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    v5 = 0;
  }
  objc_msgSend(v5, "_sourceItemInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateFocusedRegion");

  objc_msgSend(v11, "_destinationItemInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateFocusedRegion");

  -[_FEFocusSystem delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (*((_BYTE *)&self->_flags + 1) & 8) != 0)
    objc_msgSend(v8, "_focusSystem:didFinishUpdatingFocusInContext:", self, v11);

}

- (BOOL)_isScrollingScrollableContainer:(id)a3 targetContentOffset:(CGPoint *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[_FEFocusSystem delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (*((_BYTE *)&self->_flags + 2) & 0x40) != 0)
    v9 = objc_msgSend(v7, "_focusSystem:isScrollingScrollableContainer:targetContentOffset:", self, v6, a4);
  else
    v9 = 0;

  return v9;
}

- (BOOL)_handleFailedFocusMovementRequest:(id)a3 withPerformer:(id)a4
{
  _FEFocusSystem *v5;
  id v6;
  void *v7;

  if ((*((_BYTE *)&self->_flags + 2) & 8) == 0)
    return 0;
  v5 = self;
  v6 = a3;
  -[_FEFocusSystem delegate](v5, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "_focusSystem:handleFailedMovementRequest:", v5, v6);

  return (char)v5;
}

- (void)setBehavior:(id)a3
{
  _FEFocusBehavior *v5;
  _FEFocusBehavior *v6;

  v5 = (_FEFocusBehavior *)a3;
  if (self->_behavior != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_behavior, a3);
    -[_FEFocusSystem _focusBehaviorDidChange](self, "_focusBehaviorDidChange");
    v5 = v6;
  }

}

- (void)_focusBehaviorDidChange
{
  -[_FEFocusSystem _updateFocusUpdateThrottle](self, "_updateFocusUpdateThrottle");
  -[_FEFocusSystem _updateWantsTreeLocking](self, "_updateWantsTreeLocking");
}

- (void)_updateFocusUpdateThrottle
{
  void *v3;
  _FEFocusUpdateThrottle *updateThrottle;
  _FEFocusUpdateThrottle *v5;
  _FEFocusUpdateThrottle *v6;
  _FEFocusUpdateThrottle *v7;
  _FEFocusUpdateThrottle *v8;
  _FEFocusUpdateThrottle *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[_FEFocusSystem behavior](self, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "throttlesProgrammaticFocusUpdates"))
  {
    updateThrottle = self->_updateThrottle;

    if (!updateThrottle)
    {
      objc_initWeak(&location, self);
      v5 = [_FEFocusUpdateThrottle alloc];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __44___FEFocusSystem__updateFocusUpdateThrottle__block_invoke;
      v11[3] = &unk_250D39E90;
      objc_copyWeak(&v12, &location);
      v6 = -[_FEFocusUpdateThrottle initWithUpdateHandler:](v5, "initWithUpdateHandler:", v11);
      v7 = self->_updateThrottle;
      self->_updateThrottle = v6;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {

  }
  -[_FEFocusSystem behavior](self, "behavior");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "throttlesProgrammaticFocusUpdates") & 1) != 0)
  {

  }
  else
  {
    v8 = self->_updateThrottle;

    if (v8)
    {
      -[_FEFocusUpdateThrottle teardown](self->_updateThrottle, "teardown");
      v9 = self->_updateThrottle;
      self->_updateThrottle = 0;

    }
  }
}

- (NSString)description
{
  void *v3;
  id v4;
  id WeakRetained;
  id v6;
  _FEFocusUpdateRequest *pendingFocusUpdateRequest;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  id v17;
  id v18;
  _FETreeLock *treeLock;
  id v20;
  void *v21;
  id v23;
  id v24;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics() && (*(_BYTE *)&self->_flags & 1) != 0)
    v24 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("YES"), CFSTR("TEARDOWN RECEIVED"));
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_enabled, CFSTR("enabled"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", WeakRetained, CFSTR("focusedItem"));

  pendingFocusUpdateRequest = self->_pendingFocusUpdateRequest;
  if (pendingFocusUpdateRequest)
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", pendingFocusUpdateRequest, CFSTR("pendingFocusUpdateRequest"));
  logger();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    v11 = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);

    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)&self->_deferredFocusUpdateTarget);
      if (v12)
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = CFSTR("(nil)");
      }

      v18 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("deferredFocusUpdateTarget"));
    }
    else
    {
      v17 = objc_loadWeakRetained((id *)&self->_focusedItem);
      if (v17)
      {

      }
      else if (-[_FEFocusSystem _effectiveFocusDeferralBehavior](self, "_effectiveFocusDeferralBehavior"))
      {
        v23 = (id)objc_msgSend(v3, "appendObject:withName:", CFSTR("nil"), CFSTR("deferredFocusUpdateTarget"));
      }
    }
    treeLock = self->_treeLock;
    if (treeLock)
      v20 = (id)objc_msgSend(v3, "appendObject:withName:", treeLock, CFSTR("treeLock"));
  }
  objc_msgSend(v3, "build");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (_FEFocusMovementPerformer)_movementPerformer
{
  return self->_movementPerformer;
}

- (BOOL)waitingForFocusMovementAction
{
  return self->_waitingForFocusMovementAction;
}

- (void)setWaitingForFocusMovementAction:(BOOL)a3
{
  self->_waitingForFocusMovementAction = a3;
}

- (_FEFocusMovementAction)pendingFocusMovementAction
{
  return self->_pendingFocusMovementAction;
}

- (void)setPendingFocusMovementAction:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFocusMovementAction, a3);
}

- (_FEFocusUpdateThrottle)updateThrottle
{
  return self->_updateThrottle;
}

- (_FETreeLock)treeLock
{
  return self->_treeLock;
}

- (_FEFocusItem)_previousFocusedItem
{
  return (_FEFocusItem *)objc_loadWeakRetained((id *)&self->_previousFocusedItem);
}

- (_FEFocusCastingController)_focusCastingController
{
  return self->_focusCastingController;
}

- (_FEFocusLinearMovementCache)_focusMovementCache
{
  return self->_focusMovementCache;
}

- (void)_setFocusMovementCache:(id)a3
{
  objc_storeStrong((id *)&self->_focusMovementCache, a3);
}

- (_FEFocusBehavior)behavior
{
  return self->_behavior;
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (NSNumber)_overrideFocusDeferralBehavior
{
  return self->_overrideFocusDeferralBehavior;
}

- (_FEFocusSystemDelegate)delegate
{
  return (_FEFocusSystemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideFocusDeferralBehavior, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_focusMovementCache, 0);
  objc_storeStrong((id *)&self->_focusCastingController, 0);
  objc_destroyWeak((id *)&self->_previousFocusedItem);
  objc_storeStrong((id *)&self->_treeLock, 0);
  objc_storeStrong((id *)&self->_updateThrottle, 0);
  objc_storeStrong((id *)&self->_pendingFocusMovementAction, 0);
  objc_destroyWeak((id *)&self->_deepestPreferredFocusEnvironment);
  objc_storeStrong((id *)&self->_deepestPreferredFocusableItemCacheForCurrentUpdate, 0);
  objc_storeStrong((id *)&self->_focusGroupHistory, 0);
  objc_destroyWeak((id *)&self->_focusedItem);
  objc_storeStrong((id *)&self->_movementPerformer, 0);
  objc_destroyWeak((id *)&self->_hasSeenFocusedItemDidExpireTimer);
  objc_storeStrong((id *)&self->_focusItemAncestorCache, 0);
  objc_storeStrong((id *)&self->_disappearingFocusEnvironment, 0);
  objc_storeStrong((id *)&self->_appearingFocusEnvironment, 0);
  objc_destroyWeak((id *)&self->_deferredFocusUpdateTarget);
  objc_storeStrong((id *)&self->_pendingFocusUpdateRequest, 0);
}

@end
