@implementation HUCenteredCellUITableView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  _BOOL4 IsEmpty;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  BOOL v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33.receiver = self;
  v33.super_class = (Class)HUCenteredCellUITableView;
  -[HUCenteredCellUITableView layoutSubviews](&v33, sel_layoutSubviews);
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config") & 1) == 0)
  {
    -[HUCenteredCellUITableView rowHeight](self, "rowHeight");
    v4 = v3;
    -[HUCenteredCellUITableView sectionHeaderHeight](self, "sectionHeaderHeight");
    v6 = v4 + v5;
    -[HUCenteredCellUITableView sectionFooterHeight](self, "sectionFooterHeight");
    v8 = v6 + v7;
    -[HUCenteredCellUITableView window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCenteredCellUITableView bounds](self, "bounds");
    objc_msgSend(v9, "convertRect:fromView:", self);
    v36.origin.x = v10;
    v36.origin.y = v11;
    v36.size.width = v12;
    v36.size.height = v13;
    v34 = CGRectIntersection(self->_keyboardFrame, v36);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;

    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    IsEmpty = CGRectIsEmpty(v35);
    v19 = 20.0;
    if (!IsEmpty)
      v19 = height;
    v20 = v8 + v19;
    v21 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v22 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v23 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[HUCenteredCellUITableView bounds](self, "bounds");
    v25 = (v24 - v20) * 0.5;
    v26 = floorf(v25);
    -[HUCenteredCellUITableView contentInset](self, "contentInset");
    if (v21 != v30 || (v27 == v26 ? (v31 = v23 == v29) : (v31 = 0), v31 ? (v32 = v22 == v28) : (v32 = 0), !v32))
      -[HUCenteredCellUITableView setContentInset:](self, "setContentInset:", v26, v21, v22, v23);
  }
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

@end
