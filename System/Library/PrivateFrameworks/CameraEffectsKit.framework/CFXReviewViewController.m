@implementation CFXReviewViewController

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[CFXApplicationState beginMonitoringApplicationState](CFXApplicationState, "beginMonitoringApplicationState");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSuiteNamed:", CFSTR("com.apple.MobileSMS"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE79108];
  v7[0] = &unk_24EE9B9C0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v4);

  +[CFXEffect setupFactoryDelegate](CFXEffect, "setupFactoryDelegate");
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXMediaSettings setProviderDelegate:](JFXMediaSettings, "setProviderDelegate:", v5);

}

- (CFXReviewViewController)initWithMediaItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_group_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CFXReviewViewController;
  v6 = -[CFXReviewViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    +[CFXEffectHostAppDelegate sharedInstance](CFXEffectHostAppDelegate, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColorSpaceDelegate:", v6);

    dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v8, &__block_literal_global);

    objc_storeStrong((id *)v6 + 127, a3);
    v9 = dispatch_group_create();
    v10 = (void *)*((_QWORD *)v6 + 128);
    *((_QWORD *)v6 + 128) = v9;

    *((_BYTE *)v6 + 968) = 0;
    *((_QWORD *)v6 + 129) = 0;
    *((_QWORD *)v6 + 131) = objc_msgSend(v5, "cameraMode");
    objc_msgSend(v5, "originalAssetURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadataURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "type");
    dispatch_group_enter(*((dispatch_group_t *)v6 + 128));
    dispatch_get_global_queue(21, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __45__CFXReviewViewController_initWithMediaItem___block_invoke_2;
    v18[3] = &unk_24EE57B38;
    v19 = v12;
    v21 = v11;
    v22 = v13;
    v20 = v6;
    v15 = v11;
    v16 = v12;
    dispatch_async(v14, v18);

  }
  return (CFXReviewViewController *)v6;
}

uint64_t __45__CFXReviewViewController_initWithMediaItem___block_invoke()
{
  return +[CFXEffect initEffectRegistry](CFXEffect, "initEffectRegistry");
}

void __45__CFXReviewViewController_initWithMediaItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CGImageSource *v4;
  CGImageSource *v5;
  CFDictionaryRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __45__CFXReviewViewController_initWithMediaItem___block_invoke_3;
    v19[3] = &unk_24EE57B10;
    v20 = *(id *)(a1 + 40);
    +[JFXVideoWriter META_metadataForVideo:completion:](JFXVideoWriter, "META_metadataForVideo:completion:", v2, v19);

  }
  else
  {
    if (!*(_QWORD *)(a1 + 56))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = CGImageSourceCreateWithURL(*(CFURLRef *)(a1 + 48), 0);
      if (v4)
      {
        v5 = v4;
        v6 = CGImageSourceCopyPropertiesAtIndex(v4, 0, 0);
        if (v6)
        {
          v7 = *MEMORY[0x24BDD9470];
          v8 = *MEMORY[0x24BDD9440];
          v9 = *MEMORY[0x24BDD96E8];
          v10 = *MEMORY[0x24BDD9710];
          v11 = v6;
          -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(v3 + 968) = objc_msgSend(v13, "isEqualToString:", CFSTR("Generated in Camera Effects"));
          -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15
            && (objc_msgSend(v14, "objectForKeyedSubscript:", v10),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "unsignedIntValue"),
                v16,
                (v17 - 1) <= 7))
          {
            v18 = qword_226AB6DF8[v17 - 1];
          }
          else
          {
            v18 = 0;
          }
          *(_QWORD *)(v3 + 1032) = v18;
          CFRelease(v11);

        }
        CFRelease(v5);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 1024));
  }
}

void __45__CFXReviewViewController_initWithMediaItem___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  BOOL v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a2)
    v5 = a3 == 0;
  else
    v5 = 1;
  v6 = !v5;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = v6;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032) = a3;
  v7 = objc_msgSend(a4, "copy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1040);
  *(_QWORD *)(v8 + 1040) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 1024));
}

