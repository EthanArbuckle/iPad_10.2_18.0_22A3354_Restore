@implementation PKPencilTouchDetectionService

+ (void)beginObservingTouchesForDetection
{
  id v2;

  objc_msgSend(a1, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeConnectionIfIdle");

}

+ (id)sharedInstance
{
  if (qword_1ECEE62A8 != -1)
    dispatch_once(&qword_1ECEE62A8, &__block_literal_global_53);
  return (id)_MergedGlobals_137;
}

void __47__PKPencilTouchDetectionService_sharedInstance__block_invoke()
{
  PKPencilTouchDetectionService *v0;
  void *v1;

  if (PK_UIApplicationIsSystemShell_onceToken != -1)
    dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_70);
  if (PK_UIApplicationIsSystemShell___result)
  {
    v0 = objc_alloc_init(PKPencilTouchDetectionService);
    v1 = (void *)_MergedGlobals_137;
    _MergedGlobals_137 = (uint64_t)v0;

  }
}

- (PKPencilTouchDetectionService)init
{
  PKPencilTouchDetectionService *v2;
  NSObject *v3;
  uint64_t v4;
  NSXPCListener *listener;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  PKPencilTouchDetectionService *v10;
  void *v11;
  id v12;
  uint64_t v13;
  FBSDisplayLayoutMonitor *displayLayoutMonitor;
  PKPencilTouchDetectionGestureRecognizer *v15;
  PKPencilTouchDetectionGestureRecognizer *detectionGesture;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  PKPencilTouchDetectionService *v23;
  objc_super v24;
  uint8_t buf[8];
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v24.receiver = self;
  v24.super_class = (Class)PKPencilTouchDetectionService;
  v2 = -[PKPencilTouchDetectionService init](&v24, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Starting Touch Detection Service", buf, 2u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.pencilkit.pktouchdetection"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    v2->_isListening = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v6 = (void *)qword_1ECEE62B0;
    v33 = qword_1ECEE62B0;
    v7 = MEMORY[0x1E0C809B0];
    if (!qword_1ECEE62B0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke;
      v28 = &unk_1E7777068;
      v29 = &v30;
      __getFBSDisplayLayoutMonitorConfigurationClass_block_invoke((uint64_t)buf);
      v6 = (void *)v31[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v30, 8);
    objc_msgSend(v8, "configurationForDefaultMainDisplayMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __37__PKPencilTouchDetectionService_init__block_invoke;
    v22[3] = &unk_1E777B330;
    v10 = v2;
    v23 = v10;
    objc_msgSend(v9, "setTransitionHandler:", v22);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v11 = (void *)qword_1ECEE62B8;
    v33 = qword_1ECEE62B8;
    if (!qword_1ECEE62B8)
    {
      *(_QWORD *)buf = v7;
      v26 = 3221225472;
      v27 = __getFBSDisplayLayoutMonitorClass_block_invoke;
      v28 = &unk_1E7777068;
      v29 = &v30;
      __getFBSDisplayLayoutMonitorClass_block_invoke((uint64_t)buf);
      v11 = (void *)v31[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v30, 8);
    objc_msgSend(v12, "monitorWithConfiguration:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    displayLayoutMonitor = v10->_displayLayoutMonitor;
    v10->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v13;

    v15 = -[PKPencilTouchDetectionGestureRecognizer initWithTarget:action:]([PKPencilTouchDetectionGestureRecognizer alloc], "initWithTarget:action:", v10, sel__nop_);
    detectionGesture = v10->_detectionGesture;
    v10->_detectionGesture = v15;

    -[PKPencilTouchDetectionGestureRecognizer setDelegate:](v10->_detectionGesture, "setDelegate:", v10);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v17 = (void *)qword_1ECEE62C0;
    v33 = qword_1ECEE62C0;
    if (!qword_1ECEE62C0)
    {
      *(_QWORD *)buf = v7;
      v26 = 3221225472;
      v27 = __getFBDisplayManagerClass_block_invoke;
      v28 = &unk_1E7777068;
      v29 = &v30;
      __getFBDisplayManagerClass_block_invoke((uint64_t)buf);
      v17 = (void *)v31[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v30, 8);
    objc_msgSend(v18, "mainIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC4428], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addGestureRecognizer:recognitionEvent:toDisplayWithIdentity:", v10->_detectionGesture, 2, v19);

  }
  return v2;
}

uint64_t __37__PKPencilTouchDetectionService_init__block_invoke(uint64_t a1)
{
  char v2;
  id *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "wereFrontBoardOverlaysEnabled");
  v3 = (id *)MEMORY[0x1E0DC4730];
  if ((v2 & 1) == 0 && objc_msgSend((id)*MEMORY[0x1E0DC4730], "_areFrontBoardInputOverlaysEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "persistTimestamps");
    objc_msgSend(*(id *)(a1 + 32), "postUpdateNotificationIfNecessary");
  }
  return objc_msgSend(*(id *)(a1 + 32), "setWereFrontBoardOverlaysEnabled:", objc_msgSend(*v3, "_areFrontBoardInputOverlaysEnabled"));
}

- (void)dealloc
{
  objc_super v3;

  -[PKPencilTouchDetectionService persistTimestamps](self, "persistTimestamps");
  -[FBSDisplayLayoutMonitor invalidate](self->_displayLayoutMonitor, "invalidate");
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPencilTouchDetectionService;
  -[PKPencilTouchDetectionService dealloc](&v3, sel_dealloc);
}

- (void)reset:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPencilTouchDetectionService setTimestamps:](self, "setTimestamps:", v4);

  -[PKPencilTouchDetectionService setUserInfoForNotification:](self, "setUserInfoForNotification:", 0);
}

- (void)resumeConnectionIfIdle
{
  void *v3;

  if (!-[PKPencilTouchDetectionService isListening](self, "isListening"))
  {
    -[PKPencilTouchDetectionService listener](self, "listener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resume");

    -[PKPencilTouchDetectionService setIsListening:](self, "setIsListening:", 1);
  }
}

- (void)loadDefaultsIfNecessary
{
  void *v3;
  id v4;

  -[PKPencilTouchDetectionService pencilDefaults](self, "pencilDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
    -[PKPencilTouchDetectionService setPencilDefaults:](self, "setPencilDefaults:", v4);

  }
}

- (void)loadTimestampsIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PKPencilTouchDetectionService timestamps](self, "timestamps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PKPencilTouchDetectionService loadDefaultsIfNecessary](self, "loadDefaultsIfNecessary");
    -[PKPencilTouchDetectionService pencilDefaults](self, "pencilDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("TouchTimestamps"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v7, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
    -[PKPencilTouchDetectionService setTimestamps:](self, "setTimestamps:", v5);

  }
}

- (void)persistTimestamps
{
  void *v3;
  void *v4;
  id v5;

  -[PKPencilTouchDetectionService timestamps](self, "timestamps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPencilTouchDetectionService loadDefaultsIfNecessary](self, "loadDefaultsIfNecessary");
    -[PKPencilTouchDetectionService pencilDefaults](self, "pencilDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPencilTouchDetectionService timestamps](self, "timestamps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("TouchTimestamps"));

  }
}

- (BOOL)timestampIndicatesRecentUsage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 8, 1, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "compare:", v7) == -1;
  return v8;
}

