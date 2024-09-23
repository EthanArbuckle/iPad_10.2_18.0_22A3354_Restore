@implementation CAMImagePickerCameraViewController

- (CAMImagePickerCameraViewController)initWithInitialImagePickerProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  CAMUserPreferenceOverrides *v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  CAMImagePickerCameraViewController *v22;
  CAMImagePickerCameraViewController *v23;
  NSDictionary *mostRecentPhotoProperties;
  NSDictionary *mostRecentVideoProperties;
  CAMImagePickerCameraViewController *v26;
  objc_super v28;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC5880]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC5888]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4CC0]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6)
      v10 = 0;
    else
      v10 = v7 == 0;
    if (v10 && v8 == 0)
    {
      v12 = 0;
    }
    else
    {
      v12 = objc_alloc_init(CAMUserPreferenceOverrides);
      if (v6)
      {
        v13 = -[CAMImagePickerCameraViewController _captureModeForImagePickerCameraCaptureMode:](self, "_captureModeForImagePickerCameraCaptureMode:", objc_msgSend(v6, "integerValue"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMUserPreferenceOverrides setCaptureMode:](v12, "setCaptureMode:", v14);

      }
      if (v7)
      {
        v15 = -[CAMImagePickerCameraViewController _captureDeviceForImagePickerCameraDevice:](self, "_captureDeviceForImagePickerCameraDevice:", objc_msgSend(v7, "integerValue"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMUserPreferenceOverrides setCaptureDevice:](v12, "setCaptureDevice:", v16);

      }
      if (v9)
      {
        v17 = -[CAMImagePickerCameraViewController _videoConfigurationForImagePickerQualityType:](self, "_videoConfigurationForImagePickerQualityType:", objc_msgSend(v9, "integerValue"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMUserPreferenceOverrides setVideoConfiguration:](v12, "setVideoConfiguration:", v18);

      }
    }

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5910]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (v20)
    v21 = 2;
  else
    v21 = 1;
  v28.receiver = self;
  v28.super_class = (Class)CAMImagePickerCameraViewController;
  v22 = -[CAMCameraViewController initWithOverrides:usingEmulationMode:](&v28, sel_initWithOverrides_usingEmulationMode_, v12, v21);
  v23 = v22;
  if (v22)
  {
    v22->_editingAllowed = 1;
    v22->_videoEditingAllowed = 1;
    v22->_currentlyReviewing = 0;
    v22->_usingTelephonyUI = v20;
    mostRecentPhotoProperties = v22->_mostRecentPhotoProperties;
    v22->_mostRecentPhotoProperties = 0;

    mostRecentVideoProperties = v23->_mostRecentVideoProperties;
    v23->_mostRecentVideoProperties = 0;

    -[CAMCameraViewController setCaptureDelegate:](v23, "setCaptureDelegate:", v23);
    -[CAMCameraViewController setConfigurationDelegate:](v23, "setConfigurationDelegate:", v23);
    -[CAMCameraViewController setDisablingAdditionalCaptures:](v23, "setDisablingAdditionalCaptures:", 1);
    v26 = v23;
  }

  return v23;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMImagePickerCameraViewController;
  -[CAMCameraViewController loadView](&v6, sel_loadView);
  -[CAMImagePickerCameraViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMImagePickerCameraViewController customOverlayView](self, "customOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setCustomOverlayView:", v4);
  -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMImagePickerCameraViewController _applyPropertiesFromImagePicker:](self, "_applyPropertiesFromImagePicker:", v5);
  objc_msgSend(v5, "setPreferredContentSize:", 320.0, 568.0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMImagePickerCameraViewController;
  -[CAMCameraViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStatusBarHidden");

  -[CAMImagePickerCameraViewController _setStatusBarWasHidden:](self, "_setStatusBarWasHidden:", v5);
  if ((v5 & 1) == 0
    && (-[CAMImagePickerCameraViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) == 0)
  {
    -[CAMImagePickerCameraViewController _setStatusBarHidden:](self, "_setStatusBarHidden:", 1);
  }
  -[CAMImagePickerCameraViewController _createCropOverlayIfNecessary](self, "_createCropOverlayIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMImagePickerCameraViewController;
  -[CAMImagePickerCameraViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (!-[CAMImagePickerCameraViewController _statusBarWasHidden](self, "_statusBarWasHidden")
    && (-[CAMImagePickerCameraViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) == 0)
  {
    -[CAMImagePickerCameraViewController _setStatusBarHidden:](self, "_setStatusBarHidden:", 0);
  }
}

- (void)_setStatusBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CC0]), "initWithDefaultParameters");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusBarHidden:animationParameters:", v3, v5);

}

+ (BOOL)isEmulatingImagePicker
{
  return 1;
}

- (BOOL)isShowingStandardControls
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingStandardControls");

  return v3;
}

- (void)setShowingStandardControls:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowingStandardControls:", v3);

}

