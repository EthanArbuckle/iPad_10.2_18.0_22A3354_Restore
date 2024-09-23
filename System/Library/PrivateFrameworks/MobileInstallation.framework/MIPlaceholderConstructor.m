@implementation MIPlaceholderConstructor

- (MIPlaceholderConstructor)initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 error:(id *)a5
{
  return (MIPlaceholderConstructor *)-[MIPlaceholderConstructor _initWithSource:byPreservingFullInfoPlist:forBundleType:error:](self, "_initWithSource:byPreservingFullInfoPlist:forBundleType:error:", a3, a4, 0, a5);
}

- (id)_initWithSource:(id)a3 byPreservingFullInfoPlist:(BOOL)a4 forBundleType:(unint64_t)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  MIPlaceholderConstructor *v11;
  MIPlaceholderConstructor *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  id v23;
  objc_super v24;

  v8 = a4;
  v10 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MIPlaceholderConstructor;
  v11 = -[MIPlaceholderConstructor init](&v24, sel_init);
  v12 = v11;
  if (!v11)
  {
    v15 = 0;
    if (!a6)
      goto LABEL_18;
    goto LABEL_16;
  }
  -[MIPlaceholderConstructor setBundleURL:](v11, "setBundleURL:", v10);
  objc_msgSend(v10, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPlaceholderConstructor setPlaceholderType:](v12, "setPlaceholderType:", a5);
  if (a5 > 4)
    v14 = 0;
  else
    v14 = *(&off_1E6163F18 + a5);
  if ((objc_msgSend(v14, "isEqualToString:", v13) & 1) != 0)
  {
    v16 = (void *)MEMORY[0x1B5E0ACCC](-[MIPlaceholderConstructor setPreserveFullInfoPlist:](v12, "setPreserveFullInfoPlist:", v8));
    v23 = 0;
    v17 = -[MIPlaceholderConstructor _introspectWithError:](v12, "_introspectWithError:", &v23);
    v15 = v23;
    if (!v17)
    {

      v12 = 0;
    }
    objc_autoreleasePoolPop(v16);
  }
  else
  {

    v18 = (void *)*MEMORY[0x1E0D3ACC0];
    if (a5 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown PlaceholderBundleType value %lu"), a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = *(&off_1E6163F40 + a5);
    }
    objc_msgSend(v10, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _initWithSource:byPreservingFullInfoPlist:forBundleType:error:]", 122, v18, 4, 0, 0, CFSTR("The provided placeholder type of %@ does not match the path extension for the bundle at %@"), v20, (uint64_t)v19);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }

  if (a6)
  {
LABEL_16:
    if (!v12)
      *a6 = objc_retainAutorelease(v15);
  }
LABEL_18:

  return v12;
}

- (NSString)bundleID
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[MIPlaceholderConstructor infoPlistContent](self, "infoPlistContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSString *)v5;
}

- (MIPlaceholderConstructor)firstNetworkExtension
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "entitlements", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        MICopyNetworkExtensionEntitlement(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v3 = v6;

          goto LABEL_11;
        }

      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (MIPlaceholderConstructor *)v3;
}

- (BOOL)isLaunchProhibited
{
  void *v2;
  void *v3;
  char v4;

  -[MIPlaceholderConstructor infoPlistContent](self, "infoPlistContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LSApplicationLaunchProhibited"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MIBooleanValue(v3, 0);

  return v4;
}

- (id)_entitlementsForPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CFDictionaryRef v12;
  void *v13;
  void *v15;
  CFDictionaryRef information;
  SecStaticCodeRef staticCode;

  v5 = a3;
  information = 0;
  staticCode = 0;
  if (SecStaticCodeCreateWithPath((CFURLRef)v5, 0, &staticCode))
  {
    v6 = (void *)*MEMORY[0x1E0D3ACC0];
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _entitlementsForPath:error:]", 180, v6, 13, 0, 0, CFSTR("Failed to construct SecStaticCode for %@ : %d"), v8, (uint64_t)v7);
LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 0;
LABEL_6:

    goto LABEL_7;
  }
  if (SecCodeCopySigningInformation(staticCode, 4u, &information))
  {
    v9 = (void *)*MEMORY[0x1E0D3ACC0];
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _entitlementsForPath:error:]", 186, v9, 13, 0, 0, CFSTR("SecCodeCopySigningInformation for %@ returned error %d"), v10, (uint64_t)v7);
    goto LABEL_5;
  }
  v12 = information;
  information = 0;
  -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6D10]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v7 = v15;
    v13 = (void *)objc_msgSend(v15, "copy");
    v11 = 0;
    goto LABEL_6;
  }
  v11 = 0;
  v13 = (void *)MEMORY[0x1E0C9AA70];
