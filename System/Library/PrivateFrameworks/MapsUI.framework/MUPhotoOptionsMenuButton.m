@implementation MUPhotoOptionsMenuButton

+ (id)buttonWithDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[MUPhotoOptionsMenuButton buttonWithType:](MUPhotoOptionsMenuButton, "buttonWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  if (+[MUPhotoOptionsMenuButton _numberOfSupportedSourceTypes](MUPhotoOptionsMenuButton, "_numberOfSupportedSourceTypes") < 2)
  {
    objc_msgSend(v4, "_setTouchEvent");
  }
  else
  {
    objc_msgSend(v4, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v4, "_setActionMenu");
  }
  return v4;
}

+ (id)menuForPhotoOptionsMenuButtonWithCameraCompletion:(id)a3 libraryCompletion:(id)a4
{
  return (id)objc_msgSend(a1, "menuForPhotoOptionsMenuButtonWithTitle:symbol:cameraCompletion:libraryCompletion:", 0, 0, a3, a4);
}

+ (id)menuForPhotoOptionsMenuButtonWithTitle:(id)a3 symbol:(id)a4 cameraCompletion:(id)a5 libraryCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[MUPhotoOptionsMenuButton _supportsCamera](MUPhotoOptionsMenuButton, "_supportsCamera");
  if (+[MUPhotoOptionsMenuButton _supportsPhotoLibrary](MUPhotoOptionsMenuButton, "_supportsPhotoLibrary"))
  {
    v15 = (void *)MEMORY[0x1E0DC3428];
    _MULocalizedStringFromThisBundle(CFSTR("Choose Existing [Placecard]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo.on.rectangle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __109__MUPhotoOptionsMenuButton_menuForPhotoOptionsMenuButtonWithTitle_symbol_cameraCompletion_libraryCompletion___block_invoke;
    v30[3] = &unk_1E2E028D8;
    v31 = v12;
    objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, v17, 0, v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("ChooseExistingPhotoMenuAction"));
    objc_msgSend(v13, "addObject:", v18);

  }
  if (v14)
  {
    v19 = (void *)MEMORY[0x1E0DC3428];
    _MULocalizedStringFromThisBundle(CFSTR("Take New Photo [Placecard]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("camera"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __109__MUPhotoOptionsMenuButton_menuForPhotoOptionsMenuButtonWithTitle_symbol_cameraCompletion_libraryCompletion___block_invoke_2;
    v28 = &unk_1E2E028D8;
    v29 = v11;
    objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v20, v21, 0, &v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("TakeNewPhotoMenuAction"), v25, v26, v27, v28);
    objc_msgSend(v13, "addObject:", v22);

  }
  if ((unint64_t)objc_msgSend(v13, "count") < 2)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v9, v10, 0, 0, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("AddPhotosMenuAction"));
  }

  return v23;
}

uint64_t __109__MUPhotoOptionsMenuButton_menuForPhotoOptionsMenuButtonWithTitle_symbol_cameraCompletion_libraryCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __109__MUPhotoOptionsMenuButton_menuForPhotoOptionsMenuButtonWithTitle_symbol_cameraCompletion_libraryCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setActionMenu
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MUPhotoOptionsMenuButton__setActionMenu__block_invoke;
  v7[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v8, &location);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __42__MUPhotoOptionsMenuButton__setActionMenu__block_invoke_2;
  v5[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v6, &location);
  +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:](MUPhotoOptionsMenuButton, "menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:", v7, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoOptionsMenuButton setMenu:](self, "setMenu:", v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __42__MUPhotoOptionsMenuButton__setActionMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_didSelectTakePhoto");
    WeakRetained = v2;
  }

}

void __42__MUPhotoOptionsMenuButton__setActionMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_didSelectAddFromLibrary");
    WeakRetained = v2;
  }

}

- (MUPhotoOptionsMenuButton)initWithFrame:(CGRect)a3
{
  MUPhotoOptionsMenuButton *v3;
  MUPhotoOptionsMenuButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPhotoOptionsMenuButton;
  v3 = -[MUPhotoOptionsMenuButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUPhotoOptionsMenuButton setPreferredMenuElementOrder:](v3, "setPreferredMenuElementOrder:", 2);
  return v4;
}

- (void)_setTouchEvent
{
  -[MUPhotoOptionsMenuButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__didTapOnMenuButton, 64);
}

- (void)_didTapOnMenuButton
{
  _BOOL4 v3;
  _BOOL4 v4;

  v3 = +[MUPhotoOptionsMenuButton _supportsCamera](MUPhotoOptionsMenuButton, "_supportsCamera");
  v4 = +[MUPhotoOptionsMenuButton _supportsPhotoLibrary](MUPhotoOptionsMenuButton, "_supportsPhotoLibrary");
  if (v3)
  {
    -[MUPhotoOptionsMenuButton _didSelectTakePhoto](self, "_didSelectTakePhoto");
  }
  else if (v4)
  {
    -[MUPhotoOptionsMenuButton _didSelectAddFromLibrary](self, "_didSelectAddFromLibrary");
  }
}

- (void)_didSelectTakePhoto
{
  id WeakRetained;

  -[MUPhotoOptionsMenuButton _captureUserAction:](self, "_captureUserAction:", 2146);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "photoOptionsMenuButtonDidSelectTakePhoto");

}

- (void)_didSelectAddFromLibrary
{
  id WeakRetained;

  -[MUPhotoOptionsMenuButton _captureUserAction:](self, "_captureUserAction:", 2145);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "photoOptionsMenuButtonDidSelectAddFromLibrary");

}

- (void)_captureUserAction:(int)a3
{
  objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", *(_QWORD *)&a3, 620, 0);
}

+ (BOOL)_supportsCamera
{
  void *v2;
  BOOL v3;

  if (!objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 1))
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 5;

  return v3;
}

+ (BOOL)_supportsPhotoLibrary
{
  return objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 0);
}

+ (unint64_t)_numberOfSupportedSourceTypes
{
  _BOOL4 v2;
  _BOOL4 v3;
  unint64_t v4;

  v2 = +[MUPhotoOptionsMenuButton _supportsCamera](MUPhotoOptionsMenuButton, "_supportsCamera");
  v3 = +[MUPhotoOptionsMenuButton _supportsPhotoLibrary](MUPhotoOptionsMenuButton, "_supportsPhotoLibrary");
  v4 = 1;
  if (v2)
    v4 = 2;
  if (v3)
    return v4;
  else
    return v2;
}

+ (int64_t)preferredEntryPoint
{
  _BOOL4 v2;
  _BOOL4 v3;
  int64_t v4;

  v2 = +[MUPhotoOptionsMenuButton _supportsCamera](MUPhotoOptionsMenuButton, "_supportsCamera");
  v3 = +[MUPhotoOptionsMenuButton _supportsPhotoLibrary](MUPhotoOptionsMenuButton, "_supportsPhotoLibrary");
  v4 = 2;
  if (!v3)
    v4 = 0;
  if (v2)
    return !v3;
  else
    return v4;
}

- (MUPhotoOptionsMenuButtonDelegate)delegate
{
  return (MUPhotoOptionsMenuButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
