@implementation CSUserPresenceMonitor

- (CSUserPresenceMonitor)initWithBiometricResource:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  CSUserPresenceMonitor *v7;

  v4 = (objc_class *)MEMORY[0x1E0CFEC00];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[CSUserPresenceMonitor initWithBiometricResource:attentionAwarenessClient:](self, "initWithBiometricResource:attentionAwarenessClient:", v5, v6);

  return v7;
}

- (CSUserPresenceMonitor)initWithBiometricResource:(id)a3 attentionAwarenessClient:(id)a4
{
  id v7;
  id v8;
  CSUserPresenceMonitor *v9;
  CSUserPresenceMonitor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSUserPresenceMonitor;
  v9 = -[CSUserPresenceMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometricResource, a3);
    objc_storeStrong((id *)&v10->_attentionAwarenessClient, a4);
    -[CSUserPresenceMonitor _monitorForInjectedUserPresence](v10, "_monitorForInjectedUserPresence");
    -[CSUserPresenceMonitor _configureAttentionAwarenessClient](v10, "_configureAttentionAwarenessClient");
  }

  return v10;
}

- (void)_monitorForInjectedUserPresence
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CSUserPresenceMonitor__monitorForInjectedUserPresence__block_invoke;
  v6[3] = &unk_1E8E30488;
  v6[4] = self;
  v5 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("cs-inject-user-presence"), 0, v4, v6);

}

void __56__CSUserPresenceMonitor__monitorForInjectedUserPresence__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogDashBoard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("reason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Injecting fake user presence with reason %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setUserPresenceDetectedSinceWake:", 1);

}

- (void)dealloc
{
  AWAttentionAwarenessClient *attentionAwarenessClient;
  objc_super v4;

  -[AWAttentionAwarenessClient invalidateWithError:](self->_attentionAwarenessClient, "invalidateWithError:", 0);
  attentionAwarenessClient = self->_attentionAwarenessClient;
  self->_attentionAwarenessClient = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSUserPresenceMonitor;
  -[CSUserPresenceMonitor dealloc](&v4, sel_dealloc);
}

- (void)enableDetectionForReason:(id)a3
{
  id v4;
  NSMutableSet *activationReasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  activationReasons = self->_activationReasons;
  v8 = v4;
  if (!activationReasons)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_activationReasons;
    self->_activationReasons = v6;

    v4 = v8;
    activationReasons = self->_activationReasons;
  }
  -[NSMutableSet addObject:](activationReasons, "addObject:", v4);
  -[CSUserPresenceMonitor _updateFaceDetectionState](self, "_updateFaceDetectionState");

}

- (void)disableDetectionForReason:(id)a3
{
  -[NSMutableSet removeObject:](self->_activationReasons, "removeObject:", a3);
  -[CSUserPresenceMonitor _updateFaceDetectionState](self, "_updateFaceDetectionState");
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)isUserPresenceDetectionSupported
{
  return -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport");
}

- (BOOL)isDetectionEnabled
{
  return -[NSMutableSet count](self->_activationReasons, "count") != 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 <= 10)
  {
    if (v5 == 5)
    {
      -[CSUserPresenceMonitor _setUserPresenceDetectedSinceWake:](self, "_setUserPresenceDetectedSinceWake:", 1);
    }
    else
    {
      if (v5 != 10)
        goto LABEL_14;
      self->_coverSheetResignedActive = 1;
    }
LABEL_13:
    -[CSUserPresenceMonitor _updateFaceDetectionState](self, "_updateFaceDetectionState");
    goto LABEL_14;
  }
  switch(v5)
  {
    case 11:
      self->_coverSheetResignedActive = 0;
      goto LABEL_13;
    case 25:
      -[CSUserPresenceMonitor _setUserPresenceDetectedSinceWake:](self, "_setUserPresenceDetectedSinceWake:", 0);
      -[CSUserPresenceMonitor _cancelPollForAttention](self, "_cancelPollForAttention");
      goto LABEL_13;
    case 15:
      objc_msgSend(v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CSUserPresenceMonitor _handleBiometricEvent:](self, "_handleBiometricEvent:", objc_msgSend(v6, "unsignedIntegerValue"));

      if (v7)
        goto LABEL_13;
      break;
  }
LABEL_14:

  return 0;
}

- (void)_setUserPresenceDetectedSinceWake:(BOOL)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_userPresenceDetectedSinceWake != a3)
  {
    self->_userPresenceDetectedSinceWake = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_observers;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "userPresenceDetectedSinceWakeDidChange:", self, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_handleBiometricEvent:(unint64_t)a3
{
  NSObject *v5;
  uint8_t v7[16];

  if (a3 == 13)
  {
    SBLogDashBoard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Face in view", v7, 2u);
    }

    -[CSUserPresenceMonitor _setUserPresenceDetectedSinceWake:](self, "_setUserPresenceDetectedSinceWake:", 1);
  }
  return a3 == 13;
}

