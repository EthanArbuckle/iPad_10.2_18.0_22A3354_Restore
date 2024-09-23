@implementation OSDBluetooth

- (OSDBluetooth)init
{
  OSDBluetooth *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *btQueue;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *statusSema;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSDBluetooth;
  v2 = -[OSDBluetooth init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.Diagnostics.DABluetooth"), "UTF8String"), 0);
    btQueue = v2->_btQueue;
    v2->_btQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_semaphore_create(0);
    statusSema = v2->_statusSema;
    v2->_statusSema = (OS_dispatch_semaphore *)v5;

    v2->_attachDetachCallback.sessionEvent = sub_1000036DC;
    v2->_discoveryCallbacks.statusEvent = sub_1000038D0;
    v2->_discoveryCallbacks.discoveryEvent = sub_100003A3C;
    v2->_localDeviceCallbacks.statusEvent = sub_100003CCC;
    v2->_localDeviceCallbacks.leTestStopped = 0;
    v2->_localDeviceCallbacks.afhMapChanged = 0;
    objc_storeStrong((id *)&qword_10000C820, v2);
  }
  return v2;
}

- (int)_bluetoothPower:(BTLocalDeviceImpl *)a3 isEnabled:(BOOL *)a4
{
  int v7;
  NSObject *btQueue;
  int v9;
  _QWORD block[6];
  id v13[3];
  id location;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = -5;
  do
  {
    objc_initWeak(&location, self);
    btQueue = self->_btQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004190;
    block[3] = &unk_100008298;
    objc_copyWeak(v13, &location);
    block[4] = &v15;
    block[5] = &v19;
    v13[1] = a3;
    v13[2] = a4;
    dispatch_sync(btQueue, block);
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
    v9 = *((_DWORD *)v16 + 6);
    if (v9)
      break;
  }
  while (*((_DWORD *)v20 + 6) == -889275714 && v7++ != 0);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

- (BOOL)_setBluetoothPower:(BTLocalDeviceImpl *)a3 enabled:(BOOL)a4 timeout:(double)a5
{
  _BOOL8 v5;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *btQueue;
  NSObject *statusSema;
  dispatch_time_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  _QWORD block[6];
  BOOL v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint8_t buf[4];
  const __CFString *v38;

  v5 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v32 = 0;
  if (!-[OSDBluetooth _bluetoothPower:isEnabled:](self, "_bluetoothPower:isEnabled:", a3, &v32))
  {
    v12 = v32 != 0;
    if (!v5)
      v12 = v32 == 0;
    if (v12)
    {
      v13 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "BT module was already in the correct power state; doing nothing.";
        v15 = v10;
        v16 = 2;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      btQueue = self->_btQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004664;
      block[3] = &unk_1000082C0;
      block[4] = &v33;
      block[5] = a3;
      v31 = v5;
      dispatch_sync(btQueue, block);
      statusSema = self->_statusSema;
      v19 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      dispatch_semaphore_wait(statusSema, v19);
      if (*((_DWORD *)v34 + 6))
      {
        v20 = DiagnosticLogHandleForCategory(3);
        v10 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_100005F10(v5, v10, v21, v22, v23, v24, v25, v26);
        goto LABEL_4;
      }
      v27 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v28 = CFSTR("OFF");
        if (v5)
          v28 = CFSTR("ON");
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        v14 = "Set BT module power: %@";
        v15 = v10;
        v16 = 12;
        goto LABEL_17;
      }
    }
    v11 = 1;
    goto LABEL_19;
  }
  v9 = DiagnosticLogHandleForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100005F8C();
LABEL_4:
  v11 = 0;
LABEL_19:

  _Block_object_dispose(&v33, 8);
  return v11;
}

