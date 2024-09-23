@implementation HUQuickControlGridLayoutManager

- (HUQuickControlGridLayoutManager)initWithCollectionView:(id)a3 itemManager:(id)a4 layoutOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUQuickControlGridLayoutManager *v11;
  HUQuickControlGridLayoutManager *v12;
  uint64_t v13;
  NSMutableArray *sectionSettingsArray;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlGridLayoutManager;
  v11 = -[HUQuickControlGridLayoutManager init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_collectionView, v8);
    objc_storeStrong((id *)&v12->_itemManager, a4);
    objc_storeStrong((id *)&v12->_layoutOptions, a5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    sectionSettingsArray = v12->_sectionSettingsArray;
    v12->_sectionSettingsArray = (NSMutableArray *)v13;

    -[HUQuickControlGridLayoutManager generateSectionSettings](v12, "generateSectionSettings");
  }

  return v12;
}

- (HUQuickControlGridLayoutManager)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCollectionView_itemManager_layoutOptions_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlGridLayoutManager.m"), 57, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUQuickControlGridLayoutManager init]",
    v5);

  return 0;
}

- (void)setLayoutOptions:(id)a3
{
  HUQuickControlCollectionViewControllerLayoutOptions *v5;
  HUQuickControlCollectionViewControllerLayoutOptions *v6;

  v5 = (HUQuickControlCollectionViewControllerLayoutOptions *)a3;
  if (self->_layoutOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUQuickControlGridLayoutManager generateSectionSettings](self, "generateSectionSettings");
    v5 = v6;
  }

}

- (NSArray)collectionSectionSettings
{
  void *v2;
  void *v3;

  -[HUQuickControlGridLayoutManager sectionSettingsArray](self, "sectionSettingsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (unint64_t)itemSizeForSection:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemsInSection:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v6, "count");

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0)
  {
    if (v7 > 2)
      return 1;
    else
      return 2;
  }
  else
  {
    v10 = -[HUQuickControlGridLayoutManager viewSizeSubclass](self, "viewSizeSubclass");
    -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[HUQuickControlGridLayoutManager _mostImportantItemTypeForSection:](self, "_mostImportantItemTypeForSection:", a3);
    if (objc_msgSend(v12, "hasSuffix:", CFSTR("supplementary")))
    {
      if (v13 == 4)
      {
        v33[0] = &unk_1E7040528;
        v33[1] = &unk_1E7040558;
        v34[0] = &unk_1E7040540;
        v34[1] = &unk_1E7040570;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = v34;
        v16 = v33;
LABEL_8:
        v17 = 2;
LABEL_18:
        objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = HUConstantIntegerForViewSizeSubclass(v10, v21);

      }
      else
      {
LABEL_19:
        v9 = 1;
      }
    }
    else
    {
      v9 = 2;
      switch(v13)
      {
        case 0uLL:
          -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "displayedItemsInSectionWithIdentifier:", CFSTR("supplementary"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "na_any:", &__block_literal_global_25);

          if (v20)
          {
            v29[0] = &unk_1E7040528;
            v29[1] = &unk_1E7040558;
            v30[0] = &unk_1E7040588;
            v30[1] = &unk_1E7040570;
            v14 = (void *)MEMORY[0x1E0C99D80];
            v15 = v30;
            v16 = v29;
          }
          else
          {
            v27[0] = &unk_1E7040528;
            v27[1] = &unk_1E7040558;
            v28[0] = &unk_1E7040540;
            v28[1] = &unk_1E70405A0;
            v14 = (void *)MEMORY[0x1E0C99D80];
            v15 = v28;
            v16 = v27;
          }
          goto LABEL_8;
        case 1uLL:
          if (v7 >= 8)
          {
            v31[0] = &unk_1E7040528;
            v31[1] = &unk_1E7040558;
            v32[0] = &unk_1E7040540;
            v32[1] = &unk_1E7040570;
            v14 = (void *)MEMORY[0x1E0C99D80];
            v15 = v32;
            v16 = v31;
            goto LABEL_8;
          }
          if (v7 > 2)
            v9 = 2;
          else
            v9 = 3;
          break;
        case 2uLL:
          v25[0] = &unk_1E7040528;
          v25[1] = &unk_1E7040558;
          v26[0] = &unk_1E7040540;
          v26[1] = &unk_1E70405A0;
          v25[2] = &unk_1E70405B8;
          v26[2] = &unk_1E70405A0;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = v26;
          v16 = v25;
          goto LABEL_17;
        case 7uLL:
          if (v7 != 1)
            goto LABEL_19;
          v23[0] = &unk_1E7040528;
          v23[1] = &unk_1E7040558;
          v24[0] = &unk_1E7040570;
          v24[1] = &unk_1E70405A0;
          v23[2] = &unk_1E70405B8;
          v24[2] = &unk_1E70405A0;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = v24;
          v16 = v23;
LABEL_17:
          v17 = 3;
          goto LABEL_18;
        default:
          break;
      }
    }

  }
  return v9;
}

