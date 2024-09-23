@implementation MRUVolumeBackgroundViewController

void __64__MRUVolumeBackgroundViewController_performLayoutWithAnimation___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __113__MRUVolumeBackgroundViewController_audioModuleController_spatialAudioController_didChangeAvailableSpatialModes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

uint64_t __106__MRUVolumeBackgroundViewController_audioModuleController_spatialAudioController_didChangeNowPlayingInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

- (void)updateSpatialAudioModeButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t i;
  void *v19;
  MediaControlsExpandableButtonOption *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MediaControlsExpandableButtonOption *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  MRUVolumeBackgroundViewController *v37;
  void *v38;
  int v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[MRUVolumeBackgroundViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spatialAudioModeButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedMode");
  v7 = objc_claimAutoreleasedReturnValue();

  -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self;
  if ((objc_msgSend(v8, "isMultichannel") & 1) != 0)
  {
    v39 = 1;
  }
  else
  {
    -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v9, "isMultichannelAvailable");

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v7;
  if (v5)
    v35 = objc_msgSend(v5, "indexOfObject:", v7);
  else
    v35 = 0x7FFFFFFFFFFFFFFFLL;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v12)
    goto LABEL_28;
  v13 = v12;
  v14 = *(_QWORD *)v44;
  if (v39)
    v15 = CFSTR("SpatialMultichannelHeadTracked");
  else
    v15 = CFSTR("SpatialStereoHeadTracked");
  v16 = CFSTR("SpatialStereoOn");
  if (v39)
    v16 = CFSTR("SpatialMultichannelOn");
  v41 = v16;
  v42 = v15;
  v17 = CFSTR("SpatialStereoOff");
  if (v39)
    v17 = CFSTR("SpatialMultichannelOff");
  v40 = v17;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v44 != v14)
        objc_enumerationMutation(v11);
      v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      v20 = objc_alloc_init(MediaControlsExpandableButtonOption);
      -[MediaControlsExpandableButtonOption setIdentifier:](v20, "setIdentifier:", v19);
      -[MediaControlsExpandableButtonOption setEnabled:](v20, "setEnabled:", objc_msgSend(v19, "isEnabled"));
      v21 = objc_msgSend(v19, "type");
      switch(v21)
      {
        case 2:
          +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", v42);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setAsset:](v20, "setAsset:", v28);

          +[MRUStringsProvider spatialButtonSubtitleHeadTracked](MRUStringsProvider, "spatialButtonSubtitleHeadTracked");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setTitle:](v20, "setTitle:", v29);

          v26 = v20;
          v27 = CFSTR("head-tracked");
          goto LABEL_25;
        case 1:
          +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", v41);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setAsset:](v20, "setAsset:", v24);

          +[MRUStringsProvider spatialButtonSubtitleOn](MRUStringsProvider, "spatialButtonSubtitleOn");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setTitle:](v20, "setTitle:", v25);

          v26 = v20;
          v27 = CFSTR("animating");
LABEL_25:
          -[MediaControlsExpandableButtonOption setSelectedState:](v26, "setSelectedState:", v27);
          -[MediaControlsExpandableButtonOption setSelectedBackground:](v20, "setSelectedBackground:", 2);
          break;
        case 0:
          +[MRUAsset packageAssetNamed:](MRUAsset, "packageAssetNamed:", v40);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setAsset:](v20, "setAsset:", v22);

          +[MRUStringsProvider spatialButtonSubtitleOff](MRUStringsProvider, "spatialButtonSubtitleOff");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[MediaControlsExpandableButtonOption setTitle:](v20, "setTitle:", v23);

          break;
      }
      objc_msgSend(v10, "addObject:", v20);

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v13);
LABEL_28:

  if ((v39 & 1) != 0)
    +[MRUStringsProvider spatialButtonTitle](MRUStringsProvider, "spatialButtonTitle");
  else
    +[MRUStringsProvider spatializeStereoButtonTitle](MRUStringsProvider, "spatializeStereoButtonTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTitle:", v30);

  -[MRUAudioModuleController spatialAudioController](v37->_audioModuleController, "spatialAudioController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setEnabled:", objc_msgSend(v31, "isEnabled"));

  -[MRUAudioModuleController spatialAudioController](v37->_audioModuleController, "spatialAudioController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "disabledDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDisabledSubtitle:", v33);

  v34 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v38, "setOptions:", v34);

  objc_msgSend(v38, "setSelectedOptionIndex:animated:", v35, -[MRUVolumeBackgroundViewController _appearState](v37, "_appearState") == 2);
}

