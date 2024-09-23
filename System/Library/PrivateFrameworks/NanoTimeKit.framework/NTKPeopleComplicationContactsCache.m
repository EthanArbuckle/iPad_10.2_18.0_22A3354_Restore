@implementation NTKPeopleComplicationContactsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_3 != -1)
    dispatch_once(&sharedCache_onceToken_3, &__block_literal_global_138);
  return (id)sharedCache_cache_0;
}

void __49__NTKPeopleComplicationContactsCache_sharedCache__block_invoke()
{
  NTKPeopleComplicationContactsCache *v0;
  void *v1;

  v0 = objc_alloc_init(NTKPeopleComplicationContactsCache);
  v1 = (void *)sharedCache_cache_0;
  sharedCache_cache_0 = (uint64_t)v0;

}

- (NTKPeopleComplicationContactsCache)init
{
  NTKPeopleComplicationContactsCache *v2;
  NSLock *v3;
  NSLock *favoritesMappingLock;
  NSLock *v5;
  NSLock *favoritesEntriesLock;
  NSLock *v7;
  NSLock *allContactsEntriesLock;
  NSLock *v9;
  NSLock *myCardEntryLock;
  NSLock *v11;
  NSLock *hasSetupNotificationsLock;
  id v13;
  void *v14;
  uint64_t v15;
  CNContactStore *contactStore;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NTKPeopleComplicationContactsCache;
  v2 = -[NTKPeopleComplicationContactsCache init](&v21, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    favoritesMappingLock = v2->_favoritesMappingLock;
    v2->_favoritesMappingLock = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    favoritesEntriesLock = v2->_favoritesEntriesLock;
    v2->_favoritesEntriesLock = v5;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    allContactsEntriesLock = v2->_allContactsEntriesLock;
    v2->_allContactsEntriesLock = v7;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    myCardEntryLock = v2->_myCardEntryLock;
    v2->_myCardEntryLock = v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    hasSetupNotificationsLock = v2->_hasSetupNotificationsLock;
    v2->_hasSetupNotificationsLock = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0C972A0]);
    v14 = (void *)tcc_identity_create();
    objc_msgSend(v13, "setAssumedIdentity:", v14);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v13);
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v15;

    -[NTKPeopleComplicationContactsCache _locked_createFavorites](v2, "_locked_createFavorites");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("loadFavoritesQueueIdentifier", v17);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v18;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKPeopleComplicationContactsCache _tearDownNotifications](self, "_tearDownNotifications");
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationContactsCache;
  -[NTKPeopleComplicationContactsCache dealloc](&v3, sel_dealloc);
}

- (void)setupNotificationsIfNecessary
{
  _BOOL4 hasSetupNotifications;

  -[NSLock lock](self->_hasSetupNotificationsLock, "lock");
  hasSetupNotifications = self->_hasSetupNotifications;
  -[NSLock unlock](self->_hasSetupNotificationsLock, "unlock");
  if (!hasSetupNotifications)
  {
    -[NTKPeopleComplicationContactsCache _setupNotifications](self, "_setupNotifications");
    -[NSLock lock](self->_hasSetupNotificationsLock, "lock");
    self->_hasSetupNotifications = 1;
    -[NSLock unlock](self->_hasSetupNotificationsLock, "unlock");
  }
}

- (id)myCard
{
  CNContact *myCard;
  CNContact *v4;
  CNContact *v5;
  CNContact *v6;

  -[NTKPeopleComplicationContactsCache setupNotificationsIfNecessary](self, "setupNotificationsIfNecessary");
  -[NSLock lock](self->_myCardEntryLock, "lock");
  myCard = self->_myCard;
  if (!myCard)
  {
    -[NTKPeopleComplicationContactsCache _fetchMyCard](self, "_fetchMyCard");
    v4 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v5 = self->_myCard;
    self->_myCard = v4;

    myCard = self->_myCard;
  }
  v6 = myCard;
  -[NSLock unlock](self->_myCardEntryLock, "unlock");
  return v6;
}

