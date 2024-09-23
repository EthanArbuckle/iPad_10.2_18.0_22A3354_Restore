@implementation _SFFolderPickerTableViewCellLayoutManager

+ (double)indentationWidth
{
  return 15.0;
}

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[_SFFolderPickerTableViewCellLayoutManager _layoutMarginsForCell:](self, "_layoutMarginsForCell:", v4);
  objc_msgSend(v4, "setLayoutMargins:");
  v5.receiver = self;
  v5.super_class = (Class)_SFFolderPickerTableViewCellLayoutManager;
  -[UITableViewCellLayoutManagerValue1 layoutSubviewsOfCell:](&v5, sel_layoutSubviewsOfCell_, v4);

}

- (UIEdgeInsets)_layoutMarginsForCell:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", a3);
  v4 = v3 + 16.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 16.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
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
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect result;

  v5 = a5;
  v30.receiver = self;
  v30.super_class = (Class)_SFFolderPickerTableViewCellLayoutManager;
  v8 = a3;
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](&v30, sel_textRectForCell_rowWidth_forSizing_, v8, v5, a4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v29 = v15;
  v16 = *MEMORY[0x1E0DC49E8];
  v17 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v18 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v20 = objc_msgSend(v8, "_shouldReverseLayoutDirection");
  -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", v8);
  v22 = v21;

  if (v20)
    v23 = v17;
  else
    v23 = -v22;
  if (v20)
    v24 = -v22;
  else
    v24 = v18;
  v25 = v10 + v23;
  v26 = v16 + v12;
  v27 = v14 - (v23 + v24);
  v28 = v29 - (v16 + v19);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

@end
