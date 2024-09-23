@implementation SUUIEditorialLockupCellLayout

+ (double)editorialWidthForCellWidth:(double)a3 lockupStyle:(SUUILockupStyle *)a4
{
  double v7;
  double v8;

  if (!SUUILockupLayoutStyleIsHorizontal(a4->layoutStyle))
  {
    v7 = SUUILockupImageSizeForLockupSize(a4->artworkSize, 12);
    objc_msgSend(a1, "_imagePaddingForArtworkSize:", a4->artworkSize);
    return a3 - (v7 + v8) + -15.0;
  }
  return a3;
}

- (void)applyEditorialLayout:(id)a3 withOrientation:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "bodyTextLayoutForOrientation:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "linkLayoutForOrientation:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "titleTextLayoutForOrientation:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 || v7 || v8)
  {
    -[SUUIEditorialLockupCellLayout _editorialContainerView](self, "_editorialContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 0);

  }
  else
  {
    -[UIView setHidden:](self->_editorialContainerView, "setHidden:", 1);
  }
  -[SUUIEditorialLockupCellLayout _editorialCellLayout](self, "_editorialCellLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applyEditorialLayout:withOrientation:expanded:", v13, a4, 1);

  objc_msgSend(v13, "layoutHeightForOrientation:expanded:", a4, 1);
  self->_editorialHeight = v12;
  -[SUUICellLayout setNeedsLayout](self, "setNeedsLayout");

}