- (id)favoriteContacts
{
  id v3;
  void *v4;

  -[NTKPeopleComplicationContactsCache setupNotificationsIfNecessary](self, "setupNotificationsIfNecessary");
  -[NSLock lock](self->_favoritesMappingLock, "lock");
  v3 = -[NTKPeopleComplicationContactsCache _favoritesMappingLocked](self, "_favoritesMappingLocked");
  -[NSDictionary allValues](self->_favoritesMapping, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_favoritesMappingLock, "unlock");
  return v4;
}

- (id)_favoritesMappingLocked
{
  NSDictionary *favoritesMapping;
  NSDictionary **p_favoritesMapping;
  void *v5;

  p_favoritesMapping = &self->_favoritesMapping;
  favoritesMapping = self->_favoritesMapping;
  if (!favoritesMapping)
  {
    -[NSLock unlock](self->_favoritesMappingLock, "unlock");
    -[NTKPeopleComplicationContactsCache _mappedFavoriteContacts](self, "_mappedFavoriteContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock lock](self->_favoritesMappingLock, "lock");
    if (!self->_favoritesMapping)
      objc_storeStrong((id *)p_favoritesMapping, v5);

    favoritesMapping = *p_favoritesMapping;
  }
  return favoritesMapping;
}

- (id)firstNonFavoriteAllContact
{
  NSArray *nonFavoriteValidAllContacts;
  NSArray *v4;
  NSArray *v5;
  void *v6;

  -[NSLock lock](self->_allContactsEntriesLock, "lock");
  nonFavoriteValidAllContacts = self->_nonFavoriteValidAllContacts;
  if (!nonFavoriteValidAllContacts || !-[NSArray count](nonFavoriteValidAllContacts, "count"))
  {
    -[NTKPeopleComplicationContactsCache computeNonFavoriteAllContactsWithCount:](self, "computeNonFavoriteAllContactsWithCount:", 1);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nonFavoriteValidAllContacts;
    self->_nonFavoriteValidAllContacts = v4;

  }
  -[NSArray firstObject](self->_nonFavoriteValidAllContacts, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_allContactsEntriesLock, "unlock");
  return v6;
}

- (id)nonFavoriteAllContactsWithCount:(unint64_t)a3
{
  NSArray *nonFavoriteValidAllContacts;
  NSArray *v6;
  NSArray *v7;
  void *v8;

  -[NTKPeopleComplicationContactsCache setupNotificationsIfNecessary](self, "setupNotificationsIfNecessary");
  -[NSLock lock](self->_allContactsEntriesLock, "lock");
  nonFavoriteValidAllContacts = self->_nonFavoriteValidAllContacts;
  if (!nonFavoriteValidAllContacts || -[NSArray count](nonFavoriteValidAllContacts, "count") < a3)
  {
    -[NTKPeopleComplicationContactsCache computeNonFavoriteAllContactsWithCount:](self, "computeNonFavoriteAllContactsWithCount:", a3);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_nonFavoriteValidAllContacts;
    self->_nonFavoriteValidAllContacts = v6;

  }
  v8 = (void *)-[NSArray copy](self->_nonFavoriteValidAllContacts, "copy");
  -[NSLock unlock](self->_allContactsEntriesLock, "unlock");
  return v8;
}

- (id)shortNameForContact:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = shortNameForContact__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&shortNameForContact__onceToken, &__block_literal_global_9_0);
  objc_msgSend((id)shortNameForContact__nameFormatterLock, "lock");
  objc_msgSend((id)shortNameForContact__nameFormatter, "stringFromContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)shortNameForContact__nameFormatterLock, "unlock");
  return v5;
}