- (void)loadView
{
  JFXPassThroughContainerView *v3;
  void *v4;
  JFXPassThroughContainerView *v5;

  v3 = [JFXPassThroughContainerView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[JFXPassThroughContainerView initWithFrame:](v3, "initWithFrame:");

  -[CFXReviewViewController setView:](self, "setView:", v5);
}

- (void)viewDidLoad
{
  CFXStageManagerWarningViewController *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXReviewViewController;
  -[CFXReviewViewController viewDidLoad](&v4, sel_viewDidLoad);
  if (!+[JFXOrientationMonitor initialized](JFXOrientationMonitor, "initialized"))
    +[JFXOrientationMonitor initializeWithViewController:](JFXOrientationMonitor, "initializeWithViewController:", self);
  -[CFXReviewViewController CFX_resetAndLoadPreviewViewController](self, "CFX_resetAndLoadPreviewViewController");
  v3 = objc_alloc_init(CFXStageManagerWarningViewController);
  -[UIViewController jfxAddChildViewController:](self, "jfxAddChildViewController:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXReviewViewController;
  -[CFXReviewViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CFXReviewViewController;
  -[CFXReviewViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[5];
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  height = a3.height;
  width = a3.width;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CFXReviewViewController;
  -[CFXReviewViewController viewWillTransitionToSize:withTransitionCoordinator:](&v27, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  CFXLog_action();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewClip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "effectStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("device rotated"), CFSTR("post-capture"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v12;
    _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "userInterfaceIdiom"))
    goto LABEL_6;
  -[CFXReviewViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomControlsSnapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomControlsCenter");
    v19 = v18;
    v21 = v20;
    -[CFXReviewViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "subviews");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    v25[4] = self;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __78__CFXReviewViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v26[3] = &unk_24EE57B60;
    v26[4] = self;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __78__CFXReviewViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v25[3] = &unk_24EE57B60;
    -[UIViewController displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:](self, "displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:", v16, v24, 0, v7, v26, v25, v19, v21, width, height);

LABEL_6:
  }

}

void __78__CFXReviewViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "internalPreviewViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hideBottomControls");

}

void __78__CFXReviewViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "internalPreviewViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showBottomControls");

}

