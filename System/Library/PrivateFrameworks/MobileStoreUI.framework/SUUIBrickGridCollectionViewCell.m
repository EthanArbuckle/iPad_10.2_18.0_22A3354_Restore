@implementation SUUIBrickGridCollectionViewCell

- (void)applyEditorialLayout:(id)a3 orientation:(int64_t)a4
{
  id v6;
  UIView *editorialContainerView;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  void *v12;
  SUUIEditorialCellLayout *v13;
  SUUIEditorialCellLayout *editorialCellLayout;
  id v15;

  v6 = a3;
  editorialContainerView = self->_editorialContainerView;
  v15 = v6;
  if (v6)
  {
    if (!editorialContainerView)
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      v9 = self->_editorialContainerView;
      self->_editorialContainerView = v8;

      v10 = self->_editorialContainerView;
      -[SUUIBrickGridCollectionViewCell backgroundColor](self, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

      -[SUUIBrickGridCollectionViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_editorialContainerView);

      -[SUUIBrickGridCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
    if (!self->_editorialCellLayout)
    {
      v13 = -[SUUIEditorialCellLayout initWithParentView:]([SUUIEditorialCellLayout alloc], "initWithParentView:", self->_editorialContainerView);
      editorialCellLayout = self->_editorialCellLayout;
      self->_editorialCellLayout = v13;

      -[SUUIEditorialCellLayout setContentInset:](self->_editorialCellLayout, "setContentInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
    }
    -[UIView setHidden:](self->_editorialContainerView, "setHidden:", 0);
  }
  else
  {
    -[UIView setHidden:](editorialContainerView, "setHidden:", 1);
  }
  -[SUUIEditorialCellLayout applyEditorialLayout:withOrientation:expanded:](self->_editorialCellLayout, "applyEditorialLayout:withOrientation:expanded:", v15, a4, 1);

}

- (UIImage)brickImage
{
  return -[UIImageView image](self->_brickImageView, "image");
}

- (void)setAccessibilityLabel:(id)a3
{
  NSString *v4;
  NSString *accessibilityLabel;
  id v6;

  if (self->_accessibilityLabel != a3)
  {
    v6 = a3;
    v4 = (NSString *)objc_msgSend(v6, "copy");
    accessibilityLabel = self->_accessibilityLabel;
    self->_accessibilityLabel = v4;

    -[UIImageView setAccessibilityLabel:](self->_brickImageView, "setAccessibilityLabel:", v6);
  }
}

- (void)setBrickImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *brickImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  id v13;

  v13 = a3;
  -[SUUIBrickGridCollectionViewCell brickImage](self, "brickImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v4 != v13)
  {
    brickImageView = self->_brickImageView;
    if (v13)
    {
      if (!brickImageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v8 = self->_brickImageView;
        self->_brickImageView = v7;

        -[UIImageView setAccessibilityLabel:](self->_brickImageView, "setAccessibilityLabel:", self->_accessibilityLabel);
        v9 = self->_brickImageView;
        -[SUUIBrickGridCollectionViewCell backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SUUIBrickGridCollectionViewCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", self->_brickImageView);

        -[SUUIBrickGridCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
        brickImageView = self->_brickImageView;
      }
      -[UIImageView setImage:](brickImageView, "setImage:", v13);
      -[UIImageView sizeToFit](self->_brickImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](brickImageView, "removeFromSuperview");
      v12 = self->_brickImageView;
      self->_brickImageView = 0;

    }
    v5 = v13;
  }

}

- (void)setColoringWithColorScheme:(id)a3
{
  -[SUUIEditorialCellLayout setColoringWithColorScheme:](self->_editorialCellLayout, "setColoringWithColorScheme:", a3);
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[SUUIBrickGridCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double top;
  UIImageView *brickImageView;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double left;
  UIView *editorialContainerView;
  objc_super v16;
  CGRect v17;

  v16.receiver = self;
  v16.super_class = (Class)SUUIBrickGridCollectionViewCell;
  -[SUUIBrickGridCollectionViewCell layoutSubviews](&v16, sel_layoutSubviews);
  -[SUUIBrickGridCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  top = self->_contentInsets.top;
  brickImageView = self->_brickImageView;
  if (brickImageView)
  {
    -[UIImageView frame](brickImageView, "frame");
    v11 = v10;
    v13 = v12;
    left = self->_contentInsets.left;
    -[UIImageView setFrame:](self->_brickImageView, "setFrame:", left, top);
    v17.origin.x = left;
    v17.origin.y = top;
    v17.size.width = v11;
    v17.size.height = v13;
    top = CGRectGetMaxY(v17);
  }
  editorialContainerView = self->_editorialContainerView;
  if (editorialContainerView)
  {
    -[UIView frame](editorialContainerView, "frame");
    -[UIView setFrame:](self->_editorialContainerView, "setFrame:", self->_contentInsets.left, top + 10.0, v5 - self->_contentInsets.right - self->_contentInsets.left, v7 - self->_contentInsets.bottom - (top + 10.0));
    -[SUUIEditorialCellLayout layoutSubviews](self->_editorialCellLayout, "layoutSubviews");
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *brickImageView;
  id v5;
  objc_super v6;

  brickImageView = self->_brickImageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](brickImageView, "setBackgroundColor:", v5);
  -[SUUIEditorialCellLayout setBackgroundColor:](self->_editorialCellLayout, "setBackgroundColor:", v5);
  -[UIView setBackgroundColor:](self->_editorialContainerView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIBrickGridCollectionViewCell;
  -[SUUIBrickGridCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialContainerView, 0);
  objc_storeStrong((id *)&self->_editorialCellLayout, 0);
  objc_storeStrong((id *)&self->_brickImageView, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end
