@implementation NTKSiriDefaults

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__NTKSiriDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, block);
  return (id)sharedInstance___sharedInstance_3;
}

void __33__NTKSiriDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_3;
  sharedInstance___sharedInstance_3 = (uint64_t)v1;

}

- (NTKSiriDefaults)init
{
  NTKSiriDefaults *v2;
  NTKSiriDefaults *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  NTKSiriDefaults *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKSiriDefaults;
  v2 = -[NTKSiriDefaults init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKSiriDefaults _fetchNewFaceCollection](v2, "_fetchNewFaceCollection");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__activeDeviceDidChange_, *MEMORY[0x1E0C93E48], 0);

    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__NTKSiriDefaults_init__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    v8 = v3;
    dispatch_async(v5, block);

  }
  return v3;
}

uint64_t __23__NTKSiriDefaults_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateIfNecessary");
}

- (void)migrateIfNecessary
{
  NTKSiriDefaults *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  void *v8;
  NTKFaceCollection *v9;
  uint64_t v10;
  NTKFaceCollection *v11;
  NSObject *v12;
  NTKFaceCollection *v13;
  NTKFaceCollection *faceCollection;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  NTKFaceCollection *v21;
  uint8_t buf[4];
  NTKFaceCollection *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[NTKSiriDefaults _domainAccesor](v2, "_domainAccesor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("SiriDefaultsWatchHasMigratedDisabledDataSources")))
  {
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "[Migration] Preferences have already been migrated by watch";
LABEL_7:
      v6 = v4;
      v7 = 2;
LABEL_8:
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else if (objc_msgSend(v3, "BOOLForKey:", CFSTR("SiriDefaultsPhoneHasMigratedDisabledDataSources")))
  {
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "[Migration] Preferences have already been migrated by phone";
      goto LABEL_7;
    }
  }
  else
  {
    if (!-[NTKFaceCollection hasLoaded](v2->_faceCollection, "hasLoaded"))
    {
      _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      faceCollection = v2->_faceCollection;
      *(_DWORD *)buf = 138412290;
      v23 = faceCollection;
      v5 = "[Migration] Face collection %@ has not loaded. Will migrate once loaded";
      v6 = v4;
      v7 = 12;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v2->_faceCollection;
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __37__NTKSiriDefaults_migrateIfNecessary__block_invoke;
    v20[3] = &unk_1E6BD06D8;
    v11 = v8;
    v21 = v11;
    -[NTKFaceCollection enumerateFacesUsingBlock:](v9, "enumerateFacesUsingBlock:", v20);
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "[Migration] Propagating disabled data sources to all up next faces %@", buf, 0xCu);
    }

    v13 = v2->_faceCollection;
    v15 = v10;
    v16 = 3221225472;
    v17 = __37__NTKSiriDefaults_migrateIfNecessary__block_invoke_25;
    v18 = &unk_1E6BD06D8;
    v4 = v11;
    v19 = v4;
    -[NTKFaceCollection enumerateFacesUsingBlock:](v13, "enumerateFacesUsingBlock:", &v15);
    objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("SiriDefaultsPhoneHasMigratedDisabledDataSources"), v15, v16, v17, v18);

  }
LABEL_15:

  objc_sync_exit(v2);
}

void __37__NTKSiriDefaults_migrateIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "selectedOptionForCustomEditMode:slot:", 16, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disabledBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "disabledBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v6);

  }
}

void __37__NTKSiriDefaults_migrateIfNecessary__block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKUpNextDisabledDataSourcesEditOption optionWithDisabledDataSourceIdentifiers:forDevice:](NTKUpNextDisabledDataSourcesEditOption, "optionWithDisabledDataSourceIdentifiers:forDevice:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "selectOption:forCustomEditMode:slot:", v5, 16, 0);
  }

}

- (BOOL)isUpNextFaceCurrentlyActive
{
  void *v2;
  uint64_t v3;

  -[NTKFaceCollection selectedFace](self->_faceCollection, "selectedFace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceStyle");

  return v3 == 21 || v3 == 221;
}

