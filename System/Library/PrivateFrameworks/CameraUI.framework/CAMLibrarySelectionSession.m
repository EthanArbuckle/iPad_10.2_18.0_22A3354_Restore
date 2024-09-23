@implementation CAMLibrarySelectionSession

- (CAMLibrarySelectionSession)initWithMode:(int64_t)a3
{
  CAMLibrarySelectionSession *v4;
  void *v5;
  uint64_t v6;
  NSDate *launchDate;
  int64_t initialMode;
  void *v9;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 restoredFromPreferences;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)CAMLibrarySelectionSession;
  v4 = -[CAMLibrarySelectionSession init](&v20, sel_init);
  if (v4)
  {
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    launchDate = v4->_launchDate;
    v4->_launchDate = (NSDate *)v6;

    v4->_initialMode = a3;
    v4->_currentMode = a3;
    v4->_userInteractionsCount = 0;
    v4->_restoredFromPreferences = +[CAMUserPreferences hasSharedLibraryAlgorithmsPreferences](CAMUserPreferences, "hasSharedLibraryAlgorithmsPreferences");
    initialMode = v4->_initialMode;
    v4->_canResetToDefaultMode = initialMode != -[CAMLibrarySelectionSession _defaultMode](v4, "_defaultMode");
    if ((objc_msgSend(v5, "sharedLibraryAutoBehaviorEnabled") & 1) == 0)
      v4->_canResetToDefaultMode = 0;
    v4->_overriddenByUser = CAMSharedLibraryModeIsUserState(v4->_currentMode);
    v4->_userWasPreviouslyOnTrip = -[CAMLibrarySelectionSession _userWasPreviouslyOnTrip](v4, "_userWasPreviouslyOnTrip");
    objc_msgSend(v5, "sharedLibraryLastLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4->_canResetToDefaultMode
      && -[CAMLibrarySelectionSession _shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:](v4, "_shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:", v4->_userWasPreviouslyOnTrip, v9 != 0))
    {
      -[CAMLibrarySelectionSession _applyAutoResetModeAndNotify:](v4, "_applyAutoResetModeAndNotify:", 0);
    }
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v4->_timeToDetectDevicesInProximity = _Q0;
    *(_OWORD *)&v4->_timeToAcquireFirstPreciseLocation = _Q0;
    v4->_timeForUserManualOverride = -1.0;
    CAMSignpostsSmartSharingAutoDecisionBegin();
    CAMSignpostsUserManualOverrideBegin();
    v15 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CAMSharedLibraryModeDescription(v4->_initialMode);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CAMSharedLibraryModeDescription(v4->_currentMode);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      restoredFromPreferences = v4->_restoredFromPreferences;
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      v25 = 1026;
      v26 = restoredFromPreferences;
      _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] Session created with initial mode: %{public}@, current mode: %{public}@, restoredFromPreferences: %{public}d", buf, 0x1Cu);

    }
  }
  return v4;
}

