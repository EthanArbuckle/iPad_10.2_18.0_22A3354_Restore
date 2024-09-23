@implementation ComponentBaseband

- (BOOL)isPresent
{
  dispatch_queue_global_t global_queue;
  void *v4;
  id v5;
  void *v6;
  id v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  -[ComponentBaseband setTelephonyClientQueue:](self, "setTelephonyClientQueue:", v4);

  v5 = objc_alloc((Class)CoreTelephonyClient);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband telephonyClientQueue](self, "telephonyClientQueue"));
  v7 = objc_msgSend(v5, "initWithQueue:", v6);
  -[ComponentBaseband setTelephonyClient:](self, "setTelephonyClient:", v7);

  v8 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband telephonyClient](self, "telephonyClient"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002B5A4;
  v13[3] = &unk_100080CC0;
  v15 = &v18;
  objc_copyWeak(&v16, &location);
  v10 = v8;
  v14 = v10;
  objc_msgSend(v9, "checkRadioBootHealth:", v13);

  v11 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v10, v11);
  LOBYTE(v9) = *((_BYTE *)v19 + 24);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v18, 8);
  return (char)v9;
}

- (void)populateAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband basebandFirmwareVersion](self, "basebandFirmwareVersion"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v4, CFSTR("basebandVersion"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband IMEI](self, "IMEI"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v5, CFSTR("imei"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband MEID](self, "MEID"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v6, CFSTR("meid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband ICCID](self, "ICCID"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v7, CFSTR("iccid"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband eUICCChipID](self, "eUICCChipID"));
  v9 = objc_opt_class(NSNull);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, CFSTR("eUICCChipID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband eUICC](self, "eUICC"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v10, CFSTR("eUICC"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband eUICCFwUpdateCurrentVersion](self, "eUICCFwUpdateCurrentVersion"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v11, CFSTR("eUICCFwUpdateCurrentVersion"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband eUICCFwUpdateGoldFwMac](self, "eUICCFwUpdateGoldFwMac"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v12, CFSTR("eUICCFwUpdateGoldFwMac"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband eUICCFwUpdateLoaderVersion](self, "eUICCFwUpdateLoaderVersion"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v13, CFSTR("eUICCFwUpdateLoaderVersion"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband eUICCFwUpdateOperationMode](self, "eUICCFwUpdateOperationMode"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, CFSTR("eUICCFwUpdateOperationMode"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband simStatus](self, "simStatus"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v15, CFSTR("simStatus"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband simTrayStatus](self, "simTrayStatus"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v16, CFSTR("simTrayStatus"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband secondSimStatus](self, "secondSimStatus"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, CFSTR("secondSimStatus"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband secondSimTrayStatus](self, "secondSimTrayStatus"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, CFSTR("secondSimTrayStatus"));

  objc_msgSend(v24, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("hasBaseband"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband serialNumber](self, "serialNumber"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v19, CFSTR("serialNumber"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v20, CFSTR("callStatistics"));

  if ((+[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive") & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband cellularCallStatistics](self, "cellularCallStatistics"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v21, CFSTR("callStatistics"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband rffeScanData](self, "rffeScanData"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband rffeScanData](self, "rffeScanData"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("rffeScanData"));

  }
}

- (id)cellularCallStatistics
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v9;
  const char *v10;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[ComponentBaseband cellularCallStatistics]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v4 = (void *)objc_opt_new(DSCallStatisticsAggregator);
  objc_msgSend(v4, "beginAggregation");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getSynchronousResult"));
  v6 = dictionaryOrNull(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)IMEI
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentBaseband IMEI]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("InternationalMobileEquipmentIdentity"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)MEID
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentBaseband MEID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("MobileEquipmentIdentifier"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)ICCID
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentBaseband ICCID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("IntegratedCircuitCardIdentifier"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)eUICC
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v11;
  const char *v12;

  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[ComponentBaseband eUICC]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband preflightData](self, "preflightData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("EUICCCSN")));

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "base64EncodedStringWithOptions:", 0));
  else
    v7 = 0;
  v8 = stringOrNull(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)eUICCChipID
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  const char *v11;

  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ComponentBaseband eUICCChipID]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband preflightData](self, "preflightData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("EUICCChipID")));
  v7 = stringOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)eUICCFwUpdateCurrentVersion
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v11;
  const char *v12;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[ComponentBaseband eUICCFwUpdateCurrentVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("BasebandFirmwareUpdateInfo"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kVinylFwUpdateCurrentVersion")));
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "base64EncodedStringWithOptions:", 0));
  else
    v7 = 0;
  v8 = stringOrNull(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)eUICCFwUpdateGoldFwMac
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v11;
  const char *v12;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[ComponentBaseband eUICCFwUpdateGoldFwMac]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("BasebandFirmwareUpdateInfo"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kVinylFwUpdateGoldFwMac")));
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "base64EncodedStringWithOptions:", 0));
  else
    v7 = 0;
  v8 = stringOrNull(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)eUICCFwUpdateLoaderVersion
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v11;
  const char *v12;

  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[ComponentBaseband eUICCFwUpdateLoaderVersion]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband preflightData](self, "preflightData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EUICCFirmwareLoaderVersion")));

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "base64EncodedStringWithOptions:", 0));
  else
    v7 = 0;
  v8 = stringOrNull(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)eUICCFwUpdateOperationMode
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  const char *v11;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ComponentBaseband eUICCFwUpdateOperationMode]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("BasebandFirmwareUpdateInfo"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kVinylFwUpdateOperationMode")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
  v7 = stringOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)simStatus
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentBaseband simStatus]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("SIMStatus"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)simTrayStatus
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentBaseband simTrayStatus]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("SIMTrayStatus"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)secondSimStatus
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentBaseband secondSimStatus]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("b2BKAEe88VRfp2WXEjJOyA"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)secondSimTrayStatus
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentBaseband secondSimTrayStatus]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("sHiXbHqHvvRS3I/qo/rH2Q"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)basebandFirmwareVersion
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentBaseband basebandFirmwareVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("BasebandFirmwareVersion"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)serialNumber
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ComponentBaseband serialNumber]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return (id)MGCopyAnswer(CFSTR("BasebandUniqueId"), 0);
}

