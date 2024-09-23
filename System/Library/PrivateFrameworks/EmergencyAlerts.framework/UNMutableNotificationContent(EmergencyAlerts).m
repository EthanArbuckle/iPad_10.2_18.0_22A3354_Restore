@implementation UNMutableNotificationContent(EmergencyAlerts)

- (id)ea_timestampSubtitleForNow
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ea_timestampSubtitleForDate:locale:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ea_timestampSubtitleForDate:()EmergencyAlerts locale:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x24BDD1500];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("yMdjm"), 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDateFormat:", v9);
  objc_msgSend(v8, "stringFromDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)ea_defaultTitle
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", CFSTR("NOTIFICATION_TITLE"), 0);
}

- (id)ea_externalToneFileURLForTone:()EmergencyAlerts inBundle:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLForResource:withExtension:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ea_externalVibrationPatternFileURLForVibration:()EmergencyAlerts inBundle:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLForResource:withExtension:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ea_bundleForBundleIdentifier:()EmergencyAlerts
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a3;
  if (!v3)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
      -[UNMutableNotificationContent(EmergencyAlerts) ea_bundleForBundleIdentifier:].cold.1((uint64_t)v3, v5, v6);
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (void)ea_updateAlertCategory:()EmergencyAlerts
{
  void *v2;
  __CFString **v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "categoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("alert-configurable")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("alert-configurable-spinner")) & 1) != 0)
  {
    v3 = EACategoryIdentifierConfigurableAlertDetailed;
LABEL_7:
    objc_msgSend(a1, "setCategoryIdentifier:", *v3);
    goto LABEL_8;
  }
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("alert")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("alert-spinner")) & 1) != 0)
  {
    v3 = EACategoryIdentifierAlertDetailed;
    goto LABEL_7;
  }
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("igneous")) & 1) != 0)
  {
LABEL_8:
    v4 = (void *)EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      objc_msgSend(a1, "categoryIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_21A501000, v5, OS_LOG_TYPE_DEFAULT, "Alert Category updated: %@", (uint8_t *)&v8, 0xCu);

    }
    goto LABEL_10;
  }
  v7 = (void *)EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
    -[UNMutableNotificationContent(EmergencyAlerts) ea_updateAlertCategory:].cold.1(v7, a1);
LABEL_10:

}

- (void)ea_setAlertCategory:()EmergencyAlerts
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __CFString **v12;
  void *v13;
  void *v14;
  __CFString **v15;
  __CFString **v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDC2F38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("UserConfigurable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("SwitchName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Advanced Earthquake Alert")))
    {
      v10 = EALogDefault;
      if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_21A501000, v10, OS_LOG_TYPE_DEFAULT, "Overriding user configurable category to NO", (uint8_t *)&v20, 2u);
      }
      objc_msgSend(a1, "setCategoryIdentifier:", CFSTR("igneous"));
      goto LABEL_20;
    }
  }
  else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
  {
    -[UNMutableNotificationContent(EmergencyAlerts) ea_setAlertCategory:].cold.1();
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("kCTSMSAppleSafetyAlertData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = EACategoryIdentifierConfigurableAlertDetailed;
    if (!v7)
      v12 = EACategoryIdentifierAlertDetailed;
    objc_msgSend(a1, "setCategoryIdentifier:", *v12);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDC2F50]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ea_sendSafetyAlertTapIndication(v13, 1);

  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("kCTSMSAppleSafetyAlertSupport"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = EACategoryIdentifierConfigurableAlertSpinner;
      v16 = EACategoryIdentifierAlertSpinner;
    }
    else
    {
      v15 = EACategoryIdentifierConfigurableAlert;
      v16 = EACategoryIdentifierAlert;
    }
    if (!v7)
      v15 = v16;
    objc_msgSend(a1, "setCategoryIdentifier:", *v15);
  }
  v17 = (void *)EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    objc_msgSend(a1, "categoryIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_21A501000, v18, OS_LOG_TYPE_DEFAULT, "Alert Category: %@", (uint8_t *)&v20, 0xCu);

  }
LABEL_20:

}

