@implementation BuddyMultilingualDataModelProvider

- (BuddyMultilingualDataModelProvider)initWithDefault:(id)a3 suggested:(id)a4 selected:(id)a5
{
  id v7;
  BuddyMultilingualDataModelProvider *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  BuddyMultilingualDataModelProvider *v15;
  objc_super v17;
  id v18;
  id v19;
  id location[2];
  id v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v7 = v21;
  v21 = 0;
  v17.receiver = v7;
  v17.super_class = (Class)BuddyMultilingualDataModelProvider;
  v8 = -[BuddyMultilingualDataModelProvider init](&v17, "init");
  v21 = v8;
  objc_storeStrong(&v21, v8);
  if (v8)
  {
    v9 = objc_msgSend(location[0], "copy");
    v10 = (void *)*((_QWORD *)v21 + 1);
    *((_QWORD *)v21 + 1) = v9;

    v11 = objc_msgSend(v19, "copy");
    v12 = (void *)*((_QWORD *)v21 + 2);
    *((_QWORD *)v21 + 2) = v11;

    v13 = objc_msgSend(v18, "copy");
    v14 = (void *)*((_QWORD *)v21 + 3);
    *((_QWORD *)v21 + 3) = v13;

  }
  v15 = (BuddyMultilingualDataModelProvider *)v21;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v21, 0);
  return v15;
}

- (id)createDataSourceItemsAvailableForAdding
{
  uint64_t (**v2)(_QWORD);
  id v3;

  v2 = (uint64_t (**)(_QWORD))-[BuddyMultilingualDataModelProvider suggestedDataProvider](self, "suggestedDataProvider", a2, self);
  v3 = (id)v2[2](v2);

  return v3;
}

- (id)createDataSourceForPreselectedItems
{
  uint64_t (**v2)(_QWORD);
  id v3;

  v2 = (uint64_t (**)(_QWORD))-[BuddyMultilingualDataModelProvider defaultDataProvider](self, "defaultDataProvider", a2, self);
  v3 = (id)v2[2](v2);

  return v3;
}

- (id)createDataSourceForSelectedItems
{
  uint64_t (**v2)(_QWORD);
  id v3;

  v2 = (uint64_t (**)(_QWORD))-[BuddyMultilingualDataModelProvider selectedDataProvider](self, "selectedDataProvider", a2, self);
  v3 = (id)v2[2](v2);

  return v3;
}

+ (id)instanceForLanguageSelector
{
  return -[BuddyMultilingualDataModelProvider initWithDefault:suggested:selected:]([BuddyMultilingualDataModelProvider alloc], "initWithDefault:suggested:selected:", &stru_100281450, &stru_100281470, 0, a2, a1);
}

+ (id)instanceForKeyboardSelector
{
  return -[BuddyMultilingualDataModelProvider initWithDefault:suggested:selected:]([BuddyMultilingualDataModelProvider alloc], "initWithDefault:suggested:selected:", &stru_100281490, &stru_1002814B0, &stru_1002814D0, a2, a1);
}

+ (id)instanceForDictationSelector
{
  return -[BuddyMultilingualDataModelProvider initWithDefault:suggested:selected:]([BuddyMultilingualDataModelProvider alloc], "initWithDefault:suggested:selected:", &stru_1002814F0, &stru_100281510, 0, a2, a1);
}

+ (id)instanceForDictationSelectorExpress
{
  return -[BuddyMultilingualDataModelProvider initWithDefault:suggested:selected:]([BuddyMultilingualDataModelProvider alloc], "initWithDefault:suggested:selected:", &stru_100281530, &stru_100281550, 0, a2, a1);
}

+ (id)selectedLanguage
{
  NSArray *v2;
  id v3;
  NSAssertionHandler *v4;
  id v5;
  id location;
  SEL v8;
  id v9;

  v9 = a1;
  v8 = a2;
  v2 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
  v3 = -[NSArray firstObject](v2, "firstObject");
  location = +[NSLocale baseLanguageFromLanguage:](NSLocale, "baseLanguageFromLanguage:", v3);

  if (!location)
  {
    v4 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v4, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("BuddyMultilingualDataModelProvider.m"), 97, CFSTR("selectedLanguage should not be nil, it should have been set from the second pane in buddy."));

  }
  v5 = location;
  objc_storeStrong(&location, 0);
  return v5;
}

