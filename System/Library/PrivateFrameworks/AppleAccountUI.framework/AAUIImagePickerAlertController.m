@implementation AAUIImagePickerAlertController

+ (id)alertControllerWithSelectionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSelectionHandler:", v3);

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUIImagePickerAlertController;
  -[AAUIImagePickerAlertController viewDidLoad](&v4, sel_viewDidLoad);
  -[AAUIImagePickerAlertController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUIImagePickerAlertController;
  -[AAUIImagePickerAlertController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[AAUIImagePickerAlertController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIImagePickerAlertController _presentImagePickerAnimated:](self, "_presentImagePickerAnimated:", v4 != 0);

}

- (int64_t)modalPresentationStyle
{
  return 6;
}

- (void)_presentImagePickerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  char v5;
  char v6;

  v3 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 0);
  if ((v5 & 1) != 0 || (v6 & 1) != 0)
    -[AAUIImagePickerAlertController _presentImageSourcePickerAnimated:](self, "_presentImageSourcePickerAnimated:", v3);
  else
    -[AAUIImagePickerAlertController _presentDocumentPickerAnimated:](self, "_presentDocumentPickerAnimated:", v3);
}

- (void)_presentImageSourcePickerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  BOOL v30;
  _QWORD v31[5];
  BOOL v32;
  _QWORD v33[5];
  BOOL v34;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  objc_msgSend(v5, "setPreferredStyle:", (v7 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Presenting image source picker...", buf, 2u);
  }

  v9 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 1);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PROFILE_TAKE_PHOTO"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v10;
    v33[1] = 3221225472;
    v33[2] = __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke;
    v33[3] = &unk_1EA2DCFF0;
    v33[4] = self;
    v34 = v3;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v14);

  }
  if (objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 0))
  {
    v15 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PROFILE_CHOOSE_PHOTO"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v10;
    v31[1] = 3221225472;
    v31[2] = __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_35;
    v31[3] = &unk_1EA2DCFF0;
    v31[4] = self;
    v32 = v3;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v18);

  }
  v19 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PROFILE_BROWSE_PHOTO"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v21 = v10;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_38;
  v29[3] = &unk_1EA2DCFF0;
  v29[4] = self;
  v30 = v3;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v22, 0, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v23);

  v24 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  v28[1] = 3221225472;
  v28[2] = __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_41;
  v28[3] = &unk_1EA2DB868;
  v28[4] = self;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 1, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v27);

  -[AAUIImagePickerAlertController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, v3, 0);
}

uint64_t __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User opted to select image from camera.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_presentImagePickerWithSourceType:animated:", 1, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_35(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User opted to select image from photo library.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_presentImagePickerWithSourceType:animated:", 0, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User opted to select image from document browser.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_presentDocumentPickerAnimated:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __68__AAUIImagePickerAlertController__presentImageSourcePickerAnimated___block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User opted to cancel photo selection, bailing!", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_callSelectionHandlerWithImage:cropRect:", 0, 0);
}

- (void)_presentImagePickerWithSourceType:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Presenting image picker controller with source type: %@", buf, 0xCu);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0DC3880]);
  objc_msgSend(v9, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  objc_msgSend(v9, "setSourceType:", a3);
  v13 = *MEMORY[0x1E0CA5B90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMediaTypes:", v11);

  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "_setImagePickerSavingOptions:", 3);
  -[AAUIImagePickerAlertController _propertiesForImagePickerController:](self, "_propertiesForImagePickerController:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setProperties:", v12);

  -[AAUIImagePickerAlertController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, v4, 0);
}

- (void)_presentDocumentPickerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Presenting document picker view controller", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0CA5B90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3730]), "initWithDocumentTypes:inMode:", v6, 0);
  objc_msgSend(v7, "presentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  objc_msgSend(v7, "setShouldShowFileExtensions:", 0);
  objc_msgSend(v7, "setAllowsMultipleSelection:", 0);
  objc_msgSend(v7, "setDelegate:", self);
  -[AAUIImagePickerAlertController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, v3, 0);

}

