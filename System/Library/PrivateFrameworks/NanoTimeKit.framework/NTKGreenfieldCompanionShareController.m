@implementation NTKGreenfieldCompanionShareController

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_106);
  return (id)sharedController_controller;
}

void __57__NTKGreenfieldCompanionShareController_sharedController__block_invoke()
{
  NTKGreenfieldCompanionShareController *v0;
  void *v1;

  v0 = objc_alloc_init(NTKGreenfieldCompanionShareController);
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;

}

- (void)shareWatchFace:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  NTKFace *updatedFace;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_storeWeak((id *)&self->_face, v6);
  updatedFace = self->_updatedFace;
  self->_updatedFace = 0;

  objc_storeWeak((id *)&self->_originatedViewController, v7);
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __75__NTKGreenfieldCompanionShareController_shareWatchFace_fromViewController___block_invoke;
  v13 = &unk_1E6BCD7F0;
  objc_copyWeak(&v14, &location);
  v9 = (void (**)(_QWORD))_Block_copy(&v10);
  if (+[NTKGreenfieldUtilities shouldPresentUnreleasedFeaturesInternalWarningForFace:](NTKGreenfieldUtilities, "shouldPresentUnreleasedFeaturesInternalWarningForFace:", v6, v10, v11, v12, v13))
  {
    -[NTKGreenfieldCompanionShareController _presentInternalWarningIfNeededWithContinueBlock:](self, "_presentInternalWarningIfNeededWithContinueBlock:", v9);
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __75__NTKGreenfieldCompanionShareController_shareWatchFace_fromViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startFaceSharing");

}

- (void)_presentInternalWarningIfNeededWithContinueBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Warning"), CFSTR("This face is not released or contains complications that are not released. Please make sure it will not be shared with undisclosed individuals."), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__NTKGreenfieldCompanionShareController__presentInternalWarningIfNeededWithContinueBlock___block_invoke;
  v11[3] = &unk_1E6BD56F8;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "actionWithTitle:style:handler:", CFSTR("I Agree"), 2, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);
  objc_msgSend(v5, "addAction:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_originatedViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);

}

uint64_t __90__NTKGreenfieldCompanionShareController__presentInternalWarningIfNeededWithContinueBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_startFaceSharing
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_face);
  v4 = objc_msgSend(WeakRetained, "faceStyle");

  if (v4 == 22)
    -[NTKGreenfieldCompanionShareController _showPhotosPickerView](self, "_showPhotosPickerView");
  else
    -[NTKGreenfieldCompanionShareController _prepareForShareSheet](self, "_prepareForShareSheet");
}

- (void)_showPhotosPickerView
{
  NTKFace **p_face;
  id WeakRetained;
  char isKindOfClass;
  NTKGreenfieldCompanionSharePhotosPickerViewController *v6;
  NTKCNavigationController *v7;
  id v8;
  id v9;

  p_face = &self->_face;
  WeakRetained = objc_loadWeakRetained((id *)&self->_face);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_face);
    v6 = -[NTKGreenfieldCompanionSharePhotosPickerViewController initWithPhotosFace:]([NTKGreenfieldCompanionSharePhotosPickerViewController alloc], "initWithPhotosFace:", v9);
    -[NTKGreenfieldCompanionSharePhotosPickerViewController setDelegate:](v6, "setDelegate:", self);
    v7 = -[NTKCNavigationController initWithRootViewController:]([NTKCNavigationController alloc], "initWithRootViewController:", v6);
    -[NTKCNavigationController setModalInPresentation:](v7, "setModalInPresentation:", 1);
    v8 = objc_loadWeakRetained((id *)&self->_originatedViewController);
    objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

