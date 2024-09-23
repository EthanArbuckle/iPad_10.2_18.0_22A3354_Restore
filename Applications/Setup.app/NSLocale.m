@implementation NSLocale

+ (id)buddySubregionLocalesForCellularInformation:(id)a3
{
  NSLocale *v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t j;
  id v18;
  id v19;
  NSLocale *v20;
  NSString *v21;
  NSDictionary *v22;
  NSString *v23;
  id v24;
  id v26;
  id v27;
  id v28;
  _QWORD v29[8];
  id v30;
  _QWORD __b[8];
  id v32;
  id v33;
  id v34;
  id location[3];
  _BYTE v36[128];
  _BYTE v37[128];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = objc_alloc_init((Class)NSMutableArray);
  v3 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  v4 = -[NSLocale objectForKey:](v3, "objectForKey:", NSLocaleCountryCode);
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("IN"));

  if ((v5 & 1) != 0)
  {
    v33 = objc_alloc_init((Class)NSMutableOrderedSet);
    memset(__b, 0, sizeof(__b));
    v6 = location[0];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
    if (v7)
    {
      v8 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v7; ++i)
        {
          if (*(_QWORD *)__b[2] != v8)
            objc_enumerationMutation(v6);
          v32 = *(id *)(__b[1] + 8 * i);
          v10 = v33;
          v11 = objc_msgSend(v32, "homeSubregionISOCodes");
          objc_msgSend(v10, "addObjectsFromArray:", v11);

          v12 = v33;
          v13 = objc_msgSend(v32, "networkSubregionISOCodes");
          objc_msgSend(v12, "addObjectsFromArray:", v13);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", __b, v37, 16);
      }
      while (v7);
    }

    memset(v29, 0, sizeof(v29));
    v14 = v33;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v29, v36, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v29[2];
      do
      {
        for (j = 0; j < (unint64_t)v15; ++j)
        {
          if (*(_QWORD *)v29[2] != v16)
            objc_enumerationMutation(v14);
          v30 = *(id *)(v29[1] + 8 * j);
          v18 = objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_100284738);
          v28 = objc_msgSend(v18, "lowercaseString");

          v19 = objc_alloc((Class)NSMutableDictionary);
          v20 = +[NSLocale currentLocale](NSLocale, "currentLocale");
          v21 = -[NSLocale localeIdentifier](v20, "localeIdentifier");
          v22 = +[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:", v21);
          v27 = objc_msgSend(v19, "initWithDictionary:", v22);

          objc_msgSend(v27, "setValue:forKey:", v28, CFSTR("sd"));
          v23 = +[NSLocale localeIdentifierFromComponents:](NSLocale, "localeIdentifierFromComponents:", v27);
          v26 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v23);

          objc_msgSend(v34, "addObject:", v26);
          objc_storeStrong(&v26, 0);
          objc_storeStrong(&v27, 0);
          objc_storeStrong(&v28, 0);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v29, v36, 16);
      }
      while (v15);
    }

    objc_storeStrong(&v33, 0);
  }
  v24 = v34;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v24;
}

