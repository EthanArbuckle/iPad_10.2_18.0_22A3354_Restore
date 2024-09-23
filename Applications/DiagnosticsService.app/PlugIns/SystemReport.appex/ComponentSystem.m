@implementation ComponentSystem

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSNumber *v9;
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
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ComponentSystem;
  -[ComponentSystemBase populateAttributes:](&v24, "populateAttributes:", v4);
  -[ComponentSystem _setupTelephonyClient](self, "_setupTelephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem carrierName](self, "carrierName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("carrierName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem carrierName2](self, "carrierName2"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("carrierName2"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem carrierBundleVersion](self, "carrierBundleVersion"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("carrierBundleVersion"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystem isInDiagnosticsMode](self, "isInDiagnosticsMode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("inDiagnosticsMode"));

  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", _AXSVoiceOverTouchEnabled() != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("voiceOverEnabled"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystem isServicePart](self, "isServicePart")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("isServicePart"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem localeCode](self, "localeCode"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("regionCode"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem languageCode](self, "languageCode"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("languageCode"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystem supportsInductiveCharging](self, "supportsInductiveCharging")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("supportsInductiveCharging"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem supplementalBuildVersion](self, "supplementalBuildVersion"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("supplementalBuildVersion"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem productVersionExtra](self, "productVersionExtra"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("productVersionExtra"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystem isInBoxUpdateEligibleMode](self, "isInBoxUpdateEligibleMode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("isInBoxUpdateEligibleMode"));

  if (!-[ComponentSystem isInDiagnosticsMode](self, "isInDiagnosticsMode"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem currentStandbyTime](self, "currentStandbyTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("currentStandbyTime"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem currentUsageTime](self, "currentUsageTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("currentUsageTime"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystem isPasscodeLocked](self, "isPasscodeLocked")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("isPasscodeLocked"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentSystem isPasscodeSet](self, "isPasscodeSet")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("isPasscodeSet"));

  }
}

- (id)carrierName
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem carrierNameForSimCard:](self, "carrierNameForSimCard:", 0));
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)carrierName2
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem carrierNameForSimCard:](self, "carrierNameForSimCard:", 1));
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)carrierBundleVersion
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];

  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[ComponentSystem carrierBundleVersion]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[ComponentSystem telephonyClient](self, "telephonyClient"));
  if (!v5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem subscriptionInfo](self, "subscriptionInfo"));

  if (!v7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem subscriptionInfo](self, "subscriptionInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subscriptions"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v31;
    *(_QWORD *)&v12 = 138412546;
    v28 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem telephonyClient](self, "telephonyClient", v28));
        v29 = 0;
        v18 = objc_msgSend(v17, "copyCarrierBundleVersion:error:", v16, &v29);
        v19 = (char *)v29;

        if (v19)
        {
          v20 = DiagnosticLogHandleForCategory(6);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_msgSend(v16, "slotID");
            *(_DWORD *)buf = v28;
            v35 = v19;
            v36 = 2048;
            v37 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "copyCarrierBundleVersion failed: error: %@ on slot: %ld", buf, 0x16u);
          }
        }
        else
        {
          v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v16, "slotID")));
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v21);
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v13);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", CFSTR("; ")));

  v25 = stringOrNull(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  return v26;
}

- (id)currentStandbyTime
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  __int16 v11;
  uint8_t buf[4];
  const char *v13;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[ComponentSystem currentStandbyTime]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11 = 0;
  *(_DWORD *)buf = -1082130432;
  v10 = -1082130432;
  v4 = SBSSpringBoardServerPort();
  SBGetBatteryUsageTimesInSeconds(v4, buf, &v10, (char *)&v11 + 1, &v11);
  LODWORD(v5) = v10;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  v7 = numberOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)currentUsageTime
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  __int16 v11;
  uint8_t buf[4];
  const char *v13;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[ComponentSystem currentUsageTime]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11 = 0;
  *(_DWORD *)buf = -1082130432;
  v10 = -1082130432;
  v4 = SBSSpringBoardServerPort();
  SBGetBatteryUsageTimesInSeconds(v4, buf, &v10, (char *)&v11 + 1, &v11);
  LODWORD(v5) = *(_DWORD *)buf;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  v7 = numberOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (BOOL)isInDiagnosticsMode
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
    v6 = "-[ComponentSystem isInDiagnosticsMode]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return +[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive");
}