uint64_t __58__NTKPeopleComplicationContactsCache_shortNameForContact___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)shortNameForContact__nameFormatterLock;
  shortNameForContact__nameFormatterLock = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)shortNameForContact__nameFormatter;
  shortNameForContact__nameFormatter = v2;

  return objc_msgSend((id)shortNameForContact__nameFormatter, "setStyle:", 1000);
}

- (id)fullNameForContact:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = fullNameForContact__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&fullNameForContact__onceToken, &__block_literal_global_11_2);
  objc_msgSend((id)fullNameForContact__nameFormatterLock, "lock");
  objc_msgSend((id)fullNameForContact__nameFormatter, "stringFromContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)fullNameForContact__nameFormatterLock, "unlock");
  return v5;
}

uint64_t __57__NTKPeopleComplicationContactsCache_fullNameForContact___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)fullNameForContact__nameFormatterLock;
  fullNameForContact__nameFormatterLock = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)fullNameForContact__nameFormatter;
  fullNameForContact__nameFormatter = v2;

  return objc_msgSend((id)fullNameForContact__nameFormatter, "setStyle:", 0);
}

- (id)abbreviatedNameForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (abbreviatedNameForContact__onceToken != -1)
    dispatch_once(&abbreviatedNameForContact__onceToken, &__block_literal_global_12_1);
  objc_msgSend((id)abbreviatedNameForContact__nameFormatterLock, "lock");
  objc_msgSend((id)abbreviatedNameForContact__nameFormatter, "stringFromContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)abbreviatedNameForContact__nameFormatterLock, "unlock");
  if (!v5)
  {
    objc_msgSend(v4, "givenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", &stru_1E6BDC918))
      goto LABEL_8;
    objc_msgSend(v4, "familyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", &stru_1E6BDC918);

    if (!v8)
    {
      v5 = 0;
      goto LABEL_11;
    }
    -[NTKPeopleComplicationContactsCache fullNameForContact:](self, "fullNameForContact:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") && (CNStringContainsNonLatinCharacters() & 1) == 0)
    {
      v10 = objc_msgSend(v6, "length");
      if (v10 >= 2)
        v11 = 2;
      else
        v11 = v10;
      v12 = objc_msgSend(v6, "rangeOfComposedCharacterSequencesForRange:", 0, v11);
      objc_msgSend(v6, "substringWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uppercaseStringWithLocale:", v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_8:
      v5 = 0;
    }

  }
LABEL_11:

  return v5;
}

uint64_t __64__NTKPeopleComplicationContactsCache_abbreviatedNameForContact___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)abbreviatedNameForContact__nameFormatterLock;
  abbreviatedNameForContact__nameFormatterLock = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)abbreviatedNameForContact__nameFormatter;
  abbreviatedNameForContact__nameFormatter = v2;

  return objc_msgSend((id)abbreviatedNameForContact__nameFormatter, "setStyle:", 1002);
}

- (BOOL)checkValidityOfContact:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, id, void *, const __CFString *, uint64_t);
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  const __CFString *v14;
  NSObject *v15;

  v6 = a3;
  v7 = (void (**)(id, id, void *, const __CFString *, uint64_t))a4;
  -[NTKPeopleComplicationContactsCache fullNameForContact:](self, "fullNameForContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleComplicationContactsCache abbreviatedNameForContact:](self, "abbreviatedNameForContact:", v6);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleComplicationContactsCache shortNameForContact:](self, "shortNameForContact:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  v13 = !v12;
  if (v12)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NTKPeopleComplicationContactsCache checkValidityOfContact:block:].cold.1();

  }
  else
  {
    if (v9)
      v14 = v9;
    else
      v14 = &stru_1E6BDC918;
    v7[2](v7, v6, v8, v14, v10);
  }

  return v13;
}

