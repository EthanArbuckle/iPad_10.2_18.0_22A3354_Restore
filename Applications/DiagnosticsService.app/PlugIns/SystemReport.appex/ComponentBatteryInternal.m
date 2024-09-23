@implementation ComponentBatteryInternal

- (void)populateAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ComponentBatteryInternal;
  -[ComponentBatteryInternalBase populateAttributes:](&v23, "populateAttributes:", v4);
  -[ComponentBatteryInternal populatePLQueryAttributes:](self, "populatePLQueryAttributes:", v4);
  v5 = objc_msgSend(objc_alloc((Class)PowerUISmartChargeClient), "initWithClientName:", CFSTR("com.apple.diagnostics"));
  -[ComponentBatteryInternal setSmartChargeClient:](self, "setSmartChargeClient:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal batteryCellDisconnectCount](self, "batteryCellDisconnectCount"));
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("batteryCellDisconnectCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal deviceSupportsBatteryAuth](self, "deviceSupportsBatteryAuth"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("deviceSupportsBatteryAuth"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceSupportsBatteryAuth")));
  v9 = objc_msgSend(v8, "isEqualToNumber:", &__kCFBooleanTrue);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentBatteryInternalBase authPassed](self, "authPassed")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("authPassed"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase fdrValidationStatus](self, "fdrValidationStatus"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("fdrValidationStatus"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentBatteryInternalBase isTrusted](self, "isTrusted")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("isTrusted"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentBatteryInternal isTrustedForUI](self, "isTrustedForUI")));
    v14 = CFSTR("isTrustedForUI");
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase fbsn](self, "fbsn"));
    v14 = CFSTR("fbsn");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal authError](self, "authError"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("authErrorCode"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal accessoryCertificate](self, "accessoryCertificate"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("accessoryCertificate"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal idsn](self, "idsn"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("chipId"));

  if (+[DASoftLinking isCoreRepairFrameworkAvailable](DASoftLinking, "isCoreRepairFrameworkAvailable"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[CRRepairStatus isVeridianFWUpdateRequired](CRRepairStatus, "isVeridianFWUpdateRequired")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("isFirmwareUpdateRequired"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryBase generatePowerSourceData](self, "generatePowerSourceData"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternalBase generateMitigationState](self, "generateMitigationState"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal generateCoreRepairData](self, "generateCoreRepairData"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v21);

  if ((+[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive") & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal batteryOptimizationMode](self, "batteryOptimizationMode"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("batteryOptimizationMode"));

  }
}

- (void)populatePLQueryAttributes:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v4 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_10002A3D0;
  v41 = sub_10002A3E0;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10002A3D0;
  v35 = sub_10002A3E0;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10002A3D0;
  v29 = sub_10002A3E0;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10002A3D0;
  v23 = sub_10002A3E0;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10002A3D0;
  v17 = sub_10002A3E0;
  v18 = 0;
  v5 = dispatch_group_create();
  global_queue = dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A3E8;
  block[3] = &unk_100080C30;
  block[4] = self;
  block[5] = &v37;
  dispatch_group_async(v5, v7, block);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002A420;
  v11[3] = &unk_100080C30;
  v11[4] = self;
  v11[5] = &v31;
  dispatch_group_async(v5, v7, v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002A458;
  v10[3] = &unk_100080C30;
  v10[4] = self;
  v10[5] = &v25;
  dispatch_group_async(v5, v7, v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002A490;
  v9[3] = &unk_100080C30;
  v9[4] = self;
  v9[5] = &v19;
  dispatch_group_async(v5, v7, v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002A4C8;
  v8[3] = &unk_100080C98;
  v8[4] = &v13;
  dispatch_group_async(v5, v7, v8);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v38[5])
    objc_msgSend(v4, "addEntriesFromDictionary:");
  if (v32[5])
    objc_msgSend(v4, "addEntriesFromDictionary:");
  if (v26[5])
    objc_msgSend(v4, "addEntriesFromDictionary:");
  if (v20[5])
    objc_msgSend(v4, "addEntriesFromDictionary:");
  if (objc_msgSend((id)v14[5], "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14[5], CFSTR("shutdownLog"));

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

- (id)batteryCellDisconnectCount
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = -1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:](DAComponentUtil, "getIORegistryName:property:optionalKey:", CFSTR("AppleSmartBattery"), CFSTR("BatteryCellDisconnectCount"), 0));
  v3 = v2;
  if (!v2 || (objc_msgSend(v2, "getBytes:length:", &v6, 8), v6 < 0))
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));

  return v4;
}

- (id)deviceSupportsBatteryAuth
{
  if (MGGetBoolAnswer(CFSTR("D6/BMDrlb8V3WSiqL8gL+w"), a2))
    return &__kCFBooleanTrue;
  else
    return &__kCFBooleanFalse;
}

- (id)authError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", CFSTR("AppleAuthCPRelay"), CFSTR("authError"), 0, &stru_100080A10));
  v3 = v2;
  if (v2)
    v4 = *(unsigned int *)objc_msgSend(objc_retainAutorelease(v2), "bytes");
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));

  return v5;
}

- (BOOL)isTrustedForUI
{
  void *v2;
  BOOL v3;
  char v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", CFSTR("AppleAuthCPRelay"), CFSTR("isTrustedForUI"), 0, &stru_100080A10));
  v5 = 0;
  objc_msgSend(v2, "getBytes:length:", &v5, 1);
  v3 = v5 != 0;

  return v3;
}

- (id)accessoryCertificate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryName:property:optionalKey:classValidator:", CFSTR("AppleAuthCPRelay"), CFSTR("AccessoryCertificate"), 0, &stru_100080A10));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)idsn
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryName:property:optionalKey:classValidator:", CFSTR("AppleAuthCPRelay"), CFSTR("IDSN"), 0, &stru_100080A10));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)generateCoreRepairData
{
  NSMutableDictionary *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t DeviceChemID;
  uint64_t isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t v19[16];
  uint8_t buf[16];

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = dlopen("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit", 16);
  v4 = DiagnosticLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Repair data is available for this device, populating attributes.", buf, 2u);
    }

    DeviceChemID = getDeviceChemID();
    isKindOfClass = objc_claimAutoreleasedReturnValue(DeviceChemID);
    v5 = isKindOfClass;
    if (isKindOfClass)
    {
      v9 = objc_opt_class(NSNumber);
      isKindOfClass = objc_opt_isKindOfClass(v5, v9);
      if ((isKindOfClass & 1) != 0)
        isKindOfClass = (uint64_t)-[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v5, CFSTR("chemID"));
    }
    v10 = hasHadBatteryRepairUsingCBCC(isKindOfClass);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v11;
    if (v11)
    {
      v13 = objc_opt_class(NSNumber);
      v11 = objc_opt_isKindOfClass(v12, v13);
      if ((v11 & 1) != 0)
        v11 = (uint64_t)-[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v12, CFSTR("hasHadBatteryRepairUsingCBCC"));
    }
    v14 = hasHadBatteryRepair(v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (v15)
    {
      v16 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v15, CFSTR("hasHadBatteryRepair"));
    }

  }
  else if (v6)
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Repair data not available for this device, skipping.", v19, 2u);
  }

  v17 = -[NSMutableDictionary copy](v2, "copy");
  return v17;
}

