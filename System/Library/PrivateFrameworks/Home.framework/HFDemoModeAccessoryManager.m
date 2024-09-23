@implementation HFDemoModeAccessoryManager

+ (id)sharedManager
{
  if (qword_1ED378BC0 != -1)
    dispatch_once(&qword_1ED378BC0, &__block_literal_global);
  return (id)_MergedGlobals_207;
}

void __43__HFDemoModeAccessoryManager_sharedManager__block_invoke()
{
  HFDemoModeAccessoryManager *v0;
  void *v1;
  HFNullValueSource *v2;

  v2 = objc_alloc_init(HFNullValueSource);
  v0 = -[HFDemoModeAccessoryManager initWithNullValueSource:]([HFDemoModeAccessoryManager alloc], "initWithNullValueSource:", v2);
  v1 = (void *)_MergedGlobals_207;
  _MergedGlobals_207 = (uint64_t)v0;

}

- (HFDemoModeAccessoryManager)initWithNullValueSource:(id)a3
{
  id v5;
  HFDemoModeAccessoryManager *v6;
  HFDemoModeAccessoryManager *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFDemoModeAccessoryManager;
  v6 = -[HFDemoModeAccessoryManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_valueSource, a3);
    v8 = +[HFUtilities isAMac](HFUtilities, "isAMac");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = (_QWORD *)MEMORY[0x1E0CEB358];
    if (v8)
      v11 = (_QWORD *)MEMORY[0x1E0CEB360];
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel_saveAccessories, *v11, 0);

  }
  return v7;
}

+ (id)accessoryProfileName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryProfile-%@"), a3);
}

+ (BOOL)isValidExternalType:(id)a3
{
  return 1;
}

+ (BOOL)isInternalAccessoryType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("HomePod");
  v7[1] = CFSTR("HomePodMini");
  v7[2] = CFSTR("MediaSystem-HomePod");
  v7[3] = CFSTR("MediaSystem-HomePodMini");
  v7[4] = CFSTR("AppleTV");
  v7[5] = CFSTR("Generic");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4);

  return (char)v3;
}

+ (id)configurationProfileFromAccessoryType:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "accessoryProfileName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "isInternalAccessoryType:", v4);

  if ((v6 & 1) != 0 || (objc_msgSend(a1, "isValidExternalType:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", v5, CFSTR("plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "profileURLForDemoModeAccessoryName:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v7);

  return v9;
}

+ (id)accessoryWithContentsOfDictionary:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("Generic");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  objc_msgSend(a1, "configurationProfileFromAccessoryType:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValuesForKeysWithDictionary:", v7);

  +[HFDemoModeAccessory accessoryWithContentsOfDictionary:forHome:](HFDemoModeAccessory, "accessoryWithContentsOfDictionary:forHome:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)profileURLForDemoModeAccessoryName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[HFDemoModeAccessoryManager demoModeDirectoryURL](HFDemoModeAccessoryManager, "demoModeDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.plist"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessories
{
  NSArray *demoAccessories;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *v24;
  void *v25;
  HFDemoModeAccessoryManager *v26;
  void *v27;
  id obj;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  demoAccessories = self->_demoAccessories;
  if (demoAccessories)
    return demoAccessories;
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("HFDemoModeAccessories"), CFSTR("com.apple.Home"));
  if (v5)
  {
    v26 = self;
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFDemoModeAccessoryManager demoModeDirectoryURL](HFDemoModeAccessoryManager, "demoModeDirectoryURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v27 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v7)
    {
      v8 = v7;
      v30 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@.plist"), v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v15, v31);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v32, "fileExistsAtPath:", v17);

          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("fileName"));
          }
          +[HFDemoModeAccessoryManager accessoryWithContentsOfDictionary:forHome:](HFDemoModeAccessoryManager, "accessoryWithContentsOfDictionary:forHome:", v19, v33);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v29, "addObject:", v20);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v8);
    }

    v21 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v29, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayWithArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v26->_demoAccessories;
    v26->_demoAccessories = (NSArray *)v23;

    v25 = (void *)-[NSArray copy](v26->_demoAccessories, "copy");
    v5 = v27;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)saveAccessories
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[HFDemoModeAccessoryManager demoModeDirectoryURL](HFDemoModeAccessoryManager, "demoModeDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HFDemoModeAccessoryManager demoAccessories](self, "demoAccessories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "applicationData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("fileName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v10, v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "applicationData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "writeToURL:atomically:", v11, 1);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

+ (id)demoModeDirectoryURL
{
  return +[HFUtilities cachesDirectoryURL](HFUtilities, "cachesDirectoryURL");
}

+ (BOOL)isPressDemoModeEnabled
{
  return +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled");
}

+ (id)imageIconDescriptorFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HFImageIconDescriptor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  HFImageIconDescriptor *v16;
  HFImageIconDescriptor *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("icon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[HFDemoModeAccessoryManager isInternalAccessoryType:](HFDemoModeAccessoryManager, "isInternalAccessoryType:", v5))
  {
    v6 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E98];
    +[HFDemoModeAccessoryManager demoModeDirectoryURL](HFDemoModeAccessoryManager, "demoModeDirectoryURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:relativeToURL:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "fileExistsAtPath:", v14);

    v16 = [HFImageIconDescriptor alloc];
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v13, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[HFImageIconDescriptor initWithDemoModeImageIdentifier:](v17, "initWithDemoModeImageIdentifier:", v18);

    }
    else
    {
      v6 = -[HFImageIconDescriptor initWithImageIdentifier:](v16, "initWithImageIdentifier:", CFSTR("HFImageIconIdentifierGeneric"));
    }

  }
  return v6;
}