- (SUUILockupItemCellLayout)lockupCellLayout
{
  void *v2;
  void *v3;

  -[SUUIEditorialLockupCellLayout _lockupView](self, "_lockupView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUILockupItemCellLayout *)v3;
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *offerNoticeTextColor;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "primaryTextColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  offerNoticeTextColor = self->_offerNoticeTextColor;
  self->_offerNoticeTextColor = v5;

  -[SUUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_offerNoticeTextColor)
  {
    objc_msgSend(v7, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

  }
  -[SUUIEditorialLockupCellLayout _editorialCellLayout](self, "_editorialCellLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColoringWithColorScheme:", v4);

  -[SUUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColoringWithColorScheme:", v4);

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    -[SUUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  _BOOL4 v4;
  SUUILockupItemCellLayout *lockupLayout;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SUUILockupItemCellLayout *v10;
  void *v11;
  SUUILockupItemCellLayout *v12;
  void *v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;
  objc_super v19;

  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[SUUILockupItemCellLayout setLayoutStyle:](self->_lockupLayout, "setLayoutStyle:");
    v4 = -[SUUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial");
    lockupLayout = self->_lockupLayout;
    if (v4)
    {
      -[SUUIItemCellLayout itemOffer](self->_lockupLayout, "itemOffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19.receiver = self;
      v19.super_class = (Class)SUUIEditorialLockupCellLayout;
      -[SUUIItemCellLayout setItemOffer:](&v19, sel_setItemOffer_, v6);

      -[SUUIItemCellLayout itemOfferNoticeString](self->_lockupLayout, "itemOfferNoticeString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18.receiver = self;
      v18.super_class = (Class)SUUIEditorialLockupCellLayout;
      -[SUUIItemCellLayout setItemOfferNoticeString:](&v18, sel_setItemOfferNoticeString_, v7);

      -[SUUIItemCellLayout itemState](self->_lockupLayout, "itemState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17.receiver = self;
      v17.super_class = (Class)SUUIEditorialLockupCellLayout;
      -[SUUIItemCellLayout setItemState:](&v17, sel_setItemState_, v8);

      -[SUUIItemCellLayout setItemOffer:](self->_lockupLayout, "setItemOffer:", 0);
      -[SUUIItemCellLayout setItemOfferNoticeString:](self->_lockupLayout, "setItemOfferNoticeString:", 0);
      -[SUUIItemCellLayout setItemState:](self->_lockupLayout, "setItemState:", 0);
    }
    else
    {
      -[SUUIEditorialLockupCellLayout itemOffer](self, "itemOffer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIItemCellLayout setItemOffer:](lockupLayout, "setItemOffer:", v9);

      v10 = self->_lockupLayout;
      -[SUUIEditorialLockupCellLayout itemOfferNoticeString](self, "itemOfferNoticeString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIItemCellLayout setItemOfferNoticeString:](v10, "setItemOfferNoticeString:", v11);

      v12 = self->_lockupLayout;
      -[SUUIEditorialLockupCellLayout itemState](self, "itemState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIItemCellLayout setItemState:](v12, "setItemState:", v13);

      v16.receiver = self;
      v16.super_class = (Class)SUUIEditorialLockupCellLayout;
      -[SUUIItemCellLayout setItemOffer:](&v16, sel_setItemOffer_, 0);
      v15.receiver = self;
      v15.super_class = (Class)SUUIEditorialLockupCellLayout;
      -[SUUIItemCellLayout setItemOfferNoticeString:](&v15, sel_setItemOfferNoticeString_, 0);
      v14.receiver = self;
      v14.super_class = (Class)SUUIEditorialLockupCellLayout;
      -[SUUIItemCellLayout setItemState:](&v14, sel_setItemState_, 0);
    }
    -[SUUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    -[SUUILockupItemCellLayout setVisibleFields:](self->_lockupLayout, "setVisibleFields:");
    -[SUUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (SUUITextBoxView)textBoxView
{
  void *v2;
  void *v3;

  -[SUUIEditorialLockupCellLayout _editorialCellLayout](self, "_editorialCellLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textBoxView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUITextBoxView *)v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets *p_contentInsets;
  double v9;
  double v10;
  void *v11;
  double left;
  CGFloat v13;
  CGFloat v14;
  double v15;
  void *v16;
  double v17;
  double MaxY;
  double v19;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  double top;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  void *v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  -[SUUICellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  p_contentInsets = &self->_contentInsets;
  v9 = v7 - self->_contentInsets.bottom;
  v10 = v5 - self->_contentInsets.right;
  if (SUUILockupLayoutStyleIsHorizontal(self->_layoutStyle))
  {
    -[SUUIEditorialLockupCellLayout _editorialContainerView](self, "_editorialContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    left = self->_contentInsets.left;
    v13 = p_contentInsets->top + -3.0;
    v14 = self->_editorialHeight + 17.0;
    v15 = v10 - left;
    v49 = v11;
    objc_msgSend(v11, "setFrame:", left, v13, v10 - left, v14);
    -[SUUIEditorialLockupCellLayout _editorialCellLayout](self, "_editorialCellLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutSubviews");

    v17 = self->_contentInsets.left;
    v50.origin.x = left;
    v50.origin.y = v13;
    v50.size.width = v10 - left;
    v50.size.height = v14;
    MaxY = CGRectGetMaxY(v50);
    v19 = v9 - self->_contentInsets.bottom - MaxY;
    -[SUUIEditorialLockupCellLayout _lockupView](self, "_lockupView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v17, MaxY, v15, v19);
  }
  else
  {
    -[SUUIEditorialLockupCellLayout _lockupView](self, "_lockupView");
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v21 = -[SUUILockupItemCellLayout lockupSize](self->_lockupLayout, "lockupSize");
    v22 = SUUILockupImageSizeForLockupSize(v21, 12);
    top = p_contentInsets->top;
    v23 = self->_contentInsets.left;
    v25 = v9 - p_contentInsets->top;
    objc_msgSend((id)objc_opt_class(), "_imagePaddingForArtworkSize:", v21);
    v27 = v22 + v26;
    objc_msgSend(v49, "setFrame:", v23, top, v27, v25);
    -[SUUIEditorialLockupCellLayout _editorialContainerView](self, "_editorialContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51.origin.x = v23;
    v51.origin.y = top;
    v51.size.width = v27;
    v51.size.height = v25;
    v28 = CGRectGetMaxX(v51) + 15.0;
    v29 = p_contentInsets->top + -3.0;
    v30 = self->_editorialHeight + 17.0;
    v31 = v10 - v28;
    objc_msgSend(v20, "setFrame:", v28, v29, v31, v30);
    -[SUUIEditorialLockupCellLayout _editorialCellLayout](self, "_editorialCellLayout");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layoutSubviews");

    -[SUUIItemCellLayout itemOfferButton](self, "itemOfferButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUUIEditorialLockupCellLayout _isItemOfferButtonHidden](self, "_isItemOfferButtonHidden"))
    {
      objc_msgSend(v33, "setHidden:", 1);
      objc_msgSend(v34, "setHidden:", 1);
    }
    else if (v33)
    {
      objc_msgSend(v33, "frame");
      v36 = v35;
      v38 = v37;
      v52.origin.x = v28;
      v52.origin.y = v29;
      v52.size.width = v31;
      v52.size.height = v30;
      v39 = CGRectGetMaxY(v52) + 0.0;
      objc_msgSend(v33, "setHidden:", 0);
      objc_msgSend(v34, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "length");

      if (v41)
      {
        if (v34)
        {
          objc_msgSend(v34, "sizeThatFits:", v36 + 10.0, 1.79769313e308);
          v43 = v42;
          v45 = v44;
          *(float *)&v42 = (v36 - v42) * 0.5;
          v46 = v28 + floorf(*(float *)&v42);
          v53.origin.x = v28;
          v53.origin.y = v39;
          v53.size.width = v36;
          v53.size.height = v38;
          v47 = CGRectGetMaxY(v53) + 3.0;
          objc_msgSend(v34, "setHidden:", 0);
          objc_msgSend(v34, "setFrame:", v46, v47, v43, v45);
          if (self->_offerNoticeTextColor)
          {
            objc_msgSend(v34, "setTextColor:");
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setTextColor:", v48);

          }
        }
      }
      else
      {
        objc_msgSend(v34, "setHidden:", 1);
      }
      objc_msgSend(v33, "setFrame:", v28, v39, v36, v38);
    }

  }
}

- (void)setBackgroundColor:(id)a3
{
  SUUIEditorialCellLayout *editorialCellLayout;
  id v5;
  objc_super v6;

  editorialCellLayout = self->_editorialCellLayout;
  v5 = a3;
  -[SUUIEditorialCellLayout setBackgroundColor:](editorialCellLayout, "setBackgroundColor:", v5);
  -[UIView setBackgroundColor:](self->_editorialContainerView, "setBackgroundColor:", v5);
  -[SUUICellLayoutView setBackgroundColor:](self->_lockupView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  -[SUUIItemCellLayout setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (id)iconImage
{
  return -[SUUIItemCellLayout iconImage](self->_lockupLayout, "iconImage");
}

- (id)iconImageView
{
  return -[SUUIItemCellLayout iconImageView](self->_lockupLayout, "iconImageView");
}

- (BOOL)isIconImageHidden
{
  return -[SUUIItemCellLayout isIconImageHidden](self->_lockupLayout, "isIconImageHidden");
}

- (id)itemOffer
{
  void *v3;
  objc_super v5;

  if (-[SUUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIEditorialLockupCellLayout;
    -[SUUIItemCellLayout itemOffer](&v5, sel_itemOffer);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIItemCellLayout itemOffer](self->_lockupLayout, "itemOffer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)itemOfferNoticeString
{
  void *v3;
  objc_super v5;

  if (-[SUUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIEditorialLockupCellLayout;
    -[SUUIItemCellLayout itemOfferNoticeString](&v5, sel_itemOfferNoticeString);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIItemCellLayout itemOfferNoticeString](self->_lockupLayout, "itemOfferNoticeString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)itemState
{
  void *v3;
  objc_super v5;

  if (SUUILockupLayoutStyleIsHorizontal(self->_layoutStyle))
  {
    -[SUUIItemCellLayout itemState](self->_lockupLayout, "itemState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIEditorialLockupCellLayout;
    -[SUUIItemCellLayout itemState](&v5, sel_itemState);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)layoutForItemOfferChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  -[SUUIItemCellLayout itemOfferButton](self, "itemOfferButton");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v18, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  v8 = v7;
  v10 = v9;
  -[SUUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && (objc_msgSend(v11, "isHidden") & 1) == 0)
  {
    objc_msgSend(v12, "frame");
    v14 = v13;
    objc_msgSend(v12, "sizeThatFits:", v8 + 10.0, 1.79769313e308);
    v16 = v15;
    *(float *)&v15 = (v8 - v15) * 0.5;
    objc_msgSend(v12, "setFrame:", v4 + floorf(*(float *)&v15), v14, v16, v17);
  }
  objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);

}

- (void)setClientContext:(id)a3
{
  SUUILockupItemCellLayout *lockupLayout;
  id v5;
  objc_super v6;

  lockupLayout = self->_lockupLayout;
  v5 = a3;
  -[SUUILockupItemCellLayout setClientContext:](lockupLayout, "setClientContext:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  -[SUUICellLayout setClientContext:](&v6, sel_setClientContext_, v5);

}

- (void)setIconImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconImage:", v4);

}

- (void)setIconImageHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SUUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconImageHidden:", v3);

}

- (void)setItemOffer:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[SUUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIEditorialLockupCellLayout;
    -[SUUIItemCellLayout setItemOffer:](&v6, sel_setItemOffer_, v4);
  }
  else
  {
    -[SUUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItemOffer:", v4);

  }
}

- (void)setItemOfferButtonAppearance:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[SUUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemOfferButtonAppearance:", v4);

  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  -[SUUIItemCellLayout setItemOfferButtonAppearance:](&v6, sel_setItemOfferButtonAppearance_, v4);

}

- (void)setItemOfferNoticeString:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[SUUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIEditorialLockupCellLayout;
    -[SUUIItemCellLayout setItemOfferNoticeString:](&v6, sel_setItemOfferNoticeString_, v4);
  }
  else
  {
    -[SUUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItemOfferNoticeString:", v4);

  }
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  if (-[SUUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v8.receiver = self;
    v8.super_class = (Class)SUUIEditorialLockupCellLayout;
    -[SUUIItemCellLayout setItemState:animated:](&v8, sel_setItemState_animated_, v6, v4);
  }
  else
  {
    -[SUUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setItemState:animated:", v6, v4);

  }
}

- (void)setRestricted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SUUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRestricted:", v3);

  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  -[SUUIItemCellLayout setRestricted:](&v6, sel_setRestricted_, v3);
}

- (id)_editorialCellLayout
{
  SUUIEditorialCellLayout *editorialCellLayout;
  SUUIEditorialCellLayout *v4;
  void *v5;
  SUUIEditorialCellLayout *v6;
  SUUIEditorialCellLayout *v7;
  SUUIEditorialCellLayout *v8;
  void *v9;
  void *v10;

  editorialCellLayout = self->_editorialCellLayout;
  if (!editorialCellLayout)
  {
    v4 = [SUUIEditorialCellLayout alloc];
    -[SUUIEditorialLockupCellLayout _editorialContainerView](self, "_editorialContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIEditorialCellLayout initWithParentView:](v4, "initWithParentView:", v5);
    v7 = self->_editorialCellLayout;
    self->_editorialCellLayout = v6;

    v8 = self->_editorialCellLayout;
    -[SUUICellLayout parentCellView](self, "parentCellView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIEditorialCellLayout setBackgroundColor:](v8, "setBackgroundColor:", v10);

    -[SUUIEditorialCellLayout setContentInset:](self->_editorialCellLayout, "setContentInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
    editorialCellLayout = self->_editorialCellLayout;
  }
  return editorialCellLayout;
}

- (id)_editorialContainerView
{
  UIView *editorialContainerView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;

  editorialContainerView = self->_editorialContainerView;
  if (!editorialContainerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    v5 = self->_editorialContainerView;
    self->_editorialContainerView = v4;

    v6 = self->_editorialContainerView;
    -[SUUICellLayout parentCellView](self, "parentCellView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v8);

    -[SUUICellLayout contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_editorialContainerView);

    editorialContainerView = self->_editorialContainerView;
  }
  return editorialContainerView;
}

+ (double)_imagePaddingForArtworkSize:(int64_t)a3
{
  double result;

  result = 10.0;
  if ((unint64_t)(a3 - 3) < 3)
    return 15.0;
  return result;
}

- (BOOL)_isItemOfferButtonHidden
{
  BOOL v3;
  void *v4;
  objc_super v6;

  if (!-[SUUIItemCellLayout displaysItemOfferButton](self, "displaysItemOfferButton")
    || (-[SUUIEditorialLockupCellLayout visibleFields](self, "visibleFields") & 4) == 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIEditorialLockupCellLayout;
  -[SUUIItemCellLayout itemOffer](&v6, sel_itemOffer);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = -[SUUIItemCellLayout isRestricted](self, "isRestricted");
  else
    v3 = 1;

  return v3;
}

- (id)_lockupView
{
  SUUICellLayoutView *lockupView;
  SUUICellLayoutView *v4;
  SUUICellLayoutView *v5;
  SUUILockupItemCellLayout *v6;
  SUUILockupItemCellLayout *lockupLayout;
  SUUILockupItemCellLayout *v8;
  void *v9;
  SUUICellLayoutView *v10;
  void *v11;
  void *v12;
  void *v13;

  lockupView = self->_lockupView;
  if (!lockupView)
  {
    v4 = objc_alloc_init(SUUICellLayoutView);
    v5 = self->_lockupView;
    self->_lockupView = v4;

    v6 = -[SUUILockupItemCellLayout initWithParentView:]([SUUILockupItemCellLayout alloc], "initWithParentView:", self->_lockupView);
    lockupLayout = self->_lockupLayout;
    self->_lockupLayout = v6;

    v8 = self->_lockupLayout;
    -[SUUICellLayout clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupItemCellLayout setClientContext:](v8, "setClientContext:", v9);

    -[SUUILockupItemCellLayout setLayoutStyle:](self->_lockupLayout, "setLayoutStyle:", self->_layoutStyle);
    -[SUUILockupItemCellLayout setVisibleFields:](self->_lockupLayout, "setVisibleFields:", self->_visibleFields);
    -[SUUICellLayoutView setLayout:](self->_lockupView, "setLayout:", self->_lockupLayout);
    v10 = self->_lockupView;
    -[SUUICellLayout parentCellView](self, "parentCellView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICellLayoutView setBackgroundColor:](v10, "setBackgroundColor:", v12);

    -[SUUICellLayout contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_lockupView);

    lockupView = self->_lockupView;
  }
  return lockupView;
}

- (BOOL)_showsItemOfferUnderEditorial
{
  return self->_layoutStyle == 3;
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

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBoxView, 0);
  objc_storeStrong((id *)&self->_offerNoticeTextColor, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_lockupLayout, 0);
  objc_storeStrong((id *)&self->_editorialContainerView, 0);
  objc_storeStrong((id *)&self->_editorialCellLayout, 0);
}

@end
