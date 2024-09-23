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
  id v9;
  void *v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", a3));
  v7 = objc_alloc((Class)a1);
  v11 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9 = objc_msgSend(v7, "initWithDeviceIdentifiers:identifierMask:", v8, a4);

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
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  objc_class *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v17 = (objc_class *)a1;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[DSIODeviceIdentifier identifierForAccessoryModel:](DSIODeviceIdentifier, "identifierForAccessoryModel:", (int)objc_msgSend(v11, "intValue", v17)));
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          v13 = DiagnosticLogHandleForCategory(6);
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v11;
            _os_log_fault_impl(&dword_0, v14, OS_LOG_TYPE_FAULT, "Identifier not found for accessory %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }

  v15 = objc_msgSend([v17 alloc], "initWithDeviceIdentifiers:identifierMask:", v5, a4);
  return v15;
}

- (DSIOHIDDevice)initWithDeviceIdentifiers:(id)a3 identifierMask:(unint64_t)a4
{
  char v4;
  id v6;
  DSIOHIDDevice *v7;
  __IOHIDManager *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __IOHIDManager *manager;
  CFSetRef v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  __IOHIDDevice *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  DSIOHIDDevice *v39;
  id v40;
  void *v42;
  void *v43;
  id v44;
  id v45;
  DSIOHIDDevice *v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  uint8_t buf[4];
  id v54;
  _BYTE v55[128];

  v4 = a4;
  v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)DSIOHIDDevice;
  v7 = -[DSIOHIDDevice init](&v52, "init");
  if (!v7)
  {
LABEL_36:
    v39 = v7;
    goto LABEL_40;
  }
  v8 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
  v46 = v7;
  v7->_manager = v8;
  IOHIDManagerOpen(v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v45 = v6;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (!v10)
    goto LABEL_19;
  v11 = v10;
  v12 = *(_QWORD *)v49;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v49 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v13);
      v15 = objc_alloc_init((Class)NSMutableDictionary);
      if ((v4 & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "usagePage")));
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
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "usage")));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("DeviceUsage"));

      if ((v4 & 4) == 0)
      {
LABEL_10:
        if ((v4 & 8) == 0)
          goto LABEL_12;
LABEL_11:
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "productID")));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("ProductID"));

        goto LABEL_12;
      }
LABEL_16:
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "vendorID")));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("VendorID"));

      if ((v4 & 8) != 0)
        goto LABEL_11;
LABEL_12:
      v17 = objc_msgSend(v15, "copy");
      objc_msgSend(v9, "addObject:", v17);

      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    v11 = v21;
  }
  while (v21);