- (void)updateVisibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSplitRoute");
  -[MRUVolumeBackgroundViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowSecondaryAssetView:", v4);

  -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nowPlayingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeBackgroundViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowNowPlayingView:", v7 != 0);

  -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "availablePrimaryListeningModes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (unint64_t)objc_msgSend(v10, "count") > 1;
  -[MRUVolumeBackgroundViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowPrimaryListeningModeButton:", v11);

  -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "availableSecondaryListeningModes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (unint64_t)objc_msgSend(v14, "count") > 1;
  -[MRUVolumeBackgroundViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShowSecondaryListeningModeButton:", v15);

  -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "availableModes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (unint64_t)objc_msgSend(v18, "count") > 1;
  -[MRUVolumeBackgroundViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShowSpatialAudioModeButton:", v19);

  -[MRUAudioModuleController conversationAwarenessController](self->_audioModuleController, "conversationAwarenessController");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v23, "isConversationAwarenessSupported");
  -[MRUVolumeBackgroundViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShowConversationAwarenessButton:", v21);

}

- (void)performLayoutWithAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D14778];
  -[MRUVolumeBackgroundViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__MRUVolumeBackgroundViewController_performLayoutWithAnimation___block_invoke;
  v9[3] = &unk_1E5819B40;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "performWithoutAnimationWhileHiddenInWindow:actions:", v7, v9);

}

void __64__MRUVolumeBackgroundViewController_performLayoutWithAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  v3 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__MRUVolumeBackgroundViewController_performLayoutWithAnimation___block_invoke_2;
  v5[3] = &unk_1E58194F0;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "mru_animateUsingType:animations:completion:", 1, v5, 0);

}

- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeAvailableSpatialModes:(id)a5
{
  _QWORD v6[5];

  -[MRUVolumeBackgroundViewController updateSpatialAudioModeButton](self, "updateSpatialAudioModeButton", a3, a4, a5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __113__MRUVolumeBackgroundViewController_audioModuleController_spatialAudioController_didChangeAvailableSpatialModes___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);
}

- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeSelectedSpatialMode:(id)a5
{
  void *v6;
  void *v7;
  char v8;

  -[MRUVolumeBackgroundViewController view](self, "view", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spatialAudioModeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTracking");

  if ((v8 & 1) == 0)
    -[MRUVolumeBackgroundViewController updateSpatialAudioModeButton](self, "updateSpatialAudioModeButton");
}

- (void)audioModuleController:(id)a3 spatialAudioController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  _QWORD v6[5];

  -[MRUVolumeBackgroundViewController updateNowPlaying](self, "updateNowPlaying", a3, a4, a5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__MRUVolumeBackgroundViewController_audioModuleController_spatialAudioController_didChangeNowPlayingInfo___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);
}

