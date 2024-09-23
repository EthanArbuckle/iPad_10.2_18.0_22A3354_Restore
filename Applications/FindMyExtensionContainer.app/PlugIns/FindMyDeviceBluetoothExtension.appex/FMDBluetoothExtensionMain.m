@implementation FMDBluetoothExtensionMain

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  __int16 v25;
  FMDBluetoothExtensionMain *v26;

  v4 = a3;
  v5 = sub_100007824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412546;
    v24 = v4;
    v25 = 2112;
    v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "beginRequestWithExtensionCalled with context %@ and accessory provider = %@", (uint8_t *)&v23, 0x16u);
  }

  v7 = objc_opt_class(FMDExtVendorContext);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    v8 = sub_100007824();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class(v4);
      v23 = 138412290;
      v24 = v10;
      v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "beginRequestWithExtensionCalled with context %@", (uint8_t *)&v23, 0xCu);

    }
    objc_msgSend(v4, "setAccessoryProvider:", self);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_auxiliaryConnection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "remoteObjectProxy"));
  v14 = v13;
  if (v13 && objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___FMDExtAccessoryDelegateProtocol))
  {
    -[FMDBluetoothExtensionMain setHostProxy:](self, "setHostProxy:", v14);
  }
  else
  {
    v15 = sub_100007824();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10001334C((uint64_t)v14, v16, v17, v18, v19, v20, v21, v22);

  }
}

- (void)fetchAllAccessoriesInfoWithInfo:(id)a3 withCompletion:(id)a4
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  void (**v32)(id, void *, _QWORD);
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];

  v32 = (void (**)(id, void *, _QWORD))a4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAppleAccessories](FMDExtBluetoothManager, "pairedAppleAccessories"));
  v5 = sub_100007824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth manager paired devices %@", buf, 0xCu);
  }

  v34 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v12 = sub_100007824();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryInfo"));
          *(_DWORD *)buf = 138412290;
          v40 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "bluetoothDevice %@", buf, 0xCu);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceIDFromAddress:](FMDExtHelper, "deviceIDFromAddress:", v15));

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceTypeFromVendorId:productId:](FMDExtHelper, "deviceTypeFromVendorId:productId:", objc_msgSend(v11, "vendorId"), objc_msgSend(v11, "productId")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryInfo"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("AACPVersionInfo")));

        v20 = objc_alloc_init((Class)FMDExtAccessoryInfo);
        objc_msgSend(v20, "setAccessoryIdentifier:", v16);
        objc_msgSend(v20, "setAccessoryType:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        objc_msgSend(v20, "setName:", v21);

        objc_msgSend(v20, "setAdditionalInfo:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
        objc_msgSend(v20, "setDeviceDiscoveryId:", v22);

        v23 = objc_msgSend(v19, "count");
        v24 = sub_100007824();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if ((unint64_t)v23 < 0xB)
        {
          if (v26)
          {
            v28 = objc_msgSend(v19, "count");
            *(_DWORD *)buf = 134218242;
            v40 = v28;
            v41 = 2112;
            v42 = v19;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "findmybluetotthExtension invalid info. Count: %lu, Values: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v26)
          {
            *(_DWORD *)buf = 138412290;
            v40 = v19;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "received valid AACPVersionInfo: %@", buf, 0xCu);
          }

          v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper serialNumberFromVersionInfo:](FMDExtHelper, "serialNumberFromVersionInfo:", v19));
          objc_msgSend(v20, "setSerialNumbers:", v27);

          v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 10));
          objc_msgSend(v20, "setFirmwareVersion:", v25);
        }

        objc_msgSend(v34, "addObject:", v20);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v8);
  }

  v29 = sub_100007824();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v34;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Bluetooth manager paired devices %@", buf, 0xCu);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v34));
  v32[2](v32, v31, 0);

}

