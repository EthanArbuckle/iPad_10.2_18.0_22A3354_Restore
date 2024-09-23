@implementation CKRaiseGesture

- (void)dealloc
{
  void *v3;
  id v4;
  int proximityToken;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CMGestureManager setGestureHandler:](self->_gestureManager, "setGestureHandler:", 0);
  v4 = (id)-[CMGestureManager gestureHandler](self->_gestureManager, "gestureHandler");
  proximityToken = self->proximityToken;
  if (proximityToken)
    notify_cancel(proximityToken);
  v6.receiver = self;
  v6.super_class = (Class)CKRaiseGesture;
  -[CKRaiseGesture dealloc](&v6, sel_dealloc);
}

+ (BOOL)isRaiseGestureEnabled
{
  int v2;

  v2 = objc_msgSend(a1, "isRaiseGestureSupported");
  if (v2)
    LOBYTE(v2) = CKRaiseToListenEnabled() != 0;
  return v2;
}

+ (BOOL)isRaiseGestureSupported
{
  if (isRaiseGestureSupported_once != -1)
    dispatch_once(&isRaiseGestureSupported_once, &__block_literal_global_163);
  return isRaiseGestureSupported_isRaiseGestureSupported;
}

void __41__CKRaiseGesture_isRaiseGestureSupported__block_invoke()
{
  id v0;

  if ((objc_msgSend(MEMORY[0x1E0CA5650], "isGestureServiceAvailable") & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    isRaiseGestureSupported_isRaiseGestureSupported = objc_msgSend(v0, "isProximityMonitoringSupported");

  }
  else
  {
    isRaiseGestureSupported_isRaiseGestureSupported = 0;
  }
}

- (CKRaiseGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  CKRaiseGesture *v7;
  CKRaiseGesture *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKRaiseGesture;
  v7 = -[CKRaiseGesture init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKRaiseGesture setTarget:](v7, "setTarget:", v6);
    -[CKRaiseGesture setAction:](v8, "setAction:", a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel_proximityStateDidChange_, *MEMORY[0x1E0CEB458], 0);

  }
  return v8;
}

- (void)setProximityMonitoringEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CKRaiseGesture *v17;
  id v18;
  _BYTE buf[12];
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (setProximityMonitoringEnabled__once != -1)
    dispatch_once(&setProximityMonitoringEnabled__once, &__block_literal_global_26_0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("YES");
      *(_QWORD *)&buf[4] = "-[CKRaiseGesture setProximityMonitoringEnabled:]";
      if (setProximityMonitoringEnabled__isExtension)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      *(_DWORD *)buf = 136315650;
      v21 = v7;
      v20 = 2112;
      if (!v3)
        v6 = CFSTR("NO");
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s isExtension %@ enabled %@", buf, 0x20u);
    }

  }
  if (setProximityMonitoringEnabled__isExtension)
  {
    if (setProximityMonitoringEnabled___pred_BKSHIDServicesRequestProximityDetectionModeBackBoardServices != -1)
      dispatch_once(&setProximityMonitoringEnabled___pred_BKSHIDServicesRequestProximityDetectionModeBackBoardServices, &__block_literal_global_36);
    if (!self->proximityToken)
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v8 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __48__CKRaiseGesture_setProximityMonitoringEnabled___block_invoke_2;
      v16 = &unk_1E2756F58;
      objc_copyWeak(&v18, (id *)buf);
      v17 = self;
      notify_register_dispatch("com.apple.backboard.proximity.changed", &self->proximityToken, MEMORY[0x1E0C80D38], &v13);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    if (v3)
      v9 = 3;
    else
      v9 = 0;
    setProximityMonitoringEnabled___BKSHIDServicesRequestProximityDetectionMode(v9);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = CFSTR("NO");
        if (v3)
          v11 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Setting backboard ProximityDetectionMode. enabled %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProximityMonitoringEnabled:", v3);

}

void __48__CKRaiseGesture_setProximityMonitoringEnabled___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundlePath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  setProximityMonitoringEnabled__isExtension = objc_msgSend(v0, "hasSuffix:", CFSTR(".appex"));

}

void *__48__CKRaiseGesture_setProximityMonitoringEnabled___block_invoke_35()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("BKSHIDServicesRequestProximityDetectionMode", CFSTR("BackBoardServices"));
  setProximityMonitoringEnabled___BKSHIDServicesRequestProximityDetectionMode = result;
  return result;
}