- (int64_t)imagePickerVideoQuality
{
  void *v3;
  int64_t v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMImagePickerCameraViewController _imagePickerQualityTypeForVideoConfiguration:](self, "_imagePickerQualityTypeForVideoConfiguration:", objc_msgSend(v3, "imagePickerVideoConfiguration"));

  return v4;
}

- (void)setImagePickerVideoQuality:(int64_t)a3
{
  id v5;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImagePickerVideoConfiguration:", -[CAMImagePickerCameraViewController _videoConfigurationForImagePickerQualityType:](self, "_videoConfigurationForImagePickerQualityType:", a3));

}

- (double)maximumVideoRecordingDuration
{
  void *v2;
  double v3;
  double v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumVideoRecordingDuration");
  v4 = v3;

  return v4;
}

- (void)setMaximumVideoRecordingDuration:(double)a3
{
  id v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumVideoRecordingDuration:", a3);

}

- (void)setCustomOverlayView:(id)a3
{
  UIView *v5;
  int v6;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  if (self->_customOverlayView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_customOverlayView, a3);
    v6 = -[CAMImagePickerCameraViewController isViewLoaded](self, "isViewLoaded");
    v5 = v8;
    if (v6)
    {
      -[CAMImagePickerCameraViewController view](self, "view", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCustomOverlayView:", v8);

      v5 = v8;
    }
  }

}

- (CGAffineTransform)customPreviewViewTransform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "customPreviewViewTransform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setCustomPreviewViewTransform:(CGAffineTransform *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v4, "setCustomPreviewViewTransform:", v6);

}

- (void)_setEditingAllowed:(BOOL)a3
{
  if (self->_editingAllowed != a3)
  {
    self->_editingAllowed = a3;
    -[CAMImagePickerCameraViewController _updateFromEditabilityChange](self, "_updateFromEditabilityChange");
  }
}

- (void)_applyPropertiesFromImagePicker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _OWORD v29[3];
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v4 = a3;
  objc_msgSend(v4, "_properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC5900]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[CAMImagePickerCameraViewController setShowingStandardControls:](self, "setShowingStandardControls:", v7);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4CC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "integerValue");
  else
    v10 = 1;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v10 == 3 && v12 == 1)
    v14 = 1;
  else
    v14 = v10;
  -[CAMImagePickerCameraViewController setImagePickerVideoQuality:](self, "setImagePickerVideoQuality:", v14);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4CB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "doubleValue");
  else
    v17 = 600.0;
  -[CAMImagePickerCameraViewController setMaximumVideoRecordingDuration:](self, "setMaximumVideoRecordingDuration:", v17);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC5890]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = objc_msgSend(v18, "integerValue");
  else
    v20 = 0;
  -[CAMImagePickerCameraViewController _setCameraFlashMode:](self, "_setCameraFlashMode:", v20);
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC58A0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "CGAffineTransformValue");
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
  }

  v29[0] = v30;
  v29[1] = v31;
  v29[2] = v32;
  -[CAMImagePickerCameraViewController setCustomPreviewViewTransform:](self, "setCustomPreviewViewTransform:", v29);
  v23 = objc_msgSend(v4, "_imagePickerSavingOptions");

  -[CAMImagePickerCameraViewController _setPhotoSavingOptions:](self, "_setPhotoSavingOptions:", 4 * (v23 & 1u));
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4C68]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  -[CAMImagePickerCameraViewController _setEditingAllowed:](self, "_setEditingAllowed:", v25);
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC5870]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  -[CAMImagePickerCameraViewController _setVideoEditingAllowed:](self, "_setVideoEditingAllowed:", v27);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__handleEditabilityChanged_, *MEMORY[0x1E0DC58C0], 0);

}

- (void)_setImagePickerMediaTypes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  CAMImagePickerCameraViewController *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v18 = self;
  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    v8 = (void *)*MEMORY[0x1E0CEC520];
    v9 = (void *)*MEMORY[0x1E0CEC568];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "identifier", v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        v14 = &unk_1EA3B07F0;
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v9, "identifier", &unk_1EA3B07F0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v11, "isEqualToString:", v15);

          v14 = &unk_1EA3B0808;
          if (!v16)
            continue;
        }
        objc_msgSend(v4, "addObject:", v14);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  -[CAMCameraViewController viewfinderViewController](v18, "viewfinderViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAvailableCaptureModes:", v4);

}

- (id)_cameraOverlayView
{
  void *v2;
  void *v3;

  -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setCameraOverlayView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayContainerView:", v4);

}

- (void)_setCameraViewTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  -[CAMImagePickerCameraViewController setCustomPreviewViewTransform:](self, "setCustomPreviewViewTransform:", v4);
}

