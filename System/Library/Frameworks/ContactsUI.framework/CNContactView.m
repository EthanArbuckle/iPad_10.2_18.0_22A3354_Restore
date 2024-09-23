@implementation CNContactView

- (void)setValueTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3312);
}

- (void)setSelectedCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCellBackgroundColor, a3);
}

- (void)setSectionBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_sectionBackgroundColor, a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CNContactView *v39;
  void *v40;
  objc_super v41;

  kdebug_trace();
  v41.receiver = self;
  v41.super_class = (Class)CNContactView;
  -[CNContactView layoutSubviews](&v41, sel_layoutSubviews);
  -[CNContactView oldSize](self, "oldSize");
  v4 = v3;
  v6 = v5;
  -[CNContactView frame](self, "frame");
  if (v4 != v8 || v6 != v7)
  {
    -[CNContactView setNeedsUpdateVisibleCells](self, "setNeedsUpdateVisibleCells");
    -[CNContactView frame](self, "frame");
    -[CNContactView setOldSize:](self, "setOldSize:", v10, v11);
  }
  -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "usesInsetPlatterStyle");

  if (v13)
  {
    -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sectionMaximumPlatterWidth");
    v16 = v15;

    -[CNContactView bounds](self, "bounds");
    v18 = (v17 - v16) * 0.5;
    if (v18 >= 0.0)
    {
      -[CNContactView safeAreaInsets](self, "safeAreaInsets");
      v21 = v18 - v25;
      -[CNContactView safeAreaInsets](self, "safeAreaInsets");
      v24 = v18 - v26;
    }
    else
    {
      -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sectionContentInset");
      v21 = v20 * 0.5;
      -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sectionContentInset");
      v24 = v23 * 0.5;

    }
    -[CNContactView _sectionContentInset](self, "_sectionContentInset");
    if ((v21 != v30 || v27 != 0.0 || v24 != v29 || v28 != 0.0)
      && (-[CNContactView isEditing](self, "isEditing") & 1) == 0)
    {
      +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "runningInContactsAppOniPad");

      if (v32)
      {
        -[CNContactView setLayoutMargins:](self, "setLayoutMargins:", 0.0, v21, 0.0, v24);
        -[CNContactView separatorInset](self, "separatorInset");
        v34 = v33;
        -[CNContactView separatorInset](self, "separatorInset");
        -[CNContactView setSeparatorInset:](self, "setSeparatorInset:", v34, v21);
      }
      else
      {
        if (-[CNContactView isSiri](self, "isSiri"))
        {
          v35 = *MEMORY[0x1E0DC49E8];
          v36 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
          v37 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
          v38 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
          v39 = self;
        }
        else
        {
          v35 = 0.0;
          v37 = 0.0;
          v39 = self;
          v36 = v21;
          v38 = v24;
        }
        -[CNContactView _setSectionContentInset:](v39, "_setSectionContentInset:", v35, v36, v37, v38);
      }
      -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "sectionCornerRadius");
      -[CNContactView _setSectionCornerRadius:](self, "_setSectionCornerRadius:");

    }
  }
  kdebug_trace();
}

- (CGSize)oldSize
{
  double width;
  double height;
  CGSize result;

  width = self->_oldSize.width;
  height = self->_oldSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactView;
  -[CNContactView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[CNContactView setNeedsUpdateVisibleCells](self, "setNeedsUpdateVisibleCells");
}

- (void)setNeedsUpdateVisibleCells
{
  const __CFAllocator *v2;
  CFRunLoopObserverRef v3;
  __CFRunLoopObserver *v4;
  __CFRunLoop *Main;
  _QWORD block[5];

  if (!self->_needsUpdateVisibleCells)
  {
    self->_needsUpdateVisibleCells = 1;
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CNContactView_setNeedsUpdateVisibleCells__block_invoke;
    block[3] = &unk_1E2049698;
    block[4] = self;
    v3 = CFRunLoopObserverCreateWithHandler(v2, 0x20uLL, 0, 0, block);
    if (v3)
    {
      v4 = v3;
      Main = CFRunLoopGetMain();
      CFRunLoopAddObserver(Main, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      CFRelease(v4);
    }
  }
}

- (void)setOldSize:(CGSize)a3
{
  self->_oldSize = a3;
}

- (BOOL)isSiri
{
  return self->_isSiri;
}

+ (BOOL)isMultiValueProperty:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isMultiValueProperty__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isMultiValueProperty__onceToken, &__block_literal_global_116);
  v5 = objc_msgSend((id)isMultiValueProperty__singleValueProperties, "containsObject:", v4);

  return v5 ^ 1;
}

