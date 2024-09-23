@implementation BuddyLanguageLocaleDataSource

- (BuddyLanguageLocaleDataSource)init
{
  BuddyLanguageComposite *v2;
  NSNotificationCenter *v3;
  NSNotificationCenter *v4;
  BuddyLanguageLocaleDataSource *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyLanguageLocaleDataSource;
  location = -[BuddyLanguageLocaleDataSource init](&v7, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init(BuddyLanguageComposite);
    objc_msgSend(location, "setBackingLanguageComposite:", v2);

    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v3, "addObserver:selector:name:object:", location, "_countryScanCompleted", BYCountryScanCompletedNotification, 0);

    v4 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v4, "addObserver:selector:name:object:", location, "_didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

    objc_msgSend(location, "updateLanguageCompositer");
  }
  v5 = (BuddyLanguageLocaleDataSource *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  BuddyLanguageLocaleDataSource *v5;

  v5 = self;
  v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyLanguageLocaleDataSource;
  -[BuddyLanguageLocaleDataSource dealloc](&v3, "dealloc");
}

- (NSString)language
{
  NSArray *v2;
  NSString *v4;

  if (self->_language)
  {
    v4 = self->_language;
  }
  else
  {
    v2 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
    v4 = (NSString *)-[NSArray firstObject](v2, "firstObject");

  }
  return v4;
}

- (BuddyLanguageComposite)languageComposite
{
  return -[BuddyLanguageLocaleDataSource backingLanguageComposite](self, "backingLanguageComposite", a2, self);
}

- (BuddyLocaleComposite)localeComposite
{
  BuddyLocaleComposite *v2;
  BuddyLocaleComposite *v3;
  BYPreferencesController *v4;
  id v5;
  float v6;
  double v7;
  BuddyLocaleComposite *v8;
  BYPreferencesController *v9;
  NSString *v10;
  BuddyLocaleComposite *v11;

  v2 = -[BuddyLanguageLocaleDataSource backingLocaleComposite](self, "backingLocaleComposite", a2);

  if (!v2)
  {
    v3 = objc_alloc_init(BuddyLocaleComposite);
    -[BuddyLanguageLocaleDataSource setBackingLocaleComposite:](self, "setBackingLocaleComposite:", v3);

    v4 = -[BuddyLanguageLocaleDataSource buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
    v5 = -[BYPreferencesController objectForKey:](v4, "objectForKey:", CFSTR("localeScrollOffset"));
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    v8 = -[BuddyLanguageLocaleDataSource backingLocaleComposite](self, "backingLocaleComposite");
    -[BuddyLocaleComposite setScrollOffset:](v8, "setScrollOffset:", v7);

    v9 = -[BuddyLanguageLocaleDataSource buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
    -[BYPreferencesController removeObjectForKey:](v9, "removeObjectForKey:", CFSTR("localeScrollOffset"));

  }
  v10 = -[BuddyLanguageLocaleDataSource language](self, "language");
  v11 = -[BuddyLanguageLocaleDataSource backingLocaleComposite](self, "backingLocaleComposite");
  -[BuddyLocaleComposite setLanguage:](v11, "setLanguage:", v10);

  return -[BuddyLanguageLocaleDataSource backingLocaleComposite](self, "backingLocaleComposite");
}

- (void)_didBecomeActive:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id location[2];
  BuddyLanguageLocaleDataSource *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BYLocationController sharedBuddyLocationController](BYLocationController, "sharedBuddyLocationController");
  v4 = objc_msgSend(v3, "guessedCountryFromTelephony");

  if (!v4)
  {
    v5 = +[BYLocationController sharedBuddyLocationController](BYLocationController, "sharedBuddyLocationController");
    v6 = objc_msgSend(v5, "getCountryFromTelephony");

    if ((v6 & 1) != 0)
      -[BuddyLanguageLocaleDataSource updateLanguageCompositer](v8, "updateLanguageCompositer");
  }
  objc_storeStrong(location, 0);
}

