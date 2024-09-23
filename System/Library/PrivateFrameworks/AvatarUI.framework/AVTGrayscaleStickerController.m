@implementation AVTGrayscaleStickerController

- (AVTGrayscaleStickerController)init
{
  AVTGrayscaleStickerController *v2;
  uint64_t v3;
  AVTUIEnvironment *environment;
  AVTUICapabilities *v5;
  AVTUICapabilities *uiCapabilities;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTGrayscaleStickerController;
  v2 = -[AVTGrayscaleStickerController init](&v8, sel_init);
  if (v2)
  {
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v3 = objc_claimAutoreleasedReturnValue();
    environment = v2->_environment;
    v2->_environment = (AVTUIEnvironment *)v3;

    v5 = objc_alloc_init(AVTUICapabilities);
    uiCapabilities = v2->_uiCapabilities;
    v2->_uiCapabilities = v5;

  }
  return v2;
}

- (id)stickerViewControllerForFetchRequest:(id)a3 allowedStickers:(id)a4 stickerPacks:(id)a5 allowPoseCapture:(BOOL)a6 showUserInfoView:(BOOL)a7 allowEditing:(BOOL)a8 backgroundColor:(id)a9 grayscaleConvertionDelegate:(id)a10 presenterDelegate:(id)a11 selectionDelegate:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  AVTAvatarStore *v20;
  AVTViewSessionProvider *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  AVTViewSessionProvider *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  _BOOL4 v34;
  id v35;
  id v36;
  id v37;
  _BOOL4 v38;
  _BOOL4 v39;

  v34 = a8;
  v38 = a6;
  v39 = a7;
  v16 = a12;
  v35 = a11;
  v36 = a10;
  v37 = a9;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(AVTAvatarStore);
  v21 = [AVTViewSessionProvider alloc];
  -[AVTGrayscaleStickerController environment](self, "environment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTViewSessionProvider backingSizeForEnvironment:](AVTViewSessionProvider, "backingSizeForEnvironment:", v22);
  v24 = v23;
  v26 = v25;
  +[AVTViewSessionProvider creatorForAVTView](AVTViewSessionProvider, "creatorForAVTView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGrayscaleStickerController environment](self, "environment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v21, "initWithAVTViewBackingSize:viewCreator:environment:", v27, v28, v24, v26);

  -[AVTGrayscaleStickerController setViewSessionProvider:](self, "setViewSessionProvider:", v29);
  LOBYTE(v33) = 0;
  +[AVTStickerViewController stickerViewControllerForStore:fetchRequest:stickerPacks:stickerConfigurationNames:avtViewSessionProvider:allowEditing:allowPeel:](AVTStickerViewController, "stickerViewControllerForStore:fetchRequest:stickerPacks:stickerConfigurationNames:avtViewSessionProvider:allowEditing:allowPeel:", v20, v19, v17, v18, v29, v34, v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTGrayscaleStickerController setAllowedStickers:](self, "setAllowedStickers:", v18);
  -[AVTGrayscaleStickerController setPresenterDelegate:](self, "setPresenterDelegate:", v35);
  -[AVTGrayscaleStickerController setImageDelegate:](self, "setImageDelegate:", v36);
  -[AVTGrayscaleStickerController setSelectionDelegate:](self, "setSelectionDelegate:", v16);
  -[AVTGrayscaleStickerController setAllowsPoseCapture:](self, "setAllowsPoseCapture:", v38);
  -[AVTGrayscaleStickerController setShouldHideUserInfoView:](self, "setShouldHideUserInfoView:", !v39);
  -[AVTGrayscaleStickerController setBackgroundColor:](self, "setBackgroundColor:", v37);
  objc_msgSend(v30, "setStickerSelectionDelegate:", v16);

  objc_msgSend(v30, "setStickerSheetControllerProvider:", self);
  objc_msgSend(v30, "setPresenterDelegate:", v35);

  objc_msgSend(v30, "setImageDelegate:", v36);
  objc_msgSend(v30, "setShouldHideUserInfoView:", !v39);
  objc_msgSend(v30, "setEdgesForExtendedLayout:", 0);
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v37);

  -[AVTGrayscaleStickerController setStickerViewController:](self, "setStickerViewController:", v30);
  return v30;
}