+ (BOOL)isFixedValueProperty:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isFixedValueProperty__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isFixedValueProperty__onceToken, &__block_literal_global_117);
  v5 = objc_msgSend((id)isFixedValueProperty__fixedValueProperties, "containsObject:", v4);

  return v5;
}

- (NSDictionary)labelTextAttributes
{
  return self->_labelTextAttributes;
}

- (void)applyCellAppearance:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "_cnui_applyContactStyle");
  v4 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v24;
    -[CNContactView actionTextAttributes](self, "actionTextAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActionsColor:", v7);

    objc_msgSend(v5, "labelLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", v4 ^ 1);

    objc_msgSend(v5, "valueLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setNumberOfLines:", v4 ^ 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    -[CNContactView separatorColor](self, "separatorColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setEditorSeparatorColor:", v9);
  }

LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v24;
    objc_msgSend(v10, "labelButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", v4 ^ 1);

    if ((_DWORD)v4)
      v13 = 0;
    else
      v13 = 4;
    objc_msgSend(v10, "labelButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLineBreakMode:", v13);

    objc_msgSend(v10, "setVseparatorHidden:", v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v24;
    objc_msgSend(v16, "valueLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNumberOfLines:", 0);

    objc_msgSend(v16, "setShouldUseMapTiles:", -[CNContactView shouldUseMapTiles](self, "shouldUseMapTiles"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNumberOfLines:", v4 ^ 1);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)MEMORY[0x1E0DC1350];
    v20 = *MEMORY[0x1E0DC4A88];
    v21 = v24;
    objc_msgSend(v19, "ab_preferredFontForTextStyle:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setFont:", v22);
  }
  if (objc_msgSend(v24, "isSelected"))
  {
    objc_msgSend(v24, "setSelected:animated:", 0, 0);
    objc_msgSend(v24, "setSelected:animated:", 1, 0);
  }
  if (-[CNContactView isEditing](self, "isEditing"))
  {
    -[CNContactView separatorInsetForCell:](self, "separatorInsetForCell:", v24);
    objc_msgSend(v24, "setSeparatorInset:");
  }
  objc_msgSend(v24, "setNeedsUpdateConstraints");

}

- (NSDictionary)valueTextAttributes
{
  return self->_valueTextAttributes;
}

- (NSDictionary)actionTextAttributes
{
  return self->_actionTextAttributes;
}

+ (id)cellIdentifierForProperty:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967C0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967F0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96868]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96740]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967B0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96680]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96888]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96840]) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96860]);
  }
  v4 = objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "cellIdentifierForClass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)cellIdentifierForActions
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

- (BOOL)shouldUseMapTiles
{
  return self->_shouldUseMapTiles;
}

- (void)setEditing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactView;
  -[CNContactView setEditing:](&v4, sel_setEditing_, a3);
  -[CNContactView updateTableViewMetrics](self, "updateTableViewMetrics");
}