- (void)connectionStatusForAccessory:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, id, _QWORD);
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  int v20;

  v5 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAccessoryWithID:](FMDExtBluetoothManager, "pairedAccessoryWithID:", v5));
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "connected");
    v10 = sub_100007824();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 1024;
      v20 = (int)v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Bluetooth accessory %@ connection status = %u", buf, 0x12u);

    }
    v6[2](v6, v9, 0);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bluetooth accessory with identifier %@ not found"), v5));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v13));
    v15 = sub_100007824();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000133B0();

    ((void (**)(id, id, void *))v6)[2](v6, 0, v14);
    v6 = (void (**)(id, id, _QWORD))v13;
  }

}

- (void)forceConnectToAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _BOOL8, _QWORD);
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  int v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  double v46;
  __int16 v47;
  int v48;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _BOOL8, _QWORD))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAccessoryWithID:](FMDExtBluetoothManager, "pairedAccessoryWithID:", v7));
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeout")));
    v12 = 0.5;
    if (v11)
    {
      v13 = (void *)v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeout")));
      v15 = objc_opt_respondsToSelector(v14, "doubleValue");

      if ((v15 & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeout")));
        objc_msgSend(v16, "doubleValue");
        v12 = v17;

      }
    }
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("retryCount")));
    if (v18
      && (v19 = (void *)v18,
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("retryCount"))),
          v21 = objc_opt_respondsToSelector(v20, "intValue"),
          v20,
          v19,
          (v21 & 1) != 0))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("retryCount")));
      v23 = objc_msgSend(v22, "intValue");

    }
    else
    {
      v23 = 10;
    }
    v24 = sub_100007824();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      *(_DWORD *)buf = 138412802;
      v44 = v26;
      v45 = 2048;
      v46 = v12;
      v47 = 1024;
      v48 = v23;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Accessory %@ connection timeout = %lf retryCount %d", buf, 0x1Cu);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager currentInstance](FMDExtBluetoothManager, "currentInstance"));
    objc_msgSend(v27, "connectDevice:", v10);

    if (v23 >= 1)
    {
      if ((objc_msgSend(v10, "connected") & 1) != 0)
      {
        v28 = 0.0;
        v29 = 1;
LABEL_21:
        v35 = sub_100007824();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
          *(_DWORD *)buf = 138412546;
          v44 = v37;
          v45 = 2048;
          v46 = v12 * v28;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Accessory %@ connected after %f", buf, 0x16u);

        }
        v38 = sub_100007824();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
          *(_DWORD *)buf = 138412290;
          v44 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Bluetooth accessory %@ force connection success", buf, 0xCu);

        }
        goto LABEL_28;
      }
      v34 = 0;
      while (1)
      {
        +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", v12);
        if (v23 - 1 == v34)
          break;
        ++v34;
        if ((objc_msgSend(v10, "connected") & 1) != 0)
        {
          v29 = v34 < v23;
          v28 = (double)v34;
          goto LABEL_21;
        }
      }
    }
    v41 = sub_100007824();
    v39 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      *(_DWORD *)buf = 138412290;
      v44 = v42;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Bluetooth accessory %@ force connection failed", buf, 0xCu);

    }
    v29 = 0;
LABEL_28:

    v9[2](v9, v29, 0);
    goto LABEL_29;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bluetooth accessory with identifier %@ not found"), v7));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v30));
  v32 = sub_100007824();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    sub_10001341C();

  ((void (**)(id, _BOOL8, void *))v9)[2](v9, 0, v31);
LABEL_29:

}