void __53__MRUVolumeBackgroundViewController_updateNowPlaying__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIcon:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)updateNowPlaying
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "formatDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeBackgroundViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nowPlayingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v5);

  -[MRUVolumeBackgroundViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  +[MRUAssetsProvider sharedAssetsProvider](MRUAssetsProvider, "sharedAssetsProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeBackgroundViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__MRUVolumeBackgroundViewController_updateNowPlaying__block_invoke;
  v13[3] = &unk_1E5819988;
  v13[4] = self;
  objc_msgSend(v9, "applicationIconForBundleIdentifier:traitCollection:completion:", v10, v12, v13);

}

void __53__MRUVolumeBackgroundViewController_updateNowPlaying__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MRUVolumeBackgroundViewController_updateNowPlaying__block_invoke_2;
  v5[3] = &unk_1E5818CB0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

- (MRUVolumeBackgroundViewController)initWithAudioModuleController:(id)a3
{
  id v5;
  MRUVolumeBackgroundViewController *v6;
  MRUVolumeBackgroundViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeBackgroundViewController;
  v6 = -[MRUVolumeBackgroundViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_audioModuleController, a3);

  return v7;
}

- (void)loadView
{
  MRUVolumeBackgroundView *v3;
  MRUVolumeBackgroundView *v4;

  v3 = [MRUVolumeBackgroundView alloc];
  v4 = -[MRUVolumeBackgroundView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MRUVolumeBackgroundViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  id WeakRetained;
  void *v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MRUVolumeBackgroundViewController;
  -[MRUVolumeBackgroundViewController viewDidLoad](&v22, sel_viewDidLoad);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "volumeBackgroundViewControllerStylingProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeBackgroundViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStylingProvider:", v4);

  -[MRUVolumeBackgroundViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryListeningModeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_didTapPrimaryListeningModeButton_, 64);

  -[MRUVolumeBackgroundViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryListeningModeButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_primaryListeningModeButtonDidChangeValue_, 4096);

  -[MRUVolumeBackgroundViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryListeningModeButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_didTapSecondaryListeningModeButton_, 64);

  -[MRUVolumeBackgroundViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "secondaryListeningModeButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_secondaryListeningModeButtonDidChangeValue_, 4096);

  -[MRUVolumeBackgroundViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "spatialAudioModeButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_didTapSpatialAudioModeButton_, 64);

  -[MRUVolumeBackgroundViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "spatialAudioModeButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_spatialAudioModeButtonDidChangeValue_, 4096);

  -[MRUVolumeBackgroundViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conversationAwarenessButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_conversationAwarenessButtonDidChangeValue_, 4096);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_collapseExpandableButtons);
  objc_msgSend(v20, "setDelegate:", self);
  -[MRUVolumeBackgroundViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addGestureRecognizer:", v20);

  -[MRUAudioModuleController addObserver:](self->_audioModuleController, "addObserver:", self);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUVolumeBackgroundViewController;
  -[MRUVolumeBackgroundViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[MRUVolumeBackgroundViewController audioModuleController](self, "audioModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spatialAudioController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMonitoring");

  -[MRUVolumeBackgroundViewController updatePrimaryRouteView](self, "updatePrimaryRouteView");
  -[MRUVolumeBackgroundViewController updateSecondaryRouteView](self, "updateSecondaryRouteView");
  -[MRUVolumeBackgroundViewController updatePrimaryListeningModeButton](self, "updatePrimaryListeningModeButton");
  -[MRUVolumeBackgroundViewController updateSecondaryListeningModeButton](self, "updateSecondaryListeningModeButton");
  -[MRUVolumeBackgroundViewController updateSpatialAudioModeButton](self, "updateSpatialAudioModeButton");
  -[MRUVolumeBackgroundViewController updateNowPlaying](self, "updateNowPlaying");
  -[MRUVolumeBackgroundViewController updateConversationAwarenessButton](self, "updateConversationAwarenessButton");
  -[MRUVolumeBackgroundViewController updateVisibility](self, "updateVisibility");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUVolumeBackgroundViewController;
  -[MRUVolumeBackgroundViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[MRUVolumeBackgroundViewController collapseExpandableButtons](self, "collapseExpandableButtons");
  -[MRUVolumeBackgroundViewController audioModuleController](self, "audioModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spatialAudioController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopMonitoring");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setSystemVolumeValue:(float)a3
{
  void *v5;
  char v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  self->_systemVolumeValue = a3;
  -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSplitRoute");

  if ((v6 & 1) == 0)
  {
    *(float *)&v7 = a3;
    +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUVolumeBackgroundViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryAssetView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGlyphState:", v10);

  }
}

- (void)didTapPrimaryListeningModeButton:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__MRUVolumeBackgroundViewController_didTapPrimaryListeningModeButton___block_invoke;
  v6[3] = &unk_1E5818CB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);

}

void __70__MRUVolumeBackgroundViewController_didTapPrimaryListeningModeButton___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expandButton:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeBackgroundViewController:didUpdateSecondaryInteractionEnabled:", *(_QWORD *)(a1 + 32), 0);

}

- (void)primaryListeningModeButtonDidChangeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryListeningMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectedOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__MRUVolumeBackgroundViewController_primaryListeningModeButtonDidChangeValue___block_invoke;
  v12[3] = &unk_1E5819AF0;
  v13 = v4;
  v14 = v6;
  v10 = v6;
  v11 = v4;
  objc_msgSend(v9, "setPrimaryListeningMode:completion:", v8, v12);

}

void __78__MRUVolumeBackgroundViewController_primaryListeningModeButtonDidChangeValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v4, "playFailedValueChangedEventHapticWithMessage:", v3);
    if ((objc_msgSend(*(id *)(a1 + 32), "isTracking") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setSelectedListeningMode:animated:", *(_QWORD *)(a1 + 40), 1);
  }
  else if (objc_msgSend(v4, "isTracking"))
  {
    objc_msgSend(*(id *)(a1 + 32), "playValueChangedEventHaptic");
  }

}

- (void)didTapSecondaryListeningModeButton:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__MRUVolumeBackgroundViewController_didTapSecondaryListeningModeButton___block_invoke;
  v6[3] = &unk_1E5818CB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);

}

