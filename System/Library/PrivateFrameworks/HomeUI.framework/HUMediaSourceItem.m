@implementation HUMediaSourceItem

+ (id)appleMusicSource
{
  HUMediaSourceItem *v2;

  v2 = -[HUMediaSourceItem initWithBundleIdentifier:forServiceName:]([HUMediaSourceItem alloc], "initWithBundleIdentifier:forServiceName:", CFSTR("com.apple.Music"), CFSTR("HFAppleMusicServiceName"));
  -[HUMediaSourceItem setContinuousPicker:](v2, "setContinuousPicker:", 0);
  return v2;
}

+ (id)soundScapesSource
{
  HUMediaSourceItem *v2;

  v2 = -[HUMediaSourceItem initWithBundleIdentifier:forServiceName:]([HUMediaSourceItem alloc], "initWithBundleIdentifier:forServiceName:", CFSTR("com.apple.SoundScapes"), CFSTR("HFSoundScapesServiceName"));
  -[HUMediaSourceItem setContinuousPicker:](v2, "setContinuousPicker:", 1);
  return v2;
}

- (HUMediaSourceItem)initWithBundleIdentifier:(id)a3 forServiceName:(id)a4
{
  id v7;
  id v8;
  HUMediaSourceItem *v9;
  HUMediaSourceItem *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NAFuture *iconFuture;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUMediaSourceItem;
  v9 = -[HUMediaSourceItem init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleIdentifier, a3);
    HFLocalizedString();
    v11 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v11;

    -[HUMediaSourceItem _appIconFuture](v10, "_appIconFuture");
    v13 = objc_claimAutoreleasedReturnValue();
    iconFuture = v10->_iconFuture;
    v10->_iconFuture = (NAFuture *)v13;

    objc_initWeak(&location, v10);
    -[HUMediaSourceItem iconFuture](v10, "iconFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__HUMediaSourceItem_initWithBundleIdentifier_forServiceName___block_invoke;
    v18[3] = &unk_1E6F5E928;
    objc_copyWeak(&v19, &location);
    v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __61__HUMediaSourceItem_initWithBundleIdentifier_forServiceName___block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "updateWithOptions:", MEMORY[0x1E0C9AA70]);

}

- (id)_appIconFuture
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = (void *)MEMORY[0x1E0D519C0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__HUMediaSourceItem__appIconFuture__block_invoke;
  v6[3] = &unk_1E6F4C660;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithBlock:scheduler:", v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __35__HUMediaSourceItem__appIconFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  double v19;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CA5860];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationProxyForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isInstalled"))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithResourceProxy:", v6);
LABEL_6:
    v11 = (void *)v7;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.SoundScapes"));

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForIdentifier:", CFSTR("com.apple.SoundScapesUtility.ViewServices"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithResourceProxy:", v10);

LABEL_7:
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = v13;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 32.0, 32.0, v14);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __35__HUMediaSourceItem__appIconFuture__block_invoke_2;
  v17[3] = &unk_1E6F54FF8;
  v19 = v14;
  v18 = v3;
  v16 = v3;
  objc_msgSend(v11, "getImageForImageDescriptor:completion:", v15, v17);

}

void __35__HUMediaSourceItem__appIconFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", objc_msgSend(a2, "CGImage"), 0, *(double *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);

}

