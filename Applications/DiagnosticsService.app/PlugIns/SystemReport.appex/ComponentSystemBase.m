@implementation ComponentSystemBase

- (BOOL)isPresent
{
  return 1;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSNumber *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase systemUptime](self, "systemUptime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v5, CFSTR("systemUptime"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase ECID](self, "ECID"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v6, CFSTR("ecid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase deviceColor](self, "deviceColor"));
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v7, CFSTR("deviceColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase deviceType](self, "deviceType"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v8, CFSTR("deviceType"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase deviceVersion](self, "deviceVersion"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v9, CFSTR("deviceVersion"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase cpuArchitecture](self, "cpuArchitecture"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v10, CFSTR("cpuArchitecture"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase UDID](self, "UDID"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v11, CFSTR("udid"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase modelNumber](self, "modelNumber"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v12, CFSTR("modelNumber"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase regulatoryModelNumber](self, "regulatoryModelNumber"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v13, CFSTR("regulatoryModelNumber"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase buildVersion](self, "buildVersion"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v14, CFSTR("systemBuild"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase diagnosticsBuild](self, "diagnosticsBuild"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v15, CFSTR("diagnosticsBuild"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase systemVersion](self, "systemVersion"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, CFSTR("systemVersion"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase serialNumber](self, "serialNumber"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v17, CFSTR("deviceSerialNumber"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase serialNumber](self, "serialNumber"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v18, CFSTR("serialNumber"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase diagnosticsVersion](self, "diagnosticsVersion"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v19, CFSTR("diagnosticsVersion"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase lastRestoreDate](self, "lastRestoreDate"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v20, CFSTR("lastRestoreDate"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase lastUpdateDate](self, "lastUpdateDate"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v21, CFSTR("lastUpdateDate"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase lastEraseDate](self, "lastEraseDate"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v22, CFSTR("lastEraseDate"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase setupCompletedDate](self, "setupCompletedDate"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v23, CFSTR("setupCompletedDate"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v25, CFSTR("localTimeZone"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase localTime](self, "localTime"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v26, CFSTR("localTime"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase marketingVersion](self, "marketingVersion"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v27, CFSTR("marketingVersion"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase chipID](self, "chipID"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v28, CFSTR("chipID"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystemBase isBetaBuild](self, "isBetaBuild")));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v29, CFSTR("isBetaBuild"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystemBase isInternalInstall](self, "isInternalInstall")));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v30, CFSTR("isInternalInstall"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystemBase isProdDevice](self, "isProdDevice")));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v31, CFSTR("isProdDevice"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystemBase isGreenTeaDevice](self, "isGreenTeaDevice")));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v32, CFSTR("greenTeaDevice"));

  v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", DiagnosticLogSubmissionEnabled());
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v34, CFSTR("analyticsEnabled"));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase storeDemoModeEnabled](self, "storeDemoModeEnabled"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v35, CFSTR("storeDemoModeEnabled"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase sikPublicKey](self, "sikPublicKey"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v36, CFSTR("sik"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase marketingProductNumber](self, "marketingProductNumber"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v37, CFSTR("marketingProductNumber"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase activationConfigurationInformation](self, "activationConfigurationInformation"));
  if (v38)
    objc_msgSend(v39, "addEntriesFromDictionary:", v38);

}

- (id)lastRestoreDate
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v12;
  const char *v13;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[ComponentSystemBase lastRestoreDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DSGeneralLogCollector latestUserLog](DSGeneralLogCollector, "latestUserLog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "restoreDate"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "formatterWithType:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v5));

  }
  else
  {
    v8 = 0;
  }
  v9 = stringOrNull(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)lastUpdateDate
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v12;
  const char *v13;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[ComponentSystemBase lastUpdateDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DSGeneralLogCollector latestUserLog](DSGeneralLogCollector, "latestUserLog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updateDate"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "formatterWithType:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v5));

  }
  else
  {
    v8 = 0;
  }
  v9 = stringOrNull(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)lastEraseDate
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v9;
  const char *v10;

  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[ComponentSystemBase lastEraseDate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase rootCreationDate](self, "rootCreationDate"));
  v6 = stringOrNull(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)deviceVersion
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
    v9 = "-[ComponentSystemBase deviceVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("ProductVersion"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)diagnosticsVersion
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
    v11 = "-[ComponentSystemBase diagnosticsVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString")));
  v7 = stringOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)marketingVersion
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
    v10 = "-[ComponentSystemBase marketingVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v4 = (void *)_CFCopySystemVersionDictionary();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _kCFSystemVersionProductVersionKey));
  v6 = stringOrNull(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)systemVersion
{
  uint64_t v2;
  NSObject *v3;
  _QWORD *v4;
  const char *label;
  id v6;
  void *v7;
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[ComponentSystemBase systemVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3032000000;
  v12 = sub_10002F0C8;
  v13 = sub_10002F0D8;
  v14 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002F0E0;
  v9[3] = &unk_100080C98;
  v9[4] = &buf;
  v4 = objc_retainBlock(v9);
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  if (label == dispatch_queue_get_label(0))
  {
    ((void (*)(_QWORD *))v4[2])(v4);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);

  }
  v6 = stringOrNull(*(void **)(*((_QWORD *)&buf + 1) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  _Block_object_dispose(&buf, 8);
  return v7;
}

- (id)diagnosticsBuild
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
    v11 = "-[ComponentSystemBase diagnosticsBuild]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleVersion")));
  v7 = stringOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)buildVersion
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
    v9 = "-[ComponentSystemBase buildVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("BuildVersion"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)modelNumber
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
    v9 = "-[ComponentSystemBase modelNumber]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("ModelNumber"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)regulatoryModelNumber
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
    v9 = "-[ComponentSystemBase regulatoryModelNumber]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("RegulatoryModelNumber"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)UDID
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
    v9 = "-[ComponentSystemBase UDID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)serialNumber
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
    v9 = "-[ComponentSystemBase serialNumber]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)deviceType
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
    v9 = "-[ComponentSystemBase deviceType]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("ProductType"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)cpuArchitecture
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
    v9 = "-[ComponentSystemBase cpuArchitecture]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("CPUArchitecture"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)deviceColor
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v6;
  const char *v7;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ComponentSystemBase deviceColor]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("DeviceColor"), 0);
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("unknown")))
  {

    v4 = 0;
  }
  return v4;
}

