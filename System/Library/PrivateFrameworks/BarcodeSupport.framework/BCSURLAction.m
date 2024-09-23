@implementation BCSURLAction

- (BCSURLAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6;
  id v7;
  BCSURLAction *v8;
  BCSURLAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v11.receiver = self;
  v11.super_class = (Class)BCSURLAction;
  v8 = -[BCSAction initWithData:codePayload:](&v11, sel_initWithData_codePayload_, v6, v7);
  if (!v8)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  self = v8;
  v9 = self;
LABEL_6:

  return v9;
}

- (id)url
{
  void *v2;
  void *v3;

  -[BCSAction data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldRequireUserToPickTargetApp
{
  return -[NSArray count](self->_appLinks, "count") >= 2 && !self->_hasPreferredAppLink;
}

- (BOOL)_hasCellularPlanAction
{
  return self->_cellularPlanAction != 0;
}

- (BOOL)isAirplayPairingAction
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BCSURLAction targetApplication](self, "targetApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.APSUIApp")))
    v4 = _bcs_airplayInWifiEnabled();
  else
    v4 = 0;

  return v4;
}

- (id)localizedDefaultActionTitle
{
  void *v3;
  objc_super v5;

  if (-[BCSURLAction _hasCellularPlanAction](self, "_hasCellularPlanAction"))
  {
    -[CTCellularPlanQRCodeAction title](self->_cellularPlanAction, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[BCSURLAction isAirplayPairingAction](self, "isAirplayPairingAction"))
  {
    _BCSLocalizedString(CFSTR("Connect"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)BCSURLAction;
    -[BCSAction localizedDefaultActionTitle](&v5, sel_localizedDefaultActionTitle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)localizedDefaultActionDescription
{
  uint64_t v3;
  __CFString *v4;
  void *v6;
  void *v7;
  uint64_t v8;

  if (!-[BCSURLAction _hasCellularPlanAction](self, "_hasCellularPlanAction"))
  {
    if (-[BCSURLAction isAMSAction](self, "isAMSAction"))
    {
      _BCSLocalizedString(CFSTR("Tap here to learn more"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (-[BCSURLAction isPasskeyAssertionAction](self, "isPasskeyAssertionAction"))
    {
      -[BCSURLAction _passkeyAssertionActionDescription](self, "_passkeyAssertionActionDescription");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (-[BCSURLAction isPasskeyRegistrationAction](self, "isPasskeyRegistrationAction"))
    {
      -[BCSURLAction _passkeyRegistrationActionDescription](self, "_passkeyRegistrationActionDescription");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (-[BCSURLAction isApplePayInitiateAction](self, "isApplePayInitiateAction"))
    {
      -[BCSURLAction _applePayActionDescription](self, "_applePayActionDescription");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    -[BCSURLAction targetApplication](self, "targetApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[BCSURLAction url](self, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSURLAction _actionDescriptionForURL:application:shouldShowHostNameForSafariURL:](self, "_actionDescriptionForURL:application:shouldShowHostNameForSafariURL:", v7, v6, 1);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_deviceDataIsUnavailable)
      {
        v4 = &stru_24D788C60;
        goto LABEL_18;
      }
      -[BCSURLAction url](self, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSURLAction _actionDescriptionWithoutTargetApplicationForURL:](self, "_actionDescriptionWithoutTargetApplicationForURL:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (__CFString *)v8;

LABEL_18:
    return v4;
  }
  -[CTCellularPlanQRCodeAction message](self->_cellularPlanAction, "message");
  v3 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v4 = (__CFString *)v3;
  return v4;
}

- (id)defaultActionTargetApplicationBundleIdentifier
{
  __CFString *v3;
  void *v4;

  if (-[BCSURLAction _hasCellularPlanAction](self, "_hasCellularPlanAction"))
  {
    v3 = CFSTR("com.apple.Preferences.cellularData");
  }
  else
  {
    -[BCSURLAction targetApplication](self, "targetApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)debugDescriptionExtraInfoDictionary
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[BCSURLAction targetApplication](self, "targetApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24D788C60;
  }
  v10[0] = CFSTR("targetApplication");
  v10[1] = CFSTR("url");
  v11[0] = v5;
  -[BCSURLAction url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_commonActionPickerItemsForURL
{
  void *v3;
  id SSReadingListClass;
  void *v5;
  BCSActionPickerItem *v6;
  void *v7;
  BCSActionPickerItem *v8;
  void *v9;
  BCSCopyActionPickerItem *v10;
  void *v11;
  BCSCopyActionPickerItem *v12;
  BCSShareActionPickerItem *v13;
  _QWORD v15[5];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SSReadingListClass = getSSReadingListClass();
  -[BCSURLAction url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(SSReadingListClass) = objc_msgSend(SSReadingListClass, "supportsURL:", v5);

  if ((_DWORD)SSReadingListClass)
  {
    v6 = [BCSActionPickerItem alloc];
    _BCSLocalizedString(CFSTR("Add to Reading List"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __46__BCSURLAction__commonActionPickerItemsForURL__block_invoke;
    v15[3] = &unk_24D787300;
    v15[4] = self;
    v8 = -[BCSActionPickerItem initWithLabel:actionHandler:](v6, "initWithLabel:actionHandler:", v7, v15);

    objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("eyeglasses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSActionPickerItem setIcon:](v8, "setIcon:", v9);

    objc_msgSend(v3, "addObject:", v8);
  }
  v10 = [BCSCopyActionPickerItem alloc];
  -[BCSURLAction url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BCSCopyActionPickerItem initWithAction:urlToCopy:](v10, "initWithAction:urlToCopy:", self, v11);

  objc_msgSend(v3, "addObject:", v12);
  v13 = -[BCSShareActionPickerItem initWithAction:]([BCSShareActionPickerItem alloc], "initWithAction:", self);
  objc_msgSend(v3, "addObject:", v13);

  return v3;
}

void __46__BCSURLAction__commonActionPickerItemsForURL__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(getSSReadingListClass(), "defaultReadingList");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addReadingListItemWithURL:title:previewText:error:", v2, 0, 0, 0);

}

- (id)_additionalActionPickerItems
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  BCSURLActionPickerItem *v9;
  void *v10;
  void *v11;
  BCSURLActionPickerItem *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSAction detectedCode](self, "detectedCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_4;
  if (-[NSArray count](self->_appLinks, "count"))
  {
    -[BCSURLAction url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_bcs_isRedirectedSHCURL");

    if ((v6 & 1) != 0)
    {
LABEL_4:
      v7 = 0;
      goto LABEL_10;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilesafari"), 0, 0);
    v9 = [BCSURLActionPickerItem alloc];
    _BCSLocalizedString(CFSTR("Open in Safari"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSURLAction url](self, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BCSURLActionPickerItem initWithLabel:action:url:applicationRecord:](v9, "initWithLabel:action:url:applicationRecord:", v10, self, v11, v8);

    objc_msgSend(v3, "addObject:", v12);
  }
  if (-[BCSURLAction _willOpenInSafari](self, "_willOpenInSafari") || -[NSArray count](self->_appLinks, "count"))
  {
    -[BCSURLAction _commonActionPickerItemsForURL](self, "_commonActionPickerItemsForURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v13);

  }
  v7 = v3;
LABEL_10:

  return v7;
}

- (id)_actionPickerItemsForAppClip
{
  void *v3;
  BCSAppClipActionPickerItem *v4;
  BCSCopyActionPickerItem *v5;
  void *v6;
  BCSCopyActionPickerItem *v7;
  BCSShareActionPickerItem *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BCSActionPickerItem initWithAction:]([BCSAppClipActionPickerItem alloc], "initWithAction:", self);
  objc_msgSend(v3, "addObject:", v4);
  if (-[BCSAction codeType](self, "codeType") != 3)
  {
    v5 = [BCSCopyActionPickerItem alloc];
    -[BCSURLAction url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BCSCopyActionPickerItem initWithAction:urlToCopy:](v5, "initWithAction:urlToCopy:", self, v6);

    objc_msgSend(v3, "addObject:", v7);
    v8 = -[BCSShareActionPickerItem initWithAction:]([BCSShareActionPickerItem alloc], "initWithAction:", self);
    objc_msgSend(v3, "addObject:", v8);

  }
  return v3;
}

- (BOOL)_willOpenInSafari
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[BCSURLAction targetApplication](self, "targetApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    -[BCSAction clipMetadataRequest](self, "clipMetadataRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;

  if (-[BCSURLAction _willOpenInSafari](self, "_willOpenInSafari"))
    goto LABEL_2;
  if (-[BCSURLAction isPasskeyAssertionAction](self, "isPasskeyAssertionAction"))
  {
    -[BCSURLAction _passkeyAssertionActionDescription](self, "_passkeyAssertionActionDescription");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v5 = (void *)v6;
    return v5;
  }
  if (-[BCSURLAction isPasskeyRegistrationAction](self, "isPasskeyRegistrationAction"))
  {
    -[BCSURLAction _passkeyRegistrationActionDescription](self, "_passkeyRegistrationActionDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (-[BCSURLAction isAirplayPairingAction](self, "isAirplayPairingAction"))
  {
    v7 = CFSTR("Connect");
LABEL_10:
    _BCSLocalizedString(v7, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (-[BCSURLAction isApplePayInitiateAction](self, "isApplePayInitiateAction"))
  {
    -[BCSURLAction _applePayActionDescription](self, "_applePayActionDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (self->_deviceDataIsUnavailable)
  {
    -[BCSURLAction targetApplication](self, "targetApplication");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = -[BCSURLAction isAMSAction](self, "isAMSAction");

      if (!v11)
      {
        -[BCSURLAction targetApplication](self, "targetApplication");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "developerType");

        if (v16 != 1)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[BCSURLAction shortDescription].cold.1(self);
          goto LABEL_2;
        }
        goto LABEL_26;
      }
    }
    if (-[NSArray count](self->_appLinks, "count"))
    {
LABEL_2:
      -[BCSURLAction url](self, "url");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_bcs_displayString");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_3:
      v5 = (void *)v4;

      return v5;
    }
  }
  if (!-[NSArray count](self->_appLinks, "count"))
  {
    if (!-[BCSURLAction _hasCellularPlanAction](self, "_hasCellularPlanAction"))
    {
      -[BCSURLAction localizedDefaultActionDescription](self, "localizedDefaultActionDescription");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v7 = CFSTR("Cellular Plan");
    goto LABEL_10;
  }
  -[BCSURLAction url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_bcs_isRedirectedSHCURL");

  if (!v13
    || (-[BCSURLAction url](self, "url"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "_bcs_localizedDisplayNameForRedirectedSHCURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        !v5))
  {
LABEL_26:
    -[BCSURLAction targetApplication](self, "targetApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedName");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  return v5;
}

- (id)actionIcon
{
  id UIImageClass;
  const __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;

  if (-[BCSURLAction _willOpenInSafari](self, "_willOpenInSafari"))
  {
    UIImageClass = getUIImageClass();
    v4 = CFSTR("safari.fill");
  }
  else
  {
    -[LSApplicationRecord bundleIdentifier](self->_userVisibleAppRecord, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Home"));

    if (v6)
    {
      UIImageClass = getUIImageClass();
      v4 = CFSTR("homekit");
    }
    else
    {
      -[BCSAction clipMetadataRequest](self, "clipMetadataRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("arrow.up.forward.appclip"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          return v7;
        UIImageClass = getUIImageClass();
        v4 = CFSTR("appclip");
      }
      else if (-[BCSURLAction _hasCellularPlanAction](self, "_hasCellularPlanAction"))
      {
        UIImageClass = getUIImageClass();
        v4 = CFSTR("antenna.radiowaves.left.and.right");
      }
      else
      {
        -[BCSURLAction url](self, "url");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "_bcs_isRedirectedSHCURL");

        if (v11)
        {
          objc_msgSend(getUIImageClass(), "_systemImageNamed:", CFSTR("health.fill"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          return v7;
        }
        if (-[BCSURLAction isPasskeyAction](self, "isPasskeyAction"))
        {
          UIImageClass = getUIImageClass();
          v4 = CFSTR("person.badge.key.fill");
        }
        else if (-[BCSURLAction isAirplayPairingAction](self, "isAirplayPairingAction"))
        {
          UIImageClass = getUIImageClass();
          v4 = CFSTR("tv");
        }
        else
        {
          v12 = -[BCSURLAction isApplePayInitiateAction](self, "isApplePayInitiateAction");
          UIImageClass = getUIImageClass();
          if (v12)
            v4 = CFSTR("creditcard.fill");
          else
            v4 = CFSTR("arrow.up.forward.app.fill");
        }
      }
    }
  }
  objc_msgSend(UIImageClass, "systemImageNamed:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)_actionPickerItemsForLockScreenVisibleApps
{
  void *v2;
  void *v4;
  LSApplicationRecord *userVisibleAppRecord;
  LSApplicationRecord *v6;
  LSApplicationRecord *v7;
  LSApplicationRecord *v8;
  void *v9;
  void *v10;
  BCSURLActionPickerItem *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  -[NSArray firstObject](self->_appLinks, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  userVisibleAppRecord = self->_userVisibleAppRecord;
  if (userVisibleAppRecord)
  {
    v6 = userVisibleAppRecord;
  }
  else
  {
    -[NSArray firstObject](self->_upiApplicationRecords, "firstObject");
    v6 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = self->_userVisibleAppRecord;
  if (!v8
    || (-[LSApplicationRecord bundleIdentifier](self->_userVisibleAppRecord, "bundleIdentifier"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0))
  {
    _BCSLocalizedString(CFSTR("Title for the menu to open an application or the browser when a QR code is deteced in lock screen"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_9;
  }
  else
  {
    -[BCSURLAction url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSURLAction _actionDescriptionForURL:application:shouldShowHostNameForSafariURL:](self, "_actionDescriptionForURL:application:shouldShowHostNameForSafariURL:", v9, self->_userVisibleAppRecord, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:
  v11 = [BCSURLActionPickerItem alloc];
  if (v4)
  {
    -[BCSAction codePayload](self, "codePayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BCSURLActionPickerItem initWithLabel:action:appLink:codePayload:](v11, "initWithLabel:action:appLink:codePayload:", v10, self, v4, v12);
  }
  else
  {
    -[BCSURLAction url](self, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BCSURLActionPickerItem initWithLabel:action:url:applicationRecord:preferApplicationIcon:](v11, "initWithLabel:action:url:applicationRecord:preferApplicationIcon:", v10, self, v12, v7, self->_userVisibleAppRecord != 0);
  }
  v14 = (void *)v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v14);
  -[BCSURLAction _commonActionPickerItemsForURL](self, "_commonActionPickerItemsForURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

  return v15;
}

- (id)_actionPickerItemsForUnlockedAppLinks
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  BCSURLActionPickerItem *v13;
  void *v14;
  void *v15;
  BCSURLActionPickerItem *v16;
  void *v17;
  NSArray *obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!-[NSArray count](self->_appLinks, "count"))
    return 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[BCSURLAction url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSAction detectedCode](self, "detectedCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_6:
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = self->_appLinks;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "targetApplicationRecord");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSURLAction _actionDescriptionForURL:application:shouldShowHostNameForSafariURL:](self, "_actionDescriptionForURL:application:shouldShowHostNameForSafariURL:", v3, v11, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = [BCSURLActionPickerItem alloc];
          -[BCSAction codePayload](self, "codePayload");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSAction detectedCode](self, "detectedCode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[BCSURLActionPickerItem initWithLabel:action:appLink:codePayload:preferApplicationIcon:](v13, "initWithLabel:action:appLink:codePayload:preferApplicationIcon:", v12, self, v10, v14, v15 != 0);

          objc_msgSend(v19, "addObject:", v16);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    -[BCSURLAction _additionalActionPickerItems](self, "_additionalActionPickerItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v17);

    goto LABEL_14;
  }
  if (-[NSArray count](self->_appLinks, "count") >= 2)
    goto LABEL_6;
LABEL_14:

  return v19;
}

- (id)actionPickerItems
{
  void *v3;
  NSURL *v4;
  _BOOL4 v5;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BCSActionPickerItem *v12;
  id v13;
  void *v14;
  _BOOL4 deviceDataIsUnavailable;
  void *v16;
  NSURL *appStoreSearchURLForUnsupportedScheme;
  NSURL *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  BCSURLActionPickerItem *v26;
  LSApplicationRecord *userVisibleAppRecord;
  uint64_t v28;
  void *v29;
  NSURL *v30;
  NSURL *v31;
  BCSURLActionPickerItem *v32;
  void *v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  NSURL *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSURLAction url](self, "url");
  v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v5 = -[BCSURLAction _hasCellularPlanAction](self, "_hasCellularPlanAction");
  v6 = -[BCSURLAction isAMSAction](self, "isAMSAction");
  v7 = -[BCSURLAction isPasskeyAction](self, "isPasskeyAction");
  if (!-[BCSURLAction isApplePayInitiateAction](self, "isApplePayInitiateAction") && !v7 && !v6 && !v5)
  {
    -[BCSAction detectedCode](self, "detectedCode");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[BCSAction clipMetadataRequest](self, "clipMetadataRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[BCSURLAction _actionPickerItemsForAppClip](self, "_actionPickerItemsForAppClip");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v13 = (id)v11;
        goto LABEL_39;
      }
    }
    -[BCSAction detectedCode](self, "detectedCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      deviceDataIsUnavailable = self->_deviceDataIsUnavailable;

      if (deviceDataIsUnavailable)
      {
        -[BCSURLAction _actionPickerItemsForLockScreenVisibleApps](self, "_actionPickerItemsForLockScreenVisibleApps");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    -[BCSURLAction _actionPickerItemsForUnlockedAppLinks](self, "_actionPickerItemsForUnlockedAppLinks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      v13 = v16;
LABEL_38:

      goto LABEL_39;
    }
    if (-[NSArray count](self->_upiApplicationRecords, "count") >= 2)
    {
      v43 = v16;
      v44 = v4;
      appStoreSearchURLForUnsupportedScheme = self->_appStoreSearchURLForUnsupportedScheme;
      if (!appStoreSearchURLForUnsupportedScheme)
        appStoreSearchURLForUnsupportedScheme = v4;
      v18 = appStoreSearchURLForUnsupportedScheme;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v19 = self->_upiApplicationRecords;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v46 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v24, "localizedName", v43, v44, (_QWORD)v45);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[BCSURLActionPickerItem initWithLabel:action:url:applicationRecord:preferApplicationIcon:]([BCSURLActionPickerItem alloc], "initWithLabel:action:url:applicationRecord:preferApplicationIcon:", v25, self, v18, v24, 1);
            objc_msgSend(v3, "addObject:", v26);

          }
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v21);
      }

      v13 = v3;
      v16 = v43;
      v4 = v44;
      goto LABEL_38;
    }
    if (v4)
    {
      userVisibleAppRecord = self->_userVisibleAppRecord;
      if (userVisibleAppRecord)
      {
LABEL_28:
        -[BCSURLAction _actionDescriptionForURL:application:shouldShowHostNameForSafariURL:](self, "_actionDescriptionForURL:application:shouldShowHostNameForSafariURL:", v4, userVisibleAppRecord, 0);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_31:
        v29 = (void *)v28;
        v30 = self->_appStoreSearchURLForUnsupportedScheme;
        if (!v30)
          v30 = v4;
        v31 = v30;
        v32 = -[BCSURLActionPickerItem initWithLabel:action:url:applicationRecord:preferApplicationIcon:]([BCSURLActionPickerItem alloc], "initWithLabel:action:url:applicationRecord:preferApplicationIcon:", v29, self, v31, self->_userVisibleAppRecord, 1);

        objc_msgSend(v3, "addObject:", v32);
        -[BCSURLAction _additionalActionPickerItems](self, "_additionalActionPickerItems");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v33);

        v13 = v3;
        goto LABEL_38;
      }
      if (self->_deviceDataIsUnavailable)
      {
LABEL_30:
        -[BCSURLAction _actionDescriptionWithoutTargetApplicationForURL:](self, "_actionDescriptionWithoutTargetApplicationForURL:", v4);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      if ((_bcs_isHostAppEntitled() & 1) == 0)
      {
        userVisibleAppRecord = self->_userVisibleAppRecord;
        if (userVisibleAppRecord)
          goto LABEL_28;
        goto LABEL_30;
      }
    }
    v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v34)
      -[BCSURLAction actionPickerItems].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);
    v13 = 0;
    goto LABEL_38;
  }
  v12 = -[BCSActionPickerItem initWithAction:]([BCSActionPickerItem alloc], "initWithAction:", self);
  objc_msgSend(v3, "addObject:", v12);
  v13 = v3;

LABEL_39:
  return v13;
}

- (id)_appclipLaunchReason
{
  int64_t v2;
  __CFString *v3;
  id *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = -[BCSAction codeType](self, "codeType");
  if (v2 == 3)
  {
    v3 = CFSTR("AppclipCode");
  }
  else if (v2 == 2)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v4 = (id *)getCPSSessionLaunchReasonNFCSymbolLoc_ptr;
    v10 = getCPSSessionLaunchReasonNFCSymbolLoc_ptr;
    if (!getCPSSessionLaunchReasonNFCSymbolLoc_ptr)
    {
      v5 = (void *)ClipServicesLibrary_0();
      v4 = (id *)dlsym(v5, "CPSSessionLaunchReasonNFC");
      v8[3] = (uint64_t)v4;
      getCPSSessionLaunchReasonNFCSymbolLoc_ptr = (uint64_t)v4;
    }
    _Block_object_dispose(&v7, 8);
    if (!v4)
      -[BCSURLAction _appclipLaunchReason].cold.1();
    v3 = (__CFString *)*v4;
  }
  else
  {
    getCPSSessionLaunchReasonQR();
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)hasSensitiveURL
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  if (-[BCSURLAction isAirplayPairingAction](self, "isAirplayPairingAction"))
  {
    -[BCSURLAction url](self, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_bcs_hasScheme:", CFSTR("airplay"));

    if ((v4 & 1) != 0)
      return 1;
  }
  -[LSApplicationRecord bundleIdentifier](self->_userVisibleAppRecord, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Home"));

  if (!v7)
    return 0;
  -[BCSURLAction url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "_bcs_hasScheme:", CFSTR("X-HM")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[BCSURLAction url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "_bcs_hasScheme:", CFSTR("com.apple.Home-private"));

  }
  return v5;
}

- (void)performActionWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (-[BCSURLAction hasSensitiveURL](self, "hasSensitiveURL"))
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSURLAction url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v10 = objc_msgSend(v8, "openSensitiveURL:withOptions:error:", v9, v6, &v12);
    v11 = v12;

    if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BCSURLAction performActionWithOptions:completion:].cold.1(self);
    v7[2](v7, v11);

  }
  else
  {
    -[BCSURLAction performDefaultActionWithFBOptions:](self, "performDefaultActionWithFBOptions:", v6);
    v7[2](v7, 0);
  }

}

- (void)performDefaultActionWithFBOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
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
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  __int128 buf;
  Class (*v54)(uint64_t);
  void *v55;
  uint64_t *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[BCSURLAction _hasCellularPlanAction](self, "_hasCellularPlanAction"))
  {
    -[CTCellularPlanQRCodeAction performWithCompletionHandler:](self->_cellularPlanAction, "performWithCompletionHandler:", &__block_literal_global_10);
    goto LABEL_30;
  }
  if (!_bcs_isHostAppEntitled())
    goto LABEL_7;
  -[BCSURLAction targetApplication](self, "targetApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    goto LABEL_7;
  }
  if (self->_deviceDataIsUnavailable)
  {
LABEL_7:
    -[BCSURLAction _requiresOpenInTargetApplication](self, "_requiresOpenInTargetApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        -[BCSURLAction targetApplication](self, "targetApplication");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSURLAction: Handling URL with LSApplicationWorkspace operation with target application: %@.", (uint8_t *)&buf, 0xCu);

      }
      +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logBarcodeActivatedEventForAction:", self);

      -[BCSURLAction _openActionInTargetApplicationWithOptions:](self, "_openActionInTargetApplicationWithOptions:", v4);
    }
    else
    {
      -[BCSAction clipMetadataRequest](self, "clipMetadataRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v49 = 0;
        v50 = &v49;
        v51 = 0x2050000000;
        v11 = (void *)getCPSClipRequestClass_softClass_0;
        v52 = getCPSClipRequestClass_softClass_0;
        v12 = MEMORY[0x24BDAC760];
        if (!getCPSClipRequestClass_softClass_0)
        {
          *(_QWORD *)&buf = MEMORY[0x24BDAC760];
          *((_QWORD *)&buf + 1) = 3221225472;
          v54 = __getCPSClipRequestClass_block_invoke_0;
          v55 = &unk_24D787158;
          v56 = &v49;
          __getCPSClipRequestClass_block_invoke_0((uint64_t)&buf);
          v11 = (void *)v50[3];
        }
        v13 = objc_retainAutorelease(v11);
        _Block_object_dispose(&v49, 8);
        v14 = [v13 alloc];
        -[BCSURLAction url](self, "url");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithURL:", v15);

        -[BCSURLAction _appclipLaunchReason](self, "_appclipLaunchReason");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sessionProxy");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "configuration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setLaunchReason:", v17);

        v48[0] = v12;
        v48[1] = 3221225472;
        v48[2] = __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_75;
        v48[3] = &unk_24D7880B8;
        v48[4] = self;
        objc_msgSend(v16, "requestClipWithCompletion:", v48);
        +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logBarcodeActivatedEventForAction:", self);

      }
      else if (-[NSArray count](self->_appLinks, "count"))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSURLAction: perform action with default app link", (uint8_t *)&buf, 2u);
        }
        -[NSArray firstObject](self->_appLinks, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[BCSAction codePayload](self, "codePayload");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _bcs_openAppLinkIgnoringOpenStrategy(v21, v4, v22);

        if (-[NSArray count](self->_appLinks, "count") >= 2)
        {
          +[BCSQRCodeParser sharedParser](BCSQRCodeParser, "sharedParser");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "targetApplicationProxy");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "bundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "URL");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setPreferredBundleIdentifier:forURL:", v25, v26);

        }
        +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logBarcodeActivatedEventForAction:", self);

      }
      else
      {
        -[BCSURLAction url](self, "url");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "_bcs_isUPIURL");

        v38 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
        if (v37)
        {
          if (v38)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSURLAction: Opening top ranked UPI handling app", (uint8_t *)&buf, 2u);
          }
          +[BCSQRCodeParser sharedParser](BCSQRCodeParser, "sharedParser");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSURLAction targetApplication](self, "targetApplication");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "bundleIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSURLAction url](self, "url");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setPreferredBundleIdentifier:forURL:", v41, v42);

          -[BCSURLAction _openActionInTargetApplicationWithOptions:](self, "_openActionInTargetApplicationWithOptions:", 0);
        }
        else
        {
          if (v38)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSURLAction: perform default action by opening URL", (uint8_t *)&buf, 2u);
          }
          objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSURLAction url](self, "url");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0;
          objc_msgSend(v43, "openURL:withOptions:error:", v44, v4, &v47);
          v45 = v47;

          +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "logBarcodeActivatedEventForAction:", self);

        }
      }
    }
    goto LABEL_30;
  }
  v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v28)
    -[BCSURLAction performDefaultActionWithFBOptions:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
LABEL_30:

}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint8_t v3[16];

  v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSURLAction: CTCellularPlanManagerCameraScanAction performed successfully", v3, 2u);
  }

}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_75(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE16E88]) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 2)
      {
        v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v9)
          __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_75_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
        objc_msgSend(*(id *)(a1 + 32), "_openActionInTargetApplicationWithOptions:", 0);
        goto LABEL_11;
      }
    }
    else
    {

    }
    if (!v6)
      goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_75_cold_2(v6);
LABEL_11:

}

- (void)_openActionInTargetApplicationWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDC1548];
  v5 = a3;
  objc_msgSend(v4, "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSURLAction url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSURLAction targetApplication](self, "targetApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v7, v9, 0, 0, 0, 0, v5, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "start");
}

- (void)performDefaultAction
{
  -[BCSURLAction performDefaultActionWithFBOptions:](self, "performDefaultActionWithFBOptions:", 0);
}

- (void)performAction
{
  if (-[NSArray count](self->_appLinks, "count") > 1)
    -[BCSAction showActionPicker](self, "showActionPicker");
  else
    -[BCSAction performActionWithCompletion:](self, "performActionWithCompletion:", &__block_literal_global_78);
}

void __29__BCSURLAction_performAction__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __29__BCSURLAction_performAction__block_invoke_cold_1(v2);

}

- (void)_resolveAppClipForURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  _QWORD v26[5];
  id v27;
  void (**v28)(id, _QWORD);
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 buf;
  uint64_t v34;
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[BCSURLAction url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "_bcs_isHTTPFamilyURL"))
  {

    goto LABEL_11;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x2020000000;
  v9 = getCPSClipsFeatureEnabledSymbolLoc_ptr_0;
  v35 = getCPSClipsFeatureEnabledSymbolLoc_ptr_0;
  if (!getCPSClipsFeatureEnabledSymbolLoc_ptr_0)
  {
    v10 = (void *)ClipServicesLibrary_0();
    v9 = dlsym(v10, "CPSClipsFeatureEnabled");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v9;
    getCPSClipsFeatureEnabledSymbolLoc_ptr_0 = v9;
  }
  _Block_object_dispose(&buf, 8);
  if (!v9)
    -[BCSURLAction _resolveAppClipForURL:completion:].cold.1();
  v11 = ((uint64_t (*)(void))v9)();

  if ((v11 & 1) == 0)
    goto LABEL_11;
  -[BCSURLAction url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("https://found.apple.com/airtag?"));

  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[BCSURLAction url](self, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138739971;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSURLAction: detected an Find My URL, skip app clips checking. %{sensitive}@", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_11;
  }
  if ((_bcs_isHostAppEntitled() & 1) == 0)
  {
LABEL_11:
    v7[2](v7, 0);
    goto LABEL_12;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v16 = (void *)getCPSClipMetadataRequestClass_softClass_0;
  v32 = getCPSClipMetadataRequestClass_softClass_0;
  if (!getCPSClipMetadataRequestClass_softClass_0)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v34 = (uint64_t)__getCPSClipMetadataRequestClass_block_invoke_0;
    v35 = &unk_24D787158;
    v36 = &v29;
    __getCPSClipMetadataRequestClass_block_invoke_0((uint64_t)&buf);
    v16 = (void *)v30[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v29, 8);
  v18 = [v17 alloc];
  -[BCSURLAction url](self, "url");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithURL:", v19);

  if ((objc_msgSend(v20, "isLikelyAvailable") & 1) != 0)
  {
    -[BCSURLAction _appclipLaunchReason](self, "_appclipLaunchReason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sessionConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLaunchReason:", v21);

    if (-[BCSURLAction _isVisualCode](self, "_isVisualCode")
      && (objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "bundleIdentifier"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.BarcodeScanner")),
          v24,
          v23,
          (v25 & 1) == 0))
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __49__BCSURLAction__resolveAppClipForURL_completion___block_invoke;
      v26[3] = &unk_24D788100;
      v26[4] = self;
      v27 = v20;
      v28 = v7;
      objc_msgSend(v27, "requestMetadataWithCompletion:", v26);

    }
    else
    {
      -[BCSAction setClipMetadataRequest:](self, "setClipMetadataRequest:", v20);
      v7[2](v7, 1);
    }
  }
  else
  {
    v7[2](v7, 0);
  }

LABEL_12:
}

void __49__BCSURLAction__resolveAppClipForURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  if (!a3)
    objc_msgSend(*(id *)(a1 + 32), "setClipMetadataRequest:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "clipMetadataRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v5 != 0);

}

- (void)determineActionabilityWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!-[BCSURLAction _tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:](self, "_tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:", v4))
  {
    -[BCSURLAction url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__BCSURLAction_determineActionabilityWithCompletionHandler___block_invoke;
    v6[3] = &unk_24D788150;
    v6[4] = self;
    v7 = v4;
    -[BCSURLAction _resolveAppClipForURL:completion:](self, "_resolveAppClipForURL:completion:", v5, v6);

  }
}

void __60__BCSURLAction_determineActionabilityWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  if (a2)
  {
    v11 = 0;
    v3 = objc_msgSend(objc_alloc((Class)getLSApplicationRecordClass()), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilesafari"), 0, &v11);
    v4 = v11;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v3;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "codeType") == 3
         && (objc_msgSend(*(id *)(a1 + 32), "_allowAppClipCodeUniversalLinkFallback") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__BCSURLAction_determineActionabilityWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_24D788128;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "_resolveTargetApplicationForURL:completionHandler:", v8, v9);

  }
}

uint64_t __60__BCSURLAction_determineActionabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  CoreTelephonyClient *v19;
  CoreTelephonyClient *coreTelephonyClient;
  CoreTelephonyClient *v21;
  BOOL v22;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  -[BCSURLAction url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("x-esim://")) & 1) != 0
    || objc_msgSend(v7, "hasPrefix:", CFSTR("lpa:")))
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v8)
      -[BCSURLAction _tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v16 = (void *)getCoreTelephonyClientClass_softClass;
    v30 = getCoreTelephonyClientClass_softClass;
    v17 = MEMORY[0x24BDAC760];
    if (!getCoreTelephonyClientClass_softClass)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __getCoreTelephonyClientClass_block_invoke;
      v26[3] = &unk_24D787158;
      v26[4] = &v27;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)v26);
      v16 = (void *)v28[3];
    }
    v18 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v27, 8);
    v19 = (CoreTelephonyClient *)objc_msgSend([v18 alloc], "initWithQueue:", 0);
    coreTelephonyClient = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v19;

    v21 = self->_coreTelephonyClient;
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke;
    v24[3] = &unk_24D788178;
    v24[4] = self;
    v25 = v4;
    -[CoreTelephonyClient getActionForCardData:completionHandler:](v21, "getActionForCardData:completionHandler:", v6, v24);

    v22 = 1;
  }
  else
  {
    if (-[BCSURLAction _isCodeFromQRScanner](self, "_isCodeFromQRScanner"))
      _bcs_isHostAppEntitled();
    v22 = 0;
  }

  return v22;
}