uint64_t __54__HUQuickControlGridLayoutManager_itemSizeForSection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)generateSectionSettings
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __objc2_class **v15;
  unint64_t v16;
  __objc2_class *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridLayoutManager setSectionSettingsArray:](self, "setSectionSettingsArray:", v5);

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("sensors")))
  {
    v7 = 0;
  }
  else
  {
    -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayedSectionIdentifierForSectionIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "hasSuffix:", CFSTR("grid"));

  }
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUQuickControlGridLayoutManager layoutOptions](self, "layoutOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", CFSTR("sensors"));
      v15 = off_1E6F3D360;
      if ((v14 & 1) != 0
        || (v16 = -[HUQuickControlGridLayoutManager _mostImportantItemTypeForSection:](self, "_mostImportantItemTypeForSection:", i), v15 = off_1E6F3D250, v16 == 6))
      {
        v17 = *v15;
        -[HUQuickControlGridLayoutManager layoutOptions](self, "layoutOptions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "viewSize");
        -[__objc2_class defaultOptionsForViewSize:](v17, "defaultOptionsForViewSize:");
        v19 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v19;
      }
      -[HUQuickControlGridLayoutManager _settingsForSectionNumber:sectionIdentifier:layoutOptions:](self, "_settingsForSectionNumber:sectionIdentifier:layoutOptions:", i, v12, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && objc_msgSend(v12, "isEqualToString:", CFSTR("grid")))
      {
        objc_msgSend(v13, "minimumSectionToSensorSectionSpacing");
        objc_msgSend(v20, "setSectionTopPadding:");
      }
      else if (objc_msgSend(v12, "isEqualToString:", CFSTR("sensors")))
      {
        objc_msgSend(v20, "setHorizontalAlignment:", 3);
      }
      -[HUQuickControlGridLayoutManager sectionSettingsArray](self, "sectionSettingsArray");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v20);

    }
  }
}

- (id)_settingsForSectionNumber:(unint64_t)a3 sectionIdentifier:(id)a4 layoutOptions:(id)a5
{
  id v8;
  id v9;
  HUQuickControlCollectionGridLayoutSettings *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(HUQuickControlCollectionGridLayoutSettings);
  -[HUQuickControlCollectionGridLayoutSettings setSectionNumber:](v10, "setSectionNumber:", a3);
  -[HUQuickControlCollectionGridLayoutSettings setSectionIdentifier:](v10, "setSectionIdentifier:", v9);

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleForSection:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionGridLayoutSettings setSectionHeader:](v10, "setSectionHeader:", v12);

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedTitleForSection:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionGridLayoutSettings setSectionAttributedHeader:](v10, "setSectionAttributedHeader:", v14);

  -[HUQuickControlCollectionGridLayoutSettings setTitlePosition:](v10, "setTitlePosition:", -[HUQuickControlGridLayoutManager titlePositionForSection:](self, "titlePositionForSection:", a3));
  -[HUQuickControlGridLayoutManager sectionTopPaddingInSection:withLayoutOptions:](self, "sectionTopPaddingInSection:withLayoutOptions:", a3, v8);
  -[HUQuickControlCollectionGridLayoutSettings setSectionTopPadding:](v10, "setSectionTopPadding:");
  objc_msgSend(v8, "rowSpacing");
  -[HUQuickControlCollectionGridLayoutSettings setRowSpacing:](v10, "setRowSpacing:");
  -[HUQuickControlCollectionGridLayoutSettings setPreferredLayoutStyle:](v10, "setPreferredLayoutStyle:", objc_msgSend(v8, "preferredLayoutStyle"));
  -[HUQuickControlCollectionGridLayoutSettings setHorizontalAlignment:](v10, "setHorizontalAlignment:", 3);
  v15 = -[HUQuickControlGridLayoutManager itemSizeForSection:](self, "itemSizeForSection:", a3);
  -[HUQuickControlCollectionGridLayoutSettings setItemSize:](v10, "setItemSize:", v15);
  -[HUQuickControlGridLayoutManager interItemSpacingForItemSize:layoutOptions:](self, "interItemSpacingForItemSize:layoutOptions:", v15, v8);
  v17 = v16;

  -[HUQuickControlCollectionGridLayoutSettings setInteritemSpacing:](v10, "setInteritemSpacing:", v17);
  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayedItemsInSection:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  v21 = -[HUQuickControlGridLayoutManager numberOfColumnsInSection:](self, "numberOfColumnsInSection:", a3);
  -[HUQuickControlCollectionGridLayoutSettings setNumberOfItems:](v10, "setNumberOfItems:", v20);
  -[HUQuickControlCollectionGridLayoutSettings setNumberOfColumns:](v10, "setNumberOfColumns:", v21);
  if (v20 <= v21)
    v22 = 1;
  else
    v22 = vcvtpd_u64_f64((double)v20 / (double)v21);
  -[HUQuickControlCollectionGridLayoutSettings setNumberOfRows:](v10, "setNumberOfRows:", v22);
  return v10;
}

