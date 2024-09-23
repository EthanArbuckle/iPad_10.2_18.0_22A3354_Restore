@implementation BCSDataDetectorsSupportedAction

- (BCSDataDetectorsSupportedAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6;
  id v7;
  BCSDataDetectorsSupportedAction *v8;
  BCSDataDetectorsSupportedAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_8;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)BCSDataDetectorsSupportedAction;
  v8 = -[BCSAction initWithData:codePayload:](&v11, sel_initWithData_codePayload_, v6, v7);
  if (!v8)
  {
    self = 0;
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  self = v8;
  v9 = self;
LABEL_9:

  return v9;
}

- (id)url
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[BCSAction data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[BCSAction data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "url");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
      v11 = 0;
      return v11;
    }
    -[BCSAction data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scannerResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "coreResult");

    _bcs_urlFromDDResult(v10);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v7;

  return v11;
}

- (id)localizedActionDescription
{
  if (-[NSArray count](self->_actions, "count") < 2)
    -[BCSDataDetectorsSupportedAction localizedDefaultActionDescription](self, "localizedDefaultActionDescription");
  else
    _BCSLocalizedString(CFSTR("Choose Action"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedDefaultActionDescription
{
  void *v3;
  __CFString *v4;

  if (-[NSArray count](self->_actions, "count"))
  {
    -[NSArray firstObject](self->_actions, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationTitle");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_24D788C60;
  }
  return v4;
}

- (id)defaultActionTargetApplicationBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[NSArray firstObject](self->_actions, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "notificationIconBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)actionPickerItems
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BCSDataDetectionActionPickerItem *v10;
  BCSDataDetectionActionPickerItem *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_actions, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_actions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [BCSDataDetectionActionPickerItem alloc];
        v11 = -[BCSDataDetectionActionPickerItem initWithAction:ddAction:](v10, "initWithAction:ddAction:", self, v9, (_QWORD)v13);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)performDefaultAction
{
  -[BCSDataDetectorsSupportedAction _performActionAndShowActionPickerIfNeeded:](self, "_performActionAndShowActionPickerIfNeeded:", 0);
}

- (void)performAction
{
  -[BCSDataDetectorsSupportedAction _performActionAndShowActionPickerIfNeeded:](self, "_performActionAndShowActionPickerIfNeeded:", 1);
}

- (void)_performActionAndShowActionPickerIfNeeded:(BOOL)a3
{
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t v29[16];
  uint8_t buf[16];

  -[BCSAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 || !self->_defaultDDAction)
  {
    v6 = -[NSArray count](self->_actions, "count");
    if (v6)
    {
      v7 = v6;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "presentingViewControllerForAction:", self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (v7 == 1 || !a3)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v29 = 0;
              _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSDataDetectorsSupportedAction: performing default DDAction", v29, 2u);
            }
            objc_msgSend(getDDDetectionControllerClass(), "sharedController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray firstObject](self->_actions, "firstObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "view");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "performAction:inView:interactionDelegate:", v26, v27, 0);

            +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "logBarcodeActivatedEventForAction:", self);

          }
          else
          {
            -[BCSAction showActionPicker](self, "showActionPicker");
          }
        }
        else
        {
          v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v17)
            -[BCSDataDetectorsSupportedAction _performActionAndShowActionPickerIfNeeded:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
        }

      }
      else
      {
        v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v9)
          -[BCSDataDetectorsSupportedAction _performActionAndShowActionPickerIfNeeded:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSDataDetectorsSupportedAction: perform the default DD action.", buf, 2u);
    }
    if (_bcs_deviceIsPad() && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "sourceRectForPopoverActionPicker:", self);
      -[DDUIAction dd_performActionWithRect:](self->_defaultDDAction, "dd_performActionWithRect:");
    }
    else
    {
      -[DDUIAction dd_performAction](self->_defaultDDAction, "dd_performAction");
    }
  }

}

- (id)debugDescriptionExtraInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSDataDetectorsSupportedAction url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("url"));
  -[BCSAction data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BCSAction data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scannerResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _bcs_addressDictionaryFromScannerResult(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("address"));

  }
  -[BCSDataDetectorsSupportedAction _actionStringsArray](self, "_actionStringsArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("actions"));

  return v3;
}