- (id)resolveForMediaProfiles:(id)a3 forTarget:(unint64_t)a4
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  NAFuture *v11;
  NAFuture *resolveFuture;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NAFuture *v17;
  NAFuture *v18;
  void *v19;
  NAFuture *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;
  _QWORD v36[4];
  id v37;
  unint64_t v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_storeStrong((id *)&self->_mediaProfileContainers, a3);
  -[HUMediaSourceItem bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Music"));

  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    -[HUMediaSourceItem _updateAppleMusicSubscriptionStatusForMediaProfiles:forTarget:](self, "_updateAppleMusicSubscriptionStatusForMediaProfiles:forTarget:", v7, a4);
    v11 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    resolveFuture = self->_resolveFuture;
    self->_resolveFuture = v11;

  }
  else
  {
    -[HUMediaSourceItem bundleIdentifier](self, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.SoundScapes"));

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0D519C0];
      v36[0] = v10;
      v36[1] = 3221225472;
      v36[2] = __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke;
      v36[3] = &unk_1E6F53720;
      v37 = v7;
      v38 = a4;
      objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "futureWithBlock:scheduler:", v36, v16);
      v17 = (NAFuture *)objc_claimAutoreleasedReturnValue();
      v18 = self->_resolveFuture;
      self->_resolveFuture = v17;

    }
  }
  objc_initWeak(&location, self);
  -[HUMediaSourceItem bundleIdentifier](self, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self->_resolveFuture;
  v32[0] = v10;
  v32[1] = 3221225472;
  v32[2] = __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke_42;
  v32[3] = &unk_1E6F5E990;
  v21 = v19;
  v33 = v21;
  objc_copyWeak(&v34, &location);
  v22 = (id)-[NAFuture addCompletionBlock:](v20, "addCompletionBlock:", v32);
  v23 = (void *)objc_opt_new();
  -[HUMediaSourceItem resolveFuture](self, "resolveFuture");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[HUMediaSourceItem resolveFuture](self, "resolveFuture");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v25);
  }
  else
  {
    HFLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[HUMediaSourceItem bundleIdentifier](self, "bundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v26;
      _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "Media Source %@ is not being resolved", buf, 0xCu);

    }
  }

  -[HUMediaSourceItem iconFuture](self, "iconFuture");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[HUMediaSourceItem iconFuture](self, "iconFuture");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v28);
  }
  else
  {
    HFLogForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[HUMediaSourceItem bundleIdentifier](self, "bundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v29;
      _os_log_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEFAULT, "Icon for media Source %@ is not being fetched", buf, 0xCu);

    }
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  return v30;
}

void __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_9;
    if (v9)
    {
      objc_msgSend(v9, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hf_isHomePod");

      objc_msgSend(v9, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hf_isSiriEndpoint");

      if (v11)
      {
LABEL_9:
        objc_msgSend(v7, "accessories");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "na_all:", &__block_literal_global_264);
        goto LABEL_10;
      }
      if ((v13 & 1) != 0)
      {
        objc_msgSend(v5, "residentDevices");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "na_any:", &__block_literal_global_36_4);
LABEL_10:
        v16 = v15;

        if ((v16 & 1) == 0)
          goto LABEL_22;
        goto LABEL_13;
      }
    }
    else
    {
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Unexpected media profile container", buf, 2u);
      }

    }
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Unexpected media profile configuration", v23, 2u);
    }

    goto LABEL_22;
  }
  if ((objc_msgSend(getSSUSoundScapesPickerManagerClass(), "pickerSupportHome:targetMediaProfileContainers:", v5, *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
LABEL_22:
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    HFLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("HUMediaPickerUnavailablePromptTitleKey"));

    HFLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("HUMediaPickerUnavailablePromptMessageKey"));

    v22 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "finishWithResult:", v22);

    goto LABEL_23;
  }
LABEL_13:
  objc_msgSend(v3, "finishWithResult:", MEMORY[0x1E0C9AA70]);
LABEL_23:

}

unint64_t __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke_33(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;

  objc_msgSend(a2, "hf_linkedResidentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "capabilities") >> 24) & 1;

  return v3;
}

unint64_t __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 24) & 1;
}

