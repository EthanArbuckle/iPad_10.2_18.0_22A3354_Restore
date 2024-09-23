@implementation NTKCFaceDetailPigmentSectionController

+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  BOOL result;

  result = objc_msgSend(a3, "supportsPigmentUI");
  if (a4 != 10)
    return 0;
  return result;
}

- (NTKCFaceDetailPigmentSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  _BOOL8 v8;
  id v12;
  NTKCFaceDetailPigmentSectionController *v13;
  void *v14;
  uint64_t v15;
  NTKFaceColorPalette *palette;
  objc_super v18;

  v8 = a5;
  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)NTKCFaceDetailPigmentSectionController;
  v13 = -[NTKCFaceDetailEditOptionHorizontalSectionController initWithTableViewController:face:inGallery:editOptionCollection:faceView:](&v18, sel_initWithTableViewController_face_inGallery_editOptionCollection_faceView_, a3, a4, v8, a6, v12);
  if (v13)
  {
    objc_msgSend(v12, "faceColorPalette");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    palette = v13->_palette;
    v13->_palette = (NTKFaceColorPalette *)v15;

  }
  return v13;
}

- (Class)editCellClass
{
  return (Class)objc_opt_class();
}

- (Class)actionRowCellClass
{
  return (Class)objc_opt_class();
}

- (id)optionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[NTKCFaceDetailSectionController cell](self, "cell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_hasActionRow
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[NTKCFaceDetailSectionController face](self, "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedSlotForEditMode:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKCFaceDetailEditOptionSectionController faceView](self, "faceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsEditingSliderEditableColorsForSlot:", v4);

  if (v6)
  {
    -[NTKCFaceDetailEditOptionSectionController selectedOptions](self, "selectedOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E6C9E800);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F8E91518))
    {
      objc_msgSend(v8, "pigmentEditOption");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "supportsSlider");

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NTKFaceColorPaletteConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if (!self->_suppressActionRowUpdates)
  {
    v5 = a3;
    -[NTKCFaceDetailEditOptionSectionController selectedOptions](self, "selectedOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E6C9E800);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[NTKFaceColorPaletteConfiguration initWithPigmentEditOption:]([NTKFaceColorPaletteConfiguration alloc], "initWithPigmentEditOption:", v7);
    -[NTKFaceColorPalette setConfiguration:](self->_palette, "setConfiguration:", v8);
    -[NTKFaceColorPalette primaryColorWithFraction:](self->_palette, "primaryColorWithFraction:", 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette primaryColorWithFraction:](self->_palette, "primaryColorWithFraction:", 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceColorPalette primaryColorWithFraction:](self->_palette, "primaryColorWithFraction:", 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = v10;
    v13[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColors:animated:", v12, 1);

    objc_msgSend(v7, "colorFraction");
    objc_msgSend(v5, "setColorFraction:animated:", 1);
    objc_msgSend(v5, "setDelegate:", self);

  }
}

- (BOOL)_handleDidSelectOption:(id)a3
{
  -[NTKCFaceDetailEditOptionHorizontalSectionController reloadActionRow](self, "reloadActionRow", a3);
  return 1;
}

- (void)pigmentEditOptionCellDidSelectAddOption:(id)a3
{
  void *v4;
  id v5;

  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailPigmentSectionController _presentPigmentPickerForSlot:](self, "_presentPigmentPickerForSlot:", v4);

}

- (void)pigmentColorSliderCell:(id)a3 colorFractionChanged:(double)a4 transiently:(BOOL)a5 canceled:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v7 = a5;
  self->_suppressActionRowUpdates = 1;
  -[NTKCFaceDetailEditOptionSectionController selectedOptions](self, "selectedOptions", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E6C9E800);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
    v11 = v15;
  else
    v11 = (id)objc_msgSend(v15, "copyWithColorFraction:", a4);
  v12 = v11;
  -[NTKCFaceDetailSectionController cell](self, "cell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "modifiedColor:", v12);
  -[NTKCFaceDetailEditOptionSectionController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "editOptionSection:didModifyEditOption:transiently:canceled:", self, v12, v7, v6);

  self->_suppressActionRowUpdates = 0;
}

- (void)_presentPigmentPickerForSlot:(id)a3
{
  id v4;
  NTKPigmentAddController *v5;
  void *v6;
  void *v7;
  NTKPigmentAddController *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [NTKPigmentAddController alloc];
  -[NTKCFaceDetailSectionController face](self, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailEditOptionSectionController faceView](self, "faceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__NTKCFaceDetailPigmentSectionController__presentPigmentPickerForSlot___block_invoke;
  v10[3] = &unk_1E6BD1A00;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  v8 = -[NTKPigmentAddController initWithFace:faceView:slot:willExitHandler:](v5, "initWithFace:faceView:slot:willExitHandler:", v6, v7, v4, v10);

  -[NTKCFaceDetailPigmentSectionController parentViewController](self, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __71__NTKCFaceDetailPigmentSectionController__presentPigmentPickerForSlot___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "face");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleColorEditOptionsChanged");

    WeakRetained = v7;
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "cell");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectLastColor");

      WeakRetained = v7;
    }
  }

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
  objc_storeStrong((id *)&self->_palette, 0);
}

@end