+ (id)_createLanguageSelectorDefaults
{
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  id location;
  uint64_t v17;
  os_log_type_t v18;
  os_log_t oslog;
  _QWORD __b[8];
  uint64_t v21;
  id v22;
  id v23[3];
  uint8_t buf[32];
  _BYTE v25[128];

  v23[2] = a1;
  v23[1] = (id)a2;
  v23[0] = +[NSLocale buddyDefaultLanguages](NSLocale, "buddyDefaultLanguages");
  v22 = objc_alloc_init((Class)NSMutableOrderedSet);
  memset(__b, 0, sizeof(__b));
  v2 = v23[0];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
  v4 = (unint64_t)v3;
  if (v3)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v2);
        v21 = *(_QWORD *)(__b[1] + 8 * v6);
        oslog = (os_log_t)(id)_BYLoggingFacility(v3);
        v18 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v7 = oslog;
          v8 = v18;
          v9 = +[BuddyMultilingualDataModelProvider selectedLanguage](BuddyMultilingualDataModelProvider, "selectedLanguage");
          v10 = v21;
          v11 = +[BuddyMultilingualDataModelProvider selectedLanguage](BuddyMultilingualDataModelProvider, "selectedLanguage");
          sub_100073860((uint64_t)buf, (uint64_t)v9, v10, objc_msgSend(v11, "isEqualToString:", v21) & 1);
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "Called from _createLanguageSelectorDefaults: currentLocale languageCode is %@, language from defaultLanguages:%@ and are they equal == %i", buf, 0x1Cu);

        }
        objc_storeStrong((id *)&oslog, 0);
        v17 = 3;
        v12 = +[BuddyMultilingualDataModelProvider selectedLanguage](BuddyMultilingualDataModelProvider, "selectedLanguage");
        v13 = objc_msgSend(v12, "isEqualToString:", v21);

        if ((v13 & 1) != 0)
          v17 = 0;
        location = +[BuddyMultilingualLanguageData withLanguage:defaults:editingOption:](BuddyMultilingualLanguageData, "withLanguage:defaults:editingOption:", v21, v23[0], v17);
        objc_msgSend(v22, "addObject:", location);
        objc_storeStrong(&location, 0);
        ++v6;
      }
      while (v6 < v4);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
      v4 = (unint64_t)v3;
    }
    while (v3);
  }

  v14 = objc_msgSend(v22, "array");
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
  return v14;
}

