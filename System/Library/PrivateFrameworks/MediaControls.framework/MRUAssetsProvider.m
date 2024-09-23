@implementation MRUAssetsProvider

+ (MRUAssetsProvider)sharedAssetsProvider
{
  if (sharedAssetsProvider___onceToken != -1)
    dispatch_once(&sharedAssetsProvider___onceToken, &__block_literal_global_41);
  return (MRUAssetsProvider *)(id)sharedAssetsProvider___sharedAssetsProvider;
}

- (MRUAssetsProvider)init
{
  MRUAssetsProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *completionBlocks;
  NSCache *v5;
  NSCache *imageCache;
  NSCache *v7;
  NSCache *applicationCache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRUAssetsProvider;
  v2 = -[MRUAssetsProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    applicationCache = v2->_applicationCache;
    v2->_applicationCache = v7;

  }
  return v2;
}

void __41__MRUAssetsProvider_sharedAssetsProvider__block_invoke()
{
  MRUAssetsProvider *v0;
  void *v1;

  v0 = objc_alloc_init(MRUAssetsProvider);
  v1 = (void *)sharedAssetsProvider___sharedAssetsProvider;
  sharedAssetsProvider___sharedAssetsProvider = (uint64_t)v0;

}

+ (UIImage)airplay
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("airplayaudio"));
}

+ (UIImage)airplayVideo
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("airplayvideo"));
}

+ (UIImage)genericDevices
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tv.and.hifispeaker.fill"));
}

+ (UIImage)wirelessSharing
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2.fill"));
}

+ (UIImage)controlOtherSpeakers
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  if (+[MRUFeatureFlagProvider isNewControlsEnabled](MRUFeatureFlagProvider, "isNewControlsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tv.and.hifispeaker.fill.fill"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tv.and.hifispeaker.fill"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tv.and.hifispeaker.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIImage *)v5;
}

+ (NSString)playSymbol
{
  return (NSString *)CFSTR("play.fill");
}

+ (NSString)pauseSymbol
{
  return (NSString *)CFSTR("pause.fill");
}

+ (NSString)stopSymbol
{
  return (NSString *)CFSTR("stop.fill");
}

+ (NSString)backwardSymbol
{
  return (NSString *)CFSTR("backward.fill");
}

+ (NSString)forwardSymbol
{
  return (NSString *)CFSTR("forward.fill");
}

+ (NSString)favoriteSymbol
{
  return (NSString *)CFSTR("favorite");
}

+ (NSString)playPauseStopPackageName
{
  return (NSString *)CFSTR("PlayPauseStop");
}

+ (NSString)forwardBackwardPackageName
{
  return (NSString *)CFSTR("ForwardBackward");
}

+ (NSString)favoritePackageName
{
  return (NSString *)CFSTR("Favorite");
}

+ (NSString)volumePackageName
{
  return (NSString *)CFSTR("Volume");
}

+ (NSString)volumeBoldPackageName
{
  return (NSString *)CFSTR("VolumeBold");
}

+ (NSString)volumeRTLPackageName
{
  return (NSString *)CFSTR("VolumeRTL");
}

+ (UIImage)play
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "playSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)pause
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "pauseSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)stop
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "stopSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)tvRemote
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaRemoteUIBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("appletvremote"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)languageOptions
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("captions.bubble"));
}

+ (UIImage)backward
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "backwardSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)forward
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "forwardSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)menu
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("line.horizontal.3"));
}

+ (UIImage)like
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.fill"));
}

+ (UIImage)dislike
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
}

+ (UIImage)wishlist
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
}

+ (id)goBackwardSymbolForTimeInterval:(double)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gobackward.%i"), llround(fabs(a3)));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v3;
  else
    v5 = CFSTR("gobackward.minus");
  v6 = v5;

  return v6;
}

+ (id)goForwardSymbolForTimeInterval:(double)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("goforward.%i"), llround(fabs(a3)));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v3;
  else
    v5 = CFSTR("goforward.plus");
  v6 = v5;

  return v6;
}

+ (id)goBackwardForTimeInterval:(double)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "goBackwardSymbolForTimeInterval:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)goForwardForTimeInterval:(double)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "goForwardSymbolForTimeInterval:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (UIImage)volumeMin
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("volume.fill"));
}

+ (UIImage)volumeMax
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("volume.3.fill"));
}

+ (UIImage)volumeRelativeMinus
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("speaker.minus.fill"));
}

+ (UIImage)volumeRelativePlus
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("speaker.plus.fill"));
}

+ (UIImage)collapsedRoutingChevron
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
}

+ (UIImage)expandedRoutingChevron
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.down"));
}

+ (UIImage)routingAccessoryMultiDeselected
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
}

+ (UIImage)routingAccessorySelected
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
}

+ (UIImage)routingAccessoryMultiSelected
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
}

+ (UIImage)phone
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("phone.fill"));
}

+ (UIImage)sharing
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.2.fill"));
}

+ (UIImage)emptyArtwork
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaRemoteUIBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("EmptyArtwork"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (NSString)suggestedRouteWaveformPackageName
{
  return (NSString *)CFSTR("SuggestedRouteWaveform");
}

+ (NSString)suggestedRouteWaveformPackageStateOn
{
  return (NSString *)CFSTR("On");
}

+ (NSString)suggestedRouteWaveformPackageStateOff
{
  return (NSString *)CFSTR("Off");
}

+ (UIImage)suggestedRouteTVRemote
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("appletvremote.gen4.fill"));
}