- (CNContactView)initWithFrame:(CGRect)a3 contact:(id)a4
{
  return -[CNContactView initWithFrame:style:contact:](self, "initWithFrame:style:contact:", 1, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)allCardProperties
{
  if (allCardProperties_onceToken != -1)
    dispatch_once(&allCardProperties_onceToken, &__block_literal_global_106);
  return (id)allCardProperties_properties;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactView;
  -[CNContactView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[CNContactView updateFontColors](self, "updateFontColors");
  -[CNContactView setNeedsUpdateVisibleCells](self, "setNeedsUpdateVisibleCells");
}

- (CNContactView)initWithFrame:(CGRect)a3 style:(int64_t)a4 contact:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  CNContactView *v13;
  CNContactView *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  CNContactView *v29;
  objc_super v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  _QWORD v37[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)CNContactView;
  v13 = -[CNContactView initWithFrame:style:](&v31, sel_initWithFrame_style_, a4, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_contact, a5);
    -[CNContactView _setCellsSelfSize:](v14, "_setCellsSelfSize:", 1);
    -[CNContactView setKeyboardDismissMode:](v14, "setKeyboardDismissMode:", 2);
    -[CNContactView setAllowsSelectionDuringEditing:](v14, "setAllowsSelectionDuringEditing:", 1);
    -[CNContactView setSectionFooterHeight:](v14, "setSectionFooterHeight:", 0.0);
    -[CNContactView _setTopPadding:](v14, "_setTopPadding:", 0.0);
    -[CNContactView _setBottomPadding:](v14, "_setBottomPadding:", 0.0);
    -[CNContactView setRestorationIdentifier:](v14, "setRestorationIdentifier:", CFSTR("ContactTableView"));
    -[CNContactView _setIgnoreCopyFilterForTableAnimations:](v14, "_setIgnoreCopyFilterForTableAnimations:", 1);
    -[CNContactView setShouldUseMapTiles:](v14, "setShouldUseMapTiles:", 1);
    -[CNContactView setRowHeight:](v14, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
    -[CNContactView updateTableViewMetrics](v14, "updateTableViewMetrics");
    v15 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_scaledValueForValue:", 44.0);
    -[CNContactView setEstimatedRowHeight:](v14, "setEstimatedRowHeight:");

    -[CNContactView traitCollection](v14, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView setCellLayoutMarginsFollowReadableWidth:](v14, "setCellLayoutMarginsFollowReadableWidth:", objc_msgSend(v17, "userInterfaceIdiom") == 1);

    v36 = CFSTR("ABTextStyleAttributeName");
    v18 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    v19 = *MEMORY[0x1E0DC4B10];
    if (v18)
      v19 = v15;
    v37[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView setLabelTextAttributes:](v14, "setLabelTextAttributes:", v20);

    v34 = CFSTR("ABTextStyleAttributeName");
    v35 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView setValueTextAttributes:](v14, "setValueTextAttributes:", v21);

    v32 = CFSTR("ABTextStyleAttributeName");
    v33 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView setActionTextAttributes:](v14, "setActionTextAttributes:", v22);

    -[CNContactView updateFontSizes](v14, "updateFontSizes");
    -[CNContactView updateFontColors](v14, "updateFontColors");
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    -[CNContactView registerContactCellClass:](v14, "registerContactCellClass:", objc_opt_class());
    v23 = objc_opt_class();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView registerClass:forHeaderFooterViewReuseIdentifier:](v14, "registerClass:forHeaderFooterViewReuseIdentifier:", v23, v25);

    v26 = objc_opt_class();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView registerClass:forHeaderFooterViewReuseIdentifier:](v14, "registerClass:forHeaderFooterViewReuseIdentifier:", v26, v28);

    v29 = v14;
  }

  return v14;
}

- (void)registerContactCellClass:(Class)a3
{
  id v5;

  objc_msgSend((id)objc_opt_class(), "cellIdentifierForClass:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactView registerClass:forCellReuseIdentifier:](self, "registerClass:forCellReuseIdentifier:", a3, v5);

}

+ (id)cellIdentifierForClass:(Class)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", class_getName(a3), 1);
}