- (void)getStyleForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t DeviceColor;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  unsigned int v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  unsigned int v33;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAccessoryWithID:](FMDExtBluetoothManager, "pairedAccessoryWithID:", v7));
  if (!v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bluetooth accessory with identifier %@ not found"), v7));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v17));
    v19 = sub_100007824();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100013488();
    goto LABEL_14;
  }
  v29 = 0;
  if (+[FMDBluetoothFrameworkBTManagingFactory isAutomationActive](FMDBluetoothFrameworkBTManagingFactory, "isAutomationActive"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessoryInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("color")));
    v13 = objc_opt_respondsToSelector(v12, "unsignedIntValue");

    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessoryInfo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("color")));
      v29 = objc_msgSend(v15, "unsignedIntValue");

      DeviceColor = 0;
    }
    else
    {
      DeviceColor = 1;
    }
  }
  else
  {
    DeviceColor = BTAccessoryManagerGetDeviceColor(+[FMDExtBluetoothManager getAccessoryManager](FMDExtBluetoothManager, "getAccessoryManager"), objc_msgSend(v10, "device"), &v29);
  }
  v21 = sub_100007824();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    *(_DWORD *)buf = 138412546;
    v31 = v23;
    v32 = 1024;
    v33 = v29;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "color for accessory %@ = %u", buf, 0x12u);

  }
  if ((_DWORD)DeviceColor)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get color for accessory %@ with error code %d"), v24, DeviceColor));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v17));
    v25 = sub_100007824();
    v20 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100013488();
LABEL_14:

    v9[2](v9, 0, v18);
    goto LABEL_15;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper parseStyle:info:](FMDExtHelper, "parseStyle:info:", v29, v8));
  if (v17)
  {
    ((void (**)(id, void *, void *))v9)[2](v9, v17, 0);
    goto LABEL_16;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("parsing failed %u %@"), v29, v8));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v18));
  v27 = sub_100007824();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    sub_1000134F4();

  v9[2](v9, 0, v26);
LABEL_15:

LABEL_16:
}

- (void)safetyAlertForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v6;
  void (**v7)(id, BOOL, const __CFString *, _QWORD);
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  int v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;

  v6 = a3;
  v7 = (void (**)(id, BOOL, const __CFString *, _QWORD))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAccessoryWithID:](FMDExtBluetoothManager, "pairedAccessoryWithID:", v6));
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "inEarDetectEnabled");
    v11 = sub_100007824();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "In ear detection available for accessory %@", buf, 0xCu);

      }
      v25 = 3;
      v26 = 3;
      objc_msgSend(v9, "inEarStatusPrimary:secondary:", &v26, &v25);
      v15 = sub_100007824();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v28 = v6;
        v29 = 1024;
        v30 = v26;
        v31 = 1024;
        v32 = v25;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "accessory %@ primaryEarStatus %u secondaryEarStatus = %u", buf, 0x18u);
      }

      if (v26 != 3 && v25 != 3)
        v17 = CFSTR("Safe");
      else
        v17 = CFSTR("Unknown");
      if (v26 != 0 && v25 != 0)
        v18 = v17;
      else
        v18 = CFSTR("InEar");
      v19 = v26 != 0 && v25 != 0 && v26 != 3 && v25 != 3;
    }
    else
    {
      if (v13)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
        *(_DWORD *)buf = 138412290;
        v28 = v24;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "In ear detection not available for accessory %@", buf, 0xCu);

      }
      v19 = 0;
      v18 = CFSTR("InEarDetectUnavailable");
    }
    v7[2](v7, v19, v18, 0);
  }
  else
  {
    v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bluetooth accessory with identifier %@ not found"), v6));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v20));
    v22 = sub_100007824();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100013560();

    ((void (**)(id, BOOL, const __CFString *, void *))v7)[2](v7, 0, CFSTR("Unavailable"), v21);
    v7 = (void (**)(id, BOOL, const __CFString *, _QWORD))v20;
  }

}