- (void)postUpdateNotificationIfNecessary
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFDictionary *v5;

  -[PKPencilTouchDetectionService userInfoForNotification](self, "userInfoForNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    -[PKPencilTouchDetectionService userInfoForNotification](self, "userInfoForNotification");
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.pencilkit.pktouchdetectionupdate"), 0, v5, 1u);

    -[PKPencilTouchDetectionService setUserInfoForNotification:](self, "setUserInfoForNotification:", 0);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSXPCListener *listener;
  void *v8;

  v6 = a4;
  listener = self->_listener;
  if (listener == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF5ABB00);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v8);

  }
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return listener == a3;
}

- (void)pencilType:(int64_t)a3 hasRecentlyBeenUsedWithCompletionHandler:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void (**v10)(id, BOOL);

  v10 = (void (**)(id, BOOL))a4;
  if (v10)
  {
    -[PKPencilTouchDetectionService loadTimestampsIfNecessary](self, "loadTimestampsIfNecessary");
    v6 = CFSTR("Unknown");
    if (a3 == 1)
      v6 = CFSTR("Crayon");
    if (!a3)
      v6 = CFSTR("Pencil");
    v7 = v6;
    -[PKPencilTouchDetectionService timestamps](self, "timestamps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, -[PKPencilTouchDetectionService timestampIndicatesRecentUsage:](self, "timestampIndicatesRecentUsage:", v9));
  }

}