- (void)setLabelTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3304);
}

- (void)setActionTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3320);
}

- (void)updateTableViewMetrics
{
  int v3;
  double v4;
  int v5;
  id v6;

  -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "usesInsetPlatterStyle");
  v4 = 0.0;
  if (v3)
  {
    v5 = -[CNContactView isEditing](self, "isEditing", 0.0);
    v4 = 16.0;
    if (v5)
      v4 = 0.0;
  }
  -[CNContactView setSectionHeaderHeight:](self, "setSectionHeaderHeight:", v4);

}

- (void)updateFontColors
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0DC1140];
  v3 = v11;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("labelTextAttributes"), v6);

  v9 = v3;
  -[UIView tintColorOverride](self, "tintColorOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("actionTextAttributes"), v8);

}

- (void)setShouldUseMapTiles:(BOOL)a3
{
  self->_shouldUseMapTiles = a3;
}

uint64_t __34__CNContactView_allCardProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0C966A8]);
}

uint64_t __43__CNContactView_setNeedsUpdateVisibleCells__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibleCellsIfNeeded");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactView;
  v4 = a3;
  -[CNContactView setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[CNContactView setTableHeaderBackgroundColor:](self, "setTableHeaderBackgroundColor:", v4, v6.receiver, v6.super_class);
  -[CNContactView defaultHeaderView](self, "defaultHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)updateFontSizes
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void (**v9)(void *, const __CFString *);
  _QWORD v10[5];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CNContactView defaultHeaderView](self, "defaultHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateFontSizes");

  v4 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", 44.0);
  -[CNContactView setEstimatedRowHeight:](self, "setEstimatedRowHeight:");

  v11 = CFSTR("ABTextStyleAttributeName");
  v6 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  v7 = *MEMORY[0x1E0DC4B10];
  if (v6)
    v7 = v4;
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("labelTextAttributes"), v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__CNContactView_updateFontSizes__block_invoke;
  v10[3] = &unk_1E204F620;
  v10[4] = self;
  v9 = (void (**)(void *, const __CFString *))_Block_copy(v10);
  v9[2](v9, CFSTR("labelTextAttributes"));
  v9[2](v9, CFSTR("valueTextAttributes"));
  v9[2](v9, CFSTR("actionTextAttributes"));

}

void __32__CNContactView_updateFontSizes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ABTextStyleAttributeName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v9 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cn_updateDictionaryForKey:withChanges:", v3, v8);

  }
}

- (CNContactHeaderView)defaultHeaderView
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v7;
  char v8;
  void *v9;

  -[CNContactView customHeaderView](self, "customHeaderView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
  }
  else
  {
    -[CNContactView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      v5 = 0;
      return (CNContactHeaderView *)v5;
    }
    -[CNContactView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewForHeaderInTableView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      goto LABEL_4;
    }
  }
  v5 = 0;
LABEL_4:

  return (CNContactHeaderView *)v5;
}

- (UIView)customHeaderView
{
  return self->_customHeaderView;
}

+ (id)addFieldCardProperties
{
  if (addFieldCardProperties_onceToken != -1)
    dispatch_once(&addFieldCardProperties_onceToken, &__block_literal_global_112);
  return (id)addFieldCardProperties_properties;
}

+ (id)requiredNameProperties
{
  if (requiredNameProperties_onceToken != -1)
    dispatch_once(&requiredNameProperties_onceToken, &__block_literal_global_97);
  return (id)requiredNameProperties_properties;
}

+ (id)namePropertiesForContact:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  id v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C97218];
  if (v3)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C97218], "nameOrderForContact:", v3);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C97200]);
    v5 = objc_msgSend(v4, "nameOrderForContact:", v6);

  }
  if (v5 == 1)
  {
    if (namePropertiesForContact__onceToken != -1)
      dispatch_once(&namePropertiesForContact__onceToken, &__block_literal_global_13654);
    v7 = &namePropertiesForContact__firstProperties;
  }
  else
  {
    if (namePropertiesForContact__onceToken_95 != -1)
      dispatch_once(&namePropertiesForContact__onceToken_95, &__block_literal_global_96);
    v7 = &namePropertiesForContact__lastProperties;
  }
  v8 = (id)*v7;

  return v8;
}

