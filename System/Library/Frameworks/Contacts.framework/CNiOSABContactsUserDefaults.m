@implementation CNiOSABContactsUserDefaults

- (int64_t)displayNameOrder
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSCache *valueCache;
  void *v7;
  _QWORD v9[5];

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("displayNameOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
  {
    v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__CNiOSABContactsUserDefaults_displayNameOrder__block_invoke;
    v9[3] = &unk_1E29F9518;
    v9[4] = self;
    v5 = __47__CNiOSABContactsUserDefaults_displayNameOrder__block_invoke((uint64_t)v9);
    valueCache = self->_valueCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](valueCache, "setObject:forKey:", v7, CFSTR("displayNameOrder"));

  }
  return v5;
}

- (int64_t)sortOrder
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSCache *valueCache;
  void *v7;
  _QWORD v9[5];

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("sortOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
  {
    v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__CNiOSABContactsUserDefaults_sortOrder__block_invoke;
    v9[3] = &unk_1E29F9518;
    v9[4] = self;
    v5 = __40__CNiOSABContactsUserDefaults_sortOrder__block_invoke((uint64_t)v9);
    valueCache = self->_valueCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](valueCache, "setObject:forKey:", v7, CFSTR("sortOrder"));

  }
  return v5;
}

- (int64_t)newContactDisplayNameOrder
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSCache *valueCache;
  void *v7;
  _QWORD v9[5];

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("newContactDisplayNameOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
  {
    v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__CNiOSABContactsUserDefaults_newContactDisplayNameOrder__block_invoke;
    v9[3] = &unk_1E29F9518;
    v9[4] = self;
    v5 = __57__CNiOSABContactsUserDefaults_newContactDisplayNameOrder__block_invoke((uint64_t)v9);
    valueCache = self->_valueCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](valueCache, "setObject:forKey:", v7, CFSTR("newContactDisplayNameOrder"));

  }
  return v5;
}

- (BOOL)shortNameFormatPrefersNicknames
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSCache *valueCache;
  void *v8;

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("shortNameFormatPrefersNicknames"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
  {
    v5 = v4;
  }
  else
  {
    -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "ABPersonGetShortNamePreferNicknames");

    valueCache = self->_valueCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](valueCache, "setObject:forKey:", v8, CFSTR("shortNameFormatPrefersNicknames"));

  }
  return v5 != 0;
}

- (id)filteredGroupAndContainerIDs
{
  void *v3;
  _QWORD v5[5];

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("filteredGroupAndContainerIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__CNiOSABContactsUserDefaults_filteredGroupAndContainerIDs__block_invoke;
    v5[3] = &unk_1E29F9568;
    v5[4] = self;
    __59__CNiOSABContactsUserDefaults_filteredGroupAndContainerIDs__block_invoke((uint64_t)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[NSCache setObject:forKey:](self->_valueCache, "setObject:forKey:", v3, CFSTR("filteredGroupAndContainerIDs"));
  }
  return v3;
}

id __59__CNiOSABContactsUserDefaults_filteredGroupAndContainerIDs__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "abWrapper");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayedContactsFilterRepresentationPref");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)countryCode
{
  void *v3;
  _QWORD v5[5];

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("countryCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__CNiOSABContactsUserDefaults_countryCode__block_invoke;
    v5[3] = &unk_1E29F9540;
    v5[4] = self;
    __42__CNiOSABContactsUserDefaults_countryCode__block_invoke((uint64_t)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[NSCache setObject:forKey:](self->_valueCache, "setObject:forKey:", v3, CFSTR("countryCode"));
  }
  return v3;
}

id __42__CNiOSABContactsUserDefaults_countryCode__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "abWrapper");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "abDefaultCountryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __47__CNiOSABContactsUserDefaults_displayNameOrder__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "abWrapper");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ABPersonGetCompositeNameFormatForRecord:", 0);

  +[CNiOSABConstantsMapping ABtoCNContactDisplayNameOrderConstantsMapping](CNiOSABConstantsMapping, "ABtoCNContactDisplayNameOrderConstantsMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mappedConstant:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

uint64_t __57__CNiOSABContactsUserDefaults_newContactDisplayNameOrder__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  BOOL v4;
  void *v5;
  int v6;

  objc_msgSend(*(id *)(a1 + 32), "abWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ABPersonGetEditNameFormat");

  if (v3)
  {
    v4 = v3 == 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "abWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "ABPersonGetCompositeNameFormatForRecord:", 0);

    v4 = v6 == 0;
  }
  if (v4)
    return 1;
  else
    return 2;
}