void __72__MRUVolumeBackgroundViewController_didTapSecondaryListeningModeButton___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expandButton:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeBackgroundViewController:didUpdatePrimaryInteractionEnabled:", *(_QWORD *)(a1 + 32), 0);

}

- (void)secondaryListeningModeButtonDidChangeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryListeningMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectedOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__MRUVolumeBackgroundViewController_secondaryListeningModeButtonDidChangeValue___block_invoke;
  v12[3] = &unk_1E5819AF0;
  v13 = v4;
  v14 = v6;
  v10 = v6;
  v11 = v4;
  objc_msgSend(v9, "setSecondaryListeningMode:completion:", v8, v12);

}

void __80__MRUVolumeBackgroundViewController_secondaryListeningModeButtonDidChangeValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v4, "playFailedValueChangedEventHapticWithMessage:", v3);
    if ((objc_msgSend(*(id *)(a1 + 32), "isTracking") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setSelectedListeningMode:animated:", *(_QWORD *)(a1 + 40), 1);
  }
  else if (objc_msgSend(v4, "isTracking"))
  {
    objc_msgSend(*(id *)(a1 + 32), "playValueChangedEventHaptic");
  }

}

- (void)didTapSpatialAudioModeButton:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__MRUVolumeBackgroundViewController_didTapSpatialAudioModeButton___block_invoke;
  v6[3] = &unk_1E5818CB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);

}

void __66__MRUVolumeBackgroundViewController_didTapSpatialAudioModeButton___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expandButton:", *(_QWORD *)(a1 + 40));

}

- (void)spatialAudioModeButtonDidChangeValue:(id)a3
{
  MRUAudioModuleController *audioModuleController;
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  audioModuleController = self->_audioModuleController;
  v5 = a3;
  -[MRUAudioModuleController spatialAudioController](audioModuleController, "spatialAudioController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectedMode:", v9);

  objc_msgSend(v5, "playValueChangedEventHaptic");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(v7, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D4C6D8]);

  objc_msgSend(v9, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D4C6C8]);

  +[MRUSystemOutputDeviceRouteController outputContextDescription](MRUSystemOutputDeviceRouteController, "outputContextDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D4C6D0]);

  v19 = MEMORY[0x1E0C809B0];
  v20 = v11;
  v15 = v11;
  MRAnalyticsSendEvent();
  v16 = (void *)MEMORY[0x1E0DDE8C0];
  v21[0] = MRUVolumeCARSpatialAudioClientKey;
  v21[1] = MRUVolumeCARSpatialAudioKey;
  v22[0] = MRUVolumeCARSpatialAudioClientValue;
  objc_msgSend(v9, "description", v19, 3221225472, __74__MRUVolumeBackgroundViewController_spatialAudioModeButtonDidChangeValue___block_invoke, &unk_1E58199D8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendSingleMessage:category:type:", v18, 8, 5);

}

id __74__MRUVolumeBackgroundViewController_spatialAudioModeButtonDidChangeValue___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)conversationAwarenessButtonDidChangeValue:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "selectedOptionIndex") != 0;
  -[MRUAudioModuleController conversationAwarenessController](self->_audioModuleController, "conversationAwarenessController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__MRUVolumeBackgroundViewController_conversationAwarenessButtonDidChangeValue___block_invoke;
  v8[3] = &unk_1E5819B18;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "setConversationAwarenessEnabled:completion:", v5, v8);

}