- (void)_prepareForShareSheet
{
  NTKFace *updatedFace;
  NTKFace *WeakRetained;
  NTKFace *v5;
  NTKGreenfieldDraftRecipe *v6;
  NTKGreenfieldDraftRecipe *v7;
  _QWORD v8[4];
  NTKGreenfieldDraftRecipe *v9;
  id v10;
  id location;

  updatedFace = self->_updatedFace;
  if (updatedFace)
    WeakRetained = updatedFace;
  else
    WeakRetained = (NTKFace *)objc_loadWeakRetained((id *)&self->_face);
  v5 = WeakRetained;
  v6 = -[NTKGreenfieldDraftRecipe initWithFace:]([NTKGreenfieldDraftRecipe alloc], "initWithFace:", WeakRetained);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__NTKGreenfieldCompanionShareController__prepareForShareSheet__block_invoke;
  v8[3] = &unk_1E6BD5720;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  +[NTKGreenfieldUtilities generateFacePreviewImageFromDraftRecipe:completionBlock:](NTKGreenfieldUtilities, "generateFacePreviewImageFromDraftRecipe:completionBlock:", v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __62__NTKGreenfieldCompanionShareController__prepareForShareSheet__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      objc_msgSend(WeakRetained, "_presentShareSheetWithDraftRecipe:previewImage:", *(_QWORD *)(a1 + 32), v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_encodeWatchFaceErrorWithCode:message:", 2, CFSTR("Preview Image is nil"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_handleError:", v5);

    }
  }

}

- (void)_presentShareSheetWithDraftRecipe:(id)a3 previewImage:(id)a4
{
  id v6;
  id v7;
  NTKGreenfieldCompanionActivityViewController *v8;
  id v9;
  void *v10;
  id WeakRetained;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[NTKGreenfieldCompanionActivityViewController initWithDraftRecipe:previewImage:]([NTKGreenfieldCompanionActivityViewController alloc], "initWithDraftRecipe:previewImage:", v6, v7);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__NTKGreenfieldCompanionShareController__presentShareSheetWithDraftRecipe_previewImage___block_invoke;
  aBlock[3] = &unk_1E6BD5748;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v13 = v9;
  v10 = _Block_copy(aBlock);
  -[NTKGreenfieldCompanionActivityViewController setCompletionWithItemsHandler:](v8, "setCompletionWithItemsHandler:", v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_originatedViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

  objc_storeWeak((id *)&self->_activityViewController, v8);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __88__NTKGreenfieldCompanionShareController__presentShareSheetWithDraftRecipe_previewImage___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;

  v12 = a2;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_handleError:", v10);

  }
  else if (a3)
  {
    NTKSubmitAnalyticsForSharedFace(v12, *(void **)(a1 + 32));
  }

}

- (void)_handleError:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[4];
  id v13;
  NTKGreenfieldCompanionShareController *v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__NTKGreenfieldCompanionShareController__handleError___block_invoke;
  aBlock[3] = &unk_1E6BCD778;
  v13 = v4;
  v14 = self;
  v6 = v4;
  v7 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_originatedViewController);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __54__NTKGreenfieldCompanionShareController__handleError___block_invoke_2;
  v10[3] = &unk_1E6BCDF60;
  v11 = v7;
  v9 = v7;
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v10);

}

void __54__NTKGreenfieldCompanionShareController__handleError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_GENERATE_RECIPE_ERROR_ALERT_TITLE"), CFSTR("Unable to Share at This Time"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_GENERATE_RECIPE_ERROR_ALERT_DESCRIPTION"), CFSTR("Try again later."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_GENERATE_RECIPE_ERROR_ALERT_OK_BUTON_TITLE"), CFSTR("OK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (NTKInternalBuild(v3, v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\n[Internal Only]\nPlease file a radar and include a sysdiagnose. Error: reason: %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v2, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v3, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v8);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v7, 1, 0);

}

uint64_t __54__NTKGreenfieldCompanionShareController__handleError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)companionSharePhotosPickerViewController:(id)a3 didFinishWithFace:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_updatedFace, a4);
    -[NTKGreenfieldCompanionShareController _prepareForShareSheet](self, "_prepareForShareSheet");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_encodeWatchFaceErrorWithCode:message:", 3, CFSTR("Failed to generate the new photos face."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldCompanionShareController _handleError:](self, "_handleError:", v6);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_destroyWeak((id *)&self->_originatedViewController);
  objc_storeStrong((id *)&self->_updatedFace, 0);
  objc_destroyWeak((id *)&self->_face);
}

@end