- (void)determineActionabilityWithCompletionHandler:(id)a3
{
  void (**v4)(id, BOOL);
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  DDScannerResult *v9;
  DDScannerResult *scannerResult;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *icsString;
  char v18;
  void *v19;
  CNContact *v20;
  CNContact *contact;
  char v22;
  void *v23;
  NSArray *v24;
  NSArray *actions;
  NSUInteger v26;
  void *v27;
  NSArray *v28;
  NSArray *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, BOOL))a3;
  -[BCSAction data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[BCSAction data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "scannerResult");
    v9 = (DDScannerResult *)objc_claimAutoreleasedReturnValue();
    scannerResult = self->_scannerResult;
    self->_scannerResult = v9;

    v11 = -[DDScannerResult coreResult](self->_scannerResult, "coreResult");
    v12 = 0;
LABEL_9:
    v22 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();

  -[BCSAction data](self, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v14, "icsString");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    icsString = self->_icsString;
    self->_icsString = v16;

    v12 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    -[BCSDataDetectorsSupportedAction url](self, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[BCSAction data](self, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contact");
  v20 = (CNContact *)objc_claimAutoreleasedReturnValue();
  contact = self->_contact;
  self->_contact = v20;

  v12 = 0;
  v22 = 0;
  v11 = 0;
LABEL_10:
  objc_msgSend(getDDDetectionControllerClass(), "sharedController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "barcodeActionsForContext:URL:result:contact:ics:", 0, v12, v11, self->_contact, self->_icsString);
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actions = self->_actions;
  self->_actions = v24;

  v26 = -[NSArray count](self->_actions, "count");
  if ((v22 & 1) == 0 && v26 >= 2)
  {
    -[NSArray firstObject](self->_actions, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v29 = self->_actions;
    self->_actions = v28;

  }
  v4[2](v4, -[NSArray count](self->_actions, "count") != 0);

}

- (id)_actionStringsArray
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_actions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "localizedName", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)actionIcon
{
  id UIImageClass;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  DDUIAction *defaultDDAction;
  void *v9;
  void *v10;
  objc_super v11;

  -[BCSDataDetectorsSupportedAction _setUpActionMenuIfNeeded](self, "_setUpActionMenuIfNeeded");
  if (self->_contact)
  {
    UIImageClass = getUIImageClass();
    v4 = CFSTR("person.crop.circle.fill");
LABEL_5:
    objc_msgSend(UIImageClass, "systemImageNamed:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (self->_icsString)
  {
    UIImageClass = getUIImageClass();
    v4 = CFSTR("calendar");
    goto LABEL_5;
  }
  defaultDDAction = self->_defaultDDAction;
  if (defaultDDAction)
  {
    -[DDUIAction image](defaultDDAction, "image");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray firstObject](self->_actions, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSArray firstObject](self->_actions, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "icon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    v11.receiver = self;
    v11.super_class = (Class)BCSDataDetectorsSupportedAction;
    -[BCSAction actionIcon](&v11, sel_actionIcon);
    v5 = objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  v6 = (void *)v5;
  return v6;
}

- (id)shortDescription
{
  DDUIAction *defaultDDAction;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[BCSDataDetectorsSupportedAction _setUpActionMenuIfNeeded](self, "_setUpActionMenuIfNeeded");
  defaultDDAction = self->_defaultDDAction;
  if (defaultDDAction)
  {
    -[DDUIAction title](defaultDDAction, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[NSArray firstObject](self->_actions, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)BCSDataDetectorsSupportedAction;
    -[BCSAction shortDescription](&v9, sel_shortDescription);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[NSArray firstObject](self->_actions, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "compactTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_hostingViewForAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  -[BCSAction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "presentingViewControllerForAction:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v15)
        -[BCSDataDetectorsSupportedAction _hostingViewForAction].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
      v6 = 0;
    }

  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      -[BCSDataDetectorsSupportedAction _hostingViewForAction].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
    v6 = 0;
  }

  return v6;
}

- (void)_setUpActionMenuIfNeeded
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDataDetectorsSupportedAction: -[BCSDataDetectorSupportedAction _setUpActionMenuIfNeeded:] uses a dummy view for actions and menus, please file a radar!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

double __59__BCSDataDetectorsSupportedAction__setUpActionMenuIfNeeded__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (BOOL)preferItemsInSubmenu
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[BCSAction detectedCode](self, "detectedCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (_bcs_isCurrentProcessSafari())
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[UIMenu children](self->_ddUIMenu, "children", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "identifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.datadetectors.DDShareAction"));

            if ((v10 & 1) != 0)
            {
              LOBYTE(v3) = 1;
              goto LABEL_14;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
      LOBYTE(v3) = 0;
LABEL_14:

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)menuElements
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (self->_ddUIMenu)
  {
    v3 = -[BCSDataDetectorsSupportedAction preferItemsInSubmenu](self, "preferItemsInSubmenu");
    -[UIMenu children](self->_ddUIMenu, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[BCSAction subMenuWithMenuItems:](self, "subMenuWithMenuItems:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v9[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BCSDataDetectorsSupportedAction;
    -[BCSAction menuElements](&v8, sel_menuElements);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (unint64_t)menuElementsCount
{
  UIMenu *ddUIMenu;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[BCSDataDetectorsSupportedAction _setUpActionMenuIfNeeded](self, "_setUpActionMenuIfNeeded");
  ddUIMenu = self->_ddUIMenu;
  if (ddUIMenu)
  {
    -[UIMenu children](ddUIMenu, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BCSDataDetectorsSupportedAction;
    return -[BCSAction menuElementsCount](&v7, sel_menuElementsCount);
  }
}

- (id)contentPreviewString
{
  UIMenu *ddUIMenu;
  void *v4;
  objc_super v6;

  -[BCSDataDetectorsSupportedAction _setUpActionMenuIfNeeded](self, "_setUpActionMenuIfNeeded");
  ddUIMenu = self->_ddUIMenu;
  if (ddUIMenu)
  {
    -[UIMenu title](ddUIMenu, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BCSDataDetectorsSupportedAction;
    -[BCSAction contentPreviewString](&v6, sel_contentPreviewString);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (DDScannerResult)scannerResult
{
  return self->_scannerResult;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)icsString
{
  return self->_icsString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icsString, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_defaultDDAction, 0);
  objc_storeStrong((id *)&self->_ddUIMenu, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)_performActionAndShowActionPickerIfNeeded:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDataDetectorsSupportedAction: -[BCSAction presentingViewControllerForAction:] must return non-nil view controller to perform action.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_performActionAndShowActionPickerIfNeeded:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDataDetectorsSupportedAction: -[BCSAction presentingViewControllerForAction:] must be implemented to perform action.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_hostingViewForAction
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDataDetectorsSupportedAction: -[BCSDataDetectorSupportedAction _hostingViewForAction:] must be implemented to perform action.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