LABEL_7:
  if (information)
  {
    CFRelease(information);
    information = 0;
  }
  if (staticCode)
  {
    CFRelease(staticCode);
    staticCode = 0;
  }
  if (a4 && !v13)
    *a4 = objc_retainAutorelease(v11);

  return v13;
}

+ (id)_infoPlistKeysToLoad
{
  if (_infoPlistKeysToLoad_onceToken != -1)
    dispatch_once(&_infoPlistKeysToLoad_onceToken, &__block_literal_global_2);
  return (id)_infoPlistKeysToLoad_keysSet;
}

void __48__MIPlaceholderConstructor__infoPlistKeysToLoad__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE78], *MEMORY[0x1E0C9AE70], *MEMORY[0x1E0C9AAF0], *MEMORY[0x1E0C9AE90], *MEMORY[0x1E0C9AE88], *MEMORY[0x1E0C9AAC8], CFSTR("MinimumOSVersion"), CFSTR("LSApplicationLaunchProhibited"), CFSTR("NSExtension"), CFSTR("EXAppExtensionAttributes"), CFSTR("UIRequiredDeviceCapabilities"), CFSTR("SBAppTags"), CFSTR("LSCounterpartIdentifiers"), CFSTR("SBIconMasqueradeIdentifier"), CFSTR("WKCompanionAppBundleIdentifier"), CFSTR("WKWatchOnly"), CFSTR("WKRunsIndependentlyOfCompanionApp"),
    CFSTR("NSApplicationRequiresArcade"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_infoPlistKeysToLoad_keysSet;
  _infoPlistKeysToLoad_keysSet = v0;

}

- (BOOL)_loadInfoPlistContentWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIPlaceholderConstructor preserveFullInfoPlist](self, "preserveFullInfoPlist")
    || (objc_msgSend((id)objc_opt_class(), "_infoPlistKeysToLoad"), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    MILoadRawInfoPlist();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    v7 = (void *)v6;
    MILoadInfoPlistWithError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }

  if (v8)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = (void *)objc_msgSend(v8, "copy");
      -[MIPlaceholderConstructor setInfoPlistContent:](self, "setInfoPlistContent:", v10);

      v11 = 1;
      goto LABEL_13;
    }
    v15 = (void *)*MEMORY[0x1E0D3ACC0];
    objc_msgSend(v5, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _loadInfoPlistContentWithError:]", 272, v15, 4, 0, 0, CFSTR("Found no keys in Info.plist in bundle at %@"), v16, (uint64_t)v13);
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E0D3ACC0];
    objc_msgSend(v5, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _loadInfoPlistContentWithError:]", 267, v12, 4, v9, 0, CFSTR("Failed to load Info.plist from %@"), v14, (uint64_t)v13);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v9 = objc_retainAutorelease(v17);
    v11 = 0;
    *a3 = v9;
  }
  else
  {
    v11 = 0;
    v9 = v17;
  }
LABEL_13:

  return v11;
}

- (BOOL)_constructPlaceholdersForDirectory:(id)a3 itemsWithPathExtension:(id)a4 appendingToArray:(id)a5 bundleType:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  MIPlaceholderConstructor *v24;
  id v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __120__MIPlaceholderConstructor__constructPlaceholdersForDirectory_itemsWithPathExtension_appendingToArray_bundleType_error___block_invoke;
  v22[3] = &unk_1E6163ED0;
  v16 = v13;
  v23 = v16;
  v24 = self;
  v26 = &v28;
  v27 = a6;
  v17 = v14;
  v25 = v17;
  objc_msgSend(v15, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v12, 1, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)v29[5];
  if (v19)
  {
    v20 = v19;

    v18 = v20;
  }
  if (a7 && v18)
    *a7 = objc_retainAutorelease(v18);

  _Block_object_dispose(&v28, 8);
  return v18 == 0;
}