- (double)interItemSpacingForItemSize:(unint64_t)a3 layoutOptions:(id)a4
{
  double v4;
  id v6;
  void *v7;
  double v8;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(v6, "interitemSpacingForExtraSmallControlSize");
      goto LABEL_6;
    case 1uLL:
      objc_msgSend(v6, "interitemSpacingForSmallControlSize");
      goto LABEL_6;
    case 2uLL:
      objc_msgSend(v6, "interitemSpacingForRegularControlSize");
      goto LABEL_6;
    case 3uLL:
      objc_msgSend(v6, "interitemSpacingForLargeControlSize");
LABEL_6:
      v4 = v8;
      break;
    default:
      break;
  }

  return v4;
}

- (double)sectionTopPaddingInSection:(unint64_t)a3 withLayoutOptions:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  int v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  double v25;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    objc_msgSend(v6, "minimumSectionSpacing");
    v9 = v8;
    -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedSectionIdentifierForSectionIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "hasSuffix:", CFSTR("supplementary")))
    {
      v12 = -[HUQuickControlGridLayoutManager _mostImportantItemTypeForSection:](self, "_mostImportantItemTypeForSection:", a3);
      v13 = -[HUQuickControlGridLayoutManager _mostImportantItemTypeForSection:](self, "_mostImportantItemTypeForSection:", a3 - 1);
      if (v12 == 3 && v13 == 2)
      {
        objc_msgSend(v7, "thermostatSectionSpacingOverride");
        v9 = v14;
      }
    }
    else
    {
      v16 = objc_msgSend(v11, "isEqualToString:", CFSTR("sensors"));
      v17 = a3 - 2;
      if (a3 >= 2 && v16)
      {
        -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = a3 - 1;
        objc_msgSend(v18, "displayedSectionIdentifierForSectionIndex:", a3 - 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "displayedSectionIdentifierForSectionIndex:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = -[HUQuickControlGridLayoutManager _mostImportantItemTypeForSection:](self, "_mostImportantItemTypeForSection:", v19);
        v24 = -[HUQuickControlGridLayoutManager _mostImportantItemTypeForSection:](self, "_mostImportantItemTypeForSection:", v17);
        if (objc_msgSend(v20, "hasSuffix:", CFSTR("supplementary"))
          && objc_msgSend(v22, "hasSuffix:", CFSTR("grid"))
          && v23 == 3
          && v24 == 2)
        {
          objc_msgSend(v7, "thermostatSectionSpacingOverride");
          v9 = v25;
        }

      }
    }

  }
  else
  {
    objc_msgSend(v6, "minimumNavBarToControlsSpacing");
    v9 = v15;
  }

  return v9;
}

- (unint64_t)numberOfColumnsInSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemsInSection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedSectionIdentifierForSectionIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "hasSuffix:", CFSTR("grid")))
  {
    v10 = -[HUQuickControlGridLayoutManager _mostImportantItemTypeForSection:](self, "_mostImportantItemTypeForSection:", a3);
    v11 = 2;
    if (v7 < 2)
      v11 = v7;
    v12 = 1;
    if (v7 >= 4)
      v12 = 2;
    if (v10 == 1)
      v11 = v12;
    if (v10 == 2)
      v7 = 1;
    else
      v7 = v11;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("sensors")))
  {
    if (v7 >= 2)
      v7 = 2;
  }
  else
  {
    v13 = -[HUQuickControlGridLayoutManager _mostImportantItemTypeForSection:](self, "_mostImportantItemTypeForSection:", a3)- 3;
    v14 = 3;
    if (v7 < 3)
      v14 = v7;
    if (v13 < 3)
      v7 = 1;
    else
      v7 = v14;
  }

  return v7;
}