- (BOOL)watchHasMigratedAvailableDataSources
{
  void *v2;
  char v3;

  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SiriDefaultsWatchHasMigratedAvailableDataSources"));

  return v3;
}

- (void)setWatchHasMigratedAvailableDataSources:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v3 = a3;
  v7[1] = *MEMORY[0x1E0C80C00];
  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("SiriDefaultsWatchHasMigratedAvailableDataSources"));

  v7[0] = CFSTR("SiriDefaultsWatchHasMigratedAvailableDataSources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiriDefaults _synchronizeDefaultsForKeys:](self, "_synchronizeDefaultsForKeys:", v6);

}

- (NSSet)phoneThirdPartyDataSources
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SiriDefaultsPhoneThirdPartyDataSources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }

  return (NSSet *)v3;
}

- (void)setPhoneThirdPartyDataSources:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = CFSTR("SiriDefaultsPhoneThirdPartyDataSources");
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Setting data sources for %@ - %@", buf, 0x16u);
  }

  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v4, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SiriDefaultsPhoneThirdPartyDataSources"));

  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("SiriDefaultsPhoneThirdPartyDataSources"));
  }

  v10 = CFSTR("SiriDefaultsPhoneThirdPartyDataSources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiriDefaults _synchronizeDefaultsForKeys:](self, "_synchronizeDefaultsForKeys:", v9);

  -[NTKSiriDefaults _thirdPartyDataSourcesDidChange](self, "_thirdPartyDataSourcesDidChange");
}

- (NSSet)watchThirdPartyDataSources
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SiriDefaultsWatchThirdPartyDataSources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }

  return (NSSet *)v3;
}

- (void)setWatchThirdPartyDataSources:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = CFSTR("SiriDefaultsWatchThirdPartyDataSources");
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Setting data sources for %@ - %@", buf, 0x16u);
  }

  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v4, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SiriDefaultsWatchThirdPartyDataSources"));

  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("SiriDefaultsWatchThirdPartyDataSources"));
  }

  v10 = CFSTR("SiriDefaultsWatchThirdPartyDataSources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiriDefaults _synchronizeDefaultsForKeys:](self, "_synchronizeDefaultsForKeys:", v9);

  -[NTKSiriDefaults _thirdPartyDataSourcesDidChange](self, "_thirdPartyDataSourcesDidChange");
}

- (void)setDisabledDataSources:(id)a3
{
  id v4;
  NTKSiriDefaults *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NTKFaceCollection *faceCollection;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  const __CFString *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Setting new disabled data sources %@", buf, 0xCu);
  }

  -[NTKSiriDefaults _domainAccesor](v5, "_domainAccesor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SiriDefaultsDisabledDataSources"));

  v17 = CFSTR("SiriDefaultsDisabledDataSources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiriDefaults _synchronizeDefaultsForKeys:](v5, "_synchronizeDefaultsForKeys:", v9);

  if ((objc_msgSend(v7, "BOOLForKey:", CFSTR("SiriDefaultsWatchHasMigratedDisabledDataSources")) & 1) == 0)
  {
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Watch has not migrated defaults. Propagating settings to all faces", buf, 2u);
    }

    faceCollection = v5->_faceCollection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __42__NTKSiriDefaults_setDisabledDataSources___block_invoke;
    v15 = &unk_1E6BD06D8;
    v16 = v4;
    -[NTKFaceCollection enumerateFacesUsingBlock:](faceCollection, "enumerateFacesUsingBlock:", &v12);

  }
  -[NTKSiriDefaults _disabledDataSourcesDidChange](v5, "_disabledDataSourcesDidChange", v12, v13, v14, v15);

  objc_sync_exit(v5);
}

void __42__NTKSiriDefaults_setDisabledDataSources___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKUpNextDisabledDataSourcesEditOption optionWithDisabledDataSourceIdentifiers:forDevice:](NTKUpNextDisabledDataSourcesEditOption, "optionWithDisabledDataSourceIdentifiers:forDevice:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "selectOption:forCustomEditMode:slot:", v5, 16, 0);
  }

}

