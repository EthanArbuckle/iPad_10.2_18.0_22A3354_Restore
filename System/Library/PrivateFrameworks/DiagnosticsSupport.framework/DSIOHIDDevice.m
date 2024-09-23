@implementation DSIOHIDDevice

+ (id)deviceWithAccessory:(unint64_t)a3
{
  return +[DSIOHIDDevice deviceWithAccessory:identifierMask:](DSIOHIDDevice, "deviceWithAccessory:identifierMask:", a3, -1);
}

+ (id)deviceWithAccessory:(unint64_t)a3 identifierMask:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  +[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)a1);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDeviceIdentifiers:identifierMask:", v8, a4);

  return v9;
}

+ (id)deviceMatchingAccessories:(id)a3
{
  return +[DSIOHIDDevice deviceMatchingAccessories:identifierMask:](DSIOHIDDevice, "deviceMatchingAccessories:identifierMask:", a3, -1);
}

+ (id)deviceMatchingAccessories:(id)a3 identifierMask:(unint64_t)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_class *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v16 = (objc_class *)a1;
  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", (int)objc_msgSend(v11, "intValue", v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          DiagnosticLogHandleForCategory(6);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v11;
            _os_log_fault_impl(&dword_21F54F000, v13, OS_LOG_TYPE_FAULT, "Identifier not found for accessory %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend([v16 alloc], "initWithDeviceIdentifiers:identifierMask:", v5, a4);
  return v14;
}

- (DSIOHIDDevice)initWithDeviceIdentifiers:(id)a3 identifierMask:(unint64_t)a4
{
  char v4;
  id v6;
  DSIOHIDDevice *v7;
  __IOHIDManager *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __IOHIDManager *manager;
  CFSetRef v23;
  NSObject *v24;
  NSObject *v25;
  __IOHIDDevice *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  DSIOHIDDevice *v36;
  void *v38;
  void *v39;
  id v40;
  DSIOHIDDevice *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  uint8_t buf[4];
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v4 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)DSIOHIDDevice;
  v7 = -[DSIOHIDDevice init](&v47, sel_init);
  if (!v7)
  {
LABEL_36:
    v36 = v7;
    goto LABEL_40;
  }
  v8 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v41 = v7;
  v7->_manager = v8;
  IOHIDManagerOpen(v8, 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v40 = v6;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (!v10)
    goto LABEL_19;
  v11 = v10;
  v12 = *(_QWORD *)v44;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v44 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v13);
      v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      if ((v4 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v14, "usagePage"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("DeviceUsagePage"));

        if ((v4 & 2) == 0)
        {
LABEL_9:
          if ((v4 & 4) == 0)
            goto LABEL_10;
          goto LABEL_16;
        }
      }
      else if ((v4 & 2) == 0)
      {
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v14, "usage"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("DeviceUsage"));

      if ((v4 & 4) == 0)
      {
LABEL_10:
        if ((v4 & 8) == 0)
          goto LABEL_12;
LABEL_11:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v14, "productID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("ProductID"));

        goto LABEL_12;
      }
LABEL_16:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v14, "vendorID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("VendorID"));

      if ((v4 & 8) != 0)
        goto LABEL_11;
LABEL_12:
      v17 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v9, "addObject:", v17);

      ++v13;
    }
    while (v11 != v13);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    v11 = v21;
  }
  while (v21);
LABEL_19:

  v7 = v41;
  manager = v41->_manager;
  if (!manager)
  {
    DiagnosticLogHandleForCategory(6);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.1();
    v6 = v40;
    goto LABEL_33;
  }
  IOHIDManagerSetDeviceMatchingMultiple(manager, (CFArrayRef)v9);
  v23 = IOHIDManagerCopyDevices(v41->_manager);
  v6 = v40;
  if (!v23)
  {
LABEL_34:
    if (!v41->_device)
    {
      DiagnosticLogHandleForCategory(6);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = obj;
        _os_log_impl(&dword_21F54F000, v24, OS_LOG_TYPE_DEFAULT, "Could not find accessory matching identifiers: %@", buf, 0xCu);
      }
      goto LABEL_39;
    }

    goto LABEL_36;
  }
  v24 = v23;
  if ((unint64_t)-[__CFSet count](v23, "count") >= 2)
  {
    DiagnosticLogHandleForCategory(6);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.4((uint64_t)obj, (uint64_t)v24, v25);

  }
  v26 = (__IOHIDDevice *)-[NSObject anyObject](v24, "anyObject");
  v41->_device = v26;
  if (!v26)
  {
LABEL_33:

    goto LABEL_34;
  }
  v27 = IOHIDDeviceOpen(v26, 0);
  if ((_DWORD)v27)
  {
    v28 = v27;
    DiagnosticLogHandleForCategory(6);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);
    goto LABEL_29;
  }
  +[DSIODeviceIdentifier identifierForIOHIDDevice:](DSIODeviceIdentifier, "identifierForIOHIDDevice:", v41->_device);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = v38;
    v41->_deviceModel = objc_msgSend(v38, "accessoryModel");

    goto LABEL_33;
  }
  DiagnosticLogHandleForCategory(6);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.2();
LABEL_29:

LABEL_39:
  v36 = 0;
