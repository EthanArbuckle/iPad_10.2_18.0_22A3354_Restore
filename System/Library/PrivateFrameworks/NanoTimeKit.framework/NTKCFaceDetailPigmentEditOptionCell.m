@implementation NTKCFaceDetailPigmentEditOptionCell

- (NTKCFaceDetailPigmentEditOptionCell)initWithCollection:(id)a3 forFaceView:(id)a4 face:(id)a5
{
  NTKCFaceDetailPigmentEditOptionCell *v5;
  uint64_t v6;
  NTKPigmentEditOptionArray *editingModifiedColors;
  uint64_t v8;
  NTKPigmentEditOptionArray *previouslySelectedColors;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NTKCFaceDetailPigmentEditOptionCell;
  v5 = -[NTKCFaceDetailEditOptionCell initWithCollection:forFaceView:face:](&v27, sel_initWithCollection_forFaceView_face_, a3, a4, a5);
  if (v5)
  {
    +[NTKPigmentEditOptionArray array](NTKPigmentEditOptionArray, "array");
    v6 = objc_claimAutoreleasedReturnValue();
    editingModifiedColors = v5->_editingModifiedColors;
    v5->_editingModifiedColors = (NTKPigmentEditOptionArray *)v6;

    +[NTKPigmentEditOptionArray array](NTKPigmentEditOptionArray, "array");
    v8 = objc_claimAutoreleasedReturnValue();
    previouslySelectedColors = v5->_previouslySelectedColors;
    v5->_previouslySelectedColors = (NTKPigmentEditOptionArray *)v8;

    -[NTKCFaceDetailEditOptionCell layout](v5, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailPigmentEditOptionCell _dividerImage](v5, "_dividerImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v12;
    v15 = v14;

    objc_msgSend(v10, "itemSize");
    v17 = v16;
    v19 = v18;
    -[NTKCFaceDetailEditOptionCell swatchFrame](v5, "swatchFrame");
    v5->_dividerItemSize.width = v13 + v17 - v20;
    v5->_dividerItemSize.height = v19;
    v5->_dividerSwatchRect.origin.x = v21;
    v5->_dividerSwatchRect.origin.y = v22;
    v5->_dividerSwatchRect.size.width = v13;
    v5->_dividerSwatchRect.size.height = v15;
    -[NTKCFaceDetailEditOptionCell collectionView](v5, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    +[_NTKCFaceDetailPigmentAddCell reuseIdentifier](_NTKCFaceDetailPigmentAddCell, "reuseIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerClass:forCellWithReuseIdentifier:", v24, v25);

  }
  return v5;
}

- (void)modifiedColor:(id)a3
{
  NTKPigmentEditOptionArray *editingModifiedColors;
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  editingModifiedColors = self->_editingModifiedColors;
  v5 = a3;
  -[NTKPigmentEditOptionArray addPigment:](editingModifiedColors, "addPigment:", v5);
  v6 = -[NTKFaceEditColorPickerConfiguration indexOfColor:](self->_configuration, "indexOfColor:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NTKFaceEditColorPickerConfiguration editableColors](self->_configuration, "editableColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = -[NTKFaceEditColorPickerConfiguration hasSeparator](self->_configuration, "hasSeparator");
    v10 = v6 >= v8 && v9;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6 + v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[NTKCFaceDetailEditOptionCell collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reloadItemsAtIndexPaths:", v14);

    }
  }
}

- (void)selectLastColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NTKCFaceDetailEditOptionCell collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mode");

  -[NTKCFaceDetailEditOptionCell collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slot");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[NTKFaceEditColorPickerConfiguration numberOfColors](self->_configuration, "numberOfColors");
  if (v6)
  {
    -[NTKFaceEditColorPickerConfiguration colorAtIndex:](self->_configuration, "colorAtIndex:", v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKCFaceDetailEditOptionCell face](self, "face");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultOptionForCustomEditMode:slot:", v4, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NTKCFaceDetailEditOptionCell face](self, "face");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectOption:forCustomEditMode:slot:", v7, v4, v10);

}

- (id)optionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NTKCFaceDetailEditOptionCell collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F8E91518))
  {
    objc_msgSend(v7, "pigmentEditOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentEditOptionArray pigmentForPigment:](self->_editingModifiedColors, "pigmentForPigment:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setupFromCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NTKFaceEditColorPickerConfiguration *v8;
  NTKFaceEditColorPickerConfiguration *configuration;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailPigmentEditOptionCell;
  -[NTKCFaceDetailEditOptionCell _setupFromCollection](&v10, sel__setupFromCollection);
  -[NTKCFaceDetailEditOptionCell selectedOptions](self, "selectedOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E6C9EBC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F8E91518))
  {
    objc_msgSend(v4, "pigmentEditOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentEditOptionArray addPigment:](self->_editingModifiedColors, "addPigment:", v5);
    -[NTKPigmentEditOptionArray addPigment:](self->_previouslySelectedColors, "addPigment:", v5);

  }
  -[NTKCFaceDetailEditOptionCell collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailEditOptionCell selectedOptions](self, "selectedOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailPigmentEditOptionCell _configurationFromCollection:selectedOptions:](self, "_configurationFromCollection:selectedOptions:", v6, v7);
  v8 = (NTKFaceEditColorPickerConfiguration *)objc_claimAutoreleasedReturnValue();
  configuration = self->_configuration;
  self->_configuration = v8;

}

- (id)_configurationFromCollection:(id)a3 selectedOptions:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(void *, void *, uint64_t);
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void (*v16)(void *, void *, uint64_t);
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD aBlock[4];
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v27 = a4;
  v28 = (id)objc_opt_new();
  objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1E6C9EBC0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v30;
  if (objc_msgSend(v30, "conformsToProtocol:", &unk_1F8E91518))
  {
    objc_msgSend(v30, "pigmentEditOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__NTKCFaceDetailPigmentEditOptionCell__configurationFromCollection_selectedOptions___block_invoke;
    aBlock[3] = &unk_1E6BD37B0;
    v26 = v28;
    v42 = v26;
    v7 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v29, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v13, "conformsToProtocol:", &unk_1F8E91518))
          {
            objc_msgSend(v13, "pigmentEditOption");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "isEqualIgnoringFraction:", v6))
            {
              v7[2](v7, v6, 1);
              v9 = 1;
            }
            else
            {
              v15 = -[NTKPigmentEditOptionArray containsPigment:](self->_previouslySelectedColors, "containsPigment:", v14);
              v16 = v7[2];
              if (v15)
                v16(v7, v14, 1);
              else
                v16(v7, v14, 0);
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v10);
    }

    if (!((v6 == 0) | v9 & 1))
      v7[2](v7, v6, 1);
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    -[NTKCFaceDetailEditOptionCell face](self, "face");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "supportsPigmentUI");

    if (v18)
    {
      -[NTKCFaceDetailEditOptionCell face](self, "face");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pigmentOptionProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionCell collection](self, "collection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "slot");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "availableColorsForSlot:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __84__NTKCFaceDetailPigmentEditOptionCell__configurationFromCollection_selectedOptions___block_invoke_2;
      v32[3] = &unk_1E6BD37D8;
      v32[4] = &v33;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v32);

    }
    objc_msgSend(v26, "setCanAddColors:", *((unsigned __int8 *)v34 + 24));
    v24 = v26;
    _Block_object_dispose(&v33, 8);

    v5 = v30;
  }

  return v28;
}