- (void)startDiscoveryForAccessory:(id)a3 duration:(double)a4 info:(id)a5 withCompletion:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  FMDExtBluetoothDiscoveryFactory *v13;
  FMDExtAccessoryDelegateProtocol *hostProxy;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint8_t buf[4];
  double v29;

  v9 = a3;
  v10 = (void (**)(id, _QWORD))a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAccessoryWithID:](FMDExtBluetoothManager, "pairedAccessoryWithID:", v9));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discoveryFactory](self, "discoveryFactory"));

    if (!v12)
    {
      v13 = objc_alloc_init(FMDExtBluetoothDiscoveryFactory);
      -[FMDBluetoothExtensionMain setDiscoveryFactory:](self, "setDiscoveryFactory:", v13);

      hostProxy = self->_hostProxy;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discoveryFactory](self, "discoveryFactory"));
      objc_msgSend(v15, "setDelegate:", hostProxy);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discoveryFactory](self, "discoveryFactory"));
      objc_msgSend(v16, "setAccessoryId:", v9);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discoveryFactory](self, "discoveryFactory"));
      objc_msgSend(v18, "setAddress:", v17);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discoveryFactory](self, "discoveryFactory"));
    v20 = objc_msgSend(v19, "newDiscovery");
    -[FMDBluetoothExtensionMain setDiscovery:](self, "setDiscovery:", v20);

    v21 = sub_100007824();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = a4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "starting discovery for %lf", buf, 0xCu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discovery](self, "discovery"));
    objc_msgSend(v23, "startDiscoveryForDuration:", a4);

    v10[2](v10, 0);
  }
  else
  {
    v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bluetooth accessory with identifier %@ not found"), v9));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v24));
    v26 = sub_100007894();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1000135CC();

    ((void (**)(id, void *))v10)[2](v10, v25);
    v10 = (void (**)(id, _QWORD))v24;
  }

}

- (void)stopDiscoveryForAccessory:(id)a3 info:(id)a4 withCompletion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  NSObject *v17;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  v9 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discoveryFactory](self, "discoveryFactory"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discovery](self, "discovery"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discoveryFactory](self, "discoveryFactory"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessoryId"));
      v14 = objc_msgSend(v13, "isEqualToString:", v7);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain discovery](self, "discovery"));
        objc_msgSend(v15, "stopDiscovery");

        -[FMDBluetoothExtensionMain setDiscovery:](self, "setDiscovery:", 0);
        -[FMDBluetoothExtensionMain setDiscoveryFactory:](self, "setDiscoveryFactory:", 0);
      }
      else
      {
        v16 = sub_100007824();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_100013638((uint64_t)v7, self, v17);

      }
    }
  }
  v8[2](v8, 0);

}

- (void)playSoundForAccessory:(id)a3 info:(id)a4 duration:(double)a5 rampUpDuration:(double)a6 channels:(id)a7 withCompletion:(id)a8
{
  id v13;
  id v14;
  void (**v15)(id, void *);
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  FMDBluetoothExtensionMain *v31;
  id v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void (**v42)(id, void *);
  id v43;
  void *v44;
  char v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  FMDBluetoothExtensionMain *v58;

  v13 = a3;
  v54 = a4;
  v14 = a7;
  v15 = (void (**)(id, void *))a8;
  v16 = sub_100007894();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    *(_DWORD *)buf = 138412546;
    v56 = (uint64_t)v18;
    v57 = 2112;
    v58 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PLAY_SOUND play sound started at %@ by %@", buf, 0x16u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAccessoryWithID:](FMDExtBluetoothManager, "pairedAccessoryWithID:", v13));
  if (v19)
  {
    v20 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "address"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("soundFileID")));
    v52 = (void *)v22;
    if (v22)
    {
      v23 = v22;
      v51 = v14;
      v24 = sub_100007894();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "got soundFileID = %@", buf, 0xCu);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "pathForResource:ofType:", v23, CFSTR("wav")));
      if (v27)
      {
        v28 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v27));
        v29 = sub_100007894();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = (FMDBluetoothExtensionMain *)v28;
          v56 = v28;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "got audioURL = %@", buf, 0xCu);
        }
        else
        {
          v31 = (FMDBluetoothExtensionMain *)v28;
        }
      }
      else
      {
        v34 = sub_100007894();
        v30 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_100013764((uint64_t)v52, v30, v35, v36, v37, v38, v39, v40);
        v31 = 0;
      }

      v14 = v51;
    }
    else
    {
      v31 = 0;
    }
    v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("supportsChangingListeningMode")));
    if (v41)
    {
      v42 = v15;
      v43 = v14;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("supportsChangingListeningMode")));
      v45 = objc_opt_respondsToSelector(v44, "BOOLValue");

      if ((v45 & 1) != 0)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("supportsChangingListeningMode")));
        v41 = objc_msgSend(v46, "BOOLValue");

      }
      else
      {
        v41 = 0;
      }
      v14 = v43;
      v15 = v42;
    }
    v47 = objc_msgSend(objc_alloc((Class)FMDGenericAudioAccessory), "initWithAccessoryId:audioRoutingIdentifier:audioURL:audioAccessoryInfo:supportsChangingListeningMode:", v20, v21, v31, 0, v41);
    v48 = sub_100007894();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v56 = (uint64_t)v14;
      v57 = 2112;
      v58 = v31;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "play sound with chanels %@ and audio url %@", buf, 0x16u);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain soundController](self, "soundController"));
    objc_msgSend(v50, "startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion:", v47, v14, v15, a5, a6);

  }
  else
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bluetooth accessory with identifier %@ not found"), v13));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v20));
    v32 = sub_100007894();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1000136F8();

    v15[2](v15, v21);
  }

}