- (id)ea_getUpdatedBodyString:()EmergencyAlerts withMessageDictionary:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t v16[16];

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("kCTSMSAppleSafetyAlertData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CmamText"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CmamLongText"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (!(v8 | v9))
    {
      if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
        -[UNMutableNotificationContent(EmergencyAlerts) ea_getUpdatedBodyString:withMessageDictionary:].cold.2();
      v14 = v5;
      goto LABEL_17;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ReplaceAlertBodyWithCmamLongText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "BOOLValue")
      && objc_msgSend(v5, "rangeOfString:", v8) != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v5, "rangeOfString:", v9) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = objc_msgSend((id)v9, "length");
      if (v11 > objc_msgSend((id)v8, "length"))
      {
        objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v8, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = EALogDefault;
        if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_21A501000, v13, OS_LOG_TYPE_DEFAULT, "Alert body updated with CMAM long text", v16, 2u);
        }
        goto LABEL_16;
      }
      if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
        -[UNMutableNotificationContent(EmergencyAlerts) ea_getUpdatedBodyString:withMessageDictionary:].cold.1();
    }
    v12 = v5;
LABEL_16:
    v14 = v12;

LABEL_17:
    goto LABEL_18;
  }
  v14 = v5;
LABEL_18:

  return v14;
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("kCTSMSAppleSafetyAlertData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("Instruction"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 && os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
        -[UNMutableNotificationContent(EmergencyAlerts) ea_updateUserInfo:withMessageDictionary:].cold.4();
      objc_msgSend(v8, "objectForKey:", CFSTR("ExpiryTimestamp"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("EffectiveTimestamp"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("Instruction"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("ExpiryTimestamp"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("EffectiveTimestamp"));
          v12 = EALogDefault;
          if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_21A501000, v12, OS_LOG_TYPE_DEFAULT, "User Info updated with Apple safety alert", v14, 2u);
          }
        }
        else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
        {
          -[UNMutableNotificationContent(EmergencyAlerts) ea_updateUserInfo:withMessageDictionary:].cold.3();
        }

      }
      else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
      {
        -[UNMutableNotificationContent(EmergencyAlerts) ea_updateUserInfo:withMessageDictionary:].cold.2();
      }

    }
    else if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_ERROR))
    {
      -[UNMutableNotificationContent(EmergencyAlerts) ea_updateUserInfo:withMessageDictionary:].cold.1();
    }
  }
  else
  {
    v13 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A501000, v13, OS_LOG_TYPE_DEFAULT, "No Apple safety alert data", buf, 2u);
    }
  }
  objc_msgSend(a1, "setUserInfo:", v6);

}