- (id)contactForId:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[NTKPeopleComplicationContactsCache setupNotificationsIfNecessary](self, "setupNotificationsIfNecessary");
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLocked");

  if (v6)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NTKPeopleComplicationContactsCache contactForId:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0;
  }
  else
  {
    -[NSLock lock](self->_favoritesMappingLock, "lock");
    -[NTKPeopleComplicationContactsCache _favoritesMappingLocked](self, "_favoritesMappingLocked");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock unlock](self->_favoritesMappingLock, "unlock");
    if (!v15)
    {
      -[NTKPeopleComplicationContactsCache _fetchContactForId:](self, "_fetchContactForId:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v15;
}

- (void)findContactWithFullName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__NTKPeopleComplicationContactsCache_findContactWithFullName_block___block_invoke;
  v11[3] = &unk_1E6BD87B0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __68__NTKPeopleComplicationContactsCache_findContactWithFullName_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_findContactWithFullName:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (BOOL)contactIdentifierIsFavorited:(id)a3
{
  NSLock *favoritesMappingLock;
  id v5;
  void *v6;
  void *v7;

  favoritesMappingLock = self->_favoritesMappingLock;
  v5 = a3;
  -[NSLock lock](favoritesMappingLock, "lock");
  -[NTKPeopleComplicationContactsCache _favoritesMappingLocked](self, "_favoritesMappingLocked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_favoritesMappingLock, "unlock");
  return v7 != 0;
}

- (id)_contactKeysToFetchWithThumbnail
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__NTKPeopleComplicationContactsCache__contactKeysToFetchWithThumbnail__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  if (_contactKeysToFetchWithThumbnail_onceToken != -1)
    dispatch_once(&_contactKeysToFetchWithThumbnail_onceToken, block);
  return (id)_contactKeysToFetchWithThumbnail_keysToFetch;
}

void __70__NTKPeopleComplicationContactsCache__contactKeysToFetchWithThumbnail__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_contactKeysToFetchWithoutThumbnail");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", *MEMORY[0x1E0C96890]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_contactKeysToFetchWithThumbnail_keysToFetch;
  _contactKeysToFetchWithThumbnail_keysToFetch = v1;

}

- (id)_contactKeysToFetchWithoutThumbnail
{
  if (_contactKeysToFetchWithoutThumbnail_onceToken != -1)
    dispatch_once(&_contactKeysToFetchWithoutThumbnail_onceToken, &__block_literal_global_18);
  return (id)_contactKeysToFetchWithoutThumbnail_keysToFetch;
}

void __73__NTKPeopleComplicationContactsCache__contactKeysToFetchWithoutThumbnail__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1002);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  v5[1] = v0;
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_contactKeysToFetchWithoutThumbnail_keysToFetch;
  _contactKeysToFetchWithoutThumbnail_keysToFetch = v3;

}

- (id)_fetchContactForId:(id)a3
{
  CNContactStore *contactStore;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  id v13;

  contactStore = self->_contactStore;
  v5 = a3;
  -[NTKPeopleComplicationContactsCache _contactKeysToFetchWithThumbnail](self, "_contactKeysToFetchWithThumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v5, v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NTKPeopleComplicationContactsCache _fetchContactForId:].cold.1();

    v11 = 0;
  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (id)_mappedFavoriteContacts
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  if (v4)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NTKPeopleComplicationContactsCache _mappedFavoriteContacts].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock lock](self->_favoritesEntriesLock, "lock");
    -[CNFavorites entries](self->_favorites, "entries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = v15;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v32;
      *(_QWORD *)&v17 = 138412290;
      v30 = v17;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "contactProperty", v30, (_QWORD)v31);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "contact");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKPeopleComplicationContactsCache _fetchContactForId:](self, "_fetchContactForId:", v24);
            v25 = objc_claimAutoreleasedReturnValue();

            if (!v25)
            {
              _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(0, "identifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v30;
                v36 = v27;
                _os_log_impl(&dword_1B72A3000, v26, OS_LOG_TYPE_DEFAULT, "favorite[%@] not linked to database so reverting to favorite.", buf, 0xCu);

              }
              v25 = objc_msgSend(v23, "copy");
            }
            -[NSObject identifier](v25, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, v28);

          }
          else
          {
            _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B72A3000, v25, OS_LOG_TYPE_DEFAULT, "Missing contact property in favorite entry so skipping.", buf, 2u);
            }
          }

        }
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v18);
    }

    -[NSLock unlock](self->_favoritesEntriesLock, "unlock");
  }

  return v13;
}