- (int64_t)_cameraDevice
{
  return -[CAMImagePickerCameraViewController _imagePickerCameraDeviceForCaptureDevice:](self, "_imagePickerCameraDeviceForCaptureDevice:", -[CAMCameraViewController captureDevice](self, "captureDevice"));
}

- (void)_setCameraDevice:(int64_t)a3
{
  -[CAMCameraViewController configureForCaptureMode:captureDevice:](self, "configureForCaptureMode:captureDevice:", -[CAMCameraViewController captureMode](self, "captureMode"), -[CAMImagePickerCameraViewController _captureDeviceForImagePickerCameraDevice:](self, "_captureDeviceForImagePickerCameraDevice:", a3));
}

- (int64_t)_cameraCaptureMode
{
  return -[CAMImagePickerCameraViewController _imagePickerCameraCaptureModeForCaptureMode:](self, "_imagePickerCameraCaptureModeForCaptureMode:", -[CAMCameraViewController captureMode](self, "captureMode"));
}

- (void)_setCameraCaptureMode:(int64_t)a3
{
  -[CAMCameraViewController configureForCaptureMode:captureDevice:](self, "configureForCaptureMode:captureDevice:", -[CAMImagePickerCameraViewController _captureModeForImagePickerCameraCaptureMode:](self, "_captureModeForImagePickerCameraCaptureMode:", a3), -[CAMCameraViewController captureDevice](self, "captureDevice"));
}

- (int64_t)_cameraFlashMode
{
  int64_t v3;
  int64_t v4;
  int64_t v5;

  v3 = -[CAMCameraViewController captureMode](self, "captureMode");
  if (v3 == 1)
  {
    v4 = +[CAMCaptureConversions flashModeForTorchMode:](CAMCaptureConversions, "flashModeForTorchMode:", -[CAMCameraViewController torchMode](self, "torchMode"));
  }
  else
  {
    if (v3)
    {
      v5 = 0;
      return -[CAMImagePickerCameraViewController _imagePickerCameraFlashModeForFlashMode:](self, "_imagePickerCameraFlashModeForFlashMode:", v5);
    }
    v4 = -[CAMCameraViewController flashMode](self, "flashMode");
  }
  v5 = v4;
  return -[CAMImagePickerCameraViewController _imagePickerCameraFlashModeForFlashMode:](self, "_imagePickerCameraFlashModeForFlashMode:", v5);
}

- (void)_setCameraFlashMode:(int64_t)a3
{
  int64_t v4;
  int64_t v5;

  v4 = -[CAMImagePickerCameraViewController _flashModeForImagePickerCameraFlashMode:](self, "_flashModeForImagePickerCameraFlashMode:", a3);
  v5 = -[CAMCameraViewController captureMode](self, "captureMode");
  if (v5 == 1)
  {
    -[CAMCameraViewController setTorchMode:](self, "setTorchMode:", +[CAMCaptureConversions torchModeForFlashMode:](CAMCaptureConversions, "torchModeForFlashMode:", v4));
  }
  else if (!v5)
  {
    -[CAMCameraViewController setFlashMode:](self, "setFlashMode:", v4);
  }
}

- (void)_handleEditabilityChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4C68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[CAMImagePickerCameraViewController _setEditingAllowed:](self, "_setEditingAllowed:", v6);
}

- (void)_updateFromEditabilityChange
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[CAMImagePickerCameraViewController _isEditingAllowed](self, "_isEditingAllowed");
  -[CAMImagePickerCameraViewController _photoTileViewController](self, "_photoTileViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGesturesEnabled:", v3);
  -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsCropRegion:", v3);

}

