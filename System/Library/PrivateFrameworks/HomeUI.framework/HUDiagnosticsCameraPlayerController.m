@implementation HUDiagnosticsCameraPlayerController

- (HUDiagnosticsCameraPlayerController)initWithCameraPlayerViewController:(id)a3 playbackEngine:(id)a4 clipScrubberDataSource:(id)a5 cameraProfile:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HUDiagnosticsCameraPlayerController *v14;
  HUDiagnosticsCameraPlayerController *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HUDiagnosticsCameraPlayerController;
  v14 = -[HUDiagnosticsCameraPlayerController init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_cameraPlayerViewController, v10);
    objc_storeWeak((id *)&v15->_playbackEngine, v11);
    objc_storeWeak((id *)&v15->_clipScrubberDataSource, v12);
    objc_storeStrong((id *)&v15->_cameraProfile, a6);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4B8]), "initWithDelegate:", v15);
    WeakRetained = objc_loadWeakRetained((id *)&v15->_cameraPlayerViewController);
    objc_msgSend(WeakRetained, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addInteraction:", v16);

  }
  return v15;
}

- (void)updateWithPlaybackEngine:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUDiagnosticsCameraPlayerController diagnosticsView](self, "diagnosticsView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithPlaybackEngine:", v4);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0CEA4B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E6F54738;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  id WeakRetained;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEA2A8];
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("house.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", CFSTR("Home Settings"), v5, 0, &__block_literal_global_113);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA2A8];
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("house"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", CFSTR("HomeKit Settings"), v8, 0, &__block_literal_global_17_2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "diagnosticsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("Hide Inspector");
  if (!v12)
    v13 = CFSTR("Show Inspector");
  v14 = v13;

  objc_msgSend(WeakRetained, "diagnosticsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("magnifyingglass.circle.fill");
  if (!v15)
    v16 = CFSTR("magnifyingglass.circle");
  v17 = v16;

  v18 = (void *)MEMORY[0x1E0CEA2A8];
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
  v25[3] = &unk_1E6F54710;
  objc_copyWeak(&v26, v10);
  objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v14, v19, 0, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CEA740];
  v27[0] = v20;
  v27[1] = v6;
  v27[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "menuWithTitle:children:", &stru_1E6F60E80, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v26);
  return v23;
}

void __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=INTERNAL_SETTINGS&path=Home"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "openURL:", v2);

}

void __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=INTERNAL_SETTINGS&path=HomeKit"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "openURL:", v2);

}

void __93__HUDiagnosticsCameraPlayerController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "diagnosticsView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "diagnosticsView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(WeakRetained, "setDiagnosticsView:", 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "launchPlaybackEngineDiagnosticsView");
  }

}

- (void)launchPlaybackEngineDiagnosticsView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  HUDiagnosticsCameraTimelineView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[HUDiagnosticsCameraPlayerController cameraPlayerViewController](self, "cameraPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5 + -330.0;
  -[HUDiagnosticsCameraPlayerController cameraPlayerViewController](self, "cameraPlayerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = -[HUDiagnosticsCameraTimelineView initWithFrame:]([HUDiagnosticsCameraTimelineView alloc], "initWithFrame:", 0.0, v6, v10, 160.0);
  -[HUDiagnosticsCameraPlayerController setDiagnosticsView:](self, "setDiagnosticsView:", v11);

  -[HUDiagnosticsCameraPlayerController diagnosticsView](self, "diagnosticsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOverrideUserInterfaceStyle:", 2);

  -[HUDiagnosticsCameraPlayerController cameraPlayerViewController](self, "cameraPlayerViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "customControlsView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraPlayerController diagnosticsView](self, "diagnosticsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[HUDiagnosticsCameraPlayerController diagnosticsView](self, "diagnosticsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moreButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_displayDiagnosticDetails, 64);

  -[HUDiagnosticsCameraPlayerController diagnosticsView](self, "diagnosticsView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraPlayerController playbackEngine](self, "playbackEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateWithPlaybackEngine:", v18);

}

- (void)displayDiagnosticDetails
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HUDiagnosticsCameraClipViewController *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HUDiagnosticsReachabilityEventViewController *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  -[HUDiagnosticsCameraPlayerController clipScrubberDataSource](self, "clipScrubberDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containerType");

  if (v5 != 1)
  {
    v15 = objc_opt_class();
    -[HUDiagnosticsCameraPlayerController clipScrubberDataSource](self, "clipScrubberDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentEvent");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v29 = v17;
      if (v18)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class());

    }
    v29 = 0;
LABEL_17:

    v21 = [HUDiagnosticsReachabilityEventViewController alloc];
    -[HUDiagnosticsCameraPlayerController cameraProfile](self, "cameraProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUDiagnosticsReachabilityEventViewController initWithReachabilityEvent:cameraProfile:](v21, "initWithReachabilityEvent:cameraProfile:", v29, v13);
    goto LABEL_18;
  }
  v6 = objc_opt_class();
  -[HUDiagnosticsCameraPlayerController clipScrubberDataSource](self, "clipScrubberDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentEvent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v29 = v8;
    if (v9)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

  }
  v29 = 0;
LABEL_9:

  v12 = [HUDiagnosticsCameraClipViewController alloc];
  -[HUDiagnosticsCameraPlayerController cameraProfile](self, "cameraProfile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUDiagnosticsCameraClipViewController initWithRecordingEvent:cameraProfile:](v12, "initWithRecordingEvent:cameraProfile:", v29, v13);
LABEL_18:
  v22 = (void *)v14;

  v23 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithTitle:style:target:action:", v24, 2, self, sel_dismissDiagnosticDetails);
  objc_msgSend(v22, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLeftBarButtonItem:", v25);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v22);
  -[HUDiagnosticsCameraPlayerController cameraPlayerViewController](self, "cameraPlayerViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "presentViewController:animated:completion:", v27, 1, 0);

}

- (void)dismissDiagnosticDetails
{
  id v2;

  -[HUDiagnosticsCameraPlayerController cameraPlayerViewController](self, "cameraPlayerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)dismissDetailsViewController
{
  id v2;

  -[HUDiagnosticsCameraPlayerController cameraPlayerViewController](self, "cameraPlayerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (AVPlayerViewController)cameraPlayerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_cameraPlayerViewController);
}

- (void)setCameraPlayerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_cameraPlayerViewController, a3);
}

- (HUDiagnosticsCameraTimelineView)diagnosticsView
{
  return self->_diagnosticsView;
}

- (void)setDiagnosticsView:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsView, a3);
}

- (HUClipScrubberDataSource)clipScrubberDataSource
{
  return (HUClipScrubberDataSource *)objc_loadWeakRetained((id *)&self->_clipScrubberDataSource);
}

- (void)setClipScrubberDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_clipScrubberDataSource, a3);
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return (HFCameraPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_destroyWeak((id *)&self->_clipScrubberDataSource);
  objc_storeStrong((id *)&self->_diagnosticsView, 0);
  objc_destroyWeak((id *)&self->_cameraPlayerViewController);
}

@end