void __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(void);
  id *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v6 = a2;
  v7 = a3;
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v7)
      goto LABEL_3;
  }
  else if (v7)
  {
LABEL_3:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_2(v7);
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_11;
  }
  v17 = *(id **)(a1 + 32);
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_resolveTargetApplicationForURL:completionHandler:", v24, *(_QWORD *)(a1 + 40));

    goto LABEL_12;
  }
  objc_storeStrong(v17 + 19, a2);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_1(a1 + 32, 152, v18, v19, v20, v21, v22, v23);
  v16 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_11:
  v16();
LABEL_12:

}

- (BOOL)mustOpenAppLinkInApp
{
  NSUInteger v3;
  void *v4;
  BOOL v5;

  if (-[BCSURLAction _hasCellularPlanAction](self, "_hasCellularPlanAction"))
    goto LABEL_5;
  v3 = -[NSArray count](self->_appLinks, "count");
  if (v3)
  {
    if (v3 == 1)
    {
      -[NSArray firstObject](self->_appLinks, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[BCSURLAction _shouldOpenInAppForAppLink:](self, "_shouldOpenInAppForAppLink:", v4);

      LOBYTE(v3) = v5;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)appLinks
{
  return self->_appLinks;
}

- (unint64_t)appLinkCount
{
  return -[NSArray count](self->_appLinks, "count");
}

- (void)_resolveTargetApplicationForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id LSAppLinkClass;
  _QWORD v27[5];
  id v28;
  void (**v29)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v8)
    -[BCSURLAction _resolveTargetApplicationForURL:completionHandler:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
  if (_bcs_isDeviceLocked())
    v16 = _bcs_isCurrentProcessBarcodeScanner() ^ 1;
  else
    LOBYTE(v16) = 0;
  self->_deviceDataIsUnavailable = v16;
  if (-[BCSURLAction _shouldBlockHandlingURL:](self, "_shouldBlockHandlingURL:", v6))
  {
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v17)
      -[BCSURLAction _resolveTargetApplicationForURL:completionHandler:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    v7[2](v7, 0);
  }
  else if ((_bcs_isHostAppEntitled() & 1) != 0)
  {
    -[BCSURLAction _requiresOpenInTargetApplication](self, "_requiresOpenInTargetApplication");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_storeStrong((id *)&self->_userVisibleAppRecord, v25);
      v7[2](v7, 1);
    }
    else
    {
      LSAppLinkClass = getLSAppLinkClass();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke;
      v27[3] = &unk_24D7881A0;
      v27[4] = self;
      v29 = v7;
      v28 = v6;
      objc_msgSend(LSAppLinkClass, "getAppLinksWithURL:completionHandler:", v28, v27);

    }
  }
  else
  {
    -[BCSURLAction _queryApplicationRecordForURL:completionHandler:](self, "_queryApplicationRecordForURL:completionHandler:", v6, v7);
  }

}

void __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a2;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_13;
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v5;

  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v8)
    __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
  objc_msgSend(*(id *)(a1 + 32), "preferredBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = v16 != 0;
  +[BCSAppRanker orderAppLinks:forLastUsedApp:](BCSAppRanker, "orderAppLinks:forLastUsedApp:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 104);
  *(_QWORD *)(v18 + 104) = v17;

  v20 = *(unsigned __int8 **)(a1 + 32);
  v21 = v20[128];
  if (!v20[128])
  {
    if ((unint64_t)objc_msgSend(v4, "count") > 1)
      goto LABEL_20;
    v25 = *(void **)(a1 + 32);
    objc_msgSend(v4, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "_shouldOpenInAppForAppLink:", v2))
    {

      goto LABEL_20;
    }
    v20 = *(unsigned __int8 **)(a1 + 32);
    if (!v20[128])
      goto LABEL_11;
  }
  if (!objc_msgSend(v20, "_allowAppClipCodeUniversalLinkFallback") || objc_msgSend(v4, "count") != 1)
  {
    if (!v21)
LABEL_11:

LABEL_12:
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "_queryApplicationRecordForURL:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    goto LABEL_23;
  }
  v22 = *(void **)(a1 + 32);
  objc_msgSend(v4, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "_shouldOpenInAppForAppLink:", v23);

  if (v21)
  {
    if (v24)
      goto LABEL_20;
    goto LABEL_12;
  }

  if ((v24 & 1) == 0)
    goto LABEL_12;
LABEL_20:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "targetApplicationRecord");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(void **)(v28 + 112);
  *(_QWORD *)(v28 + 112) = v27;

  v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v30)
    __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_23:
}