- (void)_updateActivePencilUsageForTouchType:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemUptime");
  v7 = v6;

  -[PKPencilTouchDetectionService activePencilUsageTimestamp](self, "activePencilUsageTimestamp");
  if (v7 - v8 > 60.0)
  {
    -[PKPencilTouchDetectionService setActivePencilUsageTimestamp:](self, "setActivePencilUsageTimestamp:", v7);
    v12[0] = CFSTR("com.apple.pencilkit.pkactivepencilusage.type");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = CFSTR("com.apple.pencilkit.pkactivepencilusage.interval");
    v13[0] = v9;
    v13[1] = &unk_1E77ECF18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("com.apple.pencilkit.pkactivepencilusage"), self, v10);

  }
}

- (void)updateTimestampForType:(int64_t)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;

  -[PKPencilTouchDetectionService loadTimestampsIfNecessary](self, "loadTimestampsIfNecessary");
  v5 = CFSTR("Unknown");
  if (a3 == 1)
    v5 = CFSTR("Crayon");
  if (!a3)
    v5 = CFSTR("Pencil");
  v14 = v5;
  -[PKPencilTouchDetectionService timestamps](self, "timestamps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = !-[PKPencilTouchDetectionService timestampIndicatesRecentUsage:](self, "timestampIndicatesRecentUsage:", v7);
  else
    v8 = 0;
  -[PKPencilTouchDetectionService timestamps](self, "timestamps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, v14);

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (!v8)
      {
LABEL_12:
        if (objc_msgSend(v11, "count"))
          -[PKPencilTouchDetectionService setUserInfoForNotification:](self, "setUserInfoForNotification:", v11);

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("com.apple.pencilkit.pktouchdetectionupdate.firstUse"));

      if (!v8)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("com.apple.pencilkit.pktouchdetectionupdate.reactivation"));

    goto LABEL_12;
  }
LABEL_15:
  -[PKPencilTouchDetectionService _updateActivePencilUsageForTouchType:](self, "_updateActivePencilUsageForTouchType:", a3);

}

- (id)stringForTouchDetectionPencilType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Crayon");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("Pencil");
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, a3);
}

- (BOOL)wereFrontBoardOverlaysEnabled
{
  return self->_wereFrontBoardOverlaysEnabled;
}

- (void)setWereFrontBoardOverlaysEnabled:(BOOL)a3
{
  self->_wereFrontBoardOverlaysEnabled = a3;
}

- (PKPencilTouchDetectionGestureRecognizer)detectionGesture
{
  return self->_detectionGesture;
}

- (void)setDetectionGesture:(id)a3
{
  objc_storeStrong((id *)&self->_detectionGesture, a3);
}

- (NSUserDefaults)pencilDefaults
{
  return self->_pencilDefaults;
}

- (void)setPencilDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_pencilDefaults, a3);
}

- (NSMutableDictionary)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_timestamps, a3);
}

- (NSDictionary)userInfoForNotification
{
  return self->_userInfoForNotification;
}

- (void)setUserInfoForNotification:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoForNotification, a3);
}

- (double)activePencilUsageTimestamp
{
  return self->_activePencilUsageTimestamp;
}

- (void)setActivePencilUsageTimestamp:(double)a3
{
  self->_activePencilUsageTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoForNotification, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_pencilDefaults, 0);
  objc_storeStrong((id *)&self->_detectionGesture, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
