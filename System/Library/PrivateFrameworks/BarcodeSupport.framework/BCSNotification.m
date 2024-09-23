@implementation BCSNotification

+ (id)notificationForAction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAction:", v4);

  return v5;
}

- (id)_initWithAction:(id)a3
{
  id v5;
  BCSNotification *v6;
  BCSNotification *v7;
  uint64_t v8;
  NSMutableDictionary *localActions;
  BCSNotification *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSNotification;
  v6 = -[BCSNotification init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    localActions = v7->_localActions;
    v7->_localActions = (NSMutableDictionary *)v8;

    v10 = v7;
  }

  return v7;
}

- (NSString)identifier
{
  NSString *identifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  identifier = self->_identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_identifier;
    self->_identifier = v5;

    identifier = self->_identifier;
  }
  return identifier;
}

- (int64_t)codeType
{
  return -[BCSAction codeType](self->_action, "codeType");
}

- (id)_title
{
  void *v3;
  uint64_t v4;
  BCSAction *action;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  id v9;

  -[BCSAction localizedDefaultActionTitle](self->_action, "localizedDefaultActionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  action = self->_action;
  if (!v4)
  {
    v6 = -[BCSAction codeType](action, "codeType");
    switch(v6)
    {
      case 3:
        -[BCSNotification _actionTypeStringForQRCode](self, "_actionTypeStringForQRCode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "length"))
        {
          v8 = CFSTR("App Clip Code Detected");
          goto LABEL_13;
        }
        break;
      case 2:
        -[BCSNotification _actionTypeStringForNFC](self, "_actionTypeStringForNFC");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "length"))
        {
          v8 = CFSTR("NFC Tag Detected");
          goto LABEL_13;
        }
        break;
      case 1:
        -[BCSNotification _actionTypeStringForQRCode](self, "_actionTypeStringForQRCode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "length"))
        {
          v8 = CFSTR("QR Code Detected");
LABEL_13:
          _BCSLocalizedString(v8, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        break;
      default:
        return v3;
    }
    v9 = v7;
LABEL_14:
    v3 = v9;

    return v3;
  }
  -[BCSAction localizedDefaultActionTitle](action, "localizedDefaultActionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (BOOL)shouldSkipBanner
{
  void *v3;
  BOOL v4;

  if (-[BCSAction codeType](self->_action, "codeType") != 2)
    return 0;
  -[BCSAction clipMetadataRequest](self->_action, "clipMetadataRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_actionTypeStringForNFC
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[BCSAction defaultActionTargetApplicationBundleIdentifier](self->_action, "defaultActionTargetApplicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
    {
      _BCSLocalizedString(CFSTR("Website NFC Tag"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(getLSApplicationProxyClass(), "applicationProxyForIdentifier:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD17C8];
      _BCSLocalizedString(CFSTR("%@ NFC Tag"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_actionTypeStringForQRCode
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  BCSAction *action;
  void *v8;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[BCSAction data](self->_action, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 != 10)
  {
    if (v4 == 8)
    {
      if ((MGGetBoolAnswer() & 1) != 0)
        v5 = CFSTR("WLAN QR Code");
      else
        v5 = CFSTR("Wi-Fi QR Code");
      goto LABEL_16;
    }
    if ((_bcs_isDeviceLocked() & 1) == 0
      && -[BCSNotification _shouldRequireUserToPickTargetApp](self, "_shouldRequireUserToPickTargetApp"))
    {
      v5 = CFSTR("App QR Code");
      goto LABEL_16;
    }
    -[BCSAction clipMetadataRequest](self->_action, "clipMetadataRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    action = self->_action;
    if (v6)
    {
      if (-[BCSAction codeType](action, "codeType") == 3)
        v5 = CFSTR("App Clip Code");
      else
        v5 = CFSTR("App Clip QR Code");
      goto LABEL_16;
    }
    if (-[BCSAction isPasskeyAction](action, "isPasskeyAction"))
    {
      v5 = CFSTR("Passkey QR Code");
      goto LABEL_16;
    }
    -[BCSAction defaultActionTargetApplicationBundleIdentifier](self->_action, "defaultActionTargetApplicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (-[BCSAction isAMSAction](self->_action, "isAMSAction"))
      {
        v11 = CFSTR("Apple QR Code");
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
        {
          objc_msgSend(getLSApplicationProxyClass(), "applicationProxyForIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x24BDD17C8];
          _BCSLocalizedString(CFSTR("%@ QR Code"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", v14, v15);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_26;
        }
        v11 = CFSTR("Website QR Code");
      }
      _BCSLocalizedString(v11, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
LABEL_26:

    return v8;
  }
  v5 = CFSTR("Text QR Code");
LABEL_16:
  _BCSLocalizedString(v5, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)_actionDescriptionString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((_bcs_isDeviceLocked() & 1) != 0
    || !-[BCSNotification _shouldRequireUserToPickTargetApp](self, "_shouldRequireUserToPickTargetApp"))
  {
    -[BCSAction localizedDefaultActionDescription](self->_action, "localizedDefaultActionDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    _BCSLocalizedString(CFSTR("Open “%@” in App"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSAction url](self->_action, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_bcs_displayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_supplementActions
{
  BCSAction *v3;
  void *v4;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self->_action;
    if ((unint64_t)-[BCSAction appLinkCount](v3, "appLinkCount") >= 2 && (_bcs_isDeviceLocked() & 1) != 0
      || (-[BCSAction clipMetadataRequest](self->_action, "clipMetadataRequest"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {

      return 0;
    }

  }
  -[BCSAction actionPickerItems](self->_action, "actionPickerItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[BCSNotification _notificationActionFromActionPickerItem:](self, "_notificationActionFromActionPickerItem:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)shouldHandleBulletinActionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (v4
    && (-[BCSNotification identifier](self, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqualToString:", v5),
        v5,
        (v6 & 1) == 0))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_localActions, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = -[BCSNotification _shouldHandleActionPickerItemLocally:](self, "_shouldHandleActionPickerItemLocally:", v7);

  return v8;
}

- (BOOL)_shouldHandleActionPickerItemLocally:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "actionURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = objc_msgSend(v6, "_bcs_isDataDetectorURL");
          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v5;
          objc_msgSend(v8, "appLink");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v7 = 1;
          }
          else
          {
            objc_msgSend(v8, "actionURL");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v10, "_bcs_isUPIURL");

          }
          goto LABEL_14;
        }
      }
      v7 = 0;
    }
    else
    {
      v7 = 1;
    }
LABEL_14:

    goto LABEL_15;
  }
  v7 = -[BCSNotification canHandleActionLocally](self, "canHandleActionLocally");
LABEL_15:

  return v7;
}

- (id)_notificationActionFromActionPickerItem:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 isKindOfClass;
  unsigned __int8 v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "actionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();
  v8 = v7;
  if (!v5 && (isKindOfClass & 1) == 0 && (v7 & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v4, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSNotification _actionDescriptionString](self, "_actionDescriptionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", v11))
  {

    goto LABEL_9;
  }
  v12 = -[BCSNotification _contentIsPreviewable](self, "_contentIsPreviewable");

  if (v12)
  {
LABEL_9:
    v13 = -[BCSNotification _shouldHandleActionPickerItemLocally:](self, "_shouldHandleActionPickerItemLocally:", v4);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (((isKindOfClass | v8) & 1) != 0)
        v16 = 0;
      else
        v16 = 4;
      -[NSMutableDictionary setObject:forKey:](self->_localActions, "setObject:forKey:", v4, v15);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        -[BCSNotification _notificationActionFromActionPickerItem:].cold.1((uint64_t)v5, v4);
      goto LABEL_19;
    }
    v17 = v5;
    v16 = -[BCSNotification _shouldManuallyRequireAuthenticationForURL:](self, "_shouldManuallyRequireAuthenticationForURL:", v17);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      -[BCSNotification _notificationActionFromActionPickerItem:].cold.2();
      if (v17)
        goto LABEL_17;
    }
    else if (v17)
    {
LABEL_17:
      v18 = (void *)MEMORY[0x24BDF8820];
      objc_msgSend(v4, "label");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "actionWithIdentifier:title:url:options:", v15, v19, v17, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
      goto LABEL_21;
    }
LABEL_19:
    v20 = (void *)MEMORY[0x24BDF8820];
    objc_msgSend(v4, "label");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "actionWithIdentifier:title:options:", v15, v17, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_4:
  v9 = 0;
LABEL_21:

  return v9;
}

- (BOOL)_contentIsPreviewable
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v8;

  -[BCSAction extraPreviewText](self->_action, "extraPreviewText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 1;
  if ((_bcs_isDeviceLocked() & 1) != 0)
    return 0;
  -[BCSAction clipMetadataRequest](self->_action, "clipMetadataRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 0;
  -[BCSAction defaultActionTargetApplicationBundleIdentifier](self->_action, "defaultActionTargetApplicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Maps"));

  return v5;
}

- (id)_contentExtensionData
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  BCSAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BCSAction *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = -[BCSNotification _contentIsPreviewable](self, "_contentIsPreviewable");
  -[BCSNotification _supplementActions](self, "_supplementActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") || v3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    v7 = self->_action;
    -[BCSAction url](v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "encodeObject:forKey:", v8, BCSBarcodeNotificationPayloadURLKey);
    -[BCSAction extraPreviewText](v7, "extraPreviewText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[BCSAction extraPreviewText](v7, "extraPreviewText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "encodeObject:forKey:", v10, BCSBarcodeNotificationPayloadExtraPreviewText);

    }
    -[BCSNotification _actionDescriptionString](self, "_actionDescriptionString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v6, "encodeObject:forKey:", v11, BCSBarcodeNotificationPayloadPreviewFooterTitleKey);
      if (objc_msgSend(v8, "_bcs_isHTTPFamilyURL"))
      {
        objc_msgSend(v8, "_bcs_fullURLDisplayString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encodeObject:forKey:", v12, BCSBarcodeNotificationPayloadPreviewFooterSubtitleKey);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = self->_action;
      -[BCSAction contact](v13, "contact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[BCSAction contact](v13, "contact");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encodeObject:forKey:", v15, BCSBarcodeNotificationPayloadContactKey);

      }
      -[BCSAction icsString](v13, "icsString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[BCSAction icsString](v13, "icsString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encodeObject:forKey:", v17, BCSBarcodeNotificationPayloadICSStringKey);

      }
      -[BCSAction scannerResult](v13, "scannerResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[BCSAction scannerResult](v13, "scannerResult");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "encodeObject:forKey:", v19, BCSBarcodeNotificationPayloadScannerResultKey);

      }
    }
    if (objc_msgSend(v4, "count"))
      objc_msgSend(v6, "encodeObject:forKey:", v4, BCSBarcodeNotificationPayloadActionsKey);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v20, BCSBarcodeNotificationPayloadContentIsPreviewableKey);

    objc_msgSend(v6, "encodedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_defaultURL
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[BCSAction actionPickerItems](self->_action, "actionPickerItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[BCSAction url](self->_action, "url");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (BOOL)canHandleActionLocally
{
  void *v3;
  char v4;
  BCSAction *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[BCSAction clipMetadataRequest](self->_action, "clipMetadataRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = self->_action;
        if ((-[BCSAction mustOpenAppLinkInApp](v6, "mustOpenAppLinkInApp") & 1) != 0)
        {
          v4 = 1;
LABEL_15:

          return v4;
        }
        -[BCSAction url](v6, "url");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "_bcs_isUPIURL");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return 0;
        v6 = self->_action;
        -[BCSAction icsString](v6, "icsString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v4 = 1;
        }
        else
        {
          -[BCSAction contact](v6, "contact");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v8 != 0;

        }
      }

      goto LABEL_15;
    }
  }
  return 1;
}

- (void)_handleCalendarEventWithICSString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  BCSNotification *v13;
  uint8_t buf[8];
  uint64_t v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNotification: Handling event action", buf, 2u);
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)getEKEventStoreClass_softClass;
  v22 = getEKEventStoreClass_softClass;
  v6 = MEMORY[0x24BDAC760];
  if (!getEKEventStoreClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __getEKEventStoreClass_block_invoke;
    v17 = &unk_24D787158;
    v18 = &v19;
    __getEKEventStoreClass_block_invoke((uint64_t)buf);
    v5 = (void *)v20[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __53__BCSNotification__handleCalendarEventWithICSString___block_invoke;
  v10[3] = &unk_24D787A70;
  v11 = objc_alloc_init(v7);
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = v11;
  objc_msgSend(v9, "requestWriteOnlyAccessToEventsWithCompletion:", v10);

}

void __53__BCSNotification__handleCalendarEventWithICSString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v17 = CFSTR("ICS");
  v18[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _DDUIEventForResults(v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  v16 = 0;
  v7 = objc_msgSend(v6, "saveEvent:span:error:", v5, 0, &v16);
  v8 = v16;
  v9 = v8;
  if ((v7 & 1) != 0 || !v8)
  {
    objc_msgSend(v5, "reset");
    objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "externalURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_fbOptionsHandlingUnlockIfNecessary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v13 = objc_msgSend(v10, "openSensitiveURL:withOptions:error:", v11, v12, &v15);
    v14 = v15;

    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __53__BCSNotification__handleCalendarEventWithICSString___block_invoke_cold_1();
      objc_msgSend(*(id *)(a1 + 32), "removeEvent:span:error:", v5, 0, 0);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __53__BCSNotification__handleCalendarEventWithICSString___block_invoke_cold_2(v9);
  }

}

+ (id)tempVCardFileURL
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BCSNotification tempVCardFileURL].cold.1();
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.BarcodeSupport.Notification"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v9);
    v4 = v9;

    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[BCSNotification tempVCardFileURL].cold.1();
      v5 = 0;
    }
    else
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Transfer.vcf"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (void)_handleContactInfo:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BCSNotification *v9;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNotification: Handling contact action", buf, 2u);
  }
  v5 = objc_alloc_init((Class)getCNContactStoreClass());
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__BCSNotification__handleContactInfo___block_invoke;
  v7[3] = &unk_24D787A98;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "requestAccessForEntityType:completionHandler:", 0, v7);

}

void __38__BCSNotification__handleContactInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id CNContactVCardSerializationClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    CNContactVCardSerializationClass = getCNContactVCardSerializationClass();
    v15[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CNContactVCardSerializationClass, "dataWithContacts:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "tempVCardFileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v8, "writeToURL:atomically:", v9, 1);
    objc_msgSend(getLSApplicationProxyClass(), "applicationProxyForIdentifier:", CFSTR("com.apple.MobileAddressBook"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isInstalled") && (objc_msgSend(v10, "isRestricted") & 1) == 0)
    {
      objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_fbOptionsHandlingUnlockIfNecessary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:sourceIsManaged:userInfo:options:delegate:", v9, CFSTR("com.apple.MobileAddressBook"), 0, 0, 0, v14, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "start");
    }
    else
    {
      objc_msgSend(getLSApplicationProxyClass(), "applicationProxyForSystemPlaceholder:", CFSTR("com.apple.MobileAddressBook"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_LSFailedToOpenURL:withBundle:", 0, v13);

    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __38__BCSNotification__handleContactInfo___block_invoke_cold_1(v5);
LABEL_13:

}

- (void)_performActionAfterUnlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v4 = (void (**)(_QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = getSBSGetScreenLockStatusSymbolLoc_ptr;
  v15 = getSBSGetScreenLockStatusSymbolLoc_ptr;
  if (!getSBSGetScreenLockStatusSymbolLoc_ptr)
  {
    v6 = (void *)SpringBoardServicesLibrary();
    v5 = dlsym(v6, "SBSGetScreenLockStatus");
    v13[3] = (uint64_t)v5;
    getSBSGetScreenLockStatusSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
    -[BCSNotification _performActionAfterUnlock:].cold.1();
  if (((unsigned int (*)(_QWORD))v5)(0) && !-[BCSNotification shouldSkipBanner](self, "shouldSkipBanner"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__BCSNotification__performActionAfterUnlock___block_invoke;
    v10[3] = &unk_24D787AC0;
    v11 = v4;
    v7 = v10;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v8 = getSBSRequestPasscodeUnlockUISymbolLoc_ptr;
    v15 = getSBSRequestPasscodeUnlockUISymbolLoc_ptr;
    if (!getSBSRequestPasscodeUnlockUISymbolLoc_ptr)
    {
      v9 = (void *)SpringBoardServicesLibrary();
      v8 = dlsym(v9, "SBSRequestPasscodeUnlockUI");
      v13[3] = (uint64_t)v8;
      getSBSRequestPasscodeUnlockUISymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v12, 8);
    if (!v8)
      -[BCSNotification _performActionAfterUnlock:].cold.2();
    ((void (*)(_QWORD *))v8)(v7);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __45__BCSNotification__performActionAfterUnlock___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)handleActionWithIdentifier:(id)a3 notificationResponseOriginID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  BCSAction *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  BCSAction *v17;
  BCSNotification *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  BCSAction *v23;

  v6 = a3;
  v7 = a4;
  if (-[BCSNotification shouldHandleBulletinActionWithIdentifier:](self, "shouldHandleBulletinActionWithIdentifier:", v6))
  {
    -[BCSNotification identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    -[NSMutableDictionary objectForKey:](self->_localActions, "objectForKey:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if ((v9 & 1) == 0 && !v10)
      goto LABEL_14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = self->_action;
      -[BCSAction icsString](v12, "icsString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke;
        v22[3] = &unk_24D7879A0;
        v22[4] = self;
        v23 = v12;
        v12 = v12;
        -[BCSNotification _performActionAfterUnlock:](self, "_performActionAfterUnlock:", v22);

LABEL_13:
LABEL_14:

        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v11, "contact"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (-[BCSAction contact](v12, "contact"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_2;
        v20[3] = &unk_24D7879A0;
        v20[4] = self;
        v21 = v14;
        v15 = v14;
        -[BCSNotification _performActionAfterUnlock:](self, "_performActionAfterUnlock:", v20);

        goto LABEL_13;
      }

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_3;
    v16[3] = &unk_24D787AE8;
    v17 = v11;
    v18 = self;
    v19 = v7;
    -[BCSNotification _performActionAfterUnlock:](self, "_performActionAfterUnlock:", v16);

    v12 = v17;
    goto LABEL_13;
  }
LABEL_15:

}

void __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "icsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleCalendarEventWithICSString:", v3);

  +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logBarcodeActivatedEventForAction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

}

void __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_handleContactInfo:", *(_QWORD *)(a1 + 40));
  +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logBarcodeActivatedEventForAction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

}

void __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "_fbOptionsHandlingUnlockIfNecessary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    if (objc_msgSend(*(id *)(a1 + 48), "length"))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v5 = (_QWORD *)getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
      v12 = getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr;
      if (!getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr)
      {
        v6 = (void *)FrontBoardServicesLibrary();
        v5 = dlsym(v6, "FBSOpenApplicationOptionKeyLaunchOrigin");
        v10[3] = (uint64_t)v5;
        getFBSOpenApplicationOptionKeyLaunchOriginSymbolLoc_ptr = (uint64_t)v5;
      }
      _Block_object_dispose(&v9, 8);
      if (!v5)
        __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_3_cold_1();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *v5, v9);
    }
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v7, "performActionWithFBOptions:", v3);
    }
    else if (objc_msgSend(*(id *)(a1 + 40), "_shouldRequireUserToPickTargetApp"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNotification: put up an alert to allow the user to choose app", (uint8_t *)&v9, 2u);
      }
      objc_msgSend(*(id *)(a1 + 40), "_showAppPickerAlertWithFBOptions:", v3);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "performDefaultActionWithFBOptions:", v3);
    }

  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v8)
      objc_msgSend(v8, "performAction");
    else
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "performDefaultAction");
  }
}

+ (id)_tlAlertConfiguration
{
  void *v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getTLAlertConfigurationClass_softClass;
  v12 = getTLAlertConfigurationClass_softClass;
  if (!getTLAlertConfigurationClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getTLAlertConfigurationClass_block_invoke;
    v8[3] = &unk_24D787158;
    v8[4] = &v9;
    __getTLAlertConfigurationClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  v4 = objc_msgSend([v3 alloc], "initWithType:", 20);
  v5 = (void *)_tlAlertConfiguration_alertConfiguration;
  _tlAlertConfiguration_alertConfiguration = v4;

  getTLAlertTopicPassbookNFCScanComplete();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_tlAlertConfiguration_alertConfiguration, "setTopic:", v6);

  return (id)_tlAlertConfiguration_alertConfiguration;
}

- (id)_attachmentIconURL
{
  void *v3;
  BCSNotificationIcon *attachmentIcon;
  BCSNotificationIcon *v5;
  BCSNotificationIcon *v6;

  if (-[BCSNotification _shouldRequireUserToPickTargetApp](self, "_shouldRequireUserToPickTargetApp"))
  {
    v3 = 0;
  }
  else
  {
    attachmentIcon = self->_attachmentIcon;
    if (!attachmentIcon)
    {
      v5 = -[BCSNotificationIcon initWithAction:]([BCSNotificationIcon alloc], "initWithAction:", self->_action);
      v6 = self->_attachmentIcon;
      self->_attachmentIcon = v5;

      attachmentIcon = self->_attachmentIcon;
    }
    -[BCSNotificationIcon imageURL](attachmentIcon, "imageURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_content
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  BCSAction **p_action;
  void *v9;
  BCSAction *action;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF8800]);
  if (-[BCSNotification _contentIsPreviewable](self, "_contentIsPreviewable"))
    v4 = CFSTR("barcodeNotificationCategory");
  else
    v4 = CFSTR("barcodeNotificationDefaultViewCategory");
  objc_msgSend(v3, "setCategoryIdentifier:", v4);
  -[BCSNotification _contentExtensionData](self, "_contentExtensionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v38 = BCSBarcodeNotificationPayloadKey;
    v39[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInfo:", v6);

  }
  -[BCSNotification _title](self, "_title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  p_action = &self->_action;
  -[BCSAction clipMetadataRequest](self->_action, "clipMetadataRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  action = self->_action;
  if (v9)
  {
    -[BCSAction clipMetadataRequest](action, "clipMetadataRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getClipMetadataSynchronously");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "clipName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSubtitle:", v13);

    -[BCSNotification _actionDescriptionString](self, "_actionDescriptionString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBody:", v14);

  }
  else
  {
    -[BCSAction extraPreviewText](action, "extraPreviewText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[BCSNotification _actionDescriptionString](self, "_actionDescriptionString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setSubtitle:", v12);

      v16 = (void *)MEMORY[0x24BDD17C8];
      _BCSLocalizedString(CFSTR("Contents: “%@”"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSAction extraPreviewText](*p_action, "extraPreviewText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBody:", v18);

    }
    else
    {
      objc_msgSend(v3, "setBody:", v12);
    }
  }

  if (-[BCSAction codeType](*p_action, "codeType") == 2)
  {
    +[BCSNotificationIcon nfcIcon](BCSNotificationIcon, "nfcIcon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIcon:", v19);

    objc_msgSend(v3, "setThreadIdentifier:", BCSBarcodeNFCNotificationSectionID);
    goto LABEL_19;
  }
  if (-[BCSAction codeType](*p_action, "codeType") == 3)
  {
    +[BCSNotificationIcon viewfinderIcon](BCSNotificationIcon, "viewfinderIcon");
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v21 = (void *)v20;
    objc_msgSend(v3, "setIcon:", v20);

    goto LABEL_18;
  }
  if (-[BCSAction codeType](*p_action, "codeType") == 1)
  {
    +[BCSNotificationIcon qrCodeIcon](BCSNotificationIcon, "qrCodeIcon");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v3, "setThreadIdentifier:", BCSBarcodeQRCodeNotificationSectionID);
  objc_msgSend(v3, "setShouldHideDate:", 1);
LABEL_19:
  objc_msgSend(v3, "setShouldIgnoreDoNotDisturb:", 1);
  if (-[BCSAction codeType](*p_action, "codeType") == 2)
  {
    objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    getTLAlertTopicPassbookNFCScanComplete();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlertTopic:", v23);

    objc_msgSend(v3, "setSound:", v22);
  }
  -[BCSNotification _attachmentIconURL](self, "_attachmentIconURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDF8830];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v25, "attachmentWithIdentifier:URL:options:error:", v27, v24, 0, &v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v36;

    if (v29)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BCSNotification _content].cold.2((uint64_t)v24, v29);
    }
    else if (v28)
    {
      v37 = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAttachments:", v30);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[BCSNotification _defaultURL](self, "_defaultURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BCSNotification canHandleActionLocally](self, "canHandleActionLocally"))
      goto LABEL_31;
    if (!v32 || (objc_msgSend(v32, "_bcs_isDataDetectorURL") & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BCSNotification _content].cold.1((id *)&self->_action);
      v31 = 0;
      goto LABEL_38;
    }
    objc_msgSend(v3, "setDefaultActionURL:", v32);
    if (-[BCSNotification _shouldManuallyRequireAuthenticationForURL:](self, "_shouldManuallyRequireAuthenticationForURL:", v32))
    {
      objc_msgSend(v3, "setShouldAuthenticateDefaultAction:", 1);
    }
    -[BCSAction defaultActionTargetApplicationBundleIdentifier](self->_action, "defaultActionTargetApplicationBundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[BCSNotification _shouldScheduleBackgroundActionForLaunchBundleID:](self, "_shouldScheduleBackgroundActionForLaunchBundleID:", v34);

    if (v35)
LABEL_31:
      objc_msgSend(v3, "setShouldBackgroundDefaultAction:", 1);
    v31 = v3;
LABEL_38:

    goto LABEL_39;
  }
  v31 = v3;
LABEL_39:

  return v31;
}

- (UNNotificationRequest)request
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDF8858];
  -[BCSNotification identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSNotification _content](self, "_content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithIdentifier:content:trigger:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UNNotificationRequest *)v6;
}

- (void)didHandleBulletinActionWithIdentifier:(id)a3
{
  id v4;

  if (!-[BCSNotification shouldHandleBulletinActionWithIdentifier:](self, "shouldHandleBulletinActionWithIdentifier:", a3))
  {
    +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logBarcodeActivatedEventForAction:", self->_action);

  }
}

- (BOOL)_shouldScheduleBackgroundActionForLaunchBundleID:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.InCallService")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.facetime"));
  }

  return v4;
}

- (id)_fbOptionsHandlingUnlockIfNecessary
{
  id *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v2 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  v15 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    v3 = (void *)FrontBoardServicesLibrary();
    v2 = (id *)dlsym(v3, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    v13[3] = (uint64_t)v2;
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v12, 8);
  if (!v2)
    -[BCSNotification _fbOptionsHandlingUnlockIfNecessary].cold.1();
  v4 = *v2;
  v16 = v4;
  v5 = MEMORY[0x24BDBD1C8];
  v18[0] = MEMORY[0x24BDBD1C8];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  v15 = getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
  {
    v7 = (void *)FrontBoardServicesLibrary();
    v6 = (id *)dlsym(v7, "FBSOpenApplicationOptionKeyUnlockDevice");
    v13[3] = (uint64_t)v6;
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
    -[BCSNotification _fbOptionsHandlingUnlockIfNecessary].cold.2();
  v17 = *v6;
  v18[1] = v5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = v17;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v18, &v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_shouldManuallyRequireAuthenticationForURL:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[BCSAction isAMSAction](self->_action, "isAMSAction"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("tel")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("facetime")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("facetime-audio")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("telemergencycall"));
    }

  }
  return v5;
}

- (BOOL)_shouldRequireUserToPickTargetApp
{
  BCSAction *v3;
  int v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self->_action;
    if ((unint64_t)-[BCSAction appLinkCount](v3, "appLinkCount") < 2)
      LOBYTE(v4) = 0;
    else
      v4 = -[BCSAction hasPreferredAppLink](v3, "hasPreferredAppLink") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)_pickerLabelForURLActionPickerItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "appLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetApplicationProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_showAppPickerAlertWithFBOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFDictionary *v18;
  __CFUserNotification *v19;
  __CFUserNotification *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CFOptionFlags v24[2];
  SInt32 error;
  _QWORD v26[7];
  _QWORD v27[8];

  v27[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BCSAction actionPickerItems](self->_action, "actionPickerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      LOWORD(v24[0]) = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNotification: User has more than 2 apps to choose from.", (uint8_t *)v24, 2u);
    }
    -[BCSNotification _orderAppLinkActionsByRecency:](self, "_orderAppLinkActionsByRecency:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSNotification _pickerLabelForURLActionPickerItem:](self, "_pickerLabelForURLActionPickerItem:", v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSNotification _pickerLabelForURLActionPickerItem:](self, "_pickerLabelForURLActionPickerItem:", v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v26[0] = *MEMORY[0x24BDBD6D8];
  _BCSLocalizedString(CFSTR("Choose App to Open URL"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v26[1] = *MEMORY[0x24BDBD6F8];
  _BCSLocalizedString(CFSTR("Cancel"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = *MEMORY[0x24BDBD6F0];
  if (v8)
    v15 = v8;
  else
    v15 = &stru_24D788C60;
  v27[1] = v12;
  v27[2] = v15;
  v16 = *MEMORY[0x24BDBD718];
  v26[2] = v14;
  v26[3] = v16;
  if (v10)
    v17 = v10;
  else
    v17 = &stru_24D788C60;
  v26[4] = *MEMORY[0x24BDBD6E8];
  v26[5] = CFSTR("SBUserNotificationForcesModalAlertAppearance");
  v27[3] = v17;
  v27[4] = MEMORY[0x24BDBD1C8];
  v26[6] = CFSTR("SBUserNotificationDisplayActionButtonOnLockScreen");
  v27[5] = MEMORY[0x24BDBD1C8];
  v27[6] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 7);
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  error = 0;
  v19 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0x20uLL, &error, v18);
  if (v19)
  {
    v20 = v19;
    v24[0] = 0;
    CFUserNotificationReceiveResponse(v19, 0.0, v24);
    CFRelease(v20);
    if (v24[0] == 1)
    {
      v21 = 0;
    }
    else
    {
      if (v24[0] != 2)
        goto LABEL_20;
      v21 = 1;
    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = v22;
      objc_msgSend(v22, "performActionWithFBOptions:", v4);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[BCSNotification _showAppPickerAlertWithFBOptions:].cold.1(&error);
  }
LABEL_20:

}

- (id)_orderAppLinkActionsByRecency:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "appLink");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "targetApplicationProxy");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        _bcs_lastTimeAppWasUsed(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v14, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v5, "mutableCopy");
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __49__BCSNotification__orderAppLinkActionsByRecency___block_invoke;
  v18[3] = &unk_24D787B10;
  v19 = v4;
  v16 = v4;
  objc_msgSend(v15, "sortUsingComparator:", v18);

  return v15;
}

uint64_t __49__BCSNotification__orderAppLinkActionsByRecency___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v7)
      v10 = -1;
    else
      v10 = v8 != 0;
  }
  else
  {
    v10 = objc_msgSend(v8, "compare:", v7);
  }

  return v10;
}