- (BOOL)updateWithMode:(int64_t)a3
{
  int64_t currentMode;
  int IsUserState;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  currentMode = self->_currentMode;
  if (currentMode != a3)
  {
    self->_currentMode = a3;
    self->_canResetToDefaultMode = 0;
    IsUserState = CAMSharedLibraryModeIsUserState(a3);
    self->_overriddenByUser = IsUserState;
    if (IsUserState)
    {
      ++self->_userInteractionsCount;
      if (self->_timeForUserManualOverride < 0.0)
      {
        -[NSDate timeIntervalSinceNow](self->_launchDate, "timeIntervalSinceNow");
        self->_timeForUserManualOverride = fabs(v7);
        CAMSignpostsUserManualOverrideEnd((uint64_t)self, -[CAMLibrarySelectionSession initialMode](self, "initialMode"), -[CAMLibrarySelectionSession currentMode](self, "currentMode"));
      }
    }
    if (self->_timeForSmartSharingAutoDecision < 0.0 && CAMSharedLibraryModeIsAutoState(a3))
    {
      -[NSDate timeIntervalSinceNow](self->_launchDate, "timeIntervalSinceNow");
      self->_timeForSmartSharingAutoDecision = fabs(v8);
      CAMSignpostsSmartSharingAutoDecisionEnd((uint64_t)self, -[CAMLibrarySelectionSession initialMode](self, "initialMode"), -[CAMLibrarySelectionSession currentMode](self, "currentMode"));
    }
    v9 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CAMSharedLibraryModeDescription(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] setSharedLibraryMode: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    -[CAMLibrarySelectionSession delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySelectionDidChangeSharedLibraryMode:", a3);

  }
  return currentMode != a3;
}

- (BOOL)updateWithResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  BOOL v17;
  BOOL v18;

  v4 = a3;
  v5 = v4;
  if (self->_timeToAcquireFirstLocation < 0.0)
  {
    objc_msgSend(v4, "currentLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSDate timeIntervalSinceNow](self->_launchDate, "timeIntervalSinceNow");
      self->_timeToAcquireFirstLocation = fabs(v7);
    }
  }
  if (self->_timeToAcquireFirstPreciseLocation < 0.0)
  {
    objc_msgSend(v5, "currentLocation");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v5, "currentLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "horizontalAccuracy");
      v12 = v11;

      if (v12 < 50.0)
      {
        -[NSDate timeIntervalSinceNow](self->_launchDate, "timeIntervalSinceNow");
        self->_timeToAcquireFirstPreciseLocation = fabs(v13);
      }
    }
  }
  if (self->_timeToDetectDevicesInProximity < 0.0)
  {
    objc_msgSend(v5, "identitiesInProximity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      -[NSDate timeIntervalSinceNow](self->_launchDate, "timeIntervalSinceNow");
      self->_timeToDetectDevicesInProximity = fabs(v16);
    }
  }
  if (-[CAMLibrarySelectionSession _canTransitionToAutoOn](self, "_canTransitionToAutoOn")
    && objc_msgSend(v5, "suggestsSharing"))
  {
    v17 = -[CAMLibrarySelectionSession updateWithMode:](self, "updateWithMode:", 4);
  }
  else
  {
    if (!self->_canResetToDefaultMode)
      goto LABEL_19;
    if (!-[CAMLibrarySelectionSession _canResetDuringSessionWithResult:](self, "_canResetDuringSessionWithResult:", v5))
    {
      v18 = 0;
      self->_canResetToDefaultMode = 0;
      goto LABEL_21;
    }
    if (!-[CAMLibrarySelectionSession _shouldResetDuringSessionWithResult:](self, "_shouldResetDuringSessionWithResult:", v5))
    {
LABEL_19:
      v18 = 0;
      goto LABEL_21;
    }
    v17 = -[CAMLibrarySelectionSession _applyAutoResetModeAndNotify:](self, "_applyAutoResetModeAndNotify:", 1);
  }
  v18 = v17;
LABEL_21:

  return v18;
}

- (BOOL)notifyResetIfNeeded
{
  void *v4;

  if (self->_initialMode == self->_currentMode && self->_restoredFromPreferences)
    return 0;
  -[CAMLibrarySelectionSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySelectionDidChangeSharedLibraryMode:", self->_currentMode);

  return 1;
}

- (BOOL)_applyAutoResetModeAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t currentMode;
  int64_t v6;
  unint64_t v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  currentMode = self->_currentMode;
  if (currentMode < 5)
  {
    v6 = -[CAMLibrarySelectionSession _autoResetMode](self, "_autoResetMode");
LABEL_3:
    v7 = v6;
    goto LABEL_4;
  }
  if (currentMode == 5)
  {
    v6 = -[CAMLibrarySelectionSession _defaultMode](self, "_defaultMode");
    goto LABEL_3;
  }
  v7 = 0;
LABEL_4:
  v8 = self->_currentMode;
  if (v8 != v7)
  {
    self->_currentMode = v7;
    *(_WORD *)&self->_canResetToDefaultMode = 0;
    v9 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CAMSharedLibraryModeDescription(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 1026;
      v16 = v3;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] autoResetModeAndNotify: %{public}@, notify: %{public}d", (uint8_t *)&v13, 0x12u);

    }
    if (v3)
    {
      -[CAMLibrarySelectionSession delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "librarySelectionDidChangeSharedLibraryMode:", v7);

    }
  }
  return v8 != v7;
}

