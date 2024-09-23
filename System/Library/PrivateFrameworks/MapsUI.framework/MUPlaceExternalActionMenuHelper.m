@implementation MUPlaceExternalActionMenuHelper

- (MUGroupedExternalActionController)actionController
{
  return self->_resolver;
}

- (MUPlaceExternalActionMenuHelper)initWithExternalActionController:(id)a3 iconCache:(id)a4
{
  id v7;
  id v8;
  MUPlaceExternalActionMenuHelper *v9;
  MUPlaceExternalActionMenuHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPlaceExternalActionMenuHelper;
  v9 = -[MUPlaceExternalActionMenuHelper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_iconCache, a4);
    objc_storeStrong((id *)&v10->_resolver, a3);
  }

  return v10;
}

- (id)buildMenuElementsWithPresentationOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(id *, void *);
  void *v13;
  MUPlaceExternalActionMenuHelper *v14;
  id v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC36F8];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke;
  v13 = &unk_1E2E014C0;
  objc_copyWeak(&v16, &location);
  v14 = self;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "elementWithProvider:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v8;
}

void __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 3), "captureGroupedMenuRevealAnalyticsIfNeededWithIsQuickAction:", objc_msgSend(a1[4], "isQuickAction"));
    v6 = (void *)v5[3];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke_2;
    v7[3] = &unk_1E2E01498;
    v9 = v3;
    objc_copyWeak(&v10, a1 + 6);
    v8 = a1[5];
    objc_msgSend(v6, "fetchProviderLockupsWithCompletion:", v7);

    objc_destroyWeak(&v10);
  }

}

void __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *WeakRetained;
  id *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MUGetMUPlaceExternalActionMenuHelperLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch vendor link models with error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke_3;
      v14[3] = &unk_1E2E01470;
      v14[4] = WeakRetained;
      v15 = *(id *)(a1 + 32);
      v16 = v5;
      MUMap(v16, v14);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v9[5];
      v9[5] = (id)v10;

      v12 = *(_QWORD *)(a1 + 40);
      v13 = (void *)objc_msgSend(v9[5], "copy");
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    }
  }

}

id __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = a2;
  objc_msgSend(v2, "_buildMenuElementForViewModel:presentationOptions:isSingleProvider:", v5, v3, objc_msgSend(v4, "count") == 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildMenuElementForViewModel:(id)a3 presentationOptions:(id)a4 isSingleProvider:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  MUTimeExpirableLRUCache *iconCache;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location[2];

  v5 = a5;
  v8 = a3;
  v27 = a4;
  objc_msgSend(v8, "artworkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  iconCache = self->_iconCache;
  objc_msgSend(v8, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUTimeExpirableLRUCache objectForKeyedSubscript:](iconCache, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[MUPlaceExternalActionMenuHelper actionName](self, "actionName");
  else
    objc_msgSend(v8, "appShortName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "fallbackSymbolName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v8, "fallbackSymbolName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_systemImageNamed:variant:", v16, 0);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }
  }
  objc_initWeak(location, self);
  v18 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v8, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke;
  v33[3] = &unk_1E2E014E8;
  objc_copyWeak(&v35, location);
  v20 = v8;
  v34 = v20;
  objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v13, v12, v19, v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "linkTypeString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingString:", CFSTR("ExternalPartnerMenuAction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityIdentifier:", v23);

  if (!v12)
  {
    if (v5)
      objc_msgSend(v20, "uniqueIdentifier", objc_msgSend(v20, "linkType") == 1);
    else
      objc_msgSend(v20, "uniqueIdentifier", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke_2;
    v28[3] = &unk_1E2E01538;
    v29 = v9;
    v30 = v20;
    objc_copyWeak(&v32, location);
    v31 = v27;
    -[MUPlaceExternalActionMenuHelper _downloadImageWithURL:variant:uniqueIdentifier:completion:](self, "_downloadImageWithURL:variant:uniqueIdentifier:completion:", v29, v26, v24, v28);

    objc_destroyWeak(&v32);
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(location);

  return v21;
}

void __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "openPartnerActionUsingViewModel:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    MUGetMUPlaceExternalActionMenuHelperLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_191DB8000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to download artwork url %@ for model %@ with error %@", buf, 0x20u);

    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 48), "contextMenuInteraction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke_13;
      v12[3] = &unk_1E2E01510;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v9, "updateVisibleMenuWithBlock:", v12);

      objc_destroyWeak(&v14);
    }
  }

}

id __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  id *WeakRetained;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22 = a1;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v3;
    objc_msgSend(v3, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
            objc_msgSend(v10, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained[1], "objectForKeyedSubscript:", v11);
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = (void *)v12;
              objc_msgSend(*(id *)(v22 + 32), "uniqueIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v11, "isEqual:", v14);

              if (v15)
              {
                MUGetMUPlaceExternalActionMenuHelperLog();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(*(id *)(v22 + 32), "uniqueIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v29 = v17;
                  _os_log_impl(&dword_191DB8000, v16, OS_LOG_TYPE_INFO, "Updating image for view model %@", buf, 0xCu);

                }
                objc_msgSend(WeakRetained[1], "objectForKeyedSubscript:", v11);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setImage:", v18);

                goto LABEL_17;
              }
            }

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

    v3 = v21;
  }
  v19 = (void *)objc_msgSend(v3, "copy");

  return v19;
}

- (void)_downloadImageWithURL:(id)a3 variant:(unint64_t)a4 uniqueIdentifier:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  MUAppLockupImageMetrics *v16;
  MUAppLockupImage *v17;
  MUAppLockupImage *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  MUAppLockupImage *v22;
  id v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screenScale");
  v15 = v14;

  v16 = objc_alloc_init(MUAppLockupImageMetrics);
  -[MUAppLockupImageMetrics setFrameSize:](v16, "setFrameSize:", 40.0, 40.0);
  -[MUAppLockupImageMetrics setScale:](v16, "setScale:", v15);
  -[MUAppLockupImageMetrics setVariant:](v16, "setVariant:", a4);
  v17 = -[MUAppLockupImage initWithRemoteURL:metrics:]([MUAppLockupImage alloc], "initWithRemoteURL:metrics:", v10, v16);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lockupImagesByIdentifiers, "setObject:forKeyedSubscript:", v17, v11);
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__MUPlaceExternalActionMenuHelper__downloadImageWithURL_variant_uniqueIdentifier_completion___block_invoke;
  v21[3] = &unk_1E2E01560;
  objc_copyWeak(&v25, &location);
  v18 = v17;
  v22 = v18;
  v19 = v11;
  v23 = v19;
  v20 = v12;
  v24 = v20;
  -[MUAppLockupImage loadImageWithCompletion:](v18, "loadImageWithCompletion:", v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __93__MUPlaceExternalActionMenuHelper__downloadImageWithURL_variant_uniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
    v7 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "cachedImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "cachedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

    WeakRetained = v7;
  }

}

- (NSString)actionName
{
  void *v2;
  void *v3;

  -[MUGroupedExternalActionController externalAction](self->_resolver, "externalAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)symbolName
{
  void *v2;
  void *v3;

  -[MUGroupedExternalActionController externalAction](self->_resolver, "externalAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isQuickAction
{
  return self->_isQuickAction;
}

- (void)setIsQuickAction:(BOOL)a3
{
  self->_isQuickAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partnerActionMenuElements, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_lockupImagesByIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
}

@end