- (NSData)adjustmentsData
{
  void *v2;
  void *v3;

  -[CFXReviewViewController mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustmentsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (UIView)effectsPickerDrawer
{
  void *v3;
  void *v4;

  -[CFXReviewViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectsPickerDrawer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CFXReviewViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffectsPickerDrawer:", v4);

  if (!v4)
  {
    -[CFXReviewViewController effectBrowserViewController](self, "effectBrowserViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CFXReviewViewController effectBrowserViewController](self, "effectBrowserViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "jfxRemoveFromParentViewController");

      -[CFXReviewViewController setEffectBrowserViewController:](self, "setEffectBrowserViewController:", 0);
    }
  }
}

- (BOOL)mediaCapturedInFunCam
{
  NSObject *v3;
  dispatch_time_t v4;
  intptr_t v5;
  NSObject *v6;

  -[CFXReviewViewController metadataReaderGroup](self, "metadataReaderGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 5000000000);
  v5 = dispatch_group_wait(v3, v4);

  if (v5)
  {
    JFXLog_playback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CFXReviewViewController mediaCapturedInFunCam].cold.1();

  }
  return -[CFXReviewViewController mediaCapturedInFunCam_metadata](self, "mediaCapturedInFunCam_metadata");
}

- (int64_t)mediaCaptureDevicePosition
{
  NSObject *v3;
  dispatch_time_t v4;
  intptr_t v5;
  NSObject *v6;

  -[CFXReviewViewController metadataReaderGroup](self, "metadataReaderGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 5000000000);
  v5 = dispatch_group_wait(v3, v4);

  if (v5)
  {
    JFXLog_playback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CFXReviewViewController mediaCaptureDevicePosition].cold.1();

  }
  return -[CFXMediaItem cameraPosition](self->_mediaItem, "cameraPosition");
}

- (int64_t)calculateMediaInterfaceOrientationForDisplay
{
  NSObject *v3;
  dispatch_time_t v4;
  intptr_t v5;
  NSObject *v6;

  -[CFXReviewViewController metadataReaderGroup](self, "metadataReaderGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 5000000000);
  v5 = dispatch_group_wait(v3, v4);

  if (v5)
  {
    JFXLog_playback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CFXReviewViewController calculateMediaInterfaceOrientationForDisplay].cold.1();

  }
  return -[CFXReviewViewController mediaInterfaceOrientationForDisplay_metadata](self, "mediaInterfaceOrientationForDisplay_metadata");
}

- (NSData)animojiMetadata
{
  NSObject *v3;
  dispatch_time_t v4;
  intptr_t v5;
  NSObject *v6;

  -[CFXReviewViewController metadataReaderGroup](self, "metadataReaderGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, 5000000000);
  v5 = dispatch_group_wait(v3, v4);

  if (v5)
  {
    JFXLog_playback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CFXReviewViewController animojiMetadata].cold.1();

  }
  -[CFXReviewViewController animojiMetadata_metadata](self, "animojiMetadata_metadata");
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)exportMediaItemToFileURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exportMediaItemToFileURL:", v4);

}

- (BOOL)mediaItemRequiresExport
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CFXReviewViewController mediaCapturedInFunCam](self, "mediaCapturedInFunCam"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "effectStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

- (void)effectBrowserViewController:(id)a3 didDismissPickerForEffectType:(id)a4
{
  id v5;

  if (objc_msgSend(a4, "jtEffectType", a3) == 1)
  {
    -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentingFilterPicker:", 0);

  }
}

- (void)effectBrowserViewController:(id)a3 didDropOverlayEffect:(id)a4 atScreenLocation:(CGPoint)a5 atScreenSize:(CGSize)a6 rotationAngle:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;

  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v13 = a4;
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOverlayEffect:atScreenLocation:atScreenSize:rotationAngle:completion:", v13, 0, x, y, width, height, a7);

}

- (void)effectBrowserViewController:(id)a3 didPresentPickerForEffectType:(id)a4
{
  id v5;

  if (objc_msgSend(a4, "jtEffectType", a3) == 1)
  {
    -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPresentingFilterPicker:", 1);

  }
}

- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "startTrackingPickerWithIdentifier:", v9);
  }
  else
  {
    -[CFXReviewViewController effectBrowserPresentedAppIdentifier](self, "effectBrowserPresentedAppIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopTrackingPickerWithIdentifier:", v8);

  }
  -[CFXReviewViewController setEffectBrowserPresentedAppIdentifier:](self, "setEffectBrowserPresentedAppIdentifier:", v9);

}

- (void)effectBrowserViewController:(id)a3 didRemoveAllEffectsOfType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewClip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllEffectsOfType:", 7);

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCompositionForEffectChange");

  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isEqualToString:", CFSTR("Animoji"));
  if ((_DWORD)v9)
  {
    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didSelectEffectOfType:effectIsNone:", CFSTR("Animoji"), 1);

  }
}

- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  id v12;

  v5 = a4;
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEffect:completion:", v5, 0);

  objc_msgSend(v5, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  v9 = CFSTR("Filter");
  if (v8 != 1)
    v9 = 0;
  v10 = v9;
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "isNone");

  objc_msgSend(v12, "didSelectEffectOfType:effectIsNone:", v10, v11);
}

- (id)selectedFilterIdentifierForEffectBrowserViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectsOfType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "effectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectsOfType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "effectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4
{
  id v5;

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController", a3, 50.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateUIForDockMagnify:dockHeightDelta:", a4 > 50.0, a4 + -44.0);

}

- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  if (!-[CFXReviewViewController mediaCapturedInFunCam](self, "mediaCapturedInFunCam", a3))
    goto LABEL_6;
  -[CFXReviewViewController mediaItem](self, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataURL");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_6;
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "jfx_hasTrueDepthFrontCamera");

  if ((v8 & 1) == 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("HIDE_MEMOJI_NON_FUN_CAM_MEDIA_ITEM_DIPLAY Name"), &stru_24EE5C428, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  v9 = 0;
  return v9;
}

- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v4;
}

- (BOOL)allowLandscapeForEffectBrowserViewController:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 0;

  return v4;
}

- (void)effectBrowserViewController:(id)a3 filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterPickerPreviewBackgroundImageAtSizeInPixels:completion:", v8, width, height);

}

- (void)previewViewController:(id)a3 didFinishExportingMediaItem:(id)a4 withError:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  -[CFXReviewViewController setMediaItem:](self, "setMediaItem:", v13);
  -[CFXReviewViewController CFX_updateAnalyticsForSentMediaItem:](self, "CFX_updateAnalyticsForSentMediaItem:", v13);
  -[CFXReviewViewController delegate](self, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CFXReviewViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CFXReviewViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reviewViewController:didFinishExportingMediaItem:withError:", self, v13, v7);

    }
  }

}

- (void)previewViewController:(id)a3 didProgress:(double)a4 exportingMediaItem:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a5;
  -[CFXReviewViewController delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[CFXReviewViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CFXReviewViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reviewViewController:didProgress:exportingMediaItem:", self, v12, a4);

    }
  }

}

- (void)previewViewController:(id)a3 didStartExportingMediaItem:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[CFXReviewViewController delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CFXReviewViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CFXReviewViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reviewViewController:didStartExportingMediaItem:", self, v10);

    }
  }

}

- (void)previewViewControllerDidHideUserInterface:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CFXReviewViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CFXReviewViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CFXReviewViewController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reviewViewControllerDidHideUserInterface:", self);

    }
  }
}

- (void)previewViewControllerDidShowUserInterface:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CFXReviewViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CFXReviewViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CFXReviewViewController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reviewViewControllerDidShowUserInterface:", self);

    }
  }
}

- (void)previewViewControllerDidStartEditingText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CFXReviewViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CFXReviewViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CFXReviewViewController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reviewViewControllerDidHideUserInterface:", self);

    }
  }
}

- (void)previewViewControllerDidStopEditingText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CFXReviewViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CFXReviewViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CFXReviewViewController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reviewViewControllerDidShowUserInterface:", self);

    }
  }
}