- (id)systemUptime
{
  uint64_t v2;
  NSObject *v3;
  timeval v5;
  size_t v6;
  int v7[2];
  uint8_t buf[24];

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[ComponentSystemBase systemUptime]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_OWORD *)buf = 0uLL;
  *(_QWORD *)v7 = 0x1500000001;
  v6 = 16;
  if (sysctl(v7, 2u, buf, &v6, 0, 0))
    return &off_1000B2BC0;
  v5.tv_sec = 0;
  *(_QWORD *)&v5.tv_usec = 0;
  gettimeofday(&v5, 0);
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)(1000000000 * (v5.tv_sec - *(_QWORD *)buf)+ 1000 * (v5.tv_usec - (uint64_t)*(int *)&buf[8]))/ 1000000000.0));
}

- (id)ECID
{
  uint64_t v2;
  NSObject *v3;
  NSString *v4;
  uint8_t buf[4];
  const char *v7;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ComponentSystemBase ECID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llx"), MGGetSInt64Answer(CFSTR("UniqueChipID"), 0));
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)marketingName
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
    v9 = "-[ComponentSystemBase marketingName]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("marketing-name"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)setupCompletedDate
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v12;
  const char *v13;

  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[ComponentSystemBase setupCompletedDate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase setupAssistantCompletionDate](self, "setupAssistantCompletionDate"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "formatterWithType:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v5));

  }
  else
  {
    v8 = 0;
  }
  v9 = stringOrNull(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)productClass
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
    v6 = "-[ComponentSystemBase productClass]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return (id)MGCopyAnswer(CFSTR("DeviceName"), 0);
}

- (id)rootCreationDate
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[ComponentSystemBase rootCreationDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  if (+[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive"))
  {
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lastEraseDate Component ignored on checkerboard", (uint8_t *)&v12, 2u);
    }
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributesOfItemAtPath:error:", CFSTR("/private/var/"), 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v5, "objectForKey:", NSFileCreationDate));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "formatterWithType:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate:", v8));

  }
  return v6;
}

- (id)localTime
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[ComponentSystemBase localTime]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (!v4)
  {
    v5 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Current date is nil.", (uint8_t *)&v11, 2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formatterWithType:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v4));

  return v9;
}

- (id)setupAssistantCompletionDate
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
    v6 = "-[ComponentSystemBase setupAssistantCompletionDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return (id)(id)CFPreferencesCopyAppValue(CFSTR("SetupLastExit"), CFSTR("com.apple.purplebuddy"));
}

