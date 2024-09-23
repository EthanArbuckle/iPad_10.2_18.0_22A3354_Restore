@implementation MUWebBasedPlacecardSectionController

- (MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3 placeActionDispatcher:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  MUWebBasedPlacecardSectionController *v12;
  NSObject *v13;
  _TtC6MapsUI37_MUWebBasedPlacecardSectionController *v14;
  _TtC6MapsUI37_MUWebBasedPlacecardSectionController *sectionController;
  MUWebPlacecardBridgeConfiguration *v16;
  MUWebPlacecardBridgeConfiguration *webBundleConfiguration;
  NSObject *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *UIMenusDictionary;
  MUWebUIMenuActionManager *v21;
  void *v22;
  uint64_t v23;
  MUWebUIMenuActionManager *menuActionManager;
  uint8_t v26[16];
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MUWebBasedPlacecardSectionController;
  v12 = -[MUPlaceSectionController initWithMapItem:](&v27, sel_initWithMapItem_, v9);
  if (v12)
  {
    MUGetPlaceCardLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceWebContentSectionControllerInit", ", v26, 2u);
    }

    v14 = -[_MUWebBasedPlacecardSectionController initWithMapItem:placeActionDispatcher:configuration:sectionController:]([_TtC6MapsUI37_MUWebBasedPlacecardSectionController alloc], "initWithMapItem:placeActionDispatcher:configuration:sectionController:", v9, v10, v11, v12);
    sectionController = v12->_sectionController;
    v12->_sectionController = v14;

    v16 = -[MUWebPlacecardBridgeConfiguration initWithNativeControllerName:webControllerName:]([MUWebPlacecardBridgeConfiguration alloc], "initWithNativeControllerName:webControllerName:", CFSTR("PlacecardNativeController"), CFSTR("PlacecardWebController"));
    webBundleConfiguration = v12->_webBundleConfiguration;
    v12->_webBundleConfiguration = v16;

    v12->_shouldRemoveWebContent = 0;
    objc_storeStrong((id *)&v12->_mapItem, a3);
    objc_storeStrong((id *)&v12->_configuration, a5);
    -[MUWebBasedPlacecardSectionController _downloadManifestWithForce:](v12, "_downloadManifestWithForce:", 1);
    MUGetPlaceCardLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceWebContentSectionControllerInit", ", v26, 2u);
    }

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    UIMenusDictionary = v12->_UIMenusDictionary;
    v12->_UIMenusDictionary = v19;

    -[MUWebBasedPlacecardSectionController _setupExternalActionsModels](v12, "_setupExternalActionsModels");
    v21 = [MUWebUIMenuActionManager alloc];
    objc_msgSend(v10, "actionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MUWebUIMenuActionManager initWithPlaceActionManager:mapItem:externalActionViewModel:](v21, "initWithPlaceActionManager:mapItem:externalActionViewModel:", v22, v9, v12->_externalActionViewModels);
    menuActionManager = v12->_menuActionManager;
    v12->_menuActionManager = (MUWebUIMenuActionManager *)v23;

  }
  return v12;
}

- (void)_setupExternalActionsModels
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MUPlaceExternalActionViewModel *v12;
  void *v13;
  void *v14;
  void *v15;
  MUPlaceExternalActionViewModel *v16;
  NSArray *externalActionViewModels;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_externalActionLinks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = [MUPlaceExternalActionViewModel alloc];
        -[MUWebBasedPlacecardSectionControllerConfiguration amsResultProvider](self->_configuration, "amsResultProvider");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUWebBasedPlacecardSectionControllerConfiguration artworkCache](self->_configuration, "artworkCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUWebBasedPlacecardSectionControllerConfiguration externalActionHandler](self->_configuration, "externalActionHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[MUPlaceExternalActionViewModel initWithExternalAction:amsResultProvider:iconCache:actionHandler:analyticsHandler:](v12, "initWithExternalAction:amsResultProvider:iconCache:actionHandler:analyticsHandler:", v11, v13, v14, v15, self);

        -[NSArray addObject:](v6, "addObject:", v16);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  externalActionViewModels = self->_externalActionViewModels;
  self->_externalActionViewModels = v6;

}

