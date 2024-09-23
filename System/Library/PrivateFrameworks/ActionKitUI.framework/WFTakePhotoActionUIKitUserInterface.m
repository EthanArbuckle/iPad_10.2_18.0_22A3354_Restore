@implementation WFTakePhotoActionUIKitUserInterface

- (WFTakePhotoActionUIKitUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  WFTakePhotoActionUIKitUserInterface *v9;
  WFTakePhotoActionUIKitUserInterface *v10;
  objc_super v12;

  v5 = (void *)MEMORY[0x24BEC1448];
  v6 = *MEMORY[0x24BEC17D8];
  v7 = a3;
  objc_msgSend(v5, "attributionWithAppBundleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)WFTakePhotoActionUIKitUserInterface;
  v9 = -[WFActionUserInterface initWithUserInterfaceType:attribution:](&v12, sel_initWithUserInterfaceType_attribution_, v7, v8);

  if (v9)
    v10 = v9;

  return v9;
}

- (id)setupControllerWithOverlay:(id)a3
{
  id v4;
  WFImagePickerController *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(WFImagePickerController);
  -[WFImagePickerController setDelegate:](v5, "setDelegate:", self);
  -[WFImagePickerController setSourceType:](v5, "setSourceType:", 1);
  -[WFImagePickerController setCameraDevice:](v5, "setCameraDevice:", -[WFTakePhotoActionUIKitUserInterface device](self, "device"));
  if (v4)
  {
    -[WFImagePickerController cameraOverlayView](v5, "cameraOverlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    objc_msgSend(v4, "setFrame:");

    objc_msgSend(v4, "setAutoresizingMask:", 18);
    objc_msgSend(v4, "setPickerController:", v5);
    -[WFImagePickerController setCameraOverlayView:](v5, "setCameraOverlayView:", v4);
    -[WFImagePickerController setShowsCameraControls:](v5, "setShowsCameraControls:", 0);
  }
  -[WFTakePhotoActionUIKitUserInterface setPickerController:](self, "setPickerController:", v5);

  return v5;
}

- (void)setUpTapInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WFTakePhotoActionUIKitUserInterface_setUpTapInterface__block_invoke;
  block[3] = &unk_24E343958;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)setUpImmediateInterfaceWithAttribution:(id)a3
{
  id v4;
  id v5;
  WFTakePhotoImmediateModeManager *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  WFTakePhotoActionUIKitUserInterface *v12;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__WFTakePhotoActionUIKitUserInterface_setUpImmediateInterfaceWithAttribution___block_invoke;
  block[3] = &unk_24E3439C0;
  v5 = v4;
  v11 = v5;
  v12 = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v6 = -[WFTakePhotoImmediateModeManager initWithCameraPosition:delegate:]([WFTakePhotoImmediateModeManager alloc], "initWithCameraPosition:delegate:", -[WFTakePhotoActionUIKitUserInterface device](self, "device"), self);
  -[WFTakePhotoActionUIKitUserInterface setImmediateModeManager:](self, "setImmediateModeManager:", v6);

  -[WFTakePhotoActionUIKitUserInterface immediateModeManager](self, "immediateModeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v7, "startSessionWithError:", &v9);
  v8 = v9;

  if (v8)
    -[WFTakePhotoActionUIKitUserInterface finishWithError:](self, "finishWithError:", v8);

}

- (void)showWithCameraPreview:(BOOL)a3 photoCount:(unint64_t)a4 device:(id)a5 shortcutAttribution:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v10 = a3;
  v17 = a5;
  v13 = a6;
  v14 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTakePhotoActionUIKitUserInterface.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFTakePhotoActionUIKitUserInterface setShowPreview:](self, "setShowPreview:", v10);
  -[WFTakePhotoActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v14);
  -[WFTakePhotoActionUIKitUserInterface setDevice:](self, "setDevice:", objc_msgSend((id)objc_opt_class(), "cameraDeviceFromString:", v17));
  -[WFTakePhotoActionUIKitUserInterface setRemainingPhotos:](self, "setRemainingPhotos:", a4);
  v15 = objc_alloc_init(MEMORY[0x24BE19438]);
  -[WFTakePhotoActionUIKitUserInterface setOutputCollection:](self, "setOutputCollection:", v15);

  if (-[WFTakePhotoActionUIKitUserInterface showPreview](self, "showPreview"))
    -[WFTakePhotoActionUIKitUserInterface setUpTapInterface](self, "setUpTapInterface");
  else
    -[WFTakePhotoActionUIKitUserInterface setUpImmediateInterfaceWithAttribution:](self, "setUpImmediateInterfaceWithAttribution:", v13);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFTakePhotoActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __79__WFTakePhotoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFTakePhotoActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;

  v11 = a3;
  -[WFTakePhotoActionUIKitUserInterface outputCollection](self, "outputCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1618];
    -[WFTakePhotoActionUIKitUserInterface outputCollection](self, "outputCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[WFTakePhotoActionUIKitUserInterface completionHandler](self, "completionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFTakePhotoActionUIKitUserInterface completionHandler](self, "completionHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v10)[2](v10, v8, v11);

    -[WFTakePhotoActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB1AC8], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFTakePhotoActionUIKitUserInterface;
  -[WFTakePhotoActionUIKitUserInterface dealloc](&v4, sel_dealloc);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  UIImage *v7;
  UIImage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v6 = a3;
  objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BEBE320]);
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    UIImageJPEGRepresentation(v7, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoActionUIKitUserInterface addImageDataToOutput:](self, "addImageDataToOutput:", v9);

    -[WFTakePhotoActionUIKitUserInterface setRemainingPhotos:](self, "setRemainingPhotos:", -[WFTakePhotoActionUIKitUserInterface remainingPhotos](self, "remainingPhotos") - 1);
    objc_msgSend(v6, "cameraOverlayView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTakenPhotos:", objc_msgSend(v10, "totalPhotos") - -[WFTakePhotoActionUIKitUserInterface remainingPhotos](self, "remainingPhotos"));
    if (-[WFTakePhotoActionUIKitUserInterface remainingPhotos](self, "remainingPhotos")
      && -[WFTakePhotoActionUIKitUserInterface showPreview](self, "showPreview"))
    {
      objc_msgSend(v6, "cameraOverlayView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shutterButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnabled:", 1);

    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __91__WFTakePhotoActionUIKitUserInterface_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
      v13[3] = &unk_24E343958;
      v13[4] = self;
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v13);
    }

  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__WFTakePhotoActionUIKitUserInterface_imagePickerControllerDidCancel___block_invoke;
  v3[3] = &unk_24E343958;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)addImageDataToOutput:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "wf_datedFilenameWithTypeString:fileExtension:", v7, CFSTR("jpeg"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19628], "createTemporaryFileWithFilename:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "writeToURL:options:error:", v9, 0, &v16);

  v10 = v16;
  if (v10)
  {
    -[WFTakePhotoActionUIKitUserInterface finishWithError:](self, "finishWithError:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoActionUIKitUserInterface outputCollection](self, "outputCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BE19538];
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8438]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemWithFile:preferredFileType:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addItem:", v15);

  }
}