void __55__HUMediaSourceItem_resolveForMediaProfiles_forTarget___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Media Source %@ resolve result %@, with error %@", (uint8_t *)&v14, 0x20u);
  }

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setResolveError:", v11);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HUMediaSourceItem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaSourceItem bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)pickerViewController
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;

  if (!-[HUMediaSourceItem success](self, "success"))
    goto LABEL_6;
  -[HUMediaSourceItem bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Music"));

  if (!v4)
  {
    -[HUMediaSourceItem bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.SoundScapes"));

    if (v7)
    {
      -[HUMediaSourceItem _setupSoundScapesPicker](self, "_setupSoundScapesPicker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
LABEL_6:
    v5 = 0;
    return v5;
  }
  -[HUMediaSourceItem _setupAppleMusicPicker](self, "_setupAppleMusicPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)_setupAppleMusicPicker
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  objc_class *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v3 = (void *)qword_1ED5805F0;
  v22 = qword_1ED5805F0;
  if (!qword_1ED5805F0)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getMPMediaPickerControllerClass_block_invoke_1;
    v17 = &unk_1E6F4C868;
    v18 = &v19;
    __getMPMediaPickerControllerClass_block_invoke_1((uint64_t)&v14);
    v3 = (void *)v20[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v19, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithSupportedTypeIdentifiers:selectionMode:", &unk_1E7042DC8, 4);
  objc_msgSend(v5, "setShowsCloudItems:", 1);
  objc_msgSend(v5, "setShowsItemsWithProtectedAssets:", 1);
  objc_msgSend(v5, "setShowsCatalogContent:", 1);
  objc_msgSend(v5, "setShowsLibraryContent:", 1);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v9 = (void *)qword_1ED5805F8;
  v22 = qword_1ED5805F8;
  if (!qword_1ED5805F8)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getMPPlaybackArchiveConfigurationClass_block_invoke_1;
    v17 = &unk_1E6F4C868;
    v18 = &v19;
    __getMPPlaybackArchiveConfigurationClass_block_invoke_1((uint64_t)&v14);
    v9 = (void *)v20[3];
  }
  if (v8 <= 4.0)
    v10 = 256.0;
  else
    v10 = v8 * 64.0;
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v19, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "initWithPreferredArtworkSize:", v10, v10);
  objc_msgSend(v5, "setPlaybackArchiveConfiguration:", v12);

  objc_msgSend(v5, "setDelegate:", self);
  return v5;
}

- (id)_setupSoundScapesPicker
{
  id SSUSoundScapesPickerManagerClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  SSUSoundScapesPickerManagerClass = getSSUSoundScapesPickerManagerClass();
  -[HUMediaSourceItem mediaProfileContainers](self, "mediaProfileContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SSUSoundScapesPickerManagerClass, "pickerForMediaProfileContainers:forDelegate:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10[0] = CFSTR("HUMediaPickerUnavailablePromptTitleKey");
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlertError"), CFSTR("HUAlertError"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("HUMediaPickerUnavailablePromptMessageKey");
    v11[0] = v6;
    HFLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSourceItem setResolveError:](self, "setResolveError:", v8);

  }
  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HUMediaSourceItem iconFuture](self, "iconFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HUMediaSourceItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E6F5E9B8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v8;
}

id __49__HUMediaSourceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "resolveError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailablePromptTitleKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E08];
    v15 = *MEMORY[0x1E0D30D18];
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "na_safeSetObject:forKey:", v3, *MEMORY[0x1E0D30C70]);
    objc_msgSend(v11, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D30BF8]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31578]), "initWithResults:", v11);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[HUMediaSourceItem resolveFuture](self, "resolveFuture", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFinished") ^ 1;

  return v4;
}

