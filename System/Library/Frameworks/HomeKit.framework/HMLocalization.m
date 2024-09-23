@implementation HMLocalization

void __31__HMLocalization_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedObj;
  sharedManager_sharedObj = (uint64_t)v1;

}

- (HMLocalization)init
{
  HMLocalization *v2;
  uint64_t v3;
  NSBundle *bundle;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMLocalization;
  v2 = -[HMLocalization init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HomeKit"));
    v3 = objc_claimAutoreleasedReturnValue();
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v3;

    -[HMLocalization _updateLocalizedStrings](v2, "_updateLocalizedStrings");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_handleLocaleDidChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

- (void)_updateLocalizedStrings
{
  HMLocalization *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id Property;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *stringTable;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v2 = self;
  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB34D0];
  if (self)
    self = (HMLocalization *)objc_getProperty(self, a2, 24, 1);
  -[HMLocalization localizations](self, "localizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizationsFromArray:forPreferences:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E3B30958);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v33;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v11);
        if (v2)
          Property = objc_getProperty(v2, v8, 24, 1);
        else
          Property = 0;
        objc_msgSend(Property, "pathsForResourcesOfType:inDirectory:forLocalization:", CFSTR("strings"), 0, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v2)
          v16 = objc_getProperty(v2, v14, 24, 1);
        else
          v16 = 0;
        objc_msgSend(v16, "pathsForResourcesOfType:inDirectory:forLocalization:", CFSTR("loctable"), 0, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count") || objc_msgSend(v17, "count"))
        {
          objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v29 != v21)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "lastPathComponent");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "stringByDeletingPathExtension");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend(v7, "containsObject:", v24) & 1) == 0)
                  objc_msgSend(v7, "addObject:", v24);

              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v20);
          }

          goto LABEL_30;
        }

        ++v11;
      }
      while (v9 != v11);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      v9 = v18;
      if (v18)
        continue;
      break;
    }
  }
LABEL_30:

  os_unfair_lock_lock_with_options();
  v25 = objc_msgSend(v7, "copy");
  stringTable = v2->_stringTable;
  v2->_stringTable = (NSArray *)v25;

  os_unfair_lock_unlock(&v2->_lock);
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HMLocalization_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_53212 != -1)
    dispatch_once(&sharedManager_onceToken_53212, block);
  return (id)sharedManager_sharedObj;
}

- (id)getLocalizedOrCustomString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[HMLocalization getLocalizedString:](self, "getLocalizedString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "isEqualToString:", v4))
  {
    -[HMLocalization getLocalizedString:](self, "getLocalizedString:", CFSTR("CUSTOM"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (id)getLocalizedString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[HMLocalization stringTable](self, "stringTable", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[NSBundle localizedStringForKey:value:table:](self->_bundle, "localizedStringForKey:value:table:", v4, &stru_1E3AB7688, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v4, "isEqualToString:", v10))
          {

            goto LABEL_13;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }

    v10 = v4;
  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (NSArray)stringTable
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_stringTable;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)handleLocaleDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMLocalization_handleLocaleDidChange___block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_stringTable, 0);
}

uint64_t __40__HMLocalization_handleLocaleDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocalizedStrings");
}

@end