- (BOOL)_isFaceDetectPermitted
{
  return (-[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled") & 1) != 0|| _AXSAttentionAwarenessFeaturesEnabled() != 0;
}

- (void)_configureAttentionAwarenessClient
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CFEC08]);
  objc_msgSend(v3, "setIdentifier:", CFSTR("com.apple.SpringBoard.CoverSheetUserPresenceMonitor"));
  objc_msgSend(v3, "setEventMask:", 128);
  -[AWAttentionAwarenessClient setConfiguration:](self->_attentionAwarenessClient, "setConfiguration:", v3);

}

- (void)_pollForAttention
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_6(&dword_1D0337000, v0, v1, "[User Presence Monitor] Failed polling for attention with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

void __42__CSUserPresenceMonitor__pollForAttention__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleAttentionAwarenessEvent:", v6);

}

- (void)_cancelPollForAttention
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_6(&dword_1D0337000, v0, v1, "[User Presence Monitor] Failed to cancel poll for attention with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

- (void)_resumeAttentionAwarenessClient
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_6(&dword_1D0337000, v0, v1, "[User Presence Monitor] Cannot resume attention awareness client with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

- (void)_suspendAttentionAwarenessClient
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_6(&dword_1D0337000, v0, v1, "[User Presence Monitor] Cannot suspend attention awareness client with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

- (void)_handleAttentionAwarenessEvent:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if ((objc_msgSend(v4, "eventMask") & 0x80) != 0)
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = (uint64_t)v6;
      else
        v5 = 0;
    }

    if (v5)
    {
      SBLogDashBoard();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Did receive face detect event", v8, 2u);
      }

      -[CSUserPresenceMonitor _setUserPresenceDetectedSinceWake:](self, "_setUserPresenceDetectedSinceWake:", 1);
    }
  }

}

- (void)_updateFaceDetectionState
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 userPresenceDetectedSinceWake;
  _BOOL4 coverSheetResignedActive;
  NSMutableSet *activationReasons;
  NSObject *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  NSMutableSet *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[CSUserPresenceMonitor isUserPresenceDetectionSupported](self, "isUserPresenceDetectionSupported");
  v4 = -[CSUserPresenceMonitor _isFaceDetectPermitted](self, "_isFaceDetectPermitted");
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
    v6 = !self->_userPresenceDetectedSinceWake
      && !self->_coverSheetResignedActive
      && -[NSMutableSet count](self->_activationReasons, "count") != 0;
  SBLogDashBoard();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    userPresenceDetectedSinceWake = self->_userPresenceDetectedSinceWake;
    coverSheetResignedActive = self->_coverSheetResignedActive;
    activationReasons = self->_activationReasons;
    v13[0] = 67110402;
    v13[1] = v3;
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = userPresenceDetectedSinceWake;
    v18 = 1024;
    v19 = coverSheetResignedActive;
    v20 = 2112;
    v21 = activationReasons;
    v22 = 1024;
    v23 = v6;
    _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Evaluate face detection enablement [ available: %{BOOL}d allowed: %{BOOL}d detected: %{BOOL}d resignedActive: %{BOOL}d reasons: %@ ] result: %{BOOL}d", (uint8_t *)v13, 0x2Au);
  }

  if (v6)
  {
    SBLogDashBoard();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Polling for attention", (uint8_t *)v13, 2u);
    }

    -[CSUserPresenceMonitor _pollForAttention](self, "_pollForAttention");
    -[CSUserPresenceMonitor _resumeAttentionAwarenessClient](self, "_resumeAttentionAwarenessClient");
  }
  else if (self->_attentionAwarenessClient)
  {
    SBLogDashBoard();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Cancelling poll for attention", (uint8_t *)v13, 2u);
    }

    -[CSUserPresenceMonitor _cancelPollForAttention](self, "_cancelPollForAttention");
    -[CSUserPresenceMonitor _suspendAttentionAwarenessClient](self, "_suspendAttentionAwarenessClient");
  }
}

- (BOOL)userPresenceDetectedSinceWake
{
  return self->_userPresenceDetectedSinceWake;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activationReasons, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
}

+ (void)synthesizeUserPresenceForReason:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v6 = objc_alloc_init(v3);
  objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("reason"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("cs-inject-user-presence"), 0, v6);

}

@end