- (id)selectedAppIdentifierForPreviewViewController:(id)a3
{
  void *v3;
  void *v4;

  -[CFXReviewViewController effectBrowserViewController](self, "effectBrowserViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedAppIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)preferredDisplayColorSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CFXReviewViewController mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "colorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)preferredExportColorSpace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CFXReviewViewController mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "mediaType") == 2)
  {
    -[CFXReviewViewController preferredDisplayColorSpace](self, "preferredDisplayColorSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "colorSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jfx_videoExportColorSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (double)effectBrowserViewController:(id)a3 screenTopBarHeightForWindowBounds:(CGRect)a4 orientation:(int64_t)a5
{
  CGRect v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  memset(&v6, 0, sizeof(v6));
  objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenTopBarGeometryForReferenceBounds:withOrientation:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return CGRectGetHeight(v6);
}

- (void)CFX_resetAndLoadPreviewViewController
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
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CFXEffectBrowserViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x24BDAC8D0];
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jfxRemoveFromParentViewController");

    -[CFXReviewViewController effectBrowserViewController](self, "effectBrowserViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jfxRemoveFromParentViewController");

  }
  v6 = (void *)MEMORY[0x24BDF6E00];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storyboardWithName:bundle:", CFSTR("CFXPreviewView"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", CFSTR("CFXPreviewViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXReviewViewController setInternalPreviewViewController:](self, "setInternalPreviewViewController:", v9);

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[CFXReviewViewController mediaItem](self, "mediaItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMediaItem:", v11);

  v13 = -[CFXReviewViewController mediaCaptureDevicePosition](self, "mediaCaptureDevicePosition") == 1;
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCapturedWithBackCamera:", v13);

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loadViewIfNeeded");

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "previewControls");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "view");
  v42 = v17;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "controlsContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "effectBrowserContentPresenterViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[CFXEffectBrowserViewController initWithDelegate:contentPresenter:]([CFXEffectBrowserViewController alloc], "initWithDelegate:contentPresenter:", self, v44);
  -[CFXReviewViewController setEffectBrowserViewController:](self, "setEffectBrowserViewController:", v20);

  -[CFXReviewViewController effectBrowserViewController](self, "effectBrowserViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentPresenterDelegate:", v44);

  objc_msgSend(v44, "setDelegate:", self);
  -[CFXReviewViewController effectBrowserViewController](self, "effectBrowserViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXReviewViewController effectBrowserViewController](self, "effectBrowserViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addChildViewController:", v24);

  objc_msgSend(v43, "addSubview:", v23);
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v23, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v38;
  objc_msgSend(v23, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v25;
  objc_msgSend(v23, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v18;
  objc_msgSend(v18, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v28;
  objc_msgSend(v23, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v32);

  -[CFXReviewViewController effectBrowserViewController](self, "effectBrowserViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "didMoveToParentViewController:", v42);

  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController jfxAddChildViewController:constrainRelativeToSafeAreas:](self, "jfxAddChildViewController:constrainRelativeToSafeAreas:", v34, 0);

}

- (void)CFX_updateAnalyticsForSentMediaItem:(id)a3
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = 0x24EE55000;
  if (!a3)
    goto LABEL_32;
  objc_msgSend(a3, "clip");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "effectStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (!v5)
  {
    v49 = 0;
    v50 = 0;
    v51 = 0;
    v54 = 0;
    v55 = 0;
    v53 = 0;
    goto LABEL_26;
  }
  v6 = v5;
  v49 = 0;
  v50 = 0;
  v51 = 0;
  v54 = 0;
  v55 = 0;
  v53 = 0;
  v7 = *(_QWORD *)v57;
  v47 = *MEMORY[0x24BE79468];
  v48 = v4;
  v8 = 0x24EE55000uLL;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v57 != v7)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "type");
      switch(v11)
      {
        case 7:
          v53 = 1;
          continue;
        case 2:
          objc_msgSend(v10, "effectID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(void **)(v8 + 3920);
          +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Text"));
          v14 = v8;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "effectIdentifiersForEffectType:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v12);

          if (v17)
          {
            ++v54;
            goto LABEL_16;
          }
          v18 = *(void **)(v14 + 3920);
          +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Shapes"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "effectIdentifiersForEffectType:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v12);

          if (v21)
          {
            ++v51;
LABEL_16:
            v8 = v14;
          }
          else
          {
            v22 = *(void **)(v14 + 3920);
            +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("EmojiStickers"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "effectIdentifiersForEffectType:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "containsObject:", v12);

            if (v25)
              ++v49;
            else
              v50 += objc_msgSend(v12, "isEqualToString:", v47);
            v8 = v14;
            v4 = v48;
          }

          continue;
        case 1:
          ++v55;
          break;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  }
  while (v6);
LABEL_26:

  v26 = objc_msgSend(v46, "isVideo");
  -[CFXReviewViewController internalPreviewViewController](self, "internalPreviewViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v27, "capturedWithBackCamera") ^ 1;

  +[CFXEffectHostAppDelegate sharedInstance](CFXEffectHostAppDelegate, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "preferredExportColorSpace");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  +[CFXEffectHostAppDelegate sharedInstance](CFXEffectHostAppDelegate, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "preferredDisplayColorSpace");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = 0x24EE55000uLL;
  if (objc_msgSend(v29, "isHDRSpace"))
    v32 = objc_msgSend(v31, "isHDRSpace");
  else
    v32 = 0;
  objc_msgSend(v46, "mediaItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "colorSpace");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isHDRSpace");
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v44) = v35;
  LOBYTE(v44) = v32;
  objc_msgSend(v36, "trackMediaSentWithAnimoji:video:frontCamera:filterCount:labelCount:messagesStickerCount:shapeCount:emojiStickerCount:supportsHDR:isHDR:", v53 & 1, v26, v52, v55, v54, v50, v51, v49, v44);

  if ((_DWORD)v26)
  {
    v37 = (double)(int)objc_msgSend(v46, "duration");
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v37 / (double)(int)objc_msgSend(v38, "frameRate");

    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trackEventWithName:duration:", CFSTR("videoduration"), v39);

  }
LABEL_32:
  objc_msgSend(*(id *)(v3 + 3808), "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stopTrackingTimeIntervalEventWithName:", CFSTR("activebackcameratime"));

  objc_msgSend(*(id *)(v3 + 3808), "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stopTrackingTimeIntervalEventWithName:", CFSTR("activefrontcameratime"));

  objc_msgSend(*(id *)(v3 + 3808), "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stopTrackingTimeIntervalEventWithName:", CFSTR("activetime"));

}

- (CFXReviewViewControllerDelegate)delegate
{
  return (CFXReviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CFXEffectBrowserViewController)effectBrowserViewController
{
  return self->_effectBrowserViewController;
}

- (void)setEffectBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_effectBrowserViewController, a3);
}