uint64_t __34__CNContactView_allCardProperties__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0C966A0]);
}

- (void)_cnui_applyContactStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactView;
  -[UITableView _cnui_applyContactStyle](&v7, sel__cnui_applyContactStyle);
  -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
}

- (void)updateVisibleCellsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CNContactView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && self->_needsUpdateVisibleCells)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[CNContactView visibleCells](self, "visibleCells", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[CNContactView applyCellAppearance:](self, "applyCellAppearance:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    self->_needsUpdateVisibleCells = 0;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactView;
  -[CNMaskingTableView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  -[CNContactView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactView setCellLayoutMarginsFollowReadableWidth:](self, "setCellLayoutMarginsFollowReadableWidth:", objc_msgSend(v4, "userInterfaceIdiom") == 1);

}

- (UIColor)sectionBackgroundColor
{
  return self->_sectionBackgroundColor;
}

void __34__CNContactView_allCardProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[14];

  v17[13] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C967C0];
  v17[0] = *MEMORY[0x1E0C966A0];
  v17[1] = v1;
  v2 = *MEMORY[0x1E0C96680];
  v17[2] = *MEMORY[0x1E0C966A8];
  v17[3] = v2;
  v3 = *MEMORY[0x1E0C968A0];
  v17[4] = *MEMORY[0x1E0C96888];
  v17[5] = v3;
  v17[6] = *MEMORY[0x1E0C967F0];
  v17[7] = CFSTR("birthdays");
  v4 = *MEMORY[0x1E0C96840];
  v17[8] = *MEMORY[0x1E0C96690];
  v17[9] = v4;
  v5 = *MEMORY[0x1E0C96740];
  v17[10] = *MEMORY[0x1E0C96868];
  v17[11] = v5;
  v17[12] = *MEMORY[0x1E0C967B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v6);

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFeatureEnabled:", 12);

  if (v9)
  {
    v10 = objc_msgSend(v0, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_110);
    objc_msgSend(v0, "_cn_insertNonNilObject:atIndex:", *MEMORY[0x1E0C96668], v10 + 1);
  }
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "featureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isFeatureEnabled:", 15);

  if (v13)
  {
    v14 = objc_msgSend(v0, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_111);
    objc_msgSend(v0, "_cn_insertNonNilObject:atIndex:", *MEMORY[0x1E0C96860], v14);
  }
  v15 = objc_msgSend(v0, "copy");
  v16 = (void *)allCardProperties_properties;
  allCardProperties_properties = v15;

}