BOOL __120__MIPlaceholderConstructor__constructPlaceholdersForDirectory_itemsWithPathExtension_appendingToArray_bundleType_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _BOOL8 v15;
  id v17;

  v5 = a2;
  v6 = v5;
  if (a3 == 4
    && (objc_msgSend(v5, "pathExtension"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)),
        v7,
        v8))
  {
    v9 = objc_alloc((Class)objc_opt_class());
    v10 = objc_msgSend(*(id *)(a1 + 40), "preserveFullInfoPlist");
    v11 = *(_QWORD *)(a1 + 64);
    v17 = 0;
    v12 = (void *)objc_msgSend(v9, "_initWithSource:byPreservingFullInfoPlist:forBundleType:error:", v6, v10, v11, &v17);
    v13 = v17;
    v14 = v17;
    v15 = v12 != 0;
    if (v12)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
    else
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v13);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)_populateAppExtensionPlaceholderConstructorsWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  BOOL v19;
  void *v20;
  id *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(&unk_1E6169110, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v22 = a3;
    v9 = 0;
    v10 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(&unk_1E6169110);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "unsignedIntegerValue", v22);
        -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((unint64_t)(v12 - 1) > 3)
          v15 = 0;
        else
          v15 = (uint64_t)*(&off_1E6163F68 + v12 - 1);
        objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v15, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v5, "itemDoesNotExistOrIsNotDirectoryAtURL:", v16) & 1) == 0)
        {
          v23 = v9;
          v17 = -[MIPlaceholderConstructor _constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:](self, "_constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:", v16, CFSTR("appex"), v6, v12, &v23);
          v18 = v23;

          if (!v17)
          {

            if (v22)
            {
              v18 = objc_retainAutorelease(v18);
              v19 = 0;
              *v22 = v18;
            }
            else
            {
              v19 = 0;
            }
            goto LABEL_20;
          }
          v9 = v18;
        }

      }
      v8 = objc_msgSend(&unk_1E6169110, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
  v20 = (void *)objc_msgSend(v6, "copy");
  -[MIPlaceholderConstructor setAppExtensionPlaceholderConstructors:](self, "setAppExtensionPlaceholderConstructors:", v20);

  v19 = 1;
  v18 = v9;
LABEL_20:

  return v19;
}

- (BOOL)_populateEmbeddedWatchAppPlaceholderConstructorsWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  BOOL v12;
  void *v13;
  id v15;

  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIPlaceholderConstructor placeholderType](self, "placeholderType"))
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
LABEL_9:
    v12 = 1;
    goto LABEL_10;
  }
  v8 = (void *)objc_opt_new();
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("Watch"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "itemExistsAtURL:", v7))
  {
    v6 = 0;
    goto LABEL_8;
  }
  v15 = 0;
  v10 = -[MIPlaceholderConstructor _constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:](self, "_constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:", v7, CFSTR("app"), v8, 3, &v15);
  v11 = v15;
  v6 = v11;
  if (v10)
  {
LABEL_8:
    v13 = (void *)objc_msgSend(v8, "copy");
    -[MIPlaceholderConstructor setEmbeddedWatchAppPlaceholderConstructors:](self, "setEmbeddedWatchAppPlaceholderConstructors:", v13);

    goto LABEL_9;
  }
  if (a3)
  {
    v6 = objc_retainAutorelease(v11);
    v12 = 0;
    *a3 = v6;
  }
  else
  {
    v12 = 0;
  }
LABEL_10:

  return v12;
}