- (CNiOSABContactsUserDefaultsABWrapper)abWrapper
{
  return self->_abWrapper;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10;
  id v11;
  objc_super v12;

  v10 = a4;
  v11 = a3;
  -[CNiOSABContactsUserDefaults _registerObserverForKey:](self, "_registerObserverForKey:", v10);
  v12.receiver = self;
  v12.super_class = (Class)CNiOSABContactsUserDefaults;
  -[CNiOSABContactsUserDefaults addObserver:forKeyPath:options:context:](&v12, sel_addObserver_forKeyPath_options_context_, v11, v10, a5, a6);

}

- (void)_registerObserverForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNiOSABContactsUserDefaults observerCountPerKey](self, "observerCountPerKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue") + 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CNiOSABContactsUserDefaults observerCountPerKey](self, "observerCountPerKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v4);

}

- (NSMutableDictionary)observerCountPerKey
{
  return self->_observerCountPerKey;
}

uint64_t __40__CNiOSABContactsUserDefaults_sortOrder__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "abWrapper");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ABPersonGetSortOrdering");

  +[CNiOSABConstantsMapping ABToCNContactSortOrderConstantsMapping](CNiOSABConstantsMapping, "ABToCNContactSortOrderConstantsMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mappedConstant:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (CNiOSABContactsUserDefaults)initWithABWrapper:(id)a3
{
  id v5;
  CNiOSABContactsUserDefaults *v6;
  NSCache *v7;
  NSCache *valueCache;
  NSMutableDictionary *v9;
  NSMutableDictionary *observerCountPerKey;
  __CFNotificationCenter *DarwinNotifyCenter;
  CNiOSABContactsUserDefaults *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABContactsUserDefaults;
  v6 = -[CNContactsUserDefaults init](&v14, sel_init);
  if (v6)
  {
    ABInitialize();
    objc_storeStrong((id *)&v6->_abWrapper, a3);
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    valueCache = v6->_valueCache;
    v6->_valueCache = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observerCountPerKey = v6->_observerCountPerKey;
    v6->_observerCountPerKey = v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)__PreferencesChanged, CFSTR("com.apple.AddressBook.PreferenceChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = v6;
  }

  return v6;
}

- (CNiOSABContactsUserDefaults)init
{
  CNiOSABContactsUserDefaultsABWrapper *v3;
  CNiOSABContactsUserDefaults *v4;

  v3 = objc_alloc_init(CNiOSABContactsUserDefaultsABWrapper);
  v4 = -[CNiOSABContactsUserDefaults initWithABWrapper:](self, "initWithABWrapper:", v3);

  return v4;
}

- (BOOL)isShortNameFormatEnabled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSCache *valueCache;
  void *v8;

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("shortNameFormatEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
  {
    v5 = v4;
  }
  else
  {
    -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "ABPersonGetShortNameFormatEnabled");

    valueCache = self->_valueCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](valueCache, "setObject:forKey:", v8, CFSTR("shortNameFormatEnabled"));

  }
  return v5 != 0;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.AddressBook.PreferenceChanged"), 0);
  v4.receiver = self;
  v4.super_class = (Class)CNiOSABContactsUserDefaults;
  -[CNiOSABContactsUserDefaults dealloc](&v4, sel_dealloc);
}

