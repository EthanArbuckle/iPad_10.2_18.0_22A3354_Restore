@implementation CSCoverSheetTransitionsSettings

- (void)setDefaultValuesForBaseConfiguration
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
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");

  -[CSCoverSheetTransitionsSettings setTension:](self, "setTension:", 300.0);
  -[CSCoverSheetTransitionsSettings setFriction:](self, "setFriction:", 34.0);
  -[CSCoverSheetTransitionsSettings setInPlaceTension:](self, "setInPlaceTension:", 61.68503);
  -[CSCoverSheetTransitionsSettings setInPlaceFriction:](self, "setInPlaceFriction:", 15.70796);
  -[CSCoverSheetTransitionsSettings sameWallpaperInitialTransitionSettings](self, "sameWallpaperInitialTransitionSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValues");
  objc_msgSend(v4, "setOrientPanelWallpaper:", 0);
  objc_msgSend(v4, "setBlursPanel:", 0);
  objc_msgSend(v4, "setFloatingLayerAsWallpaperOverlay:", 1);

  -[CSCoverSheetTransitionsSettings differentWallpaperInitialTransitionSettings](self, "differentWallpaperInitialTransitionSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultValues");
  objc_msgSend(v5, "setPanelWallpaper:", 1);

  -[CSCoverSheetTransitionsSettings sameWallpaperSubsequentTransitionSettings](self, "sameWallpaperSubsequentTransitionSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");
  objc_msgSend(v6, "setOrientPanelWallpaper:", 0);
  objc_msgSend(v6, "setFloatingLayerAsWallpaperOverlay:", 1);

  -[CSCoverSheetTransitionsSettings differentWallpaperSubsequentTransitionSettings](self, "differentWallpaperSubsequentTransitionSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultValues");
  objc_msgSend(v7, "setPanelWallpaper:", 1);

  -[CSCoverSheetTransitionsSettings overAppTransitionSettings](self, "overAppTransitionSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultValues");
  objc_msgSend(v8, "setPanelWallpaper:", 1);
  objc_msgSend(v8, "setFloatingLayerAsWallpaperOverlay:", 1);
  objc_msgSend(v8, "setRevealWallpaper:", 1);
  objc_msgSend(v8, "setIconsFlyIn:", 0);

  -[CSCoverSheetTransitionsSettings captureExtensionToAppTransitionSettings](self, "captureExtensionToAppTransitionSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultValues");
  objc_msgSend(v9, "setIconsFlyIn:", 0);
  objc_msgSend(v9, "setTransitionStyle:", 1);
  objc_msgSend(v9, "setFadesCoverSheetContent:", 1);
  objc_msgSend(v9, "setDarkensContent:", 0);
  objc_msgSend(v9, "setFadesContent:", 0);
  objc_msgSend(v9, "setBlursPanel:", 0);

  -[CSCoverSheetTransitionsSettings overLandscapeTransitionSettings](self, "overLandscapeTransitionSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValues");
  objc_msgSend(v10, "setBlursPanel:", 0);
  objc_msgSend(v10, "setPanelWallpaper:", 1);
  objc_msgSend(v10, "setTrackingWallpaper:", 1);
  objc_msgSend(v10, "setRevealWallpaper:", 1);
  objc_msgSend(v10, "setFadesContent:", 0);
  objc_msgSend(v10, "setIconsFlyIn:", 0);

  -[CSCoverSheetTransitionsSettings inactiveOverHomescreenTransitionSettings](self, "inactiveOverHomescreenTransitionSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDefaultValues");
  objc_msgSend(v11, "setTransitionStyle:", 1);
  objc_msgSend(v11, "setBlursPanel:", 0);
  objc_msgSend(v11, "setBlursBehindCoverSheet:", 1);
  objc_msgSend(v11, "setBehindCoverSheetBlurRadius:", 50.0);
  objc_msgSend(v11, "setPanelWallpaper:", 1);
  objc_msgSend(v11, "setOrientPanelWallpaper:", 1);
  objc_msgSend(v11, "setFadePanelWallpaper:", 1);
  objc_msgSend(v11, "setFadesContent:", 0);
  objc_msgSend(v11, "setFadesCoverSheetContent:", 1);
  objc_msgSend(v11, "setFadesCoverSheetContentStart:", 0.8);
  objc_msgSend(v11, "setFadesCoverSheetContentEnd:", 1.0);
  objc_msgSend(v11, "setAlwaysFadesCoverSheetContent:", 0);

  -[CSCoverSheetTransitionsSettings inactiveOverAppTransitionSettings](self, "inactiveOverAppTransitionSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDefaultValues");
  -[CSCoverSheetTransitionsSettings inactiveOverHomescreenTransitionSettings](self, "inactiveOverHomescreenTransitionSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySettings:", v13);

  objc_msgSend(v12, "setUsesFixedWallpaperPresentationProgress:", 1);
  objc_msgSend(v12, "setFixedWallpaperPresentationProgress:", 0.0);

  -[CSCoverSheetTransitionsSettings flyInSettings](self, "flyInSettings");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDefaultValues");

}