- (void)_downloadManifestWithForce:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *global_queue;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "explicitResources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke;
  v15[3] = &unk_1E2E04428;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "predicateWithBlock:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D27430], "sharedRequester");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  global_queue = (void *)geo_get_global_queue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke_2;
  v13[3] = &unk_1E2E04450;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  objc_msgSend(v11, "fetchResources:force:unpack:manifestConfiguration:auditToken:queue:handler:", v10, 1, 1, 0, 0, global_queue, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

uint64_t __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[14], "manifestSignedResourceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  id *WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[16];

  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a4)
    {
      MUGetPlaceCardLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_FAULT, "MUWebBasedPlacecardViewController: Error fetching signed resource from GeoServices", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v6, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      buf[0] = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject path](v8, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, buf);
      v12 = buf[0];

      if (v11 && v12)
      {
        objc_msgSend(WeakRetained[14], "webBundleEntryPoint");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject URLByAppendingPathComponent:](v8, "URLByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke_139;
        v16[3] = &unk_1E2E01730;
        v8 = v14;
        v15 = *(_QWORD *)(a1 + 32);
        v17 = v8;
        v18 = v15;
        dispatch_async(MEMORY[0x1E0C80D38], v16);

      }
    }

  }
}

void __67__MUWebBasedPlacecardSectionController__downloadManifestWithForce___block_invoke_139(uint64_t a1)
{
  MUWebContentTraits *v2;
  MUWebBasedPlacecardViewController *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = objc_alloc_init(MUWebContentTraits);
  -[MUWebContentTraits setVibrant:](v2, "setVibrant:", +[MUInfoCardStyle platterStyle](MUInfoCardStyle, "platterStyle") == 1);
  v3 = -[MUWebBasedPlacecardViewController initWithURL:traits:]([MUWebBasedPlacecardViewController alloc], "initWithURL:traits:", *(_QWORD *)(a1 + 32), v2);
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 72), v3);
    objc_msgSend(*(id *)(a1 + 40), "_setupWebContentViewController");
  }
  else
  {
    MUGetPlaceCardLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_FAULT, "MUWebBasedPlacecardViewController: Cannot load a webmodule because the MUWebContentViewController doesn't exist", v5, 2u);
    }

  }
}

- (void)_setupWebContentViewController
{
  MUPlaceSectionView *v3;
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v5;
  void *v6;

  -[MUWebBasedPlacecardViewController setWebBridgeDelegate:](self->_webContentViewController, "setWebBridgeDelegate:", self);
  v3 = -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:]([MUPlaceSectionView alloc], "initWithStyle:alwaysHideSeparators:", 0, 0);
  sectionView = self->_sectionView;
  self->_sectionView = v3;

  v5 = self->_sectionView;
  -[MUWebBasedPlacecardViewController view](self->_webContentViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionView attachViewToContentView:](v5, "attachViewToContentView:", v6);

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_webContentViewController;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  return 1;
}

- (void)callBridgeMethod:(id)a3 arguments:(id)a4
{
  -[MUWebBasedPlacecardViewController callMethod:arguments:](self->_webContentViewController, "callMethod:arguments:", a3, a4);
}

- (void)updateUserData
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  MUWebBasedPlacecardSectionController *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "placeInShortcuts");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "placeInShortcuts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("favorites"));

  }
  -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userARPSuggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userARPSuggestion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("title"));

    -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userARPSuggestion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("subtitle"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userARPSuggestion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithBool:", objc_msgSend(v20, "isRatingSuggestion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("isRatingSuggestion"));

    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userARPSuggestion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithBool:", objc_msgSend(v24, "isPhotoSuggesion"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("isPhotoSuggestion"));

    -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "userIcon");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, CFSTR("userImage"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("arpSuggestions"));
  }
  -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "userARPRatings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v48 = v3;
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v49 = self;
    -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "userARPRatings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v51;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v51 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v36);
          v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v37, "category");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, CFSTR("appleRatingCategory"));

          objc_msgSend(v37, "value");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("value"));

          objc_msgSend(v30, "addObject:", v38);
          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v34);
    }

    v3 = v48;
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v30, CFSTR("arpRatings"));

    self = v49;
  }
  -[MUWebBasedPlacecardSectionController configuration](self, "configuration", v48);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "userARPPhoto");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = (void *)MEMORY[0x1E0C99D50];
    -[MUWebBasedPlacecardSectionController configuration](self, "configuration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "userARPPhoto");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dataWithContentsOfURL:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "base64EncodedStringWithOptions:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("arpPhotos"));

  }
  if (objc_msgSend(v3, "count"))
    -[MUWebBasedPlacecardSectionController callBridgeMethod:arguments:](self, "callBridgeMethod:arguments:", CFSTR("updateUserData"), v3);

}

