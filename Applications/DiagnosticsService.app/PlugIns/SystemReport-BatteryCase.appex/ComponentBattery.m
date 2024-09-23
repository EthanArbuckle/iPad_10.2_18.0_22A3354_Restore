@implementation ComponentBattery

- (ComponentBattery)init
{
  ComponentBattery *v2;
  uint64_t v3;
  DSIOPSDevice *psDevice;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComponentBattery;
  v2 = -[ComponentBattery init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DSIOPSDevice deviceMatchingAccessories:](DSIOPSDevice, "deviceMatchingAccessories:", &off_10000D168));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBattery psDevice](self, "psDevice"));
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBattery psDevice](self, "psDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "information"));
  objc_msgSend(v9, "addEntriesFromDictionary:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSIOHIDDevice deviceMatchingAccessories:](DSIOHIDDevice, "deviceMatchingAccessories:", &off_10000D180));
  -[ComponentBattery setHidDevice:](self, "setHidDevice:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBattery hidDevice](self, "hidDevice"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBattery batterySerialNumber](self, "batterySerialNumber"));
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
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t v13[16];
  _QWORD block[4];
  NSObject *v15;
  uint64_t *v16;
  id v17;
  id location;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10000411C;
  v23 = sub_10000412C;
  v24 = 0;
  v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004134;
  block[3] = &unk_10000C3C8;
  v16 = &v19;
  objc_copyWeak(&v17, &location);
  v6 = v3;
  v15 = v6;
  dispatch_async(v5, block);

  v7 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    v9 = DiagnosticLogHandleForCategory(6, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Timeout waiting for internal battery serial number", v13, 2u);
    }

  }
  v11 = (id)v20[5];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v19, 8);
  return v11;
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