+ (id)packageWithName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "mediaRemoteUIBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("ca"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v6, *MEMORY[0x1E0CD3078], 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)packageDescriptionWithName:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D14768];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "mediaRemoteUIBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForPackageNamed:inBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)applicationIconForBundleIdentifier:(id)a3 traitCollection:(id)a4 completion:(id)a5
{
  -[MRUAssetsProvider applicationIconForBundleIdentifier:size:traitCollection:completion:](self, "applicationIconForBundleIdentifier:size:traitCollection:completion:", a3, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)applicationIconForBundleIdentifier:(id)a3 size:(CGSize)a4 traitCollection:(id)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  -[MRUAssetsProvider applicationIconForBundleIdentifier:size:appearance:completion:](self, "applicationIconForBundleIdentifier:size:appearance:completion:", v12, objc_msgSend(a5, "userInterfaceStyle") == 2, v11, width, height);

}

- (void)applicationIconForBundleIdentifier:(id)a3 appearance:(int64_t)a4 completion:(id)a5
{
  -[MRUAssetsProvider applicationIconForBundleIdentifier:size:appearance:completion:](self, "applicationIconForBundleIdentifier:size:appearance:completion:", a3, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)applicationIconForBundleIdentifier:(id)a3 size:(CGSize)a4 appearance:(int64_t)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  void *v15;
  double v16;
  NSDate *v17;
  NSDate *purgeApplicationCacheDate;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(_QWORD, _QWORD);
  id v30;
  uint8_t buf[4];
  MRUAssetsProvider *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  height = a4.height;
  width = a4.width;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD))v12;
  if (!v11)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
    goto LABEL_22;
  }
  if (MRMediaRemoteApplicationIsSystemMediaApplication())
  {
    v14 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
LABEL_9:
    v15 = (void *)v14;

    v11 = v15;
    goto LABEL_10;
  }
  if (MRMediaRemoteApplicationIsSystemPodcastApplication())
  {
    v14 = MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
    goto LABEL_9;
  }
  if (MRMediaRemoteApplicationIsSystemAppleTVApplication())
  {
    v14 = MRMediaRemoteCopyLocalDeviceSystemAppleTVApplicationDisplayID();
    goto LABEL_9;
  }
LABEL_10:
  -[NSDate timeIntervalSinceNow](self->_purgeApplicationCacheDate, "timeIntervalSinceNow");
  if (-v16 >= 86400.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    purgeApplicationCacheDate = self->_purgeApplicationCacheDate;
    self->_purgeApplicationCacheDate = v17;

    -[NSCache removeAllObjects](self->_applicationCache, "removeAllObjects");
  }
  -[NSCache objectForKey:](self->_applicationCache, "objectForKey:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v30 = 0;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v11, 0, &v30);
    v21 = v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20 != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](self->_applicationCache, "setObject:forKey:", v19, v11);
    if (v21)
    {
      MCLogCategoryDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v32 = self;
        v33 = 2114;
        v34 = v11;
        v35 = 2114;
        v36 = v21;
        _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_ERROR, "%{public}@ coudln't find application with bundle: %{public}@ | error: %{public}@ ", buf, 0x20u);
      }

    }
  }
  if ((objc_msgSend(v19, "BOOLValue") & 1) != 0)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v11);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scale");
    v26 = v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", width, height, v26);
    objc_msgSend(v27, "setAppearance:", a5);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __83__MRUAssetsProvider_applicationIconForBundleIdentifier_size_appearance_completion___block_invoke;
    v28[3] = &unk_1E581C040;
    v29 = v13;
    objc_msgSend(v23, "getCGImageForImageDescriptor:completion:", v27, v28);

  }
  else
  {
    v13[2](v13, 0);
  }

LABEL_22:
}

void __83__MRUAssetsProvider_applicationIconForBundleIdentifier_size_appearance_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)imageForURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[MRUAssetsProvider imageCache](self, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    -[MRUAssetsProvider completionBlocks](self, "completionBlocks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v11 = _Block_copy(v7);
      objc_msgSend(v9, "setByAddingObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUAssetsProvider completionBlocks](self, "completionBlocks");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v6);

    }
    else
    {
      v14 = objc_alloc(MEMORY[0x1E0C99E60]);
      v15 = _Block_copy(v7);
      v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, 0);
      -[MRUAssetsProvider completionBlocks](self, "completionBlocks");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v6);

      objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __44__MRUAssetsProvider_imageForURL_completion___block_invoke;
      v19[3] = &unk_1E581C068;
      v19[4] = self;
      v20 = v6;
      objc_msgSend(v11, "dataTaskWithURL:completionHandler:", v20, v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resume");

    }
  }

}

void __44__MRUAssetsProvider_imageForURL_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a2 && !v6)
  {
    v9 = (objc_class *)MEMORY[0x1E0DC3870];
    v10 = a2;
    v8 = (void *)objc_msgSend([v9 alloc], "initWithData:", v10);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__MRUAssetsProvider_imageForURL_completion___block_invoke_2;
  v15[3] = &unk_1E581A9A8;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v16 = v8;
  v17 = v11;
  v18 = v12;
  v19 = v7;
  v13 = v7;
  v14 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

void __44__MRUAssetsProvider_imageForURL_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "completionBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "completionBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));

}

- (NSMutableDictionary)completionBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSCache)imageCache
{
  return (NSCache *)objc_getProperty(self, a2, 16, 1);
}

- (NSCache)applicationCache
{
  return (NSCache *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)purgeApplicationCacheDate
{
  return self->_purgeApplicationCacheDate;
}

- (void)setPurgeApplicationCacheDate:(id)a3
{
  objc_storeStrong((id *)&self->_purgeApplicationCacheDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeApplicationCacheDate, 0);
  objc_storeStrong((id *)&self->_applicationCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end