- (int)requestingProcessID
{
  return self->_requestingProcessID;
}

- (void)setRequestingProcessID:(int)a3
{
  self->_requestingProcessID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localActions, 0);
  objc_storeStrong((id *)&self->_attachmentIcon, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)_notificationActionFromActionPickerItem:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "targetApplicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138478083;
  v5 = a1;
  v6 = 2113;
  v7 = v3;
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "BCSNotification: Setting up UNNotificationAction that will be handled locally with URL %{private}@ and target application %{private}@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)_notificationActionFromActionPickerItem:.cold.2()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "BCSNotification: Setting up UNNotificationAction with URL %{private}@", v0, 0xCu);
  OUTLINED_FUNCTION_4_1();
}

void __53__BCSNotification__handleCalendarEventWithICSString___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSNotification: cannot open Calendar app with the event's externalURL", v0, 2u);
}

void __53__BCSNotification__handleCalendarEventWithICSString___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSNotification: error saving EKEvent: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)tempVCardFileURL
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v0, "BCSNotification: cannot create folder at URL: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_1();
}

void __38__BCSNotification__handleContactInfo___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSNotification: error accessing Contacts store: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)_performActionAfterUnlock:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _SBSGetScreenLockStatus(Boolean *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSNotification.m"), 59, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

- (void)_performActionAfterUnlock:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _SBSRequestPasscodeUnlockUI(void (^__strong)(Boolean))");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSNotification.m"), 60, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void __75__BCSNotification_handleActionWithIdentifier_notificationResponseOriginID___block_invoke_3_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyLaunchOrigin(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSNotification.m"), 65, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

- (void)_content
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138478083;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create an attachment with url %{private}@ and error %{public}@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)_fbOptionsHandlingUnlockIfNecessary
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyUnlockDevice(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSNotification.m"), 63, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

- (void)_showAppPickerAlertWithFBOptions:(int *)a1 .cold.1(int *a1)
{
  int v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2[0] = 67240192;
  v2[1] = v1;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot create CFUserNotification with error code: %{public}d", (uint8_t *)v2, 8u);
}

@end
