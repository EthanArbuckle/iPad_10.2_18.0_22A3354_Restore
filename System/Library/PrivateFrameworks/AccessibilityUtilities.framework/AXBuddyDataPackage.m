@implementation AXBuddyDataPackage

+ (NSDictionary)testData
{
  return (NSDictionary *)(id)Data;
}

+ (void)setTestData:(id)a3
{
  objc_storeStrong((id *)&Data, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXBuddyDataPackage)initWithCoder:(id)a3
{
  id v4;
  AXBuddyDataPackage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXBuddyDataPackage;
  v5 = -[AXBuddyDataPackage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("accessibilityOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBuddyDataPackage setAccessibilityOptions:](v5, "setAccessibilityOptions:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredContentSizeCategoryName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBuddyDataPackage setAxPreferredContentSizeCategoryName:](v5, "setAxPreferredContentSizeCategoryName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("axOSVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBuddyDataPackage setAxOSVersion:](v5, "setAxOSVersion:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("axModel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXBuddyDataPackage setAxModel:](v5, "setAxModel:", v9);

    -[AXBuddyDataPackage setUsesExtendedSlider:](v5, "setUsesExtendedSlider:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesExtendedSlider")));
    -[AXBuddyDataPackage setHasHomeButton:](v5, "setHasHomeButton:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AXSHasHomeButton")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AXBuddyDataPackage accessibilityOptions](self, "accessibilityOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("accessibilityOptions"));

  -[AXBuddyDataPackage axPreferredContentSizeCategoryName](self, "axPreferredContentSizeCategoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("preferredContentSizeCategoryName"));

  -[AXBuddyDataPackage axOSVersion](self, "axOSVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("axOSVersion"));

  -[AXBuddyDataPackage axModel](self, "axModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("axModel"));

  objc_msgSend(v8, "encodeBool:forKey:", -[AXBuddyDataPackage usesExtendedSlider](self, "usesExtendedSlider"), CFSTR("usesExtendedSlider"));
  objc_msgSend(v8, "encodeBool:forKey:", -[AXBuddyDataPackage hasHomeButton](self, "hasHomeButton"), CFSTR("AXSHasHomeButton"));

}

+ (id)dataPackageForCurrentSettings
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t i;
  const __CFString *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  CFDictionaryRef v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = objc_alloc_init((Class)a1);
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keysToIgnoreDuringBuddyTransfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = objc_alloc(MEMORY[0x1E0C99D20]);
  v5 = (void *)objc_msgSend(v4, "initWithObjects:", *MEMORY[0x1E0DDDF40], *MEMORY[0x1E0DDE2B8], *MEMORY[0x1E0DDE008], *MEMORY[0x1E0DDE0E8], *MEMORY[0x1E0DDE300], *MEMORY[0x1E0DDE2E8], *MEMORY[0x1E0DDE330], *MEMORY[0x1E0DDE1F0], *MEMORY[0x1E0DDE2A0], *MEMORY[0x1E0DDE298], *MEMORY[0x1E0DDE180], 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    v9 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v10 = (const __CFString *)*MEMORY[0x1E0C9B250];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v12 = *(const __CFString **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v13 = CFPreferencesCopyKeyList(v12, v9, v10);
        if (v13)
        {
          v14 = v13;
          v15 = CFPreferencesCopyMultiple(v13, v12, v9, v10);
          -[__CFDictionary removeObjectsForKeys:](v15, "removeObjectsForKeys:", v3);
          if (v15)
            objc_msgSend(v31, "setObject:forKey:", v15, v12);
          CFRelease(v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  objc_msgSend(v30, "setAccessibilityOptions:", v31);
  v16 = (void *)_AXSCopyPreferredContentSizeCategoryName();
  objc_msgSend(v30, "setAxPreferredContentSizeCategoryName:", v16);

  objc_msgSend(v30, "setUsesExtendedSlider:", _AXSLargeTextUsesExtendedRange() != 0);
  objc_msgSend((id)objc_opt_class(), "testData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    AXLogSettings();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "testData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v19;
      _os_log_impl(&dword_18C62B000, v18, OS_LOG_TYPE_INFO, "Using test data mode settings: %@", buf, 0xCu);

    }
    objc_msgSend((id)objc_opt_class(), "testData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("AXSOSVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAxOSVersion:", v21);

    objc_msgSend((id)objc_opt_class(), "testData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("AXSModel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAxModel:", v23);

    objc_msgSend((id)objc_opt_class(), "testData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", CFSTR("AXSUsesExtendedRange"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setUsesExtendedSlider:", objc_msgSend(v25, "BOOLValue"));

  }
  else
  {
    objc_msgSend(a1, "productVersionForBuddy");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAxOSVersion:", v26);

    objc_msgSend(a1, "deviceClassForBuddy");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAxModel:", v27);

    objc_msgSend(v30, "setHasHomeButton:", AXDeviceHasHomeButton());
  }

  return v30;
}

+ (void)setTestData:(id)a3 forModel:(id)a4 hasHomeButton:(BOOL)a5 largeTextUsesExtendedRange:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v6 = a6;
  v7 = a5;
  v20[4] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("AXSOSVersion");
  v19[1] = CFSTR("AXSModel");
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = CFSTR("AXSHasHomeButton");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v12;
  v19[3] = CFSTR("AXSOSVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "setTestData:", v14);
  AXLogSettings();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "testData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_INFO, "Setting test data mode settings: %@", (uint8_t *)&v17, 0xCu);

  }
}

- (void)applySavedSettings
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t i;
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const __CFDictionary *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  int v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  AXLogSettings();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_DEFAULT, "Applying saved settings", buf, 2u);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[AXBuddyDataPackage accessibilityOptions](self, "accessibilityOptions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v4)
  {
    v5 = v4;
    v24 = *(_QWORD *)v26;
    v6 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v7 = (const __CFString *)*MEMORY[0x1E0C9B250];
    v8 = (const __CFString *)*MEMORY[0x1E0C9B230];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v10 = *(const __CFString **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[AXBuddyDataPackage accessibilityOptions](self, "accessibilityOptions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[AXBuddyDataPackage processDomainDictionary:](self, "processDomainDictionary:", v12);
        AXLogSettings();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v10;
          _os_log_impl(&dword_18C62B000, v13, OS_LOG_TYPE_DEFAULT, "Applying saved settings domain: %@", buf, 0xCu);
        }

        AXLogSettings();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v12;
          _os_log_impl(&dword_18C62B000, v14, OS_LOG_TYPE_DEFAULT, "Applying saved settings: %@", buf, 0xCu);
        }

        -[AXBuddyDataPackage accessibilityOptions](self, "accessibilityOptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v10);
        v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CFPreferencesSetMultiple(v16, 0, v10, v6, v7);

        CFPreferencesSynchronize(v10, v6, v8);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v5);
  }

  -[AXBuddyDataPackage axPreferredContentSizeCategoryName](self, "axPreferredContentSizeCategoryName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[AXBuddyDataPackage axPreferredContentSizeCategoryName](self, "axPreferredContentSizeCategoryName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _AXSSetPreferredContentSizeCategoryName();

  }
  AXLogSettings();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = -[AXBuddyDataPackage usesExtendedSlider](self, "usesExtendedSlider");
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v20;
    _os_log_impl(&dword_18C62B000, v19, OS_LOG_TYPE_DEFAULT, "Uses extended slider: %d", buf, 8u);
  }

  -[AXBuddyDataPackage usesExtendedSlider](self, "usesExtendedSlider");
  _AXSSetLargeTextUsesExtendedRange();
  AXLogSettings();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = _AXSLargeTextUsesExtendedRange();
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v22;
    _os_log_impl(&dword_18C62B000, v21, OS_LOG_TYPE_DEFAULT, "Saved extended range: %d", buf, 8u);
  }

}

+ (id)productVersionForBuddy
{
  return (id)MGGetStringAnswer();
}

+ (id)deviceClassForBuddy
{
  return (id)MGGetStringAnswer();
}

- (void)processDomainDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  _QWORD *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AXBuddyDataPackage deviceClassForBuddy](AXBuddyDataPackage, "deviceClassForBuddy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXBuddyDataPackage productVersionForBuddy](AXBuddyDataPackage, "productVersionForBuddy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AXDeviceHasHomeButton());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "testData");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = _AXSInUnitTestMode();

    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "testData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("AXSOSVersion"));
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "testData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("AXSModel"));
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "testData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("AXSHasHomeButton"));
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v16;
      v6 = (void *)v12;
      v5 = (void *)v14;
    }
  }
  -[AXBuddyDataPackage axModel](self, "axModel");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[AXBuddyDataPackage axModel](self, "axModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "isEqualToString:", v19);

    if ((v20 & 1) == 0)
      objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0CF38D0]);
  }
  v21 = (_QWORD *)MEMORY[0x1E0DDE2C0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DDE2C0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!objc_msgSend(v22, "count")
     || objc_msgSend(v22, "count") == 1 && objc_msgSend(v22, "containsObject:", &unk_1E24F8168)))
  {
    AXLogSettings();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v22;
      _os_log_impl(&dword_18C62B000, v23, OS_LOG_TYPE_DEFAULT, "Removing TC options because its empty or only has buddy settings: %@", (uint8_t *)&v25, 0xCu);
    }

    objc_msgSend(v4, "removeObjectForKey:", *v21);
  }
  if ((objc_msgSend(v7, "BOOLValue") & 1) == 0 && -[AXBuddyDataPackage hasHomeButton](self, "hasHomeButton")
    || objc_msgSend(v7, "BOOLValue") && !-[AXBuddyDataPackage hasHomeButton](self, "hasHomeButton"))
  {
    AXLogSettings();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_18C62B000, v24, OS_LOG_TYPE_DEFAULT, "Removing Reduce motion preference from domain dict because home button changed", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0DDE218]);
  }
  objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0DDE318]);

}

