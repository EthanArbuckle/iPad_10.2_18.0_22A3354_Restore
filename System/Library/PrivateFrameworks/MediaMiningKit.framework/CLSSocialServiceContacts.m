@implementation CLSSocialServiceContacts

- (CLSSocialServiceContacts)initWithLocationCache:(id)a3
{
  id v5;
  CLSSocialServiceContacts *v6;
  CLSSocialServiceContacts *v7;
  uint64_t v8;
  GDVisualIdentifierView *visualIdentifierView;
  uint64_t v10;
  NSMutableDictionary *personByFullName;
  uint64_t v12;
  NSMutableSet *nonFoundFullNames;
  uint64_t v14;
  NSMutableDictionary *personByHandle;
  uint64_t v16;
  NSMutableSet *nonFoundHandles;
  id v18;
  dispatch_semaphore_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  NSMutableDictionary *personsForCNIdentifiers;
  uint64_t v24;
  NSMutableDictionary *personsInContactStoreForCNIdentifiers;
  uint64_t v26;
  NSMutableDictionary *personsForGDIdentifiers;
  uint64_t v28;
  void *personsForLocalIdentifier;
  _QWORD v31[4];
  CLSSocialServiceContacts *v32;
  id v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  objc_super v47;

  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CLSSocialServiceContacts;
  v6 = -[CLSSocialServiceContacts init](&v47, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CLSSocialServiceContacts _initializeVisualIdentifierView](v6, "_initializeVisualIdentifierView");
    v8 = objc_claimAutoreleasedReturnValue();
    visualIdentifierView = v7->_visualIdentifierView;
    v7->_visualIdentifierView = (GDVisualIdentifierView *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    personByFullName = v7->_personByFullName;
    v7->_personByFullName = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    nonFoundFullNames = v7->_nonFoundFullNames;
    v7->_nonFoundFullNames = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    personByHandle = v7->_personByHandle;
    v7->_personByHandle = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    nonFoundHandles = v7->_nonFoundHandles;
    v7->_nonFoundHandles = (NSMutableSet *)v16;

    objc_storeStrong((id *)&v7->_locationCache, a3);
    v18 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__5434;
    v45 = __Block_byref_object_dispose__5435;
    v46 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 1;
    v19 = dispatch_semaphore_create(0);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __50__CLSSocialServiceContacts_initWithLocationCache___block_invoke;
    v31[3] = &unk_1E84F8B88;
    v35 = &v37;
    v36 = &v41;
    v7 = v7;
    v32 = v7;
    v20 = v18;
    v33 = v20;
    v21 = v19;
    v34 = v21;
    objc_msgSend(v20, "requestAccessForEntityType:completionHandler:", 0, v31);
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v38 + 24))
    {
      objc_storeStrong((id *)&v7->_contactStore, v18);
      objc_storeStrong((id *)&v7->_meContact, (id)v42[5]);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = objc_claimAutoreleasedReturnValue();
      personsForCNIdentifiers = v7->_personsForCNIdentifiers;
      v7->_personsForCNIdentifiers = (NSMutableDictionary *)v22;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v24 = objc_claimAutoreleasedReturnValue();
      personsInContactStoreForCNIdentifiers = v7->_personsInContactStoreForCNIdentifiers;
      v7->_personsInContactStoreForCNIdentifiers = (NSMutableDictionary *)v24;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = objc_claimAutoreleasedReturnValue();
      personsForGDIdentifiers = v7->_personsForGDIdentifiers;
      v7->_personsForGDIdentifiers = (NSMutableDictionary *)v26;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v28 = objc_claimAutoreleasedReturnValue();
      personsForLocalIdentifier = v7->_personsForLocalIdentifier;
      v7->_personsForLocalIdentifier = (NSMutableDictionary *)v28;
    }
    else
    {
      personsForLocalIdentifier = v7;
      v7 = 0;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);

  }
  return v7;
}

- (id)fetchMeCardFromContactStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CLSSocialServiceContacts defaultKeysToFetch](CLSSocialServiceContacts, "defaultKeysToFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v6)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_ERROR, "Error gaining access to me: %@", buf, 0xCu);
    }

    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)_initializeVisualIdentifierView
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint8_t v7[16];
  _QWORD v8[5];
  id v9;
  __int128 buf;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D3E010], "defaultService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "visualIdentifierViewWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__CLSSocialServiceContacts__initializeVisualIdentifierView__block_invoke;
    v8[3] = &unk_1E84F8BB0;
    v8[4] = &buf;
    objc_msgSend(v3, "enumeratePeopleWithBlock:", v8);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v5 = v3;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[Megadome] failed to get visualIdentifierView with error: Graph has not yet been run", v7, 2u);
      }
      v5 = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[Megadome] failed to get visualIdentifierView with error: %@", (uint8_t *)&buf, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (void)invalidateMePerson
{
  CLSPersonIdentity *mePerson;
  CLSSocialServiceContacts *obj;

  obj = self;
  objc_sync_enter(obj);
  mePerson = obj->_mePerson;
  obj->_mePerson = 0;

  objc_sync_exit(obj);
}

- (void)invalidateMemoryCaches
{
  NSMutableDictionary *v3;
  NSMutableDictionary *personByHandle;
  NSMutableSet *v5;
  NSMutableSet *nonFoundHandles;
  NSMutableDictionary *v7;
  NSMutableDictionary *personByFullName;
  NSMutableSet *v9;
  NSMutableSet *nonFoundFullNames;
  NSMutableDictionary *v11;
  NSMutableDictionary *personsForLocalIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *personsForCNIdentifiers;
  NSMutableDictionary *v15;
  NSMutableDictionary *personsForGDIdentifiers;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  personByHandle = self->_personByHandle;
  self->_personByHandle = v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  nonFoundHandles = self->_nonFoundHandles;
  self->_nonFoundHandles = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  personByFullName = self->_personByFullName;
  self->_personByFullName = v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  nonFoundFullNames = self->_nonFoundFullNames;
  self->_nonFoundFullNames = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  personsForLocalIdentifier = self->_personsForLocalIdentifier;
  self->_personsForLocalIdentifier = v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  personsForCNIdentifiers = self->_personsForCNIdentifiers;
  self->_personsForCNIdentifiers = v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  personsForGDIdentifiers = self->_personsForGDIdentifiers;
  self->_personsForGDIdentifiers = v15;

}

- (id)visionCacheStorageDirectoryURLForPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isSystemPhotoLibrary"))
  {
    objc_msgSend(v3, "urlForApplicationDataFolderIdentifier:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "photoLibraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("private/com.apple.mediaanalysisd/caches/vision"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
  }

  return v4;
}

- (id)inferredDeviceOwnerForPhotoLibrary:(id)a3 ignoreContactLinking:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CLSVisualUnderstandingServiceClient *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
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
  NSObject *v24;
  NSObject *v25;
  void *v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CLSSocialServiceContacts visionCacheStorageDirectoryURLForPhotoLibrary:](self, "visionCacheStorageDirectoryURLForPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v8 = -[CLSVisualUnderstandingServiceClient initWithVisionCacheURL:error:]([CLSVisualUnderstandingServiceClient alloc], "initWithVisionCacheURL:error:", v7, &v28);
  v9 = v28;
  if (v8)
  {
    -[CLSVisualUnderstandingServiceClient deviceOwnerPersonUUIDWithIgnoreContactsLinking:](v8, "deviceOwnerPersonUUIDWithIgnoreContactsLinking:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_INFO, "Device owner uuid %@", buf, 0xCu);
    }

    if (v10)
    {
      objc_msgSend(v6, "librarySpecificFetchOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPersonContext:", 1);
      objc_msgSend(v13, "setFetchLimit:", 1);
      v27 = v7;
      v14 = v9;
      v15 = (void *)MEMORY[0x1E0CD16C0];
      objc_msgSend(v10, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localIdentifierWithUUID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CD16C0];
      v29 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fetchPersonsWithLocalIdentifiers:options:", v19, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fetchedObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v14;
      v7 = v27;

    }
    else
    {
      v22 = 0;
    }
    v24 = v22;

    v25 = v24;
  }
  else
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "loggingConnection");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_error_impl(&dword_1CAB79000, v24, OS_LOG_TYPE_ERROR, "Failed to get VU Service %@", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

- (void)refreshMeContactIfNeeded
{
  CLSSocialServiceContacts *v2;
  uint64_t v3;
  CNContact *meContact;
  void *v5;
  NSObject *v6;
  CNContact *v7;
  int v8;
  CNContact *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_meContact && v2->_contactStore)
  {
    -[CLSSocialServiceContacts fetchMeCardFromContactStore:](v2, "fetchMeCardFromContactStore:");
    v3 = objc_claimAutoreleasedReturnValue();
    meContact = v2->_meContact;
    v2->_meContact = (CNContact *)v3;

    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v2->_meContact;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1CAB79000, v6, OS_LOG_TYPE_INFO, "Fetched me contact card, got %@", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_sync_exit(v2);

}

- (id)mePerson
{
  CLSSocialServiceContacts *v2;
  CNContact *meContact;
  GDVisualIdentifierView *visualIdentifierView;
  void *v5;
  uint64_t v6;
  CNContact *v7;
  CLSPersonIdentity *v8;
  CLSPersonIdentity *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *personsForLocalIdentifier;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  CLSPersonIdentity *mePerson;
  CLSPersonIdentity *v19;
  GDVisualIdentifierViewPerson *meViewPerson;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_mePerson)
  {
    meContact = v2->_meContact;
    if (meContact)
    {
      visualIdentifierView = v2->_visualIdentifierView;
      -[CNContact identifier](meContact, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[GDVisualIdentifierView personForIdentifier:](visualIdentifierView, "personForIdentifier:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = v2->_meContact;
    }
    else
    {
      v7 = 0;
      v6 = 0;
    }
    -[CLSSocialServiceContacts _personWithContact:viewPerson:createPersonIfNeeded:](v2, "_personWithContact:viewPerson:createPersonIfNeeded:", v7, v6, 1);
    v8 = (CLSPersonIdentity *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
LABEL_14:
      mePerson = v2->_mePerson;
      v2->_mePerson = v9;
      v19 = v9;

      meViewPerson = v2->_meViewPerson;
      v2->_meViewPerson = (GDVisualIdentifierViewPerson *)v6;

      goto LABEL_15;
    }
    -[CLSPersonIdentity localIdentifier](v8, "localIdentifier");
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[CLSPersonIdentity fullName](v9, "fullName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_10;
      v10 = v2->_personsForLocalIdentifier;
      objc_sync_enter(v10);
      personsForLocalIdentifier = v2->_personsForLocalIdentifier;
      -[CLSPersonIdentity fullName](v9, "fullName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](personsForLocalIdentifier, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSPersonIdentity setLocalIdentifier:](v9, "setLocalIdentifier:", v15);

      objc_sync_exit(v10);
    }

LABEL_10:
    if (!-[CLSPersonIdentity isMe](v9, "isMe"))
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        v22 = -[CLSPersonIdentity relationship](v9, "relationship");
        -[CNContact identifier](v2->_meContact, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSPersonIdentity CNIdentifier](v9, "CNIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 134218754;
        v26 = v22;
        v27 = 2048;
        v28 = 14;
        v29 = 2112;
        v30 = v23;
        v31 = 2112;
        v32 = v24;
        _os_log_fault_impl(&dword_1CAB79000, v17, OS_LOG_TYPE_FAULT, "mePerson has invalid relationship: %tu, expected %tu. meContact id: %@, mePerson id: %@", (uint8_t *)&v25, 0x2Au);

      }
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_sync_exit(v2);

  return v2->_mePerson;
}

- (id)personResultsForName:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  double v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  char v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_personsForLocalIdentifier;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_personsForLocalIdentifier, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  if (v9
    || (v11 = self->_personsInContactStoreForCNIdentifiers,
        objc_sync_enter(v11),
        -[NSMutableDictionary objectForKeyedSubscript:](self->_personsInContactStoreForCNIdentifiers, "objectForKeyedSubscript:", v6), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_sync_exit(v11), v11, v9))
  {
    LODWORD(v10) = 1.0;
    +[CLSPersonIdentityResult personResultWithPerson:andConfidence:](CLSPersonIdentityResult, "personResultWithPerson:andConfidence:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if (v13)
      goto LABEL_11;
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v15 = 0;
    if (!v7)
      goto LABEL_10;
  }
  -[CLSSocialServiceContacts _personResultsForPersonLocalIdentifier:isLackingFaces:inPhotoLibrary:](self, "_personResultsForPersonLocalIdentifier:isLackingFaces:inPhotoLibrary:", v6, &v15, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (v15)
    {
      v13 = 0;
      goto LABEL_11;
    }
LABEL_10:
    -[CLSSocialServiceContacts _personResultsForfullName:](self, "_personResultsForfullName:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:

  return v13;
}

- (id)_personResultsForfullName:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  GDVisualIdentifierView *visualIdentifierView;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  char v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke;
  v45[3] = &unk_1E84F8BF8;
  v45[4] = self;
  v7 = v4;
  v46 = v7;
  v49 = 0;
  v8 = v5;
  v47 = v8;
  v48 = 0;
  v43[0] = v6;
  v43[1] = 3221225472;
  v43[2] = __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_2;
  v43[3] = &unk_1E84F8C20;
  v9 = (id)MEMORY[0x1D1796244](v45);
  v44 = v9;
  v10 = MEMORY[0x1D1796244](v43);
  v11 = (void *)v10;
  if (self->_visualIdentifierView)
  {
    v33 = (void *)v10;
    v34 = v8;
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    visualIdentifierView = self->_visualIdentifierView;
    v40[0] = v6;
    v40[1] = 3221225472;
    v40[2] = __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_3;
    v40[3] = &unk_1E84F8C48;
    v15 = v13;
    v41 = v15;
    v16 = v12;
    v42 = v16;
    v35 = v7;
    -[GDVisualIdentifierView enumeratePeopleMatchingName:block:](visualIdentifierView, "enumeratePeopleMatchingName:block:", v7, v40);
    -[CLSSocialServiceContacts contactsByIdentifierForIdentifiers:](self, "contactsByIdentifierForIdentifiers:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v23, "contactIdentifiers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v25, "length"))
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }
          (*((void (**)(id, void *, void *))v9 + 2))(v9, v26, v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v20);
    }

    v8 = v34;
    v7 = v35;
    v11 = v33;
  }
  else
  {
    v27 = objc_alloc(MEMORY[0x1E0C97210]);
    +[CLSSocialServiceContacts defaultKeysToFetch](CLSSocialServiceContacts, "defaultKeysToFetch");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v27, "initWithKeysToFetch:", v28);

    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v29);

    -[CNContactStore enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:](self->_contactStore, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v16, 0, v11);
  }

  if ((unint64_t)objc_msgSend(0, "count") < 2)
  {
    v30 = v8;
  }
  else
  {
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_148);
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v30;

  return v31;
}

