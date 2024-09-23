@implementation NTKCFaceDetailKaleidoscopeContentSectionController

+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  id v5;
  BOOL v6;
  BOOL v7;

  v5 = a3;
  v6 = objc_msgSend(v5, "faceStyle") == 23 || objc_msgSend(v5, "faceStyle") == 223;
  v7 = a4 == 12 && v6;

  return v7;
}

+ (BOOL)supressesSectionForExternalAssets:(id)a3
{
  return a3 != 0;
}

- (NTKCFaceDetailKaleidoscopeContentSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t updated;
  id v17;
  NTKCFaceDetailKaleidoscopeContentSectionController *v18;
  void *v19;
  NTKCompanionKaleidoscopeEditor *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NTKCompanionKaleidoscopeEditor *editor;
  void *v26;
  objc_super v28;
  id v29;

  v9 = a5;
  v12 = a4;
  v29 = a6;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  updated = _UpdateCollectionIfNecessary(&v29);
  v17 = v29;

  v28.receiver = self;
  v28.super_class = (Class)NTKCFaceDetailKaleidoscopeContentSectionController;
  v18 = -[NTKCFaceDetailEditOptionHorizontalSectionController initWithTableViewController:face:inGallery:editOptionCollection:faceView:](&v28, sel_initWithTableViewController_face_inGallery_editOptionCollection_faceView_, v15, v12, v9, v17, v13);

  if (v18)
  {
    -[NTKCFaceDetailSectionController cell](v18, "cell");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUserOptionIndex:", updated);
    v20 = [NTKCompanionKaleidoscopeEditor alloc];
    -[NTKCFaceDetailSectionController face](v18, "face");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resourceDirectory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[NTKCompanionKaleidoscopeEditor initWithResourceDirectory:forDevice:](v20, "initWithResourceDirectory:forDevice:", v22, v23);
    editor = v18->_editor;
    v18->_editor = (NTKCompanionKaleidoscopeEditor *)v24;

    objc_msgSend(v12, "selectedOptionForCustomEditMode:slot:", 12, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18->_currentAsset = objc_msgSend(v26, "asset");

  }
  return v18;
}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  id v6;
  id v7;
  uint64_t updated;
  id v9;
  void *v10;
  objc_super v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = a3;
  updated = _UpdateCollectionIfNecessary(&v13);
  v9 = v13;

  v12.receiver = self;
  v12.super_class = (Class)NTKCFaceDetailKaleidoscopeContentSectionController;
  LOBYTE(v7) = -[NTKCFaceDetailEditOptionHorizontalSectionController collectionChanged:withSelectedOptions:](&v12, sel_collectionChanged_withSelectedOptions_, v9, v6);

  -[NTKCFaceDetailSectionController cell](self, "cell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setUserOptionIndex:", updated);
  return (char)v7;
}

- (Class)editCellClass
{
  return (Class)objc_opt_class();
}

- (Class)actionRowCellClass
{
  return (Class)objc_opt_class();
}

- (void)setSelectedOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKCFaceDetailKaleidoscopeContentSectionController;
  v4 = a3;
  -[NTKCFaceDetailEditOptionHorizontalSectionController setSelectedOptions:](&v11, sel_setSelectedOptions_, v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection", v11.receiver, v11.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "mode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if (objc_msgSend(v9, "asset") != self->_currentAsset)
    {
      v10 = objc_msgSend(v9, "asset");
      self->_currentAsset = v10;
      if (!self->_externalAssetSet
        && v10 == 1000
        && !-[NTKCompanionKaleidoscopeEditor photosCount](self->_editor, "photosCount"))
      {
        -[NTKCFaceDetailKaleidoscopeContentSectionController _handleDidSelectActionRowForOption:](self, "_handleDidSelectActionRowForOption:", v9);
      }
    }

  }
}

- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4
{
  return !self->_externalAssetSet;
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setShowsTopSeparator:", 1);
  -[NTKCFaceDetailEditOptionSectionController _actionNameForOption:](self, "_actionNameForOption:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v9);
}

- (BOOL)_handleDidSelectActionRowForOption:(id)a3
{
  -[NTKCFaceDetailKaleidoscopeContentSectionController _presentPhotoPicker](self, "_presentPhotoPicker", a3);
  return 0;
}

- (void)_presentPhotoPicker
{
  void *v3;
  _QWORD v4[5];

  -[NTKCFaceDetailKaleidoscopeContentSectionController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__NTKCFaceDetailKaleidoscopeContentSectionController__presentPhotoPicker__block_invoke;
  v4[3] = &unk_1E6BD3AF8;
  v4[4] = self;
  +[NTKCPhotosAddController presentSinglePhotoAddControllerFromViewController:withCompletion:](NTKCPhotosAddController, "presentSinglePhotoAddControllerFromViewController:withCompletion:", v3, v4);

}

BOOL __73__NTKCFaceDetailKaleidoscopeContentSectionController__presentPhotoPicker__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  void *v9;

  v6 = a2;
  v7 = a3;
  v8 = *(id **)(a1 + 32);
  if (v7)
  {
    objc_storeStrong(v8 + 16, a2);
    objc_msgSend(*(id *)(a1 + 32), "_setPhotoFromDictionary:", v7);
  }
  else
  {
    objc_msgSend(v8, "cell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ensureSelectedOptionVisible:", 0);

  }
  return v7 != 0;
}

- (void)setExternalAsset:(id)a3
{
  id v4;

  v4 = a3;
  self->_externalAssetSet = 1;
  -[NTKCFaceDetailSectionController setHasSpacerRow:](self, "setHasSpacerRow:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKCFaceDetailKaleidoscopeContentSectionController _setPhotoFromAsset:](self, "_setPhotoFromAsset:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NTKCFaceDetailKaleidoscopeContentSectionController _setRawPhoto:](self, "_setRawPhoto:", v4);
  }

}

- (void)_setPhotoFromDictionary:(id)a3
{
  id v4;
  NTKCompanionKaleidoscopeEditor *editor;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  editor = self->_editor;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__NTKCFaceDetailKaleidoscopeContentSectionController__setPhotoFromDictionary___block_invoke;
  v6[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v7, &location);
  -[NTKCompanionKaleidoscopeEditor setPhoto:completion:](editor, "setPhoto:completion:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __78__NTKCFaceDetailKaleidoscopeContentSectionController__setPhotoFromDictionary___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finalizeEditor");

}

- (void)_setPhotoFromAsset:(id)a3
{
  id v4;
  NTKCompanionKaleidoscopeEditor *editor;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  editor = self->_editor;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__NTKCFaceDetailKaleidoscopeContentSectionController__setPhotoFromAsset___block_invoke;
  v6[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v7, &location);
  -[NTKCompanionKaleidoscopeEditor setAsset:completion:](editor, "setAsset:completion:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __73__NTKCFaceDetailKaleidoscopeContentSectionController__setPhotoFromAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finalizeEditor");

}

- (void)_setRawPhoto:(id)a3
{
  id v4;
  NTKCompanionKaleidoscopeEditor *editor;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  editor = self->_editor;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__NTKCFaceDetailKaleidoscopeContentSectionController__setRawPhoto___block_invoke;
  v6[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v7, &location);
  -[NTKCompanionKaleidoscopeEditor setRawImage:completion:](editor, "setRawImage:completion:", v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __67__NTKCFaceDetailKaleidoscopeContentSectionController__setRawPhoto___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finalizeEditor");

}

- (void)_finalizeEditor
{
  NTKCompanionKaleidoscopeEditor *editor;
  _QWORD v3[5];

  editor = self->_editor;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__NTKCFaceDetailKaleidoscopeContentSectionController__finalizeEditor__block_invoke;
  v3[3] = &unk_1E6BCF688;
  v3[4] = self;
  -[NTKCompanionKaleidoscopeEditor finalizeWithCompletion:](editor, "finalizeWithCompletion:", v3);
}

void *__69__NTKCFaceDetailKaleidoscopeContentSectionController__finalizeEditor__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *result;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourceDirectory:", v4);

  objc_msgSend(*(id *)(a1 + 32), "cell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectUserOption");

  result = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (result)
    return (void *)objc_msgSend(result, "dismissViewControllerAnimated:completion:", 1, 0);
  return result;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_presentedPicker, 0);
  objc_storeStrong((id *)&self->_editor, 0);
}

@end