- (int64_t)_defaultMode
{
  void *v2;
  int64_t v3;

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultToSharedLibraryEnabled");

  return v3;
}

- (int64_t)_autoResetMode
{
  void *v2;
  int64_t v3;

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "defaultToSharedLibraryEnabled"))
    v3 = 4;
  else
    v3 = 5;

  return v3;
}

- (BOOL)_canTransitionToAutoOn
{
  void *v3;
  unint64_t currentMode;
  BOOL v5;
  unsigned int v6;
  BOOL v7;

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sharedLibraryAutoBehaviorEnabled"))
  {
    currentMode = self->_currentMode;
    v5 = currentMode > 5;
    v6 = (0x31u >> currentMode) & 1;
    if (v5)
      v7 = 0;
    else
      v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_canResetDuringSessionWithResult:(id)a3
{
  id v4;
  double v5;
  NSObject *v6;
  NSDate *launchDate;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v20;
  NSDate *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDate timeIntervalSinceNow](self->_launchDate, "timeIntervalSinceNow");
  if (fabs(v5) > 25.0)
  {
    v6 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      launchDate = self->_launchDate;
      v20 = 138543362;
      v21 = launchDate;
      v8 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: too long after launch: %{public}@";
      v9 = v6;
      v10 = 12;
LABEL_16:
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v20, v10);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if ((objc_msgSend(v4, "cameraHasAccessToLocation") & 1) == 0
    && !CAMLocationAccessPendingOrNotDeterminedWithAuthorizationStatus(objc_msgSend(v4, "locationAuthorizationStatus")))
  {
    v6 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v8 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no access to location";
      v9 = v6;
      v10 = 2;
      goto LABEL_16;
    }
LABEL_25:
    v18 = 0;
    goto LABEL_26;
  }
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v11 = objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (self->_overriddenByUser)
  {
    -[NSObject sharedLibraryLastUserActionLocation](v11, "sharedLibraryLastUserActionLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v14 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        v15 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no location of last user action";
        goto LABEL_23;
      }
LABEL_24:

      goto LABEL_25;
    }
    -[NSObject sharedLibraryLastUserActionDate](v6, "sharedLibraryLastUserActionDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        v15 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no time of last user action";
LABEL_23:
        _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
  }
  else
  {
    -[NSObject sharedLibraryLastDiscoveryLocation](v11, "sharedLibraryLastDiscoveryLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v14 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        v15 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no location of last discovery";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    -[NSObject sharedLibraryLastDiscoveryDate](v6, "sharedLibraryLastDiscoveryDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v14 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        v15 = "[CAMLibrarySelectionSession] Can't reset shared library mode during session: no time of last discovery";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
  }
  v18 = 1;
LABEL_26:

  return v18;
}

- (BOOL)_userWasPreviouslyOnTrip
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  BOOL v9;

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sharedLibraryLastLocationAcquiredDuringTrip"))
  {
    objc_msgSend(v2, "sharedLibraryLastLocation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = fabs(v5);

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySelectionTripResetTimeout");
    v9 = v6 <= v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldResetSessionBasedOnTimeoutDuringTrip:(BOOL)a3 atSameLocation:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  int v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v4 = a4;
  v5 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "librarySelectionTripResetTimeout");
  }
  else if (v4)
  {
    objc_msgSend(v7, "librarySelectionSameLocationResetTimeout");
  }
  else if (self->_overriddenByUser)
  {
    objc_msgSend(v7, "librarySelectionUserChoiceResetTimeout");
  }
  else
  {
    objc_msgSend(v7, "librarySelectionAutoOnResetTimeout");
  }
  v10 = v9;
  if (self->_overriddenByUser)
    objc_msgSend(v8, "sharedLibraryLastUserActionDate");
  else
    objc_msgSend(v8, "sharedLibraryLastDiscoveryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v16 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CAMLibrarySelectionSession _shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:].cold.1(v16);
    goto LABEL_20;
  }
  objc_msgSend(v11, "timeIntervalSinceNow");
  v14 = fabs(v13);
  v15 = os_log_create("com.apple.camera", "SharedLibrary");
  v16 = v15;
  if (v14 >= v10)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218240;
      v20 = v14;
      v21 = 2048;
      v22 = v10;
      _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] Resetting shared library mode based on timeout: %.0f >= %.0f", (uint8_t *)&v19, 0x16u);
    }