- (id)_personResultsForPersonLocalIdentifier:(id)a3 isLackingFaces:(BOOL *)a4 inPhotoLibrary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  float v27;
  void *v28;
  int v29;
  void *v30;
  NSMutableDictionary *v31;
  double v32;
  void *v33;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4)
    *a4 = 0;
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CD16C0];
  v40[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchPersonsWithLocalIdentifiers:options:", v12, v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x1E0CD1B60];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFetchPropertySets:", v16);

    objc_msgSend(MEMORY[0x1E0CD1528], "fetchKeyFaceForPerson:options:", v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[CLSSocialServiceContacts _sexFromFaceBiologicalSex:](self, "_sexFromFaceBiologicalSex:", objc_msgSend(v18, "sexType"));
    v35 = -[CLSSocialServiceContacts _ageCategoryFromFaceAgeType:](self, "_ageCategoryFromFaceAgeType:", objc_msgSend(v18, "ageType"));
    objc_msgSend(v14, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "personUri");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && objc_msgSend(v20, "length"))
    {
      -[CLSSocialServiceContacts _personWithContactIdentifier:](self, "_personWithContactIdentifier:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v22 = 1.0;
    if (v19 && objc_msgSend(v19, "length") && !v21)
    {
      -[CLSSocialServiceContacts _personResultsForfullName:](self, "_personResultsForfullName:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "confidence");
        if (v25 >= 1.0)
        {
          objc_msgSend(v24, "person");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "confidence");
          v22 = v27;
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    if (v21)
    {
      objc_msgSend(v21, "sourceService");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("megadome"));

      if (v29)
      {
        objc_msgSend(v14, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setFullName:", v30);

      }
      objc_msgSend(v21, "setLocalIdentifier:", v8);
      objc_msgSend(v21, "setIsFavorite:", objc_msgSend(v14, "type") == 1);
      objc_msgSend(v21, "setIsHidden:", objc_msgSend(v14, "type") == -1);
      objc_msgSend(v21, "setIsUserCreated:", 1);
    }
    else
    {
      +[CLSPersonIdentity personWithPHPerson:](CLSPersonIdentity, "personWithPHPerson:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "setAgeCategory:", v35);
    objc_msgSend(v21, "setSex:", v36);
    v31 = self->_personsForLocalIdentifier;
    objc_sync_enter(v31);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personsForLocalIdentifier, "setObject:forKeyedSubscript:", v21, v8);
    objc_sync_exit(v31);

    *(float *)&v32 = v22;
    +[CLSPersonIdentityResult personResultWithPerson:andConfidence:](CLSPersonIdentityResult, "personResultWithPerson:andConfidence:", v21, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_personWithContact:(id)a3 viewPerson:(id)a4 createPersonIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  CLSSocialServiceContacts *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  BOOL v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  if (v8)
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v10->_personsForCNIdentifiers, "objectForKeyedSubscript:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = 1;
    else
      v13 = !v5;
    if (!v13)
    {
      v12 = -[CLSSocialServiceContacts __newPersonWithContact:viewPerson:](v10, "__newPersonWithContact:viewPerson:", v8, v9);
      if (v12)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_personsForCNIdentifiers, "setObject:forKeyedSubscript:", v12, v11);
    }
  }
  else
  {
    if (!v9)
    {
      v12 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v9, "entityIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](v10->_personsForGDIdentifiers, "objectForKeyedSubscript:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      v15 = 1;
    else
      v15 = !v5;
    if (!v15)
    {
      v12 = -[CLSSocialServiceContacts __newPersonWithContact:viewPerson:](v10, "__newPersonWithContact:viewPerson:", 0, v9);
      if (v12)
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_personsForGDIdentifiers, "setObject:forKeyedSubscript:", v12, v11);
    }
  }

LABEL_16:
  objc_sync_exit(v10);

  return v12;
}

- (id)_personWithContactIdentifier:(id)a3
{
  id v4;
  CLSSocialServiceContacts *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5434;
  v17 = __Block_byref_object_dispose__5435;
  v18 = 0;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_personsForCNIdentifiers, "objectForKeyedSubscript:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v14[5];
    v14[5] = v6;

    objc_sync_exit(v5);
    v8 = (void *)v14[5];
    if (!v8)
    {
      v19[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__CLSSocialServiceContacts__personWithContactIdentifier___block_invoke;
      v12[3] = &unk_1E84F8CB8;
      v12[4] = &v13;
      -[CLSSocialServiceContacts enumeratePersonsForIdentifiers:usingBlock:](v5, "enumeratePersonsForIdentifiers:usingBlock:", v9, v12);

      v8 = (void *)v14[5];
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = v8;
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)__newPersonWithContact:(id)a3 viewPerson:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  id WeakRetained;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  CLSSocialServiceContacts *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (v7)
      goto LABEL_46;
    v10 = 0;
    goto LABEL_48;
  }
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPersonIdentity personWithCNIdentifier:](CLSPersonIdentity, "personWithCNIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "givenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {

  }
  else
  {
    objc_msgSend(v6, "familyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (!v13)
      goto LABEL_8;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v6, "givenName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGivenName:", v15);

  objc_msgSend(v6, "familyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFamilyName:", v16);

  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v14, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocalizedShortName:", v17);

LABEL_8:
  v71 = v8;
  -[CLSSocialServiceContacts _fullNameWithContact:](self, "_fullNameWithContact:", v6);
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFullName:", v18);
  objc_msgSend(v6, "givenName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFirstName:", v19);

  objc_msgSend(v6, "middleName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMiddleName:", v20);

  objc_msgSend(v6, "familyName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastName:", v21);

  objc_msgSend(v6, "nickname");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNickname:", v22);

  objc_msgSend(v6, "birthday");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBirthdayDate:", v24);

  objc_msgSend(v10, "birthdayDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_msgSend(v6, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSSocialServiceContacts potentialBirthdayDateForCNIdentifier:fullName:](self, "potentialBirthdayDateForCNIdentifier:fullName:", v26, v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setPotentialBirthdayDate:", v27);
  }
  v69 = (void *)v18;
  objc_msgSend(v6, "organizationName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompanyName:", v28);

  objc_msgSend(v10, "setRelationship:", -[CLSSocialServiceContacts _relationshipForContact:](self, "_relationshipForContact:", v6));
  objc_msgSend(v6, "dates");
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v84;
    v33 = (void *)*MEMORY[0x1E0C96FE8];
    while (2)
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v84 != v32)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v35, "label");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36 == v33)
          goto LABEL_21;
        v37 = v36;
        if (objc_msgSend(v36, "isEqualToString:", v33))
        {
          v33 = v37;
LABEL_21:
          objc_msgSend(v35, "value");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v38, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAnniversaryDate:", v39);

          goto LABEL_22;
        }

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
      if (v31)
        continue;
      break;
    }
  }
LABEL_22:
  v70 = self;

  objc_msgSend(v6, "phoneNumbers");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  if (v41)
    objc_msgSend(v10, "setHasPhoneNumber:", 1);
  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v6, "emailAddresses");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v80 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "value");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "lowercaseString");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v49);

      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    }
    while (v45);
  }

  objc_msgSend(v10, "setEmailAddresses:", v42);
  v50 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v6, "phoneNumbers");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v76;
    do
    {
      for (k = 0; k != v53; ++k)
      {
        if (*(_QWORD *)v76 != v54)
          objc_enumerationMutation(v51);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * k), "value");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringValue");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v57);

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v53);
  }

  objc_msgSend(v10, "setPhoneNumbers:", v50);
  self = v70;
  -[CLSSocialServiceContacts _addAddressesToPerson:withContact:](v70, "_addAddressesToPerson:withContact:", v10, v6);
  v8 = v71;
  if (objc_msgSend(v10, "isMe"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&v70->_delegate);
    if (objc_msgSend(WeakRetained, "hasAddressesForMePerson"))
    {
      -[CLSSocialServiceContacts _addDelegateAddressesToPerson:ofType:](v70, "_addDelegateAddressesToPerson:ofType:", v10, 0);
      -[CLSSocialServiceContacts _addDelegateAddressesToPerson:ofType:](v70, "_addDelegateAddressesToPerson:ofType:", v10, 1);
    }

  }
  objc_msgSend(v6, "socialProfiles");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "count");

  if (v60)
  {
    v61 = (void *)objc_opt_new();
    objc_msgSend(v6, "socialProfiles");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __62__CLSSocialServiceContacts___newPersonWithContact_viewPerson___block_invoke;
    v72[3] = &unk_1E84F8CE0;
    v63 = v10;
    v73 = v63;
    v74 = v61;
    v64 = v61;
    objc_msgSend(v62, "enumerateObjectsUsingBlock:", v72);

    objc_msgSend(v63, "setSocialProfiles:", v64);
  }
  objc_msgSend(v10, "setHasContactProfilePicture:", objc_msgSend(v6, "imageDataAvailable"));
  objc_msgSend(v6, "identifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSourceService:andID:", CFSTR("contacts"), v65);

  if (v71)
  {
    if (v10)
    {
LABEL_47:
      -[CLSSocialServiceContacts _addMissingPropertiesToPerson:withViewPerson:](self, "_addMissingPropertiesToPerson:withViewPerson:", v10, v8);
      goto LABEL_48;
    }
LABEL_46:
    objc_msgSend(v8, "entityIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringValue");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    +[CLSPersonIdentity personWithGDIdentifier:](CLSPersonIdentity, "personWithGDIdentifier:", v67);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceService:andID:", CFSTR("megadome"), v67);

    goto LABEL_47;
  }
LABEL_48:

  return v10;
}