- (id)batteryOptimizationMode
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v11;
  unsigned int v12;
  void *v13;
  char *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal smartChargeClient](self, "smartChargeClient"));
  if ((objc_msgSend(v3, "isMCLSupported") & 1) == 0)
  {

    goto LABEL_6;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal smartChargeClient](self, "smartChargeClient"));
  v22 = 0;
  v5 = objc_msgSend(v4, "isMCLCurrentlyEnabled:", &v22);
  v6 = v22;

  if (!v5)
  {
    if (v6)
    {
      v18 = DiagnosticLogHandleForCategory(6);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v6;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Error during retrieving MCL status: %@", buf, 0xCu);
      }

    }
LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal smartChargeClient](self, "smartChargeClient"));
    v12 = objc_msgSend(v11, "isOBCSupported");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal smartChargeClient](self, "smartChargeClient"));
      v20 = 0;
      v14 = (char *)objc_msgSend(v13, "isSmartChargingCurrentlyEnabled:", &v20);
      v15 = v20;

      if ((unint64_t)(v14 - 3) >= 0xFFFFFFFFFFFFFFFELL)
      {

        return CFSTR("Optimized");
      }
      if (v15)
      {
        v16 = DiagnosticLogHandleForCategory(6);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error during retrieving OBC status: %@", buf, 0xCu);
        }

      }
    }
    return CFSTR("None");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBatteryInternal smartChargeClient](self, "smartChargeClient"));
  v21 = v6;
  v8 = objc_msgSend(v7, "getMCLLimitWithError:", &v21);
  v9 = v21;

  if (!v9)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d%% Limit"), v8));

  return CFSTR("ManualLimit");
}

- (PowerUISmartChargeClient)smartChargeClient
{
  return self->_smartChargeClient;
}

- (void)setSmartChargeClient:(id)a3
{
  objc_storeStrong((id *)&self->_smartChargeClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartChargeClient, 0);
}

@end
