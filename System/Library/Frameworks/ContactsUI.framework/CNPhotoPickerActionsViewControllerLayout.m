@implementation CNPhotoPickerActionsViewControllerLayout

- (CNPhotoPickerActionsViewControllerLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 buttonCount:(int64_t)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  CNPhotoPickerActionsViewControllerLayout *v12;
  CNPhotoPickerActionsViewControllerLayout *v13;
  CNPhotoPickerActionsViewControllerLayout *v14;
  objc_super v16;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)CNPhotoPickerActionsViewControllerLayout;
  v12 = -[CNPhotoPickerActionsViewControllerLayout init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_containerSize.width = width;
    v12->_containerSize.height = height;
    v12->_edgeInsets.top = top;
    v12->_edgeInsets.left = left;
    v12->_edgeInsets.bottom = bottom;
    v12->_edgeInsets.right = right;
    v12->_buttonCount = a5;
    v14 = v12;
  }

  return v13;
}

- (CGRect)actionButtonsViewFrameForButtonCount:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "heightForButtonsViewWithButtonCount:", a3);
  v5 = v4;
  -[CNPhotoPickerActionsViewControllerLayout containerSize](self, "containerSize");
  v7 = v6 + -20.0;
  -[CNPhotoPickerActionsViewControllerLayout containerSize](self, "containerSize");
  v9 = v8;
  -[CNPhotoPickerActionsViewControllerLayout edgeInsets](self, "edgeInsets");
  v11 = v9 - v10 - v5 + -10.0;
  v12 = 10.0;
  v13 = v7;
  v14 = v5;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (CGRect)actionButtonsViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CNPhotoPickerActionsViewControllerLayout actionButtonsViewFrameForButtonCount:](self, "actionButtonsViewFrameForButtonCount:", -[CNPhotoPickerActionsViewControllerLayout buttonCount](self, "buttonCount"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)imageContainerViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  CGRect result;

  -[CNPhotoPickerActionsViewControllerLayout actionButtonsViewFrameForButtonCount:](self, "actionButtonsViewFrameForButtonCount:", +[CNPhotoPickerActionsModel maximumNumberOfButtons](CNPhotoPickerActionsModel, "maximumNumberOfButtons"));
  v4 = v3;
  v6 = v5;
  -[CNPhotoPickerActionsViewControllerLayout containerSize](self, "containerSize");
  v8 = v7;
  -[CNPhotoPickerActionsViewControllerLayout containerSize](self, "containerSize");
  if (v8 <= v9)
  {
    -[CNPhotoPickerActionsViewControllerLayout containerSize](self, "containerSize");
  }
  else
  {
    -[CNPhotoPickerActionsViewControllerLayout containerSize](self, "containerSize");
    v11 = v10 - v6;
    -[CNPhotoPickerActionsViewControllerLayout edgeInsets](self, "edgeInsets");
    v13 = v11 - v12;
    -[CNPhotoPickerActionsViewControllerLayout edgeInsets](self, "edgeInsets");
    v15 = v13 - v14 + -15.0;
  }
  v16 = fmin(v15, 212.0);
  -[CNPhotoPickerActionsViewControllerLayout containerSize](self, "containerSize");
  v18 = floor((v17 - v16) * 0.5);
  v19 = v4 - v4 * 0.5 - v16 * 0.5 + 15.0;
  v20 = v16;
  v21 = v16;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)buttonCount
{
  return self->_buttonCount;
}

+ (double)buttonHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ascender");
  v4 = v3;
  objc_msgSend(v2, "descender");
  v6 = fmax(v4 - v5 + 28.0, 50.0);

  return v6;
}

+ (double)heightForButtonsViewWithButtonCount:(int64_t)a3
{
  double v4;
  double v5;

  v4 = (double)a3;
  objc_msgSend(a1, "buttonHeight");
  return (double)(a3 - 1) * 10.0 + v4 * v5;
}

@end
