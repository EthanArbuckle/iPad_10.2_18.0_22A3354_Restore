@implementation _GCLogitechRacingWheelDeviceManager

- (_GCLogitechRacingWheelDeviceManager)init
{
  id v2;
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  IONotificationPort *v7;
  NSObject *v8;
  __CFDictionary *v9;
  NSObject *v10;
  __CFDictionary *v11;
  NSObject *v12;
  __CFDictionary *v13;
  NSObject *v14;
  __CFDictionary *v15;
  NSObject *v16;
  __CFDictionary *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD block[4];
  id v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_GCLogitechRacingWheelDeviceManager;
  v2 = -[_GCLogitechRacingWheelDeviceManager init](&v30, sel_init);
  gc_log_create_device("LogitechRacingWheel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v3;

  v5 = dispatch_queue_create("LogitechRacingWheel.Manager", 0);
  v6 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v5;

  v7 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  *((_QWORD *)v2 + 3) = v7;
  if (v7)
  {
    IONotificationPortSetDispatchQueue(v7, *((dispatch_queue_t *)v2 + 2));
  }
  else
  {
    v8 = *((_QWORD *)v2 + 1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[_GCLogitechRacingWheelDeviceManager init].cold.6(v8);
  }
  if (*((_QWORD *)v2 + 3))
  {
    v9 = IOServiceMatching("IOUSBDevice");
    CFDictionarySetValue(v9, CFSTR("idVendor"), &unk_1EA4F1748);
    CFDictionarySetValue(v9, CFSTR("idProduct"), &unk_1EA4F1760);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v9, (IOServiceMatchingCallback)__USBDevicesMatched, v2, (io_iterator_t *)v2 + 8))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT))
        -[_GCLogitechRacingWheelDeviceManager init].cold.5();
    }
    else
    {
      v10 = *((_QWORD *)v2 + 2);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke;
      block[3] = &unk_1EA4D2DB8;
      v29 = v2;
      dispatch_async(v10, block);

    }
    v11 = IOServiceMatching("IOHIDDevice");
    CFDictionarySetValue(v11, CFSTR("VendorID"), &unk_1EA4F1748);
    CFDictionarySetValue(v11, CFSTR("ProductID"), &unk_1EA4F1778);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v11, (IOServiceMatchingCallback)__HIDDevicesMatched_0, v2, (io_iterator_t *)v2 + 9))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT))
        -[_GCLogitechRacingWheelDeviceManager init].cold.4();
    }
    else
    {
      v12 = *((_QWORD *)v2 + 2);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke_16;
      v26[3] = &unk_1EA4D2DB8;
      v27 = v2;
      dispatch_async(v12, v26);

    }
    v13 = IOServiceMatching("IOUSBDevice");
    CFDictionarySetValue(v13, CFSTR("idVendor"), &unk_1EA4F1748);
    CFDictionarySetValue(v13, CFSTR("idProduct"), &unk_1EA4F1790);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v13, (IOServiceMatchingCallback)__USBDevicesMatched, v2, (io_iterator_t *)v2 + 10))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT))
        -[_GCLogitechRacingWheelDeviceManager init].cold.3();
    }
    else
    {
      v14 = *((_QWORD *)v2 + 2);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke_18;
      v24[3] = &unk_1EA4D2DB8;
      v25 = v2;
      dispatch_async(v14, v24);

    }
    v15 = IOServiceMatching("IOHIDDevice");
    CFDictionarySetValue(v15, CFSTR("VendorID"), &unk_1EA4F1748);
    CFDictionarySetValue(v15, CFSTR("ProductID"), &unk_1EA4F17A8);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)__HIDDevicesMatched_0, v2, (io_iterator_t *)v2 + 11))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT))
        -[_GCLogitechRacingWheelDeviceManager init].cold.2();
    }
    else
    {
      v16 = *((_QWORD *)v2 + 2);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke_20;
      v22[3] = &unk_1EA4D2DB8;
      v23 = v2;
      dispatch_async(v16, v22);

    }
    v17 = IOServiceMatching("IOHIDDevice");
    CFDictionarySetValue(v17, CFSTR("VendorID"), &unk_1EA4F1748);
    CFDictionarySetValue(v17, CFSTR("ProductID"), &unk_1EA4F17C0);
    if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)v2 + 3), "IOServiceFirstMatch", v17, (IOServiceMatchingCallback)__HIDDevicesMatched_0, v2, (io_iterator_t *)v2 + 12))
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_FAULT))
        -[_GCLogitechRacingWheelDeviceManager init].cold.1();
    }
    else
    {
      v18 = *((_QWORD *)v2 + 2);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __43___GCLogitechRacingWheelDeviceManager_init__block_invoke_22;
      v20[3] = &unk_1EA4D2DB8;
      v21 = v2;
      dispatch_async(v18, v20);

    }
  }
  return (_GCLogitechRacingWheelDeviceManager *)v2;
}

- (void)dealloc
{
  io_object_t ioG923USBDeviceIterator;
  io_object_t ioG923HIDDeviceIterator;
  io_object_t ioG920USBDeviceIterator;
  io_object_t ioG29PS4HIDDeviceIterator;
  io_object_t ioG29PS3HIDDeviceIterator;
  IONotificationPort *ioNotificationPort;
  objc_super v9;

  ioG923USBDeviceIterator = self->_ioG923USBDeviceIterator;
  if (ioG923USBDeviceIterator)
  {
    IOObjectRelease(ioG923USBDeviceIterator);
    self->_ioG923USBDeviceIterator = 0;
  }
  ioG923HIDDeviceIterator = self->_ioG923HIDDeviceIterator;
  if (ioG923HIDDeviceIterator)
  {
    IOObjectRelease(ioG923HIDDeviceIterator);
    self->_ioG923HIDDeviceIterator = 0;
  }
  ioG920USBDeviceIterator = self->_ioG920USBDeviceIterator;
  if (ioG920USBDeviceIterator)
  {
    IOObjectRelease(ioG920USBDeviceIterator);
    self->_ioG920USBDeviceIterator = 0;
  }
  ioG29PS4HIDDeviceIterator = self->_ioG29PS4HIDDeviceIterator;
  if (ioG29PS4HIDDeviceIterator)
  {
    IOObjectRelease(ioG29PS4HIDDeviceIterator);
    self->_ioG29PS4HIDDeviceIterator = 0;
  }
  ioG29PS3HIDDeviceIterator = self->_ioG29PS3HIDDeviceIterator;
  if (ioG29PS3HIDDeviceIterator)
  {
    IOObjectRelease(ioG29PS3HIDDeviceIterator);
    self->_ioG29PS3HIDDeviceIterator = 0;
  }
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)_GCLogitechRacingWheelDeviceManager;
  -[_GCLogitechRacingWheelDeviceManager dealloc](&v9, sel_dealloc);
}

- (NSObject)identifier
{
  return CFSTR("LogitechRacingWheelDeviceManager");
}

- (_GCDeviceRegistry)deviceRegistry
{
  return (_GCDeviceRegistry *)objc_loadWeakRetained((id *)&self->_deviceRegistry);
}

- (void)setDeviceRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_deviceRegistry, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceRegistry);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DC79E000, log, OS_LOG_TYPE_FAULT, "Failed to create IONotificationPort.  Racing wheel runctionality.", v1, 2u);
  OUTLINED_FUNCTION_1_3();
}

@end