- (BOOL)_populateEmbeddedAppClipPlaceholderConstructorsWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  BOOL v12;
  void *v13;
  id v15;

  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIPlaceholderConstructor placeholderType](self, "placeholderType"))
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
LABEL_9:
    v12 = 1;
    goto LABEL_10;
  }
  v8 = (void *)objc_opt_new();
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppClips"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "itemExistsAtURL:", v7))
  {
    v6 = 0;
    goto LABEL_8;
  }
  v15 = 0;
  v10 = -[MIPlaceholderConstructor _constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:](self, "_constructPlaceholdersForDirectory:itemsWithPathExtension:appendingToArray:bundleType:error:", v7, CFSTR("app"), v8, 4, &v15);
  v11 = v15;
  v6 = v11;
  if (v10)
  {
LABEL_8:
    v13 = (void *)objc_msgSend(v8, "copy");
    -[MIPlaceholderConstructor setEmbeddedAppClipPlaceholderConstructors:](self, "setEmbeddedAppClipPlaceholderConstructors:", v13);

    goto LABEL_9;
  }
  if (a3)
  {
    v6 = objc_retainAutorelease(v11);
    v12 = 0;
    *a3 = v6;
  }
  else
  {
    v12 = 0;
  }
LABEL_10:

  return v12;
}

- (BOOL)_introspectWithError:(id *)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v18 = 0;
  v5 = -[MIPlaceholderConstructor _loadInfoPlistContentWithError:](self, "_loadInfoPlistContentWithError:", &v18);
  v6 = v18;
  if (v5)
  {
    -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    -[MIPlaceholderConstructor _entitlementsForPath:error:](self, "_entitlementsForPath:error:", v7, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (!v8)
      goto LABEL_9;
    -[MIPlaceholderConstructor setEntitlements:](self, "setEntitlements:", v8);
    v16 = v9;
    v10 = -[MIPlaceholderConstructor _populateAppExtensionPlaceholderConstructorsWithError:](self, "_populateAppExtensionPlaceholderConstructorsWithError:", &v16);
    v6 = v16;

    if (!v10)
    {
      v12 = 0;
      if (!a3)
        goto LABEL_14;
      goto LABEL_12;
    }
    v15 = v6;
    v11 = -[MIPlaceholderConstructor _populateEmbeddedWatchAppPlaceholderConstructorsWithError:](self, "_populateEmbeddedWatchAppPlaceholderConstructorsWithError:", &v15);
    v9 = v15;

    if (v11)
    {
      v14 = v9;
      v12 = -[MIPlaceholderConstructor _populateEmbeddedAppClipPlaceholderConstructorsWithError:](self, "_populateEmbeddedAppClipPlaceholderConstructorsWithError:", &v14);
      v6 = v14;

      if (!a3)
        goto LABEL_14;
    }
    else
    {
LABEL_9:
      v12 = 0;
      v6 = v9;
      if (!a3)
        goto LABEL_14;
    }
  }
  else
  {
    v12 = 0;
    v8 = 0;
    if (!a3)
      goto LABEL_14;
  }
LABEL_12:
  if (!v12)
    *a3 = objc_retainAutorelease(v6);
LABEL_14:

  return v12;
}

- (void)setPerformPlaceholderInstallActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  self->_performPlaceholderInstallActions = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPerformPlaceholderInstallActions:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setInstallUUID:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_installUUID, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setInstallUUID:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)setInstallSessionUUID:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_installSessionUUID, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setInstallSessionUUID:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)_writeInfoPlistToPlaceholder:(id)a3 substitutingIconContent:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MIPlaceholderConstructor infoPlistContent](self, "infoPlistContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Executable"), *MEMORY[0x1E0C9AE70]);
  if (MEMORY[0x1E0D3A790])
  {
    v26 = a5;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    IFTopLevelAppBundlePlistKeys();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

    a5 = v26;
    if (v9)
      objc_msgSend(v12, "addEntriesFromDictionary:", v9);
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
  if (-[MIPlaceholderConstructor performPlaceholderInstallActions](self, "performPlaceholderInstallActions"))
  {
    MICopyCurrentBuildVersion();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("CF_MIEmergencyOffloadVersion"));

  }
  v27 = 0;
  v19 = objc_msgSend(v12, "MI_writeToURL:format:options:error:", v11, 200, 0x10000000, &v27);
  v20 = v27;
  if ((v19 & 1) == 0)
  {
    v21 = (void *)*MEMORY[0x1E0D3ACC0];
    objc_msgSend(v11, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _writeInfoPlistToPlaceholder:substitutingIconContent:withError:]", 560, v21, 4, v20, 0, CFSTR("Failed to write Info.plist file to %@"), v23, (uint64_t)v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v20 = objc_retainAutorelease(v24);
      *a5 = v20;
    }
    else
    {
      v20 = v24;
    }
  }

  return v19;
}