LABEL_20:
    v17 = 1;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CAMLibrarySelectionSession _shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:].cold.2(v16, v14, v10);
  v17 = 0;
LABEL_21:

  return v17;
}

- (BOOL)_shouldResetDuringSessionWithResult:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  double v31;
  NSObject *v32;
  CLLocationCoordinate2D v34;
  uint8_t buf[4];
  _BYTE v36[14];
  __int16 v37;
  double v38;
  uint64_t v39;
  CLLocationCoordinate2D v40;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v4, "isOnTrip") & 1) == 0)
  {
    if (self->_userWasPreviouslyOnTrip
      && -[CAMLibrarySelectionSession _shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:](self, "_shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:", 0, 0))
    {
      v7 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionSession] Resetting shared library mode during session: user was on a trip last time camera was launched, but came back since we acquired a new location", buf, 2u);
      }
      v6 = 1;
      goto LABEL_46;
    }
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (self->_overriddenByUser)
      -[NSObject sharedLibraryLastUserActionLocation](v8, "sharedLibraryLastUserActionLocation");
    else
      -[NSObject sharedLibraryLastDiscoveryLocation](v8, "sharedLibraryLastDiscoveryLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinate");
    v34 = v40;
    if (!CLLocationCoordinate2DIsValid(v40))
    {
      v6 = 0;
LABEL_45:

LABEL_46:
      goto LABEL_47;
    }
    objc_msgSend(v4, "frequentLocationRegionContainingLocation:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frequentLocationRegionContainingLocation:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v10 && v11)
    {
      v13 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "[CAMLibrarySelectionSession] Resetting shared library mode during session: user moved to a frequent location";
LABEL_42:
        _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    if (v10)
    {
      if (v11)
      {
        objc_msgSend(v11, "center");
        if ((objc_msgSend(v10, "containsCoordinate:") & 1) == 0)
        {
          v13 = os_log_create("com.apple.camera", "SharedLibrary");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v14 = "[CAMLibrarySelectionSession] Resetting shared library mode during session: User moved from one frequen"
                  "t location to another";
            goto LABEL_42;
          }
LABEL_43:

          v6 = 1;
          goto LABEL_44;
        }
      }
    }
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v5, "horizontalAccuracy", v15, v16, *(_QWORD *)&v34.latitude, *(_QWORD *)&v34.longitude);
    v18 = v17;
    CLLocationCoordinate2DGetDistanceFrom();
    v20 = v19 - v18;
    v21 = fmax(v19 - v18, 0.0);
    if (self->_overriddenByUser)
      -[NSObject sharedLibraryLastUserActionDate](v7, "sharedLibraryLastUserActionDate");
    else
      -[NSObject sharedLibraryLastDiscoveryDate](v7, "sharedLibraryLastDiscoveryDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v22);
    v25 = v24;

    LODWORD(v23) = -[CAMLibrarySelectionSession _shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:](self, "_shouldResetSessionBasedOnTimeoutDuringTrip:atSameLocation:", 0, v21 <= 350.0);
    v26 = os_log_create("com.apple.camera", "SharedLibrary");
    v27 = v26;
    if ((_DWORD)v23)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v36 = v21 <= 350.0;
        *(_WORD *)&v36[4] = 2048;
        *(double *)&v36[6] = v21;
        v37 = 2048;
        v38 = v25;
        v28 = "[CAMLibrarySelectionSession] Resetting shared library mode during session based on timeout: User considere"
              "d at the same location: %d, distance: %.1f, time: %.0f";
        v29 = v27;
        v30 = 28;
LABEL_27:
        _os_log_impl(&dword_1DB760000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      }
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v36 = v21 <= 350.0;
        *(_WORD *)&v36[4] = 2048;
        *(double *)&v36[6] = v21;
        v37 = 2048;
        v38 = v25;
        _os_log_debug_impl(&dword_1DB760000, v27, OS_LOG_TYPE_DEBUG, "[CAMLibrarySelectionSession] Keeping shared library mode during session: User considered at the same location: %d, distance: %.1f, time: %.0f", buf, 0x1Cu);
      }

      v6 = 0;
      if (v21 <= 350.0 || v20 <= 0.0 || v25 <= 0.0)
        goto LABEL_30;
      v31 = v21 / v25 * 3.6;
      v32 = os_log_create("com.apple.camera", "SharedLibrary");
      v27 = v32;
      if (v31 <= 10.0)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[CAMLibrarySelectionSession _shouldResetDuringSessionWithResult:].cold.1(v27, v31);
        v6 = 0;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v36 = v31;
        v28 = "[CAMLibrarySelectionSession] Resetting shared library mode during session: User moved significantly, compu"
              "ted velocity: %.2f";
        v29 = v27;
        v30 = 12;
        goto LABEL_27;
      }
    }
    v6 = 1;