void __38__CNContactView_isFixedValueProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96888];
  v9[0] = *MEMORY[0x1E0C96680];
  v9[1] = v0;
  v9[2] = *MEMORY[0x1E0C967B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isFixedValueProperty__fixedValueProperties;
  isFixedValueProperty__fixedValueProperties = v1;

  v3 = (void *)isFixedValueProperty__fixedValueProperties;
  +[CNContactView nameProperties](CNContactView, "nameProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)isFixedValueProperty__fixedValueProperties;
  isFixedValueProperty__fixedValueProperties = v5;

  objc_msgSend((id)isFixedValueProperty__fixedValueProperties, "arrayByAddingObject:", *MEMORY[0x1E0C96800]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)isFixedValueProperty__fixedValueProperties;
  isFixedValueProperty__fixedValueProperties = v7;

}

void __38__CNContactView_isMultiValueProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96888];
  v10[0] = *MEMORY[0x1E0C96680];
  v10[1] = v0;
  v1 = *MEMORY[0x1E0C966A0];
  v10[2] = *MEMORY[0x1E0C967B0];
  v10[3] = v1;
  v10[4] = *MEMORY[0x1E0C96860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isMultiValueProperty__singleValueProperties;
  isMultiValueProperty__singleValueProperties = v2;

  v4 = (void *)isMultiValueProperty__singleValueProperties;
  +[CNContactView nameProperties](CNContactView, "nameProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)isMultiValueProperty__singleValueProperties;
  isMultiValueProperty__singleValueProperties = v6;

  objc_msgSend((id)isMultiValueProperty__singleValueProperties, "arrayByAddingObject:", *MEMORY[0x1E0C96800]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)isMultiValueProperty__singleValueProperties;
  isMultiValueProperty__singleValueProperties = v8;

}

+ (id)nameProperties
{
  return +[CNContactView namePropertiesForContact:](CNContactView, "namePropertiesForContact:", 0);
}

void __39__CNContactView_requiredNameProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99D80];
  CNContactsUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathForResource:ofType:", CFSTR("ABCardDisplay"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("_LOCALIZABLE_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ShouldShowPhoneticNamesByDefault"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = *MEMORY[0x1E0C967D8];
    v19 = *MEMORY[0x1E0C966D0];
    v20 = v7;
    v8 = *MEMORY[0x1E0C967D0];
    v21 = *MEMORY[0x1E0C966C0];
    v22 = v8;
    v9 = *MEMORY[0x1E0C967E8];
    v23 = *MEMORY[0x1E0C967B8];
    v24 = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v19;
    v12 = 6;
  }
  else
  {
    v13 = *MEMORY[0x1E0C966C0];
    v16 = *MEMORY[0x1E0C966D0];
    v17 = v13;
    v18 = *MEMORY[0x1E0C967B8];
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v16;
    v12 = 3;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)requiredNameProperties_properties;
  requiredNameProperties_properties = v14;

}

void __39__CNContactView_addFieldCardProperties__block_invoke()
{
  int v0;
  void *v1;
  void *v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(getIPPronounPickerViewControllerClass(), "canDisplayPronounPicker"))
    v0 = objc_msgSend(getIPPronounPickerViewControllerClass(), "shouldDisplayPronounPickerByDefault") ^ 1;
  else
    v0 = 0;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "featureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFeatureEnabled:", 12);

  if (v3)
    v4 = v0 == 0;
  else
    v4 = 1;
  if (!v4)
    objc_msgSend(v7, "addObject:", *MEMORY[0x1E0C96668]);
  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)addFieldCardProperties_properties;
  addFieldCardProperties_properties = v5;

}

void __42__CNContactView_namePropertiesForContact___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[17];

  v10[16] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966D0];
  v10[0] = *MEMORY[0x1E0C96790];
  v10[1] = v0;
  v1 = *MEMORY[0x1E0C96830];
  v10[2] = *MEMORY[0x1E0C967D8];
  v10[3] = v1;
  v2 = *MEMORY[0x1E0C967E0];
  v10[4] = *MEMORY[0x1E0C96780];
  v10[5] = v2;
  v3 = *MEMORY[0x1E0C967D0];
  v10[6] = *MEMORY[0x1E0C966C0];
  v10[7] = v3;
  v4 = *MEMORY[0x1E0C96820];
  v10[8] = *MEMORY[0x1E0C96828];
  v10[9] = v4;
  v5 = *MEMORY[0x1E0C967A0];
  v10[10] = *MEMORY[0x1E0C96798];
  v10[11] = v5;
  v6 = *MEMORY[0x1E0C96698];
  v10[12] = *MEMORY[0x1E0C96758];
  v10[13] = v6;
  v7 = *MEMORY[0x1E0C967E8];
  v10[14] = *MEMORY[0x1E0C967B8];
  v10[15] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 16);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)namePropertiesForContact__firstProperties;
  namePropertiesForContact__firstProperties = v8;

}

