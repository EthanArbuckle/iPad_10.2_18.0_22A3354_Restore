@implementation CSCameraSystemQuickAction

- (CSCameraSystemQuickAction)initWithQuickActionControlIdentity:(id)a3 instance:(id)a4 delegate:(id)a5 prewarmer:(id)a6 prototypeSettings:(id)a7 defaults:(id)a8
{
  id v15;
  id v16;
  id v17;
  CSCameraSystemQuickAction *v18;
  CSCameraSystemQuickAction *v19;
  id v21;
  objc_super v22;

  v15 = a5;
  v21 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)CSCameraSystemQuickAction;
  v18 = -[CSSystemQuickAction initWithQuickActionControlIdentity:instance:delegate:](&v22, sel_initWithQuickActionControlIdentity_instance_delegate_, a3, a4, v15);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_prewarmer, a6);
    objc_storeStrong((id *)&v19->_prototypeSettings, a7);
    objc_storeStrong((id *)&v19->_lockScreenDefaults, a8);
    objc_storeStrong((id *)&v19->_cameraDelegate, a5);
  }

  return v19;
}

- (BOOL)allowsInteraction
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSCameraSystemQuickAction;
  v3 = -[CSSystemQuickAction allowsInteraction](&v5, sel_allowsInteraction);
  if (v3)
    LOBYTE(v3) = -[CSCameraSystemQuickAction _allowsCamera](self, "_allowsCamera");
  return v3;
}

- (BOOL)_allowsCamera
{
  CSCameraSystemQuickActionDelegate *cameraDelegate;

  cameraDelegate = self->_cameraDelegate;
  if (cameraDelegate)
    return -[CSCameraSystemQuickActionDelegate isCameraRestricted](cameraDelegate, "isCameraRestricted") ^ 1;
  else
    return 1;
}

- (void)touchBegan
{
  CSCameraPrewarming *prewarmer;
  void *v4;
  void *v5;
  NSTimer *activePrewarmTimer;
  NSTimer *v7;
  void *v8;
  double v9;
  double v10;
  int IsZero;
  double v12;
  NSTimer *v13;
  NSTimer *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CSCameraSystemQuickAction;
  -[CSSystemQuickAction touchBegan](&v15, sel_touchBegan);
  self->_hasFiredForTouch = 0;
  prewarmer = self->_prewarmer;
  -[CSCameraSystemQuickAction _prewarmingIdentifier](self, "_prewarmingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCameraSystemQuickAction _prewarmReason](self, "_prewarmReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCameraPrewarming prewarmCameraForIdentifier:prewarmReason:](prewarmer, "prewarmCameraForIdentifier:prewarmReason:", v4, v5);

  activePrewarmTimer = self->_activePrewarmTimer;
  if (activePrewarmTimer)
  {
    -[NSTimer invalidate](activePrewarmTimer, "invalidate");
    v7 = self->_activePrewarmTimer;
    self->_activePrewarmTimer = 0;

  }
  -[CSLockScreenSettings dashBoardQuickActionButtonSettings](self->_prototypeSettings, "dashBoardQuickActionButtonSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maximumTouchDuration");
  v10 = v9;

  IsZero = BSFloatIsZero();
  v12 = v10 + 0.5;
  if (!IsZero)
    v12 = 2.5;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__stopTrackingPrewarm, 0, 0, v12);
  v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v14 = self->_activePrewarmTimer;
  self->_activePrewarmTimer = v13;

}

- (void)_stopTrackingPrewarm
{
  NSTimer *activePrewarmTimer;
  CSCameraPrewarming *prewarmer;
  id v5;

  -[NSTimer invalidate](self->_activePrewarmTimer, "invalidate");
  activePrewarmTimer = self->_activePrewarmTimer;
  self->_activePrewarmTimer = 0;

  prewarmer = self->_prewarmer;
  -[CSCameraSystemQuickAction _prewarmingIdentifier](self, "_prewarmingIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCameraPrewarming notePrewarmRequestEndedForIdentifier:](prewarmer, "notePrewarmRequestEndedForIdentifier:", v5);

}

- (void)fireAction
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  CSCameraSystemQuickAction *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "[Quick Action] Will fire action %@", buf, 0xCu);
  }

  -[CSSystemQuickAction controlInstance](self, "controlInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CSCameraSystemQuickAction_fireAction__block_invoke;
  v5[3] = &unk_1E8E2FC20;
  v5[4] = self;
  objc_msgSend(v4, "performControlActionWithCompletion:", v5);

}

uint64_t __39__CSCameraSystemQuickAction_fireAction__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[6];
  objc_msgSend(v2, "_prewarmingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notePrewarmRequestWasUsefulForIdentifier:", v4);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "systemQuickActionActionFired:");
}

- (void)touchEnded
{
  NSTimer *activePrewarmTimer;
  CSCameraPrewarming *prewarmer;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSCameraSystemQuickAction;
  -[CSSystemQuickAction touchEnded](&v6, sel_touchEnded);
  -[NSTimer invalidate](self->_activePrewarmTimer, "invalidate");
  activePrewarmTimer = self->_activePrewarmTimer;
  self->_activePrewarmTimer = 0;

  if (!self->_hasFiredForTouch)
  {
    prewarmer = self->_prewarmer;
    -[CSCameraSystemQuickAction _prewarmingIdentifier](self, "_prewarmingIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCameraPrewarming notePrewarmRequestEndedForIdentifier:](prewarmer, "notePrewarmRequestEndedForIdentifier:", v5);

  }
}

- (int64_t)_prewarmingType
{
  if (-[CSLockScreenSettings prelaunchesCameraAppOnTap](self->_prototypeSettings, "prelaunchesCameraAppOnTap"))
    return 0;
  else
    return 2;
}

- (id)_prewarmingIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  CSCameraPrewarmingIdentifier *v6;

  -[CSSystemQuickAction controlIdentity](self, "controlIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CSCameraPrewarmingIdentifier initWithCameraPrewarmType:applicationBundleIdentifier:]([CSCameraPrewarmingIdentifier alloc], "initWithCameraPrewarmType:applicationBundleIdentifier:", -[CSCameraSystemQuickAction _prewarmingType](self, "_prewarmingType"), v5);
  return v6;
}

- (id)_prewarmReason
{
  return (id)*MEMORY[0x1E0C8A088];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePrewarmTimer, 0);
  objc_storeStrong((id *)&self->_cameraDelegate, 0);
  objc_storeStrong((id *)&self->_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_prewarmer, 0);
}

@end