LABEL_19:

  v7 = v46;
  manager = v46->_manager;
  if (!manager)
  {
    v38 = DiagnosticLogHandleForCategory(6);
    v24 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.1();
    v6 = v45;
    goto LABEL_33;
  }
  IOHIDManagerSetDeviceMatchingMultiple(manager, (CFArrayRef)v9);
  v23 = IOHIDManagerCopyDevices(v46->_manager);
  v6 = v45;
  if (!v23)
  {
LABEL_34:
    if (!v46->_device)
    {
      v40 = DiagnosticLogHandleForCategory(6);
      v24 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = obj;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Could not find accessory matching identifiers: %@", buf, 0xCu);
      }
      goto LABEL_39;
    }

    goto LABEL_36;
  }
  v24 = v23;
  if ((unint64_t)-[__CFSet count](v23, "count") >= 2)
  {
    v25 = DiagnosticLogHandleForCategory(6);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.4((uint64_t)obj, (uint64_t)v24, v26);

  }
  v27 = (__IOHIDDevice *)-[NSObject anyObject](v24, "anyObject");
  v46->_device = v27;
  if (!v27)
  {
LABEL_33:

    goto LABEL_34;
  }
  v28 = IOHIDDeviceOpen(v27, 0);
  if ((_DWORD)v28)
  {
    v29 = v28;
    v30 = DiagnosticLogHandleForCategory(6);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.3(v29, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_29;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[DSIODeviceIdentifier identifierForIOHIDDevice:](DSIODeviceIdentifier, "identifierForIOHIDDevice:", v46->_device));
  if (v42)
  {
    v43 = v42;
    v46->_deviceModel = (unint64_t)objc_msgSend(v42, "accessoryModel");

    goto LABEL_33;
  }
  v44 = DiagnosticLogHandleForCategory(6);
  v31 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    -[DSIOHIDDevice initWithDeviceIdentifiers:identifierMask:].cold.2();
LABEL_29:

LABEL_39:
  v39 = 0;
LABEL_40:

  return v39;
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
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Unable to close device.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)serialNumber
{
  CFTypeRef Property;
  void *v3;
  CFTypeID v4;
  id v5;
  id v6;
  NSObject *v7;
  CFTypeID v8;
  id v9;
  NSObject *v10;

  Property = IOHIDDeviceGetProperty(self->_device, CFSTR("SerialNumber"));
  if (!Property)
  {
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice serialNumber].cold.1();

    goto LABEL_12;
  }
  v3 = (void *)Property;
  v4 = CFGetTypeID(Property);
  if (v4 != CFStringGetTypeID())
  {
    v8 = CFGetTypeID(v3);
    if (v8 == CFNumberGetTypeID())
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v3));
      return v5;
    }
    v9 = DiagnosticLogHandleForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice serialNumber].cold.2(v3, v10);

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
  v5 = objc_claimAutoreleasedReturnValue(-[DSIOHIDDevice _sharedSerialQueue](self, "_sharedSerialQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __37__DSIOHIDDevice_stringFromHIDReport___block_invoke;
  v8[3] = &unk_186D0;
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
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  CFIndex pReportLength;
  uint8_t report[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;

  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  pReportLength = 129;
  *(_OWORD *)report = 0u;
  v10 = 0u;
  WeakRetained = (IOHIDDeviceRef *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained
    && IOHIDDeviceGetReport(WeakRetained[2], kIOHIDReportTypeFeature, *(_QWORD *)(a1 + 48), report, &pReportLength))
  {
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __37__DSIOHIDDevice_stringFromHIDReport___block_invoke_cold_1();
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", &report[1], strnlen((const char *)&report[1], 0x80uLL), 4);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

}

- (BOOL)reportWithID:(int64_t)a3 reportType:(int)a4 object:(char *)a5 length:(int64_t *)a6
{
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD block[5];
  id v23[4];
  int v24;
  uint64_t v25;
  _QWORD v26[2];
  int v27;
  id location;

  objc_initWeak(&location, self);
  v25 = 0;
  v26[0] = &v25;
  v26[1] = 0x2020000000;
  v27 = 0;
  v11 = objc_claimAutoreleasedReturnValue(-[DSIOHIDDevice _sharedSerialQueue](self, "_sharedSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __55__DSIOHIDDevice_reportWithID_reportType_object_length___block_invoke;
  block[3] = &unk_186F8;
  objc_copyWeak(v23, &location);
  v24 = a4;
  block[4] = &v25;
  v23[1] = (id)a3;
  v23[2] = a5;
  v23[3] = a6;
  dispatch_sync(v11, block);

  if (*(_DWORD *)(v26[0] + 24))
  {
    v12 = DiagnosticLogHandleForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[DSIOHIDDevice reportWithID:reportType:object:length:].cold.1((uint64_t)v26, v13, v14, v15, v16, v17, v18, v19);

    v20 = *(_DWORD *)(v26[0] + 24) == 0;
  }
  else
  {
    v20 = 1;
  }
  objc_destroyWeak(v23);
  _Block_object_dispose(&v25, 8);
  objc_destroyWeak(&location);
  return v20;
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

void __35__DSIOHIDDevice__sharedSerialQueue__block_invoke(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("DSIOHIDDevice report", 0);
  v2 = (void *)_sharedSerialQueue_serialQueue;
  _sharedSerialQueue_serialQueue = (uint64_t)v1;

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
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Cannot open IOHIDManager.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "identifierForIOHIDDevice unexpectedly returned nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDeviceIdentifiers:(uint64_t)a3 identifierMask:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_0, a2, a3, "Failed to open IOHIDDevice %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDeviceIdentifiers:(os_log_t)log identifierMask:.cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Multiple devices found when matching identifiers (%@) to devices (%@); using one",
    (uint8_t *)&v3,
    0x16u);
}

- (void)serialNumber
{
  int v3;
  CFTypeID v4;

  v3 = 134217984;
  v4 = CFGetTypeID(a1);
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to parse serial number with type = %lu.", (uint8_t *)&v3, 0xCu);
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
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Unable to retieve HID report.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)reportWithID:(uint64_t)a3 reportType:(uint64_t)a4 object:(uint64_t)a5 length:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_0, a2, a3, "Unable to retieve HID report. Status code: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
