@implementation MPMediaPickerController

void __60__MPMediaPickerController_Appex_requestRemoteViewController__block_invoke_183(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("MPMediaPickerController.m"), 523, CFSTR("remoteViewController cannot be nil -- process will crash inserting in hierarchy. We likely got a nil remoteViewController because Music is crashing."));

  }
  objc_msgSend(v7, "setMediaPickerController:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a3);
  objc_msgSend(*(id *)(a1 + 32), "synchronizeSettings");
  objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "endDelayingDisplayOfRemoteController");
  objc_msgSend(*(id *)(a1 + 40), "_endDelayingPresentation");

}

uint64_t __60__MPMediaPickerController_Appex_requestRemoteViewController__block_invoke()
{
  return 0;
}

- (MPMediaPickerController)initWithCoder:(id)a3
{
  return -[MPMediaPickerController initWithMediaTypes:](self, "initWithMediaTypes:", -1);
}

- (MPMediaPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MPMediaPickerController initWithMediaTypes:](self, "initWithMediaTypes:", -1, a4);
}

- (void)_sharedInit
{
  MPMediaPickerController_Appex *v3;
  MPMediaPickerRemoteViewLoader *loader;

  -[MPMediaPickerController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, 568.0);
  v3 = objc_alloc_init(MPMediaPickerController_Appex);
  loader = self->_loader;
  self->_loader = (MPMediaPickerRemoteViewLoader *)v3;

  -[MPMediaPickerRemoteViewLoader setMediaPickerController:](self->_loader, "setMediaPickerController:", self);
  -[MPMediaPickerRemoteViewLoader requestRemoteViewController](self->_loader, "requestRemoteViewController");
}

- (MPMediaPickerController)initWithMediaTypes:(MPMediaType)mediaTypes
{
  MPMediaType v3;
  NSObject *v5;
  MPMediaPickerConfiguration *v6;
  MPMediaPickerController *v7;
  MPMediaPickerController *v8;
  objc_super v10;
  uint8_t buf[4];
  MPMediaType v12;
  uint64_t v13;

  v3 = mediaTypes;
  v13 = *MEMORY[0x1E0C80C00];
  if (!(_BYTE)mediaTypes)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "Unsupported media types (%ld), using MPMediaTypeAny.", buf, 0xCu);
    }

    v3 = -1;
  }
  v6 = objc_alloc_init(MPMediaPickerConfiguration);
  -[MPMediaPickerConfiguration setMediaTypes:](v6, "setMediaTypes:", v3);
  v10.receiver = self;
  v10.super_class = (Class)MPMediaPickerController;
  v7 = -[MPMediaPickerController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_configuration, v6);
    -[MPMediaPickerController _sharedInit](v8, "_sharedInit");
  }

  return v8;
}

- (MPMediaPickerController)initWithSupportedTypeIdentifiers:(id)a3 selectionMode:(int64_t)a4
{
  id v6;
  MPMediaPickerConfiguration *v7;
  MPMediaPickerController *v8;

  v6 = a3;
  v7 = objc_alloc_init(MPMediaPickerConfiguration);
  -[MPMediaPickerConfiguration setTypeIdentifiers:](v7, "setTypeIdentifiers:", v6);

  -[MPMediaPickerConfiguration setSelectionMode:](v7, "setSelectionMode:", a4);
  v8 = -[MPMediaPickerController initWithConfiguration:](self, "initWithConfiguration:", v7);

  return v8;
}