+ (id)_createLanguageSelectorAllData
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void **v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD *, void *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location;
  _QWORD __b[8];
  id v26;
  os_log_type_t v27;
  os_log_t v28;
  id v29;
  os_log_type_t v30;
  os_log_t oslog;
  id v32;
  id v33;
  id v34[3];
  uint8_t v35[128];
  uint8_t v36[16];
  uint8_t buf[24];

  v34[2] = a1;
  v34[1] = (id)a2;
  v34[0] = objc_alloc_init((Class)NSMutableOrderedSet);
  v33 = +[IPLanguageListManager manager](IPLanguageListManager, "manager");
  v32 = objc_msgSend(v33, "deviceLanguagesForChangingDeviceLanguage:", 0);
  oslog = (os_log_t)(id)_BYLoggingFacility(v32);
  v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v32);
    _os_log_impl((void *)&_mh_execute_header, oslog, v30, "Called from _createLanguageSelectorAllData: iPhone Languages from IPLanguageListManager %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v29 = objc_msgSend(v33, "otherLanguages");
  v28 = (os_log_t)(id)_BYLoggingFacility(v29);
  v27 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)v36, (uint64_t)v29);
    _os_log_impl((void *)&_mh_execute_header, v28, v27, "Called from _createLanguageSelectorAllData: Other Languages from IPLanguageListManager %@", v36, 0xCu);
  }
  objc_storeStrong((id *)&v28, 0);
  v2 = objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v29);
  v3 = v32;
  v32 = v2;

  memset(__b, 0, sizeof(__b));
  v4 = v32;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
  if (v5)
  {
    v6 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v5; ++i)
      {
        if (*(_QWORD *)__b[2] != v6)
          objc_enumerationMutation(v4);
        v26 = *(id *)(__b[1] + 8 * i);
        v8 = objc_msgSend(v26, "localizedStringForName");
        v9 = objc_msgSend(v26, "name");
        v10 = objc_msgSend(v26, "identifier");
        location = +[BuddyMultilingualLanguageData withLanguageMainDisplayText:secondaryDisplayText:identifier:isDefault:editingOption:](BuddyMultilingualLanguageData, "withLanguageMainDisplayText:secondaryDisplayText:identifier:isDefault:editingOption:", v8, v9, v10, 1, 3);

        objc_msgSend(v34[0], "addObject:", location);
        objc_storeStrong(&location, 0);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
    }
    while (v5);
  }

  v11 = +[NSLocale buddySuggestedLanguages](NSLocale, "buddySuggestedLanguages");
  v23 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v11);

  v12 = +[NSLocale buddyDefaultLanguages](NSLocale, "buddyDefaultLanguages");
  v22 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v12);

  v13 = v34[0];
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100073D00;
  v19 = &unk_100281578;
  v20 = v23;
  v21 = v22;
  objc_msgSend(v13, "sortUsingComparator:", &v16);
  v14 = objc_msgSend(v34[0], "array", v16, v17, v18, v19, v20);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(v34, 0);
  return v14;
}

+ (id)_createKeyboardSelectorDefaults
{
  id v2;
  id v3;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, void *, void *);
  void *v9;
  id v10;
  id v11;
  os_log_type_t v12;
  os_log_t oslog;
  id location;
  id v15;
  id v16[3];
  uint8_t buf[24];

  v16[2] = a1;
  v16[1] = (id)a2;
  v16[0] = +[NSLocale buddyDefaultKeyboards](NSLocale, "buddyDefaultKeyboards");
  v15 = objc_alloc_init((Class)NSMutableOrderedSet);
  location = objc_msgSend(v16[0], "buddy_mapCountedSet:", &stru_1002815B8);
  oslog = (os_log_t)(id)_BYLoggingFacility(location);
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Called from _createKeyboardSelectorDefaults: identifierSet %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v2 = v16[0];
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000741AC;
  v9 = &unk_1002815E0;
  v10 = location;
  v11 = v15;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v5);
  v3 = objc_msgSend(v15, "array");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  return v3;
}

+ (id)_createKeyboardSelectorAllData
{
  id v2;
  id v3;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *, void *);
  void *v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  os_log_t oslog;
  id location;
  id v15;
  id v16;
  id v17;
  id v18[3];
  uint8_t buf[24];

  v18[2] = a1;
  v18[1] = (id)a2;
  v18[0] = +[NSLocale buddyDefaultKeyboards](NSLocale, "buddyDefaultKeyboards");
  v17 = +[NSLocale buddySuggestedKeyboards](NSLocale, "buddySuggestedKeyboards");
  v16 = objc_alloc_init((Class)NSMutableOrderedSet);
  v15 = objc_msgSend(v18[0], "buddy_mapSet:", &stru_100281620);
  location = objc_msgSend(v17, "buddy_mapCountedSet:", &stru_100281640);
  oslog = (os_log_t)(id)_BYLoggingFacility(location);
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Called from _createKeyboardSelectorAllData: identifierSet %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v2 = v17;
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100074614;
  v8 = &unk_100281668;
  v9 = location;
  v10 = v15;
  v11 = v16;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v5);
  v3 = objc_msgSend(v16, "array", v5, v6, v7, v8, v9, v10);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  return v3;
}