- (void)_addDelegateAddressesToPerson:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  unint64_t v18;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mePersonAddressesOfType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "prefetchPersonAddressesIfNeededWithLocationCache:", self->_locationCache);
  v9 = (void *)MEMORY[0x1E0CB3880];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __65__CLSSocialServiceContacts__addDelegateAddressesToPerson_ofType___block_invoke;
  v16 = &unk_1E84F8D38;
  v10 = v6;
  v17 = v10;
  v18 = a4;
  objc_msgSend(v9, "predicateWithBlock:", &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v11, v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
    objc_msgSend(v10, "addAddresses:ofType:", v12, a4);

}

- (void)_addMissingPropertiesToPerson:(id)a3 withViewPerson:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  void *v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v50 = v5;
  objc_msgSend(v5, "anniversaryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "anniversary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_5;
    objc_msgSend(v6, "anniversary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnniversaryDate:", v9);

  }
LABEL_5:
  objc_msgSend(v5, "birthdayDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v6, "dateOfBirth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "dateOfBirth");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBirthdayDate:", v12);

    goto LABEL_8;
  }
LABEL_9:
  if ((objc_msgSend(v5, "hasAddresses") & 1) == 0)
  {
    objc_msgSend(v6, "locations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v48 = v6;
      objc_msgSend(v6, "locations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      if (!v16)
        goto LABEL_24;
      v17 = v16;
      v18 = *(_QWORD *)v56;
      v19 = *MEMORY[0x1E0C96FF8];
      v20 = *MEMORY[0x1E0C97070];
      while (1)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v56 != v18)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v22, "label");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "length"))
          {
            if (objc_msgSend(v23, "isEqualToString:", v19))
            {
              objc_msgSend(v22, "addresses");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "firstObject");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[CLSSocialServiceContacts _cnPostalAddressForGDLocationAddress:](self, "_cnPostalAddressForGDLocationAddress:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v61 = v26;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v50;
              v29 = v27;
              v30 = 0;
            }
            else
            {
              if (!objc_msgSend(v23, "isEqualToString:", v20))
                goto LABEL_22;
              objc_msgSend(v22, "addresses");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "firstObject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[CLSSocialServiceContacts _cnPostalAddressForGDLocationAddress:](self, "_cnPostalAddressForGDLocationAddress:", v32);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v60 = v26;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v50;
              v29 = v27;
              v30 = 1;
            }
            objc_msgSend(v28, "addAddresses:ofType:", v29, v30);

          }
LABEL_22:

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
        if (!v17)
        {
LABEL_24:

          v6 = v48;
          break;
        }
      }
    }
  }
  if (self->_meViewPerson)
  {
    if (!objc_msgSend(v50, "relationship"))
    {
      objc_msgSend(v6, "relatedPeople");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34)
      {
        -[GDVisualIdentifierViewPerson entityIdentifier](self->_meViewPerson, "entityIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringValue");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v37 = v6;
        objc_msgSend(v6, "relatedPeople");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v40; ++j)
            {
              if (*(_QWORD *)v52 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend(v43, "linkedPersonEntityIdentifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "stringValue");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "isEqualToString:", v36);

              if (v46)
              {
                objc_msgSend(v43, "relationshipLabel");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "setRelationship:", -[CLSSocialServiceContacts _relationshipForLabel:](self, "_relationshipForLabel:", v47));

              }
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          }
          while (v40);
        }

        v6 = v37;
      }
    }
  }

}

- (unint64_t)_relationshipForLabel:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96BB8]) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96D08]) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96D90]) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C969D8]) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96E08]) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96A28]) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96BF8]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96DE8]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96E78]) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96958]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96D00]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96E58]) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96AF0]))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_cnPostalAddressForGDLocationAddress:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C973A8]);
  objc_msgSend(v3, "thoroughfare");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "subThoroughfare");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(v4, "setValue:forKey:", v6, *MEMORY[0x1E0C970C8]);

  }
  objc_msgSend(v3, "subLocality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setValue:forKey:", v9, *MEMORY[0x1E0C970D8]);
  objc_msgSend(v3, "locality");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setValue:forKey:", v10, *MEMORY[0x1E0C97098]);
  objc_msgSend(v3, "postalCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setValue:forKey:", v11, *MEMORY[0x1E0C970B0]);
  objc_msgSend(v3, "subAdministrativeArea");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setValue:forKey:", v12, *MEMORY[0x1E0C970D0]);
  objc_msgSend(v3, "administrativeArea");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setValue:forKey:", v13, *MEMORY[0x1E0C970C0]);
  objc_msgSend(v3, "country");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setValue:forKey:", v14, *MEMORY[0x1E0C970A0]);
  objc_msgSend(v3, "ISOCountryCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setValue:forKey:", v15, *MEMORY[0x1E0C970A8]);

  return v4;
}

- (void)_addAddressesToPerson:(id)a3 withContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  objc_msgSend(v5, "postalAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = (void *)*MEMORY[0x1E0C96FF8];
    v13 = (void *)*MEMORY[0x1E0C97070];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 == v12 || objc_msgSend(v16, "isEqualToString:", v12))
        {
          objc_msgSend(v15, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v6;
LABEL_12:
          objc_msgSend(v19, "addObject:", v18);

          goto LABEL_13;
        }
        if (v17 == v13 || objc_msgSend(v17, "isEqualToString:", v13))
        {
          objc_msgSend(v15, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v7;
          goto LABEL_12;
        }
LABEL_13:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v21, "addAddresses:ofType:", v6, 0);
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v21, "addAddresses:ofType:", v7, 1);

}

- (unint64_t)_relationshipForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  double v27;
  void *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[15];

  v41[13] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](self->_meContact, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 14;
  }
  else
  {
    v9 = *MEMORY[0x1E0C96D08];
    v41[0] = *MEMORY[0x1E0C96BB8];
    v41[1] = v9;
    v10 = *MEMORY[0x1E0C969D8];
    v41[2] = *MEMORY[0x1E0C96D90];
    v41[3] = v10;
    v11 = *MEMORY[0x1E0C96A28];
    v41[4] = *MEMORY[0x1E0C96E08];
    v41[5] = v11;
    v12 = *MEMORY[0x1E0C96E78];
    v41[6] = *MEMORY[0x1E0C96BF8];
    v41[7] = v12;
    v13 = *MEMORY[0x1E0C96958];
    v41[8] = *MEMORY[0x1E0C96DE8];
    v41[9] = v13;
    v14 = *MEMORY[0x1E0C96E58];
    v41[10] = *MEMORY[0x1E0C96D00];
    v41[11] = v14;
    v41[12] = *MEMORY[0x1E0C96AF0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSSocialServiceContacts _fullNameWithContact:](self, "_fullNameWithContact:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clsBetterComponentsSeparatedByCharactersInSet:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContact contactRelations](self->_meContact, "contactRelations");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v8)
    {
      v35 = v15;
      v34 = v4;
      v20 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v19);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v22, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "clsBetterComponentsSeparatedByCharactersInSet:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLSSocialServiceContacts _fuzzyMatchingScoreBetweenNameComponents:andNameComponents:](self, "_fuzzyMatchingScoreBetweenNameComponents:andNameComponents:", v25, v18);
          v27 = v26;

          if (v27 >= 0.8)
          {
            objc_msgSend(v22, "label");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v35;
            v29 = objc_msgSend(v35, "indexOfObject:", v28);
            if (v29 > 0xC)
              v8 = 0;
            else
              v8 = qword_1CABE8ED0[v29];
            v4 = v34;

            goto LABEL_16;
          }

        }
        v8 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v8)
          continue;
        break;
      }
      v4 = v34;
      v15 = v35;
    }
LABEL_16:

    -[CNContact organizationName](self->_meContact, "organizationName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizationName");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v30
      && v31
      && (!objc_msgSend(v30, "rangeOfString:options:", v31, 129)
       || !objc_msgSend(v32, "rangeOfString:options:", v30, 129)))
    {
      v8 |= 1uLL;
    }

  }
  return v8;
}

