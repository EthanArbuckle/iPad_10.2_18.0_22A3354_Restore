@implementation ComponentHostSystem

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
  v24.super_class = (Class)ComponentHostSystem;
  -[ComponentSystemBase populateAttributes:](&v24, "populateAttributes:", v4);
  -[ComponentHostSystem _setupTelephonyClient](self, "_setupTelephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem carrierName](self, "carrierName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("carrierName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem carrierName2](self, "carrierName2"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("carrierName2"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem carrierBundleVersion](self, "carrierBundleVersion"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("carrierBundleVersion"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentHostSystem isInDiagnosticsMode](self, "isInDiagnosticsMode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("inDiagnosticsMode"));

  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", _AXSVoiceOverTouchEnabled() != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("voiceOverEnabled"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentHostSystem isServicePart](self, "isServicePart")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("isServicePart"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem localeCode](self, "localeCode"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("regionCode"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem languageCode](self, "languageCode"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("languageCode"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentHostSystem supportsInductiveCharging](self, "supportsInductiveCharging")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("supportsInductiveCharging"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem supplementalBuildVersion](self, "supplementalBuildVersion"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("supplementalBuildVersion"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem productVersionExtra](self, "productVersionExtra"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("productVersionExtra"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentHostSystem isInBoxUpdateEligibleMode](self, "isInBoxUpdateEligibleMode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("isInBoxUpdateEligibleMode"));

  if (!-[ComponentHostSystem isInDiagnosticsMode](self, "isInDiagnosticsMode"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem currentStandbyTime](self, "currentStandbyTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("currentStandbyTime"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem currentUsageTime](self, "currentUsageTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringValue"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("currentUsageTime"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentHostSystem isPasscodeLocked](self, "isPasscodeLocked")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("isPasscodeLocked"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentHostSystem isPasscodeSet](self, "isPasscodeSet")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("isPasscodeSet"));

  }
}

- (id)carrierName
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem carrierNameForSimCard:](self, "carrierNameForSimCard:", 0));
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)carrierName2
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem carrierNameForSimCard:](self, "carrierNameForSimCard:", 1));
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
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];

  v3 = DiagnosticLogHandleForCategory(6, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ComponentHostSystem carrierBundleVersion]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[ComponentHostSystem telephonyClient](self, "telephonyClient"));
  if (!v5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem subscriptionInfo](self, "subscriptionInfo"));

  if (!v7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem subscriptionInfo](self, "subscriptionInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subscriptions"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v32;
    *(_QWORD *)&v12 = 138412546;
    v29 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem telephonyClient](self, "telephonyClient", v29));
        v30 = 0;
        v18 = objc_msgSend(v17, "copyCarrierBundleVersion:error:", v16, &v30);
        v19 = (char *)v30;

        if (v19)
        {
          v21 = DiagnosticLogHandleForCategory(6, v20);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_msgSend(v16, "slotID");
            *(_DWORD *)buf = v29;
            v36 = v19;
            v37 = 2048;
            v38 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "copyCarrierBundleVersion failed: error: %@ on slot: %ld", buf, 0x16u);
          }
        }
        else
        {
          v22 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v16, "slotID")));
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v22);
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v13);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "componentsJoinedByString:", CFSTR("; ")));

  v26 = stringOrNull(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  return v27;
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

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[ComponentHostSystem currentStandbyTime]";
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

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[ComponentHostSystem currentUsageTime]";
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

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ComponentHostSystem isInDiagnosticsMode]";
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
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v32;
  NSObject *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  NSObject *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;

  v4 = DiagnosticLogHandleForCategory(6, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[ComponentHostSystem carrierNameForSimCard:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = objc_claimAutoreleasedReturnValue(-[ComponentHostSystem telephonyClient](self, "telephonyClient"));
  if (!v6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem subscriptionInfo](self, "subscriptionInfo"));

  if (!v8)
    return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v9 = 1;
  v41 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
  if (a3)
  {
    if (a3 != 1)
    {
      v32 = DiagnosticLogHandleForCategory(6, v10);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v49 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Requested sim card slot %ld is not present in CoreTelephony subscriptions", buf, 0xCu);
      }

      v34 = stringOrNull(0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v17 = 0;
      v30 = 0;
      goto LABEL_34;
    }
    v9 = 2;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem subscriptionInfo](self, "subscriptionInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subscriptionsInUse"));

  if (v12)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v14 = v12;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v15)
    {
      v16 = v15;
      v38 = v12;
      v17 = 0;
      v40 = 0;
      v18 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v20, "slotID") == (id)v9)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem telephonyClient](self, "telephonyClient"));
            v42 = v17;
            v22 = objc_msgSend(v21, "copyCarrierBundleValue:key:bundleType:error:", v20, CFSTR("CarrierName"), v41, &v42);
            v23 = v42;

            if (v22)
            {
              v25 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v22, v25) & 1) != 0)
              {
                v27 = v40;
                v40 = v22;
              }
              else
              {
                v29 = DiagnosticLogHandleForCategory(6, v26);
                v27 = objc_claimAutoreleasedReturnValue(v29);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = (const char *)v22;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Carrier name %@ is not a string!", buf, 0xCu);
                }
              }
            }
            else
            {
              v28 = DiagnosticLogHandleForCategory(6, v24);
              v27 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v49 = (const char *)a3;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No carrier name for card slot %ld", buf, 0xCu);
              }
            }

            v17 = v23;
          }
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v16);
      v12 = v38;
      v30 = v40;
      goto LABEL_33;
    }
  }
  else
  {
    v36 = DiagnosticLogHandleForCategory(6, v13);
    v14 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get subscriptions from subscription info", buf, 2u);
    }
  }
  v30 = 0;
  v17 = 0;