- (MPMediaPickerController)initWithConfiguration:(id)a3
{
  id v5;
  MPMediaPickerController *v6;
  MPMediaPickerController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMediaPickerController;
  v6 = -[MPMediaPickerController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[MPMediaPickerController _sharedInit](v7, "_sharedInit");
  }

  return v7;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "MPMediaPickerController must be presented modally.", buf, 2u);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController;
  -[MPMediaPickerController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_, v4);

}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)MPMediaPickerController;
  -[MPMediaPickerController viewDidLoad](&v26, sel_viewDidLoad);
  if (!-[MPMediaPickerController showsLibraryContent](self, "showsLibraryContent")
    && !-[MPMediaPickerController showsCatalogContent](self, "showsCatalogContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPickerController.m"), 148, CFSTR("showsLibraryContent and showsCatalogContent can't both be NO."));

  }
  -[MPMediaPickerController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[MPMediaPickerController _addRemoteView](self, "_addRemoteView");
  if (!self->_loader)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MEDIAPICKER_NAVIGATION_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v8);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
    objc_msgSend(v6, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, self, sel__pickerDidCancel);

    objc_msgSend(v9, "setLeftBarButtonItem:", v13);
    v14 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithTitle:style:target:action:", v16, 0, 0, 0);

    objc_msgSend(v17, "setEnabled:", 0);
    objc_msgSend(v9, "setRightBarButtonItem:", v17);
    v18 = v25;
    -[MPMediaPickerController addChildViewController:](self, "addChildViewController:", v18);
    -[MPMediaPickerController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    objc_msgSend(v18, "didMoveToParentViewController:", self);
    objc_msgSend(v18, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaPickerController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    objc_msgSend(v21, "setFrame:");

    objc_msgSend(v18, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setAutoresizingMask:", 18);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MPMediaPickerRemoteViewLoader synchronizeSettings](self->_loader, "synchronizeSettings");
  v5.receiver = self;
  v5.super_class = (Class)MPMediaPickerController;
  -[MPMediaPickerController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPMediaPickerController;
  -[MPMediaPickerController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[MPMediaPickerController _checkLibraryAuthorization](self, "_checkLibraryAuthorization");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)modalPresentationStyle
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController;
  return -[MPMediaPickerController modalPresentationStyle](&v6, sel_modalPresentationStyle);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 2;
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController;
  return -[MPMediaPickerController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MPMediaPickerController;
  return -[MPMediaPickerController preferredInterfaceOrientationForPresentation](&v6, sel_preferredInterfaceOrientationForPresentation);
}

- (int64_t)_preferredModalPresentationStyle
{
  return 1;
}

- (MPMediaType)mediaTypes
{
  return -[MPMediaPickerConfiguration mediaTypes](self->_configuration, "mediaTypes");
}

- (NSString)prompt
{
  return -[MPMediaPickerConfiguration prompt](self->_configuration, "prompt");
}

- (void)setPrompt:(NSString *)prompt
{
  void *v4;
  char v5;
  NSString *v6;

  v6 = prompt;
  -[MPMediaPickerConfiguration prompt](self->_configuration, "prompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[MPMediaPickerConfiguration setPrompt:](self->_configuration, "setPrompt:", v6);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
  }

}

- (BOOL)allowsPickingMultipleItems
{
  return -[MPMediaPickerConfiguration allowsPickingMultipleItems](self->_configuration, "allowsPickingMultipleItems");
}

- (void)setAllowsPickingMultipleItems:(BOOL)allowsPickingMultipleItems
{
  _BOOL8 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = allowsPickingMultipleItems;
  if (-[MPMediaPickerConfiguration allowsPickingMultipleItems](self->_configuration, "allowsPickingMultipleItems") != allowsPickingMultipleItems)
  {
    if (v3
      && -[MPMediaPickerConfiguration picksSingleCollectionEntity](self->_configuration, "picksSingleCollectionEntity"))
    {
      v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "setAllowsPickingMultipleItems mutually-exclusive with setPicksSingleCollectionEntity", v6, 2u);
      }

    }
    else
    {
      -[MPMediaPickerConfiguration setAllowsPickingMultipleItems:](self->_configuration, "setAllowsPickingMultipleItems:", v3);
      -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
    }
  }
}

- (BOOL)showsCloudItems
{
  return -[MPMediaPickerConfiguration showsCloudItems](self->_configuration, "showsCloudItems");
}

- (void)setShowsCloudItems:(BOOL)showsCloudItems
{
  _BOOL8 v3;

  v3 = showsCloudItems;
  if (-[MPMediaPickerConfiguration showsCloudItems](self->_configuration, "showsCloudItems") != showsCloudItems)
  {
    -[MPMediaPickerConfiguration setShowsCloudItems:](self->_configuration, "setShowsCloudItems:", v3);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
  }
}

- (BOOL)showsItemsWithProtectedAssets
{
  return -[MPMediaPickerConfiguration showsItemsWithProtectedAssets](self->_configuration, "showsItemsWithProtectedAssets");
}

- (void)setShowsItemsWithProtectedAssets:(BOOL)showsItemsWithProtectedAssets
{
  _BOOL8 v3;

  v3 = showsItemsWithProtectedAssets;
  if (-[MPMediaPickerConfiguration showsItemsWithProtectedAssets](self->_configuration, "showsItemsWithProtectedAssets") != showsItemsWithProtectedAssets)
  {
    -[MPMediaPickerConfiguration setShowsItemsWithProtectedAssets:](self->_configuration, "setShowsItemsWithProtectedAssets:", v3);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
  }
}

- (id)configuration
{
  return self->_configuration;
}

- (BOOL)picksSingleCollectionEntity
{
  return -[MPMediaPickerConfiguration picksSingleCollectionEntity](self->_configuration, "picksSingleCollectionEntity");
}

- (void)setPicksSingleCollectionEntity:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  if (-[MPMediaPickerConfiguration picksSingleCollectionEntity](self->_configuration, "picksSingleCollectionEntity") != a3)
  {
    if (-[MPMediaPickerConfiguration allowsPickingMultipleItems](self->_configuration, "allowsPickingMultipleItems"))
      v5 = !v3;
    else
      v5 = 1;
    if (v5)
    {
      -[MPMediaPickerConfiguration setPicksSingleCollectionEntity:](self->_configuration, "setPicksSingleCollectionEntity:", v3);
      -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
    }
    else
    {
      v6 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "setPicksSingleCollectionEntity mutually-exclusive with setAllowsPickingMultipleItems", v8, 2u);
      }

    }
  }
}