- (void)ea_setPropertiesForCellBroadcastMessage:()EmergencyAlerts withActivePhoneCall:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  unint64_t i;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  const __CFString *v43;
  double v44;
  double v45;
  void *v46;
  NSObject *v47;
  int v48;
  void *v49;
  void *v50;
  NSObject *v51;
  int v52;
  int v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  void *v74;
  void *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint8_t buf[4];
  _BYTE v85[10];
  __int16 v86;
  void *v87;
  __int16 v88;
  int v89;
  _QWORD v90[7];

  v90[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F68]);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F70]);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ea_getUpdatedBodyString:withMessageDictionary:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  v69 = (void *)v7;
  v70 = (void *)v6;
  if (!v10)
  {
    v90[0] = v7;
    v90[1] = CFSTR(":\n");
    v90[2] = v6;
    v90[3] = CFSTR("\n\n");
    v90[4] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", &stru_24DCD11E0);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F48]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v61) = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F40]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F28]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F38]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("SoundIsMutableInDND"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v14, "objectForKey:", CFSTR("SoundAlertDeviceInMute"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v61) = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v14, "objectForKey:", CFSTR("ShowTimestamp"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v14, "objectForKey:", CFSTR("SoundAlertPeriod"));
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("NotificationTitle"));
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F30]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", CFSTR("PlaySoundUntilAcknowledged"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v23, "BOOLValue");

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC2F60]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v24;
  if (v24)
  {
    v25 = v24;
  }
  else
  {
    objc_msgSend(v22, "objectForKey:", CFSTR("Sound"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v81 = v25;
  objc_msgSend(v22, "objectForKey:", CFSTR("OverrideAccessibilityVibrationSetting"), v61);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "objectForKey:", CFSTR("Vibration"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v22;
  objc_msgSend(v22, "objectForKey:", CFSTR("SystemSound"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v26;
  v27 = (void *)v21;
  if (v26)
    v28 = objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("TEXT"));
  else
    v28 = 0;
  objc_msgSend(v77, "objectForKey:", CFSTR("AllowCallAudioInterruption"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v29, "BOOLValue");

  v30 = (uint64_t)v27;
  if (!objc_msgSend(v27, "length"))
  {
    objc_msgSend(a1, "ea_defaultTitle");
    v30 = objc_claimAutoreleasedReturnValue();

  }
  v71 = (void *)v20;
  if (v19)
  {
    objc_msgSend(a1, "ea_timestampSubtitleForNow");
    v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v76 = &stru_24DCD11E0;
  }
  v31 = v9;
  objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; objc_msgSend(v31, "length") > i; ++i)
  {
    if (objc_msgSend(v32, "characterIsMember:", objc_msgSend(v31, "characterAtIndex:", i)))
      break;
  }
  objc_msgSend(v31, "substringFromIndex:", i);
  v34 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setTitle:", v30);
  objc_msgSend(a1, "setSubtitle:", v76);
  v65 = (void *)v34;
  objc_msgSend(a1, "setBody:", v34);
  objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:", v16 ^ 1u);
  objc_msgSend(a1, "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(a1, "setShouldPreemptPresentedNotification:", 1);
  if (v79)
  {
    v35 = EALogDefault;
    if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v85 = v79;
      _os_log_impl(&dword_21A501000, v35, OS_LOG_TYPE_DEFAULT, "Setting speech language to: %@", buf, 0xCu);
    }
    objc_msgSend(a1, "setSpeechLanguage:", v79);
  }
  objc_msgSend(a1, "ea_bundleForBundleIdentifier:", v82);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ea_externalToneFileURLForTone:inBundle:", v81);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)v30;
  if (v28)
  {
    objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v80;
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 18);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v38;
  if (((v64 | a4 ^ 1) & 1) == 0)
    objc_msgSend(v38, "setAlertTopic:", *MEMORY[0x24BEB8D08]);
  objc_msgSend(v14, "objectForKey:", CFSTR("AlwaysDeliverPref"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("AlwaysDeliverPref"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "BOOLValue");

  }
  else
  {
    v41 = HIDWORD(v62) | v63 | v62;
  }
  objc_msgSend(v36, "setShouldIgnoreRingerSwitch:", v41);
  v42 = EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v43 = CFSTR("NO");
    if ((_DWORD)v41)
      v43 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v85 = v43;
    _os_log_impl(&dword_21A501000, v42, OS_LOG_TYPE_DEFAULT, "Always Deliver: %@", buf, 0xCu);
  }
  if (v63)
  {
    objc_msgSend(v36, "setShouldRepeat:", 1);
    v37 = v80;
  }
  else
  {
    v37 = v80;
    if (v71)
    {
      objc_msgSend(v36, "setShouldRepeat:", 1);
      objc_msgSend(v71, "doubleValue");
      v45 = v44 / 1000.0;
    }
    else
    {
      objc_msgSend(v36, "setShouldRepeat:", 0);
      v45 = 14.0;
    }
    objc_msgSend(v36, "setMaximumDuration:", v45);
  }
  if ((a4 & v64) == 1)
    goto LABEL_42;
  if (v78)
  {
    objc_msgSend(v36, "setToneFileURL:");
  }
  else if ((objc_msgSend(v81, "isEqualToString:", CFSTR("Text")) & 1) == 0)
  {
LABEL_42:
    objc_msgSend(v36, "setToneIdentifier:", *MEMORY[0x24BEB8DD0]);
  }
LABEL_46:
  objc_msgSend(v36, "setShouldIgnoreAccessibilityDisabledVibrationSetting:", v73 != 0);
  v46 = (void *)EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v47 = v46;
    v48 = objc_msgSend(v36, "shouldIgnoreAccessibilityDisabledVibrationSetting");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v85 = v48;
    _os_log_impl(&dword_21A501000, v47, OS_LOG_TYPE_DEFAULT, "Setting alert override-accessibility-vibration: %{BOOL}d", buf, 8u);

  }
  objc_msgSend(a1, "ea_externalVibrationPatternFileURLForVibration:inBundle:", v37, v75);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend(v36, "setVibrationPatternFileURL:", v49);
  }
  else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("Default")) & 1) == 0)
  {
    objc_msgSend(v36, "setVibrationIdentifier:", *MEMORY[0x24BEB8DD8]);
  }
  v50 = (void *)EALogDefault;
  v74 = v14;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v51 = v50;
    v52 = objc_msgSend(v36, "shouldIgnoreRingerSwitch");
    v53 = objc_msgSend(v36, "shouldRepeat");
    v54 = v5;
    v55 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v36, "maximumDuration");
    objc_msgSend(v55, "numberWithDouble:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v85 = v52;
    *(_WORD *)&v85[4] = 1024;
    *(_DWORD *)&v85[6] = v53;
    v14 = v74;
    v86 = 2114;
    v87 = v56;
    v88 = 1024;
    v89 = a4;
    _os_log_impl(&dword_21A501000, v51, OS_LOG_TYPE_DEFAULT, "Setting alert sound: prevent-muting: %{BOOL}d, repeat: %{BOOL}d, max-duration: %{public}@, active-call: %{BOOL}d", buf, 0x1Eu);

    v5 = v54;
  }
  objc_msgSend(a1, "setSound:", v36);
  objc_msgSend(v83, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("FromPhone"));
  objc_msgSend(v14, "objectForKey:", CFSTR("SoundIsMutableInRelayMode"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
    objc_msgSend(v83, "setObject:forKey:", v57, CFSTR("SoundIsMutableInRelayMode"));
  if (v82)
    objc_msgSend(v83, "setObject:forKey:", v82, CFSTR("carrierBundleIdentifier"));
  objc_msgSend(v78, "path");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
    objc_msgSend(v83, "setObject:forKey:", v58, CFSTR("externalToneFileURL"));
  if (v81)
    objc_msgSend(v83, "setObject:forKey:", v81, CFSTR("externalToneFileName"));
  objc_msgSend(v49, "path");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    objc_msgSend(v83, "setObject:forKey:", v59, CFSTR("externalVibrationPatternFileURL"));
  if (v80)
    objc_msgSend(v83, "setObject:forKey:", v80, CFSTR("externalVibrationPatternFileName"));
  objc_msgSend(a1, "ea_updateUserInfo:withMessageDictionary:", v83, v5);
  objc_msgSend(a1, "ea_setAlertCategory:", v5);
  v60 = EALogDefault;
  if (os_log_type_enabled((os_log_t)EALogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v85 = v83;
    _os_log_impl(&dword_21A501000, v60, OS_LOG_TYPE_DEFAULT, "UserInfo dict: %@", buf, 0xCu);
  }

}

- (void)ea_bundleForBundleIdentifier:()EmergencyAlerts .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_21A501000, a2, a3, "Cannot find bundle for %{public}@", (uint8_t *)&v3);
}

- (void)ea_updateAlertCategory:()EmergencyAlerts .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "categoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_3(&dword_21A501000, v3, v5, "Alert category: %@", (uint8_t *)&v6);

}

- (void)ea_setAlertCategory:()EmergencyAlerts .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Failed to get switch name.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ea_getUpdatedBodyString:()EmergencyAlerts withMessageDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "CMAM long text shorter than CMAM text", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ea_getUpdatedBodyString:()EmergencyAlerts withMessageDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Missing CmamLongText and CmamText in AppleSafetyAlert dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Missing currentUserInfo dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Missing expiry timestamp in Apple safety alert dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Missing effective timestamp in Apple safety alert dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ea_updateUserInfo:()EmergencyAlerts withMessageDictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A501000, v0, v1, "Missing instruction in Apple safety alert dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
