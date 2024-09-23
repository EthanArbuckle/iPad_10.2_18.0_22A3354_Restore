@implementation HKEmergencyCardNameAndPictureTableItem

- (id)initInEditMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKEmergencyCardNameAndPictureTableItem.m"), 36, CFSTR("HKEmergencyCardNameAndPictureTableItem only supports edit mode"));

  }
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyCardNameAndPictureTableItem;
  return -[HKEmergencyCardTableItem initInEditMode:](&v8, sel_initInEditMode_, v3);
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("name"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cell
{
  HKMedicalIDEditorNameAndPhotoCell *cell;
  HKMedicalIDEditorNameAndPhotoCell *v4;
  HKMedicalIDEditorNameAndPhotoCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  cell = self->_cell;
  if (!cell)
  {
    v4 = -[HKMedicalIDEditorNameAndPhotoCell initWithStyle:reuseIdentifier:]([HKMedicalIDEditorNameAndPhotoCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_cell;
    self->_cell = v4;

    -[HKMedicalIDEditorCell setEditDelegate:](self->_cell, "setEditDelegate:", self);
    -[HKMedicalIDEditorMultilineStringCell setHeightChangeDelegate:](self->_cell, "setHeightChangeDelegate:", self);
    -[HKEmergencyCardNameAndPictureTableItem _updateMedicalIDPhotoMenu](self, "_updateMedicalIDPhotoMenu");
    -[HKMedicalIDEditorNameAndPhotoCell editPhotoButton](self->_cell, "editPhotoButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowsMenuAsPrimaryAction:", 1);

    -[HKMedicalIDEditorNameAndPhotoCell editPhotoLabelButton](self->_cell, "editPhotoLabelButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsMenuAsPrimaryAction:", 1);

    -[HKMedicalIDEditorNameAndPhotoCell editPhotoButton](self->_cell, "editPhotoButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__editPhotoTapped_, 64);

    -[HKMedicalIDEditorNameAndPhotoCell editPhotoLabelButton](self->_cell, "editPhotoLabelButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__editPhotoTapped_, 64);

    cell = self->_cell;
  }
  return cell;
}

- (void)_editPhotoTapped:(id)a3
{
  void *v4;
  id v5;

  -[HKEmergencyCardNameAndPictureTableItem _cell](self, "_cell", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitEditing");

  -[HKEmergencyCardNameAndPictureTableItem _cell](self, "_cell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4
{
  double v5;
  double result;

  objc_msgSend(a3, "frame");
  -[HKEmergencyCardNameAndPictureTableItem _cellFittedHeightWithWidth:](self, "_cellFittedHeightWithWidth:", v5);
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  double v5;
  double result;

  objc_msgSend(a3, "frame");
  -[HKEmergencyCardNameAndPictureTableItem _cellFittedHeightWithWidth:](self, "_cellFittedHeightWithWidth:", v5);
  return result;
}

- (double)_cellFittedHeightWithWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[HKEmergencyCardNameAndPictureTableItem _cell](self, "_cell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  -[HKEmergencyCardNameAndPictureTableItem _cell](self, "_cell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", a3, 1.79769313e308);
  v8 = v7;

  return v8;
}

- (void)medicalIDEditorCell:(id)a3 didChangeHeight:(double)a4 keepRectVisible:(CGRect)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a6;
  -[HKEmergencyCardNameAndPictureTableItem rowHeightChangeDelegate](self, "rowHeightChangeDelegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tableItem:heightDidChangeForRowIndex:keepRectVisible:inView:", self, 0, v11, x, y, width, height);

}

- (void)medicalIDEditorCellDidBeginEditing:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a5;
  -[HKEmergencyCardNameAndPictureTableItem rowHeightChangeDelegate](self, "rowHeightChangeDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableItemDidBeginEditing:keepRectVisible:inView:", self, v10, x, y, width, height);

}

- (void)medicalIDEditorCellDidChangeSelection:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a5;
  -[HKEmergencyCardNameAndPictureTableItem rowHeightChangeDelegate](self, "rowHeightChangeDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableItemDidChangeSelection:keepRectVisible:inView:", self, v10, x, y, width, height);

}

- (void)commitEditing
{
  -[HKMedicalIDEditorMultilineStringCell commitEditing](self->_cell, "commitEditing");
}

- (void)setData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKEmergencyCardNameAndPictureTableItem;
  -[HKEmergencyCardTableItem setData:](&v12, sel_setData_, a3);
  -[HKEmergencyCardNameAndPictureTableItem _cell](self, "_cell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardTableItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  -[HKEmergencyCardNameAndPictureTableItem _cell](self, "_cell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3870];
  -[HKEmergencyCardTableItem data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pictureData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPhoto:", v11);

}

- (void)_updateMedicalIDPhotoMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HKEmergencyCardNameAndPictureTableItem _makeMedicalIDPhotoMenu](self, "_makeMedicalIDPhotoMenu");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardNameAndPictureTableItem _cell](self, "_cell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editPhotoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMenu:", v7);

  -[HKEmergencyCardNameAndPictureTableItem _cell](self, "_cell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editPhotoLabelButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMenu:", v7);

}

- (id)_makeMedicalIDPhotoMenu
{
  int v3;
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
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_msgSend(MEMORY[0x1E0DC3880], "isSourceTypeAvailable:", 1);
  -[HKEmergencyCardTableItem data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pictureData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
  {
    v7 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("take_photo"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("camera"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke;
    v31[3] = &unk_1E9C40D30;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, v10, CFSTR("com.apple.health.medical_id.take_photo"), v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v11);
    objc_destroyWeak(&v32);
  }
  v12 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("choose_photo"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo.on.rectangle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_3;
  v29[3] = &unk_1E9C40D30;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, v15, CFSTR("com.apple.health.medical_id.choose_photo"), v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v16);
  if (v5)
  {
    v17 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("delete_photo"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_4;
    v27 = &unk_1E9C40D30;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v19, v20, CFSTR("com.apple.health.medical_id.delete_photo"), &v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setAttributes:", 2, v24, v25, v26, v27);
    objc_msgSend(v6, "addObject:", v21);

    objc_destroyWeak(&v28);
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9C4C428, 0, 0, 0, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  return v22;
}

void __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_2;
  v2[3] = &unk_1E9C40D08;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "_checkOrRequestForCameraAccessIfNeededWithCompletion:", v2);

}

void __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentCameraAuthorizationStatusDeniedAlert");
  }
  else if (a2 == 3)
  {
    HKLogCameraAccess();
    v3 = objc_alloc_init(MEMORY[0x1E0DC3880]);
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setSourceType:", 1);
    objc_msgSend(v3, "setCameraDevice:", 1);
    objc_msgSend(v3, "setAllowsEditing:", 1);
    v4 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v3, "_properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x1E0DC58C8];
    v10[0] = *MEMORY[0x1E0DC5910];
    v10[1] = v7;
    v11[0] = MEMORY[0x1E0C9AAB0];
    v11[1] = MEMORY[0x1E0C9AAB0];
    v10[2] = *MEMORY[0x1E0DC5858];
    v11[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v8);

    objc_msgSend(v3, "_setProperties:", v6);
    objc_msgSend(*(id *)(a1 + 32), "owningViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

void __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_3(uint64_t a1)
{
  id v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKLogPhotoAccess();
  v1 = objc_alloc_init(MEMORY[0x1E0DC3880]);
  objc_msgSend(v1, "setDelegate:", WeakRetained);
  objc_msgSend(v1, "setSourceType:", 0);
  objc_msgSend(v1, "setAllowsEditing:", 1);
  objc_msgSend(WeakRetained, "owningViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", v1, 1, 0);

}

void __65__HKEmergencyCardNameAndPictureTableItem__makeMedicalIDPhotoMenu__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPictureData:", 0);

  objc_msgSend(WeakRetained, "_cell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPhoto:", 0);

  objc_msgSend(WeakRetained, "_updateMedicalIDPhotoMenu");
}

- (void)_checkOrRequestForCameraAccessIfNeededWithCompletion:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  _QWORD v18[2];

  v3 = a3;
  v4 = (id)*MEMORY[0x1E0C8A808];
  v5 = objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", v4);
  v6 = v5;
  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
        -[HKEmergencyCardNameAndPictureTableItem _checkOrRequestForCameraAccessIfNeededWithCompletion:].cold.1(v6, v10);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_231;
      v11[3] = &unk_1E9C40D80;
      v7 = &v13;
      v13 = v3;
      v12 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v11);
      v9 = v12;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C8B0A0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_2;
      v14[3] = &unk_1E9C40DA8;
      v7 = &v16;
      v16 = v3;
      v15 = v4;
      objc_msgSend(v8, "requestAccessForMediaType:completionHandler:", v15, v14);
      v9 = v15;
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke;
    block[3] = &unk_1E9C40D58;
    v7 = (id *)v18;
    v18[0] = v3;
    v18[1] = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_3;
  v2[3] = &unk_1E9C40D80;
  v4 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", *(_QWORD *)(a1 + 32)));
}

uint64_t __95__HKEmergencyCardNameAndPictureTableItem__checkOrRequestForCameraAccessIfNeededWithCompletion___block_invoke_231(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", *(_QWORD *)(a1 + 32)));
}

- (void)presentCameraAuthorizationStatusDeniedAlert
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
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("tcc_camera_denied_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("tcc_camera_denied_message"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("tcc_camera_denied_cancel_action"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAction:", v11);
  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("tcc_camera_denied_default_action"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, &__block_literal_global_13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAction:", v15);
  objc_msgSend(v17, "setPreferredAction:", v15);
  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentViewController:animated:completion:", v17, 1, 0);

}

void __85__HKEmergencyCardNameAndPictureTableItem_presentCameraAuthorizationStatusDeniedAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=HEALTH"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  void *v4;
  id v5;

  -[HKMedicalIDEditorNameAndPhotoCell name](self->_cell, "name", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardTableItem data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  UIImage *v27;
  UIImage *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  if (a4)
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C78]);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "size");
    v6 = v5;
    objc_msgSend(v34, "size");
    v8 = v7;
    objc_msgSend(v34, "size");
    v10 = v9;
    objc_msgSend(v34, "size");
    v12 = v11;
    objc_msgSend(v34, "size");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v34, "size");
    if (v10 <= v12)
    {
      v20 = 0.0;
      if (v16 <= v17)
      {
        v21 = 0.0;
      }
      else
      {
        objc_msgSend(v34, "size");
        v23 = v22;
        objc_msgSend(v34, "size");
        v25 = (v23 - v24) * 0.5;
        v21 = 0.0;
        v20 = v25 + 0.0;
        v8 = v6;
      }
    }
    else
    {
      v19 = (v14 - v18) * 0.5;
      v20 = 0.0;
      v21 = v19 + 0.0;
      v6 = v8;
    }
    objc_msgSend(v34, "hk_croppedImageWithRect:", v21, v20, v6, v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageByPreparingThumbnailOfSize:", 100.0, 100.0);
    v27 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      -[UIImage size](v27, "size");
      if (v29 > 0.0)
      {
        -[UIImage size](v28, "size");
        if (v30 > 0.0)
        {
          UIImageJPEGRepresentation(v28, 1.0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKEmergencyCardTableItem data](self, "data");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setPictureData:", v31);

          -[HKMedicalIDEditorNameAndPhotoCell setPhoto:](self->_cell, "setPhoto:", v28);
        }
      }
    }
    -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dismissViewControllerAnimated:completion:", 1, 0);

    -[HKEmergencyCardNameAndPictureTableItem _updateMedicalIDPhotoMenu](self, "_updateMedicalIDPhotoMenu");
  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v3;

  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "navigationControllerSupportedInterfaceOrientations:", v3);
  else
    v4 = 2;

  return v4;
}

- (HKEmergencyCardRowHeightChangeDelegate)rowHeightChangeDelegate
{
  return (HKEmergencyCardRowHeightChangeDelegate *)objc_loadWeakRetained((id *)&self->_rowHeightChangeDelegate);
}

- (void)setRowHeightChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rowHeightChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rowHeightChangeDelegate);
  objc_storeStrong((id *)&self->_cell, 0);
}

- (void)_checkOrRequestForCameraAccessIfNeededWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Medical ID Camera Access: Unexpected return value %ld", (uint8_t *)&v2, 0xCu);
}

@end
