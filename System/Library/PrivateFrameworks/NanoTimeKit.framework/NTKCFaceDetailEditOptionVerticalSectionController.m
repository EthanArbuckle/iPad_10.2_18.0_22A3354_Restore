@implementation NTKCFaceDetailEditOptionVerticalSectionController

- (NTKCFaceDetailEditOptionVerticalSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  NTKCFaceDetailEditOptionVerticalSectionController *v7;
  NTKCFaceDetailEditOptionVerticalSectionController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  v7 = -[NTKCFaceDetailEditOptionSectionController _initWithTableViewController:face:inGallery:editOptionCollection:faceView:](&v10, sel__initWithTableViewController_face_inGallery_editOptionCollection_faceView_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
    -[NTKCFaceDetailEditOptionVerticalSectionController _setupWithCollection:](v7, "_setupWithCollection:", 0);
  return v8;
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  return 1;
}

- (void)didSelectRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  _BOOL8 v16;
  int64_t v17;
  void *v18;
  _BOOL4 v19;
  id v20;

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

    if (!v11)
      return;
    -[NTKCFaceDetailEditOptionSectionController delegate](self, "delegate");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "editOptionSection:didSelectActionForOptionAtIndex:", self, v9);
    goto LABEL_16;
  }
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "active");

  if ((v14 & 1) == 0)
  {
    v15 = v8 == 0x7FFFFFFFFFFFFFFFLL || v8 >= a3;
    v16 = !v15;
    v17 = a3 - v16;
    -[NTKCFaceDetailEditOptionSectionController optionAtIndex:](self, "optionAtIndex:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NTKCFaceDetailEditOptionSectionController _handleDidSelectOption:](self, "_handleDidSelectOption:", v18);

    if (v19)
    {
      -[NTKCFaceDetailEditOptionSectionController delegate](self, "delegate");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "editOptionSection:didSelectOptionAtIndex:", self, v17);
LABEL_16:

    }
  }
}

- (void)setSelectedOptions:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  -[NTKCFaceDetailEditOptionSectionController setSelectedOptions:](&v4, sel_setSelectedOptions_, a3);
  -[NTKCFaceDetailEditOptionVerticalSectionController reloadActionRow](self, "reloadActionRow");
}

- (Class)actionRowCellClass
{
  return 0;
}

- (void)reloadActionRow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, uint64_t);
  void *v36;
  NTKCFaceDetailEditOptionVerticalSectionController *v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mode");

  -[NTKCFaceDetailEditOptionSectionController selectedOptions](self, "selectedOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0x7FFFFFFFFFFFFFFFLL;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0x7FFFFFFFFFFFFFFFLL;
  -[NTKCFaceDetailSectionController rows](self, "rows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __68__NTKCFaceDetailEditOptionVerticalSectionController_reloadActionRow__block_invoke;
  v36 = &unk_1E6BD2A98;
  v37 = self;
  v39 = &v46;
  v9 = v7;
  v40 = &v42;
  v41 = v4;
  v38 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v33);

  v10 = v47[3];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v43[3] != v10)
  {
    -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow", v33, v34, v35, v36, v37);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      -[NTKCFaceDetailSectionController rows](self, "rows");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "indexOfObject:", v14);

      -[NTKCFaceDetailSectionController rows](self, "rows");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v17);

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, -[NTKCFaceDetailSectionController section](self, "section"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[NTKCFaceDetailSectionController tableView](self, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "deleteRowsAtIndexPaths:withRowAnimation:", v20, 100);

      }
      -[NTKCFaceDetailEditOptionSectionController setActionRow:](self, "setActionRow:", 0);

    }
  }
  v21 = v43[3];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = v47[3];
    if (v22 != 0x7FFFFFFFFFFFFFFFLL && v21 > v22)
      v43[3] = v21 - 1;
    -[NTKCFaceDetailSectionController rows](self, "rows", v33, v34, v35, v36, v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "containsObject:", v24);

    if (v25)
    {
      -[NTKCFaceDetailEditOptionSectionController _refreshActionRowContent](self, "_refreshActionRowContent");
    }
    else
    {
      -[NTKCFaceDetailEditOptionSectionController _createActionRow](self, "_createActionRow");
      -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (!v27)
      {
        -[NTKCFaceDetailSectionController rows](self, "rows");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailEditOptionSectionController actionRow](self, "actionRow");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "insertObject:atIndex:", v29, v43[3]);

        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v43[3], -[NTKCFaceDetailSectionController section](self, "section"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKCFaceDetailSectionController tableView](self, "tableView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "insertRowsAtIndexPaths:withRowAnimation:", v32, 100);

      }
    }
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

}

