@implementation ComponentAccessorySmartBatteryCase

- (ComponentAccessorySmartBatteryCase)init
{
  ComponentAccessorySmartBatteryCase *v2;
  uint64_t v3;
  DSIOHIDDevice *device;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComponentAccessorySmartBatteryCase;
  v2 = -[ComponentAccessorySmartBatteryCase init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DSIOHIDDevice deviceMatchingAccessories:](DSIOHIDDevice, "deviceMatchingAccessories:", &off_1000B25D8));
    device = v2->_device;
    v2->_device = (DSIOHIDDevice *)v3;

    v2->_isMagSafe = -[DSIOHIDDevice deviceModel](v2->_device, "deviceModel") == (id)2;
  }
  return v2;
}

- (BOOL)isPresent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessorySmartBatteryCase device](self, "device"));
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
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessorySmartBatteryCase device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
  if (v5)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("serialNumber"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessorySmartBatteryCase batterySerialNumber](self, "batterySerialNumber"));
  if (v7)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("batterySerialNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessorySmartBatteryCase device](self, "device"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serialNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DSEADevice deviceWithSerialNumber:](DSEADevice, "deviceWithSerialNumber:", v9));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "information"));
    objc_msgSend(v12, "addEntriesFromDictionary:", v11);

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
  v21 = sub_100026F58;
  v22 = sub_100026F68;
  v23 = 0;
  v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026F70;
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

- (DSIOHIDDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
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
  objc_storeStrong((id *)&self->_device, 0);
}

@end