- (BOOL)_copyStringsToPlaceholder:(id)a3 onlyDirectories:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__MIPlaceholderConstructor__copyStringsToPlaceholder_onlyDirectories_error___block_invoke;
  v20[3] = &unk_1E6163EF8;
  v11 = v8;
  v21 = v11;
  v12 = v10;
  v22 = v12;
  v23 = &v25;
  v24 = a4;
  objc_msgSend(v12, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v9, 1, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (!v26[5])
  {
    if (!v13)
    {
      v16 = 1;
      goto LABEL_8;
    }
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]", 621, (void *)*MEMORY[0x1E0D3ACC0], 4, v13, 0, CFSTR("Encountered error while enumerating %@ to copy strings"), v14, (uint64_t)v9);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v26[5];
    v26[5] = v17;

    if (a5)
      goto LABEL_3;
LABEL_6:
    v16 = 0;
    goto LABEL_8;
  }
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v16 = 0;
  *a5 = objc_retainAutorelease((id)v26[5]);
LABEL_8:

  _Block_object_dispose(&v25, 8);
  return v16;
}

uint64_t __76__MIPlaceholderConstructor__copyStringsToPlaceholder_onlyDirectories_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = v5;
  if (a3 == 4)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("lproj"));

    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v6, "lastPathComponent");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *(void **)(a1 + 40);
      v28 = 0;
      LOBYTE(v10) = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v11, 0, 493, &v28);
      v14 = v28;
      if ((v10 & 1) != 0)
      {
        if (*(_BYTE *)(a1 + 56))
        {
          v15 = 1;
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("InfoPlist.strings"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 40), "itemDoesNotExistAtURL:", v18) & 1) == 0)
        {
          objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("InfoPlist.strings"), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(void **)(a1 + 40);
          v27 = v14;
          v15 = objc_msgSend(v22, "copyItemAtURL:toURL:error:", v18, v21, &v27);
          v19 = v27;

          if ((v15 & 1) == 0)
          {
            _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]_block_invoke", 609, (void *)*MEMORY[0x1E0D3ACC0], 4, v19, 0, CFSTR("Failed to copy InfoPlist.strings from \"%@\" to \"%@\"), v23, (uint64_t)v18);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v26 = *(void **)(v25 + 40);
            *(_QWORD *)(v25 + 40) = v24;

          }
          goto LABEL_9;
        }
        v15 = 1;
      }
      else
      {
        _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:]_block_invoke", 592, (void *)*MEMORY[0x1E0D3ACC0], 4, v14, 0, CFSTR("Failed to create destination lproj directory at \"%@\"), v13, (uint64_t)v11);
        v16 = objc_claimAutoreleasedReturnValue();
        v15 = 0;
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;
      }
      v19 = v14;
LABEL_9:

      v14 = v19;
      goto LABEL_10;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)_copyInfoPlistLoctableToPlaceholder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  id v15;

  v6 = a3;
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("InfoPlist.loctable"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("InfoPlist.loctable"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v8, v9, &v15);
  v12 = v15;
  v13 = v12;
  if (a4 && (v11 & 1) == 0)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

- (BOOL)_writeIconToPlaceholder:(id)a3 infoPlistIconContent:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!MEMORY[0x1E0D3A788])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v13 = 0;
    v11 = 0;
LABEL_12:
    if (!a4)
    {
LABEL_14:
      v14 = 1;
      goto LABEL_15;
    }
