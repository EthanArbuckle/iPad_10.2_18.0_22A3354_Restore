@implementation HUStatusItemModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  id v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "_layoutOptionsForEnvironment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA1E0];
  v7 = (void *)MEMORY[0x1E0CEA1F0];
  v8 = (void *)MEMORY[0x1E0CEA1C0];
  objc_msgSend(v5, "statusCellOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "estimatedCellWidth");
  objc_msgSend(v8, "estimatedDimension:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalHeightDimension:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWithWidthDimension:heightDimension:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemWithLayoutSize:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CEA1F0];
  v15 = (void *)MEMORY[0x1E0CEA1C0];
  objc_msgSend(v5, "statusCellOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "estimatedCellWidth");
  objc_msgSend(v15, "estimatedDimension:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CEA1C0];
  objc_msgSend(v5, "statusCellOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cellHeight");
  objc_msgSend(v18, "estimatedDimension:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeWithWidthDimension:heightDimension:", v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0CEA1D0];
  v35[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "horizontalGroupWithLayoutSize:subitems:", v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusCellOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "cellSpacing");
  objc_msgSend(v25, "setInterGroupSpacing:");

  objc_msgSend(v25, "setOrthogonalScrollingBehavior:", 1);
  objc_msgSend(v25, "setContentInsetsReference:", 3);
  objc_msgSend(v5, "sectionTopMargin");
  v28 = v27;
  objc_msgSend(v5, "sectionLeadingMargin");
  v30 = v29;
  objc_msgSend(v5, "sectionBottomMargin");
  v32 = v31;
  objc_msgSend(v5, "sectionTrailingMargin");
  objc_msgSend(v25, "setContentInsets:", v28, v30, v32, v33);

  return v25;
}

- (id)cellLayoutOptions
{
  return -[HUStatusItemModuleController _defaultCellLayoutOptionsForViewSize:](self, "_defaultCellLayoutOptionsForViewSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUStatusItemModuleController;
  -[HUItemModuleController configureCell:forItem:](&v10, sel_configureCell_forItem_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUStatusItemModuleController cellLayoutOptions](self, "cellLayoutOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "statusCellOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutOptions:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentConfiguration:", v9);

    objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundConfiguration:", v7);
  }

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "supportsInvalidation"))
    {
      objc_msgSend(v5, "latestResults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      objc_msgSend(v5, "latestResults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E80]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      v13 = v8 == 2 || v11 == 2;
      -[HUItemModuleController module](self, "module");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateNeedsInvalidation:forStatusItem:", v13, v5);

    }
  }

  return 0;
}

- (id)_defaultCellLayoutOptionsForViewSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  v5 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
    v6 = &unk_1E7040B88;
  else
    v6 = 0;
  +[HUGridLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", v5, v6, width, height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStatusHidden:", 0);
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentSizeCategory:", v9);

  objc_msgSend(v7, "setEditing:", 0);
  return v7;
}

+ (id)_layoutOptionsForEnvironment:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0D319D0];
  v4 = a3;
  v5 = objc_msgSend(v3, "isAMac");
  v6 = objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom");
  v7 = &unk_1E7040B88;
  if (!v6)
    v7 = 0;
  v8 = v7;
  objc_msgSend(v4, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectiveContentSize");
  +[HUGridLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentSizeCategory:", v12);

  objc_msgSend(v10, "setSectionLeadingMargin:", 0.0);
  objc_msgSend(v10, "setSectionTrailingMargin:", 0.0);
  return v10;
}

@end