- (id)carrierNameForSimCard:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v28;
  NSObject *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  NSObject *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;

  v4 = DiagnosticLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[ComponentSystem carrierNameForSimCard:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = objc_claimAutoreleasedReturnValue(-[ComponentSystem telephonyClient](self, "telephonyClient"));
  if (!v6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem subscriptionInfo](self, "subscriptionInfo"));

  if (!v8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v9 = 1;
  v37 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
  if (a3)
  {
    if (a3 != 1)
    {
      v28 = DiagnosticLogHandleForCategory(6);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v45 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Requested sim card slot %ld is not present in CoreTelephony subscriptions", buf, 0xCu);
      }

      v30 = stringOrNull(0);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v15 = 0;
      v26 = 0;
      goto LABEL_34;
    }
    v9 = 2;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem subscriptionInfo](self, "subscriptionInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subscriptionsInUse"));

  if (v11)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = v11;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v13)
    {
      v14 = v13;
      v34 = v11;
      v15 = 0;
      v36 = 0;
      v16 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v18, "slotID") == (id)v9)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem telephonyClient](self, "telephonyClient"));
            v38 = v15;
            v20 = objc_msgSend(v19, "copyCarrierBundleValue:key:bundleType:error:", v18, CFSTR("CarrierName"), v37, &v38);
            v21 = v38;

            if (v20)
            {
              v22 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
              {
                v23 = v36;
                v36 = v20;
              }
              else
              {
                v25 = DiagnosticLogHandleForCategory(6);
                v23 = objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = (const char *)v20;
                  _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Carrier name %@ is not a string!", buf, 0xCu);
                }
              }
            }
            else
            {
              v24 = DiagnosticLogHandleForCategory(6);
              v23 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v45 = (const char *)a3;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No carrier name for card slot %ld", buf, 0xCu);
              }
            }

            v15 = v21;
          }
        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v14);
      v11 = v34;
      v26 = v36;
      goto LABEL_33;
    }
  }
  else
  {
    v32 = DiagnosticLogHandleForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to get subscriptions from subscription info", buf, 2u);
    }
  }
  v26 = 0;
  v15 = 0;
LABEL_33:

  v33 = stringOrNull(v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v33);

LABEL_34:
  return v31;
}

- (BOOL)isPasscodeLocked
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
    v7 = "-[ComponentSystem isPasscodeLocked]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  return MGGetBoolAnswer(CFSTR("PasswordProtected"), v4);
}

- (BOOL)isPasscodeSet
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
    v7 = "-[ComponentSystem isPasscodeSet]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  return MGGetBoolAnswer(CFSTR("PasswordConfigured"), v4);
}

- (BOOL)isServicePart
{
  uint64_t v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned __int8 v9;
  uint64_t v10;
  char *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ComponentSystem isServicePart]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = +[DASoftLinking coreRepairClass:](DASoftLinking, "coreRepairClass:", CFSTR("CRRepairStatus"));
  if (v4)
  {
    v13 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class isServicePartWithError:](v4, "isServicePartWithError:", &v13));
    v6 = v13;
    if (v6)
    {
      v7 = DiagnosticLogHandleForCategory(6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v6, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error getting Service Part Status. Error: %@", buf, 0xCu);

      }
    }
    if (v5)
      v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("1"));
    else
      v9 = 0;

  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Repair data not available for this device, skipping.", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)localeCode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localeIdentifier"));

  return v3;
}

- (id)languageCode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "languageCode"));

  return v3;
}

- (BOOL)supportsInductiveCharging
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
    v7 = "-[ComponentSystem supportsInductiveCharging]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  return MGGetBoolAnswer(CFSTR("s7nuHoZIYNoOHCqT9iyZkQ"), v4);
}

- (void)_setupTelephonyClient
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  NSObject *v13;

  v3 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  -[ComponentSystem setTelephonyClient:](self, "setTelephonyClient:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem telephonyClient](self, "telephonyClient"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystem telephonyClient](self, "telephonyClient"));
    v11 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSubscriptionInfoWithError:", &v11));
    v7 = v11;
    -[ComponentSystem setSubscriptionInfo:](self, "setSubscriptionInfo:", v6);

    if (!v7)
      return;
    v8 = DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "CoreTelephonyClient getSubscriptionInfoWithError failed: error: %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to create CoreTelephony client!", buf, 2u);
    }
  }

}

- (id)supplementalBuildVersion
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
    v9 = "-[ComponentSystem supplementalBuildVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("SupplementalBuildVersion"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)productVersionExtra
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
    v9 = "-[ComponentSystem productVersionExtra]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)MGCopyAnswer(CFSTR("ProductVersionExtra"), 0);
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)isInBoxUpdateEligibleMode
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;

  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[ComponentSystem isInBoxUpdateEligibleMode]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = objc_alloc_init((Class)MIBUClient);
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v6 = objc_msgSend(v4, "isInBoxUpdateMode:", &v11);
    v7 = (char *)v11;
    if (v7)
    {
      v8 = DiagnosticLogHandleForCategory(6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to check if we are in in-box update eligible mode with error %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (CTXPCServiceSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end