- (void)setAttributesFromContactView:(id)a3 runningInContactsAppOniPad:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (!a4)
  {
    objc_msgSend(v14, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  objc_msgSend(v14, "separatorColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v14, "separatorColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactView setSeparatorColor:](self, "setSeparatorColor:", v8);

  }
  objc_msgSend(v14, "sectionBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactView setSectionBackgroundColor:](self, "setSectionBackgroundColor:", v9);

  objc_msgSend(v14, "selectedCellBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactView setSelectedCellBackgroundColor:](self, "setSelectedCellBackgroundColor:", v10);

  objc_msgSend(v14, "labelTextAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactView setLabelTextAttributes:](self, "setLabelTextAttributes:", v11);

  objc_msgSend(v14, "valueTextAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactView setValueTextAttributes:](self, "setValueTextAttributes:", v12);

  objc_msgSend(v14, "actionTextAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactView setActionTextAttributes:](self, "setActionTextAttributes:", v13);

}

- (UIEdgeInsets)separatorInsetForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MaxX;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MinX;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  UIEdgeInsets result;

  v4 = a3;
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutFrame");
  objc_msgSend(v5, "convertRect:toView:", v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v31.origin.x = v9;
  v31.origin.y = v11;
  v31.size.width = v13;
  v31.size.height = v15;
  MinX = CGRectGetMinX(v31);
  objc_msgSend(v4, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v32.origin.x = v17;
  v32.origin.y = v19;
  v32.size.width = v21;
  v32.size.height = v23;
  MaxX = CGRectGetMaxX(v32);
  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  v25 = MaxX - CGRectGetMaxX(v33);
  if (-[CNContactView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    v26 = v25;
  else
    v26 = MinX;
  v27 = 0.0;
  v28 = 0.0;
  v29 = 0.0;
  result.right = v29;
  result.bottom = v28;
  result.left = v26;
  result.top = v27;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CNContactView;
  -[CNContactView touchesBegan:withEvent:](&v11, sel_touchesBegan_withEvent_, v6, v7);
  -[CNContactView firstResponder](self, "firstResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CNContactView superview](self, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "touchesBegan:withEvent:", v6, v7);

  }
}

- (void)setCustomHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_customHeaderView, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (BOOL)isCellsLayoutCachingEnabled
{
  return self->_cellsLayoutCachingEnabled;
}

- (void)setCellsLayoutCachingEnabled:(BOOL)a3
{
  self->_cellsLayoutCachingEnabled = a3;
}

- (UIColor)selectedCellBackgroundColor
{
  return self->_selectedCellBackgroundColor;
}

- (void)setIsSiri:(BOOL)a3
{
  self->_isSiri = a3;
}

- (BOOL)needsUpdateVisibleCells
{
  return self->_needsUpdateVisibleCells;
}

- (void)setNeedsUpdateVisibleCells:(BOOL)a3
{
  self->_needsUpdateVisibleCells = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTextAttributes, 0);
  objc_storeStrong((id *)&self->_valueTextAttributes, 0);
  objc_storeStrong((id *)&self->_labelTextAttributes, 0);
  objc_storeStrong((id *)&self->_selectedCellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_customHeaderView, 0);
}

+ (id)cellIdentifierForSplitActions
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForDropdownMenuActions
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForPropertyPlaceholder
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForFaceTimeGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForLinkedCardsGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForLinkedCardsEditingGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForLinkedCardsPlaceholderGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForGroupMembershipGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForGroupMembershipEditingGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForGroupMembershipPlaceholderGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForStaticIdentityGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForStaticIdentityEditingGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForStaticIdentityPlaceholderGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForContactContainerEditingGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForGameCenterGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForCardNamePickingGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForSNaPGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForMeCardSharedProfileGroup
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForSharedProfileBanner
{
  return (id)objc_msgSend(a1, "cellIdentifierForClass:", objc_opt_class());
}

+ (id)cellIdentifierForEditingPropertyItem:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96668]);

  if (v5)
  {
    objc_opt_class();
    v6 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "shouldShowLanguageLabel");
    v9 = objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "cellIdentifierForClass:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend(v3, "property");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellIdentifierForEditingProperty:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  return v12;
}

+ (id)cellIdentifierForEditingProperty:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  char v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967C0]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C968A0]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967F0]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967B0]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("birthdays")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96690]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96868]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96740]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96680]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96888]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96840]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96800]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966A0]) & 1) == 0)
  {
    objc_msgSend(a1, "nameProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if ((v9 & 1) == 0)
      objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96860]);
  }
  v5 = objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "cellIdentifierForClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (Class)classForCellIdentifier:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

