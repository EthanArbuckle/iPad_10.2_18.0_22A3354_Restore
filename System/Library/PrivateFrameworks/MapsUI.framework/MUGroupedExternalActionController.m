@implementation MUGroupedExternalActionController

- (MUGroupedExternalActionController)initWithGroupedExternalAction:(id)a3 amsResultProvider:(id)a4 supportsMultipleVendorSelection:(BOOL)a5 actionHandler:(id)a6 analyticsHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MUGroupedExternalActionController *v17;
  MUGroupedExternalActionController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MUGroupedExternalActionController;
  v17 = -[MUGroupedExternalActionController init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_externalAction, a3);
    objc_storeWeak((id *)&v18->_actionHandler, v15);
    objc_storeWeak((id *)&v18->_analyticsHandler, v16);
    objc_storeStrong((id *)&v18->_amsResultProvider, a4);
    v18->_supportsMultipleVendorSelection = a5;
  }

  return v18;
}

- (void)fetchProviderLockupsWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  MUAMSResultProviderFetchOptions *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  MUGroupedExternalActionController *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  MUVendorLinkViewModel *v45;
  void *v46;
  void *v47;
  MUVendorLinkViewModel *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  MUAMSResultProvider *amsResultProvider;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  MUPlaceExtensionDiscoveryManager *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  MUPlaceExtensionDiscoveryManager *extensionDiscoveryManager;
  MUPlaceExtensionDiscoveryManager *v65;
  MUPlaceExtensionDiscoveryManager *v66;
  id v67;
  NSObject *group;
  void (**v69)(id, void *, _QWORD);
  MUGroupedExternalActionController *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id obj;
  MUAMSResultProviderFetchOptions *v79;
  void *v80;
  id v81;
  _QWORD block[4];
  id v83;
  MUGroupedExternalActionController *v84;
  void (**v85)(id, void *, _QWORD);
  id v86;
  id location;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  NSObject *v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  NSObject *v97;
  _QWORD v98[4];
  id v99;
  id v100;
  id v101;
  id v102;
  NSObject *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  if (-[NSArray count](self->_viewModels, "count"))
  {
    -[MUGroupedExternalActionController _viewModelsWithSortApplied](self, "_viewModelsWithSortApplied");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5, 0);

  }
  else
  {
    v69 = v4;
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screenScale");
    v8 = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v74 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v73 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v77 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v81 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = -[MUAMSResultProviderFetchOptions initWithDisplayScale:artworkSize:source:]([MUAMSResultProviderFetchOptions alloc], "initWithDisplayScale:artworkSize:source:", -[MUGroupedExternalActionController source](self, "source"), v8, 40.0, 40.0);
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v70 = self;
    -[GEOPlaceExternalAction actionProviders](self->_externalAction, "actionProviders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    v71 = v9;
    v79 = v10;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v109;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v109 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
          objc_msgSend(v16, "supportedIntegrations");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v9, "addObject:", v18);
          objc_msgSend(v16, "appAdamId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          switch(objc_msgSend(v18, "type"))
          {
            case 1u:
              objc_msgSend(v18, "appClipRepresentedAsQuickLink");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "addObject:", v20);
              objc_msgSend(v20, "URLString");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "setObject:forKey:", v19, v21);

              v10 = v79;
              objc_msgSend(v16, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v74;
              v24 = v22;
              v25 = v19;
              goto LABEL_16;
            case 2u:
              objc_msgSend(v16, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v73;
              goto LABEL_14;
            case 3u:
              objc_msgSend(v18, "siriExtensionParams");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "attributionAppForMapsExtension");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "appBundleIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "setObject:forKey:", v27, v29);

              v9 = v71;
              v10 = v79;

              objc_msgSend(v16, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v72;
LABEL_14:
              objc_msgSend(v26, "setObject:forKey:", v20, v19);
              goto LABEL_17;
            case 4u:
              objc_msgSend(v18, "webLinkParams");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v81;
              v24 = v20;
              v25 = v22;
LABEL_16:
              objc_msgSend(v23, "setObject:forKey:", v24, v25);

LABEL_17:
              break;
            default:
              break;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
      }
      while (v13);
    }

    v30 = v70;
    -[GEOPlaceExternalAction actionName](v70->_externalAction, "actionName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = dispatch_group_create();
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v81, "count"))
    {
      v80 = v31;
      group = v32;
      dispatch_group_enter(v32);
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      objc_msgSend(v81, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v105;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            v38 = v33;
            if (*(_QWORD *)v105 != v36)
              objc_enumerationMutation(obj);
            v39 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
            objc_msgSend(v81, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "icon");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D271D8], "defaultPhotoOptionsWithAllowSmaller:", 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "bestPhotoForFrameSize:displayScale:options:", v42, 40.0, 40.0, v8);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "url");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = [MUVendorLinkViewModel alloc];
            objc_msgSend(v40, "displayName");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "displayName");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[MUVendorLinkViewModel initWithPartnerId:linkType:artworkURL:providerName:appAdamId:appShortName:actionName:fallbackSymbolName:](v45, "initWithPartnerId:linkType:artworkURL:providerName:appAdamId:appShortName:actionName:fallbackSymbolName:", v39, 4, v44, v46, 0, v47, v80, CFSTR("safari"));

            v33 = v38;
            objc_msgSend(v38, "addObject:", v48);

          }
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
        }
        while (v35);
      }

      v32 = group;
      dispatch_group_leave(group);
      v30 = v70;
      v9 = v71;
      v10 = v79;
      v31 = v80;
    }
    v49 = objc_msgSend(v76, "count");
    v50 = MEMORY[0x1E0C809B0];
    if (v49)
    {
      dispatch_group_enter(v32);
      objc_msgSend(MEMORY[0x1E0CC1778], "sharedInstance");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(v76, "copy");
      v98[0] = v50;
      v98[1] = 3221225472;
      v98[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke;
      v98[3] = &unk_1E2E02AE0;
      v99 = v75;
      v100 = v74;
      v101 = v31;
      v102 = v33;
      v103 = v32;
      objc_msgSend(v51, "appClipsFromQuickLinks:completion:", v52, v98);

    }
    v53 = v73;
    v4 = v69;
    if (objc_msgSend(v73, "count"))
    {
      dispatch_group_enter(v32);
      amsResultProvider = v30->_amsResultProvider;
      objc_msgSend(v73, "allKeys");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_3;
      v93[3] = &unk_1E2E02B08;
      v94 = v73;
      v95 = v31;
      v96 = v33;
      v97 = v32;
      -[MUAMSResultProvider fetchResultsForAdamIds:options:callbackQueue:completion:](amsResultProvider, "fetchResultsForAdamIds:options:callbackQueue:completion:", v55, v10, MEMORY[0x1E0C80D38], v93);

    }
    v56 = objc_msgSend(v77, "count");
    v57 = MEMORY[0x1E0C809B0];
    v58 = (_QWORD *)&unk_191F04000;
    if (v56)
    {
      dispatch_group_enter(v32);
      v59 = [MUPlaceExtensionDiscoveryManager alloc];
      objc_msgSend(v77, "allValues");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "reverseObjectEnumerator");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "allObjects");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[MUPlaceExtensionDiscoveryManager initWithExtensionDataItems:amsResultProvider:](v59, "initWithExtensionDataItems:amsResultProvider:", v62, v70->_amsResultProvider);
      extensionDiscoveryManager = v70->_extensionDiscoveryManager;
      v70->_extensionDiscoveryManager = (MUPlaceExtensionDiscoveryManager *)v63;

      v53 = v73;
      v30 = v70;

      v57 = MEMORY[0x1E0C809B0];
      v65 = v70->_extensionDiscoveryManager;
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_4;
      v88[3] = &unk_1E2E02B08;
      v89 = v72;
      v90 = v31;
      v91 = v33;
      v92 = v32;
      v66 = v65;
      v58 = &unk_191F04000;
      -[MUPlaceExtensionDiscoveryManager performExtensionDiscoveryWithOptions:callbackQueue:completion:](v66, "performExtensionDiscoveryWithOptions:callbackQueue:completion:", v10, MEMORY[0x1E0C80D38], v88);

    }
    objc_initWeak(&location, v30);
    block[0] = v57;
    block[1] = v58[373];
    block[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_5;
    block[3] = &unk_1E2E02B30;
    objc_copyWeak(&v86, &location);
    v83 = v33;
    v84 = v30;
    v85 = v69;
    v67 = v33;
    dispatch_group_notify(v32, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v86);
    objc_destroyWeak(&location);

  }
}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_2;
  v5[3] = &unk_1E2E02AB8;
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[8];
  v4 = v3;
  +[MapsUIUtilities performOnMainIfNecessary:](MapsUIUtilities, "performOnMainIfNecessary:", v5);

}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MUVendorLinkViewModel *v10;
  void *v11;
  void *v12;
  void *v13;
  MUVendorLinkViewModel *v14;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v2)
  {
    v3 = v2;
    v16 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "appClipURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "absoluteString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = [MUVendorLinkViewModel alloc];
        objc_msgSend(v5, "artworkURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "provider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appShortName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[MUVendorLinkViewModel initWithPartnerId:linkType:artworkURL:providerName:appAdamId:appShortName:actionName:fallbackSymbolName:](v10, "initWithPartnerId:linkType:artworkURL:providerName:appAdamId:appShortName:actionName:fallbackSymbolName:", v9, 1, v11, v12, v8, v13, *(_QWORD *)(a1 + 56), 0);

        objc_msgSend(*(id *)(a1 + 64), "addObject:", v14);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  MUVendorLinkViewModel *v10;
  void *v11;
  void *v12;
  void *v13;
  MUVendorLinkViewModel *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = [MUVendorLinkViewModel alloc];
        objc_msgSend(v7, "artworkURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "artistName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shortName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[MUVendorLinkViewModel initWithPartnerId:linkType:artworkURL:providerName:appAdamId:appShortName:actionName:fallbackSymbolName:](v10, "initWithPartnerId:linkType:artworkURL:providerName:appAdamId:appShortName:actionName:fallbackSymbolName:", v9, 2, v11, v12, v8, v13, *(_QWORD *)(a1 + 40), 0);

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MUVendorLinkViewModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MUVendorLinkViewModel *v13;
  id obj;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a2;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v3, "appStoreApp");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = [MUVendorLinkViewModel alloc];
        objc_msgSend(v3, "appStoreApp");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "artworkURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appStoreApp");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "artistName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appStoreApp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "shortName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[MUVendorLinkViewModel initWithPartnerId:linkType:artworkURL:providerName:appAdamId:appShortName:actionName:fallbackSymbolName:](v7, "initWithPartnerId:linkType:artworkURL:providerName:appAdamId:appShortName:actionName:fallbackSymbolName:", v6, 3, v8, v10, v5, v12, *(_QWORD *)(a1 + 40), 0);

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v17);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = v2;

    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_viewModelsWithSortApplied");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

  }
}