- (void)_callSelectionHandlerWithImage:(id)a3 cropRect:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[AAUIImagePickerAlertController selectionHandler](self, "selectionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AAUIImagePickerAlertController selectionHandler](self, "selectionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

    -[AAUIImagePickerAlertController setSelectionHandler:](self, "setSelectionHandler:", 0);
  }
  -[AAUIImagePickerAlertController _dismissViewController:animated:completion:](self, "_dismissViewController:animated:completion:", self, 0, 0);

}

- (id)_propertiesForImagePickerController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(a3, "_properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0DC5910];
  v11[0] = *MEMORY[0x1E0DC4C68];
  v11[1] = v6;
  v12[0] = MEMORY[0x1E0C9AAB0];
  v12[1] = MEMORY[0x1E0C9AAB0];
  v7 = *MEMORY[0x1E0DC58C8];
  v11[2] = *MEMORY[0x1E0DC5860];
  v11[3] = v7;
  v12[2] = MEMORY[0x1E0C9AAB0];
  v12[3] = MEMORY[0x1E0C9AAB0];
  v11[4] = *MEMORY[0x1E0DC5858];
  v12[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0DC4CA0];
  v8 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "User selected new profile picture: %@, crop rect: %@", buf, 0x16u);
  }

  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3880], "aaui_fixedCropRect:forOriginalImage:", v10, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "Updated profile picture crop rect: %@", buf, 0xCu);
    }

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__AAUIImagePickerAlertController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
  v18[3] = &unk_1EA2DB818;
  v18[4] = self;
  v19 = v9;
  v20 = v13;
  v16 = v13;
  v17 = v9;
  -[AAUIImagePickerAlertController _dismissViewController:animated:completion:](self, "_dismissViewController:animated:completion:", v6, 1, v18);

}

uint64_t __86__AAUIImagePickerAlertController_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callSelectionHandlerWithImage:cropRect:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "User canceled image picker controller.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__AAUIImagePickerAlertController_imagePickerControllerDidCancel___block_invoke;
  v6[3] = &unk_1EA2DB208;
  v6[4] = self;
  -[AAUIImagePickerAlertController _dismissViewController:animated:completion:](self, "_dismissViewController:animated:completion:", v4, 1, v6);

}

uint64_t __65__AAUIImagePickerAlertController_imagePickerControllerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callSelectionHandlerWithImage:cropRect:", 0, 0);
}

- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v8;
  void *v9;
  AAUIImagePickerAlertController *v10;
  AAUIImagePickerAlertController *v11;
  id v12;

  v5 = a4;
  v12 = a5;
  objc_msgSend(a3, "presentingViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (AAUIImagePickerAlertController *)v8;
  else
    v10 = self;
  v11 = v10;

  -[AAUIImagePickerAlertController dismissViewControllerAnimated:completion:](v11, "dismissViewControllerAnimated:completion:", v5, v12);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a4, "firstObject", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithContentsOfURL:options:error:", v6, 0, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC3880]);
    v8 = (void *)objc_msgSend(v7, "_initWithSourceImageData:cropRect:", v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v8, "presentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    objc_msgSend(v8, "setModalInPresentation:", 1);
    -[AAUIImagePickerAlertController _propertiesForImagePickerController:](self, "_propertiesForImagePickerController:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setProperties:", v10);

    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      objc_msgSend(v8, "setModalPresentationStyle:", 0);
    -[AAUIImagePickerAlertController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    -[AAUIImagePickerAlertController _callSelectionHandlerWithImage:cropRect:](self, "_callSelectionHandlerWithImage:cropRect:", 0, 0);
  }

}

- (void)documentPickerWasCancelled:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "User cancelled document picker view controller.", v5, 2u);
  }

  -[AAUIImagePickerAlertController _callSelectionHandlerWithImage:cropRect:](self, "_callSelectionHandlerWithImage:cropRect:", 0, 0);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;

  v3 = a3;
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "modalPresentationStyle");

  objc_msgSend(v3, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == -2)
    v7 = objc_msgSend(v6, "_preferredModalPresentationStyle");
  else
    v7 = objc_msgSend(v6, "modalPresentationStyle");
  v8 = v7;

  return v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Presentation controller did dismiss with card UI swipe.", v5, 2u);
  }

  -[AAUIImagePickerAlertController _callSelectionHandlerWithImage:cropRect:](self, "_callSelectionHandlerWithImage:cropRect:", 0, 0);
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
}

@end
