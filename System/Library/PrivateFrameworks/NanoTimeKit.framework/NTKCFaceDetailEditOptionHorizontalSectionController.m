@implementation NTKCFaceDetailEditOptionHorizontalSectionController

- (NTKCFaceDetailEditOptionHorizontalSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NTKCFaceDetailEditOptionHorizontalSectionController *v14;
  NTKCFaceDetailEditOptionHorizontalSectionController *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v9 = a5;
  v12 = a4;
  v13 = a7;
  v24.receiver = self;
  v24.super_class = (Class)NTKCFaceDetailEditOptionHorizontalSectionController;
  v14 = -[NTKCFaceDetailEditOptionSectionController _initWithTableViewController:face:inGallery:editOptionCollection:faceView:](&v24, sel__initWithTableViewController_face_inGallery_editOptionCollection_faceView_, a3, v12, v9, a6, v13);
  v15 = v14;
  if (v14)
  {
    v16 = objc_alloc(-[NTKCFaceDetailEditOptionHorizontalSectionController editCellClass](v14, "editCellClass"));
    -[NTKCFaceDetailEditOptionSectionController collection](v15, "collection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithCollection:forFaceView:face:", v17, v13, v12);
    -[NTKCFaceDetailSectionController setCell:](v15, "setCell:", v18);

    -[NTKCFaceDetailSectionController cell](v15, "cell");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v15);

    v20 = (void *)MEMORY[0x1E0C99DE8];
    -[NTKCFaceDetailSectionController cell](v15, "cell");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithObject:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionController setRows:](v15, "setRows:", v22);

  }
  return v15;
}

- (void)didSelectRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  _BOOL4 v11;
  id v12;

  -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "indexOfObject:", v7);

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v8 == a3)
  {
    v9 = a3 - 1;
    -[NTKCFaceDetailEditOptionSectionController optionAtIndex:](self, "optionAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NTKCFaceDetailEditOptionSectionController _handleDidSelectActionRowForOption:](self, "_handleDidSelectActionRowForOption:", v10);

    if (v11)
    {
      -[NTKCFaceDetailEditOptionSectionController delegate](self, "delegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "editOptionSection:didSelectActionForOptionAtIndex:", self, v9);

    }
  }
}

- (void)setSelectedOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKCFaceDetailEditOptionHorizontalSectionController;
  -[NTKCFaceDetailEditOptionSectionController setSelectedOptions:](&v19, sel_setSelectedOptions_, v4);
  -[NTKCFaceDetailSectionController cell](self, "cell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedOptions:", v4);

  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "collectionType");

  if (v7 == 1)
  {
    -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "slot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

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
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB37E8];
      -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v10, "mode"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v15, "localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionController headerView](self, "headerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSubtitle:", v17);

  }
  -[NTKCFaceDetailEditOptionHorizontalSectionController reloadActionRow](self, "reloadActionRow");

}

- (void)reloadActionRow
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKCFaceDetailEditOptionSectionController _hasActionRow](self, "_hasActionRow");
  if (!v4)
  {
LABEL_5:
    if (!v3)
      goto LABEL_16;
    goto LABEL_6;
  }
  if (!v3)
  {
    -[NTKCFaceDetailEditOptionSectionController _createActionRow](self, "_createActionRow");
    -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[NTKCFaceDetailEditOptionSectionController _refreshActionRowContent](self, "_refreshActionRowContent");
LABEL_6:
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v6 == 1 || v4;
  if ((v7 & 1) == 0)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObject:", v3);

    -[NTKCFaceDetailSectionController rows](self, "rows");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v3);

    -[NTKCFaceDetailSectionController setHasSpacerRow:](self, "setHasSpacerRow:", 0);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, -[NTKCFaceDetailSectionController section](self, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v10, "row") + 1, -[NTKCFaceDetailSectionController section](self, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 100);
    goto LABEL_15;
  }
  v8 = !v4;
  if (v6 != 1)
    v8 = 1;
  if ((v8 & 1) == 0)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertObject:atIndex:", v3, 1);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, -[NTKCFaceDetailSectionController section](self, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v10, "row") + 1, -[NTKCFaceDetailSectionController section](self, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionController setHasSpacerRow:](self, "setHasSpacerRow:", 1);
    -[NTKCFaceDetailSectionController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertRowsAtIndexPaths:withRowAnimation:", v13, 100);
LABEL_15:

  }
LABEL_16:

}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[NTKCFaceDetailEditOptionSectionController setCollection:](self, "setCollection:", v7);
  -[NTKCFaceDetailSectionController cell](self, "cell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "collectionChanged:withSelectedOptions:", v7, v6);

  return v9;
}

- (void)editOptionCell:(id)a3 didSelectOptionAtIndex:(int64_t)a4
{
  id v6;

  -[NTKCFaceDetailEditOptionSectionController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editOptionSection:didSelectOptionAtIndex:", self, a4);

}

- (Class)editCellClass
{
  return (Class)objc_opt_class();
}

@end