- (void)openPartnerActionUsingViewModel:(id)a3
{
  id v4;
  void *v5;
  GEOPlaceExternalAction *externalAction;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    externalAction = self->_externalAction;
    objc_msgSend(v4, "partnerId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceExternalAction partnerActionForPartnerId:](externalAction, "partnerActionForPartnerId:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[MUGroupedExternalActionController _executeBestIntegrationForProvider:index:](self, "_executeBestIntegrationForProvider:index:", v8, 0);
    }
    else
    {
      MUGetMUGroupedExternalActionControllerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appAdamId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_191DB8000, v9, OS_LOG_TYPE_ERROR, "Unable to find a matching provider for a view model with identifier %@ and adam id %@.  Early return", (uint8_t *)&v12, 0x16u);

      }
      v8 = 0;
    }
  }
  else
  {
    MUGetMUGroupedExternalActionControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_ERROR, "Attempting to open a nil view model.  Early return", (uint8_t *)&v12, 2u);
    }
  }

}

- (void)openFirstPartnerAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  uint8_t buf[2];
  __int16 v15;

  -[GEOPlaceExternalAction actionProviders](self->_externalAction, "actionProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[GEOPlaceExternalAction actionProviders](self->_externalAction, "actionProviders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 == 1)
    {
      -[GEOPlaceExternalAction actionProviders](self->_externalAction, "actionProviders");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUGroupedExternalActionController _executeBestIntegrationForProvider:index:](self, "_executeBestIntegrationForProvider:index:", v7, 0);