- (unsigned)watchCompatibilityVersion
{
  return -[MPMediaPickerConfiguration watchCompatibilityVersion](self->_configuration, "watchCompatibilityVersion");
}

- (void)setWatchCompatibilityVersion:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[MPMediaPickerConfiguration watchCompatibilityVersion](self->_configuration, "watchCompatibilityVersion") != a3)
  {
    -[MPMediaPickerConfiguration setWatchCompatibilityVersion:](self->_configuration, "setWatchCompatibilityVersion:", v3);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
  }
}

- (id)typeIdentifiers
{
  return -[MPMediaPickerConfiguration typeIdentifiers](self->_configuration, "typeIdentifiers");
}

- (int64_t)selectionMode
{
  return -[MPMediaPickerConfiguration selectionMode](self->_configuration, "selectionMode");
}

- (BOOL)showsCatalogContent
{
  return -[MPMediaPickerConfiguration showsCatalogContent](self->_configuration, "showsCatalogContent");
}

- (void)setShowsCatalogContent:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MPMediaPickerConfiguration showsCatalogContent](self->_configuration, "showsCatalogContent") != a3)
  {
    -[MPMediaPickerConfiguration setShowsCatalogContent:](self->_configuration, "setShowsCatalogContent:", v3);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
  }
}

- (BOOL)showsLibraryContent
{
  return -[MPMediaPickerConfiguration showsLibraryContent](self->_configuration, "showsLibraryContent");
}

- (void)setShowsLibraryContent:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MPMediaPickerConfiguration showsLibraryContent](self->_configuration, "showsLibraryContent") != a3)
  {
    -[MPMediaPickerConfiguration setShowsLibraryContent:](self->_configuration, "setShowsLibraryContent:", v3);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
  }
}

- (BOOL)supportsUnavailableContent
{
  return -[MPMediaPickerConfiguration supportsUnavailableContent](self->_configuration, "supportsUnavailableContent");
}

- (void)setSupportsUnavailableContent:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MPMediaPickerConfiguration supportsUnavailableContent](self->_configuration, "supportsUnavailableContent") != a3)
  {
    -[MPMediaPickerConfiguration setSupportsUnavailableContent:](self->_configuration, "setSupportsUnavailableContent:", v3);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
  }
}

