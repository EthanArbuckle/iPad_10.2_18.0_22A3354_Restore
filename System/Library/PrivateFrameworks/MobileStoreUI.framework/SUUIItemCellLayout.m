@implementation SUUIItemCellLayout

- (void)dealloc
{
  objc_super v3;

  -[SUUIItemOfferButton removeTarget:action:forControlEvents:](self->_itemOfferButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[SUUIItemOfferButton setDelegate:](self->_itemOfferButton, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIItemCellLayout;
  -[SUUIItemCellLayout dealloc](&v3, sel_dealloc);
}

- (BOOL)displaysItemOfferButton
{
  return !self->_hidesItemOfferButton;
}

- (UIImage)iconImage
{
  return (UIImage *)-[SUUICellImageView image](self->_iconImageView, "image");
}

- (NSString)itemOfferNoticeString
{
  return -[UILabel text](self->_itemOfferNoticeLabel, "text");
}

- (void)resetLayout
{
  SUUICellImageView *iconImageView;
  objc_super v4;

  -[SUUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", 1);
  -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", 1);
  -[SUUICellImageView removeFromSuperview](self->_iconImageView, "removeFromSuperview");
  iconImageView = self->_iconImageView;
  self->_iconImageView = 0;

  v4.receiver = self;
  v4.super_class = (Class)SUUIItemCellLayout;
  -[SUUICellLayout resetLayout](&v4, sel_resetLayout);
}

- (void)setDisplaysItemOfferButton:(BOOL)a3
{
  if (self->_hidesItemOfferButton == a3)
  {
    self->_hidesItemOfferButton = !a3;
    -[SUUIItemCellLayout _reloadItemOfferButton:](self, "_reloadItemOfferButton:", 0);
  }
}

- (void)setIconImage:(id)a3
{
  id v4;
  void *v5;
  SUUICellImageView *iconImageView;
  SUUICellImageView *v7;
  SUUICellImageView *v8;
  SUUICellImageView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SUUICellImageView *v21;
  id v22;

  v22 = a3;
  -[SUUICellImageView image](self->_iconImageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v22;
  if (v4 != v22)
  {
    iconImageView = self->_iconImageView;
    if (!v22)
    {
      -[SUUICellImageView removeFromSuperview](iconImageView, "removeFromSuperview");
      v21 = self->_iconImageView;
      self->_iconImageView = 0;

      goto LABEL_11;
    }
    if (!iconImageView)
    {
      v7 = objc_alloc_init(SUUICellImageView);
      v8 = self->_iconImageView;
      self->_iconImageView = v7;

      v9 = self->_iconImageView;
      -[SUUICellLayout parentCellView](self, "parentCellView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUICellImageView setBackgroundColor:](v9, "setBackgroundColor:", v11);

      -[SUUICellImageView setHidden:](self->_iconImageView, "setHidden:", -[SUUIItemCellLayout isIconImageHidden](self, "isIconImageHidden"));
      -[SUUICellLayout contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertSubview:atIndex:", self->_iconImageView, 0);

      iconImageView = self->_iconImageView;
    }
    -[SUUICellImageView image](iconImageView, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v14;
    v17 = v16;

    -[SUUICellImageView setImage:](self->_iconImageView, "setImage:", v22);
    objc_msgSend(v22, "size");
    v5 = v22;
    if (v15 != v19 || v17 != v18)
    {
      -[SUUICellImageView sizeToFit](self->_iconImageView, "sizeToFit");
LABEL_11:
      -[SUUICellLayout setNeedsLayout](self, "setNeedsLayout");
      v5 = v22;
    }
  }

}

- (void)setIconImageHidden:(BOOL)a3
{
  if (self->_iconImageHidden != a3)
  {
    self->_iconImageHidden = a3;
    -[SUUICellImageView setHidden:](self->_iconImageView, "setHidden:");
  }
}

- (void)setItemOffer:(id)a3
{
  SUUIItemOffer *v5;

  v5 = (SUUIItemOffer *)a3;
  if (self->_itemOffer == v5)
  {
    -[SUUIItemCellLayout _reloadItemOfferVisibility](self, "_reloadItemOfferVisibility");
  }
  else
  {
    objc_storeStrong((id *)&self->_itemOffer, a3);
    -[SUUIItemCellLayout _reloadItemOfferButton:](self, "_reloadItemOfferButton:", 0);
  }

}

- (void)setItemOfferButtonAppearance:(id)a3
{
  SUUIItemOfferButtonAppearance *v5;
  SUUIItemOfferButtonAppearance *v6;

  v5 = (SUUIItemOfferButtonAppearance *)a3;
  if (self->_itemOfferButtonAppearance != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_itemOfferButtonAppearance, a3);
    -[SUUIItemOfferButton setColoringWithAppearance:](self->_itemOfferButton, "setColoringWithAppearance:", self->_itemOfferButtonAppearance);
    v5 = v6;
  }

}

- (void)setItemOfferNoticeString:(id)a3
{
  id v4;
  void *v5;
  UILabel *itemOfferNoticeLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[UILabel text](self->_itemOfferNoticeLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v15;
  if (v4 != v15)
  {
    itemOfferNoticeLabel = self->_itemOfferNoticeLabel;
    if (v15)
    {
      if (!itemOfferNoticeLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_itemOfferNoticeLabel;
        self->_itemOfferNoticeLabel = v7;

        v9 = self->_itemOfferNoticeLabel;
        -[SUUICellLayout parentCellView](self, "parentCellView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "backgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v11);

        v12 = self->_itemOfferNoticeLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 7.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v12, "setFont:", v13);

        -[UILabel setNumberOfLines:](self->_itemOfferNoticeLabel, "setNumberOfLines:", 3);
        -[UILabel setTextAlignment:](self->_itemOfferNoticeLabel, "setTextAlignment:", 1);
        -[SUUICellLayout contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_itemOfferNoticeLabel);

        itemOfferNoticeLabel = self->_itemOfferNoticeLabel;
      }
      -[UILabel setText:](itemOfferNoticeLabel, "setText:", v15);
      -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", -[SUUIItemCellLayout _canShowItemOfferNotice](self, "_canShowItemOfferNotice") ^ 1);
      -[SUUICellLayout setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UILabel setHidden:](itemOfferNoticeLabel, "setHidden:", 1);
      -[UILabel setText:](self->_itemOfferNoticeLabel, "setText:", 0);
    }
    v5 = v15;
  }

}

- (void)setItemState:(id)a3
{
  -[SUUIItemCellLayout setItemState:animated:](self, "setItemState:animated:", a3, 0);
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  SUUIItemState *v6;
  SUUIItemState *itemState;

  if (self->_itemState == a3)
  {
    -[SUUIItemCellLayout _reloadItemOfferVisibility](self, "_reloadItemOfferVisibility");
  }
  else
  {
    v5 = a4;
    v6 = (SUUIItemState *)objc_msgSend(a3, "copy");
    itemState = self->_itemState;
    self->_itemState = v6;

    -[SUUIItemCellLayout _reloadItemOfferButton:](self, "_reloadItemOfferButton:", v5);
  }
}

- (void)setRestricted:(BOOL)a3
{
  if (self->_restricted != a3)
  {
    self->_restricted = a3;
    -[SUUIItemCellLayout _reloadItemOfferButton:](self, "_reloadItemOfferButton:", 0);
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  -[SUUIItemOfferButton removeButtonStateAnimations](self->_itemOfferButton, "removeButtonStateAnimations");
  v3.receiver = self;
  v3.super_class = (Class)SUUIItemCellLayout;
  -[SUUICellLayout prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setBackgroundColor:(id)a3
{
  SUUICellImageView *iconImageView;
  id v5;
  objc_super v6;

  iconImageView = self->_iconImageView;
  v5 = a3;
  -[SUUICellImageView setBackgroundColor:](iconImageView, "setBackgroundColor:", v5);
  -[SUUIItemOfferButton setBackgroundColor:](self->_itemOfferButton, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_itemOfferNoticeLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIItemCellLayout;
  -[SUUICellLayout setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", -[SUUIItemCellLayout _canShowItemOfferNotice](self, "_canShowItemOfferNotice", a3) ^ 1);
  -[SUUIItemCellLayout layoutForItemOfferChange](self, "layoutForItemOfferChange");
}

- (void)_cancelItemOfferConfirmationAction:(id)a3
{
  -[SUUIItemOfferButton setShowingConfirmation:animated:](self->_itemOfferButton, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_itemOfferConfirmAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v10 = 0;
  v11 = 0;
  -[SUUIItemCellLayout _getParentTableView:collectionView:](self, "_getParentTableView:collectionView:", &v11, &v10);
  v4 = v11;
  v5 = v10;
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUUICellLayout parentCellView](self, "parentCellView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemTableView:didConfirmItemOfferForTableViewCell:", v4, v7);

  }
  objc_msgSend(v5, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUUIItemCellLayout _parentCollectionViewCell](self, "_parentCollectionViewCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemCollectionView:didConfirmItemOfferForCell:", v5, v9);

  }
}

- (void)_showItemOfferConfirmationAction:(id)a3
{
  void *v4;

  -[SUUIItemOfferButton superview](self->_itemOfferButton, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", self->_itemOfferButton);

  -[SUUIItemOfferButton setShowingConfirmation:animated:](self->_itemOfferButton, "setShowingConfirmation:animated:", 1, 1);
}

- (BOOL)_canShowItemOfferNotice
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;

  -[UILabel text](self->_itemOfferNoticeLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
LABEL_4:
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = -[SUUIItemCellLayout displaysItemOfferButton](self, "displaysItemOfferButton");
  if (v5)
  {
    if (!-[SUUIItemCellLayout isRestricted](self, "isRestricted"))
    {
      -[SUUIItemCellLayout itemState](self, "itemState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state");

      LOBYTE(v5) = (v7 & 0xFFFFFFFFFFFFFFEFLL) == 0;
      return v5;
    }
    goto LABEL_4;
  }
  return v5;
}

- (void)_getParentTableView:(id *)a3 collectionView:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  -[SUUICellLayout parentCellView](self, "parentCellView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = 0;
        v9 = v7;
      }
      else
      {
        objc_opt_class();
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v8 = v7;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_7;
      }
      v12 = v7;
      v10 = v8;
      v11 = v9;
LABEL_7:
      objc_msgSend(v7, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11 && !v10)
      {
        v7 = v13;
        if (v13)
          continue;
      }
      goto LABEL_12;
    }
  }
  v10 = 0;
  v11 = 0;
  v13 = 0;
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  if (a3)
    *a3 = objc_retainAutorelease(v11);

}

- (id)_parentCollectionViewCell
{
  void *v2;
  uint64_t v3;

  -[SUUICellLayout parentCellView](self, "parentCellView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)_reloadItemOfferButton:(BOOL)a3
{
  _BOOL8 v4;
  SUUIItemOfferButton *itemOfferButton;
  SUUIItemOfferButton *v6;
  SUUIItemOfferButton *v7;
  SUUIItemOfferButton *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  SUUIItemOfferButton *v14;
  SUUIItemOffer *itemOffer;
  void *v16;
  _BOOL4 v17;

  if (!self->_itemOffer
    || self->_hidesItemOfferButton
    || (v4 = a3, -[SUUIItemCellLayout isRestricted](self, "isRestricted")))
  {
    -[SUUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", 1);
  }
  else
  {
    itemOfferButton = self->_itemOfferButton;
    if (!itemOfferButton)
    {
      +[SUUIItemOfferButton itemOfferButtonWithAppearance:](SUUIItemOfferButton, "itemOfferButtonWithAppearance:", self->_itemOfferButtonAppearance);
      v6 = (SUUIItemOfferButton *)objc_claimAutoreleasedReturnValue();
      v7 = self->_itemOfferButton;
      self->_itemOfferButton = v6;

      -[SUUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__cancelItemOfferConfirmationAction_, 0x10000);
      -[SUUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__itemOfferConfirmAction_, 0x20000);
      -[SUUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__showItemOfferConfirmationAction_, 0x40000);
      v8 = self->_itemOfferButton;
      -[SUUICellLayout parentCellView](self, "parentCellView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIItemOfferButton setBackgroundColor:](v8, "setBackgroundColor:", v10);

      LODWORD(v11) = -0.5;
      -[SUUIItemOfferButton setCharge:](self->_itemOfferButton, "setCharge:", v11);
      -[SUUIItemOfferButton setDelegate:](self->_itemOfferButton, "setDelegate:", self);
      -[SUUICellLayout contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_itemOfferButton);

      itemOfferButton = self->_itemOfferButton;
    }
    -[SUUIItemOfferButton setHidden:](itemOfferButton, "setHidden:", 0);
    -[SUUIItemCellLayout itemState](self, "itemState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_itemOfferButton;
    itemOffer = self->_itemOffer;
    -[SUUICellLayout clientContext](self, "clientContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SUUIItemOfferButton setValuesUsingItemOffer:itemState:clientContext:animated:](v14, "setValuesUsingItemOffer:itemState:clientContext:animated:", itemOffer, v13, v16, v4);

    if (v17)
    {
      -[SUUIItemOfferButton sizeToFit](self->_itemOfferButton, "sizeToFit");
      -[SUUICellLayout setNeedsLayout](self, "setNeedsLayout");
    }

  }
  -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", -[SUUIItemCellLayout _canShowItemOfferNotice](self, "_canShowItemOfferNotice") ^ 1);
}

- (void)_reloadItemOfferVisibility
{
  _BOOL8 v3;

  v3 = !self->_itemOffer || self->_hidesItemOfferButton || -[SUUIItemCellLayout isRestricted](self, "isRestricted");
  -[SUUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", v3);
  -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", -[SUUIItemCellLayout _canShowItemOfferNotice](self, "_canShowItemOfferNotice") ^ 1);
}

- (BOOL)_useCloudButtonForItemState:(id)a3
{
  return (objc_msgSend(a3, "state") & 0x2F) == 8;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isIconImageHidden
{
  return self->_iconImageHidden;
}

- (UIView)iconImageView
{
  return &self->_iconImageView->super.super;
}

- (SUUIItemOffer)itemOffer
{
  return self->_itemOffer;
}

- (SUUIItemOfferButton)itemOfferButton
{
  return self->_itemOfferButton;
}

- (SUUIItemOfferButtonAppearance)itemOfferButtonAppearance
{
  return self->_itemOfferButtonAppearance;
}

- (UILabel)itemOfferNoticeLabel
{
  return self->_itemOfferNoticeLabel;
}

- (SUUIItemState)itemState
{
  return self->_itemState;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (UIView)removeControlView
{
  return self->_removeControlView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeControlView, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferNoticeLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferButtonAppearance, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