- (void)managerDidBecomeReady:(id)a3
{
  id v4;
  id v5;

  v5 = 0;
  objc_msgSend(a3, "takePhotoWithError:", &v5);
  v4 = v5;
  if (v4)
    -[WFTakePhotoActionUIKitUserInterface finishWithError:](self, "finishWithError:", v4);

}

- (void)manager:(id)a3 didFinishWithPhoto:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  objc_msgSend(a3, "stop");
  if (!v8)
  {
    objc_msgSend(v10, "fileDataRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoActionUIKitUserInterface addImageDataToOutput:](self, "addImageDataToOutput:", v9);

  }
  -[WFTakePhotoActionUIKitUserInterface finishWithError:](self, "finishWithError:", v8);

}

- (BOOL)showPreview
{
  return self->_showPreview;
}

- (void)setShowPreview:(BOOL)a3
{
  self->_showPreview = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (WFContentCollection)outputCollection
{
  return self->_outputCollection;
}

- (void)setOutputCollection:(id)a3
{
  objc_storeStrong((id *)&self->_outputCollection, a3);
}

- (unint64_t)remainingPhotos
{
  return self->_remainingPhotos;
}

- (void)setRemainingPhotos:(unint64_t)a3
{
  self->_remainingPhotos = a3;
}

- (NSMutableArray)outputImages
{
  return self->_outputImages;
}

- (void)setOutputImages:(id)a3
{
  objc_storeStrong((id *)&self->_outputImages, a3);
}

- (int64_t)device
{
  return self->_device;
}

- (void)setDevice:(int64_t)a3
{
  self->_device = a3;
}

- (WFImagePickerController)pickerController
{
  return (WFImagePickerController *)objc_loadWeakRetained((id *)&self->_pickerController);
}

- (void)setPickerController:(id)a3
{
  objc_storeWeak((id *)&self->_pickerController, a3);
}

- (WFTakePhotoImmediateModeManager)immediateModeManager
{
  return self->_immediateModeManager;
}

- (void)setImmediateModeManager:(id)a3
{
  objc_storeStrong((id *)&self->_immediateModeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_immediateModeManager, 0);
  objc_destroyWeak((id *)&self->_pickerController);
  objc_storeStrong((id *)&self->_outputImages, 0);
  objc_storeStrong((id *)&self->_outputCollection, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

void __70__WFTakePhotoActionUIKitUserInterface_imagePickerControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

uint64_t __91__WFTakePhotoActionUIKitUserInterface_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", 0);
}

uint64_t __79__WFTakePhotoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __78__WFTakePhotoActionUIKitUserInterface_setUpImmediateInterfaceWithAttribution___block_invoke(uint64_t a1)
{
  WFTakePhotoNotificationView *v2;
  id v3;
  WFTakePhotoNotificationView *v4;

  v2 = [WFTakePhotoNotificationView alloc];
  v4 = -[WFTakePhotoNotificationView initWithFrame:shortcutAttribution:](v2, "initWithFrame:shortcutAttribution:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v3 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  objc_msgSend(v3, "setView:", v4);
  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v3);

}

void __56__WFTakePhotoActionUIKitUserInterface_setUpTapInterface__block_invoke(uint64_t a1)
{
  WFCameraOverlayView *v2;
  void *v3;
  _QWORD v4[4];
  WFCameraOverlayView *v5;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "remainingPhotos") < 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_alloc_init(WFCameraOverlayView);
    -[WFCameraOverlayView setTotalPhotos:](v2, "setTotalPhotos:", objc_msgSend(*(id *)(a1 + 32), "remainingPhotos"));
  }
  objc_msgSend(*(id *)(a1 + 32), "setupControllerWithOverlay:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __56__WFTakePhotoActionUIKitUserInterface_setUpTapInterface__block_invoke_2;
    v4[3] = &unk_24E342920;
    v5 = v2;
    objc_msgSend(v3, "setMagicTapHandler:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "presentContent:", v3);

}

uint64_t __56__WFTakePhotoActionUIKitUserInterface_setUpTapInterface__block_invoke_2(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "shutterButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 64);

  return 1;
}

+ (int64_t)cameraDeviceFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE01060])
    || (v4 = 0, (objc_msgSend(MEMORY[0x24BEBD658], "isCameraDeviceAvailable:", 0) & 1) == 0))
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE01068])
      || (v4 = 1, (objc_msgSend(MEMORY[0x24BEBD658], "isCameraDeviceAvailable:", 1) & 1) == 0))
    {
      v4 = 0;
    }
  }

  return v4;
}

@end