LABEL_13:
    v11 = objc_retainAutorelease(v11);
    *a4 = v11;
    goto LABEL_14;
  }
  v10 = IFCaptureIconContent();
  v11 = 0;
  v12 = 0;
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (!objc_msgSend(v11, "count") && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
    {
      objc_msgSend(v9, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

      if (!a4)
        goto LABEL_14;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (!v12)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v9, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v13 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    objc_msgSend(v9, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  if (a5)
  {
    v13 = objc_retainAutorelease(v13);
    v14 = 0;
    *a5 = v13;
  }
  else
  {
    v14 = 0;
  }
LABEL_15:

  return v14;
}

- (BOOL)_transferAndUpdateInstallSessionIDsToPlaceholder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPlaceholderConstructor installSessionUUID](self, "installSessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPlaceholderConstructor installUUID](self, "installUUID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    v11 = 0;
    if (v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[MIPlaceholderConstructor infoPlistContent](self, "infoPlistContent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE70]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v18 = (void *)*MEMORY[0x1E0D3ACC0];
    -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _transferAndUpdateInstallSessionIDsToPlaceholder:error:]", 720, v18, 4, 0, 0, CFSTR("Failed to get CFBundleExecutable key from Info.plist of %@"), v21, (uint64_t)v20);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    goto LABEL_15;
  }
  -[MIPlaceholderConstructor bundleURL](self, "bundleURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v15, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  objc_msgSend(v7, "dataForExtendedAttributeNamed:length:fromURL:error:", CFSTR("com.apple.install_session_uuid"), 16, v13, &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;
  v11 = v17;
  if (v8)
    goto LABEL_8;
  objc_msgSend(v17, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

    goto LABEL_15;
  }
  v23 = objc_msgSend(v11, "code");

  if (v23 != 93)
  {
LABEL_15:

    LOBYTE(v12) = 0;
    v8 = 0;
    goto LABEL_16;
  }
  _UUIDData();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
LABEL_8:
  -[MIPlaceholderConstructor setInstallSessionUUID:](self, "setInstallSessionUUID:", v8);

  if (!v10)
  {
LABEL_3:
    _UUIDData();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIPlaceholderConstructor setInstallUUID:](self, "setInstallUUID:", v10);
  }
LABEL_4:
  v26 = v11;
  v12 = objc_msgSend(v7, "setData:forExtendedAttributeNamed:onURL:error:", v8, CFSTR("com.apple.install_session_uuid"), v6, &v26);
  v13 = v26;

  if (v12)
  {
    v25 = v13;
    LOBYTE(v12) = objc_msgSend(v7, "setData:forExtendedAttributeNamed:onURL:error:", v10, CFSTR("com.apple.install_uuid"), v6, &v25);
    v11 = v25;
LABEL_16:

    v13 = v11;
  }
  if (a4 && (v12 & 1) == 0)
    *a4 = objc_retainAutorelease(v13);

  return v12;
}

- (BOOL)_materializeConstructors:(id)a3 intoBundle:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  id *v25;
  id v26;
  id obj;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  if (v7 && objc_msgSend(v7, "count"))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v9)
    {
      v10 = v9;
      v25 = a5;
      v11 = 0;
      v28 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "placeholderType");
          if ((unint64_t)(v14 - 1) >= 4)
          {
            _CreateAndLogError((uint64_t)"-[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:]", 785, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("Unknown placeholder type %lu"), v15, v14);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v17 = v11;
            goto LABEL_23;
          }
          v16 = (uint64_t)*(&off_1E6163F68 + v14 - 1);
          objc_msgSend(v30, "URLByAppendingPathComponent:isDirectory:", v16, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "containsObject:", v16) & 1) != 0)
          {
            v18 = v11;
          }
          else
          {
            v32 = v11;
            v19 = objc_msgSend(v29, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v17, 0, 493, &v32);
            v18 = v32;

            if (!v19)
              goto LABEL_23;
            objc_msgSend(v8, "addObject:", v16);
          }
          objc_msgSend(v13, "bundleURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v21, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = v18;
          LODWORD(v20) = objc_msgSend(v13, "materializeIntoBundleDirectory:error:", v22, &v31);
          v11 = v31;

          if (!(_DWORD)v20)
          {
            v18 = v11;
LABEL_23:

            v7 = v26;
            if (v25)
            {
              v18 = objc_retainAutorelease(v18);
              v23 = 0;
              *v25 = v18;
            }
            else
            {
              v23 = 0;
            }
            goto LABEL_18;
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
    }

    v23 = 1;
    v18 = v11;
    v7 = v26;
  }
  else
  {
    v18 = 0;
    v23 = 1;
  }