- (BOOL)hasMigratedDataSources
{
  void *v2;
  char v3;

  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("SiriDefaultsWatchHasMigratedDisabledDataSources")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SiriDefaultsPhoneHasMigratedDisabledDataSources"));

  return v3;
}

- (NSSet)disabledDataSources
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NTKFaceCollection *faceCollection;
  _QWORD v11[5];
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("SiriDefaultsWatchHasMigratedDisabledDataSources")) & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("SiriDefaultsDisabledDataSources"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v14[5];
      v14[5] = v5;

    }
    v7 = (void *)objc_msgSend((id)v14[5], "copy");

  }
  else
  {
    _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Watch has not migrated defaults. Fetching sum set from all up next faces", buf, 2u);
    }

    faceCollection = self->_faceCollection;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__NTKSiriDefaults_disabledDataSources__block_invoke;
    v11[3] = &unk_1E6BD0700;
    v11[4] = &v13;
    -[NTKFaceCollection enumerateFacesUsingBlock:](faceCollection, "enumerateFacesUsingBlock:", v11);
    v7 = (void *)objc_msgSend((id)v14[5], "copy");
  }

  _Block_object_dispose(&v13, 8);
  return (NSSet *)v7;
}

void __38__NTKSiriDefaults_disabledDataSources__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "selectedOptionForCustomEditMode:slot:", 16, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v3, "disabledBundleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

  }
}

- (void)faceCollectionDidLoad:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[Migration] Face collection %@ has loaded. Attempt migration", buf, 0xCu);
  }

  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__NTKSiriDefaults_faceCollectionDidLoad___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(v6, block);

}

uint64_t __41__NTKSiriDefaults_faceCollectionDidLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateIfNecessary");
}

- (void)_activeDeviceDidChange:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "[Migration] Active device did change. Attempt migration", buf, 2u);
  }

  -[NTKSiriDefaults _fetchNewFaceCollection](self, "_fetchNewFaceCollection");
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NTKSiriDefaults__activeDeviceDidChange___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __42__NTKSiriDefaults__activeDeviceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "migrateIfNecessary");
}

- (id)_domainAccesor
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.NanoTimeKit"));
}

- (void)_synchronizeDefaultsForKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NTKSiriDefaults _domainAccesor](self, "_domainAccesor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "synchronize");

  v8 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "synchronizeNanoDomain:keys:cloudEnabled:", CFSTR("com.apple.NanoTimeKit"), v7, 1);
}

- (void)_disabledDataSourcesDidChange
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Disabled data sources did change. Posting notification", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.NanoTimeKit.NPS.NTKSiriDefaultsDisabledDataSourcesDidChangeNotification"), self, 0, 1u);
}

- (void)_thirdPartyDataSourcesDidChange
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Siri defaults did change. Posting notification", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.NanoTimeKit.NPS.NTKSiriDefaultsThirdPartyDataSourcesDidChangeNotification"), self, 0, 1u);
}

- (void)_fetchNewFaceCollection
{
  NTKFaceCollection *faceCollection;
  NTKFaceCollection *v4;
  NTKPersistentFaceCollection *v5;
  void *v6;
  void *v7;
  NTKFaceCollection *v8;
  NTKFaceCollection *v9;

  faceCollection = self->_faceCollection;
  if (faceCollection)
  {
    -[NTKFaceCollection removeObserver:](faceCollection, "removeObserver:", self);
    v4 = self->_faceCollection;
    self->_faceCollection = 0;

  }
  v5 = [NTKPersistentFaceCollection alloc];
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nrDeviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKPersistentFaceCollection initWithCollectionIdentifier:deviceUUID:](v5, "initWithCollectionIdentifier:deviceUUID:", CFSTR("LibraryFaces"), v7);
  v9 = self->_faceCollection;
  self->_faceCollection = v8;

  -[NTKFaceCollection addObserver:](self->_faceCollection, "addObserver:", self);
}

- (BOOL)hasMigratedDisabledDataSources
{
  return self->_hasMigratedDisabledDataSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCollection, 0);
}

@end