- (BOOL)isSetupAssistantCompleted
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int v9;
  const char *v10;

  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[ComponentSystemBase isSetupAssistantCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase setupAssistantCompletionDate](self, "setupAssistantCompletionDate"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v7 = objc_msgSend(v5, "isEqual:", v6) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)chipID
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
    v9 = "-[ComponentSystemBase chipID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("ChipID"), 0);
  v5 = numberOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)isBetaBuild
{
  if (qword_1000BA0C8 != -1)
    dispatch_once(&qword_1000BA0C8, &stru_100080CE0);
  return byte_1000BA0C0;
}

- (BOOL)isInternalInstall
{
  if (qword_1000BA0D0 != -1)
    dispatch_once(&qword_1000BA0D0, &stru_100080D00);
  return byte_1000BA0C1;
}

- (BOOL)isProdDevice
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  const char *v7;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ComponentSystemBase isProdDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  return MGGetBoolAnswer(CFSTR("SigningFuse"), v4);
}

- (BOOL)isGreenTeaDevice
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  const char *v7;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ComponentSystemBase isGreenTeaDevice]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  return MGGetBoolAnswer(CFSTR("green-tea"), v4);
}

- (id)storeDemoModeEnabled
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v9;
  const char *v10;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[ComponentSystemBase storeDemoModeEnabled]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.demo-settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("StoreDemoMode")));
  v6 = v5;
  if (!v5)
    v5 = &__kCFBooleanFalse;
  v7 = v5;

  return v7;
}

- (id)activationConfigurationInformation
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  char *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  const char *v22;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[ComponentSystemBase activationConfigurationInformation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (!+[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive"))
  {
    v18 = 0;
    v7 = MAECopyActivationRecordWithError(&v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v5 = v18;
    if (v5)
    {
      v9 = DiagnosticLogHandleForCategory(6);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject description](v5, "description"));
        *(_DWORD *)buf = 138412290;
        v22 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not get activation record with error: %@", buf, 0xCu);

      }
    }
    else
    {
      if (v8)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags")));
        v12 = objc_msgSend(v11, "intValue");
        v13 = (v12 >> 2) & 1;
        v19[0] = CFSTR("demoActivated");
        v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (v12 >> 1) & 1));
        v19[1] = CFSTR("pointOfSaleActivated");
        v20[0] = v10;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
        v20[1] = v14;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

        goto LABEL_13;
      }
      v16 = DiagnosticLogHandleForCategory(6);
      v10 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error: activation record is NULL", buf, 2u);
      }
    }
    v11 = 0;
    v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v4 = DiagnosticLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activation configuration is not available in CheckerBoard", buf, 2u);
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (id)sikPublicKey
{
  uint64_t v2;
  NSObject *v3;
  __SecKey *v4;
  __SecKey *v5;
  __SecKey *v6;
  CFDataRef v7;
  void *v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v16;
  NSObject *v17;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v20;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = (CFErrorRef)"-[ComponentSystemBase sikPublicKey]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  error = 0;
  v4 = (__SecKey *)SecKeyCopySystemKey(0, &error);
  if (!v4)
  {
    v11 = DiagnosticLogHandleForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = error;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to retrieve SIK Key with error: %@", buf, 0xCu);
    }

    CFRelease(error);
    return &stru_10009EB48;
  }
  v5 = SecKeyCopyPublicKey(v4);
  if (!v5)
  {
    v13 = DiagnosticLogHandleForCategory(6);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to retrieve public SIK Key.", buf, 2u);
    }

    return &stru_10009EB48;
  }
  v6 = v5;
  v7 = SecKeyCopyExternalRepresentation(v5, &error);
  CFRelease(v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v7, "base64EncodedStringWithOptions:", 0));
    v9 = stringOrNull(v8);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);

  }
  else
  {
    v16 = DiagnosticLogHandleForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = error;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve data for public SIK key with error: %@", buf, 0xCu);
    }

    CFRelease(error);
    v10 = &stru_10009EB48;
  }

  return v10;
}

- (id)marketingProductNumber
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemBase modelNumber](self, "modelNumber"));
  if (v2)
  {
    v3 = (void *)MGCopyAnswer(CFSTR("RegionInfo"), 0);
    v4 = stringOrNull(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", v5));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