LABEL_40:

  return v36;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F54F000, v0, v1, "Unable to close device.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)serialNumber
{
  CFTypeRef Property;
  void *v3;
  CFTypeID v4;
  id v5;
  NSObject *v6;
  CFTypeID v7;
  NSObject *v8;

  Property = IOHIDDeviceGetProperty(self->_device, CFSTR("SerialNumber"));
  if (!Property)
  {
    DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice serialNumber].cold.1();

    goto LABEL_12;
  }
  v3 = (void *)Property;
  v4 = CFGetTypeID(Property);
  if (v4 != CFStringGetTypeID())
  {
    v7 = CFGetTypeID(v3);
    if (v7 == CFNumberGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice serialNumber].cold.2(v3, v8);

LABEL_12:
    v5 = 0;
    return v5;
  }
  v5 = v3;
  return v5;
}

- (id)stringFromHIDReport:(int64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  id v9[2];
  id location;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  objc_initWeak(&location, self);
  -[DSIOHIDDevice _sharedSerialQueue](self, "_sharedSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__DSIOHIDDevice_stringFromHIDReport___block_invoke;
  v8[3] = &unk_24E44A2B0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  v8[4] = &v11;
  dispatch_sync(v5, v8);

  v6 = (id)v12[5];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __37__DSIOHIDDevice_stringFromHIDReport___block_invoke(uint64_t a1)
{
  IOHIDDeviceRef *WeakRetained;
  IOHIDDeviceRef *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  CFIndex pReportLength;
  uint8_t report[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  pReportLength = 129;
  *(_OWORD *)report = 0u;
  v9 = 0u;
  WeakRetained = (IOHIDDeviceRef *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained
    && IOHIDDeviceGetReport(WeakRetained[2], kIOHIDReportTypeFeature, *(_QWORD *)(a1 + 48), report, &pReportLength))
  {
    DiagnosticLogHandleForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37__DSIOHIDDevice_stringFromHIDReport___block_invoke_cold_1();
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &report[1], strnlen((const char *)&report[1], 0x80uLL), 4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }

}

- (BOOL)reportWithID:(int64_t)a3 reportType:(int)a4 object:(char *)a5 length:(int64_t *)a6
{
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  _QWORD block[5];
  id v22[4];
  int v23;
  uint64_t v24;
  _QWORD v25[2];
  int v26;
  id location;

  objc_initWeak(&location, self);
  v24 = 0;
  v25[0] = &v24;
  v25[1] = 0x2020000000;
  v26 = 0;
  -[DSIOHIDDevice _sharedSerialQueue](self, "_sharedSerialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DSIOHIDDevice_reportWithID_reportType_object_length___block_invoke;
  block[3] = &unk_24E44A2D8;
  objc_copyWeak(v22, &location);
  v23 = a4;
  block[4] = &v24;
  v22[1] = (id)a3;
  v22[2] = a5;
  v22[3] = a6;
  dispatch_sync(v11, block);

  if (*(_DWORD *)(v25[0] + 24))
  {
    DiagnosticLogHandleForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice reportWithID:reportType:object:length:].cold.1((uint64_t)v25, v12, v13, v14, v15, v16, v17, v18);

    v19 = *(_DWORD *)(v25[0] + 24) == 0;
  }
  else
  {
    v19 = 1;
  }
  objc_destroyWeak(v22);
  _Block_object_dispose(&v24, 8);
  objc_destroyWeak(&location);
  return v19;
}

void __55__DSIOHIDDevice_reportWithID_reportType_object_length___block_invoke(uint64_t a1)
{
  IOHIDDeviceRef *WeakRetained;
  IOHIDDeviceRef *v3;

  WeakRetained = (IOHIDDeviceRef *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = IOHIDDeviceGetReport(WeakRetained[2], *(IOHIDReportType *)(a1 + 72), *(_QWORD *)(a1 + 48), *(uint8_t **)(a1 + 56), *(CFIndex **)(a1 + 64));
    WeakRetained = v3;
  }

}

- (id)_sharedSerialQueue
{
  if (_sharedSerialQueue_onceToken != -1)
    dispatch_once(&_sharedSerialQueue_onceToken, &__block_literal_global_2);
  return (id)_sharedSerialQueue_serialQueue;
}

void __35__DSIOHIDDevice__sharedSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("DSIOHIDDevice report", 0);
  v1 = (void *)_sharedSerialQueue_serialQueue;
  _sharedSerialQueue_serialQueue = (uint64_t)v0;

}

- (unint64_t)deviceModel
{
  return self->_deviceModel;
}

- (void)initWithDeviceIdentifiers:identifierMask:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F54F000, v0, v1, "Cannot open IOHIDManager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDeviceIdentifiers:identifierMask:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F54F000, v0, v1, "identifierForIOHIDDevice unexpectedly returned nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDeviceIdentifiers:(uint64_t)a3 identifierMask:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21F54F000, a2, a3, "Failed to open IOHIDDevice %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDeviceIdentifiers:(os_log_t)log identifierMask:.cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21F54F000, log, OS_LOG_TYPE_ERROR, "Multiple devices found when matching identifiers (%@) to devices (%@); using one",
    (uint8_t *)&v3,
    0x16u);
}

- (void)serialNumber
{
  int v3;
  CFTypeID v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = CFGetTypeID(a1);
  _os_log_error_impl(&dword_21F54F000, a2, OS_LOG_TYPE_ERROR, "Unable to parse serial number with type = %lu.", (uint8_t *)&v3, 0xCu);
}

void __37__DSIOHIDDevice_stringFromHIDReport___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21F54F000, v0, v1, "Unable to retieve HID report.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)reportWithID:(uint64_t)a3 reportType:(uint64_t)a4 object:(uint64_t)a5 length:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21F54F000, a2, a3, "Unable to retieve HID report. Status code: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