- (id)_fetchMyCard
{
  CNContactStore *contactStore;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  contactStore = self->_contactStore;
  -[NTKPeopleComplicationContactsCache _contactKeysToFetchWithoutThumbnail](self, "_contactKeysToFetchWithoutThumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  -[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](contactStore, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NTKPeopleComplicationContactsCache _fetchMyCard].cold.1();

  }
  return v4;
}

- (id)computeNonFavoriteAllContactsWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CNContactStore *contactStore;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  NTKPeopleComplicationContactsCache *v18;
  id v19;
  unint64_t v20;
  id v21;

  -[NTKPeopleComplicationContactsCache _contactKeysToFetchWithoutThumbnail](self, "_contactKeysToFetchWithoutThumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v5);
  objc_msgSend(v6, "setSortOrder:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = objc_claimAutoreleasedReturnValue();
  -[NTKPeopleComplicationContactsCache favoriteContacts](self, "favoriteContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  contactStore = self->_contactStore;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__NTKPeopleComplicationContactsCache_computeNonFavoriteAllContactsWithCount___block_invoke;
  v16[3] = &unk_1E6BD8820;
  v10 = v8;
  v17 = v10;
  v18 = self;
  v11 = (id)v7;
  v19 = v11;
  v20 = a3;
  LOBYTE(v7) = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v6, &v21, v16);
  v12 = v21;
  if ((v7 & 1) == 0)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NTKPeopleComplicationContactsCache computeNonFavoriteAllContactsWithCount:].cold.1();

  }
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

void __77__NTKPeopleComplicationContactsCache_computeNonFavoriteAllContactsWithCount___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__NTKPeopleComplicationContactsCache_computeNonFavoriteAllContactsWithCount___block_invoke_2;
    v7[3] = &unk_1E6BD87F8;
    v6 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v6, "checkValidityOfContact:block:", v5, v7);

  }
  *a3 = (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= *(_QWORD *)(a1 + 56);

}

uint64_t __77__NTKPeopleComplicationContactsCache_computeNonFavoriteAllContactsWithCount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_queue_reloadContacts
{
  void *v3;
  int v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  if (v4)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%@ skipping reload due to device being locked.", buf, 0xCu);

    }
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NTKPeopleComplicationContactsCache__queue_reloadContacts__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __59__NTKPeopleComplicationContactsCache__queue_reloadContacts__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queued_loadMyCard");
  objc_msgSend(*(id *)(a1 + 32), "_queued_loadFavoriteContacts");
  objc_msgSend(*(id *)(a1 + 32), "_queued_loadAllContacts");
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_25_0);
}

void __59__NTKPeopleComplicationContactsCache__queue_reloadContacts__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("NTKPeopleComplicationContactsCacheDidChangeNotification"), 0);

}

- (void)_queue_flushCNFavoritesReload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__NTKPeopleComplicationContactsCache__queue_flushCNFavoritesReload__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __67__NTKPeopleComplicationContactsCache__queue_flushCNFavoritesReload__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queued_flushCNFavorites");
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocked");

  if ((v3 & 1) != 0)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "%@ skipping reload due to device being locked.", (uint8_t *)&v7, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queued_loadFavoriteContacts");
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_27);
  }
}

void __67__NTKPeopleComplicationContactsCache__queue_flushCNFavoritesReload__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("NTKPeopleComplicationContactsCacheDidChangeNotification"), 0);

}