- (void)setDefaultValuesForParallaxOnly
{
  uint64_t v3;
  uint64_t v4;

  -[CSCoverSheetTransitionsSettings setDefaultValuesForBaseConfiguration](self, "setDefaultValuesForBaseConfiguration");
  v3 = MEMORY[0x1E0C9AAA0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], CFSTR("differentWallpaperInitialTransitionSettings.blursPanel"));
  v4 = MEMORY[0x1E0C9AAB0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("differentWallpaperInitialTransitionSettings.panelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("differentWallpaperInitialTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87AF0, CFSTR("differentWallpaperInitialTransitionSettings.trackingWallpaperParallaxFactor"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperInitialTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperInitialTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("differentWallpaperSubsequentTransitionSettings.panelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("differentWallpaperSubsequentTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87AF0, CFSTR("differentWallpaperSubsequentTransitionSettings.trackingWallpaperParallaxFactor"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("overAppTransitionSettings.panelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("overAppTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87AF0, CFSTR("overAppTransitionSettings.trackingWallpaperParallaxFactor"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.fadesContent"));
}

- (void)setDefaultValuesForBlurOnly
{
  uint64_t v3;
  uint64_t v4;

  -[CSCoverSheetTransitionsSettings setDefaultValuesForBaseConfiguration](self, "setDefaultValuesForBaseConfiguration");
  v3 = MEMORY[0x1E0C9AAB0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("differentWallpaperInitialTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperInitialTransitionSettings.panelWallpaper"));
  v4 = MEMORY[0x1E0C9AAA0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], CFSTR("differentWallpaperInitialTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperInitialTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("differentWallpaperInitialTransitionSettings.fadePanelWallpaperStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B10, CFSTR("differentWallpaperInitialTransitionSettings.fadePanelWallpaperEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperInitialTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("differentWallpaperInitialTransitionSettings.contentFadeStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B20, CFSTR("differentWallpaperInitialTransitionSettings.contentFadeEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.panelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("differentWallpaperSubsequentTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("differentWallpaperSubsequentTransitionSettings.fadePanelWallpaperStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B10, CFSTR("differentWallpaperSubsequentTransitionSettings.fadePanelWallpaperEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("differentWallpaperSubsequentTransitionSettings.contentFadeStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B20, CFSTR("differentWallpaperSubsequentTransitionSettings.contentFadeEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.panelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("overAppTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("overAppTransitionSettings.fadePanelWallpaperStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B10, CFSTR("overAppTransitionSettings.fadePanelWallpaperEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B30, CFSTR("overAppTransitionSettings.contentFadeStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B30, CFSTR("overAppTransitionSettings.contentFadeEnd"));
}

- (void)setDefaultValuesForParallaxAndBlur
{
  void *v2;
  uint64_t v4;
  void *v5;
  int v6;
  char v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  char v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  char v19;
  _BOOL8 v20;
  void *v21;

  -[CSCoverSheetTransitionsSettings setDefaultValuesForBaseConfiguration](self, "setDefaultValuesForBaseConfiguration");
  v4 = MEMORY[0x1E0C9AAB0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("differentWallpaperInitialTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("differentWallpaperInitialTransitionSettings.panelWallpaper"));
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    v8 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v2, "userInterfaceIdiom") == 1;
  }
  objc_msgSend(v5, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v9, CFSTR("differentWallpaperInitialTransitionSettings.trackingWallpaper"));

  if ((v7 & 1) == 0)
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87AF0, CFSTR("differentWallpaperInitialTransitionSettings.trackingWallpaperParallaxFactor"));
  v10 = MEMORY[0x1E0C9AAB0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("differentWallpaperInitialTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("differentWallpaperInitialTransitionSettings.fadePanelWallpaperStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B10, CFSTR("differentWallpaperInitialTransitionSettings.fadePanelWallpaperEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v10, CFSTR("differentWallpaperInitialTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("differentWallpaperInitialTransitionSettings.contentFadeStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B20, CFSTR("differentWallpaperInitialTransitionSettings.contentFadeEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v10, CFSTR("differentWallpaperSubsequentTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v10, CFSTR("differentWallpaperSubsequentTransitionSettings.panelWallpaper"));
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = __sb__runningInSpringBoard();
  v13 = v12;
  if (v12)
  {
    v14 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v2, "userInterfaceIdiom") == 1;
  }
  objc_msgSend(v11, "numberWithInt:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v15, CFSTR("differentWallpaperSubsequentTransitionSettings.trackingWallpaper"));

  if ((v13 & 1) == 0)
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87AF0, CFSTR("differentWallpaperSubsequentTransitionSettings.trackingWallpaperParallaxFactor"));
  v16 = MEMORY[0x1E0C9AAB0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("differentWallpaperSubsequentTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("differentWallpaperSubsequentTransitionSettings.fadePanelWallpaperStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B10, CFSTR("differentWallpaperSubsequentTransitionSettings.fadePanelWallpaperEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v16, CFSTR("differentWallpaperSubsequentTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("differentWallpaperSubsequentTransitionSettings.contentFadeStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B20, CFSTR("differentWallpaperSubsequentTransitionSettings.contentFadeEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v16, CFSTR("overAppTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v16, CFSTR("overAppTransitionSettings.panelWallpaper"));
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = __sb__runningInSpringBoard();
  v19 = v18;
  if (v18)
  {
    v20 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v2, "userInterfaceIdiom") == 1;
  }
  objc_msgSend(v17, "numberWithInt:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v21, CFSTR("overAppTransitionSettings.trackingWallpaper"));

  if ((v19 & 1) == 0)
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87AF0, CFSTR("overAppTransitionSettings.trackingWallpaperParallaxFactor"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("overAppTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("overAppTransitionSettings.fadePanelWallpaperStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B10, CFSTR("overAppTransitionSettings.fadePanelWallpaperEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], CFSTR("overAppTransitionSettings.fadesContent"));
}

- (void)setDefaultValuesForFadeAndScale
{
  uint64_t v3;
  uint64_t v4;

  -[CSCoverSheetTransitionsSettings setDefaultValuesForBaseConfiguration](self, "setDefaultValuesForBaseConfiguration");
  v3 = MEMORY[0x1E0C9AAA0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], CFSTR("sameWallpaperSubsequentTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("sameWallpaperSubsequentTransitionSettings.panelWallpaper"));
  v4 = MEMORY[0x1E0C9AAB0];
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("sameWallpaperSubsequentTransitionSettings.scaleWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("sameWallpaperSubsequentTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("sameWallpaperSubsequentTransitionSettings.darkensContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("sameWallpaperSubsequentTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("sameWallpaperSubsequentTransitionSettings.orientPanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("sameWallpaperSubsequentTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("sameWallpaperSubsequentTransitionSettings.fadesCoverSheetContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.panelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("differentWallpaperSubsequentTransitionSettings.scaleWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.fadesContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.darkensContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("differentWallpaperSubsequentTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("differentWallpaperSubsequentTransitionSettings.fadesCoverSheetContent"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.blursPanel"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("overAppTransitionSettings.panelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("overAppTransitionSettings.trackingWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87AF0, CFSTR("overAppTransitionSettings.trackingWallpaperParallaxFactor"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v4, CFSTR("overAppTransitionSettings.fadePanelWallpaper"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B00, CFSTR("overAppTransitionSettings.fadePanelWallpaperStart"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", &unk_1E8E87B10, CFSTR("overAppTransitionSettings.fadePanelWallpaperEnd"));
  -[CSCoverSheetTransitionsSettings setValue:forKeyPath:](self, "setValue:forKeyPath:", v3, CFSTR("overAppTransitionSettings.fadesContent"));
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[5];
  void *v45;
  _QWORD v46[4];
  void *v47;
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tension"), CFSTR("tension"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Friction"), CFSTR("friction"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("In-Place Tension"), CFSTR("inPlaceTension"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("In-Place Friction"), CFSTR("inPlaceFriction"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v48[0] = v40;
  v48[1] = v39;
  v48[2] = v38;
  v48[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Fly In"), CFSTR("flyInSettings"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v47 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke;
  v41[3] = &unk_1E8E2DE30;
  v42 = &unk_1E8E896B8;
  v43 = v6;
  v34 = v6;
  objc_msgSend(&unk_1E8E896A0, "enumerateObjectsUsingBlock:", v41);
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:action:", CFSTR("Parallax Only"), v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_159);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:action:", CFSTR("Blur Only"), v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_162);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:action:", CFSTR("Parallax And Blur"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_165);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:action:", CFSTR("Fade and Scale"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83078];
  v46[0] = v31;
  v46[1] = v30;
  v46[2] = v13;
  v46[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionWithRows:title:", v18, CFSTR("Presets"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  v21 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:action:", CFSTR("Restore Defaults"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v44[0] = v35;
  v44[1] = v33;
  v44[2] = v32;
  v44[3] = v19;
  v44[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "moduleWithTitle:contents:", CFSTR("CoverSheet Transitions"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

void __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

uint64_t __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValuesForParallaxOnly");

  return 1;
}

uint64_t __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValuesForBlurOnly");

  return 1;
}

uint64_t __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValuesForParallaxAndBlur");

  return 1;
}

uint64_t __59__CSCoverSheetTransitionsSettings_settingsControllerModule__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValuesForFadeAndScale");

  return 1;
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (CSCoverSheetFlyInSettings)flyInSettings
{
  return self->_flyInSettings;
}

- (void)setFlyInSettings:(id)a3
{
  objc_storeStrong((id *)&self->_flyInSettings, a3);
}

- (CSCoverSheetTransitionSettings)sameWallpaperInitialTransitionSettings
{
  return self->_sameWallpaperInitialTransitionSettings;
}

- (void)setSameWallpaperInitialTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sameWallpaperInitialTransitionSettings, a3);
}

- (CSCoverSheetTransitionSettings)differentWallpaperInitialTransitionSettings
{
  return self->_differentWallpaperInitialTransitionSettings;
}

- (void)setDifferentWallpaperInitialTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_differentWallpaperInitialTransitionSettings, a3);
}

- (CSCoverSheetTransitionSettings)sameWallpaperSubsequentTransitionSettings
{
  return self->_sameWallpaperSubsequentTransitionSettings;
}

- (void)setSameWallpaperSubsequentTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sameWallpaperSubsequentTransitionSettings, a3);
}

- (CSCoverSheetTransitionSettings)differentWallpaperSubsequentTransitionSettings
{
  return self->_differentWallpaperSubsequentTransitionSettings;
}

- (void)setDifferentWallpaperSubsequentTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_differentWallpaperSubsequentTransitionSettings, a3);
}

- (CSCoverSheetTransitionSettings)overAppTransitionSettings
{
  return self->_overAppTransitionSettings;
}

- (void)setOverAppTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_overAppTransitionSettings, a3);
}

- (CSCoverSheetTransitionSettings)captureExtensionToAppTransitionSettings
{
  return self->_captureExtensionToAppTransitionSettings;
}

- (void)setCaptureExtensionToAppTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_captureExtensionToAppTransitionSettings, a3);
}

- (CSCoverSheetTransitionSettings)overLandscapeTransitionSettings
{
  return self->_overLandscapeTransitionSettings;
}

- (void)setOverLandscapeTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_overLandscapeTransitionSettings, a3);
}

- (CSCoverSheetTransitionSettings)inactiveOverAppTransitionSettings
{
  return self->_inactiveOverAppTransitionSettings;
}

- (void)setInactiveOverAppTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveOverAppTransitionSettings, a3);
}

- (CSCoverSheetTransitionSettings)inactiveOverHomescreenTransitionSettings
{
  return self->_inactiveOverHomescreenTransitionSettings;
}

- (void)setInactiveOverHomescreenTransitionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveOverHomescreenTransitionSettings, a3);
}

- (double)inPlaceTension
{
  return self->_inPlaceTension;
}

- (void)setInPlaceTension:(double)a3
{
  self->_inPlaceTension = a3;
}

- (double)inPlaceFriction
{
  return self->_inPlaceFriction;
}

- (void)setInPlaceFriction:(double)a3
{
  self->_inPlaceFriction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveOverHomescreenTransitionSettings, 0);
  objc_storeStrong((id *)&self->_inactiveOverAppTransitionSettings, 0);
  objc_storeStrong((id *)&self->_overLandscapeTransitionSettings, 0);
  objc_storeStrong((id *)&self->_captureExtensionToAppTransitionSettings, 0);
  objc_storeStrong((id *)&self->_overAppTransitionSettings, 0);
  objc_storeStrong((id *)&self->_differentWallpaperSubsequentTransitionSettings, 0);
  objc_storeStrong((id *)&self->_sameWallpaperSubsequentTransitionSettings, 0);
  objc_storeStrong((id *)&self->_differentWallpaperInitialTransitionSettings, 0);
  objc_storeStrong((id *)&self->_sameWallpaperInitialTransitionSettings, 0);
  objc_storeStrong((id *)&self->_flyInSettings, 0);
}

@end