- (void)enumerateAllPersonsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, uint8_t *);
  CLSSocialServiceContacts *v5;
  NSMutableArray *allPersons;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  id v13;
  void *v14;
  void *v15;
  CNContactStore *contactStore;
  id v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  void (**v25)(id, _QWORD, uint8_t *);
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint8_t *))a3;
  v5 = self;
  objc_sync_enter(v5);
  allPersons = v5->_allPersons;
  if (allPersons)
  {
    if (v4)
    {
      buf[0] = 0;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = allPersons;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v21;
LABEL_5:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v7);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10), buf);
          if (buf[0])
            break;
          if (v8 == ++v10)
          {
            v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
            if (v8)
              goto LABEL_5;
            break;
          }
        }
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v5->_allPersons;
    v5->_allPersons = (NSMutableArray *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C97210]);
    +[CLSSocialServiceContacts defaultKeysToFetch](CLSSocialServiceContacts, "defaultKeysToFetch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithKeysToFetch:", v14);

    contactStore = v5->_contactStore;
    v26 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __58__CLSSocialServiceContacts_enumerateAllPersonsUsingBlock___block_invoke;
    v24[3] = &unk_1E84F8D60;
    v24[4] = v5;
    v25 = v4;
    -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v15, &v26, v24);
    v17 = v26;
    if (v17)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loggingConnection");
      v19 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_error_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_ERROR, "Error fetching all persons: %@", buf, 0xCu);
      }

    }
  }
  objc_sync_exit(v5);

}

- (id)_allPersons
{
  -[CLSSocialServiceContacts enumerateAllPersonsUsingBlock:](self, "enumerateAllPersonsUsingBlock:", 0);
  return self->_allPersons;
}

- (id)contactsForIdentifiers:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactStore *contactStore;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = (objc_class *)MEMORY[0x1E0C97210];
  v5 = a3;
  v6 = [v4 alloc];
  +[CLSSocialServiceContacts defaultKeysToFetch](CLSSocialServiceContacts, "defaultKeysToFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKeysToFetch:", v7);

  v9 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v5, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "predicateForContactsWithIdentifiers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  contactStore = self->_contactStore;
  v19 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__CLSSocialServiceContacts_contactsForIdentifiers___block_invoke;
  v17[3] = &unk_1E84F8D88;
  v14 = v12;
  v18 = v14;
  -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, &v19, v17);
  v15 = v19;

  return v14;
}

- (id)contactsByIdentifierForIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNContactStore *contactStore;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C97210]);
    +[CLSSocialServiceContacts defaultKeysToFetch](CLSSocialServiceContacts, "defaultKeysToFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithKeysToFetch:", v6);

    v8 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v4, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForContactsWithIdentifiers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v10);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    contactStore = self->_contactStore;
    v18 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__CLSSocialServiceContacts_contactsByIdentifierForIdentifiers___block_invoke;
    v16[3] = &unk_1E84F8D88;
    v13 = v11;
    v17 = v13;
    -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v18, v16);
    v14 = v18;

  }
  else
  {
    v13 = (id)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

- (id)matchingDictionaryForContactIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSSocialServiceContacts contactsForIdentifiers:](self, "contactsForIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71680], "matchingDictionaryForContact:contactStore:", v6, self->_contactStore);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)personsInContactStoreForContactIdentifiers:(id)a3 needsRefetching:(BOOL)a4 progressBlock:(id)a5
{
  _BOOL4 v6;
  CLSSocialServiceContacts *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  CLSPersonIdentity *v34;
  id v35;
  void *v37;
  id v38;
  void (**v39)(id, _BYTE *, double);
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  unsigned __int8 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v6 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v39 = (void (**)(id, _BYTE *, double))a5;
  v54 = 0;
  v8 = self;
  objc_sync_enter(v8);
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v6)
  {
    objc_msgSend(v40, "unionSet:", v38);
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v9 = v38;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v51 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if (objc_msgSend(v13, "length"))
          {
            -[NSMutableDictionary objectForKeyedSubscript:](v8->_personsInContactStoreForCNIdentifiers, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              objc_msgSend(v14, "CNIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "length") == 0;

              if (!v17)
                objc_msgSend(v41, "setObject:forKeyedSubscript:", v15, v13);
            }
            else
            {
              objc_msgSend(v40, "addObject:", v13);
            }

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v10);
    }

  }
  if (objc_msgSend(v40, "count"))
  {
    -[CLSSocialServiceContacts contactsForIdentifiers:](v8, "contactsForIdentifiers:", v38);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v47 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          v23 = (void *)MEMORY[0x1D1796094]();
          v39[2](v39, &v54, 0.5);
          v24 = v54;
          if (!v54)
          {
            objc_msgSend(v22, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "length"))
            {
              v26 = -[CLSSocialServiceContacts __newPersonWithContact:viewPerson:](v8, "__newPersonWithContact:viewPerson:", v22, 0);
              objc_msgSend(v26, "prefetchPersonAddressesIfNeededWithLocationCache:", v8->_locationCache);
              objc_msgSend(v41, "setObject:forKeyedSubscript:", v26, v25);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_personsInContactStoreForCNIdentifiers, "setObject:forKeyedSubscript:", v26, v25);

            }
          }
          objc_autoreleasePoolPop(v23);
          if (v24)
          {

            v35 = (id)MEMORY[0x1E0C9AA70];
            goto LABEL_42;
          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        if (v19)
          continue;
        break;
      }
    }

    v27 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v41, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "minusSet:", v37);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = v40;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v43 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
          if (objc_msgSend(v33, "length"))
          {
            v34 = objc_alloc_init(CLSPersonIdentity);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_personsInContactStoreForCNIdentifiers, "setObject:forKeyedSubscript:", v34, v33);

          }
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v30);
    }

  }
  v35 = v41;
LABEL_42:

  objc_sync_exit(v8);
  return v35;
}

- (void)enumeratePersonsForIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  void *v30;
  GDVisualIdentifierView *visualIdentifierView;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  void (**v37)(id, void *, _BYTE *);
  id v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = (void (**)(id, void *, _BYTE *))a4;
  if (!v37)
    goto LABEL_36;
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_personsForCNIdentifiers, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          objc_msgSend(v38, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v38, "count");
  v35 = v6;
  if (v14)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSSocialServiceContacts contactsForIdentifiers:](self, "contactsForIdentifiers:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v45 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v19);
    }

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v7;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (!v24)
    goto LABEL_35;
  v25 = v24;
  v26 = *(_QWORD *)v41;
  while (2)
  {
    for (k = 0; k != v25; ++k)
    {
      if (*(_QWORD *)v41 != v26)
        objc_enumerationMutation(obj);
      v28 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
      if (v14
        && (objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k)),
            (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v30 = v29;
        visualIdentifierView = self->_visualIdentifierView;
        objc_msgSend(v29, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[GDVisualIdentifierView personForIdentifier:](visualIdentifierView, "personForIdentifier:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[CLSSocialServiceContacts _personWithContact:viewPerson:createPersonIfNeeded:](self, "_personWithContact:viewPerson:createPersonIfNeeded:", v30, v33, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
          goto LABEL_31;
      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_personsForCNIdentifiers, "objectForKeyedSubscript:", v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        if (!v34)
          goto LABEL_31;
      }
      v39 = 0;
      v37[2](v37, v34, &v39);
      if (v39)
      {

        goto LABEL_35;
      }
LABEL_31:

    }
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v25)
      continue;
    break;
  }
LABEL_35:

  v6 = v35;
LABEL_36:

}

- (id)personForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5434;
  v13 = __Block_byref_object_dispose__5435;
  v14 = 0;
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__CLSSocialServiceContacts_personForIdentifier___block_invoke;
  v8[3] = &unk_1E84F8CB8;
  v8[4] = &v9;
  -[CLSSocialServiceContacts enumeratePersonsForIdentifiers:usingBlock:](self, "enumeratePersonsForIdentifiers:usingBlock:", v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_fullNameWithContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "areKeysAvailable:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_firstNameForPersonRecord:(id)a3
{
  return (id)objc_msgSend(a3, "givenName");
}

- (id)_lastNameForPersonRecord:(id)a3
{
  return (id)objc_msgSend(a3, "familyName");
}

- (id)_nicknameForPersonRecord:(id)a3
{
  return (id)objc_msgSend(a3, "nickname");
}

- (id)_maidenNameForPersonRecord:(id)a3
{
  return (id)objc_msgSend(a3, "previousFamilyName");
}

- (void)enumeratePersonsAndRelationshipUsingBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__CLSSocialServiceContacts_enumeratePersonsAndRelationshipUsingBlock___block_invoke;
    v6[3] = &unk_1E84F8DB0;
    v7 = v4;
    -[CLSSocialServiceContacts enumerateAllPersonsUsingBlock:](self, "enumerateAllPersonsUsingBlock:", v6);

  }
}

