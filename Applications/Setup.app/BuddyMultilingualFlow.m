@implementation BuddyMultilingualFlow

+ (BOOL)controllerNeedsToRun
{
  return (BYSetupAssistantHasCompletedInitialRun(a1, a2) ^ 1) & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  ProximitySetupController *v3;
  unsigned __int8 v4;
  char v5;
  id v6;
  BuddyMultilingualDataModelProviderCollection *v7;
  NSArray *v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  unsigned __int8 v12;
  char v13;
  id v14;
  id v15;
  os_log_type_t v16;
  os_log_t v17;
  id v18;
  char v19;
  char v20;
  char v21;
  id v22;
  id v23;
  int v24;
  id v25;
  id v26;
  id v27;
  os_log_type_t v28;
  os_log_t oslog;
  id v30;
  char v31;
  char v32;
  char v33;
  id location[2];
  BuddyMultilingualFlow *v35;
  uint8_t v36[24];
  _QWORD v37[3];
  uint8_t buf[40];

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualFlow proximitySetupController](v35, "proximitySetupController");
  v4 = -[ProximitySetupController hasAppliedSettings](v3, "hasAppliedSettings");

  v33 = v4 & 1;
  v32 = +[DMCMultiUserModeUtilities shouldSkipLanguageAndLocaleSetupForNewUsers](DMCMultiUserModeUtilities, "shouldSkipLanguageAndLocaleSetupForNewUsers") & 1;
  v31 = 0;
  v5 = 0;
  if ((v4 & 1) == 0)
    v5 = v32 ^ 1;
  v31 = v5 & 1;
  v30 = objc_retainBlock(&stru_1002838B0);
  oslog = (os_log_t)(id)_BYLoggingFacility(v30);
  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (id)(*((uint64_t (**)(id, _QWORD))v30 + 2))(v30, v31 & 1);
    v26 = (id)(*((uint64_t (**)(id, _QWORD))v30 + 2))(v30, v33 & 1);
    v25 = (id)(*((uint64_t (**)(id, _QWORD))v30 + 2))(v30, v32 & 1);
    sub_100155F94((uint64_t)buf, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25);
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "BuddyMultilingualFlow needs to run %{public}@ because proximityFlag was %{public}@, shared iPad flag was %{public}@", buf, 0x20u);

    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ((v31 & 1) != 0)
  {
    v23 = +[BuddyMultilingualDataModelProvider instanceForKeyboardSelector](BuddyMultilingualDataModelProvider, "instanceForKeyboardSelector");
    v22 = +[BuddyMultilingualDataModelProvider instanceForDictationSelectorExpress](BuddyMultilingualDataModelProvider, "instanceForDictationSelectorExpress");
    v6 = +[BuddyMultilingualDataModelProvider instanceForDictationSelector](BuddyMultilingualDataModelProvider, "instanceForDictationSelector");
    -[BuddyMultilingualFlow setDictationProvider:](v35, "setDictationProvider:", v6);

    v7 = -[BuddyMultilingualDataModelProviderCollection initWithKeyboardProvider:withDictationProvider:]([BuddyMultilingualDataModelProviderCollection alloc], "initWithKeyboardProvider:withDictationProvider:", v23, v22);
    -[BuddyMultilingualFlow setProviderCollection:](v35, "setProviderCollection:", v7);

    v37[0] = objc_opt_class(BuddyMultilingualExpressViewController);
    v37[1] = objc_opt_class(BuddyKeyboardLanguageOrderSelector);
    v37[2] = objc_opt_class(BuddyDictationLanguageOrderSelector);
    v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3);
    -[BuddyMultilingualFlow setClassList:](v35, "setClassList:", v8);

    v21 = 0;
    v9 = -[BuddyMultilingualFlow starter](v35, "starter");
    v10 = 0;
    if ((objc_msgSend(v9, "controllerNeedsToRunForClass:", objc_opt_class(BuddyKeyboardLanguageOrderSelector)) & 1) != 0)v10 = +[BuddyKeyboardLanguageOrderSelector needsFullscreenPane](BuddyKeyboardLanguageOrderSelector, "needsFullscreenPane");

    v21 = v10 & 1;
    v20 = 0;
    v11 = -[BuddyMultilingualFlow starter](v35, "starter");
    v12 = 0;
    if ((objc_msgSend(v11, "controllerNeedsToRunForClass:", objc_opt_class(BuddyDictationLanguageOrderSelector)) & 1) != 0)v12 = +[BuddyDictationLanguageOrderSelector needsFullscreenPane](BuddyDictationLanguageOrderSelector, "needsFullscreenPane");

    v20 = v12 & 1;
    v19 = 0;
    v13 = 1;
    if ((v21 & 1) == 0)
      v13 = v20;
    v19 = v13;
    if ((v13 & 1) == 0)
      -[BuddyMultilingualFlow _writeOutDictationDefaults](v35, "_writeOutDictationDefaults");
    v14 = objc_alloc_init((Class)NSMutableArray);
    v18 = v14;
    if ((v21 & 1) != 0)
      v14 = objc_msgSend(v18, "addObject:", CFSTR("Keyboards"));
    if ((v20 & 1) != 0)
      v14 = objc_msgSend(v18, "addObject:", CFSTR("Dictation"));
    v17 = (os_log_t)(id)_BYLoggingFacility(v14);
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
      sub_100038C28((uint64_t)v36, (uint64_t)v15);
      _os_log_impl((void *)&_mh_execute_header, v17, v16, "Language settings available for customization: %@", v36, 0xCu);

      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong((id *)&v17, 0);
    if (location[0])
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], v19 & 1);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
    v24 = 0;
  }
  else
  {
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v24 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (id)classList
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  _WORD v6[7];
  char v7;
  os_log_t oslog;
  objc_super v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyMultilingualFlow;
  location[0] = -[BuddyMultilingualFlow classList](&v9, "classList");
  if (!objc_msgSend(location[0], "count"))
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(0);
    v7 = 17;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      v2 = oslog;
      v3 = v7;
      sub_100038C3C(v6);
      _os_log_fault_impl((void *)&_mh_execute_header, v2, v3, "BuddyMultilingualFlow failed to set initial classList", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)firstItem
{
  id v2;
  objc_super v4;
  id location[2];
  BuddyMultilingualFlow *v6;

  v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualFlow;
  location[0] = -[BuddyMultilingualFlow firstItem](&v4, "firstItem");
  -[BuddyMultilingualFlow injectItemIfNeeded:forClass:](v6, "injectItemIfNeeded:forClass:", location[0], objc_opt_class(location[0]));
  v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v5;
  uint64_t v6;
  BuddyMultilingualDataModelProviderCollection *v7;
  char v8;
  objc_super v9;
  int v10;
  objc_super v11;
  id v12;
  id location[2];
  BuddyMultilingualFlow *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v5 = location[0];
  v6 = objc_opt_class(BuddyMultilingualExpressViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
    && (v7 = -[BuddyMultilingualFlow providerCollection](v14, "providerCollection"),
        v8 = !-[BuddyMultilingualDataModelProviderCollection expressFlowDidCustomize](v7, "expressFlowDidCustomize"),
        v7,
        (v8 & 1) != 0))
  {
    v11.receiver = v14;
    v11.super_class = (Class)BuddyMultilingualFlow;
    -[BuddyMultilingualFlow flowItemDone:nextItem:](&v11, "flowItemDone:nextItem:", location[0], 0);
    v10 = 1;
  }
  else
  {
    -[BuddyMultilingualFlow injectItemIfNeeded:forClass:](v14, "injectItemIfNeeded:forClass:", v12, objc_opt_class(v12));
    v9.receiver = v14;
    v9.super_class = (Class)BuddyMultilingualFlow;
    -[BuddyMultilingualFlow flowItemDone:nextItem:](&v9, "flowItemDone:nextItem:", location[0], v12);
    v10 = 0;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)injectItemIfNeeded:(id)a3 forClass:(Class)a4
{
  BuddyMultilingualDataModelProviderCollection *v5;
  BuddyMultilingualProvider *v6;
  BuddyMultilingualDataModelProvider *v7;
  BuddyMultilingualDataModelProviderCollection *v8;
  id v9;
  id v10;
  Class v11;
  id location[2];
  BuddyMultilingualFlow *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyMultilingualDataModelInjectable) & 1) != 0)
  {
    v10 = location[0];
    if (v11 == (Class)objc_opt_class(BuddyKeyboardLanguageOrderSelector))
    {
      v5 = -[BuddyMultilingualFlow providerCollection](v13, "providerCollection");
      v6 = -[BuddyMultilingualDataModelProviderCollection keyboardProvider](v5, "keyboardProvider");
      objc_msgSend(v10, "setProvider:", v6);

    }
    else if (v11 == (Class)objc_opt_class(BuddyDictationLanguageOrderSelector))
    {
      v7 = -[BuddyMultilingualFlow dictationProvider](v13, "dictationProvider");
      objc_msgSend(v10, "setProvider:", v7);

    }
    objc_storeStrong(&v10, 0);
  }
  else if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyMultilingualDataModelCollectionInjectable) & 1) != 0)
  {
    v9 = location[0];
    v8 = -[BuddyMultilingualFlow providerCollection](v13, "providerCollection");
    objc_msgSend(v9, "setProviderCollection:", v8);

    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  _QWORD v5[3];

  v5[0] = objc_opt_class(BuddyDictationLanguageOrderSelector);
  v5[1] = objc_opt_class(BuddyKeyboardLanguageOrderSelector);
  v5[2] = objc_opt_class(BuddyMultilingualExpressViewController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

- (void)_writeOutDictationDefaults
{
  id v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = +[BuddyMultilingualDataModelProvider instanceForDictationSelectorExpress](BuddyMultilingualDataModelProvider, "instanceForDictationSelectorExpress");
  v2 = objc_msgSend(location[0], "createDataSourceForPreselectedItems");
  +[BuddyDictationLanguageOrderSelector writePreferredDictationLanguagesToSystem:](BuddyDictationLanguageOrderSelector, "writePreferredDictationLanguagesToSystem:", v2);

  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BYDeviceProvider)expressFlowCustomizable
{
  return self->_expressFlowCustomizable;
}

- (void)setExpressFlowCustomizable:(id)a3
{
  objc_storeStrong((id *)&self->_expressFlowCustomizable, a3);
}

- (BuddyMultilingualDataModelProviderCollection)providerCollection
{
  return self->_providerCollection;
}

- (void)setProviderCollection:(id)a3
{
  objc_storeStrong((id *)&self->_providerCollection, a3);
}

- (BuddyMultilingualDataModelProvider)dictationProvider
{
  return self->_dictationProvider;
}

- (void)setDictationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dictationProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationProvider, 0);
  objc_storeStrong((id *)&self->_providerCollection, 0);
  objc_storeStrong((id *)&self->_expressFlowCustomizable, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
}

@end
