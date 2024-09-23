@implementation PHDevice

+ (id)currentDevice
{
  if (qword_1002DCA98 != -1)
    dispatch_once(&qword_1002DCA98, &stru_100286A68);
  return (id)qword_1002DCA90;
}

+ (BOOL)isGeminiCapable
{
  if (qword_1002DCAA8 != -1)
    dispatch_once(&qword_1002DCAA8, &stru_100286A88);
  return byte_1002DCAA0;
}

- (PHDevice)init
{
  PHDevice *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v5;
  _QWORD block[4];
  PHDevice *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHDevice;
  v2 = -[PHDevice init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("PHDevice.serialQueue", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ringerStateNotifyToken = -1;
    v2->_ringerSwitchEnabled = 0;
    -[PHDevice registerForRingerStateNotifications](v2, "registerForRingerStateNotifications");
    v5 = objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](v2, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000858A0;
    block[3] = &unk_100284898;
    v8 = v2;
    dispatch_barrier_async(v5, block);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PHDevice unregisterForRingerStateNotifications](self, "unregisterForRingerStateNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHDevice;
  -[PHDevice dealloc](&v4, "dealloc");
}

- (BOOL)isCellularRadioEnabled
{
  PHDevice *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100085A50;
  v5[3] = &unk_1002857C8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setCellularRadioEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085AE0;
  v6[3] = &unk_100284C98;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

- (BOOL)isRingerSwitchEnabled
{
  PHDevice *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100085C5C;
  v5[3] = &unk_1002857C8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setRingerSwitchEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085CEC;
  v6[3] = &unk_100284C98;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

- (UIImage)audioRouteGlyphImage
{
  return (UIImage *)+[UIImage currentDeviceRouteGlyphForDisplayStyle:](UIImage, "currentDeviceRouteGlyphForDisplayStyle:", 0);
}

- (RadiosPreferences)radiosPreferences
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100085E9C;
  v11 = sub_100085EAC;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085EB4;
  v6[3] = &unk_1002857C8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RadiosPreferences *)v4;
}

- (BOOL)fetchCellularRadioEnabled
{
  return -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode") ^ 1;
}

- (BOOL)fetchRingerSwitchEnabled
{
  return -[PHDevice stateForNotifyToken:](self, "stateForNotifyToken:", -[PHDevice ringerStateNotifyToken](self, "ringerStateNotifyToken")) != 0;
}

- (void)registerForRingerStateNotifications
{
  const char *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (-[PHDevice ringerStateNotifyToken](self, "ringerStateNotifyToken") == -1)
  {
    objc_initWeak(&location, self);
    v3 = (const char *)objc_msgSend(CFSTR("com.apple.springboard.ringerstate"), "UTF8String");
    v4 = objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10008600C;
    v5[3] = &unk_1002851E0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &self->_ringerStateNotifyToken, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)unregisterForRingerStateNotifications
{
  if (-[PHDevice ringerStateNotifyToken](self, "ringerStateNotifyToken") != -1)
  {
    notify_cancel(-[PHDevice ringerStateNotifyToken](self, "ringerStateNotifyToken"));
    -[PHDevice setRingerStateNotifyToken:](self, "setRingerStateNotifyToken:", 0xFFFFFFFFLL);
  }
}

- (unint64_t)stateForNotifyToken:(int)a3
{
  uint64_t state64;

  state64 = 0;
  if (a3 == -1)
    return 0;
  notify_get_state(a3, &state64);
  return state64;
}

- (void)airplaneModeChanged
{
  -[PHDevice setCellularRadioEnabled:](self, "setCellularRadioEnabled:", -[PHDevice fetchCellularRadioEnabled](self, "fetchCellularRadioEnabled"));
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)setRadiosPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_radiosPreferences, a3);
}

- (int)ringerStateNotifyToken
{
  return self->_ringerStateNotifyToken;
}

- (void)setRingerStateNotifyToken:(int)a3
{
  self->_ringerStateNotifyToken = a3;
}

- (BOOL)proximitySensorState
{
  return self->_proximitySensorState;
}

- (void)setProximitySensorState:(BOOL)a3
{
  self->_proximitySensorState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