- (id)_currentCancelButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("_UIImagePickerControllerCancelButtonTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    CAMLocalizedFrameworkString(CFSTR("CANCEL"), &stru_1EA3325A0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_createCropOverlayIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  PLCropOverlay *v12;
  PLCropOverlay *cropOverlay;
  void *v14;
  uint64_t v15;
  void *v16;
  PLCropOverlay *v17;
  void *v18;
  PLCropOverlay *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  if (!self->__cropOverlay)
  {
    -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_properties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5910]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    -[CAMImagePickerCameraViewController _setUsingTelephonyUI:](self, "_setUsingTelephonyUI:", v6);
    if ((_DWORD)v6)
      v7 = 3;
    else
      v7 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v8 = (void *)getPLCropOverlayClass_softClass;
    v25 = getPLCropOverlayClass_softClass;
    if (!getPLCropOverlayClass_softClass)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __getPLCropOverlayClass_block_invoke;
      v21[3] = &unk_1EA329140;
      v21[4] = &v22;
      __getPLCropOverlayClass_block_invoke((uint64_t)v21);
      v8 = (void *)v23[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v22, 8);
    v10 = [v9 alloc];
    -[CAMImagePickerCameraViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v12 = (PLCropOverlay *)objc_msgSend(v10, "initWithFrame:mode:offsettingStatusBar:", v7, 1);
    cropOverlay = self->__cropOverlay;
    self->__cropOverlay = v12;

    -[PLCropOverlay setDisplayedInPopover:](self->__cropOverlay, "setDisplayedInPopover:", -[CAMImagePickerCameraViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));
    -[PLCropOverlay setControlsAreVisible:](self->__cropOverlay, "setControlsAreVisible:", -[CAMImagePickerCameraViewController isShowingStandardControls](self, "isShowingStandardControls"));
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58A8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
    {
      CAMLocalizedFrameworkString(CFSTR("USE_PHOTO"), 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    -[PLCropOverlay setDefaultOKButtonTitle:](self->__cropOverlay, "setDefaultOKButtonTitle:", v14);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5898]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCropOverlay setOverlayContainerView:](self->__cropOverlay, "setOverlayContainerView:", v16);
    -[PLCropOverlay setDelegate:](self->__cropOverlay, "setDelegate:", self);
    -[PLCropOverlay setAutoresizingMask:](self->__cropOverlay, "setAutoresizingMask:", 18);
    v17 = self->__cropOverlay;
    if ((_DWORD)v6)
    {
      CAMLocalizedFrameworkString(CFSTR("TAKE_PICTURE"), &stru_1EA3325A0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCropOverlay setTitle:](v17, "setTitle:", v18);

      -[PLCropOverlay setOKButtonShowsCamera:](self->__cropOverlay, "setOKButtonShowsCamera:", 1);
      v19 = self->__cropOverlay;
      -[CAMImagePickerCameraViewController _currentCancelButtonTitle](self, "_currentCancelButtonTitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCropOverlay setCancelButtonTitle:](v19, "setCancelButtonTitle:", v20);

    }
    else
    {
      -[PLCropOverlay setShowsCropRegion:](v17, "setShowsCropRegion:", -[CAMImagePickerCameraViewController _isEditingAllowed](self, "_isEditingAllowed"));
    }
    -[CAMImagePickerCameraViewController setCustomOverlayView:](self, "setCustomOverlayView:", self->__cropOverlay);

  }
}

- (void)handleReviewButtonReleased:(id)a3
{
  -[PLCropOverlay _tappedBottomBarCancelButton:](self->__cropOverlay, "_tappedBottomBarCancelButton:", a3);
}

- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  id v8;
  _BOOL4 v9;
  PLPhotoTileViewController *photoTileViewController;
  void *v11;
  PLPhotoTileViewController *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  PLPhotoTileViewController *v26;
  PLPhotoTileViewController *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  PLPhotoTileViewController *v40;
  PLPhotoTileViewController *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  id v55;
  void *v56;
  id v57;

  v57 = a4;
  v8 = a5;
  -[CAMImagePickerCameraViewController _setMostRecentPhotoProperties:](self, "_setMostRecentPhotoProperties:", v8);
  v9 = -[CAMImagePickerCameraViewController isShowingStandardControls](self, "isShowingStandardControls");
  if (v9)
    -[CAMImagePickerCameraViewController _setCurrentlyReviewing:](self, "_setCurrentlyReviewing:", 1);
  photoTileViewController = self->__photoTileViewController;
  if (photoTileViewController)
  {
    -[PLPhotoTileViewController willMoveToParentViewController:](photoTileViewController, "willMoveToParentViewController:", 0);
    -[PLPhotoTileViewController view](self->__photoTileViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[PLPhotoTileViewController removeFromParentViewController](self->__photoTileViewController, "removeFromParentViewController");
    v12 = self->__photoTileViewController;
    self->__photoTileViewController = 0;

  }
  -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerFullsizeImage"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!-[CAMImagePickerCameraViewController _isEditingAllowed](self, "_isEditingAllowed"))
  {
    v16 = v57;

  }
  v52 = v13;
  v56 = v16;
  v54 = v9;
  if (-[CAMImagePickerCameraViewController _isUsingTelephonyUI](self, "_isUsingTelephonyUI"))
  {
    -[CAMImagePickerCameraViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v26 = (PLPhotoTileViewController *)objc_msgSend(getPLPhotoTileViewControllerClass(), "newPhotoTileViewControllerWithFrame:image:allowZoomToFill:mode:", v16, 1, 1, v19, v21, v23, v25);
    v27 = self->__photoTileViewController;
    self->__photoTileViewController = v26;

    -[PLPhotoTileViewController scrollView](self->__photoTileViewController, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentInsetAdjustmentBehavior:", 2);

    -[PLPhotoTileViewController setShouldSupressViewWillTransitionToSize:](self->__photoTileViewController, "setShouldSupressViewWillTransitionToSize:", 1);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerCaptureOrientation"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "integerValue");

    -[PLPhotoTileViewController setCenterContentVertically:](self->__photoTileViewController, "setCenterContentVertically:", (unint64_t)(v30 - 3) < 2);
  }
  else
  {
    -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "reviewUsingOverlayFrame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    v40 = (PLPhotoTileViewController *)objc_msgSend(getPLPhotoTileViewControllerClass(), "newPhotoTileViewControllerWithFrame:image:allowZoomToFill:mode:", v16, 0, 1, v33, v35, v37, v39);
    v41 = self->__photoTileViewController;
    self->__photoTileViewController = v40;

    -[PLPhotoTileViewController setShouldSupressViewWillTransitionToSize:](self->__photoTileViewController, "setShouldSupressViewWillTransitionToSize:", 1);
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5858], v52);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoTileViewController setForce1XCroppedImage:](self->__photoTileViewController, "setForce1XCroppedImage:", objc_msgSend(v42, "BOOLValue"));
  -[PLPhotoTileViewController setUnscaledImage:](self->__photoTileViewController, "setUnscaledImage:", v15);
  -[CAMImagePickerCameraViewController _updateFromEditabilityChange](self, "_updateFromEditabilityChange");
  -[PLPhotoTileViewController scrollView](self->__photoTileViewController, "scrollView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBackgroundColor:", v44);

  -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58F8]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "BOOLValue");

  if (v54)
  {
    v55 = v8;
    -[CAMImagePickerCameraViewController addChildViewController:](self, "addChildViewController:", self->__photoTileViewController);
    -[CAMImagePickerCameraViewController view](self, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoTileViewController view](self->__photoTileViewController, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAdditionalContentView:", v49);

    -[PLPhotoTileViewController didMoveToParentViewController:](self->__photoTileViewController, "didMoveToParentViewController:", self);
    if (v47)
    {
      -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setPerformingReviewUsingOverlay:", 1);
      objc_msgSend(v45, "didCapturePhoto");

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "postNotificationName:object:", *MEMORY[0x1E0DC5918], 0);

    v8 = v55;
  }
  else
  {
    -[CAMImagePickerCameraViewController cropOverlay:didFinishSaving:](self, "cropOverlay:didFinishSaving:", v45, 0);
    -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setPerformingReviewUsingOverlay:", 0);
  }

  objc_msgSend(v45, "setEnabled:", 1);
}

- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  PLPhotoTileViewController *photoTileViewController;
  void *v21;
  PLPhotoTileViewController *v22;
  PLVideoView *videoView;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  PLPhotoTileViewController *v36;
  PLPhotoTileViewController *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  PLVideoView *v44;
  PLVideoView *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  id v51;
  id v52;
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;

  v52 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v51 = a7;
  -[CAMImagePickerCameraViewController _setMostRecentVideoProperties:](self, "_setMostRecentVideoProperties:", v14);
  -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58F8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (-[CAMImagePickerCameraViewController isShowingStandardControls](self, "isShowingStandardControls") && v19)
  {
    -[CAMImagePickerCameraViewController _setCurrentlyReviewing:](self, "_setCurrentlyReviewing:", 1);
    photoTileViewController = self->__photoTileViewController;
    if (photoTileViewController)
    {
      -[PLPhotoTileViewController willMoveToParentViewController:](photoTileViewController, "willMoveToParentViewController:", 0);
      -[PLPhotoTileViewController view](self->__photoTileViewController, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");

      -[PLPhotoTileViewController removeFromParentViewController](self->__photoTileViewController, "removeFromParentViewController");
      v22 = self->__photoTileViewController;
      self->__photoTileViewController = 0;

      videoView = self->__videoView;
      self->__videoView = 0;

    }
    -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reviewUsingOverlayFrame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v33 = v12;
    v50 = -[CAMImagePickerCameraViewController _isEditingAllowed](self, "_isEditingAllowed")
       || -[CAMImagePickerCameraViewController _isVideoEditingAllowed](self, "_isVideoEditingAllowed");
    v36 = (PLPhotoTileViewController *)objc_alloc_init((Class)getPLPhotoTileViewControllerClass());
    v37 = self->__photoTileViewController;
    self->__photoTileViewController = v36;

    -[PLPhotoTileViewController view](self->__photoTileViewController, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFrame:", v26, v28, v30, v32);

    -[PLPhotoTileViewController view](self->__photoTileViewController, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setBackgroundColor:", v40);

    -[PLPhotoTileViewController setShouldSupressViewWillTransitionToSize:](self->__photoTileViewController, "setShouldSupressViewWillTransitionToSize:", 1);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoURL"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v55 = &v54;
    v56 = 0x2050000000;
    v42 = (void *)getPLVideoViewClass_softClass;
    v57 = getPLVideoViewClass_softClass;
    if (!getPLVideoViewClass_softClass)
    {
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __getPLVideoViewClass_block_invoke;
      v53[3] = &unk_1EA329140;
      v53[4] = &v54;
      __getPLVideoViewClass_block_invoke((uint64_t)v53);
      v42 = (void *)v55[3];
    }
    v43 = objc_retainAutorelease(v42);
    _Block_object_dispose(&v54, 8);
    objc_msgSend(v43, "videoViewForVideoFileAtURL:", v41);
    v44 = (PLVideoView *)objc_claimAutoreleasedReturnValue();
    v45 = self->__videoView;
    self->__videoView = v44;

    -[PLVideoView setFrame:](self->__videoView, "setFrame:", v26, v28, v30, v32);
    -[PLVideoView setDelegate:](self->__videoView, "setDelegate:", self);
    -[PLVideoView setShowsScrubber:](self->__videoView, "setShowsScrubber:", 1);
    -[PLVideoView setShowsPlayOverlay:](self->__videoView, "setShowsPlayOverlay:", 0);
    -[PLVideoView setCanEdit:](self->__videoView, "setCanEdit:", v50);
    -[PLVideoView setImageTile:](self->__videoView, "setImageTile:", self->__photoTileViewController);
    -[PLPhotoTileViewController setVideoView:](self->__photoTileViewController, "setVideoView:", self->__videoView);
    -[CAMImagePickerCameraViewController addChildViewController:](self, "addChildViewController:", self->__photoTileViewController);
    -[CAMImagePickerCameraViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoTileViewController view](self->__photoTileViewController, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAdditionalContentView:", v47);

    -[PLPhotoTileViewController didMoveToParentViewController:](self->__photoTileViewController, "didMoveToParentViewController:", self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "postNotificationName:object:", *MEMORY[0x1E0DC5918], 0);

    -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setPerformingReviewUsingOverlay:", 1);
    objc_msgSend(v15, "didCaptureVideo");

  }
  else
  {
    v33 = v12;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoURL"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMImagePickerCameraViewController _handleCapturedImagePickerVideoAtPath:withEditingMetadata:](self, "_handleCapturedImagePickerVideoAtPath:withEditingMetadata:", v35, 0);

  }
}

- (void)_removeFileAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAMImagePickerCameraViewController _removeFileAtPath:].cold.1((uint64_t)v3, (uint64_t)v6, v7);

  }
}