LABEL_29:

LABEL_30:
LABEL_44:

    goto LABEL_45;
  }
  v6 = 0;
LABEL_47:

  return v6;
}

- (CAMLibrarySelectionDelegate)delegate
{
  return (CAMLibrarySelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)initialMode
{
  return self->_initialMode;
}

- (int64_t)currentMode
{
  return self->_currentMode;
}

- (int64_t)userInteractionsCount
{
  return self->_userInteractionsCount;
}

- (BOOL)restoredFromPreferences
{
  return self->_restoredFromPreferences;
}

- (BOOL)canResetToDefaultMode
{
  return self->_canResetToDefaultMode;
}

- (BOOL)overriddenByUser
{
  return self->_overriddenByUser;
}

- (BOOL)userWasPreviouslyOnTrip
{
  return self->_userWasPreviouslyOnTrip;
}

- (double)timeToDetectDevicesInProximity
{
  return self->_timeToDetectDevicesInProximity;
}

- (double)timeToAcquireFirstLocation
{
  return self->_timeToAcquireFirstLocation;
}

- (double)timeToAcquireFirstPreciseLocation
{
  return self->_timeToAcquireFirstPreciseLocation;
}

- (double)timeForSmartSharingAutoDecision
{
  return self->_timeForSmartSharingAutoDecision;
}

- (double)timeForUserManualOverride
{
  return self->_timeForUserManualOverride;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (void)setLaunchDate:(id)a3
{
  objc_storeStrong((id *)&self->_launchDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_shouldResetSessionBasedOnTimeoutDuringTrip:(os_log_t)log atSameLocation:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "[CAMLibrarySelectionSession] Resetting shared library mode: couldn't find event date for current mode", v1, 2u);
}

- (void)_shouldResetSessionBasedOnTimeoutDuringTrip:(double)a3 atSameLocation:.cold.2(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "[CAMLibrarySelectionSession] Not resetting shared library mode based on timeout: %.0f >= %.0f", (uint8_t *)&v3, 0x16u);
}

- (void)_shouldResetDuringSessionWithResult:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "[CAMLibrarySelectionSession] shouldResetDuringSessionWithResult computed velocity: %.2f", (uint8_t *)&v2, 0xCu);
}

@end