+ (id)dataBlobForBuddy
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[AXBuddyDataPackage dataPackageForCurrentSettings](AXBuddyDataPackage, "dataPackageForCurrentSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  AXLogSettings();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[AXBuddyDataPackage dataBlobForBuddy].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

    v13 = 0;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v3, "length");
      *(_DWORD *)buf = 134217984;
      v18 = v14;
      _os_log_impl(&dword_18C62B000, v6, OS_LOG_TYPE_INFO, "Archived data blob for buddy with size %lu", buf, 0xCu);
    }

    v13 = v3;
  }

  return v13;
}

+ (void)restoreDataBlobForBuddy:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[8];
  id v16;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v16 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v16;
  AXLogSettings();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[AXBuddyDataPackage restoreDataBlobForBuddy:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_INFO, "Unarchived data blob for buddy", v15, 2u);
    }

    objc_msgSend(v5, "applySavedSettings");
  }

}

- (NSDictionary)accessibilityOptions
{
  return self->_accessibilityOptions;
}

- (void)setAccessibilityOptions:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityOptions, a3);
}

- (NSString)axOSVersion
{
  return self->_axOSVersion;
}

- (void)setAxOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_axOSVersion, a3);
}

- (NSString)axModel
{
  return self->_axModel;
}

- (void)setAxModel:(id)a3
{
  objc_storeStrong((id *)&self->_axModel, a3);
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

- (NSString)axPreferredContentSizeCategoryName
{
  return self->_axPreferredContentSizeCategoryName;
}

- (void)setAxPreferredContentSizeCategoryName:(id)a3
{
  objc_storeStrong((id *)&self->_axPreferredContentSizeCategoryName, a3);
}

- (BOOL)usesExtendedSlider
{
  return self->_usesExtendedSlider;
}

- (void)setUsesExtendedSlider:(BOOL)a3
{
  self->_usesExtendedSlider = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axPreferredContentSizeCategoryName, 0);
  objc_storeStrong((id *)&self->_axModel, 0);
  objc_storeStrong((id *)&self->_axOSVersion, 0);
  objc_storeStrong((id *)&self->_accessibilityOptions, 0);
}

+ (void)dataBlobForBuddy
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "Error archiving data blob for buddy: %@", a5, a6, a7, a8, 2u);
}

+ (void)restoreDataBlobForBuddy:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "Error unarchiving data blob from buddy: %@", a5, a6, a7, a8, 2u);
}

@end