- (void)_locked_createFavorites
{
  CNFavorites *v3;
  CNFavorites *favorites;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (CNFavorites *)objc_msgSend(objc_alloc(MEMORY[0x1E0C972F8]), "initWithContactStore:", self->_contactStore);
  favorites = self->_favorites;
  self->_favorites = v3;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self->_favorites, (CFNotificationName)*MEMORY[0x1E0C968D8], 0);
}

- (void)_queued_flushCNFavorites
{
  CNFavorites *favorites;
  NSDictionary *favoritesMapping;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSLock lock](self->_favoritesEntriesLock, "lock");
  favorites = self->_favorites;
  self->_favorites = 0;

  -[NTKPeopleComplicationContactsCache _locked_createFavorites](self, "_locked_createFavorites");
  -[NSLock unlock](self->_favoritesEntriesLock, "unlock");
  -[NSLock lock](self->_favoritesMappingLock, "lock");
  favoritesMapping = self->_favoritesMapping;
  self->_favoritesMapping = 0;

  -[NSLock unlock](self->_favoritesMappingLock, "unlock");
}

- (void)_queued_loadMyCard
{
  CNContact *v3;
  CNContact *myCard;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSLock lock](self->_myCardEntryLock, "lock");
  -[NTKPeopleComplicationContactsCache _fetchMyCard](self, "_fetchMyCard");
  v3 = (CNContact *)objc_claimAutoreleasedReturnValue();
  myCard = self->_myCard;
  self->_myCard = v3;

  -[NSLock unlock](self->_myCardEntryLock, "unlock");
}

- (void)_queued_loadFavoriteContacts
{
  NSDictionary *v3;
  NSDictionary *favoritesMapping;
  NSDictionary *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NTKPeopleComplicationContactsCache _mappedFavoriteContacts](self, "_mappedFavoriteContacts");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_favoritesMappingLock, "lock");
  favoritesMapping = self->_favoritesMapping;
  self->_favoritesMapping = v3;
  v5 = v3;

  -[NSLock unlock](self->_favoritesMappingLock, "unlock");
}

- (void)_queued_loadAllContacts
{
  NSUInteger v3;
  uint64_t v4;
  NSArray *v5;
  NSArray *nonFavoriteValidAllContacts;
  NSArray *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSLock lock](self->_allContactsEntriesLock, "lock");
  v3 = -[NSArray count](self->_nonFavoriteValidAllContacts, "count");
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;
  -[NSLock unlock](self->_allContactsEntriesLock, "unlock");
  -[NTKPeopleComplicationContactsCache computeNonFavoriteAllContactsWithCount:](self, "computeNonFavoriteAllContactsWithCount:", v4);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_allContactsEntriesLock, "lock");
  nonFavoriteValidAllContacts = self->_nonFavoriteValidAllContacts;
  self->_nonFavoriteValidAllContacts = v5;
  v7 = v5;

  -[NSLock unlock](self->_allContactsEntriesLock, "unlock");
}

- (void)_queue_findContactWithFullName:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  CNContactStore *contactStore;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[NSLock lock](self->_favoritesEntriesLock, "lock");
  -[CNFavorites entries](self->_favorites, "entries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__42;
  v30 = __Block_byref_object_dispose__42;
  v31 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__NTKPeopleComplicationContactsCache__queue_findContactWithFullName_block___block_invoke;
  v23[3] = &unk_1E6BD8888;
  v23[4] = self;
  v10 = v6;
  v24 = v10;
  v25 = &v26;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);
  -[NSLock unlock](self->_favoritesEntriesLock, "unlock");
  v11 = v27[5];
  if (!v11)
  {
    -[NTKPeopleComplicationContactsCache _contactKeysToFetchWithThumbnail](self, "_contactKeysToFetchWithThumbnail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    contactStore = self->_contactStore;
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v14, v12, &v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v22;
    objc_msgSend(v15, "firstObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v27[5];
    v27[5] = v17;

    if (v27[5])
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v27[5], "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v27[5];
        *(_DWORD *)buf = 138412802;
        v33 = v10;
        v34 = 2112;
        v35 = v20;
        v36 = 2112;
        v37 = v21;
        _os_log_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplicationContactsCache _queue_findContactWithFullName found all contacts for name[%@] with id[%@] [%@]", buf, 0x20u);

      }
    }

    v11 = v27[5];
  }
  v7[2](v7, v11);

  _Block_object_dispose(&v26, 8);
}