void __48__CKRaiseGesture_setProximityMonitoringEnabled___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint8_t v6[8];
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    state64 = 0;
    notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), &state64);
    v3 = state64;
    objc_msgSend(WeakRetained, "setProximityState:", state64 != 0);
    if (!v3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Proximity monitoring disabled because isProxActive was NO.", v6, 2u);
        }

      }
      setProximityMonitoringEnabled___BKSHIDServicesRequestProximityDetectionMode(0);
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (v5)
      {
        notify_cancel(v5);
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
      }
    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  objc_class *v7;
  void *v8;
  CKRaiseGesture *v9;
  NSObject *v10;
  _QWORD v11[6];
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  CKRaiseGesture *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("NO");
        if (v3)
          v6 = CFSTR("YES");
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Gesture enabled: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    if (v3)
    {
      v7 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("CMGestureManager"), CFSTR("CoreMotion"));
      IMCMGestureManager = (uint64_t)v7;
      if (v7)
      {
        v8 = (void *)objc_msgSend([v7 alloc], "initWithPriority:", 2);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v13 = 0x3032000000;
        v14 = __Block_byref_object_copy__51;
        v15 = __Block_byref_object_dispose__51;
        v16 = 0;
        v9 = self;
        v16 = v9;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __29__CKRaiseGesture_setEnabled___block_invoke;
        v11[3] = &unk_1E2756F80;
        v11[4] = v9;
        v11[5] = &buf;
        objc_msgSend(v8, "setGestureHandler:", v11);
        -[CKRaiseGesture setGestureManager:](v9, "setGestureManager:", v8);
        _Block_object_dispose(&buf, 8);

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Tearing down proximity monitoring and gesture manager", (uint8_t *)&buf, 2u);
        }

      }
      -[CKRaiseGesture setProximityMonitoringEnabled:](self, "setProximityMonitoringEnabled:", 0);
      -[CKRaiseGesture setGestureManager:](self, "setGestureManager:", 0);
    }
  }
}

void __29__CKRaiseGesture_setEnabled___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Gesture handler triggered, gestureType is %u", (uint8_t *)v8, 8u);
    }

  }
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5 && objc_msgSend(v5, "isEnabled"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Proximity monitoring is enabled, updating gesture state", (uint8_t *)v8, 2u);
      }

    }
    if (a2 == 1)
    {
      v7 = 2;
    }
    else
    {
      if (a2)
        return;
      objc_msgSend(*(id *)(a1 + 32), "setProximityMonitoringEnabled:", 1);
      v7 = 1;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setGestureState:", v7);
  }
}

- (BOOL)isRecognized
{
  return -[CKRaiseGesture gestureState](self, "gestureState") == 1
      && -[CKRaiseGesture proximityState](self, "proximityState");
}

- (void)setGestureState:(int64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  const char *v11;
  void *v12;
  int v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_gestureState != a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v13 = 134217984;
        v14 = a3;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Gesture state changed to %ld", (uint8_t *)&v13, 0xCu);
      }

    }
    v6 = -[CKRaiseGesture isRecognized](self, "isRecognized");
    self->_gestureState = a3;
    if (v6 != -[CKRaiseGesture isRecognized](self, "isRecognized"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = -[CKRaiseGesture isRecognized](self, "isRecognized");
          v9 = CFSTR("NO");
          if (v8)
            v9 = CFSTR("YES");
          v13 = 138412290;
          v14 = (int64_t)v9;
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Gesture state changed, recognized changed to %@", (uint8_t *)&v13, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CKRaiseGesture action](self, "action");
      -[CKRaiseGesture target](self, "target");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendAction:to:from:forEvent:", v11, v12, self, 0);

    }
  }
}

- (void)setProximityState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  const char *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_proximityState != a3)
  {
    v3 = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("NO");
        if (v3)
          v6 = CFSTR("YES");
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Proximity state changed to %@", (uint8_t *)&v14, 0xCu);
      }

    }
    v7 = -[CKRaiseGesture isRecognized](self, "isRecognized");
    self->_proximityState = v3;
    if (v7 != -[CKRaiseGesture isRecognized](self, "isRecognized"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = -[CKRaiseGesture isRecognized](self, "isRecognized");
          v10 = CFSTR("NO");
          if (v9)
            v10 = CFSTR("YES");
          v14 = 138412290;
          v15 = v10;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Proximity state changed, recognized changed to %@", (uint8_t *)&v14, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CKRaiseGesture action](self, "action");
      -[CKRaiseGesture target](self, "target");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendAction:to:from:forEvent:", v12, v13, self, 0);

    }
  }
}

- (void)proximityStateDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "proximityState");

  -[CKRaiseGesture setProximityState:](self, "setProximityState:", v6);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if ((_DWORD)v6)
        v8 = CFSTR("YES");
      v9 = 136315394;
      v10 = "-[CKRaiseGesture proximityStateDidChange:]";
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "%s Proximity state did change to %@", (uint8_t *)&v9, 0x16u);
    }

  }
  if ((v6 & 1) == 0)
  {
    -[CKRaiseGesture setGestureState:](self, "setGestureState:", 0);
    -[CKRaiseGesture setProximityMonitoringEnabled:](self, "setProximityMonitoringEnabled:", 0);
  }

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)gestureState
{
  return self->_gestureState;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (CMGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_gestureManager, a3);
}

- (BOOL)proximityState
{
  return self->_proximityState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_destroyWeak(&self->_target);
}

@end
