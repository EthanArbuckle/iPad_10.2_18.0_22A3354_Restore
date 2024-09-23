@implementation WFSetWallpaperActionUIKitUserInterface

- (void)showPreviewForConfiguration:(id)a3 selectedPoster:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  WFSetWallpaperActionUIKitUserInterface *v21;
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFSetWallpaperActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v10);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v11 = (void *)getPRSServiceClass_softClass;
  v27 = getPRSServiceClass_softClass;
  v12 = MEMORY[0x24BDAC760];
  if (!getPRSServiceClass_softClass)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __getPRSServiceClass_block_invoke;
    v23[3] = &unk_24E343A50;
    v23[4] = &v24;
    __getPRSServiceClass_block_invoke((uint64_t)v23);
    v11 = (void *)v25[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v24, 8);
  v14 = objc_alloc_init(v13);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke;
  v18[3] = &unk_24E343650;
  v19 = v9;
  v20 = v8;
  v21 = self;
  v22 = v10;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  objc_msgSend(v14, "fetchPosterConfigurationsForExtension:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), v18);

}

- (void)showPreviewWithInput:(id)a3 key:(id)a4 wallpaperLocation:(int64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  int64_t v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    if (a5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSetWallpaperActionUIKitUserInterface.m"), 96, CFSTR("You must have a valid wallpaper location to set a wallpaper"));

    goto LABEL_3;
  }
  if (!a5)
    goto LABEL_5;
LABEL_3:
  -[WFSetWallpaperActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v13);
  v14 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke;
  v20[3] = &unk_24E3436C8;
  v20[4] = self;
  v21 = v12;
  v22 = a5;
  v16 = v12;
  v17 = (id)objc_msgSend(v14, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v15, v20);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFSetWallpaperActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __82__WFSetWallpaperActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFSetWallpaperActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  if (!-[WFSetWallpaperActionUIKitUserInterface isiPad](self, "isiPad"))
  {
    -[WFActionUserInterface delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionUserInterface:setSupportedInterfaceOrientations:", self, 30);

  }
  -[WFSetWallpaperActionUIKitUserInterface completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFSetWallpaperActionUIKitUserInterface completionHandler](self, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
  -[WFSetWallpaperActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (BOOL)isiPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idiom") == 1;

  return v3;
}

- (void)wallpaperPreviewViewControllerCancelButtonPressed:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WFSetWallpaperActionUIKitUserInterface *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __92__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerCancelButtonPressed___block_invoke;
  v6[3] = &unk_24E3439C0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)wallpaperPreviewViewControllerSetButtonPressed:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v5 = -[WFSetWallpaperActionUIKitUserInterface locations](self, "locations");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke;
  v6[3] = &unk_24E3436F0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v4, "setWallpaperForLocations:completionHandler:", v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a4;
  -[WFSetWallpaperActionUIKitUserInterface completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5)
  {
    if (objc_msgSend(v9, "entryPointResult"))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WFSetWallpaperActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v7);

    v6 = v9;
  }

}

- (int64_t)locations
{
  return self->_locations;
}

- (void)setLocations:(int64_t)a3
{
  self->_locations = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

void __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke_2;
  v2[3] = &unk_24E3436F0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
}

void __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke_3;
  v3[3] = &unk_24E343958;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t __89__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerSetButtonPressed___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", 0);
}

uint64_t __92__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerCancelButtonPressed___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __92__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerCancelButtonPressed___block_invoke_2;
  v3[3] = &unk_24E343958;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __92__WFSetWallpaperActionUIKitUserInterface_wallpaperPreviewViewControllerCancelButtonPressed___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