+ (id)_createKeyboardSelectorSelectedData
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD **v18;
  id v19;
  id v20;
  id v21;
  _QWORD __b[8];
  id v23;
  os_log_type_t v24;
  os_log_t v25;
  id v26;
  id v27;
  id v28;
  id location;
  os_log_type_t v30;
  os_log_t v31;
  id v32;
  os_log_type_t v33;
  os_log_t oslog;
  id v35;
  id v36[3];
  uint8_t v37[128];
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t buf[16];

  v36[2] = a1;
  v36[1] = (id)a2;
  v36[0] = +[NSLocale buddyDefaultKeyboards](NSLocale, "buddyDefaultKeyboards");
  v2 = +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v35 = objc_msgSend(v2, "enabledInputModeIdentifiers");

  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v35);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "_createKeyboardSelectorSelectedData: enabled identifiers before aggregating sets %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v32 = +[UIKeyboardInputMode multilingualSetsFromInputModeIdentifiers:](UIKeyboardInputMode, "multilingualSetsFromInputModeIdentifiers:", v35);
  v31 = (os_log_t)(id)_BYLoggingFacility(v32);
  v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    location = objc_msgSend(v32, "buddy_mapArray:", &stru_100281688);
    sub_100038C28((uint64_t)v39, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, v31, v30, "_createKeyboardSelectorSelectedData: enabled identifiers after aggregating sets %@", v39, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&v31, 0);
  v28 = objc_alloc_init((Class)NSMutableOrderedSet);
  v27 = objc_msgSend(v36[0], "buddy_mapSet:", &stru_1002816A8);
  v26 = objc_msgSend(v32, "buddy_mapCountedSet:", &stru_1002816C8);
  v25 = (os_log_t)(id)_BYLoggingFacility(v26);
  v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)v38, (uint64_t)v26);
    _os_log_impl((void *)&_mh_execute_header, v25, v24, "_createKeyboardSelectorSelectedData: identifierSet %@", v38, 0xCu);
  }
  objc_storeStrong((id *)&v25, 0);
  memset(__b, 0, sizeof(__b));
  v4 = v32;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
  if (v5)
  {
    v18 = (_QWORD **)&__b[2];
    v6 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v5; ++i)
      {
        if (**v18 != v6)
          objc_enumerationMutation(v4);
        v23 = *(id *)(__b[1] + 8 * i);
        v21 = objc_msgSend(v23, "displayName", v18);
        v20 = 0;
        if ((unint64_t)objc_msgSend(v26, "countForObject:", v21) > 1)
        {
          v8 = objc_msgSend(v23, "identifier");
          v9 = (id)UIKeyboardLocalizedSWLayoutName(v8);
          v10 = v20;
          v20 = v9;

        }
        v11 = v21;
        v12 = v20;
        v13 = objc_msgSend(v23, "identifier");
        v14 = v27;
        v15 = objc_msgSend(v23, "identifier");
        v19 = +[BuddyMultilingualLanguageData withLanguageMainDisplayText:secondaryDisplayText:identifier:isDefault:editingOption:](BuddyMultilingualLanguageData, "withLanguageMainDisplayText:secondaryDisplayText:identifier:isDefault:editingOption:", v11, v12, v13, (unint64_t)objc_msgSend(v14, "containsObject:", v15) & 1, 3);

        objc_msgSend(v28, "addObject:", v19);
        objc_storeStrong(&v19, 0);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v21, 0);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
    }
    while (v5);
  }

  v16 = objc_msgSend(v28, "copy");
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(v36, 0);
  return v16;
}

+ (id)_createDictationSelectorDefaultsForExpress:(BOOL)a3
{
  return objc_msgSend(a1, "_createDictationSelectorIncludeSuggested:shouldIncludeUserSelectedKeyboards:", 0, !a3);
}

+ (id)_createDictationSelectorAllDataForExpress:(BOOL)a3
{
  return objc_msgSend(a1, "_createDictationSelectorIncludeSuggested:shouldIncludeUserSelectedKeyboards:", 1, !a3);
}