- (void)_countryScanCompleted
{
  -[BuddyLanguageLocaleDataSource updateLanguageCompositer](self, "updateLanguageCompositer", a2, self);
}

- (void)updateLanguageCompositer
{
  id v2;
  id v3;
  uint64_t v4;
  unint64_t i;
  NSLocale *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t j;
  id v12;
  id v13;
  id v14;
  BuddyLanguageComposite *v15;
  id v16;
  BuddyLanguageComposite *v17;
  BuddyLanguageLocaleDataSourceDelegate *v18;
  _QWORD v19[8];
  uint64_t v20;
  id v21;
  id v22;
  id location;
  _QWORD __b[8];
  id obj;
  id v26;
  id v27[2];
  BuddyLanguageLocaleDataSource *v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v28 = self;
  v27[1] = (id)a2;
  v27[0] = +[IntlUtility baseSystemLanguages](IntlUtility, "baseSystemLanguages");
  v26 = objc_alloc_init((Class)NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  v2 = v27[0];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v3)
  {
    v4 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(v2);
        obj = *(id *)(__b[1] + 8 * i);
        v6 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", obj);
        location = -[NSLocale localizedStringForLanguage:context:](v6, "localizedStringForLanguage:context:", obj, 4);

        if (!location)
          objc_storeStrong(&location, obj);
        objc_msgSend(v26, "setValue:forKey:", location, obj);
        objc_storeStrong(&location, 0);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
    }
    while (v3);
  }

  v7 = +[BYLocationController sharedBuddyLocationController](BYLocationController, "sharedBuddyLocationController");
  v22 = objc_msgSend(v7, "guessedLanguages");

  v21 = +[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet");
  memset(v19, 0, sizeof(v19));
  v8 = v22;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v19, v29, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19[2];
    do
    {
      for (j = 0; j < (unint64_t)v9; ++j)
      {
        if (*(_QWORD *)v19[2] != v10)
          objc_enumerationMutation(v8);
        v20 = *(_QWORD *)(v19[1] + 8 * j);
        v12 = v21;
        v13 = +[IntlUtility baseLanguageIdentifierFromIdentifier:](IntlUtility, "baseLanguageIdentifierFromIdentifier:", v20);
        objc_msgSend(v12, "addObject:", v13);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v19, v29, 16);
    }
    while (v9);
  }

  objc_msgSend(v21, "addObjectsFromArray:", v27[0]);
  v14 = objc_msgSend(v21, "array");
  v15 = -[BuddyLanguageLocaleDataSource backingLanguageComposite](v28, "backingLanguageComposite");
  -[BuddyLanguageComposite setLanguageCodes:](v15, "setLanguageCodes:", v14);

  v16 = v26;
  v17 = -[BuddyLanguageLocaleDataSource backingLanguageComposite](v28, "backingLanguageComposite");
  -[BuddyLanguageComposite setLanguageStrings:](v17, "setLanguageStrings:", v16);

  v18 = -[BuddyLanguageLocaleDataSource delegate](v28, "delegate");
  -[BuddyLanguageLocaleDataSourceDelegate languageCompositeUpdated](v18, "languageCompositeUpdated");

  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
}

- (void)userSelectedLanguage:(id)a3
{
  id location[2];
  BuddyLanguageLocaleDataSource *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyLanguageLocaleDataSource setLanguage:](v4, "setLanguage:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5
{
  id v7;
  id location[3];
  char v9;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (BuddyLanguageLocaleDataSourceDelegate)delegate
{
  return (BuddyLanguageLocaleDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (BuddyLanguageComposite)backingLanguageComposite
{
  return self->_backingLanguageComposite;
}

- (void)setBackingLanguageComposite:(id)a3
{
  objc_storeStrong((id *)&self->_backingLanguageComposite, a3);
}

- (BuddyLocaleComposite)backingLocaleComposite
{
  return self->_backingLocaleComposite;
}

- (void)setBackingLocaleComposite:(id)a3
{
  objc_storeStrong((id *)&self->_backingLocaleComposite, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingLocaleComposite, 0);
  objc_storeStrong((id *)&self->_backingLanguageComposite, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