- (CFXPreviewViewController)internalPreviewViewController
{
  return self->_internalPreviewViewController;
}

- (void)setInternalPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_internalPreviewViewController, a3);
}

- (CFXReviewControlsViewController)reviewControlsViewController
{
  return self->_reviewControlsViewController;
}

- (void)setReviewControlsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_reviewControlsViewController, a3);
}

- (NSString)effectBrowserPresentedAppIdentifier
{
  return self->_effectBrowserPresentedAppIdentifier;
}

- (void)setEffectBrowserPresentedAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_effectBrowserPresentedAppIdentifier, a3);
}

- (CFXMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (OS_dispatch_group)metadataReaderGroup
{
  return self->_metadataReaderGroup;
}

- (void)setMetadataReaderGroup:(id)a3
{
  objc_storeStrong((id *)&self->_metadataReaderGroup, a3);
}

- (BOOL)mediaCapturedInFunCam_metadata
{
  return self->_mediaCapturedInFunCam_metadata;
}

- (void)setMediaCapturedInFunCam_metadata:(BOOL)a3
{
  self->_mediaCapturedInFunCam_metadata = a3;
}

- (int64_t)mediaInterfaceOrientationForDisplay_metadata
{
  return self->_mediaInterfaceOrientationForDisplay_metadata;
}

- (void)setMediaInterfaceOrientationForDisplay_metadata:(int64_t)a3
{
  self->_mediaInterfaceOrientationForDisplay_metadata = a3;
}

- (NSData)animojiMetadata_metadata
{
  return self->_animojiMetadata_metadata;
}

- (void)setAnimojiMetadata_metadata:(id)a3
{
  objc_storeStrong((id *)&self->_animojiMetadata_metadata, a3);
}

- (int64_t)cameraModeUsedForCapture
{
  return self->_cameraModeUsedForCapture;
}

- (void)setCameraModeUsedForCapture:(int64_t)a3
{
  self->_cameraModeUsedForCapture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiMetadata_metadata, 0);
  objc_storeStrong((id *)&self->_metadataReaderGroup, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_effectBrowserPresentedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_reviewControlsViewController, 0);
  objc_storeStrong((id *)&self->_internalPreviewViewController, 0);
  objc_storeStrong((id *)&self->_effectBrowserViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)mediaCapturedInFunCam
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "ERROR: failed to determine media item captured location", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mediaCaptureDevicePosition
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "ERROR: failed to read capture device position", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)calculateMediaInterfaceOrientationForDisplay
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "ERROR: failed to read capture interface orientation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)animojiMetadata
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "ERROR: failed to animoji metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