void __68__NTKCFaceDetailEditOptionVerticalSectionController_reloadActionRow__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionRow");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v16;
  if (v5 == v16)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  else
  {
    objc_msgSend(v16, "editOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)));

    v8 = objc_msgSend(v16, "active");
    v6 = v16;
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "face");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "face");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "customEditMode:hasActionForOption:forDevice:", v11, v12, v14) & 1) != 0)
      {
        v15 = objc_msgSend(*(id *)(a1 + 32), "_canDisplayActionRowForCustomEditMode:andOption:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));

        v6 = v16;
        if (v15)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3 + 1;
      }
      else
      {

        v6 = v16;
      }
    }
  }

}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  id v6;

  v6 = a4;
  -[NTKCFaceDetailEditOptionVerticalSectionController _setupWithCollection:](self, "_setupWithCollection:", a3);
  -[NTKCFaceDetailEditOptionVerticalSectionController setSelectedOptions:](self, "setSelectedOptions:", v6);

  return 1;
}

- (void)_setupWithCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;

  v18 = a3;
  if (v18)
  {
    -[NTKCFaceDetailEditOptionSectionController setCollection:](self, "setCollection:", v18);
    v4 = -[NTKCFaceDetailSectionController _newSectionHeader](self, "_newSectionHeader");
    -[NTKCFaceDetailSectionController setHeaderView:](self, "setHeaderView:", v4);

    -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionController headerView](self, "headerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

  }
  v8 = (void *)objc_opt_new();
  -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      -[NTKCFaceDetailEditOptionSectionController optionAtIndex:](self, "optionAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailEditOptionVerticalSectionController cellForEditOption:](self, "cellForEditOption:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);

      ++v12;
      -[NTKCFaceDetailEditOptionSectionController collection](self, "collection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "options");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v12 < v17);
  }
  -[NTKCFaceDetailSectionController setRows:](self, "setRows:", v8);

}

- (id)cellForEditOption:(id)a3
{
  id v3;
  NTKCFaceDetailEnumeratedEditOptionCell *v4;

  v3 = a3;
  v4 = -[NTKCFaceDetailEnumeratedEditOptionCell initWithEditOption:]([NTKCFaceDetailEnumeratedEditOptionCell alloc], "initWithEditOption:", v3);

  return v4;
}

- (int64_t)numberOfRows
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  v3 = -[NTKCFaceDetailSectionController numberOfRows](&v6, sel_numberOfRows);
  -[NTKCFaceDetailEditOptionVerticalSectionController footerCell](self, "footerCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return (int64_t)v3 + 1;
  else
    return (int64_t)v3;
}

- (id)cellForRow:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  -[NTKCFaceDetailSectionController cellForRow:](&v9, sel_cellForRow_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 == a3)
    {
      -[NTKCFaceDetailEditOptionVerticalSectionController footerCell](self, "footerCell");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (double)heightForRow:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  -[NTKCFaceDetailSectionController heightForRow:](&v12, sel_heightForRow_);
  v6 = v5;
  if (v5 == 0.0)
  {
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 == a3)
    {
      -[NTKCFaceDetailEditOptionVerticalSectionController footerCell](self, "footerCell");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rowHeight");
      v6 = v10;

    }
  }
  return v6;
}

- (void)setFooter:(id)a3
{
  id v5;
  NSString *footer;
  void *v7;
  NTKCFaceDetailDescriptionCell *v8;
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
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_footer, a3);
  footer = self->_footer;
  -[NTKCFaceDetailEditOptionVerticalSectionController footerCell](self, "footerCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (footer)
  {
    if (!v7)
    {
      v8 = objc_alloc_init(NTKCFaceDetailDescriptionCell);
      -[NTKCFaceDetailEditOptionVerticalSectionController setFooterCell:](self, "setFooterCell:", v8);

      v9 = (void *)MEMORY[0x1E0CB36B0];
      -[NTKCFaceDetailSectionController rows](self, "rows");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathForRow:inSection:", objc_msgSend(v10, "count"), -[NTKCFaceDetailSectionController section](self, "section"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKCFaceDetailSectionController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertRowsAtIndexPaths:withRowAnimation:", v13, 100);

    }
    -[NTKCFaceDetailEditOptionVerticalSectionController footerCell](self, "footerCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v5);
    goto LABEL_7;
  }
  if (v7)
  {
    -[NTKCFaceDetailEditOptionVerticalSectionController setFooterCell:](self, "setFooterCell:", 0);
    v15 = (void *)MEMORY[0x1E0CB36B0];
    -[NTKCFaceDetailSectionController rows](self, "rows");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexPathForRow:inSection:", objc_msgSend(v16, "count"), -[NTKCFaceDetailSectionController section](self, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKCFaceDetailSectionController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deleteRowsAtIndexPaths:withRowAnimation:", v18, 100);

LABEL_7:
  }

}

- (NTKCFaceDetailDescriptionCell)footerCell
{
  return self->_footerCell;
}

- (void)setFooterCell:(id)a3
{
  objc_storeStrong((id *)&self->_footerCell, a3);
}

- (NSString)footer
{
  return self->_footer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_footerCell, 0);
}

@end