- (id)personLocalIdentifierMatchingContactPictureForContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_group_t v11;
  CNContactStore *contactStore;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  NSObject *v23;
  __int128 *p_buf;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t v33[4];
  id v34;
  __int16 v35;
  id v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  id v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CLSSocialServiceContacts personForIdentifier:](self, "personForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasContactProfilePicture") & 1) != 0)
  {
    v43[0] = *MEMORY[0x1E0C96890];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v6);
    v8 = (void *)MEMORY[0x1E0C97200];
    v42 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForContactsWithIdentifiers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v10);

    v11 = dispatch_group_create();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__5434;
    v40 = __Block_byref_object_dispose__5435;
    v41 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__5434;
    v31 = __Block_byref_object_dispose__5435;
    v32 = 0;
    contactStore = self->_contactStore;
    v26 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92__CLSSocialServiceContacts_personLocalIdentifierMatchingContactPictureForContactIdentifier___block_invoke;
    v21[3] = &unk_1E84F8E00;
    v13 = v4;
    v22 = v13;
    p_buf = &buf;
    v14 = v11;
    v23 = v14;
    v25 = &v27;
    -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v26, v21);
    v15 = v26;
    if (v15)
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v33 = 138412546;
        v34 = v13;
        v35 = 2112;
        v36 = v15;
        _os_log_error_impl(&dword_1CAB79000, v17, OS_LOG_TYPE_ERROR, "Error while enumerating contacts for identifier %@: %@", v33, 0x16u);
      }

    }
    v18 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1CAB79000, v6, OS_LOG_TYPE_INFO, "ContactImage: Contact %@ has no profile picture", (uint8_t *)&buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

- (id)personForPersonHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4 && (-[NSMutableSet containsObject:](self->_nonFoundHandles, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableDictionary objectForKey:](self->_personByHandle, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (objc_msgSend(v4, "containsString:", CFSTR("@")))
      {
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[CLSSocialServiceContacts _personsMatchingPredicate:](self, "_personsMatchingPredicate:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personByHandle, "setObject:forKeyedSubscript:", v5, v4);
      }
      else
      {
        -[NSMutableSet addObject:](self->_nonFoundHandles, "addObject:", v4);
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)enumeratePersonsForFullName:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint8_t *);
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint8_t *))a4;
  if (v7 && (-[NSMutableSet containsObject:](self->_nonFoundFullNames, "containsObject:", v6) & 1) == 0)
  {
    -[NSMutableDictionary objectForKey:](self->_personByFullName, "objectForKey:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (id)v8;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personByFullName, "setObject:forKeyedSubscript:", v8, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLSSocialServiceContacts _personsMatchingPredicate:](self, "_personsMatchingPredicate:", v10);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "count"))
      {
        +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "loggingConnection");
        v16 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v6;
          _os_log_impl(&dword_1CAB79000, v16, OS_LOG_TYPE_INFO, "Contact %@ not found in Contact DB@", buf, 0xCu);
        }

        -[NSMutableSet addObject:](self->_nonFoundFullNames, "addObject:", v6);
LABEL_16:

        goto LABEL_17;
      }

    }
    buf[0] = 0;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v9;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
LABEL_9:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v9);
        if (buf[0])
          break;
        v7[2](v7, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++), buf);
        if (v12 == v14)
        {
          v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            goto LABEL_9;
          break;
        }
      }
    }

    goto LABEL_16;
  }
LABEL_17:

}

- (id)_personsMatchingPredicate:(id)a3
{
  id v4;
  CNContactStore *contactStore;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  GDVisualIdentifierView *visualIdentifierView;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  contactStore = self->_contactStore;
  +[CLSSocialServiceContacts defaultKeysToFetch](CLSSocialServiceContacts, "defaultKeysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v4, v6, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;

  if (v8)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v8;
      _os_log_error_impl(&dword_1CAB79000, v10, OS_LOG_TYPE_ERROR, "Error fetching contact from predicate %@", buf, 0xCu);
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v7;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = v12;
      v22 = v7;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          visualIdentifierView = self->_visualIdentifierView;
          objc_msgSend(v16, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[GDVisualIdentifierView personForIdentifier:](visualIdentifierView, "personForIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[CLSSocialServiceContacts _personWithContact:viewPerson:createPersonIfNeeded:](self, "_personWithContact:viewPerson:createPersonIfNeeded:", v16, v19, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v13);
      v7 = v22;
      v8 = 0;
    }
  }

  return v11;
}

- (void)invalidateCacheForPersonWithLocalIdentifiers:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_personsForLocalIdentifier;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_personsForLocalIdentifier, "removeObjectsForKeys:", v5);
  objc_sync_exit(v4);

}

- (void)invalidateCacheForPersonWithContactIdentifiers:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_personsForCNIdentifiers;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_personsForCNIdentifiers, "removeObjectsForKeys:", v5);
  objc_sync_exit(v4);

}

- (void)invalidateCacheForPersonInContactStoreWithContactIdentifiers:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_personsInContactStoreForCNIdentifiers;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_personsInContactStoreForCNIdentifiers, "removeObjectsForKeys:", v5);
  objc_sync_exit(v4);

}

- (unint64_t)_sexFromFaceBiologicalSex:(unsigned __int16)a3
{
  if (a3 > 2u)
    return 0;
  else
    return qword_1CABE8F38[a3];
}

- (unint64_t)_ageCategoryFromFaceAgeType:(unsigned __int16)a3
{
  if (a3 > 5u)
    return 0;
  else
    return qword_1CABE8F50[a3];
}

- (id)suggestionsService
{
  SGSuggestionsServiceContactsProtocol *suggestionsService;
  SGSuggestionsServiceContactsProtocol *v4;
  SGSuggestionsServiceContactsProtocol *v5;

  suggestionsService = self->_suggestionsService;
  if (!suggestionsService)
  {
    objc_msgSend(MEMORY[0x1E0D19970], "serviceForContacts");
    v4 = (SGSuggestionsServiceContactsProtocol *)objc_claimAutoreleasedReturnValue();
    v5 = self->_suggestionsService;
    self->_suggestionsService = v4;

    -[SGSuggestionsServiceContactsProtocol setSyncTimeout:](self->_suggestionsService, "setSyncTimeout:", 30.0);
    suggestionsService = self->_suggestionsService;
  }
  return suggestionsService;
}

- (void)enumeratePersonsAndPotentialBirthdayDateForContactIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, _BYTE *);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unsigned __int8 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[CLSSocialServiceContacts potentialBirthdayDateForCNIdentifier:fullName:](self, "potentialBirthdayDateForCNIdentifier:fullName:", v14, 0, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);
          -[CLSSocialServiceContacts personForIdentifier:](self, "personForIdentifier:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v16, v15, &v22);
          v17 = v22;

          if (v17)
          {

            goto LABEL_12;
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)potentialBirthdayDateForCNIdentifier:(id)a3 fullName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CLSSocialServiceContacts suggestionsService](self, "suggestionsService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  objc_msgSend(v8, "contactMatchesWithContactIdentifier:limitTo:error:", v6, 10, &v54);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v54;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v58 = v11;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Error suggestionService contactMatchesWithContactIdentifier: %@", buf, 0xCu);

    }
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v13)
    {
      v14 = v13;
      v39 = v9;
      v41 = v8;
      v43 = v6;
      v15 = 0;
      v16 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v51 != v16)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "contact");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "birthday");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "dateComponents");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v20, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            v23 = v21;

            v15 = v23;
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v14);

      v6 = v43;
      v9 = v39;
      v8 = v41;
      if (v15)
      {
        v10 = 0;
        goto LABEL_35;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v7, "length"))
  {

    v49 = 0;
    objc_msgSend(v8, "suggestContactMatchesWithFullTextSearch:limitTo:error:", v7, 10, &v49);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v49;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v58 = v25;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Error suggestionService suggestContactMatchesWithFullTextSearch: %@", buf, 0xCu);

      }
      v15 = 0;
    }
    else
    {
      v40 = v9;
      v42 = v8;
      v44 = v6;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v38 = v24;
      v26 = v24;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v27)
      {
        v28 = v27;
        v15 = 0;
        v29 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v46 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "contact");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "birthday");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "dateComponents");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v33, 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (v34)
            {
              v36 = v34;

              v15 = v36;
            }

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v28);
      }
      else
      {
        v15 = 0;
      }

      v6 = v44;
      v9 = v40;
      v8 = v42;
      v24 = v38;
    }

  }
  else
  {
    v15 = 0;
  }