- (void)dispatchUpdateMessageForAccessory:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__HFDemoModeAccessoryManager_dispatchUpdateMessageForAccessory___block_invoke;
  v6[3] = &unk_1EA7263F0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "dispatchAccessoryObserverMessage:sender:", v6, 0);

}

void __64__HFDemoModeAccessoryManager_dispatchUpdateMessageForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateDemoModeStateForAccessory:", *(_QWORD *)(a1 + 32));

}

+ (id)demoSnapshotURLForCameraName:(id)a3
{
  return (id)objc_msgSend(a1, "demoURLWithCameraName:fileName:extension:", a3, CFSTR("snapshot"), CFSTR("png"));
}

+ (id)demoLiveStreamURLForCameraName:(id)a3
{
  return (id)objc_msgSend(a1, "demoURLWithCameraName:fileName:extension:", a3, CFSTR("live"), CFSTR("mov"));
}

+ (id)demoURLWithCameraName:(id)a3 fileName:(id)a4 extension:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.%@"), a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E98];
  +[HFUtilities demoModeDirectoryURL](HFUtilities, "demoModeDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:relativeToURL:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)clipsForCameraProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/clips"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E98];
  +[HFUtilities demoModeDirectoryURL](HFUtilities, "demoModeDirectoryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:relativeToURL:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v16, &v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v29;

  if (v18)
  {
    HFLogForCategory(0x20uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v14;
      _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "Failure getting contents of directory:%@", buf, 0xCu);
    }

    v20 = v5;
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __52__HFDemoModeAccessoryManager_clipsForCameraProfile___block_invoke;
    v24[3] = &unk_1EA726418;
    v25 = v14;
    v28 = a1;
    v26 = v4;
    v21 = v5;
    v27 = v21;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v24);
    objc_msgSend(v21, "sortUsingComparator:", &__block_literal_global_53);
    v22 = v21;

  }
  return v5;
}

void __52__HFDemoModeAccessoryManager_clipsForCameraProfile___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMTime time;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "duration");
  else
    memset(&time, 0, sizeof(time));
  objc_msgSend(*(id *)(a1 + 56), "_demoClipWithURL:duration:cameraProfile:", v5, *(_QWORD *)(a1 + 40), CMTimeGetSeconds(&time));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[HFCameraImageManager sharedManager](HFCameraImageManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generateDemoPosterFramesForAsset:forClip:", v7, v8);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  }

}

uint64_t __52__HFDemoModeAccessoryManager_clipsForCameraProfile___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateOfOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)_demoClipWithURL:(id)a3 duration:(double)a4 cameraProfile:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mov"), &stru_1EA741FF8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("_"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") > 3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_clipStartDateFromComponents:today:", v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && (objc_msgSend(v15, "timeIntervalSinceDate:", v13), v17 <= 0.0))
    {
      objc_msgSend(v12, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_eventsFromString:startDate:cameraProfile:", v19, v16, v9);
      v18 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA4A0]), "initWithClipURL:startDate:duration:significantEvents:", v8, v16, v18, a4);
      HFLogForCategory(0x20uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412546;
        v23 = v14;
        v24 = 2112;
        v25 = v8;
        _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "Creating demo clip:%@ from path:%@", (uint8_t *)&v22, 0x16u);
      }

    }
    else
    {
      HFLogForCategory(0x20uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412546;
        v23 = v16;
        v24 = 2112;
        v25 = v8;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Invalid start date:%@ for url:%@. Unable to create demo clip.", (uint8_t *)&v22, 0x16u);
      }
      v14 = 0;
    }

  }
  else
  {
    HFLogForCategory(0x20uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v8;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Invalid url:%@. Unable to create demo clip.", (uint8_t *)&v22, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)_clipStartDateFromComponents:(id)a3 today:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "hf_sharedCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 156, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDay:", objc_msgSend(v9, "day") - objc_msgSend(v10, "integerValue"));

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHour:", objc_msgSend(v11, "integerValue"));

  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setMinute:", objc_msgSend(v12, "integerValue"));
  objc_msgSend(v8, "dateFromComponents:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_eventsFromString:(id)a3 startDate:(id)a4 cameraProfile:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsString:", CFSTR("h")))
  {
    v11 = objc_alloc(MEMORY[0x1E0CBA3E8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:", v12, 2, v8, 100, v13, 0, 0.0, v14);

    objc_msgSend(v10, "addObject:", v15);
  }
  if (objc_msgSend(v7, "containsString:", CFSTR("a")))
  {
    v16 = objc_alloc(MEMORY[0x1E0CBA3E8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:", v17, 3, v8, 100, v18, 0, 0.0, v19);

    objc_msgSend(v10, "addObject:", v20);
  }
  if (objc_msgSend(v7, "containsString:", CFSTR("v")))
  {
    v21 = objc_alloc(MEMORY[0x1E0CBA3E8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v21, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:", v22, 4, v8, 100, v23, 0, 0.0, v24);

    objc_msgSend(v10, "addObject:", v25);
  }
  if (objc_msgSend(v7, "containsString:", CFSTR("p")))
  {
    v26 = objc_alloc(MEMORY[0x1E0CBA3E8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v26, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:", v27, 5, v8, 100, v28, 0, 0.0, v29);

    objc_msgSend(v10, "addObject:", v30);
  }

  return v10;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSArray)demoAccessories
{
  return self->_demoAccessories;
}

- (void)setDemoAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_demoAccessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoAccessories, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

@end
