@implementation _MXExtensionProvider

+ (id)sharedProvider
{
  if (_MergedGlobals_150 != -1)
    dispatch_once(&_MergedGlobals_150, &__block_literal_global_56);
  return (id)qword_1ECE2DA58;
}

- (_MXExtensionProvider)init
{
  _MXExtensionProvider *v2;
  _MXExtensionServiceCenter *v3;
  _MXExtensionServiceCenter *serviceCenter;
  _MXExtensionDispatchCenter *v5;
  _MXExtensionDispatchCenter *dispatchCenter;
  _MXExtensionMatchingMerger *v7;
  _MXExtensionMatchingMerger *merger;
  _MXAssetStorage *v9;
  _MXAssetStorage *assetStorage;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MXExtensionProvider;
  v2 = -[_MXExtensionProvider init](&v13, sel_init);
  if (v2)
  {
    v3 = -[_MXExtensionServiceCenter initWithExtensionProvider:]([_MXExtensionServiceCenter alloc], "initWithExtensionProvider:", v2);
    serviceCenter = v2->_serviceCenter;
    v2->_serviceCenter = v3;

    v5 = -[_MXExtensionDispatchCenter initWithExtensionProvider:]([_MXExtensionDispatchCenter alloc], "initWithExtensionProvider:", v2);
    dispatchCenter = v2->_dispatchCenter;
    v2->_dispatchCenter = v5;

    v7 = objc_alloc_init(_MXExtensionMatchingMerger);
    merger = v2->_merger;
    v2->_merger = v7;

    v9 = objc_alloc_init(_MXAssetStorage);
    assetStorage = v2->_assetStorage;
    v2->_assetStorage = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__restartMatchingExtensionsForDefaultsChange, *MEMORY[0x1E0D26740], 0);

  }
  return v2;
}

- (void)dealloc
{
  _MXExtensionDispatchCenter *dispatchCenter;
  objc_super v4;

  dispatchCenter = self->_dispatchCenter;
  self->_dispatchCenter = 0;

  -[_MXExtensionProvider _endMatchingExtensionsIfNeeded](self, "_endMatchingExtensionsIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)_MXExtensionProvider;
  -[_MXExtensionProvider dealloc](&v4, sel_dealloc);
}

- (id)addExtensionsUpdateHandler:(id)a3
{
  void *v4;

  -[_MXExtensionDispatchCenter addExtensionsUpdateHandler:](self->_dispatchCenter, "addExtensionsUpdateHandler:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MXExtensionProvider _beginMatchingExtensionsIfNeeded](self, "_beginMatchingExtensionsIfNeeded");
  return v4;
}

- (id)_extensionsByFilteringBlacklistedExtensionsFromArray:(id)a3
{
  id v4;
  _MXExtensionProvider *v5;
  NSArray *blacklistedExtensions;
  void *v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *blacklistedContainingApplications;
  void *v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  id obj;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
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
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  blacklistedExtensions = v5->_blacklistedExtensions;
  if (!blacklistedExtensions)
  {
    GEOConfigGetDictionary();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MXBundleBlacklistEntry blacklistEntriesFromDefaultsValue:](_MXBundleBlacklistEntry, "blacklistEntriesFromDefaultsValue:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_blacklistedExtensions;
    v5->_blacklistedExtensions = (NSArray *)v8;

    blacklistedExtensions = v5->_blacklistedExtensions;
  }
  v38 = (void *)-[NSArray copy](blacklistedExtensions, "copy");
  blacklistedContainingApplications = v5->_blacklistedContainingApplications;
  if (!blacklistedContainingApplications)
  {
    GEOConfigGetDictionary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MXBundleBlacklistEntry blacklistEntriesFromDefaultsValue:](_MXBundleBlacklistEntry, "blacklistEntriesFromDefaultsValue:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v5->_blacklistedContainingApplications;
    v5->_blacklistedContainingApplications = (NSArray *)v12;

    blacklistedContainingApplications = v5->_blacklistedContainingApplications;
  }
  v36 = (void *)-[NSArray copy](blacklistedContainingApplications, "copy");
  objc_sync_exit(v5);

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v4;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v14)
  {
    v37 = *(_QWORD *)v48;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v15);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v17 = v38;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v44;
          while (2)
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v44 != v19)
                objc_enumerationMutation(v17);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v20), "isExtensionAllowed:", v16) & 1) == 0)
              {

                goto LABEL_30;
              }
              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            if (v18)
              continue;
            break;
          }
        }

        if (objc_msgSend(v36, "count"))
        {
          v21 = objc_alloc(MEMORY[0x1E0CA5848]);
          objc_msgSend(v16, "_plugIn");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "valueForKey:", CFSTR("uuid"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v21, "initWithUUID:error:", v23, 0);

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v25 = v36;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v40;
            while (2)
            {
              v28 = 0;
              do
              {
                if (*(_QWORD *)v40 != v27)
                  objc_enumerationMutation(v25);
                v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v28);
                objc_msgSend(v24, "containingBundleRecord");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v29) = objc_msgSend(v29, "isBundleRecordAllowed:", v30);

                if (!(_DWORD)v29)
                {

                  goto LABEL_30;
                }
                ++v28;
              }
              while (v26 != v28);
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
              if (v26)
                continue;
              break;
            }
          }

        }
        objc_msgSend(v34, "addObject:", v16);