LABEL_33:

  v37 = stringOrNull(v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v37);

LABEL_34:
  return v35;
}

- (BOOL)isPasscodeLocked
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ComponentHostSystem isPasscodeLocked]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return MGGetBoolAnswer(CFSTR("PasswordProtected"));
}

- (BOOL)isPasscodeSet
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ComponentHostSystem isPasscodeSet]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return MGGetBoolAnswer(CFSTR("PasswordConfigured"));
}

- (BOOL)isServicePart
{
  uint64_t v2;
  NSObject *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned __int8 v11;
  uint64_t v12;
  char *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ComponentHostSystem isServicePart]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = +[DASoftLinking coreRepairClass:](DASoftLinking, "coreRepairClass:", CFSTR("CRRepairStatus"));
  if (v4)
  {
    v15 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class isServicePartWithError:](v4, "isServicePartWithError:", &v15));
    v8 = v15;
    if (v8)
    {
      v9 = DiagnosticLogHandleForCategory(6, v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject localizedDescription](v8, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error getting Service Part Status. Error: %@", buf, 0xCu);

      }
    }
    if (v6)
      v11 = objc_msgSend(v6, "isEqualToString:", CFSTR("1"));
    else
      v11 = 0;

  }
  else
  {
    v12 = DiagnosticLogHandleForCategory(6, v5);
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Repair data not available for this device, skipping.", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
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
  int v5;
  const char *v6;

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ComponentHostSystem supportsInductiveCharging]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return MGGetBoolAnswer(CFSTR("s7nuHoZIYNoOHCqT9iyZkQ"));
}

- (void)_setupTelephonyClient
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;

  v3 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  -[ComponentHostSystem setTelephonyClient:](self, "setTelephonyClient:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem telephonyClient](self, "telephonyClient"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentHostSystem telephonyClient](self, "telephonyClient"));
    v13 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getSubscriptionInfoWithError:", &v13));
    v8 = v13;
    -[ComponentHostSystem setSubscriptionInfo:](self, "setSubscriptionInfo:", v7);

    if (!v8)
      return;
    v10 = DiagnosticLogHandleForCategory(6, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CoreTelephonyClient getSubscriptionInfoWithError failed: error: %@", buf, 0xCu);
    }

  }
  else
  {
    v12 = DiagnosticLogHandleForCategory(6, v5);
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to create CoreTelephony client!", buf, 2u);
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

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentHostSystem supplementalBuildVersion]";
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

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ComponentHostSystem productVersionExtra]";
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
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[ComponentHostSystem isInBoxUpdateEligibleMode]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = objc_alloc_init((Class)MIBUClient);
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v6 = objc_msgSend(v4, "isInBoxUpdateMode:", &v12);
    v8 = (char *)v12;
    if (v8)
    {
      v9 = DiagnosticLogHandleForCategory(6, v7);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to check if we are in in-box update eligible mode with error %@", buf, 0xCu);
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