LABEL_8:

      return;
    }
    if (-[NSArray count](self->_viewModels, "count"))
    {
      -[MUGroupedExternalActionController _viewModelsWithSortApplied](self, "_viewModelsWithSortApplied");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUGroupedExternalActionController openPartnerActionUsingViewModel:](self, "openPartnerActionUsingViewModel:", v7);
      goto LABEL_8;
    }
    MUGetMUGroupedExternalActionControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v9 = "No refined view models.  Early return";
      v10 = buf;
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }
  }
  else
  {
    MUGetMUGroupedExternalActionControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v15 = 0;
      v9 = "No action providers.  Early return";
      v10 = (uint8_t *)&v15;
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_191DB8000, v11, v12, v9, v10, 2u);
    }
  }

}

- (void)_executeBestIntegrationForProvider:(id)a3 index:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  int v14;
  int v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  MUExternalActionHandlingOptions *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id WeakRetained;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  unsigned int v48;
  _QWORD v49[4];
  id v50;
  id v51;
  MUExternalActionHandlingOptions *v52;
  id v53;
  id v54[2];
  unsigned int v55;
  int v56;
  id location[2];
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "supportedIntegrations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
    goto LABEL_24;
  objc_msgSend(v6, "supportedIntegrations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "type");
  v12 = -[MUGroupedExternalActionController hasMultipleVendorsForAnalytics](self, "hasMultipleVendorsForAnalytics");
  if ((v11 - 1) < 2)
    goto LABEL_5;
  if (v11 == 3)
  {
    v13 = !v12;
    v14 = 6036;
    v15 = 318;
    goto LABEL_7;
  }
  if (v11 == 4)
  {
LABEL_5:
    v13 = !v12;
    v14 = 6074;
    v15 = 283;
LABEL_7:
    if (!v13)
      v14 = v15;
    v48 = v14;
    goto LABEL_10;
  }
  v48 = 0;
LABEL_10:
  v16 = -[MUGroupedExternalActionController resolvedAnalyticsTarget](self, "resolvedAnalyticsTarget");
  v17 = objc_alloc_init(MEMORY[0x1E0D27458]);
  -[GEOPlaceExternalAction categoryId](self->_externalAction, "categoryId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMetadata:", v18);

  objc_msgSend(v6, "appAdamId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setVendor:", v19);

  v20 = objc_msgSend(v10, "type") - 1;
  if (v20 > 3)
    v21 = 0;
  else
    v21 = dword_191F06570[v20];
  objc_msgSend(v17, "setLinkType:", v21);
  objc_msgSend(v17, "setIsGroup:", -[MUGroupedExternalActionController hasMultipleVendorsForAnalytics](self, "hasMultipleVendorsForAnalytics"));
  v58[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MUExternalActionHandlingOptions);
  -[MUExternalActionHandlingOptions setAnalyticsTarget:](v23, "setAnalyticsTarget:", -[MUGroupedExternalActionController resolvedAnalyticsTarget](self, "resolvedAnalyticsTarget"));
  switch(objc_msgSend(v10, "type"))
  {
    case 1u:
      objc_msgSend(v10, "appClipRepresentedAsQuickLink");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "URLString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUExternalActionHandlingOptions setAnalyticsEventValue:](v23, "setAnalyticsEventValue:", v25);

      objc_initWeak(location, self);
      objc_msgSend(MEMORY[0x1E0CC1778], "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appClipRepresentedAsQuickLink");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __78__MUGroupedExternalActionController__executeBestIntegrationForProvider_index___block_invoke;
      v49[3] = &unk_1E2E02B58;
      objc_copyWeak(v54, location);
      v50 = v10;
      v51 = v6;
      v54[1] = (id)a4;
      v55 = v48;
      v56 = v16;
      v52 = v23;
      v53 = v22;
      objc_msgSend(v26, "appClipWithQuickLink:completion:", v27, v49);

      objc_destroyWeak(v54);
      objc_destroyWeak(location);
      break;
    case 2u:
      objc_msgSend(v10, "quickLink");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "URLString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUExternalActionHandlingOptions setAnalyticsEventValue:](v23, "setAnalyticsEventValue:", v29);

      MUGetMUGroupedExternalActionControllerLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "quickLink");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "URLString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v32;
        _os_log_impl(&dword_191DB8000, v30, OS_LOG_TYPE_INFO, "Opening quick link with url %@", (uint8_t *)location, 0xCu);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsHandler);
      -[MUExternalActionHandlingOptions analyticsEventValue](v23, "analyticsEventValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "instrumentExternalActionUsingAnalyticsAction:target:eventValue:sharedStateButtonList:", v48, v16, v34, v22);

      v35 = objc_loadWeakRetained((id *)&self->_actionHandler);
      objc_msgSend(v10, "quickLink");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleQuickLink:options:", v36, v23);

      break;
    case 3u:
      v37 = objc_loadWeakRetained((id *)&self->_analyticsHandler);
      objc_msgSend(v37, "instrumentExternalActionUsingAnalyticsAction:target:eventValue:sharedStateButtonList:", v48, v16, 0, v22);

      objc_msgSend(v10, "siriExtensionParams");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUGroupedExternalActionController _openMapsExtensionUsingExtensionParams:handlingOptions:](self, "_openMapsExtensionUsingExtensionParams:handlingOptions:", v38, v23);

      break;
    case 4u:
      objc_msgSend(v10, "webLinkParams");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "url");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "absoluteString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUExternalActionHandlingOptions setAnalyticsEventValue:](v23, "setAnalyticsEventValue:", v41);

      MUGetMUGroupedExternalActionControllerLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v40, "absoluteString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v43;
        _os_log_impl(&dword_191DB8000, v42, OS_LOG_TYPE_INFO, "Opening flexible action link with url %@", (uint8_t *)location, 0xCu);

      }
      v44 = objc_loadWeakRetained((id *)&self->_analyticsHandler);
      -[MUExternalActionHandlingOptions analyticsEventValue](v23, "analyticsEventValue");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "instrumentExternalActionUsingAnalyticsAction:target:eventValue:sharedStateButtonList:", v48, v16, v45, v22);

      objc_msgSend(v10, "webLinkParams");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUExternalActionHandlingOptions setForcePunchout:](v23, "setForcePunchout:", objc_msgSend(v46, "supportsEmbeddedWebBrowser") ^ 1);

      v47 = objc_loadWeakRetained((id *)&self->_actionHandler);
      objc_msgSend(v47, "handleWebLink:options:", v40, v23);

      break;
    default:
      break;
  }