+ (id)defaultCardProperties
{
  if (defaultCardProperties_onceToken != -1)
    dispatch_once(&defaultCardProperties_onceToken, &__block_literal_global_113);
  return (id)defaultCardProperties_properties;
}

+ (id)optionalCardProperties
{
  if (optionalCardProperties_onceToken != -1)
    dispatch_once(&optionalCardProperties_onceToken, &__block_literal_global_114_13634);
  return (id)optionalCardProperties_properties;
}

+ (id)allImageProperties
{
  if (allImageProperties_onceToken != -1)
    dispatch_once(&allImageProperties_onceToken, &__block_literal_global_115);
  return (id)allImageProperties_properties;
}

void __35__CNContactView_allImageProperties__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96890];
  v5[0] = *MEMORY[0x1E0C96708];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0C96710];
  v5[2] = *MEMORY[0x1E0C966C8];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0C96688];
  v5[4] = *MEMORY[0x1E0C96728];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E0C96778];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)allImageProperties_properties;
  allImageProperties_properties = v3;

}

void __39__CNContactView_optionalCardProperties__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96690];
  v5[0] = CFSTR("birthdays");
  v5[1] = v0;
  v1 = *MEMORY[0x1E0C96868];
  v5[2] = *MEMORY[0x1E0C96840];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0C967B0];
  v5[4] = *MEMORY[0x1E0C96740];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)optionalCardProperties_properties;
  optionalCardProperties_properties = v3;

}

void __38__CNContactView_defaultCardProperties__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966A8];
  v4[0] = *MEMORY[0x1E0C967C0];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0C967F0];
  v4[2] = *MEMORY[0x1E0C968A0];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)defaultCardProperties_properties;
  defaultCardProperties_properties = v2;

}

void __42__CNContactView_namePropertiesForContact___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[17];

  v10[16] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966C0];
  v10[0] = *MEMORY[0x1E0C96790];
  v10[1] = v0;
  v1 = *MEMORY[0x1E0C96828];
  v10[2] = *MEMORY[0x1E0C967D0];
  v10[3] = v1;
  v2 = *MEMORY[0x1E0C966D0];
  v10[4] = *MEMORY[0x1E0C96820];
  v10[5] = v2;
  v3 = *MEMORY[0x1E0C96830];
  v10[6] = *MEMORY[0x1E0C967D8];
  v10[7] = v3;
  v4 = *MEMORY[0x1E0C967E0];
  v10[8] = *MEMORY[0x1E0C96780];
  v10[9] = v4;
  v5 = *MEMORY[0x1E0C967A0];
  v10[10] = *MEMORY[0x1E0C96798];
  v10[11] = v5;
  v6 = *MEMORY[0x1E0C96698];
  v10[12] = *MEMORY[0x1E0C96758];
  v10[13] = v6;
  v7 = *MEMORY[0x1E0C967E8];
  v10[14] = *MEMORY[0x1E0C967B8];
  v10[15] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 16);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)namePropertiesForContact__lastProperties;
  namePropertiesForContact__lastProperties = v8;

}

@end