void __75__NTKPeopleComplicationContactsCache__queue_findContactWithFullName_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "contactProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullNameForContact:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v9))
  {
    objc_msgSend(v6, "contact");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v17 = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplicationContactsCache _queue_findContactWithFullName found favorite contact matching name[%@] with id[%@] [%@]", (uint8_t *)&v17, 0x20u);

    }
  }

}

- (void)_setupNotifications
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didReceiveContactStoreChangedNotification, *MEMORY[0x1E0C96870], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didReceiveFavoritesChangeRelatedNotification, *MEMORY[0x1E0C968E0], 0);
  +[NTKDarwinNotificationCenter defaultCenter](NTKDarwinNotificationCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:notificationName:selector:", self, *MEMORY[0x1E0C968D8], sel__favoritesEntriesChangedExternally);

  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%@ _setupNotifications and addObserver", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_tearDownNotifications
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[NTKDarwinNotificationCenter defaultCenter](NTKDarwinNotificationCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:notificationName:", self, *MEMORY[0x1E0C968D8]);

  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%@ _tearDownNotifications and removeObserver", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_didReceiveContactStoreChangedNotification
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ _didReceiveContactStoreChangedNotification", (uint8_t *)&v6, 0xCu);

  }
  -[NTKPeopleComplicationContactsCache _queue_reloadContacts](self, "_queue_reloadContacts");
}

- (void)_didReceiveFavoritesChangeRelatedNotification
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ _didReceiveFavoritesChangeRelatedNotification", (uint8_t *)&v6, 0xCu);

  }
  -[NTKPeopleComplicationContactsCache _queue_reloadContacts](self, "_queue_reloadContacts");
}

- (void)_didReceiveDeviceLockStateDidChangeNotification
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ _didReceiveDeviceLockStateDidChangeNotification", (uint8_t *)&v6, 0xCu);

  }
  -[NTKPeopleComplicationContactsCache _queue_reloadContacts](self, "_queue_reloadContacts");
}

- (void)_favoritesEntriesChangedExternally
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ _favoritesEntriesChangedExternally", (uint8_t *)&v6, 0xCu);

  }
  -[NTKPeopleComplicationContactsCache _queue_flushCNFavoritesReload](self, "_queue_flushCNFavoritesReload");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nonFavoriteValidAllContacts, 0);
  objc_storeStrong((id *)&self->_myCard, 0);
  objc_storeStrong((id *)&self->_favorites, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_hasSetupNotificationsLock, 0);
  objc_storeStrong((id *)&self->_myCardEntryLock, 0);
  objc_storeStrong((id *)&self->_allContactsEntriesLock, 0);
  objc_storeStrong((id *)&self->_favoritesEntriesLock, 0);
  objc_storeStrong((id *)&self->_favoritesMappingLock, 0);
  objc_storeStrong((id *)&self->_favoritesMapping, 0);
}

- (void)checkValidityOfContact:block:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1B72A3000, v1, OS_LOG_TYPE_ERROR, "People Complication: Missing names in contacts: %@ %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)contactForId:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "People Complication: Cannot retreive contact for id because device is locked.", a5, a6, a7, a8, 0);
}

- (void)_fetchContactForId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "People Complication: Failed to load contact with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_mappedFavoriteContacts
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "People Complication: Cannot _loadFavoriteContacts becuase device is locked.", a5, a6, a7, a8, 0);
}

- (void)_fetchMyCard
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Failed to fetch my card: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)computeNonFavoriteAllContactsWithCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Failed to enumerate All Contacts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