- (void)_queryApplicationRecordForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSArray *upiApplicationRecords;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  _BOOL4 v40;
  void *v41;
  char v42;
  uint64_t v43;
  _BOOL4 v44;
  void *v45;
  char v46;
  uint64_t v47;
  LSApplicationRecord *v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *userVisibleAppRecord;
  uint64_t v59;
  void *v60;
  LSApplicationRecord *v61;
  uint64_t v62;
  void *v63;
  void (**v64)(id, uint64_t);
  id v65;
  void *v66;
  void *v67;
  void *v68;
  BCSURLAction *v69;
  id v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[4];
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLOverrideForURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_bcs_isHostAppEntitled() & 1) != 0)
  {
    objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationsAvailableForOpeningURL:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = self;
    if (objc_msgSend(v9, "_bcs_isUPIURL") && (unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      v67 = v9;
      v64 = v7;
      v65 = v6;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v63 = v11;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v74;
        v17 = MEMORY[0x24BDACB70];
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v74 != v16)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v18);
            v20 = objc_alloc((Class)getLSApplicationRecordClass());
            objc_msgSend(v19, "bundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = 0;
            v22 = (void *)objc_msgSend(v20, "initWithBundleIdentifier:allowPlaceholder:error:", v21, 1, &v72);
            v23 = v72;

            if (v23 || !v22)
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.6(v77, v23, &v78);
            }
            else
            {
              objc_msgSend(v12, "addObject:", v22);
            }

            ++v18;
          }
          while (v15 != v18);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
        }
        while (v15);
      }

      if ((unint64_t)objc_msgSend(v12, "count") < 2)
      {
        v27 = 0;
        v7 = v64;
        v6 = v65;
        v9 = v67;
        self = v69;
      }
      else
      {
        self = v69;
        -[BCSURLAction preferredBundleID](v69, "preferredBundleID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[BCSAppRanker orderApplicationRecords:forPreferredBundleID:](BCSAppRanker, "orderApplicationRecords:forPreferredBundleID:", v12, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        upiApplicationRecords = v69->_upiApplicationRecords;
        v69->_upiApplicationRecords = (NSArray *)v25;

        -[NSArray firstObject](v69->_upiApplicationRecords, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v64;
        v6 = v65;
        v9 = v67;
      }

      v11 = v63;
    }
    else
    {
      v27 = 0;
    }
    objc_msgSend(v11, "firstObject");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v27 || !v28)
    {
LABEL_33:
      -[BCSAction data](self, "data");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "type");

      if (v39 == 12 || v39 == 9)
      {
        v40 = v27 != 0;
      }
      else
      {
        v40 = v27 != 0;
        if (!objc_msgSend(v6, "_bcs_hasScheme:", CFSTR("airplay")) && v27)
        {
          if ((objc_msgSend(v10, "isApplicationAvailableToOpenURL:includePrivateURLSchemes:error:", v9, 0, 0) & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.4(v9);
            goto LABEL_63;
          }
          v40 = 1;
        }
      }
      if (v69->_deviceDataIsUnavailable)
      {
        if (objc_msgSend(v27, "developerType") == 1
          && (objc_msgSend(v27, "applicationState"),
              v41 = (void *)objc_claimAutoreleasedReturnValue(),
              v42 = objc_msgSend(v41, "isRemovedSystemApp"),
              v41,
              (v42 & 1) == 0))
        {
          v61 = v27;
          userVisibleAppRecord = v69->_userVisibleAppRecord;
          v69->_userVisibleAppRecord = v61;
          v47 = (uint64_t)v69;
        }
        else
        {
          v43 = -[NSArray count](v69->_appLinks, "count");
          if (v43)
            v44 = 0;
          else
            v44 = v40;
          if (v44)
          {
            objc_msgSend(v27, "applicationState");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isInstalled");

            v47 = (uint64_t)v69;
            if ((v46 & 1) != 0)
            {
LABEL_56:
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.3(v47, (uint64_t)v6);
LABEL_58:
              v62 = 1;
LABEL_64:
              v7[2](v7, v62);

              goto LABEL_65;
            }
          }
          else
          {
            v47 = (uint64_t)v69;
            if (v43)
              goto LABEL_56;
          }
          v57 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(v9, "scheme");
          userVisibleAppRecord = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "_bcs_appStoreSearchURLWithScheme:", userVisibleAppRecord);
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = *(void **)(v47 + 136);
          *(_QWORD *)(v47 + 136) = v59;

        }
        goto LABEL_56;
      }
      objc_storeStrong((id *)&v69->_userVisibleAppRecord, v27);
      v48 = v69->_userVisibleAppRecord;
      v49 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v48)
      {
        if (v49)
          -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.2(v49, v50, v51, v52, v53, v54, v55, v56);
        goto LABEL_58;
      }
      if (v49)
        -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.1(v49, v50, v51, v52, v53, v54, v55, v56);