- (void)_resetTileViewControllerAndVideoView
{
  void *v3;
  void *v4;
  PLPhotoTileViewController *photoTileViewController;
  PLVideoView *videoView;
  id v7;

  -[CAMImagePickerCameraViewController _videoView](self, "_videoView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMImagePickerCameraViewController _photoTileViewController](self, "_photoTileViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);
  objc_msgSend(v3, "setVideoView:", 0);
  objc_msgSend(v7, "removeFromSuperview");
  objc_msgSend(v3, "willMoveToParentViewController:", 0);
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(v3, "removeFromParentViewController");
  photoTileViewController = self->__photoTileViewController;
  self->__photoTileViewController = 0;

  videoView = self->__videoView;
  self->__videoView = 0;

  -[CAMImagePickerCameraViewController _setMostRecentPhotoProperties:](self, "_setMostRecentPhotoProperties:", 0);
  -[CAMImagePickerCameraViewController _setMostRecentVideoProperties:](self, "_setMostRecentVideoProperties:", 0);

}

- (void)cropOverlayWasCancelled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!-[CAMImagePickerCameraViewController _isCurrentlyReviewing](self, "_isCurrentlyReviewing"))
  {
    -[CAMImagePickerCameraViewController _mostRecentVideoProperties](self, "_mostRecentVideoProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMImagePickerCameraViewController _removeFileAtPath:](self, "_removeFileAtPath:", v9);
    -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_imagePickerDidCancel");

    goto LABEL_7;
  }
  -[CAMImagePickerCameraViewController _setCurrentlyReviewing:](self, "_setCurrentlyReviewing:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0DC5920], 0);

  -[CAMImagePickerCameraViewController _photoTileViewController](self, "_photoTileViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForVideoFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[CAMImagePickerCameraViewController _removeFileAtPath:](self, "_removeFileAtPath:", v7);
  -[CAMImagePickerCameraViewController _resetTileViewControllerAndVideoView](self, "_resetTileViewControllerAndVideoView");
  if (-[CAMImagePickerCameraViewController _isUsingTelephonyUI](self, "_isUsingTelephonyUI"))
  {
    CAMLocalizedFrameworkString(CFSTR("TAKE_PICTURE"), &stru_1EA3325A0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v8);

    objc_msgSend(v12, "setOKButtonShowsCamera:", 1);
    -[CAMImagePickerCameraViewController _currentCancelButtonTitle](self, "_currentCancelButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCancelButtonTitle:", v9);
LABEL_7:

  }
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPerformingReviewUsingOverlay:", 0);
  objc_msgSend(v12, "setEnabled:", 1);

}

- (void)cropOverlayWasOKed:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CAMImagePickerCameraViewController _isCurrentlyReviewing](self, "_isCurrentlyReviewing"))
  {
    v5 = -[CAMImagePickerCameraViewController _isEditingAllowed](self, "_isEditingAllowed");
    -[CAMImagePickerCameraViewController _photoTileViewController](self, "_photoTileViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isEditing"))
      {
        objc_msgSend(v8, "startTime");
        v10 = v9;
        objc_msgSend(v8, "endTime");
        v12 = v11;
        v17[0] = *MEMORY[0x1E0DC5938];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v13;
        v17[1] = *MEMORY[0x1E0DC5930];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(v8, "pathForVideoFile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMImagePickerCameraViewController _handleCapturedImagePickerVideoAtPath:withEditingMetadata:](self, "_handleCapturedImagePickerVideoAtPath:withEditingMetadata:", v16, v15);

    }
    else if (v5)
    {
      objc_msgSend(v4, "beginBackgroundSaveWithTile:progressTitle:completionCallbackTarget:options:", v6, 0, self, -[CAMImagePickerCameraViewController _photoSavingOptions](self, "_photoSavingOptions"));
    }
    else
    {
      -[CAMImagePickerCameraViewController cropOverlay:didFinishSaving:](self, "cropOverlay:didFinishSaving:", v4, 0);
    }

  }
}