- (unint64_t)titlePositionForSection:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 1;
  v7 = (void *)MEMORY[0x1E0CB3550];
  -[HUQuickControlGridLayoutManager _viewProfileClassesForSection:](self, "_viewProfileClassesForSection:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke;
  v22[3] = &unk_1E6F4E090;
  v23 = v9;
  v11 = v9;
  LODWORD(v8) = objc_msgSend(v11, "na_any:", v22);
  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayedItemsInSection:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3550];
  objc_msgSend(v13, "na_map:", &__block_literal_global_27);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke_3;
  v20[3] = &unk_1E6F4E0D8;
  v21 = v16;
  v17 = v16;
  if (v8 | objc_msgSend(v17, "na_any:", v20))
    v18 = 1;
  else
    v18 = 2;

  return v18;
}

uint64_t __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t result;

  v3 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2);
  LODWORD(result) = objc_msgSend(a2, "isEqual:", objc_opt_class());
  if (v3 > 2)
    return result;
  else
    return 0;
}

id __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryServiceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __59__HUQuickControlGridLayoutManager_titlePositionForSection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2) > 1;
}

- (int64_t)viewSizeSubclass
{
  void *v2;
  int64_t v3;

  -[HUQuickControlGridLayoutManager layoutOptions](self, "layoutOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "viewSizeSubclass");

  return v3;
}

- (unint64_t)_mostImportantItemTypeForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  int v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedSectionIdentifierForSectionIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("supplementary"));
  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HUQuickControlGridLayoutManager _viewProfileClassesForSection:](self, "_viewProfileClassesForSection:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v7)
      goto LABEL_11;
    v12 = objc_msgSend(v10, "na_any:", &__block_literal_global_30_1);
    v13 = objc_msgSend(v11, "na_any:", &__block_literal_global_32);
    v14 = objc_msgSend(v11, "na_any:", &__block_literal_global_34);
    v15 = 4;
    if (!v13)
      v15 = 5;
    v16 = v12 ? 3 : v15;
    if ((v12 & 1) == 0 && (v13 & 1) == 0 && (v14 & 1) == 0)
    {
LABEL_11:
      v17 = objc_msgSend(v11, "na_all:", &__block_literal_global_36);
      v18 = objc_msgSend(v11, "na_any:", &__block_literal_global_37);
      v19 = objc_msgSend(v11, "na_any:", &__block_literal_global_40);
      v20 = objc_msgSend(v11, "na_all:", &__block_literal_global_42);
      v21 = 1;
      if (!v17)
        v21 = 2;
      v22 = 7;
      if (!v20)
        v22 = 8;
      if (v18)
        v22 = 0;
      if ((v19 & 1) != 0)
        v22 = v21;
      if ((v17 & 1) != 0)
        v16 = v21;
      else
        v16 = v22;
    }

  }
  else if (v7)
  {
    v16 = 6;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", objc_opt_class());
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", objc_opt_class());
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", objc_opt_class());
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", objc_opt_class());
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_5(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "isEqual:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a2, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a2, "isEqual:", objc_opt_class());
  }
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", objc_opt_class());
}

uint64_t __68__HUQuickControlGridLayoutManager__mostImportantItemTypeForSection___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", objc_opt_class());
}

- (id)_viewProfileClassesForSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[HUQuickControlGridLayoutManager itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemsInSection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HUQuickControlGridLayoutManager__viewProfileClassesForSection___block_invoke;
  v10[3] = &unk_1E6F4E200;
  v10[4] = self;
  objc_msgSend(v6, "na_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_45);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __65__HUQuickControlGridLayoutManager__viewProfileClassesForSection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickControlContextForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __65__HUQuickControlGridLayoutManager__viewProfileClassesForSection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "viewProfileClass");
}

- (HUQuickControlCollectionViewControllerLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HUQuickControlCollectionItemManaging)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (NSMutableArray)sectionSettingsArray
{
  return self->_sectionSettingsArray;
}

- (void)setSectionSettingsArray:(id)a3
{
  objc_storeStrong((id *)&self->_sectionSettingsArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionSettingsArray, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