uint64_t __79__MRUVolumeBackgroundViewController_conversationAwarenessButtonDidChangeValue___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "playFailedValueChangedEventHapticWithMessage:", a2);
  result = objc_msgSend(v3, "isTracking");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "playValueChangedEventHaptic");
  return result;
}

- (CGRect)effectiveContentFrameForContainerFrame:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MRUVolumeBackgroundViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nowPlayingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;

  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectInset(v11, 0.0, v10 * -2.0);
}

- (void)audioModuleController:(id)a3 systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __115__MRUVolumeBackgroundViewController_audioModuleController_systemOutputDeviceRouteControllerDidUpdateOutputDevices___block_invoke;
  v4[3] = &unk_1E5818C88;
  v4[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v4, a4);
}

uint64_t __115__MRUVolumeBackgroundViewController_audioModuleController_systemOutputDeviceRouteControllerDidUpdateOutputDevices___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

- (void)audioModuleController:(id)a3 systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:(id)a4
{
  _QWORD v5[5];

  -[MRUVolumeBackgroundViewController updatePrimaryRouteView](self, "updatePrimaryRouteView", a3, a4);
  -[MRUVolumeBackgroundViewController updateSecondaryRouteView](self, "updateSecondaryRouteView");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __124__MRUVolumeBackgroundViewController_audioModuleController_systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties___block_invoke;
  v5[3] = &unk_1E5818C88;
  v5[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v5);
}

uint64_t __124__MRUVolumeBackgroundViewController_audioModuleController_systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeAvailablePrimaryListeningMode:(id)a5
{
  _QWORD v6[5];

  -[MRUVolumeBackgroundViewController updatePrimaryListeningModeButton](self, "updatePrimaryListeningModeButton", a3, a4, a5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __122__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeAvailablePrimaryListeningMode___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);
}

uint64_t __122__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeAvailablePrimaryListeningMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangePrimaryListeningMode:(id)a5
{
  _QWORD v6[5];

  -[MRUVolumeBackgroundViewController updatePrimaryListeningModeButton](self, "updatePrimaryListeningModeButton", a3, a4, a5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __113__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangePrimaryListeningMode___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);
}

uint64_t __113__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangePrimaryListeningMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeAvailableSecondaryListeningModes:(id)a5
{
  _QWORD v6[5];

  -[MRUVolumeBackgroundViewController updateSecondaryListeningModeButton](self, "updateSecondaryListeningModeButton", a3, a4, a5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __125__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeAvailableSecondaryListeningModes___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);
}

uint64_t __125__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeAvailableSecondaryListeningModes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

- (void)audioModuleController:(id)a3 listeningModeController:(id)a4 didChangeSecondaryListeningMode:(id)a5
{
  _QWORD v6[5];

  -[MRUVolumeBackgroundViewController updateSecondaryListeningModeButton](self, "updateSecondaryListeningModeButton", a3, a4, a5);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __115__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeSecondaryListeningMode___block_invoke;
  v6[3] = &unk_1E5818C88;
  v6[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v6);
}

uint64_t __115__MRUVolumeBackgroundViewController_audioModuleController_listeningModeController_didChangeSecondaryListeningMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  char v4;

  -[MRUVolumeBackgroundViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasExpandedButtons");

  return v4;
}

- (void)collapseExpandableButtons
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__MRUVolumeBackgroundViewController_collapseExpandableButtons__block_invoke;
  v2[3] = &unk_1E5818C88;
  v2[4] = self;
  -[MRUVolumeBackgroundViewController performLayoutWithAnimation:](self, "performLayoutWithAnimation:", v2);
}

void __62__MRUVolumeBackgroundViewController_collapseExpandableButtons__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapseExpandableButtons");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeBackgroundViewController:didUpdateSecondaryInteractionEnabled:", *(_QWORD *)(a1 + 32), 1);
  objc_msgSend(v3, "volumeBackgroundViewController:didUpdatePrimaryInteractionEnabled:", *(_QWORD *)(a1 + 32), 1);

}