LABEL_30:
        ++v15;
      }
      while (v15 != v14);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      v14 = v31;
    }
    while (v31);
  }

  v32 = (void *)objc_msgSend(v34, "copy");
  return v32;
}

- (void)_beginMatchingExtensionsIfNeeded
{
  void *v3;
  Class extensionMatchingClass;
  uint64_t v5;
  void *v6;
  id matchingContext;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  Class v14;
  void *v15;
  id intentNonUIMatchingContext;
  uint64_t v17;
  void *v18;
  Class v19;
  void *v20;
  id intentUIMatchingContext;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[2];
  uint64_t v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (!self->_matchingContext)
  {
    if (!self->_extensionMatchingClass)
      self->_extensionMatchingClass = (Class)objc_opt_class();
    v31 = *MEMORY[0x1E0CB2A28];
    v30[0] = CFSTR("com.apple.maps.ui-services");
    v30[1] = CFSTR("com.apple.maps.services");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    extensionMatchingClass = self->_extensionMatchingClass;
    v5 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke;
    v27[3] = &unk_1E20D8438;
    objc_copyWeak(&v28, &location);
    -[objc_class beginMatchingExtensionsWithAttributes:completion:](extensionMatchingClass, "beginMatchingExtensionsWithAttributes:completion:", v22, v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    matchingContext = self->_matchingContext;
    self->_matchingContext = v6;

    +[_MXExtensionManager restaurantQueueingIntentClassNames](_MXExtensionManager, "restaurantQueueingIntentClassNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MXExtensionManager restaurantReservationIntentClassNames](_MXExtensionManager, "restaurantReservationIntentClassNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v8);
    objc_msgSend(v10, "addObjectsFromArray:", v9);
    objc_msgSend(v10, "addObjectsFromArray:", &unk_1E2159FD0);
    v11 = (void *)objc_msgSend(v10, "copy");
    -[_MXExtensionProvider _intentClassFilter:](self, "_intentClassFilter:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[objc_class _intents_extensionMatchingAttributesForIntents:](self->_extensionMatchingClass, "_intents_extensionMatchingAttributesForIntents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_extensionMatchingClass;
    v25[0] = v5;
    v25[1] = 3221225472;
    v25[2] = __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke_2;
    v25[3] = &unk_1E20D8438;
    objc_copyWeak(&v26, &location);
    -[objc_class beginMatchingExtensionsWithAttributes:completion:](v14, "beginMatchingExtensionsWithAttributes:completion:", v13, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    intentNonUIMatchingContext = self->_intentNonUIMatchingContext;
    self->_intentNonUIMatchingContext = v15;

    v17 = v5;
    -[objc_class _intents_uiExtensionMatchingAttributesForIntents:](self->_extensionMatchingClass, "_intents_uiExtensionMatchingAttributesForIntents:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_extensionMatchingClass;
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke_3;
    v23[3] = &unk_1E20D8438;
    objc_copyWeak(&v24, &location);
    -[objc_class beginMatchingExtensionsWithAttributes:completion:](v19, "beginMatchingExtensionsWithAttributes:completion:", v18, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    intentUIMatchingContext = self->_intentUIMatchingContext;
    self->_intentUIMatchingContext = v20;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
}

- (id)_intentClassFilter:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43___MXExtensionProvider__intentClassFilter___block_invoke;
  v8[3] = &unk_1E20DB4B0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

- (void)_endMatchingExtensionsIfNeeded
{
  id matchingContext;
  id intentNonUIMatchingContext;
  id v5;
  id intentUIMatchingContext;
  id v7;
  id v8;

  matchingContext = self->_matchingContext;
  self->_matchingContext = 0;
  v8 = matchingContext;

  -[objc_class endMatchingExtensions:](self->_extensionMatchingClass, "endMatchingExtensions:", v8);
  intentNonUIMatchingContext = self->_intentNonUIMatchingContext;
  self->_intentNonUIMatchingContext = 0;
  v5 = intentNonUIMatchingContext;

  -[objc_class endMatchingExtensions:](self->_extensionMatchingClass, "endMatchingExtensions:", v5);
  intentUIMatchingContext = self->_intentUIMatchingContext;
  self->_intentUIMatchingContext = 0;
  v7 = intentUIMatchingContext;

  -[objc_class endMatchingExtensions:](self->_extensionMatchingClass, "endMatchingExtensions:", v7);
}

- (void)_restartMatchingExtensionsForDefaultsChange
{
  void *v3;
  void *v4;
  _MXExtensionProvider *v5;
  NSArray *blacklistedExtensions;
  NSArray *blacklistedContainingApplications;

  if (self->_matchingContext)
  {
    -[_MXExtensionProvider _endMatchingExtensionsIfNeeded](self, "_endMatchingExtensionsIfNeeded");
    -[_MXExtensionProvider serviceCenter](self, "serviceCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_clearExtensions");

    -[_MXExtensionProvider merger](self, "merger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearExtensions");

    v5 = self;
    objc_sync_enter(v5);
    blacklistedExtensions = v5->_blacklistedExtensions;
    v5->_blacklistedExtensions = 0;

    blacklistedContainingApplications = v5->_blacklistedContainingApplications;
    v5->_blacklistedContainingApplications = 0;

    objc_sync_exit(v5);
    -[_MXExtensionProvider _beginMatchingExtensionsIfNeeded](v5, "_beginMatchingExtensionsIfNeeded");
  }
}

- (void)removeExtensionUpdateHandler:(id)a3
{
  -[_MXExtensionDispatchCenter removeExtensionUpdateHandler:](self->_dispatchCenter, "removeExtensionUpdateHandler:", a3);
}

- (id)_currentExtensions
{
  return -[_MXExtensionServiceCenter allExtensions](self->_serviceCenter, "allExtensions");
}

- (id)_extensionWithIdentifier:(id)a3
{
  return -[_MXExtensionServiceCenter _extensionWithIdentifier:](self->_serviceCenter, "_extensionWithIdentifier:", a3);
}

- (id)siblingExtensionsWithContainingAppIdentifer:(id)a3
{
  return -[_MXExtensionServiceCenter _siblingExtensionsWithContainingAppIdentifer:](self->_serviceCenter, "_siblingExtensionsWithContainingAppIdentifer:", a3);
}

- (BOOL)_enableExtension:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  int v9;
  _MXExtensionDispatchCenter *dispatchCenter;
  void *v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "isEnabled");
  if (v6)
  {
    if ((objc_msgSend(v6, "isEnabled") & 1) == 0)
    {
      objc_msgSend(v6, "extension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "attemptOptIn:", a4);

      if (v9)
      {
        dispatchCenter = self->_dispatchCenter;
        -[_MXExtensionProvider _currentExtensions](self, "_currentExtensions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MXExtensionDispatchCenter dispatchExtensions:error:](dispatchCenter, "dispatchExtensions:error:", v11, 0);

        v7 = 1;
      }
    }
  }

  return v7;
}

- (BOOL)_disableExtension:(id)a3 error:(id *)a4
{
  id v6;
  _MXExtensionDispatchCenter *dispatchCenter;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  LODWORD(dispatchCenter) = objc_msgSend(v6, "isEnabled") ^ 1;
  if (v6)
  {
    if (objc_msgSend(v6, "isEnabled"))
    {
      objc_msgSend(v6, "extension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "attemptOptOut:", a4);

      if (v9)
      {
        dispatchCenter = self->_dispatchCenter;
        -[_MXExtensionProvider _currentExtensions](self, "_currentExtensions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MXExtensionDispatchCenter dispatchExtensions:error:](dispatchCenter, "dispatchExtensions:error:", v10, 0);

        LOBYTE(dispatchCenter) = 1;
      }
    }
  }

  return (char)dispatchCenter;
}

- (void)imageForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[_MXExtensionProvider assetStorage](self, "assetStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47___MXExtensionProvider_imageForKey_completion___block_invoke;
  v10[3] = &unk_1E20DB4D8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchAssetForKey:completion:", v7, v10);

}

- (void)loadImageForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[_MXExtensionProvider assetStorage](self, "assetStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50___MXExtensionProvider_loadImageForKey_withBlock___block_invoke;
    v9[3] = &unk_1E20D7F48;
    v9[4] = self;
    v11 = v7;
    v10 = v6;
    objc_msgSend(v8, "loadAssetForKey:withBlock:", v10, v9);

  }
}

- (void)imageForKey:(id)a3 extension:(id)a4 completion:(id)a5
{
  -[_MXExtensionProvider imageForKey:completion:](self, "imageForKey:completion:", a3, a5);
}

- (_MXExtensionMatchingMerger)merger
{
  return self->_merger;
}

- (void)setMerger:(id)a3
{
  objc_storeStrong((id *)&self->_merger, a3);
}

- (_MXExtensionDispatchCenter)dispatchCenter
{
  return self->_dispatchCenter;
}

- (void)setDispatchCenter:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchCenter, a3);
}

- (_MXExtensionServiceCenter)serviceCenter
{
  return self->_serviceCenter;
}

- (void)setServiceCenter:(id)a3
{
  objc_storeStrong((id *)&self->_serviceCenter, a3);
}

- (_MXAssetStorage)assetStorage
{
  return self->_assetStorage;
}

- (void)setAssetStorage:(id)a3
{
  objc_storeStrong((id *)&self->_assetStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetStorage, 0);
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_dispatchCenter, 0);
  objc_storeStrong((id *)&self->_merger, 0);
  objc_storeStrong((id *)&self->_blacklistedContainingApplications, 0);
  objc_storeStrong((id *)&self->_blacklistedExtensions, 0);
  objc_storeStrong(&self->_intentUIMatchingContext, 0);
  objc_storeStrong(&self->_intentNonUIMatchingContext, 0);
  objc_storeStrong(&self->_matchingContext, 0);
}

@end