- (void)stickerSheetController:(id)a3 didSelectCameraViewForRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  -[AVTGrayscaleStickerController presenterDelegate](self, "presenterDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_initWeak(&location, self);
    -[AVTGrayscaleStickerController uiCapabilities](self, "uiCapabilities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__AVTGrayscaleStickerController_stickerSheetController_didSelectCameraViewForRecord___block_invoke;
    v10[3] = &unk_1EA51DC28;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v9, "requestAccessForCameraWithCompletionHandler:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __85__AVTGrayscaleStickerController_stickerSheetController_didSelectCameraViewForRecord___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __85__AVTGrayscaleStickerController_stickerSheetController_didSelectCameraViewForRecord___block_invoke_2;
    v6[3] = &unk_1EA51D570;
    v6[4] = WeakRetained;
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __85__AVTGrayscaleStickerController_stickerSheetController_didSelectCameraViewForRecord___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  AVTPoseCaptureViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  AVTPoseCaptureViewController *v11;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2
    || (objc_msgSend(*(id *)(a1 + 32), "delegate"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "shouldPresentPoseCaptureControllerForRecord:", *(_QWORD *)(a1 + 40)),
        v3,
        v4))
  {
    v5 = [AVTPoseCaptureViewController alloc];
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "viewSessionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVTPoseCaptureViewController initWithSelectedRecord:avtViewSessionProvider:](v5, "initWithSelectedRecord:avtViewSessionProvider:", v6, v7);

    -[AVTPoseCaptureViewController setDelegate:](v11, "setDelegate:", *(_QWORD *)(a1 + 32));
    -[AVTPoseCaptureViewController setShouldHideUserInfoView:](v11, "setShouldHideUserInfoView:", objc_msgSend(*(id *)(a1 + 32), "shouldHideUserInfoView"));
    objc_msgSend(*(id *)(a1 + 32), "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPoseCaptureViewController setBackgroundColor:](v11, "setBackgroundColor:", v8);

    v9 = objc_msgSend(*(id *)(a1 + 32), "accessibilityIgnoresInvertColors");
    -[AVTPoseCaptureViewController view](v11, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIgnoresInvertColors:", v9);

    objc_msgSend(*(id *)(a1 + 32), "wrapAndPresentViewController:animated:", v11, 1);
  }
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;

  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTGrayscaleStickerController presenterDelegate](self, "presenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentAvatarUIController:animated:", v6, 1);

}

- (id)stickerSheetControllerForSelectedAvatar:(id)a3 stickerSheetModel:(id)a4 taskScheduler:(id)a5
{
  id v7;
  id v8;
  AVTSelectableStickerSheetController *v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = -[AVTSelectableStickerSheetController initWithStickerSheetModel:taskScheduler:allowsPoseCapture:]([AVTSelectableStickerSheetController alloc], "initWithStickerSheetModel:taskScheduler:allowsPoseCapture:", v8, v7, -[AVTGrayscaleStickerController allowsPoseCapture](self, "allowsPoseCapture"));

  -[AVTGrayscaleStickerController presenterDelegate](self, "presenterDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSelectableStickerSheetController setPresenterDelegate:](v9, "setPresenterDelegate:", v10);

  -[AVTGrayscaleStickerController imageDelegate](self, "imageDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTSelectableStickerSheetController setImageDelegate:](v9, "setImageDelegate:", v11);

  -[AVTSelectableStickerSheetController setShowCellSelectionLayer:](v9, "setShowCellSelectionLayer:", -[AVTGrayscaleStickerController shouldShowSelectionLayerForStickers](self, "shouldShowSelectionLayerForStickers"));
  -[AVTSelectableStickerSheetController setStickerSheetDelegate:](v9, "setStickerSheetDelegate:", self);
  return v9;
}

- (void)poseCaptureViewController:(id)a3 didCapturePoseWithConfiguration:(id)a4 avatar:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[AVTGrayscaleStickerController stickerViewController](self, "stickerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearStickerSelection");

  -[AVTGrayscaleStickerController selectionDelegate](self, "selectionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didSelectStickerWithConfiguration:avatar:", v8, v7);

  -[AVTGrayscaleStickerController presenterDelegate](self, "presenterDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dismissAvatarUIControllerAnimated:", 1);

}

- (void)poseCaptureViewControllerDidCancel:(id)a3
{
  id v3;

  -[AVTGrayscaleStickerController presenterDelegate](self, "presenterDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAvatarUIControllerAnimated:", 1);

}

- (void)poseCaptureViewController:(id)a3 willCaptureAvatarImage:(id)a4 completion:(id)a5
{
  void (**v7)(id, id);
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = (void (**)(id, id))a5;
  -[AVTGrayscaleStickerController imageDelegate](self, "imageDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AVTGrayscaleStickerController imageDelegate](self, "imageDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewWillUpdateWithImage:completion:", v10, v7);

  }
  else
  {
    v7[2](v7, v10);
  }

}

- (BOOL)shouldShowSelectionLayerForStickers
{
  return self->_showsSelectionLayerForStickers;
}

- (void)setShowsSelectionLayerForStickers:(BOOL)a3
{
  self->_showsSelectionLayerForStickers = a3;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return self->_accessibilityIgnoresInvertColors;
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3
{
  self->_accessibilityIgnoresInvertColors = a3;
}

- (AVTGrayscaleStickerControllerDelegate)delegate
{
  return (AVTGrayscaleStickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTStickerViewControllerImageDelegate)imageDelegate
{
  return (AVTStickerViewControllerImageDelegate *)objc_loadWeakRetained((id *)&self->_imageDelegate);
}

- (void)setImageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageDelegate, a3);
}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presenterDelegate, a3);
}

- (AVTStickerSelectionDelegate)selectionDelegate
{
  return (AVTStickerSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (AVTStickerViewController)stickerViewController
{
  return (AVTStickerViewController *)objc_loadWeakRetained((id *)&self->_stickerViewController);
}

- (void)setStickerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_stickerViewController, a3);
}

- (AVTViewSessionProvider)viewSessionProvider
{
  return self->_viewSessionProvider;
}

- (void)setViewSessionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_viewSessionProvider, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUICapabilities)uiCapabilities
{
  return self->_uiCapabilities;
}

- (void)setUiCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_uiCapabilities, a3);
}

- (BOOL)allowsPoseCapture
{
  return self->_allowsPoseCapture;
}

- (void)setAllowsPoseCapture:(BOOL)a3
{
  self->_allowsPoseCapture = a3;
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (NSArray)allowedStickers
{
  return self->_allowedStickers;
}

- (void)setAllowedStickers:(id)a3
{
  objc_storeStrong((id *)&self->_allowedStickers, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_allowedStickers, 0);
  objc_storeStrong((id *)&self->_uiCapabilities, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_viewSessionProvider, 0);
  objc_destroyWeak((id *)&self->_stickerViewController);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