LABEL_24:
}

void __78__MUGroupedExternalActionController__executeBestIntegrationForProvider_index___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    MUGetMUGroupedExternalActionControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "appClipRepresentedAsQuickLink");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "appClipRepresentedAsQuickLink");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_INFO, "Opening app clip with url %@ bundle identifier %@", (uint8_t *)&v20, 0x16u);

      }
      v11 = objc_loadWeakRetained(WeakRetained + 2);
      v12 = *(unsigned int *)(a1 + 80);
      v13 = *(unsigned int *)(a1 + 84);
      objc_msgSend(*(id *)(a1 + 48), "analyticsEventValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "instrumentExternalActionUsingAnalyticsAction:target:eventValue:sharedStateButtonList:", v12, v13, v14, *(_QWORD *)(a1 + 56));

      v15 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v15, "handleAppClip:options:", v3, *(_QWORD *)(a1 + 48));

    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "appClipRepresentedAsQuickLink");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "appClipRepresentedAsQuickLink");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v17;
        v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_ERROR, "Failed to open app clip with url %@ bundle identifier %@", (uint8_t *)&v20, 0x16u);

      }
      objc_msgSend(WeakRetained, "_executeBestIntegrationForProvider:index:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72) + 1);
    }
  }

}

- (id)_viewModelsWithSortApplied
{
  MUVendorLinkSorter *v3;
  void *v4;
  MUVendorLinkSorter *v5;
  MUVendorLinkSorter *vendorLinkSorter;
  MUVendorLinkSortParameters *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_viewModels)
  {
    if (!self->_vendorLinkSorter)
    {
      v3 = [MUVendorLinkSorter alloc];
      v4 = (void *)-[NSArray copy](self->_viewModels, "copy");
      v5 = -[MUVendorLinkSorter initWithViewModels:](v3, "initWithViewModels:", v4);
      vendorLinkSorter = self->_vendorLinkSorter;
      self->_vendorLinkSorter = v5;

    }
    v7 = objc_alloc_init(MUVendorLinkSortParameters);
    -[MUVendorLinkSortParameters setSortAlphabetically:](v7, "setSortAlphabetically:", 1);
    -[GEOPlaceExternalAction winningAdamId](self->_externalAction, "winningAdamId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUVendorLinkSortParameters setWinningAdamId:](v7, "setWinningAdamId:", v8);

    if (GEOConfigGetBOOL())
    {
      -[GEOPlaceExternalAction actionProviders](self->_externalAction, "actionProviders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      MUMap(v9, &__block_literal_global_19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MUVendorLinkSortParameters setPreferredOrdering:](v7, "setPreferredOrdering:", v10);
    }
    -[MUVendorLinkSorter sortedViewModelsForParameters:](self->_vendorLinkSorter, "sortedViewModelsForParameters:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

uint64_t __63__MUGroupedExternalActionController__viewModelsWithSortApplied__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_openMapsExtensionUsingExtensionParams:(id)a3 handlingOptions:(id)a4
{
  id v6;
  id v7;
  MUPlaceExtensionDiscoveryManager *extensionDiscoveryManager;
  MUPlaceExtensionDiscoveryManager *v9;
  void *v10;
  MUPlaceExtensionDiscoveryManager *v11;
  MUPlaceExtensionDiscoveryManager *v12;
  void *v13;
  MUAMSResultProviderFetchOptions *WeakRetained;
  void *v15;
  void *v16;
  MUAMSResultProviderFetchOptions *v17;
  void *v18;
  double v19;
  MUPlaceExtensionDiscoveryManager *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  extensionDiscoveryManager = self->_extensionDiscoveryManager;
  if (!extensionDiscoveryManager)
  {
    v9 = [MUPlaceExtensionDiscoveryManager alloc];
    v26[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MUPlaceExtensionDiscoveryManager initWithExtensionDataItems:amsResultProvider:](v9, "initWithExtensionDataItems:amsResultProvider:", v10, self->_amsResultProvider);
    v12 = self->_extensionDiscoveryManager;
    self->_extensionDiscoveryManager = v11;

    extensionDiscoveryManager = self->_extensionDiscoveryManager;
  }
  -[MUPlaceExtensionDiscoveryManager discoveryResultForDataItem:](extensionDiscoveryManager, "discoveryResultForDataItem:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    WeakRetained = (MUAMSResultProviderFetchOptions *)objc_loadWeakRetained((id *)&self->_actionHandler);
    objc_msgSend(v13, "extension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appStoreApp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUAMSResultProviderFetchOptions handleMapsExtension:usingAppStoreApp:options:](WeakRetained, "handleMapsExtension:usingAppStoreApp:options:", v15, v16, v7);

  }
  else
  {
    v17 = [MUAMSResultProviderFetchOptions alloc];
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screenScale");
    WeakRetained = -[MUAMSResultProviderFetchOptions initWithDisplayScale:artworkSize:source:](v17, "initWithDisplayScale:artworkSize:source:", -[MUGroupedExternalActionController source](self, "source"), v19, 40.0, 40.0);

    objc_initWeak(&location, self);
    v20 = self->_extensionDiscoveryManager;
    v21 = MEMORY[0x1E0C80D38];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __92__MUGroupedExternalActionController__openMapsExtensionUsingExtensionParams_handlingOptions___block_invoke;
    v22[3] = &unk_1E2E02BC0;
    objc_copyWeak(&v24, &location);
    v23 = v7;
    -[MUPlaceExtensionDiscoveryManager performExtensionDiscoveryWithOptions:callbackQueue:completion:](v20, "performExtensionDiscoveryWithOptions:callbackQueue:completion:", WeakRetained, MEMORY[0x1E0C80D38], v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

void __92__MUGroupedExternalActionController__openMapsExtensionUsingExtensionParams_handlingOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (!a3)
  {
    objc_msgSend(a2, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v9, "extension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appStoreApp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleMapsExtension:usingAppStoreApp:options:", v7, v8, *(_QWORD *)(a1 + 32));

    }
  }
}

- (BOOL)hasMultipleVendorsForAnalytics
{
  _BOOL4 v3;

  v3 = -[MUGroupedExternalActionController supportsMultipleVendorSelection](self, "supportsMultipleVendorSelection");
  if (v3)
    LOBYTE(v3) = -[NSArray count](self->_viewModels, "count") > 1;
  return v3;
}

- (int)resolvedAnalyticsTarget
{
  if (-[MUGroupedExternalActionController hasMultipleVendorsForAnalytics](self, "hasMultipleVendorsForAnalytics"))
    return -[MUGroupedExternalActionController multipleVendorAnalyticsTarget](self, "multipleVendorAnalyticsTarget");
  else
    return -[MUGroupedExternalActionController singleVendorAnalyticsTarget](self, "singleVendorAnalyticsTarget");
}

- (void)captureGroupedMenuRevealAnalyticsIfNeededWithIsQuickAction:(BOOL)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[GEOPlaceExternalAction actionProviders](self->_externalAction, "actionProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    MUExternalActionRevealedAnalyticsModuleButtonsForAction(self->_externalAction);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "setIsGroup:", 1);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    if (a3)
      v12 = 30;
    else
      v12 = -[MUGroupedExternalActionController resolvedAnalyticsTarget](self, "resolvedAnalyticsTarget");
    WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsHandler);
    objc_msgSend(WeakRetained, "instrumentExternalActionUsingAnalyticsAction:target:eventValue:sharedStateButtonList:", 6074, v12, 0, v7);

  }
}

- (GEOPlaceExternalAction)externalAction
{
  return self->_externalAction;
}

- (int)singleVendorAnalyticsTarget
{
  return self->_singleVendorAnalyticsTarget;
}

- (void)setSingleVendorAnalyticsTarget:(int)a3
{
  self->_singleVendorAnalyticsTarget = a3;
}

- (int)multipleVendorAnalyticsTarget
{
  return self->_multipleVendorAnalyticsTarget;
}

- (void)setMultipleVendorAnalyticsTarget:(int)a3
{
  self->_multipleVendorAnalyticsTarget = a3;
}

- (int64_t)analyticsModuleType
{
  return self->_analyticsModuleType;
}

- (void)setAnalyticsModuleType:(int64_t)a3
{
  self->_analyticsModuleType = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (BOOL)supportsMultipleVendorSelection
{
  return self->_supportsMultipleVendorSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAction, 0);
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_extensionDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_vendorLinkSorter, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_destroyWeak((id *)&self->_analyticsHandler);
  objc_destroyWeak((id *)&self->_actionHandler);
}

@end