- (void)stopSoundForAccessory:(id)a3 info:(id)a4 rampDownDuration:(double)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  FMDBluetoothExtensionMain *v30;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = sub_100007894();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    *(_DWORD *)buf = 138412546;
    v28 = v15;
    v29 = 2112;
    v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "STOP_SOUND stop sound started at %@ %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtBluetoothManager pairedAccessoryWithID:](FMDExtBluetoothManager, "pairedAccessoryWithID:", v10));
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "address"));
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("supportsChangingListeningMode")));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("supportsChangingListeningMode")));
      v21 = objc_opt_respondsToSelector(v20, "BOOLValue");

      if ((v21 & 1) != 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("supportsChangingListeningMode")));
        v19 = objc_msgSend(v22, "BOOLValue");

      }
      else
      {
        v19 = 0;
      }
    }
    v25 = objc_msgSend(objc_alloc((Class)FMDGenericAudioAccessory), "initWithAccessoryId:audioRoutingIdentifier:audioURL:audioAccessoryInfo:supportsChangingListeningMode:", v17, v18, 0, 0, v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothExtensionMain soundController](self, "soundController"));
    objc_msgSend(v26, "stopPlayingSoundForAccessory:rampDownDuration:completion:", v25, v12, a5);

  }
  else
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bluetooth accessory with identifier %@ not found"), v10));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", v17));
    v23 = sub_100007824();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1000137C8();

    v12[2](v12, v18);
  }

}

- (FMDExtSoundController)soundController
{
  FMDExtSoundController *soundController;
  FMDExtSoundController *v4;
  FMDExtSoundController *v5;

  soundController = self->_soundController;
  if (!soundController)
  {
    v4 = objc_alloc_init(FMDExtSoundController);
    v5 = self->_soundController;
    self->_soundController = v4;

    soundController = self->_soundController;
  }
  return soundController;
}

- (void)setSoundController:(id)a3
{
  objc_storeStrong((id *)&self->_soundController, a3);
}

- (FMDExtAccessoryDelegateProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
  objc_storeStrong((id *)&self->_hostProxy, a3);
}

- (FMDExtBluetoothDiscoveryFactory)discoveryFactory
{
  return self->_discoveryFactory;
}

- (void)setDiscoveryFactory:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryFactory, a3);
}

- (FMDBluetoothDeviceDiscovering)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_discoveryFactory, 0);
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
}

@end