LABEL_63:
      v62 = 0;
      goto LABEL_64;
    }
    v30 = v11;
    v31 = objc_alloc((Class)getLSApplicationRecordClass());
    objc_msgSend(v29, "bundleIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0;
    v33 = (void *)objc_msgSend(v31, "initWithBundleIdentifier:allowPlaceholder:error:", v32, 1, &v71);
    v34 = v71;

    if (v34)
    {
      v66 = v10;
      v68 = v9;
      v35 = objc_alloc((Class)getLSApplicationRecordClass());
      objc_msgSend(v29, "bundleIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v34;
      v27 = (void *)objc_msgSend(v35, "initWithBundleIdentifierOfSystemPlaceholder:error:", v36, &v70);
      v37 = v70;

      if (v37)
      {
        v10 = v66;
        v11 = v30;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[BCSURLAction _queryApplicationRecordForURL:completionHandler:].cold.5(v37);

        v9 = v68;
        goto LABEL_32;
      }
      v10 = v66;
      v9 = v68;
    }
    else
    {
      v27 = v33;
    }
    v11 = v30;
LABEL_32:
    self = v69;
    goto LABEL_33;
  }
  v7[2](v7, 1);
LABEL_65:

}

- (LSApplicationRecord)targetApplication
{
  return self->_userVisibleAppRecord;
}

