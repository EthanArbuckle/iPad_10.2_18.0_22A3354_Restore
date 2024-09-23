@implementation BCSAction

+ (void)getActionWithData:(id)a3 codePayload:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  __objc2_class **v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = off_24D786B08;
  switch(objc_msgSend(v7, "type"))
  {
    case 0:
      v10 = off_24D786B18;
      goto LABEL_4;
    case 1:
    case 6:
    case 9:
    case 11:
    case 12:
    case 13:
    case 14:
    case 16:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v10 = off_24D786B48;
      goto LABEL_4;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
      goto LABEL_4;
    case 8:
      v10 = &off_24D786B50;
      goto LABEL_4;
    case 10:
      v10 = off_24D786B40;
      goto LABEL_4;
    case 15:
      v10 = off_24D786AF8;
LABEL_4:
      v11 = objc_msgSend(objc_alloc(*v10), "initWithData:codePayload:", v7, v8);
      if (!v11)
        goto LABEL_6;
      v12 = (void *)v11;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __61__BCSAction_getActionWithData_codePayload_completionHandler___block_invoke;
      v14[3] = &unk_24D7872B0;
      v18 = v9;
      v15 = v12;
      v16 = v7;
      v17 = v8;
      v13 = v12;
      objc_msgSend(v13, "determineActionabilityWithCompletionHandler:", v14);

      break;
    default:
LABEL_6:
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
      break;
  }

}

void __61__BCSAction_getActionWithData_codePayload_completionHandler___block_invoke(_QWORD *a1, int a2)
{
  uint64_t v2;
  BCSInvalidDataAction *v3;

  v2 = a1[7];
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(a1[7], a1[4]);
  }
  else
  {
    v3 = -[BCSInvalidDataAction initWithData:codePayload:]([BCSInvalidDataAction alloc], "initWithData:codePayload:", a1[5], a1[6]);
    (*(void (**)(uint64_t, BCSInvalidDataAction *))(v2 + 16))(v2, v3);

  }
}

- (BCSAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v7;
  id v8;
  BCSAction *v9;
  BCSAction *v10;
  BCSAction *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCSAction;
  v9 = -[BCSAction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_codePayload, a4);
    v11 = v10;
  }

  return v10;
}

- (int64_t)type
{
  return -[BCSParsedDataPrivate type](self->_data, "type");
}

- (void)showActionPicker
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "%@: -[BCSAction presentingViewControllerForAction:] must be implemented to perform action.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (NSString)localizedDefaultActionTitle
{
  return (NSString *)&stru_24D788C60;
}

- (void)performDefaultAction
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCSAction.m"), 197, CFSTR("Subclasses must implement this"));

}

- (NSString)localizedDefaultActionDescription
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCSAction.m"), 202, CFSTR("Subclasses must implement this"));

  return (NSString *)_BCSLocalizedString(CFSTR("Open"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
}

- (NSString)defaultActionTargetApplicationBundleIdentifier
{
  return 0;
}

- (NSArray)actionPickerItems
{
  BCSActionPickerItem *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[BCSActionPickerItem initWithAction:]([BCSActionPickerItem alloc], "initWithAction:", self);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)debugDescriptionDictionary
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("actionClass");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("actionDescription");
  -[BCSAction localizedActionDescription](self, "localizedActionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("defaultActionDescription");
  -[BCSAction localizedDefaultActionDescription](self, "localizedDefaultActionDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BCSAction debugDescriptionExtraInfoDictionary](self, "debugDescriptionExtraInfoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("actionInfo"));
  }
  else
  {
    v9 = v7;
  }

  return (NSDictionary *)v9;
}

- (id)debugDescriptionExtraInfoDictionary
{
  return 0;
}

- (void)determineActionabilityWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t isHostAppEntitled;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a3;
  -[BCSAction data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 8)
    isHostAppEntitled = _bcs_isHostAppEntitled();
  else
    isHostAppEntitled = 1;
  v7[2](v7, isHostAppEntitled);

}

- (NSString)extraPreviewText
{
  return (NSString *)-[BCSParsedDataPrivate extraPreviewText](self->_data, "extraPreviewText");
}

- (int64_t)codeType
{
  BCSCodePayload *codePayload;

  codePayload = self->_codePayload;
  if (codePayload)
    return -[BCSCodePayload codeType](codePayload, "codeType");
  else
    return 1;
}

- (void)performActionWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__BCSAction_performActionWithCompletion___block_invoke;
  v6[3] = &unk_24D7872D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  _bcs_performActionAfterUnlock(v6);

}

void __41__BCSAction_performActionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  _bcs_frontBoardUnlockOptions();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performActionWithOptions:completion:", v3, *(_QWORD *)(a1 + 40));

}