- (void)cropOverlayPlay:(id)a3
{
  id v3;

  -[CAMImagePickerCameraViewController _videoView](self, "_videoView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "play");

}

- (void)cropOverlayPause:(id)a3
{
  id v3;

  -[CAMImagePickerCameraViewController _videoView](self, "_videoView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

}

- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4
{
  -[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:](self, "_handleCapturedImagePickerPhotoWithCropOverlayOutput:", a4);
}

- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[CAMImagePickerCameraViewController view](self, "view", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutFrame");
  v7 = v6;

  return v7;
}

- (BOOL)videoViewCanBeginPlayback:(id)a3
{
  return 0;
}

- (void)videoViewIsReadyToBeginPlayback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  id v17;

  v17 = a3;
  -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4CB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMImagePickerCameraViewController _isEditingAllowed](self, "_isEditingAllowed"))
  {
    LOBYTE(v7) = 0;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v7 = !-[CAMImagePickerCameraViewController _isVideoEditingAllowed](self, "_isVideoEditingAllowed");
    if (!v6)
      goto LABEL_8;
  }
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v17, "duration");
    v9 = v8;
    objc_msgSend(v6, "doubleValue");
    if (v9 > v10)
    {
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(v17, "setMaximumTrimLength:");
      objc_msgSend(v17, "setEditing:", 1);
      -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bottomBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      objc_msgSend(v17, "convertRect:fromView:", v12);
      v14 = v13;
      CAMLocalizedFrameworkString(CFSTR("VIDEO_TOO_LONG_TITLE"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v16 = v14;
      objc_msgSend(v17, "showTrimMessage:withBottomY:", v15, v16);

    }
  }
LABEL_8:

}

- (void)videoViewDidBeginPlayback:(id)a3
{
  id v3;

  -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didPlayVideo");

}

- (void)videoViewDidPausePlayback:(id)a3
{
  id v3;

  -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didPauseVideo");

}

- (void)videoViewDidEndPlayback:(id)a3 didFinish:(BOOL)a4
{
  id v4;

  -[CAMImagePickerCameraViewController _cropOverlay](self, "_cropOverlay", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didPauseVideo");

}

- (BOOL)photoTileViewControllerIsDisplayingLandscape:(id)a3
{
  return 0;
}

- (void)_handleCapturedImagePickerPhotoWithCropOverlayOutput:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _Unwind_Exception *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;

  v23 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v23);
  -[CAMImagePickerCameraViewController _mostRecentPhotoProperties](self, "_mostRecentPhotoProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerFullsizeImageData"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, *MEMORY[0x1E0D74F70]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoMetadata"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    +[CAMCaptureMetadataUtilities removeUnwantedKeysForPersistenceFromMetadata:](CAMCaptureMetadataUtilities, "removeUnwantedKeysForPersistenceFromMetadata:", v9);
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D74F68]);

  }
  -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMImagePickerCameraViewController _photoTileViewController](self, "_photoTileViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C68]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  v16 = v11;
  v17 = v12;
  v18 = v4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v19 = getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr;
  v27 = getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr;
  if (!getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr)
  {
    v20 = (void *)PhotoLibraryLibrary();
    v19 = dlsym(v20, "PLNotifyImagePickerOfImageAvailability");
    v25[3] = (uint64_t)v19;
    getPLNotifyImagePickerOfImageAvailabilitySymbolLoc_ptr = v19;
  }
  _Block_object_dispose(&v24, 8);
  if (!v19)
  {
    v21 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v24, 8);
    _Unwind_Resume(v21);
  }
  ((void (*)(id, id, _QWORD, id, uint64_t))v19)(v16, v17, 0, v18, v15);

  -[CAMImagePickerCameraViewController _setMostRecentPhotoProperties:](self, "_setMostRecentPhotoProperties:", 0);
}