- (id)rffeScanData
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  void *v28;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentBaseband telephonyClient](self, "telephonyClient"));
  v26 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getBasebandRadioFrequencyFrontEndScanData:", &v26));
  v6 = v26;

  if (v5 || !v6)
  {
    v23 = DiagnosticLogHandleForCategory(6);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unable to get RFFE Scan Data from CoreTelephony Client: %@", buf, 0xCu);
    }

    v22 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "version")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("version"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hwPrdId")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("hwPrdId"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hwSku")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hwSku"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hwRev")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("hwRev"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hwHousing")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hwHousing"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "rfcInitPass")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("rfcInitPass"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "rfcHwid")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("rfcHwid"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "rfcRev")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("rfcRev"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "rfcMmwHwid")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("rfcMmwHwid"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "rfcMmwRev")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("rfcMmwRev"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "rffeScanPass")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("rffeScanPass"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "numExpectedDevices")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("numExpectedDevices"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "numDetectedDevices")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numDetectedDevices"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "numMissingDevices")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numMissingDevices"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rffeScanInfo"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("rffeScanInfo"));

    v22 = v3;
  }

  return v22;
}

- (NSDictionary)preflightData
{
  return self->_preflightData;
}

- (void)setPreflightData:(id)a3
{
  objc_storeStrong((id *)&self->_preflightData, a3);
}

- (OS_dispatch_queue)telephonyClientQueue
{
  return self->_telephonyClientQueue;
}

- (void)setTelephonyClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClientQueue, a3);
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_telephonyClientQueue, 0);
  objc_storeStrong((id *)&self->_preflightData, 0);
}

@end