- (BOOL)pickingForExternalPlayer
{
  return -[MPMediaPickerConfiguration pickingForExternalPlayer](self->_configuration, "pickingForExternalPlayer");
}

- (void)setPickingForExternalPlayer:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[MPMediaPickerConfiguration pickingForExternalPlayer](self->_configuration, "pickingForExternalPlayer") != a3)
  {
    -[MPMediaPickerConfiguration setPickingForExternalPlayer:](self->_configuration, "setPickingForExternalPlayer:", v3);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
  }
}

- (id)playbackArchiveConfiguration
{
  return -[MPMediaPickerConfiguration playbackArchiveConfiguration](self->_configuration, "playbackArchiveConfiguration");
}

- (void)setPlaybackArchiveConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MPMediaPickerConfiguration playbackArchiveConfiguration](self->_configuration, "playbackArchiveConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[MPMediaPickerConfiguration setPlaybackArchiveConfiguration:](self->_configuration, "setPlaybackArchiveConfiguration:", v6);
    -[MPMediaPickerController _synchronizeSettings](self, "_synchronizeSettings");
    v5 = v6;
  }

}

- (void)_forceDismissal
{
  id v2;

  -[MPMediaPickerController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_pickerDidCancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mediaPickerDidCancel:", self);
  else
    -[MPMediaPickerController _forceDismissal](self, "_forceDismissal");

}

- (void)_pickerDidPickItems:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mediaPicker:didPickMediaItems:", self, v5);
  else
    -[MPMediaPickerController _forceDismissal](self, "_forceDismissal");

}

- (void)_pickerDidPickPlaybackArchive:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EE371B60)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "mediaPicker:didPickPlaybackArchive:", self, v5);
  }
  else
  {
    -[MPMediaPickerController _forceDismissal](self, "_forceDismissal");
  }

}

- (BOOL)_hasAddedRemoteView
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[MPMediaPickerRemoteViewLoader remoteViewController](self->_loader, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && -[MPMediaPickerController isViewLoaded](self, "isViewLoaded")
    && objc_msgSend(v3, "isViewLoaded"))
  {
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_addRemoteView
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MPMediaPickerRemoteViewLoader remoteViewController](self->_loader, "remoteViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[MPMediaPickerController isViewLoaded](self, "isViewLoaded");

    if (v5)
    {
      -[MPMediaPickerRemoteViewLoader remoteViewController](self->_loader, "remoteViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v7);

      -[MPMediaPickerRemoteViewLoader synchronizeSettings](self->_loader, "synchronizeSettings");
      -[MPMediaPickerController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v10);

      -[MPMediaPickerController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      objc_msgSend(v10, "setFrame:");

      objc_msgSend(v10, "setAutoresizingMask:", 18);
    }
  }
}

- (void)_synchronizeSettings
{
  if (-[MPMediaPickerController _hasAddedRemoteView](self, "_hasAddedRemoteView"))
    -[MPMediaPickerRemoteViewLoader synchronizeSettings](self->_loader, "synchronizeSettings");
}

- (void)_checkLibraryAuthorization
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__MPMediaPickerController__checkLibraryAuthorization__block_invoke;
  v2[3] = &unk_1E3159898;
  v2[4] = self;
  +[MPMediaLibrary requestAuthorization:](MPMediaLibrary, "requestAuthorization:", v2);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (MPMediaPickerRemoteViewLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
  objc_storeStrong((id *)&self->_loader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __53__MPMediaPickerController__checkLibraryAuthorization__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  _QWORD block[5];
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (a2 != 3)
  {
    v8 = v2;
    v9 = v3;
    v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "Media library access is not authorized. Users need to grant media library access for your app in Settings > Privacy to interact with MPMediaPickerController. Dismissing.", v7, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MPMediaPickerController__checkLibraryAuthorization__block_invoke_92;
    block[3] = &unk_1E3163508;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __53__MPMediaPickerController__checkLibraryAuthorization__block_invoke_92(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forceDismissal");
}

@end