- (void)_handleCapturedImagePickerVideoAtPath:(id)a3 withEditingMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  -[CAMImagePickerCameraViewController _containingImagePickerController](self, "_containingImagePickerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = v8;
  v11 = v9;
  v12 = v7;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v13 = getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr;
  v19 = getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr;
  if (!getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr)
  {
    v14 = (void *)PhotoLibraryLibrary();
    v13 = dlsym(v14, "PLNotifyImagePickerOfVideoAvailability");
    v17[3] = (uint64_t)v13;
    getPLNotifyImagePickerOfVideoAvailabilitySymbolLoc_ptr = v13;
  }
  _Block_object_dispose(&v16, 8);
  if (!v13)
  {
    v15 = (_Unwind_Exception *)-[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  ((void (*)(id, id, _QWORD, id))v13)(v10, v11, 0, v12);

  -[CAMImagePickerCameraViewController _setMostRecentVideoProperties:](self, "_setMostRecentVideoProperties:", 0, v16);
}

- (id)_containingImagePickerController
{
  void *v2;
  void *v3;
  id v4;

  -[CAMImagePickerCameraViewController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (int64_t)_imagePickerCameraCaptureModeForCaptureMode:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)_captureModeForImagePickerCameraCaptureMode:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)_imagePickerCameraDeviceForCaptureDevice:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return 0;
  else
    return qword_1DB9A57B8[a3 - 1];
}

- (int64_t)_captureDeviceForImagePickerCameraDevice:(int64_t)a3
{
  return a3 == 1;
}

- (int64_t)_imagePickerCameraFlashModeForFlashMode:(int64_t)a3
{
  int64_t v3;

  if (a3 == 2)
    v3 = 0;
  else
    v3 = -1;
  if (a3 == 1)
    return 1;
  else
    return v3;
}

- (int64_t)_flashModeForImagePickerCameraFlashMode:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 0);
}

- (int64_t)_imagePickerQualityTypeForVideoConfiguration:(int64_t)a3
{
  if ((unint64_t)(a3 - 10000) >= 6)
    return 1;
  else
    return a3 - 10000;
}

- (int64_t)_videoConfigurationForImagePickerQualityType:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
    return 0;
  else
    return a3 + 10000;
}

- (UIView)customOverlayView
{
  return self->_customOverlayView;
}

- (PLCropOverlay)_cropOverlay
{
  return self->__cropOverlay;
}

- (PLPhotoTileViewController)_photoTileViewController
{
  return self->__photoTileViewController;
}

- (PLVideoView)_videoView
{
  return self->__videoView;
}

- (BOOL)_isEditingAllowed
{
  return self->_editingAllowed;
}

- (BOOL)_isVideoEditingAllowed
{
  return self->_videoEditingAllowed;
}

- (void)_setVideoEditingAllowed:(BOOL)a3
{
  self->_videoEditingAllowed = a3;
}

- (BOOL)_isCurrentlyReviewing
{
  return self->_currentlyReviewing;
}

- (void)_setCurrentlyReviewing:(BOOL)a3
{
  self->_currentlyReviewing = a3;
}

- (BOOL)_isUsingTelephonyUI
{
  return self->_usingTelephonyUI;
}

- (void)_setUsingTelephonyUI:(BOOL)a3
{
  self->_usingTelephonyUI = a3;
}

- (int)_photoSavingOptions
{
  return self->_photoSavingOptions;
}

- (void)_setPhotoSavingOptions:(int)a3
{
  self->_photoSavingOptions = a3;
}

- (NSDictionary)_mostRecentPhotoProperties
{
  return self->_mostRecentPhotoProperties;
}

- (void)_setMostRecentPhotoProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (NSDictionary)_mostRecentVideoProperties
{
  return self->_mostRecentVideoProperties;
}

- (void)_setMostRecentVideoProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (BOOL)_statusBarWasHidden
{
  return self->_statusBarWasHidden;
}

- (void)_setStatusBarWasHidden:(BOOL)a3
{
  self->_statusBarWasHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentVideoProperties, 0);
  objc_storeStrong((id *)&self->_mostRecentPhotoProperties, 0);
  objc_storeStrong((id *)&self->__videoView, 0);
  objc_storeStrong((id *)&self->__photoTileViewController, 0);
  objc_storeStrong((id *)&self->__cropOverlay, 0);
  objc_storeStrong((id *)&self->_customOverlayView, 0);
}

- (void)_removeFileAtPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Failed to remove file at path %{public}@ (%{public}@)", (uint8_t *)&v3, 0x16u);
}

- (uint64_t)_handleCapturedImagePickerPhotoWithCropOverlayOutput:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getPLCropOverlayClass_block_invoke_cold_1(v0);
}

@end