- (BOOL)_setupBluetoothSessionAndDevice:(id *)a3
{
  BOOL v3;
  NSObject *btQueue;
  NSObject *statusSema;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  BTSessionImpl *session;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[5];
  id v23;
  id location;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (!self->_session)
  {
    objc_initWeak(&location, self);
    btQueue = self->_btQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004A14;
    block[3] = &unk_1000082E8;
    objc_copyWeak(&v23, &location);
    block[4] = &v25;
    dispatch_sync(btQueue, block);
    statusSema = self->_statusSema;
    v8 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(statusSema, v8);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.Diagnostics.DABluetooth"), 2101, CFSTR("Error attaching to BTSession."));
      v3 = 0;
LABEL_18:
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      goto LABEL_19;
    }
    v9 = self->_btQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100004AA0;
    v20[3] = &unk_1000082E8;
    objc_copyWeak(&v21, &location);
    v20[4] = &v25;
    dispatch_sync(v9, v20);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.Diagnostics.DABluetooth"), 2102, CFSTR("Error getting default bluetooth device"));
      v3 = 0;
LABEL_17:
      objc_destroyWeak(&v21);
      goto LABEL_18;
    }
    v10 = self->_btQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100004AF4;
    v18[3] = &unk_1000082E8;
    objc_copyWeak(&v19, &location);
    v18[4] = &v25;
    dispatch_sync(v10, v18);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.Diagnostics.DABluetooth"), 2103, CFSTR("Error adding bluetooth device callbacks"));
      v3 = 0;
LABEL_16:
      objc_destroyWeak(&v19);
      goto LABEL_17;
    }
    v11 = self->_btQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004B48;
    v16[3] = &unk_1000082E8;
    objc_copyWeak(&v17, &location);
    v16[4] = &v25;
    dispatch_sync(v11, v16);
    if (*((_DWORD *)v26 + 6))
    {
      v12 = CFSTR("Error creating bluetooth discovery agent");
      v13 = 2104;
    }
    else
    {
      session = self->_session;
      v3 = session != 0;
      if (!session)
        +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.Diagnostics.DABluetooth"), 2105, CFSTR("Error creating a Bluetooth session"));
      if (self->_localDevice)
        goto LABEL_15;
      v12 = CFSTR("Error creating a Bluetooth local device object");
      v13 = 2106;
    }
    +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.Diagnostics.DABluetooth"), v13, v12);
    v3 = 0;
LABEL_15:
    objc_destroyWeak(&v17);
    goto LABEL_16;
  }
  v3 = 1;
LABEL_19:
  _Block_object_dispose(&v25, 8);
  return v3;
}

- (void)_teardownBluetoothSessionAndDevice
{
  NSObject *btQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  btQueue = self->_btQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004C30;
  v4[3] = &unk_100008310;
  objc_copyWeak(&v5, &location);
  dispatch_sync(btQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)performBluetoothScanWithTimeout:(double)a3 foundDevices:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  dispatch_queue_t v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  _UNKNOWN **v22;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100004E1C;
  v21 = sub_100004E2C;
  v22 = &off_100008560;
  v7 = dispatch_semaphore_create(0);
  v8 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.Diagnostics.DABluetooth"), "UTF8String"), 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004E34;
  v13[3] = &unk_100008270;
  v9 = v6;
  v14 = v9;
  v16 = &v17;
  v10 = v7;
  v15 = v10;
  -[OSDBluetooth performScanOnQueue:timeout:gracePeriod:completionBlock:](self, "performScanOnQueue:timeout:gracePeriod:completionBlock:", v8, v13, a3, 2.0);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)performScanOnQueue:(id)a3 timeout:(double)a4 gracePeriod:(double)a5 completionBlock:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15[3];
  id location;

  v10 = a6;
  if (a4 <= 0.0)
    a4 = 8.0;
  if (a5 <= 0.0)
    a5 = 2.0;
  v11 = a3;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005180;
  v13[3] = &unk_100008338;
  v13[4] = self;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&a4;
  v15[2] = *(id *)&a5;
  v14 = v10;
  v12 = v10;
  dispatch_async(v11, v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (BOOL)setBluetoothPowerOn:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[OSDBluetooth _setupBluetoothSessionAndDevice:](self, "_setupBluetoothSessionAndDevice:", 0);
  LOBYTE(v3) = -[OSDBluetooth _setBluetoothPower:enabled:timeout:](self, "_setBluetoothPower:enabled:timeout:", self->_localDevice, v3, 5.0);
  -[OSDBluetooth _teardownBluetoothSessionAndDevice](self, "_teardownBluetoothSessionAndDevice");
  return v3;
}

- (OS_dispatch_semaphore)statusSema
{
  return self->_statusSema;
}

- (void)setStatusSema:(id)a3
{
  objc_storeStrong((id *)&self->_statusSema, a3);
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BTSessionImpl)session
{
  return self->_session;
}

- (void)setSession:(BTSessionImpl *)a3
{
  self->_session = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_statusSema, 0);
  objc_storeStrong((id *)&self->_btQueue, 0);
}

@end