- (void)performActionWithOptions:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  -[BCSAction performDefaultAction](self, "performDefaultAction");
  v5[2](v5, 0);

}

- (BOOL)preferItemsInSubmenu
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[BCSAction detectedCode](self, "detectedCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (_bcs_isCurrentProcessSafari())
    {
      -[BCSAction actionPickerItems](self, "actionPickerItems");
      v8 = 0u;
      v9 = 0u;
      v10 = 0u;
      v11 = 0u;
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
      {
        v5 = *(_QWORD *)v9;
        while (2)
        {
          for (i = 0; i != v3; i = (char *)i + 1)
          {
            if (*(_QWORD *)v9 != v5)
              objc_enumerationMutation(v4);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "canGroupInSubmenu", (_QWORD)v8) & 1) != 0)
            {
              LOBYTE(v3) = 1;
              goto LABEL_14;
            }
          }
          v3 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          if (v3)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)subMenuWithMenuItems:(id)a3
{
  id v4;
  int64_t v5;
  id UIMenuClass;
  void *v7;
  id UIImageClass;
  const __CFString *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[BCSAction codeType](self, "codeType");
  UIMenuClass = getUIMenuClass();
  if (v5 == 3)
  {
    _BCSLocalizedString(CFSTR("App Clip Code MenuItem"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIImageClass = getUIImageClass();
    v9 = CFSTR("appclip");
  }
  else
  {
    _BCSLocalizedString(CFSTR("QR Code"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIImageClass = getUIImageClass();
    v9 = CFSTR("qrcode.viewfinder");
  }
  objc_msgSend(UIImageClass, "systemImageNamed:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(UIMenuClass, "menuWithTitle:image:identifier:options:children:", v7, v10, 0, 32, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)menuElements
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id UIActionClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[BCSAction actionPickerItems](self, "actionPickerItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        v9 = v4;
        v10 = v3;
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        UIActionClass = getUIActionClass();
        objc_msgSend(v11, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "icon");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __25__BCSAction_menuElements__block_invoke;
        v25[3] = &unk_24D787328;
        v25[4] = v11;
        objc_msgSend(UIActionClass, "actionWithTitle:image:identifier:handler:", v13, v14, v15, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v10;
        v4 = v9;
        if (objc_msgSend(v11, "useInlineMenu"))
          v17 = v3;
        else
          v17 = v9;
        objc_msgSend(v17, "addObject:", v16);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(getUIMenuClass(), "menuWithTitle:image:identifier:options:children:", &stru_24D788C60, 0, 0, 1, v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") && -[BCSAction preferItemsInSubmenu](self, "preferItemsInSubmenu"))
    {
      -[BCSAction subMenuWithMenuItems:](self, "subMenuWithMenuItems:", v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObject:", v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v4);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    if (!-[BCSAction preferItemsInSubmenu](self, "preferItemsInSubmenu"))
    {
      v21 = v4;
      goto LABEL_20;
    }
    -[BCSAction subMenuWithMenuItems:](self, "subMenuWithMenuItems:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_20:
  return (NSArray *)v21;
}

void __25__BCSAction_menuElements__block_invoke(uint64_t a1)
{
  _QWORD v1[5];

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = __25__BCSAction_menuElements__block_invoke_2;
  v1[3] = &unk_24D787300;
  v1[4] = *(_QWORD *)(a1 + 32);
  _bcs_performActionAfterUnlock(v1);
}

void __25__BCSAction_menuElements__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  _bcs_frontBoardUnlockOptions();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performActionWithFBOptions:", v2);

}

- (id)menuProvider
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __25__BCSAction_menuProvider__block_invoke;
  v3[3] = &unk_24D787350;
  v3[4] = self;
  return (id)MEMORY[0x219A0C7F8](v3, a2);
}

id __25__BCSAction_menuProvider__block_invoke(uint64_t a1)
{
  id UIMenuClass;
  void *v3;
  void *v4;
  void *v5;

  UIMenuClass = getUIMenuClass();
  objc_msgSend(*(id *)(a1 + 32), "contentPreviewString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "menuElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(UIMenuClass, "menuWithTitle:image:identifier:options:children:", v3, 0, 0, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)menuElementsCount
{
  void *v2;
  unint64_t v3;

  -[BCSAction actionPickerItems](self, "actionPickerItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (UIImage)actionIcon
{
  return (UIImage *)objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("qrcode"));
}

- (id)_fallbackDataTypeDisplayString
{
  int64_t v2;
  void *v3;
  __CFString *v4;

  v2 = -[BCSAction codeType](self, "codeType");
  switch(v2)
  {
    case 3:
      v4 = CFSTR("APP CLIP CODE DETECTED");
      goto LABEL_7;
    case 2:
      v4 = CFSTR("NFC TAG DETECTED");
      goto LABEL_7;
    case 1:
      v4 = CFSTR("QR CODE DETECTED");
LABEL_7:
      _BCSLocalizedString(v4, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (NSString)dataTypeDisplayString
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[BCSAction localizedDefaultActionTitle](self, "localizedDefaultActionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    -[BCSAction data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

    if (v7 == 10)
    {
      v8 = CFSTR("TEXT QR CODE");
LABEL_19:
      _BCSLocalizedString(v8, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (v7 == 8)
    {
      if ((MGGetBoolAnswer() & 1) != 0)
        v8 = CFSTR("WLAN QR CODE");
      else
        v8 = CFSTR("WI-FI QR CODE");
      goto LABEL_19;
    }
    if ((_bcs_isDeviceLocked() & 1) == 0
      && -[BCSAction shouldRequireUserToPickTargetApp](self, "shouldRequireUserToPickTargetApp"))
    {
      v8 = CFSTR("APP QR CODE");
      goto LABEL_19;
    }
    -[BCSAction clipMetadataRequest](self, "clipMetadataRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (-[BCSAction codeType](self, "codeType") == 3)
        v8 = CFSTR("APP CLIP CODE");
      else
        v8 = CFSTR("APP CLIP QR CODE");
      goto LABEL_19;
    }
    -[BCSAction defaultActionTargetApplicationBundleIdentifier](self, "defaultActionTargetApplicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
      {
        objc_msgSend(getLSApplicationProxyClass(), "applicationProxyForIdentifier:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BDD17C8];
        _BCSLocalizedString(CFSTR("%@ QR CODE"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v17, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_25;
      }
      _BCSLocalizedString(CFSTR("WEBSITE QR CODE"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BCSAction _fallbackDataTypeDisplayString](self, "_fallbackDataTypeDisplayString");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;
LABEL_25:

    return (NSString *)v13;
  }
  -[BCSAction localizedDefaultActionTitle](self, "localizedDefaultActionTitle");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_20:
  v13 = (void *)v5;
  return (NSString *)v13;
}

- (int64_t)payloadDataType
{
  void *v2;
  int64_t v3;

  -[BCSAction data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (BOOL)isLiveCameraOnlyAction
{
  return -[BCSAction isPasskeyAction](self, "isPasskeyAction")
      || -[BCSAction isApplePayInitiateAction](self, "isApplePayInitiateAction");
}

- (BCSActionDelegate)delegate
{
  return (BCSActionDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSURL)urlThatCanBeOpened
{
  return self->urlThatCanBeOpened;
}

- (NSArray)appLinks
{
  return self->appLinks;
}

- (BOOL)isInvalidDataAction
{
  return self->isInvalidDataAction;
}

- (BOOL)isWiFiAction
{
  return self->isWiFiAction;
}

- (CPSClipMetadataRequest)clipMetadataRequest
{
  return self->clipMetadataRequest;
}

- (void)setClipMetadataRequest:(id)a3
{
  objc_storeStrong((id *)&self->clipMetadataRequest, a3);
}

- (BOOL)shouldRequireUserToPickTargetApp
{
  return self->shouldRequireUserToPickTargetApp;
}

- (BOOL)hasSensitiveURL
{
  return self->hasSensitiveURL;
}

- (BOOL)isAMSAction
{
  return self->isAMSAction;
}

- (BOOL)isPasskeyAction
{
  return self->isPasskeyAction;
}

- (BOOL)isPasskeyAssertionAction
{
  return self->isPasskeyAssertionAction;
}

- (BOOL)isPasskeyRegistrationAction
{
  return self->isPasskeyRegistrationAction;
}

- (BOOL)isAirplayPairingAction
{
  return self->isAirplayPairingAction;
}

- (BOOL)isContinuityCameraAction
{
  return self->isContinuityCameraAction;
}

- (BOOL)isApplePayInitiateAction
{
  return self->isApplePayInitiateAction;
}

- (BCSDetectedCode)detectedCode
{
  return self->_detectedCode;
}

- (void)setDetectedCode:(id)a3
{
  objc_storeStrong((id *)&self->_detectedCode, a3);
}

- (NSString)contentPreviewString
{
  return self->_contentPreviewString;
}

- (BCSParsedDataPrivate)data
{
  return self->_data;
}

- (NSURL)url
{
  return self->_url;
}

- (BCSCodePayload)codePayload
{
  return self->_codePayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codePayload, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_contentPreviewString, 0);
  objc_storeStrong((id *)&self->_detectedCode, 0);
  objc_storeStrong((id *)&self->clipMetadataRequest, 0);
  objc_storeStrong((id *)&self->appLinks, 0);
  objc_storeStrong((id *)&self->urlThatCanBeOpened, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_actionPickerViewAssistant, 0);
}

@end