void __84__NTKCFaceDetailPigmentEditOptionCell__configurationFromCollection_selectedOptions___block_invoke(uint64_t a1, void *a2, int a3)
{
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!objc_msgSend(v7, "isAddable") || (objc_msgSend(v7, "isVisible") & 1) != 0 || a3)
  {
    v5 = objc_msgSend(v7, "supportsSlider");
    v6 = *(void **)(a1 + 32);
    if (v5)
      objc_msgSend(v6, "addEditableColor:", v7);
    else
      objc_msgSend(v6, "addNonEditableColor:", v7);
  }

}

uint64_t __84__NTKCFaceDetailPigmentEditOptionCell__configurationFromCollection_selectedOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isAddable");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (int64_t)_editOptionIndexForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NTKFaceEditColorPickerConfiguration *configuration;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  int64_t v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[NTKFaceEditColorPickerConfiguration editableColors](self->_configuration, "editableColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  configuration = self->_configuration;
  if (v5 >= v7)
  {
    v12 = -[NTKFaceEditColorPickerConfiguration hasSeparator](configuration, "hasSeparator");
    v13 = v12 && v5 == v7;
    if (v13
      || (v5 = v5 - v7 - v12,
          -[NTKFaceEditColorPickerConfiguration nonEditableColors](self->_configuration, "nonEditableColors"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "count"),
          v14,
          v5 >= v15))
    {
      v11 = 0;
      goto LABEL_11;
    }
    -[NTKFaceEditColorPickerConfiguration nonEditableColors](self->_configuration, "nonEditableColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKFaceEditColorPickerConfiguration editableColors](configuration, "editableColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  -[NTKCFaceDetailEditOptionCell collection](self, "collection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "options");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__NTKCFaceDetailPigmentEditOptionCell__editOptionIndexForIndexPath___block_invoke;
  v21[3] = &unk_1E6BD3800;
  v18 = v11;
  v22 = v18;
  v23 = &v24;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v21);

  v19 = v25[3];
  _Block_object_dispose(&v24, 8);

  return v19;
}

void __68__NTKCFaceDetailPigmentEditOptionCell__editOptionIndexForIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char v9;
  int v10;

  v7 = a2;
  if (!objc_msgSend(v7, "conformsToProtocol:", &unk_1F8E91518))
  {
    v10 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

    if (!v10)
      return;
    goto LABEL_5;
  }
  objc_msgSend(v7, "pigmentEditOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualIgnoringFraction:", *(_QWORD *)(a1 + 32));
  if ((v9 & 1) != 0)
  {
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)_indexPathForEditOptionIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  _BOOL4 v14;
  _BOOL8 v15;

  -[NTKCFaceDetailEditOptionCell collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    v10 = 0;
  }
  else
  {
    -[NTKCFaceDetailPigmentEditOptionCell optionAtIndex:](self, "optionAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NTKFaceEditColorPickerConfiguration indexOfColor:](self->_configuration, "indexOfColor:", v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      v11 = v9;
      -[NTKFaceEditColorPickerConfiguration editableColors](self->_configuration, "editableColors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      v14 = -[NTKFaceEditColorPickerConfiguration hasSeparator](self->_configuration, "hasSeparator");
      v15 = v11 >= v13 && v14;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11 + v15, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (id)_imageForIndexPath:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NTKFaceEditColorPickerConfiguration *configuration;
  void *v8;
  _BOOL4 v9;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v4 = objc_msgSend(a3, "item");
  -[NTKFaceEditColorPickerConfiguration editableColors](self->_configuration, "editableColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  configuration = self->_configuration;
  if (v4 >= v6)
  {
    v9 = -[NTKFaceEditColorPickerConfiguration hasSeparator](configuration, "hasSeparator");
    if (v9 && v4 == v6)
    {
      -[NTKCFaceDetailPigmentEditOptionCell _dividerImage](self, "_dividerImage");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = v4 - v6 - v9;
      -[NTKFaceEditColorPickerConfiguration nonEditableColors](self->_configuration, "nonEditableColors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v4 < v12)
      {
        -[NTKFaceEditColorPickerConfiguration nonEditableColors](self->_configuration, "nonEditableColors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      -[NTKCFaceDetailPigmentEditOptionCell _plusImage](self, "_plusImage");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v18;
    return v17;
  }
  -[NTKFaceEditColorPickerConfiguration editableColors](configuration, "editableColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKPigmentEditOptionArray pigmentForPigment:](self->_editingModifiedColors, "pigmentForPigment:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKCFaceDetailEditOptionCell faceView](self, "faceView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "swatchImageForColorOption:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_dequeueCellForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  objc_super v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[NTKFaceEditColorPickerConfiguration editableColors](self->_configuration, "editableColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = v5 <= v7;
  v9 = v5 - v7;
  if (v8)
  {
    -[NTKCFaceDetailEditOptionCell _dequeueCellForIndexPath:](&v18, sel__dequeueCellForIndexPath_, v4, v17.receiver, v17.super_class, self, NTKCFaceDetailPigmentEditOptionCell);
  }
  else
  {
    v10 = v9 - -[NTKFaceEditColorPickerConfiguration hasSeparator](self->_configuration, "hasSeparator");
    -[NTKFaceEditColorPickerConfiguration nonEditableColors](self->_configuration, "nonEditableColors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 >= v12)
    {
      -[NTKCFaceDetailEditOptionCell collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_NTKCFaceDetailPigmentAddCell reuseIdentifier](_NTKCFaceDetailPigmentAddCell, "reuseIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v15, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKCFaceDetailEditOptionCell _setupCell:](self, "_setupCell:", v13);
      objc_msgSend(v13, "setDelegate:", self);
      goto LABEL_7;
    }
    -[NTKCFaceDetailEditOptionCell _dequeueCellForIndexPath:](&v17, sel__dequeueCellForIndexPath_, v4, self, NTKCFaceDetailPigmentEditOptionCell, v18.receiver, v18.super_class);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

- (BOOL)_isReloadCollectionRequired:(id)a3 selectedOptions:(id)a4
{
  NTKCFaceDetailPigmentEditOptionCell *v4;
  void *v5;

  v4 = self;
  -[NTKCFaceDetailPigmentEditOptionCell _configurationFromCollection:selectedOptions:](self, "_configurationFromCollection:selectedOptions:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v4->_configuration) ^ 1;

  return (char)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v5;
  unint64_t v6;

  v5 = -[NTKFaceEditColorPickerConfiguration numberOfColors](self->_configuration, "numberOfColors", a3, a4);
  v6 = v5 + -[NTKFaceEditColorPickerConfiguration hasSeparator](self->_configuration, "hasSeparator");
  return v6 + -[NTKFaceEditColorPickerConfiguration canAddColors](self->_configuration, "canAddColors");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v5 = a4;
  -[NTKCFaceDetailPigmentEditOptionCell _dequeueCellForIndexPath:](self, "_dequeueCellForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyle:", 0);
  -[NTKFaceEditColorPickerConfiguration editableColors](self->_configuration, "editableColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = objc_msgSend(v5, "item");
  if (-[NTKFaceEditColorPickerConfiguration hasSeparator](self->_configuration, "hasSeparator"))
    v10 = v9 == v8;
  else
    v10 = 0;
  if (v10)
    objc_msgSend(v6, "setSwatchFrame:", self->_dividerSwatchRect.origin.x, self->_dividerSwatchRect.origin.y, self->_dividerSwatchRect.size.width, self->_dividerSwatchRect.size.height);
  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v8 = -[NTKFaceEditColorPickerConfiguration numberOfColors](self->_configuration, "numberOfColors");
  v9 = v8 + -[NTKFaceEditColorPickerConfiguration hasSeparator](self->_configuration, "hasSeparator");
  if (objc_msgSend(v7, "item") != v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKCFaceDetailPigmentEditOptionCell;
    -[NTKCFaceDetailEditOptionCell collectionView:didSelectItemAtIndexPath:](&v10, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  NTKFaceEditColorPickerConfiguration *configuration;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  double v13;
  CGFloat width;
  double v15;
  CGFloat height;
  double v17;
  double v18;
  CGSize result;

  configuration = self->_configuration;
  v7 = a5;
  -[NTKFaceEditColorPickerConfiguration editableColors](configuration, "editableColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = objc_msgSend(v7, "item");
  if (v9)
    v11 = v10 == v9;
  else
    v11 = 0;
  if (v11)
  {
    width = self->_dividerItemSize.width;
    height = self->_dividerItemSize.height;
  }
  else
  {
    -[NTKCFaceDetailEditOptionCell layout](self, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemSize");
    width = v13;
    height = v15;

  }
  v17 = width;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)addCellTapped:(id)a3
{
  id v4;

  -[NTKCFaceDetailEditOptionCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pigmentEditOptionCellDidSelectAddOption:", self);

}

- (id)_dividerImage
{
  UIImage *dividerImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;
  _QWORD v8[6];
  __int128 v9;

  dividerImage = self->_dividerImage;
  if (!dividerImage)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:", 0.0, 0.0, 3.0, 42.0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__NTKCFaceDetailPigmentEditOptionCell__dividerImage__block_invoke;
    v8[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v8[4] = 0;
    v8[5] = 0;
    v9 = xmmword_1B755E630;
    objc_msgSend(v4, "imageWithActions:", v8);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dividerImage;
    self->_dividerImage = v5;

    dividerImage = self->_dividerImage;
  }
  return dividerImage;
}

void __52__NTKCFaceDetailPigmentEditOptionCell__dividerImage__block_invoke(double *a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.949019608, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", a1[4], a1[5], a1[6], a1[7], a1[6] * 0.5);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fill");

}

- (id)_plusImage
{
  UIImage *plusImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  UIImage *v26;
  UIImage *v27;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  plusImage = self->_plusImage;
  if (!plusImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 42.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.596078431, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithTintColor:renderingMode:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentInsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "size");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v7, "contentInsets");
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v17 - (v20 + v21), v19 - (v22 + v23));
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __49__NTKCFaceDetailPigmentEditOptionCell__plusImage__block_invoke;
    v29[3] = &unk_1E6BCD640;
    v31 = v9;
    v32 = v11;
    v33 = v13;
    v34 = v15;
    v30 = v7;
    v25 = v7;
    objc_msgSend(v24, "imageWithActions:", v29);
    v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v27 = self->_plusImage;
    self->_plusImage = v26;

    plusImage = self->_plusImage;
  }
  return plusImage;
}

uint64_t __49__NTKCFaceDetailPigmentEditOptionCell__plusImage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a2, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v5 - *(double *)(a1 + 48), v7 - *(double *)(a1 + 40), v9 - (-*(double *)(a1 + 64) - *(double *)(a1 + 48)), v11 - (-*(double *)(a1 + 56) - *(double *)(a1 + 40)));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusImage, 0);
  objc_storeStrong((id *)&self->_dividerImage, 0);
  objc_storeStrong((id *)&self->_previouslySelectedColors, 0);
  objc_storeStrong((id *)&self->_editingModifiedColors, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