- (void)flushCache
{
  id v2;

  -[CNiOSABContactsUserDefaults valueCache](self, "valueCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_unregisterObserverForKey:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNiOSABContactsUserDefaults observerCountPerKey](self, "observerCountPerKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v6 == 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[CNiOSABContactsUserDefaults observerCountPerKey](self, "observerCountPerKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[CNiOSABContactsUserDefaults _unregisterObserverForKey:](self, "_unregisterObserverForKey:", v6);
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABContactsUserDefaults;
  -[CNiOSABContactsUserDefaults removeObserver:forKeyPath:](&v8, sel_removeObserver_forKeyPath_, v7, v6);

}

- (void)setDisplayNameOrder:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[NSCache removeObjectForKey:](self->_valueCache, "removeObjectForKey:", CFSTR("displayNameOrder"));
  +[CNiOSABConstantsMapping CNToABCompositeNameFormatConstantsMapping](CNiOSABConstantsMapping, "CNToABCompositeNameFormatConstantsMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mappedConstant:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ABPersonSetCompositeNameFormat:", v8);

}

- (void)setShortNameFormat:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[NSCache removeObjectForKey:](self->_valueCache, "removeObjectForKey:", CFSTR("shortNameFormat"));
  +[CNiOSABConstantsMapping CNToABPersonShortNameFormatConstantsMapping](CNiOSABConstantsMapping, "CNToABPersonShortNameFormatConstantsMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mappedConstant:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v11 != v7)
  {
    v9 = objc_msgSend(v11, "unsignedIntValue");
    -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ABPersonSetShortNameFormat:", v9);

    v8 = v11;
  }

}

- (int64_t)shortNameFormat
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSCache *valueCache;
  void *v7;
  _QWORD v9[5];

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("shortNameFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
  {
    v5 = v4;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__CNiOSABContactsUserDefaults_shortNameFormat__block_invoke;
    v9[3] = &unk_1E29F9518;
    v9[4] = self;
    v5 = __46__CNiOSABContactsUserDefaults_shortNameFormat__block_invoke((uint64_t)v9);
    valueCache = self->_valueCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](valueCache, "setObject:forKey:", v7, CFSTR("shortNameFormat"));

  }
  return v5;
}

uint64_t __46__CNiOSABContactsUserDefaults_shortNameFormat__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "abWrapper");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ABPersonGetShortNameFormat");

  +[CNiOSABConstantsMapping ABToCNContactShortNameFormatConstantsMapping](CNiOSABConstantsMapping, "ABToCNContactShortNameFormatConstantsMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mappedConstant:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

- (void)setShortNameFormatEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[NSCache removeObjectForKey:](self->_valueCache, "removeObjectForKey:", CFSTR("shortNameFormatEnabled"));
  -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ABPersonSetShortNameFormatEnabled:", v3);

}

- (void)setShortNameFormatPrefersNicknames:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[NSCache removeObjectForKey:](self->_valueCache, "removeObjectForKey:", CFSTR("shortNameFormatPrefersNicknames"));
  -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ABPersonSetShortNamePreferNicknames:", v3);

}

- (void)setFilteredGroupAndContainerIDs:(id)a3
{
  NSCache *valueCache;
  id v5;
  id v6;

  valueCache = self->_valueCache;
  v5 = a3;
  -[NSCache removeObjectForKey:](valueCache, "removeObjectForKey:", CFSTR("filteredGroupAndContainerIDs"));
  -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayedContactsFilterRepresentationPref:", v5);

}

- (int64_t)lastIgnoredNewDuplicatesCount
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  NSCache *valueCache;
  void *v8;

  -[NSCache objectForKey:](self->_valueCache, "objectForKey:", CFSTR("lastIgnoredNewDuplicatesCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
  {
    v5 = v4;
  }
  else
  {
    -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "lastIgnoredNewDuplicatesCount");

    valueCache = self->_valueCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](valueCache, "setObject:forKey:", v8, CFSTR("lastIgnoredNewDuplicatesCount"));

  }
  return v5;
}

- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3
{
  id v5;

  -[NSCache removeObjectForKey:](self->_valueCache, "removeObjectForKey:", CFSTR("lastIgnoredNewDuplicatesCount"));
  -[CNiOSABContactsUserDefaults abWrapper](self, "abWrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastIgnoredNewDuplicatesCount:", a3);

}

- (void)setObserverCountPerKey:(id)a3
{
  objc_storeStrong((id *)&self->_observerCountPerKey, a3);
}

- (NSCache)valueCache
{
  return self->_valueCache;
}

- (void)setValueCache:(id)a3
{
  objc_storeStrong((id *)&self->_valueCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abWrapper, 0);
  objc_storeStrong((id *)&self->_valueCache, 0);
  objc_storeStrong((id *)&self->_observerCountPerKey, 0);
}

@end