uint64_t __82__WFSetWallpaperActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke_2;
  v8[3] = &unk_24E3436A0;
  v4 = (void *)a1[5];
  v8[4] = a1[4];
  v5 = v4;
  v6 = a1[6];
  v9 = v5;
  v10 = v6;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, objc_opt_class());

}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke_3;
  v9[3] = &unk_24E343678;
  v4 = a1[4];
  v5 = (void *)a1[5];
  v10 = v3;
  v11 = v4;
  v6 = v5;
  v7 = a1[6];
  v12 = v6;
  v13 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewWithInput_key_wallpaperLocation_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  WFSetWallpaperWrapperViewController *v10;
  WFSetWallpaperWrapperViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  WFSetWallpaperWrapperViewController *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  Class (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v2 = (void *)getSBFWallpaperOptionsClass_softClass;
    v40 = getSBFWallpaperOptionsClass_softClass;
    if (!getSBFWallpaperOptionsClass_softClass)
    {
      v32 = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = __getSBFWallpaperOptionsClass_block_invoke;
      v35 = &unk_24E343A50;
      v36 = &v37;
      __getSBFWallpaperOptionsClass_block_invoke((uint64_t)&v32);
      v2 = (void *)v38[3];
    }
    v3 = objc_retainAutorelease(v2);
    _Block_object_dispose(&v37, 8);
    v4 = objc_alloc_init(v3);
    objc_msgSend(v4, "setSupportsCropping:", 1);
    objc_msgSend(v4, "setHasVideo:", 0);
    v5 = *(_QWORD *)(a1 + 32);
    v43 = *(_QWORD *)(a1 + 48);
    v44[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(a1 + 48);
    v42 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLocations:", *(_QWORD *)(a1 + 56));
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v8 = (void *)getSBSUIWallpaperPreviewViewControllerClass_softClass;
    v40 = getSBSUIWallpaperPreviewViewControllerClass_softClass;
    if (!getSBSUIWallpaperPreviewViewControllerClass_softClass)
    {
      v32 = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = __getSBSUIWallpaperPreviewViewControllerClass_block_invoke;
      v35 = &unk_24E343A50;
      v36 = &v37;
      __getSBSUIWallpaperPreviewViewControllerClass_block_invoke((uint64_t)&v32);
      v8 = (void *)v38[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v37, 8);
    LOBYTE(v30) = 0;
    v10 = (WFSetWallpaperWrapperViewController *)objc_msgSend([v9 alloc], "initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:", v6, 0, -1, v7, 1, 1, v30);
    -[WFSetWallpaperWrapperViewController setPreviewDelegate:](v10, "setPreviewDelegate:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(a1 + 40), "isiPad"))
    {
      -[WFSetWallpaperWrapperViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 0);
      v11 = 0;
    }
    else
    {
      v11 = objc_alloc_init(WFSetWallpaperWrapperViewController);
      -[WFSetWallpaperWrapperViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 0);
      -[WFSetWallpaperWrapperViewController view](v11, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSetWallpaperWrapperViewController view](v10, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSubview:", v14);

      -[WFSetWallpaperWrapperViewController view](v11, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[WFSetWallpaperWrapperViewController view](v10, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

      -[WFSetWallpaperWrapperViewController view](v10, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAutoresizingMask:", 18);

      -[WFSetWallpaperWrapperViewController addChildViewController:](v11, "addChildViewController:", v10);
      -[WFSetWallpaperWrapperViewController didMoveToParentViewController:](v10, "didMoveToParentViewController:", v11);
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "actionUserInterface:setSupportedInterfaceOrientations:", *(_QWORD *)(a1 + 40), 2);

    }
    v28 = *(void **)(a1 + 40);
    v27 = (id *)(a1 + 40);
    if (objc_msgSend(v28, "isiPad"))
      v29 = v10;
    else
      v29 = v11;
    objc_msgSend(*v27, "presentContent:", v29);

  }
  else
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BE01010], "unableToGetImageError");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithError:", v31);

  }
}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke_2;
  block[3] = &unk_24E343628;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v2 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke_3;
  v18 = &unk_24E343600;
  v3 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v3, "if_firstObjectPassingTest:", &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v5 = (void *)getPRSPosterUpdateSessionInfoClass_softClass;
    v28 = getPRSPosterUpdateSessionInfoClass_softClass;
    if (!getPRSPosterUpdateSessionInfoClass_softClass)
    {
      v20 = v2;
      v21 = 3221225472;
      v22 = __getPRSPosterUpdateSessionInfoClass_block_invoke;
      v23 = &unk_24E343A50;
      v24 = &v25;
      __getPRSPosterUpdateSessionInfoClass_block_invoke((uint64_t)&v20);
      v5 = (void *)v26[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v25, 8);
    v7 = objc_alloc_init(v6);
    objc_msgSend(v7, "setShortcutsWallpaperConfiguration:", *(_QWORD *)(a1 + 48), v15, v16, v17, v18);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v8 = (void *)getPRUISModalEntryPointEditingClass_softClass;
    v28 = getPRUISModalEntryPointEditingClass_softClass;
    if (!getPRUISModalEntryPointEditingClass_softClass)
    {
      v20 = v2;
      v21 = 3221225472;
      v22 = __getPRUISModalEntryPointEditingClass_block_invoke;
      v23 = &unk_24E343A50;
      v24 = &v25;
      __getPRUISModalEntryPointEditingClass_block_invoke((uint64_t)&v20);
      v8 = (void *)v26[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v25, 8);
    v10 = (void *)objc_msgSend([v9 alloc], "initWithServiceConfiguration:updateSessionInfo:", v4, v7);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v11 = (void *)getPRUISModalRemoteViewControllerClass_softClass;
    v28 = getPRUISModalRemoteViewControllerClass_softClass;
    if (!getPRUISModalRemoteViewControllerClass_softClass)
    {
      v20 = v2;
      v21 = 3221225472;
      v22 = __getPRUISModalRemoteViewControllerClass_block_invoke;
      v23 = &unk_24E343A50;
      v24 = &v25;
      __getPRUISModalRemoteViewControllerClass_block_invoke((uint64_t)&v20);
      v11 = (void *)v26[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v25, 8);
    v13 = (void *)objc_msgSend([v12 alloc], "initWithEntryPoint:", v10);
    objc_msgSend(v13, "setModalPresentationStyle:", 0);
    objc_msgSend(v13, "setDelegate:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 56), "presentContent:", v13);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BE01010], "invalidPosterError", v15, v16, v17, v18);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v7);
  }

}

uint64_t __103__WFSetWallpaperActionUIKitUserInterface_showPreviewForConfiguration_selectedPoster_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "serverUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

@end