- (void)didReceiveMessageFromWebContentViewController:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  WebPlacecardBridge *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MUWebUIMenu *v19;
  void *v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;
  double v26;
  float v27;
  double v28;
  NSObject *v29;
  MUWebUIMenu *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint8_t buf[4];
  MUWebUIMenu *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = -[WebPlacecardBridge initWithData:]([WebPlacecardBridge alloc], "initWithData:", v6);
  -[WebPlacecardBridge arguments](v8, "arguments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WebPlacecardBridge name](v8, "name") == 3)
  {
    +[MUWebBasedPlacecardImageDataProvider sharedInstance](MUWebBasedPlacecardImageDataProvider, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconArgument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageDataForStyleAttributes:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v7[2](v7, v14, 0);
  }
  else if (-[WebPlacecardBridge name](v8, "name") == 2)
  {
    objc_msgSend(v9, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "webMenuButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUWebBasedPlacecardSectionController UIMenusDictionary](self, "UIMenusDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "menuId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v18);
    v19 = (MUWebUIMenu *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "boundingBox");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "xCoordinate");
    v22 = v21;
    objc_msgSend(v20, "yCoordinate");
    v24 = v23;
    objc_msgSend(v20, "width");
    v26 = v25;
    objc_msgSend(v20, "height");
    v28 = v27;
    if (v19)
    {
      MUGetPlaceCardLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v19;
        _os_log_impl(&dword_191DB8000, v29, OS_LOG_TYPE_INFO, "Updated WebUIMenu frame %@", buf, 0xCu);
      }

      -[MUWebUIMenu setFrame:](v19, "setFrame:", v22, v24, v26, v28);
    }
    else
    {
      v30 = -[MUWebUIMenu initWithFrame:]([MUWebUIMenu alloc], "initWithFrame:", v22, v24, v26, v28);
      -[MUWebUIMenu setMenuButton:](v30, "setMenuButton:", v16);
      -[MUWebUIMenu setMenuActionManager:](v30, "setMenuActionManager:", self->_menuActionManager);
      -[MUWebBasedPlacecardViewController webView](self->_webContentViewController, "webView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "scrollView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", v30);

      -[MUWebBasedPlacecardSectionController UIMenusDictionary](self, "UIMenusDictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "menuId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v30, v34);

      MUGetPlaceCardLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v30;
        _os_log_impl(&dword_191DB8000, v35, OS_LOG_TYPE_INFO, "Added WebUIMenu %@", buf, 0xCu);
      }

      v19 = 0;
    }

  }
  else
  {
    -[_MUWebBasedPlacecardSectionController didReceiveMessageFromWebContentViewController:replyHandler:](self->_sectionController, "didReceiveMessageFromWebContentViewController:replyHandler:", v6, v7);
  }

}

- (id)draggableContent
{
  return 0;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (int)analyticsModuleType
{
  return 25;
}

- (MUWebBasedPlacecardViewControllerDelegate)webContentDelegate
{
  return (MUWebBasedPlacecardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_webContentDelegate);
}

- (void)setWebContentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_webContentDelegate, a3);
}

- (MUWebBasedPlacecardSectionControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSMutableDictionary)UIMenusDictionary
{
  return self->_UIMenusDictionary;
}

- (void)setUIMenusDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_UIMenusDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UIMenusDictionary, 0);
  objc_destroyWeak((id *)&self->_webContentDelegate);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_menuActionManager, 0);
  objc_storeStrong((id *)&self->_webBundleConfiguration, 0);
  objc_storeStrong((id *)&self->_externalActionViewModels, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_webContentViewController, 0);
}

@end