- (void)updatePrimaryRouteView
{
  void *v3;
  int v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;

  -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSplitRoute");

  -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "primaryOutputDeviceAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVolumeBackgroundViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryAssetView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAsset:", v7);

    -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "primaryOutputDeviceRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "routeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVolumeBackgroundViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryAssetView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v11);

  }
  else
  {
    objc_msgSend(v5, "systemOutputDeviceAssetWithInCall");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVolumeBackgroundViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "primaryAssetView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAsset:", v14);

    -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "systemOutputDeviceRoute");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "routeName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVolumeBackgroundViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "primaryAssetView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:", v19);

    *(float *)&v22 = self->_systemVolumeValue;
    +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUVolumeBackgroundViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryAssetView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGlyphState:", v23);
  }

}

- (void)updateSecondaryRouteView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryOutputDeviceAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeBackgroundViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryAssetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsset:", v4);

  -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secondaryOutputDeviceRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeBackgroundViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryAssetView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v8);

}

- (void)updatePrimaryListeningModeButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MRUVolumeBackgroundViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryListeningModeButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isTracking") & 1) == 0)
  {
    -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availablePrimaryListeningModes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryListeningMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAvailableListeningModes:", v5);
    objc_msgSend(v9, "setSelectedListeningMode:animated:", v7, -[MRUVolumeBackgroundViewController _appearState](self, "_appearState") == 2);
    +[MRUStringsProvider listeningModeTitle](MRUStringsProvider, "listeningModeTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

  }
}

- (void)updateSecondaryListeningModeButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MRUVolumeBackgroundViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryListeningModeButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isTracking") & 1) == 0)
  {
    -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableSecondaryListeningModes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUAudioModuleController listeningModeController](self->_audioModuleController, "listeningModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondaryListeningMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAvailableListeningModes:", v5);
    objc_msgSend(v9, "setSelectedListeningMode:animated:", v7, -[MRUVolumeBackgroundViewController _appearState](self, "_appearState") == 2);
    +[MRUStringsProvider listeningModeTitle](MRUStringsProvider, "listeningModeTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

  }
}

- (void)updateConversationAwarenessButton
{
  void *v3;
  void *v4;
  void *v5;
  MediaControlsExpandableButtonOption *v6;
  void *v7;
  void *v8;
  MediaControlsExpandableButtonOption *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[MRUVolumeBackgroundViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationAwarenessButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUAudioModuleController conversationAwarenessController](self->_audioModuleController, "conversationAwarenessController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "isConversationAwarenessEnabled");

  v6 = objc_alloc_init(MediaControlsExpandableButtonOption);
  +[MRUAsset symbolNamed:](MRUAsset, "symbolNamed:", CFSTR("person.wave.2.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsExpandableButtonOption setAsset:](v6, "setAsset:", v7);

  +[MRUStringsProvider conversationAwarenessOff](MRUStringsProvider, "conversationAwarenessOff");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsExpandableButtonOption setTitle:](v6, "setTitle:", v8);

  v9 = objc_alloc_init(MediaControlsExpandableButtonOption);
  +[MRUAsset symbolNamed:](MRUAsset, "symbolNamed:", CFSTR("person.wave.2.fill"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsExpandableButtonOption setAsset:](v9, "setAsset:", v10);

  -[MediaControlsExpandableButtonOption setSelectedState:](v9, "setSelectedState:", CFSTR("On"));
  +[MRUStringsProvider conversationAwarenessOn](MRUStringsProvider, "conversationAwarenessOn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsExpandableButtonOption setTitle:](v9, "setTitle:", v11);

  -[MediaControlsExpandableButtonOption setSelectedBackground:](v9, "setSelectedBackground:", 2);
  +[MRUStringsProvider conversationAwarenessTitle](MRUStringsProvider, "conversationAwarenessTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v12);

  v14[0] = v6;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v13);

  objc_msgSend(v4, "setSelectedOptionIndex:", v3);
}

- (MRUAudioModuleController)audioModuleController
{
  return self->_audioModuleController;
}

- (MRUVolumeBackgroundViewControllerDelegate)delegate
{
  return (MRUVolumeBackgroundViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)systemVolumeValue
{
  return self->_systemVolumeValue;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioModuleController, 0);
}

@end