LABEL_18:

  return v23;
}

- (BOOL)materializeIntoBundleDirectory:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  _BOOL8 v14;
  id v15;
  id v16;
  _BOOL4 v17;
  id v18;
  _BOOL4 v19;
  id v20;
  id v21;
  _BOOL4 v22;
  _BOOL4 v23;
  int v24;
  BOOL v25;
  char v26;
  id v27;
  void *v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:", v6, 0, 493, 4, &v50);
  v9 = v50;
  v10 = v9;
  if (!v8)
  {
    v16 = 0;
    v13 = v9;
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
  -[MIPlaceholderConstructor entitlements](self, "entitlements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v10;
  v12 = MIWritePlaceholderEntitlements(v6, v11, (uint64_t)&v49);
  v13 = v49;

  if (!v12)
  {
    v16 = 0;
    goto LABEL_14;
  }
  v48 = 0;
  v14 = -[MIPlaceholderConstructor _copyInfoPlistLoctableToPlaceholder:error:](self, "_copyInfoPlistLoctableToPlaceholder:error:", v6, &v48);
  v15 = v48;
  v16 = v15;
  if (v14)
    goto LABEL_4;
  objc_msgSend(v15, "domain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0CB2FE0]) & 1) == 0)
  {

LABEL_29:
    v16 = v16;

    v20 = 0;
    v13 = v16;
    goto LABEL_15;
  }
  v30 = objc_msgSend(v16, "code");

  if (v30 != 2)
    goto LABEL_29;
LABEL_4:
  v47 = v13;
  v17 = -[MIPlaceholderConstructor _copyStringsToPlaceholder:onlyDirectories:error:](self, "_copyStringsToPlaceholder:onlyDirectories:error:", v6, v14, &v47);
  v18 = v47;

  if (!v17)
  {
    v20 = 0;
    goto LABEL_27;
  }
  v45 = v18;
  v46 = 0;
  v19 = -[MIPlaceholderConstructor _writeIconToPlaceholder:infoPlistIconContent:error:](self, "_writeIconToPlaceholder:infoPlistIconContent:error:", v6, &v46, &v45);
  v20 = v46;
  v21 = v45;

  if (!v19)
  {
    v13 = v21;
    goto LABEL_15;
  }
  v44 = v21;
  v22 = -[MIPlaceholderConstructor _writeInfoPlistToPlaceholder:substitutingIconContent:withError:](self, "_writeInfoPlistToPlaceholder:substitutingIconContent:withError:", v6, v20, &v44);
  v13 = v44;

  if (!v22)
    goto LABEL_15;
  if (-[MIPlaceholderConstructor performPlaceholderInstallActions](self, "performPlaceholderInstallActions"))
  {
    v43 = v13;
    v23 = -[MIPlaceholderConstructor _transferAndUpdateInstallSessionIDsToPlaceholder:error:](self, "_transferAndUpdateInstallSessionIDsToPlaceholder:error:", v6, &v43);
    v18 = v43;

    if (v23)
    {
      v42 = v18;
      v24 = objc_msgSend(v7, "markBundleAsPlaceholder:withError:", v6, &v42);
      v13 = v42;

      if (!v24)
        goto LABEL_15;
      goto LABEL_10;
    }
LABEL_27:
    v13 = v18;
    goto LABEL_15;
  }
LABEL_10:
  if (-[MIPlaceholderConstructor basicIOSPlaceholderForWatchOSLessThanSix](self, "basicIOSPlaceholderForWatchOSLessThanSix"))
  {
LABEL_11:
    v25 = 1;
    goto LABEL_22;
  }
  -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v13;
  v32 = -[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:](self, "_materializeConstructors:intoBundle:error:", v31, v6, &v41);
  v18 = v41;

  if (!v32)
    goto LABEL_27;
  if (!-[MIPlaceholderConstructor includeWatchAppPlaceholders](self, "includeWatchAppPlaceholders"))
  {
    v13 = v18;
LABEL_36:
    if (!-[MIPlaceholderConstructor includeAppClipPlaceholders](self, "includeAppClipPlaceholders"))
      goto LABEL_11;
    -[MIPlaceholderConstructor embeddedAppClipPlaceholderConstructors](self, "embeddedAppClipPlaceholderConstructors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v13;
    v36 = -[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:](self, "_materializeConstructors:intoBundle:error:", v35, v6, &v39);
    v18 = v39;

    if (v36)
    {
      v25 = 1;
      v13 = v18;
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  -[MIPlaceholderConstructor embeddedWatchAppPlaceholderConstructors](self, "embeddedWatchAppPlaceholderConstructors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v18;
  v34 = -[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:](self, "_materializeConstructors:intoBundle:error:", v33, v6, &v40);
  v13 = v40;

  if (v34)
    goto LABEL_36;
LABEL_15:
  v38 = 0;
  v26 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v38);
  v27 = v38;
  if ((v26 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    objc_msgSend(v6, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  if (a4)
  {
    v13 = objc_retainAutorelease(v13);
    v25 = 0;
    *a4 = v13;
  }
  else
  {
    v25 = 0;
  }
LABEL_22:

  return v25;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_bundleURL, a3);
}

- (BOOL)performPlaceholderInstallActions
{
  return self->_performPlaceholderInstallActions;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)includeWatchAppPlaceholders
{
  return self->_includeWatchAppPlaceholders;
}

- (void)setIncludeWatchAppPlaceholders:(BOOL)a3
{
  self->_includeWatchAppPlaceholders = a3;
}

- (BOOL)includeAppClipPlaceholders
{
  return self->_includeAppClipPlaceholders;
}

- (void)setIncludeAppClipPlaceholders:(BOOL)a3
{
  self->_includeAppClipPlaceholders = a3;
}

- (BOOL)basicIOSPlaceholderForWatchOSLessThanSix
{
  return self->_basicIOSPlaceholderForWatchOSLessThanSix;
}

- (void)setBasicIOSPlaceholderForWatchOSLessThanSix:(BOOL)a3
{
  self->_basicIOSPlaceholderForWatchOSLessThanSix = a3;
}

- (NSArray)appExtensionPlaceholderConstructors
{
  return self->_appExtensionPlaceholderConstructors;
}

- (void)setAppExtensionPlaceholderConstructors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)embeddedWatchAppPlaceholderConstructors
{
  return self->_embeddedWatchAppPlaceholderConstructors;
}

- (void)setEmbeddedWatchAppPlaceholderConstructors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)embeddedAppClipPlaceholderConstructors
{
  return self->_embeddedAppClipPlaceholderConstructors;
}

- (void)setEmbeddedAppClipPlaceholderConstructors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)placeholderType
{
  return self->_placeholderType;
}

- (void)setPlaceholderType:(unint64_t)a3
{
  self->_placeholderType = a3;
}

- (NSDictionary)infoPlistContent
{
  return self->_infoPlistContent;
}

- (void)setInfoPlistContent:(id)a3
{
  objc_storeStrong((id *)&self->_infoPlistContent, a3);
}

- (NSData)installUUID
{
  return self->_installUUID;
}

- (NSData)installSessionUUID
{
  return self->_installSessionUUID;
}

- (BOOL)preserveFullInfoPlist
{
  return self->_preserveFullInfoPlist;
}

- (void)setPreserveFullInfoPlist:(BOOL)a3
{
  self->_preserveFullInfoPlist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installSessionUUID, 0);
  objc_storeStrong((id *)&self->_installUUID, 0);
  objc_storeStrong((id *)&self->_infoPlistContent, 0);
  objc_storeStrong((id *)&self->_embeddedAppClipPlaceholderConstructors, 0);
  objc_storeStrong((id *)&self->_embeddedWatchAppPlaceholderConstructors, 0);
  objc_storeStrong((id *)&self->_appExtensionPlaceholderConstructors, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