- (id)preferredBundleID
{
  void *v2;
  void *v3;

  -[BCSAction data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "preferredBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_allowAppClipCodeUniversalLinkFallback
{
  return -[BCSAction codeType](self, "codeType") == 3
      && -[BCSURLAction isApplePayInitiateAction](self, "isApplePayInitiateAction");
}

- (id)_requiresOpenInTargetApplication
{
  if (-[BCSURLAction isApplePayInitiateAction](self, "isApplePayInitiateAction")
    && -[BCSAction codeType](self, "codeType") != 3)
  {
    return (id)objc_msgSend(objc_alloc((Class)getLSApplicationRecordClass()), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilesafari"), 0, 0);
  }
  else
  {
    return 0;
  }
}

- (id)_actionDescriptionForAppClip
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[BCSAction clipMetadataRequest](self, "clipMetadataRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getClipMetadataSynchronously");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BCSAction detectedCode](self, "detectedCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "clipName");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v6;
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "isPoweredByThirdParty"))
  {
    objc_msgSend(v4, "clipCaption");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  _BCSLocalizedString(CFSTR("%@\nPowered by %@"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipCaption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullAppName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (id)_actionDescriptionForURL:(id)a3 application:(id)a4 shouldShowHostNameForSafariURL:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "isEqualToString:", v10);
  if (!v5 || !objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
LABEL_7:
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileStore")))
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = CFSTR("View in %@");
LABEL_10:
      _BCSLocalizedString(v18, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v14, v16);
      goto LABEL_11;
    }
    if (v13)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      _BCSLocalizedString(CFSTR("Open"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v14);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v8, "_bcs_isOtpauthURL"))
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Preferences")))
      {
        v17 = (void *)MEMORY[0x24BDD17C8];
        v18 = CFSTR("Add Verification Code in “%@”");
        goto LABEL_10;
      }
      v23 = CFSTR("Add Verification Code in Passwords");
    }
    else
    {
      if (!objc_msgSend(v8, "_bcs_isOtpauthMigrationURL"))
      {
        -[BCSURLAction url](self, "url");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "_bcs_isUPIURL");

        if (!v29)
        {
          v17 = (void *)MEMORY[0x24BDD17C8];
          v18 = CFSTR("Open in %@");
          goto LABEL_10;
        }
        objc_msgSend(v9, "localizedName");
        v25 = objc_claimAutoreleasedReturnValue();
LABEL_31:
        v19 = (void *)v25;
        goto LABEL_14;
      }
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Preferences")))
      {
        v17 = (void *)MEMORY[0x24BDD17C8];
        v18 = CFSTR("Add Verification Codes in “%@”");
        goto LABEL_10;
      }
      v23 = CFSTR("Add Verification Codes in Passwords");
    }
    _BCSLocalizedString(v23, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  objc_msgSend(v8, "_bcs_displayString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "length"))
  {

    goto LABEL_7;
  }
  if (!v13)
  {
    -[BCSAction clipMetadataRequest](self, "clipMetadataRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(v9, "localizedName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD17C8];
      _BCSLocalizedString(CFSTR("Open “%@” in %@"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v27, v14, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    -[BCSURLAction _actionDescriptionForAppClip](self, "_actionDescriptionForAppClip");
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v19 = (void *)v22;
    goto LABEL_13;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  _BCSLocalizedString(CFSTR("Open “%@”"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v16, v14);
LABEL_11:
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

LABEL_13:
LABEL_14:

  return v19;
}

- (id)_actionDescriptionWithoutTargetApplicationForURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "_bcs_displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    _BCSLocalizedString(CFSTR("Open “%@” link"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _BCSLocalizedString(CFSTR("Open Link"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)_shouldOpenInAppForAppLink:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "openStrategy");
  if (v3 == 2)
    return 1;
  if (v3 == 1)
    return _bcs_isCurrentProcessSafari() ^ 1;
  return 0;
}

- (BOOL)_shouldBlockHandlingURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("data"));
  return (char)v3;
}

- (BOOL)_isCodeFromQRScanner
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.BarcodeScanner")) & 1) != 0
    || -[BCSURLAction _isVisualCode](self, "_isVisualCode");

  return v5;
}

- (BOOL)_isVisualCode
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BCSAction codePayload](self, "codePayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "codeType") == 1 || objc_msgSend(v3, "codeType") == 3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isAMSAction
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[BCSURLAction url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24D793390, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)contentPreviewString
{
  void *v3;
  void *v4;
  void *v6;
  objc_super v7;

  if (-[BCSURLAction _willOpenInSafari](self, "_willOpenInSafari"))
  {
    -[BCSURLAction url](self, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    -[BCSAction clipMetadataRequest](self, "clipMetadataRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      return 0;
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)BCSURLAction;
      -[BCSAction contentPreviewString](&v7, sel_contentPreviewString);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
}

- (id)_menuElementForActionPicker:(id)a3
{
  id v3;
  id UIActionClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  UIActionClass = getUIActionClass();
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__BCSURLAction__menuElementForActionPicker___block_invoke;
  v11[3] = &unk_24D787328;
  v12 = v3;
  v8 = v3;
  objc_msgSend(UIActionClass, "actionWithTitle:image:identifier:handler:", v5, v6, v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __44__BCSURLAction__menuElementForActionPicker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction");
}

- (id)menuElements
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  BCSCopyActionPickerItem *v7;
  void *v8;
  BCSCopyActionPickerItem *v9;
  BCSShareActionPickerItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  -[BCSAction detectedCode](self, "detectedCode");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[BCSURLAction url](self, "url"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_bcs_isUPIURL"),
        v5,
        v4,
        v6))
  {
    v7 = [BCSCopyActionPickerItem alloc];
    -[BCSURLAction url](self, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BCSCopyActionPickerItem initWithAction:urlToCopy:](v7, "initWithAction:urlToCopy:", self, v8);

    v10 = -[BCSShareActionPickerItem initWithAction:]([BCSShareActionPickerItem alloc], "initWithAction:", self);
    -[BCSURLAction _menuElementForActionPicker:](self, "_menuElementForActionPicker:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    -[BCSURLAction _menuElementForActionPicker:](self, "_menuElementForActionPicker:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(getUIMenuClass(), "menuWithTitle:image:identifier:options:children:", &stru_24D788C60, 0, 0, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)BCSURLAction;
    -[BCSAction menuElements](&v19, sel_menuElements);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BCSURLAction;
    -[BCSAction menuElements](&v18, sel_menuElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)menuElementsCount
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;
  objc_super v10;

  -[BCSAction detectedCode](self, "detectedCode");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[BCSURLAction url](self, "url"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_bcs_isUPIURL"),
        v5,
        v4,
        v6))
  {
    -[BCSURLAction menuElements](self, "menuElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BCSURLAction;
    return -[BCSAction menuElementsCount](&v10, sel_menuElementsCount);
  }
}

- (BOOL)isPasskeyAction
{
  return -[BCSURLAction isPasskeyAssertionAction](self, "isPasskeyAssertionAction")
      || -[BCSURLAction isPasskeyRegistrationAction](self, "isPasskeyRegistrationAction");
}

- (BOOL)isPasskeyAssertionAction
{
  return -[BCSAction payloadDataType](self, "payloadDataType") == 13;
}

- (BOOL)isPasskeyRegistrationAction
{
  return -[BCSAction payloadDataType](self, "payloadDataType") == 14;
}

- (BOOL)isApplePayInitiateAction
{
  return -[BCSAction payloadDataType](self, "payloadDataType") == 16;
}

- (id)_passkeyAssertionActionDescription
{
  return _BCSLocalizedString(CFSTR("Sign in with a passkey"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (id)_passkeyRegistrationActionDescription
{
  return _BCSLocalizedString(CFSTR("Save a passkey"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (id)_applePayActionDescription
{
  return CFSTR("Apple Pay");
}

- (BOOL)hasPreferredAppLink
{
  return self->_hasPreferredAppLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularPlanAction, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_appStoreSearchURLForUnsupportedScheme, 0);
  objc_storeStrong((id *)&self->_upiApplicationRecords, 0);
  objc_storeStrong((id *)&self->_userVisibleAppRecord, 0);
  objc_storeStrong((id *)&self->_appLinks, 0);
}

- (void)shortDescription
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "targetApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v3, "BCSURLAction: we shouldn't show the non system app name in lock screen for bundle ID: %{private}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)actionPickerItems
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: -actionPickerItems is called on an invalid action", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_appclipLaunchReason
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCPSSessionLaunchReasonNFC(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSURLAction.m"), 73, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

- (void)performActionWithOptions:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "targetApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v3, "BCSURLAction: cannot open app [%@] with sensitive URL.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)performDefaultActionWithFBOptions:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: No target application to open", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSURLAction: Error performing CTCellularPlanManagerCameraScanAction: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_75_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: Clip is indicated to be available, however clip request failed with CPSErrorClipURLUnavailable. Handling with LSApplicationWorkspace operation.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __50__BCSURLAction_performDefaultActionWithFBOptions___block_invoke_75_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSURLAction: Error performing app clip open action: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

void __29__BCSURLAction_performAction__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BSURLAction: performActionWithCompletion failed with error: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)_resolveAppClipForURL:completion:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _CPSClipsFeatureEnabled(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSURLAction.m"), 74, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

- (void)_tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: Getting action for e-SIM", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: got CTCellularPlanQRCodeAction %{private}@", a5, a6, a7, a8, 3u);
}

void __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSURLAction: error getting CTCellularPlanQRCodeAction: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

void __92__BCSURLAction__tryDetermineActionabilityForSpecialCodesFromQRScannerWithCompletionHandler___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: -[CoreTelephonyClient getActionForCardData]-->completionHandler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_resolveTargetApplicationForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: URL is blocked from being handled", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_resolveTargetApplicationForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: Begin resolving target application for URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: Resolved default URL action uses app link", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __66__BCSURLAction__resolveTargetApplicationForURL_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: Found app links for URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queryApplicationRecordForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: Cannot find application to open URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queryApplicationRecordForURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLAction: Found application for opening URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queryApplicationRecordForURL:(uint64_t)a1 completionHandler:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 112), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  v5 = 2113;
  v6 = a2;
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "BCSURLAction: Device is locked when resolving target application with bundleID %{private}@ for URL %{private}@", v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)_queryApplicationRecordForURL:(void *)a1 completionHandler:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSURLAction: Ignoring resolved URL with private scheme '%{private}@'", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)_queryApplicationRecordForURL:(void *)a1 completionHandler:.cold.5(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSURLAction: Failed to get application record %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)_queryApplicationRecordForURL:(_QWORD *)a3 completionHandler:.cold.6(uint8_t *a1, void *a2, _QWORD *a3)
{
  void *v5;

  objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v5;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSURLAction: Failed to get application record %{public}@", a1, 0xCu);

}

@end
