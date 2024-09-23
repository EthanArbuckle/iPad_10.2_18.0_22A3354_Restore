@implementation CKDeviceOrientationManager

- (CKDeviceOrientationManager)init
{
  CKDeviceOrientationManager *v2;
  void *v3;
  BKSAccelerometer *v4;
  BKSAccelerometer *accelerometer;
  NSMutableSet *v6;
  NSMutableSet *listenerKeys;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDeviceOrientationManager;
  v2 = -[CKDeviceOrientationManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForeground_, *MEMORY[0x1E0CEB350], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__applicationDidEnterBackground_, *MEMORY[0x1E0CEB288], 0);
    v4 = (BKSAccelerometer *)objc_alloc_init(MEMORY[0x1E0D00C40]);
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = v4;

    -[BKSAccelerometer setDelegate:](v2->_accelerometer, "setDelegate:", v2);
    -[BKSAccelerometer setOrientationEventsEnabled:](v2->_accelerometer, "setOrientationEventsEnabled:", 1);
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    listenerKeys = v2->_listenerKeys;
    v2->_listenerKeys = v6;

    -[CKDeviceOrientationManager _updateListeningState](v2, "_updateListeningState");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[BKSAccelerometer setDelegate:](self->_accelerometer, "setDelegate:", 0);
  -[BKSAccelerometer setPassiveOrientationEvents:](self->_accelerometer, "setPassiveOrientationEvents:", 1);
  -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CKDeviceOrientationManager;
  -[CKDeviceOrientationManager dealloc](&v4, sel_dealloc);
}

- (void)beginListeningForOrientationEventsWithKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKDeviceOrientationManager listenerKeys](self, "listenerKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[CKDeviceOrientationManager _updateListeningState](self, "_updateListeningState");
}

- (void)endListeningForOrientationEventsWithKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKDeviceOrientationManager listenerKeys](self, "listenerKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[CKDeviceOrientationManager _updateListeningState](self, "_updateListeningState");
}

- (BOOL)isListeningForOrientationEvents
{
  void *v2;
  BOOL v3;

  -[CKDeviceOrientationManager listenerKeys](self, "listenerKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)currentDeviceOrientation
{
  int64_t result;
  void *v4;
  int64_t v5;

  result = -[CKDeviceOrientationManager _springboardDeviceLockOrientation](self, "_springboardDeviceLockOrientation");
  if (!result)
  {
    -[CKDeviceOrientationManager accelerometer](self, "accelerometer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "currentDeviceOrientation");

    return v5;
  }
  return result;
}

- (void)invalidate
{
  void *v3;

  -[CKDeviceOrientationManager listenerKeys](self, "listenerKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[CKDeviceOrientationManager _updateListeningState](self, "_updateListeningState");
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  if (-[CKDeviceOrientationManager _wantsOrientationEvents](self, "_wantsOrientationEvents", a3))
    -[CKDeviceOrientationManager _broadcastOrientation:](self, "_broadcastOrientation:", a4);
}

- (BOOL)_wantsOrientationEvents
{
  return !objc_msgSend((id)*MEMORY[0x1E0CEB258], "applicationState")
      && -[CKDeviceOrientationManager isListeningForOrientationEvents](self, "isListeningForOrientationEvents");
}

- (void)_updateListeningState
{
  void *v3;
  int v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  -[CKDeviceOrientationManager accelerometer](self, "accelerometer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "passiveOrientationEvents");

  v5 = -[CKDeviceOrientationManager _wantsOrientationEvents](self, "_wantsOrientationEvents");
  -[CKDeviceOrientationManager accelerometer](self, "accelerometer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPassiveOrientationEvents:", !v5);

  if (v4)
  {
    if (v5)
    {
      -[CKDeviceOrientationManager accelerometer](self, "accelerometer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CKDeviceOrientationManager _broadcastOrientation:](self, "_broadcastOrientation:", objc_msgSend(v7, "currentDeviceOrientation"));

    }
  }
}

- (int64_t)_springboardDeviceLockOrientation
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  CFIndex AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    v4 = CFSTR("SBLastRotationLockedOrientationiPad");
  }
  else
  {
    if (v3)
      return 0;
    v4 = CFSTR("SBLastRotationLockedOrientation");
  }
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(v4, CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && (unint64_t)(AppIntegerValue - 1) <= 3)
    return qword_18E7CBE40[AppIntegerValue - 1];
  return 0;
}

- (void)_broadcastOrientation:(int64_t)a3
{
  int64_t v5;
  void *v6;
  int64_t v7;
  id v8;

  v5 = -[CKDeviceOrientationManager _springboardDeviceLockOrientation](self, "_springboardDeviceLockOrientation");
  -[CKDeviceOrientationManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v5)
    v7 = v5;
  else
    v7 = a3;
  objc_msgSend(v6, "deviceOrientationManager:orientationDidChange:", self, v7);

}

- (CKDeviceOrientationManagerDelegate)delegate
{
  return (CKDeviceOrientationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
  objc_storeStrong((id *)&self->_accelerometer, a3);
}

- (NSMutableSet)listenerKeys
{
  return self->_listenerKeys;
}

- (void)setListenerKeys:(id)a3
{
  objc_storeStrong((id *)&self->_listenerKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerKeys, 0);
  objc_storeStrong((id *)&self->_accelerometer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
