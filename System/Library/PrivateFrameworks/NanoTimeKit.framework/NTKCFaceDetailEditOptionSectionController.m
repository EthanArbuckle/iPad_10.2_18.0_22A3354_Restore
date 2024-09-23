@implementation NTKCFaceDetailEditOptionSectionController

- (NTKCFaceDetailEditOptionSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NTKCFaceDetailEditOptionSectionController *v16;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v13, "collectionType");
  v16 = (NTKCFaceDetailEditOptionSectionController *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTableViewController:face:inGallery:editOptionCollection:faceView:", v15, v14, v8, v13, v12);

  return v16;
}

- (id)_initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  NTKCFaceDetailEditOptionSectionController *v14;
  NTKCFaceDetailEditOptionSectionController *v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a5;
  v12 = a6;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)NTKCFaceDetailEditOptionSectionController;
  v14 = -[NTKCFaceDetailSectionController initWithTableViewController:face:inGallery:](&v20, sel_initWithTableViewController_face_inGallery_, a3, a4, v8);
  v15 = v14;
  if (v14)
  {
    -[NTKCFaceDetailEditOptionSectionController setCollection:](v14, "setCollection:", v12);
    -[NTKCFaceDetailEditOptionSectionController setFaceView:](v15, "setFaceView:", v13);
    v16 = -[NTKCFaceDetailSectionController _newSectionHeader](v15, "_newSectionHeader");
    -[NTKCFaceDetailSectionController setHeaderView:](v15, "setHeaderView:", v16);

    objc_msgSend(v12, "localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionController headerView](v15, "headerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v17);

  }
  return v15;
}

- (void)_updateSelectedOptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[NTKCFaceDetailSectionController face](self, "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedOptionsForCustomEditModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "mutableCopy");

  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slot");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_5:

    goto LABEL_6;
  }
  v7 = (void *)v6;
  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mode");

  if (v9)
  {
    -[NTKCFaceDetailSectionController face](self, "face");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mode");
    -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "slot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedOptionForCustomEditMode:slot:", v12, v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "mode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v5, v17);

    }
    goto LABEL_5;
  }
LABEL_6:
  -[NTKCFaceDetailEditOptionSectionController setSelectedOptions:](self, "setSelectedOptions:", v18);

}

- (BOOL)_canSelectRow:(int64_t)a3
{
  void *v5;
  NTKCFaceDetailRowActionCell *v6;

  -[NTKCFaceDetailSectionController rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (NTKCFaceDetailRowActionCell *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v6 == self->_actionRow;

  return a3;
}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  return 0;
}

- (id)optionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4
{
  return 1;
}

- (BOOL)_handleDidSelectOption:(id)a3
{
  return 1;
}

- (BOOL)_handleDidSelectActionRowForOption:(id)a3
{
  return 1;
}

- (Class)actionRowCellClass
{
  return 0;
}

- (BOOL)_hasActionRow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mode");

  -[NTKCFaceDetailEditOptionSectionController selectedOptions](self, "selectedOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKCFaceDetailSectionController face](self, "face");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  -[NTKCFaceDetailSectionController face](self, "face");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "customEditMode:hasActionForOption:forDevice:", v4, v7, v11))
    v12 = -[NTKCFaceDetailEditOptionSectionController _canDisplayActionRowForCustomEditMode:andOption:](self, "_canDisplayActionRowForCustomEditMode:andOption:", v4, v7);
  else
    v12 = 0;

  return v12;
}

- (void)_createActionRow
{
  NTKCFaceDetailRowActionCell *v3;
  NTKCFaceDetailRowActionCell *actionRow;

  if (!self->_actionRow)
  {
    v3 = (NTKCFaceDetailRowActionCell *)objc_alloc_init(-[NTKCFaceDetailEditOptionSectionController actionRowCellClass](self, "actionRowCellClass"));
    actionRow = self->_actionRow;
    self->_actionRow = v3;

  }
  -[NTKCFaceDetailEditOptionSectionController _refreshActionRowContent](self, "_refreshActionRowContent");
}

- (void)_refreshActionRowContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NTKCFaceDetailEditOptionSectionController selectedOptions](self, "selectedOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKCFaceDetailEditOptionSectionController _customizeActionRow:withEditOption:](self, "_customizeActionRow:withEditOption:", self->_actionRow, v7);
}

- (id)_actionNameForOption:(id)a3
{
  return (id)objc_msgSend(a3, "localizedNameForAction");
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKCFaceDetailEditOptionSectionController _actionNameForOption:](self, "_actionNameForOption:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

  }
}

- (NTKEditOptionCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (NTKFaceView)faceView
{
  return (NTKFaceView *)objc_loadWeakRetained((id *)&self->_faceView);
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);
}

- (NSDictionary)selectedOptions
{
  return self->_selectedOptions;
}

- (void)setSelectedOptions:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOptions, a3);
}

- (NTKCFaceDetailEditOptionSectionDelegate)delegate
{
  return (NTKCFaceDetailEditOptionSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (Class)editCellClass
{
  return self->_editCellClass;
}

- (NTKCFaceDetailRowActionCell)actionRow
{
  return self->_actionRow;
}

- (void)setActionRow:(id)a3
{
  objc_storeStrong((id *)&self->_actionRow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionRow, 0);
  objc_storeStrong((id *)&self->_editCellClass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedOptions, 0);
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
