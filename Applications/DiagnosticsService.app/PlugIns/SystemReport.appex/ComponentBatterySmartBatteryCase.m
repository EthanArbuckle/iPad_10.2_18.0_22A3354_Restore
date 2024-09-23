@implementation ComponentBatterySmartBatteryCase

- (ComponentBatterySmartBatteryCase)init
{
  ComponentBatterySmartBatteryCase *v2;
  uint64_t v3;
  DSIOPSDevice *psDevice;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComponentBatterySmartBatteryCase;
  v2 = -[ComponentBatterySmartBatteryCase init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DSIOPSDevice deviceMatchingAccessories:](DSIOPSDevice, "deviceMatchingAccessories:", &off_1000B2620));
    psDevice = v2->_psDevice;
    v2->_psDevice = (DSIOPSDevice *)v3;

    v2->_isMagSafe = -[DSIOPSDevice deviceModel](v2->_psDevice, "deviceModel") == (id)2;
  }
  return v2;
}

- (BOOL)isPresent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatterySmartBatteryCase psDevice](self, "psDevice"));
  v3 = v2 != 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatterySmartBatteryCase psDevice](self, "psDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "information"));
  objc_msgSend(v9, "addEntriesFromDictionary:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSIOHIDDevice deviceMatchingAccessories:](DSIOHIDDevice, "deviceMatchingAccessories:", &off_1000B2638));
  -[ComponentBatterySmartBatteryCase setHidDevice:](self, "setHidDevice:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatterySmartBatteryCase hidDevice](self, "hidDevice"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatterySmartBatteryCase batterySerialNumber](self, "batterySerialNumber"));
    if (v8)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("batterySerialNumber"));

  }
}

- (id)batterySerialNumber
{
  dispatch_semaphore_t v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t v12[16];
  _QWORD block[4];
  NSObject *v14;
  uint64_t *v15;
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000285E4;
  v22 = sub_1000285F4;
  v23 = 0;
  v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000285FC;
  block[3] = &unk_100080BD8;
  v15 = &v18;
  objc_copyWeak(&v16, &location);
  v6 = v3;
  v14 = v6;
  dispatch_async(v5, block);

  v7 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    v8 = DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Timeout waiting for internal battery serial number", v12, 2u);
    }

  }
  v10 = (id)v19[5];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (DSIOHIDDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
  objc_storeStrong((id *)&self->_hidDevice, a3);
}

- (DSIOPSDevice)psDevice
{
  return self->_psDevice;
}

- (void)setPsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_psDevice, a3);
}

- (BOOL)isMagSafe
{
  return self->_isMagSafe;
}

- (void)setIsMagSafe:(BOOL)a3
{
  self->_isMagSafe = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psDevice, 0);
  objc_storeStrong((id *)&self->_hidDevice, 0);
}

@end
