@implementation BookmarksTableViewCellLayoutManager

+ (id)sharedManager
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedManager_sharedManager;
  if (!sharedManager_sharedManager)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedManager_sharedManager;
    sharedManager_sharedManager = (uint64_t)v4;

    v3 = (void *)sharedManager_sharedManager;
  }
  return v3;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
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
  objc_super v22;
  CGRect result;

  v5 = a5;
  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BookmarksTableViewCellLayoutManager;
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](&v22, sel_textRectForCell_rowWidth_forSizing_, v8, v5, a4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (!-[UITableViewCellLayoutManager accessoryShouldAppearForCell:](self, "accessoryShouldAppearForCell:", v8))
  {
    objc_msgSend(v8, "separatorInset");
    v14 = v14 - v17;
  }

  v18 = v10;
  v19 = v12;
  v20 = v14;
  v21 = v16;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect result;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BookmarksTableViewCellLayoutManager;
  -[UITableViewCellLayoutManager accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v18, sel_accessoryStartingRectForCell_forNewEditingState_showingDeleteConfirmation_, v8, v6, v5);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    objc_msgSend(v8, "separatorInset");
    x = x - v13;
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect result;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BookmarksTableViewCellLayoutManager;
  -[UITableViewCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v18, sel_accessoryEndingRectForCell_forNewEditingState_showingDeleteConfirmation_, v8, v6, v5);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    objc_msgSend(v8, "separatorInset");
    x = x - v13;
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (int64_t)_numberOfLinesForCurrentContentSize
{
  NSString *v2;
  _BOOL4 IsAccessibilityCategory;

  -[BookmarksTableViewCellLayoutManager currentContentSizeCategory](self, "currentContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  if (IsAccessibilityCategory)
    return 2;
  else
    return 1;
}

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4;
  char v5;
  double v6;
  double v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double MaxX;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGFloat v30;
  double v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BookmarksTableViewCellLayoutManager;
  -[UITableViewCellLayoutManager layoutSubviewsOfCell:](&v32, sel_layoutSubviewsOfCell_, v4);
  v5 = objc_msgSend(v4, "_shouldReverseLayoutDirection");
  objc_msgSend(v4, "separatorInset");
  v7 = v6;
  -[BookmarksTableViewCellLayoutManager currentContentSizeCategory](self, "currentContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory)
    v7 = 20.0;
  objc_msgSend(v4, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    MaxX = CGRectGetMaxX(v33);

    _SFRoundFloatToPixels();
    v20 = fmin(MaxX - (v7 - v19 - v14) - v14, MaxX + -8.0);
  }
  else
  {
    _SFRoundFloatToPixels();
    v20 = fmax(v7 - v21 - v14, 8.0);
  }
  objc_msgSend(v10, "setFrame:", v20, v12, v14, v16);
  objc_msgSend(v4, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", -[BookmarksTableViewCellLayoutManager _numberOfLinesForCurrentContentSize](self, "_numberOfLinesForCurrentContentSize"));
  objc_msgSend(v22, "frame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v30 = CGRectGetMaxX(v34) - v7 - v26;

    objc_msgSend(v4, "frame");
    -[BookmarksTableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v4, 0, CGRectGetWidth(v35));
    v31 = fmin(v26, CGRectGetMaxX(v36) - v30);
    v7 = v30 + v26 - v31;
  }
  else
  {
    objc_msgSend(v4, "frame");
    -[BookmarksTableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v4, 0, CGRectGetWidth(v37));
    v31 = fmin(v26, CGRectGetMaxX(v38) - v7);
  }
  objc_msgSend(v22, "setFrame:", v7, v24, v31, v28);

}

- (NSString)currentContentSizeCategory
{
  return self->_currentContentSizeCategory;
}

- (void)setCurrentContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_currentContentSizeCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContentSizeCategory, 0);
}

@end