- (BOOL)success
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HUMediaSourceItem resolveFuture](self, "resolveFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFinished"))
  {
    -[HUMediaSourceItem resolveError](self, "resolveError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)failed
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HUMediaSourceItem resolveFuture](self, "resolveFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFinished"))
  {
    -[HUMediaSourceItem resolveError](self, "resolveError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_musicAppUninstallResolveError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("HUMediaPickerUnavailablePromptTitleKey");
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptTitle"), CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptTitle"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("HUMediaPickerUnavailablePromptActionTitleKey");
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton"), CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("HUMediaPickerUnavailablePromptActionURLKey");
  +[HUMediaAccountUtilities musicAppURL](HUMediaAccountUtilities, "musicAppURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("HUMediaPickerUnavailablePromptMessageKey");
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage"), CFSTR("HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_musicCatalogPlaybackDisabledResolveErrorFor:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v3 = CFSTR("HUMusicAlarmMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage");
    v4 = CFSTR("HUMusicAlarmMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage");
  }
  else
  {
    if (a3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v3 = CFSTR("HUSceneMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage");
    v4 = CFSTR("HUSceneMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage");
    LODWORD(a3) = 1;
  }
  _HULocalizedStringWithDefaultValue(v3, v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11[0] = CFSTR("HUMediaPickerUnavailablePromptTitleKey");
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptTitle"), CFSTR("HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = v5;
  v11[1] = CFSTR("HUMediaPickerUnavailablePromptMessageKey");
  v11[2] = CFSTR("HUMediaPickerUnavailablePromptActionTitleKey");
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptGetAppleMusicButton"), CFSTR("HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptGetAppleMusicButton"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("HUMediaPickerUnavailablePromptActionURLKey");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("music://subscribe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_storeKitErrorResolveErrorFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HUMediaAccountUtilities reasonForMediaPickerNotAvailable:](HUMediaAccountUtilities, "reasonForMediaPickerNotAvailable:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    _HULocalizedStringWithDefaultValue(v4, v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = CFSTR("HUMediaPickerUnavailablePromptTitleKey");
  _HULocalizedStringWithDefaultValue(CFSTR("HUAlertError"), CFSTR("HUAlertError"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("HUMediaPickerUnavailablePromptMessageKey");
  v11[0] = v7;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_updateAppleMusicSubscriptionStatusForMediaProfiles:(id)a3 forTarget:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[HUMediaAccountUtilities isMusicAppInstalled](HUMediaAccountUtilities, "isMusicAppInstalled"))
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUMediaAccountUtilities determineMediaPickerAvailabilityForHomePodProfiles:inHome:](HUMediaAccountUtilities, "determineMediaPickerAvailabilityForHomePodProfiles:inHome:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reschedule:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__HUMediaSourceItem__updateAppleMusicSubscriptionStatusForMediaProfiles_forTarget___block_invoke;
    v16[3] = &__block_descriptor_40_e32___NAFuture_16__0__NSDictionary_8l;
    v16[4] = a4;
    objc_msgSend(v10, "flatMap:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17[0] = CFSTR("HUMediaPickerUnavailablePromptTitleKey");
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptTitle"), CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v18[1] = CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton");
    v17[1] = CFSTR("HUMediaPickerUnavailablePromptActionTitleKey");
    v17[2] = CFSTR("HUMediaPickerUnavailablePromptActionURLKey");
    +[HUMediaAccountUtilities musicAppURL](HUMediaAccountUtilities, "musicAppURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v13;
    v17[3] = CFSTR("HUMediaPickerUnavailablePromptMessageKey");
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage"), CFSTR("HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __83__HUMediaSourceItem__updateAppleMusicSubscriptionStatusForMediaProfiles_forTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HOMediaPickerUnavailableReasonKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailableReasonStoreKitErrorObjectKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v6)
  {
    v10 = objc_msgSend(v6, "integerValue");
    if (v10 == 2)
    {
      +[HUMediaSourceItem _storeKitErrorResolveErrorFor:](HUMediaSourceItem, "_storeKitErrorResolveErrorFor:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (v10 == 1)
    {
      +[HUMediaSourceItem _musicCatalogPlaybackDisabledResolveErrorFor:](HUMediaSourceItem, "_musicCatalogPlaybackDisabledResolveErrorFor:", *(_QWORD *)(a1 + 32));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10)
      {
        v13 = 0;
        goto LABEL_17;
      }
      +[HUMediaSourceItem _musicAppUninstallResolveError](HUMediaSourceItem, "_musicAppUninstallResolveError");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v11;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v12;
}

- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUMediaSourceItem delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaPickerDidPickPlaybackArchive:", v5);

}

- (void)mediaPickerDidCancel:(id)a3
{
  id v3;

  -[HUMediaSourceItem delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaPickerDidCancel");

}

- (void)mediaPickerDidSelectPlaybackArchive:(id)a3 withError:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[HUMediaSourceItem delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaPickerDidPickPlaybackArchive:", v5);

}

- (void)mediaPickerCancelled
{
  id v2;

  -[HUMediaSourceItem delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaPickerDidCancel");

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (HUMediaPickerDelegate)delegate
{
  return (HUMediaPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)continuousPicker
{
  return self->_continuousPicker;
}

- (void)setContinuousPicker:(BOOL)a3
{
  self->_continuousPicker = a3;
}

- (NSDictionary)resolveError
{
  return self->_resolveError;
}

- (void)setResolveError:(id)a3
{
  objc_storeStrong((id *)&self->_resolveError, a3);
}

- (NSSet)mediaProfileContainers
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (NAFuture)iconFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 112, 1);
}

- (NAFuture)resolveFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveFuture, 0);
  objc_storeStrong((id *)&self->_iconFuture, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainers, 0);
  objc_storeStrong((id *)&self->_resolveError, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