+ (id)buddySuggestedLanguages
{
  NSAssertionHandler *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  id v10;
  id v11;
  id v12;
  _QWORD v14[8];
  id v15;
  id location;
  id v17;
  id v18;
  id v19;
  SEL v20;
  id v21;
  _BYTE v22[128];

  v21 = a1;
  v20 = a2;
  v19 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  if (!v19)
  {
    v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v2, "handleFailureInMethod:object:file:lineNumber:description:", v20, v21, CFSTR("NSLocale+MultilingualFlow.m"), 47, CFSTR("locale should not be nil as it should have already been picked before arriving here!"));

  }
  v18 = objc_alloc_init(BYSIMRegionService);
  v3 = objc_msgSend(v18, "cellularNetworkInformation");
  v17 = +[NSLocale buddySubregionLocalesForCellularInformation:](NSLocale, "buddySubregionLocalesForCellularInformation:", v3);

  v4 = objc_alloc((Class)NSMutableOrderedSet);
  v5 = objc_msgSend(v19, "languagesForMultilingualSetup");
  location = objc_msgSend(v4, "initWithArray:", v5);

  memset(v14, 0, sizeof(v14));
  v6 = v17;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v14, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14[2];
    do
    {
      for (i = 0; i < (unint64_t)v7; ++i)
      {
        if (*(_QWORD *)v14[2] != v8)
          objc_enumerationMutation(v6);
        v15 = *(id *)(v14[1] + 8 * i);
        v10 = location;
        v11 = objc_msgSend(v15, "languagesForMultilingualSetup");
        objc_msgSend(v10, "addObjectsFromArray:", v11);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v14, v22, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(location, "array");
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

+ (id)buddyDefaultLanguages
{
  NSAssertionHandler *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  id v10;
  id v11;
  id v12;
  _QWORD v14[8];
  id v15;
  id location;
  id v17;
  id v18;
  id v19;
  SEL v20;
  id v21;
  _BYTE v22[128];

  v21 = a1;
  v20 = a2;
  v19 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  if (!v19)
  {
    v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v2, "handleFailureInMethod:object:file:lineNumber:description:", v20, v21, CFSTR("NSLocale+MultilingualFlow.m"), 63, CFSTR("locale should not be nil as it should have already been picked before arriving here!"));

  }
  v18 = objc_alloc_init(BYSIMRegionService);
  v3 = objc_msgSend(v18, "cellularNetworkInformation");
  v17 = +[NSLocale buddySubregionLocalesForCellularInformation:](NSLocale, "buddySubregionLocalesForCellularInformation:", v3);

  v4 = objc_alloc((Class)NSMutableOrderedSet);
  v5 = objc_msgSend(v19, "defaultLanguagesForMultilingualSetup");
  location = objc_msgSend(v4, "initWithArray:", v5);

  memset(v14, 0, sizeof(v14));
  v6 = v17;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v14, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14[2];
    do
    {
      for (i = 0; i < (unint64_t)v7; ++i)
      {
        if (*(_QWORD *)v14[2] != v8)
          objc_enumerationMutation(v6);
        v15 = *(id *)(v14[1] + 8 * i);
        v10 = location;
        v11 = objc_msgSend(v15, "defaultLanguagesForMultilingualSetup");
        objc_msgSend(v10, "addObjectsFromArray:", v11);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v14, v22, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(location, "array");
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

+ (id)buddySuggestedKeyboards
{
  id v2;
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  id v8;
  void **v9;
  int v10;
  int v11;
  id (*v12)(_QWORD *, void *);
  void *v13;
  id v14;
  id location;
  id v16[2];
  id v17;

  v17 = a1;
  v16[1] = (id)a2;
  v2 = +[NSLocale buddyDefaultLanguages](NSLocale, "buddyDefaultLanguages");
  v16[0] = objc_msgSend(v2, "mutableCopy");

  v3 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
  objc_msgSend(v16[0], "addObjectsFromArray:", v3);

  v9 = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_1000FDA58;
  v13 = &unk_100282EA8;
  v14 = v17;
  location = objc_msgSend(v16[0], "buddy_mapOrderedSet:", &v9);
  v4 = +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = objc_msgSend(location, "array");
  v8 = objc_msgSend(v4, "suggestedInputModesForLocales:", v5);

  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v16, 0);
  return v6;
}

+ (id)buddyDefaultKeyboards
{
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend(a1, "buddySuggestedKeyboards", a2, a1);
  v3 = objc_msgSend(v2, "buddy_filterToOrderedSet:", &stru_100282EE8);
  v4 = objc_msgSend(v3, "array");

  return v4;
}

+ (id)buddyLocaleIdentifierFromIdentifier:(id)a3 byAddingRegion:(id)a4
{
  NSDictionary *v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id location[3];
  NSString *v12;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v5 = +[NSLocale componentsFromLocaleIdentifier:](NSLocale, "componentsFromLocaleIdentifier:", location[0]);
  v9 = -[NSDictionary mutableCopy](v5, "mutableCopy");

  v6 = objc_msgSend(v9, "objectForKeyedSubscript:", NSLocaleCountryCode);
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v12 = (NSString *)location[0];
  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, NSLocaleCountryCode);
    v12 = +[NSLocale localeIdentifierFromComponents:](NSLocale, "localeIdentifierFromComponents:", v9);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v12;
}

@end