+ (id)_createDictationSelectorIncludeSuggested:(BOOL)a3 shouldIncludeUserSelectedKeyboards:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t i;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const __CFString *v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t j;
  id v23;
  id v24;
  id v25;
  id v27;
  _QWORD v28[8];
  id v29;
  id location;
  os_log_type_t v31;
  os_log_t oslog;
  id v33;
  id v34;
  _QWORD __b[8];
  id v36;
  id v37;
  id v38;
  BOOL v39;
  BOOL v40;
  SEL v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[24];
  _BYTE v45[128];

  v42 = a1;
  v41 = a2;
  v40 = a3;
  v39 = a4;
  v38 = +[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet");
  v37 = 0;
  if (v39)
  {
    v4 = +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = objc_msgSend(v4, "activeInputModes");
    v6 = v37;
    v37 = v5;

  }
  else
  {
    v7 = +[NSLocale buddyDefaultKeyboards](NSLocale, "buddyDefaultKeyboards");
    v8 = v37;
    v37 = v7;

  }
  memset(__b, 0, sizeof(__b));
  v9 = v37;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
  if (v10)
  {
    v11 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v10; ++i)
      {
        if (*(_QWORD *)__b[2] != v11)
          objc_enumerationMutation(v9);
        v36 = *(id *)(__b[1] + 8 * i);
        v13 = v38;
        v14 = objc_msgSend(v36, "languageWithRegion");
        objc_msgSend(v13, "addObject:", v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
    }
    while (v10);
  }

  v15 = +[TUIPreferencesController sharedPreferencesController](TUIPreferencesController, "sharedPreferencesController");
  v16 = objc_msgSend(v38, "array");
  v34 = objc_msgSend(v15, "suggestedDictationModesForKeyboardLanguages:", v16);

  v33 = objc_alloc_init((Class)NSMutableOrderedSet);
  oslog = (os_log_t)(id)_BYLoggingFacility(v33);
  v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v34, "description");
    location = v17;
    if (v40)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    sub_10003EB04((uint64_t)buf, (uint64_t)v17, (uint64_t)v18);
    _os_log_impl((void *)&_mh_execute_header, oslog, v31, "_createDictationSelectorDefaults dictation languages %@, inlude disabled %@", buf, 0x16u);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(v28, 0, sizeof(v28));
  v19 = v34;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v28, v43, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v28[2];
    do
    {
      for (j = 0; j < (unint64_t)v20; ++j)
      {
        if (*(_QWORD *)v28[2] != v21)
          objc_enumerationMutation(v19);
        v29 = *(id *)(v28[1] + 8 * j);
        if (v40 || (objc_msgSend(v29, "enabled") & 1) != 0)
        {
          v23 = objc_msgSend(v29, "displayName");
          v24 = objc_msgSend(v29, "identifier");
          v27 = +[BuddyMultilingualLanguageData withLanguageMainDisplayText:secondaryDisplayText:identifier:isDefault:editingOption:](BuddyMultilingualLanguageData, "withLanguageMainDisplayText:secondaryDisplayText:identifier:isDefault:editingOption:", v23, &stru_100284738, v24, 0, 2);

          objc_msgSend(v27, "setShowDetailText:", 0);
          objc_msgSend(v33, "addObject:", v27);
          objc_storeStrong(&v27, 0);
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v28, v43, 16);
    }
    while (v20);
  }

  v25 = objc_msgSend(v33, "array");
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  return v25;
}

- (id)defaultDataProvider
{
  return self->_defaultDataProvider;
}

- (void)setDefaultDataProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)suggestedDataProvider
{
  return self->_suggestedDataProvider;
}

- (void)setSuggestedDataProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)selectedDataProvider
{
  return self->_selectedDataProvider;
}

- (void)setSelectedDataProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedDataProvider, 0);
  objc_storeStrong(&self->_suggestedDataProvider, 0);
  objc_storeStrong(&self->_defaultDataProvider, 0);
}

@end