LABEL_35:

  return v15;
}

- (float)_fuzzyMatchingScoreBetweenNameComponents:(id)a3 andNameComponents:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  float v14;
  unint64_t v15;
  unint64_t v16;
  float v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  float *v31;
  uint64_t v32;
  int v33;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v8 = objc_msgSend(v6, "count");
  v9 = v7 >= v8;
  if (v7 >= v8)
    v10 = v6;
  else
    v10 = v5;
  v30 = 0;
  v31 = (float *)&v30;
  if (!v9)
    v5 = v6;
  v32 = 0x2020000000;
  v33 = 0;
  v11 = (void *)objc_msgSend(v5, "mutableCopy");
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __87__CLSSocialServiceContacts__fuzzyMatchingScoreBetweenNameComponents_andNameComponents___block_invoke;
  v26[3] = &unk_1E84F8E28;
  v13 = v11;
  v28 = &v30;
  v29 = 129;
  v27 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v26);
  if (objc_msgSend(v13, "count"))
  {
    v19 = v12;
    v20 = 3221225472;
    v21 = __87__CLSSocialServiceContacts__fuzzyMatchingScoreBetweenNameComponents_andNameComponents___block_invoke_2;
    v22 = &unk_1E84F8E28;
    v25 = 129;
    v23 = v13;
    v24 = &v30;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v19);

  }
  v14 = v31[6];
  v15 = objc_msgSend(v10, "count", v19, v20, v21, v22);
  v16 = objc_msgSend(v13, "count");
  v17 = (float)(v14 / (float)v15)
      * (float)(1.0 - (float)((float)v16 / (float)(unint64_t)objc_msgSend(v5, "count")));

  _Block_object_dispose(&v30, 8);
  return v17;
}

- (float)_confidenceInPersonRecord:(id)a3 viewPerson:(id)a4 forName:(id)a5 components:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  float v49;
  void *v50;
  float v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  float v56;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  CLSSocialServiceContacts *v63;
  void *v64;
  void *v65;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v12, "clsBetterComponentsSeparatedByCharactersInSet:", v14);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CLSSocialServiceContacts _fullNameWithContact:](self, "_fullNameWithContact:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "names");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((!v16 || objc_msgSend(v16, "compare:", v12)) && (!v19 || objc_msgSend(v19, "compare:", v12)))
  {
    v62 = v19;
    objc_msgSend(v11, "nameComponents");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSSocialServiceContacts _firstNameForPersonRecord:](self, "_firstNameForPersonRecord:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v61 = v11;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(v11, "nameComponents");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "givenNames");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLSSocialServiceContacts _lastNameForPersonRecord:](self, "_lastNameForPersonRecord:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(v65, "familyNames");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v29 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLSSocialServiceContacts _nicknameForPersonRecord:](self, "_nicknameForPersonRecord:", v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      objc_msgSend(v65, "nicknames");
      v63 = self;
      v35 = v10;
      v36 = v13;
      v37 = v16;
      v38 = v12;
      v39 = v26;
      v40 = v31;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstObject");
      v34 = (id)objc_claimAutoreleasedReturnValue();

      v31 = v40;
      v26 = v39;
      v12 = v38;
      v16 = v37;
      v13 = v36;
      v10 = v35;
      self = v63;
    }

    objc_msgSend(v34, "stringByTrimmingCharactersInSet:", v14);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLSSocialServiceContacts _maidenNameForPersonRecord:](self, "_maidenNameForPersonRecord:", v10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringByTrimmingCharactersInSet:", v14);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count") == 1 && v26)
    {
      v44 = v64;
      if (!objc_msgSend(v12, "compare:options:", v26, 129)
        || !objc_msgSend(v12, "compare:options:", v31, 129)
        || !objc_msgSend(v12, "compare:options:", v42, 129)
        || (v23 = 0.0, !objc_msgSend(v12, "compare:options:", v64, 129)))
      {
        v23 = 0.5;
      }
      goto LABEL_42;
    }
    v58 = v42;
    v60 = v31;
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v26)
    {
      objc_msgSend(v26, "clsBetterComponentsSeparatedByCharactersInSet:", v14);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObjectsFromArray:", v46);

    }
    if (v31)
    {
      objc_msgSend(v31, "clsBetterComponentsSeparatedByCharactersInSet:", v14);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObjectsFromArray:", v47);

    }
    v23 = 0.0;
    if (!objc_msgSend(v45, "count", v58))
    {
      if (v16)
      {
        objc_msgSend(v16, "clsBetterComponentsSeparatedByCharactersInSet:", v14);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSSocialServiceContacts _fuzzyMatchingScoreBetweenNameComponents:andNameComponents:](self, "_fuzzyMatchingScoreBetweenNameComponents:andNameComponents:", v13, v48);
        v23 = v49;

      }
      if (v62)
      {
        objc_msgSend(v62, "clsBetterComponentsSeparatedByCharactersInSet:", v14);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLSSocialServiceContacts _fuzzyMatchingScoreBetweenNameComponents:andNameComponents:](self, "_fuzzyMatchingScoreBetweenNameComponents:andNameComponents:", v13, v50);
        if (v51 > v23)
          v23 = v51;

      }
    }
    if (v26)
    {
      v44 = v64;
      if (!v64)
      {
LABEL_41:

        v42 = v59;
        v31 = v60;
LABEL_42:

        v11 = v61;
        v19 = v62;
        goto LABEL_43;
      }
      v52 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v26, "clsBetterComponentsSeparatedByCharactersInSet:", v14);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(v52, "initWithArray:", v53);

      objc_msgSend(v64, "clsBetterComponentsSeparatedByCharactersInSet:", v14);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addObjectsFromArray:", v55);

      -[CLSSocialServiceContacts _fuzzyMatchingScoreBetweenNameComponents:andNameComponents:](self, "_fuzzyMatchingScoreBetweenNameComponents:andNameComponents:", v13, v54);
      if (v56 > v23)
        v23 = v56;

    }
    v44 = v64;
    goto LABEL_41;
  }
  v23 = 1.0;
LABEL_43:

  return v23;
}

- (CLSSocialServiceContactsDelegate)delegate
{
  return (CLSSocialServiceContactsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)personByFullName
{
  return self->_personByFullName;
}

- (void)setPersonByFullName:(id)a3
{
  objc_storeStrong((id *)&self->_personByFullName, a3);
}

- (NSMutableSet)nonFoundFullNames
{
  return self->_nonFoundFullNames;
}

- (void)setNonFoundFullNames:(id)a3
{
  objc_storeStrong((id *)&self->_nonFoundFullNames, a3);
}

- (NSMutableDictionary)personByHandle
{
  return self->_personByHandle;
}

- (void)setPersonByHandle:(id)a3
{
  objc_storeStrong((id *)&self->_personByHandle, a3);
}

- (NSMutableSet)nonFoundHandles
{
  return self->_nonFoundHandles;
}

- (void)setNonFoundHandles:(id)a3
{
  objc_storeStrong((id *)&self->_nonFoundHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonFoundHandles, 0);
  objc_storeStrong((id *)&self->_personByHandle, 0);
  objc_storeStrong((id *)&self->_nonFoundFullNames, 0);
  objc_storeStrong((id *)&self->_personByFullName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
  objc_storeStrong((id *)&self->_personsForLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_personsForGDIdentifiers, 0);
  objc_storeStrong((id *)&self->_personsInContactStoreForCNIdentifiers, 0);
  objc_storeStrong((id *)&self->_personsForCNIdentifiers, 0);
  objc_storeStrong((id *)&self->_allPersons, 0);
  objc_storeStrong((id *)&self->_meViewPerson, 0);
  objc_storeStrong((id *)&self->_mePerson, 0);
  objc_storeStrong((id *)&self->_visualIdentifierView, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __87__CLSSocialServiceContacts__fuzzyMatchingScoreBetweenNameComponents_andNameComponents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "compare:options:", v4, *(_QWORD *)(a1 + 48));

      if (!v5)
        break;
      if (++v3 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v3);
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                               + 1.0;
  }
LABEL_7:

}

void __87__CLSSocialServiceContacts__fuzzyMatchingScoreBetweenNameComponents_andNameComponents___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "rangeOfString:options:", v4, *(_QWORD *)(a1 + 48))
        || !objc_msgSend(v4, "rangeOfString:options:", v5, *(_QWORD *)(a1 + 48)))
      {
        break;
      }

      if (++v3 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v3);
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                               + 0.5;

  }
LABEL_8:

}

void __92__CLSSocialServiceContacts_personLocalIdentifierMatchingContactPictureForContactIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1D1796094]();
  objc_msgSend(v5, "thumbnailImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithData:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0D47780], "service");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
      v12 = objc_alloc_init(MEMORY[0x1E0D47728]);
      objc_msgSend(v12, "setMaximumFaceCount:", 1);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __92__CLSSocialServiceContacts_personLocalIdentifierMatchingContactPictureForContactIdentifier___block_invoke_170;
      v20[3] = &unk_1E84F8DD8;
      v21 = *(id *)(a1 + 32);
      v22 = v12;
      v24 = *(_QWORD *)(a1 + 56);
      v25 = a3;
      v23 = *(id *)(a1 + 40);
      v15 = v12;
      objc_msgSend(v13, "performRequests:onCIImage:withOrientation:andIdentifier:completionHandler:", v14, v8, 1, 0, v20);

      dispatch_group_wait(*(dispatch_group_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v28 = v19;
        _os_log_error_impl(&dword_1CAB79000, v15, OS_LOG_TYPE_ERROR, "ContactImage: Cannot get CIImage from thumbnailImageData of contact %@", buf, 0xCu);
      }
    }

  }
  else
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v28 = v17;
      _os_log_error_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_ERROR, "ContactImage: Contact %@ has a nil thumbnailImageData", buf, 0xCu);
    }
  }

  objc_autoreleasePoolPop(v6);
}

void __92__CLSSocialServiceContacts_personLocalIdentifierMatchingContactPictureForContactIdentifier___block_invoke_170(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  _BYTE v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v34 = a2;
      *(_WORD *)&v34[4] = 2112;
      *(_QWORD *)&v34[6] = v8;
      *(_WORD *)&v34[14] = 2112;
      *(_QWORD *)&v34[16] = v5;
      _os_log_error_impl(&dword_1CAB79000, v7, OS_LOG_TYPE_ERROR, "ContactImage: Error while performRequest %d for %@: %@", buf, 0x1Cu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 32);
      -[NSObject resultItems](v10, "resultItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v34 = v13;
      *(_WORD *)&v34[8] = 2048;
      *(_QWORD *)&v34[10] = objc_msgSend(v14, "count");
      _os_log_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_INFO, "ContactImage: Image data processed for contact %@, Result count: %zu", buf, 0x16u);

    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = v10;
    -[NSObject resultItems](v10, "resultItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v20, "personIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "confidence");
          v23 = v22;
          +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "loggingConnection");
          v25 = objc_claimAutoreleasedReturnValue();

          v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
          if (v23 >= 0.45)
          {
            if (v26)
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v34 = v21;
              _os_log_impl(&dword_1CAB79000, v25, OS_LOG_TYPE_INFO, "ContactImage: MAD Resolved personId = %@", buf, 0xCu);
            }

            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v21);
            **(_BYTE **)(a1 + 64) = 1;
          }
          else
          {
            if (v26)
            {
              *(_DWORD *)buf = 134218242;
              *(double *)v34 = v23;
              *(_WORD *)&v34[8] = 2112;
              *(_QWORD *)&v34[10] = v21;
              _os_log_impl(&dword_1CAB79000, v25, OS_LOG_TYPE_INFO, "ContactImage: MAD Resolved personId below confidence (%.2f) = %@", buf, 0x16u);
            }

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v17);
    }

    v7 = v27;
    v5 = 0;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __70__CLSSocialServiceContacts_enumeratePersonsAndRelationshipUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "relationship"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __48__CLSSocialServiceContacts_personForIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __63__CLSSocialServiceContacts_contactsByIdentifierForIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

uint64_t __51__CLSSocialServiceContacts_contactsForIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __58__CLSSocialServiceContacts_enumerateAllPersonsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = a2;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personForIdentifier:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_personWithContact:viewPerson:createPersonIfNeeded:", v6, v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", v8);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))(v9, v8, a3);

}

BOOL __65__CLSSocialServiceContacts__addDelegateAddressesToPerson_ofType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a2;
  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CLSSocialServiceContacts__addDelegateAddressesToPerson_ofType___block_invoke_2;
  v12[3] = &unk_1E84F8D10;
  v14 = &v15;
  v9 = v5;
  v13 = v9;
  objc_msgSend(v7, "enumerateAddressesOfType:asPlacemarkWithBlock:", v8, v12);
  v10 = *((_BYTE *)v16 + 24) == 0;

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __65__CLSSocialServiceContacts__addDelegateAddressesToPerson_ofType___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(a2, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distanceFromLocation:", v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7 <= 100.0;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
}

void __62__CLSSocialServiceContacts___newPersonWithContact_viewPerson___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fullName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (v10 && v9)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v10);

}

void __57__CLSSocialServiceContacts__personWithContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  float v6;
  float v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_confidenceInPersonRecord:viewPerson:forName:components:", v14, v5, *(_QWORD *)(a1 + 40), 0);
  v7 = v6;
  if (*(_BYTE *)(a1 + 64))
  {
    v8 = v14;
    if (v6 != 1.0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v6 == 1.0)
  {
    objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "_personWithContact:viewPerson:createPersonIfNeeded:", v14, v5, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    *(float *)&v11 = v7;
    +[CLSPersonIdentityResult personResultWithPerson:andConfidence:](CLSPersonIdentityResult, "personResultWithPerson:andConfidence:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    v8 = v14;
    goto LABEL_8;
  }
  v8 = v14;
  if (v6 >= 0.5)
    goto LABEL_7;
LABEL_8:
  if (v8)
  {
    v13 = *(void **)(a1 + 56);
    if (v13)
      objc_msgSend(v13, "addObject:", v14);
  }

}

uint64_t __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(v4, "contactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

uint64_t __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "confidence");
    v11 = v10;
    objc_msgSend(v5, "confidence");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t __59__CLSSocialServiceContacts__initializeVisualIdentifierView__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void __50__CLSSocialServiceContacts_initWithLocationCache___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_error_impl(&dword_1CAB79000, v10, OS_LOG_TYPE_ERROR, "Error gaining access to Contacts: %@", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_12;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v11 = "Not authorized to access Contacts";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "fetchMeCardFromContactStore:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v11 = "Contact for me is nil";
LABEL_11:
      _os_log_impl(&dword_1CAB79000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

+ (BOOL)canAccessContactsStore
{
  if (canAccessContactsStore_onceToken != -1)
    dispatch_once(&canAccessContactsStore_onceToken, &__block_literal_global_5491);
  return !canAccessContactsStore_isDeviceGreenTea
      || objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3;
}

+ (id)defaultKeysToFetch
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[16];

  v10[15] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x1E0C966D0], *MEMORY[0x1E0C96780], *MEMORY[0x1E0C966C0], *MEMORY[0x1E0C96820], *MEMORY[0x1E0C967A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C967B8];
  v10[5] = v2;
  v10[6] = v3;
  v4 = *MEMORY[0x1E0C966A8];
  v10[7] = *MEMORY[0x1E0C96670];
  v10[8] = v4;
  v5 = *MEMORY[0x1E0C967F0];
  v10[9] = *MEMORY[0x1E0C967C0];
  v10[10] = v5;
  v6 = *MEMORY[0x1E0C96840];
  v10[11] = *MEMORY[0x1E0C96690];
  v10[12] = v6;
  v7 = *MEMORY[0x1E0C96700];
  v10[13] = *MEMORY[0x1E0C96868];
  v10[14] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __50__CLSSocialServiceContacts_canAccessContactsStore__block_invoke()
{
  uint64_t result;

  result = PLIsChinaSKU();
  canAccessContactsStore_isDeviceGreenTea = result;
  return result;
}

@end
