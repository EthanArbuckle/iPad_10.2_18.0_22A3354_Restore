@implementation SUUILockupItemCollectionViewCell

- (SUUILockupItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUILockupItemCollectionViewCell *v3;
  SUUILockupItemCellLayout *v4;
  SUUILockupItemCellLayout *layout;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUILockupItemCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[SUUILockupItemCellLayout initWithCollectionViewCell:]([SUUILockupItemCellLayout alloc], "initWithCollectionViewCell:", v3);
    layout = v3->_layout;
    v3->_layout = v4;

  }
  return v3;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUILockupItemCellLayout *layout;
  void *v9;
  SUUILockupItemCellLayout *v10;
  void *v11;
  SUUILockupItemCellLayout *v12;
  void *v13;
  SUUILockupItemCellLayout *v14;
  void *v15;
  SUUILockupItemCellLayout *v16;
  float v17;
  double v18;
  SUUILockupItemCellLayout *v19;
  void *v20;
  SUUILockupItemCellLayout *v21;
  void *v22;
  void *v23;
  void *v24;
  SUUIItemOffer *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  layout = self->_layout;
  objc_msgSend(v6, "artistName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemCellLayout setArtistName:](layout, "setArtistName:", v9);

  v10 = self->_layout;
  objc_msgSend(v6, "categoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemCellLayout setCategoryString:](v10, "setCategoryString:", v11);

  v12 = self->_layout;
  SUUILockupItemCountString(v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemCellLayout setItemCountString:](v12, "setItemCountString:", v13);

  -[SUUILockupItemCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", objc_msgSend(v6, "numberOfUserRatings"));
  v14 = self->_layout;
  objc_msgSend(v6, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemCellLayout setTitle:](v14, "setTitle:", v15);

  v16 = self->_layout;
  objc_msgSend(v6, "userRating");
  *(float *)&v18 = v17 / 5.0;
  -[SUUILockupItemCellLayout setUserRating:](v16, "setUserRating:", v18);
  v19 = self->_layout;
  objc_msgSend(v6, "editorialBadge");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemCellLayout setEditorialBadgeString:](v19, "setEditorialBadgeString:", v20);

  if (objc_msgSend(v6, "itemKind") == 12)
  {
    v21 = self->_layout;
    objc_msgSend(v6, "primaryItemOffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemCellLayout setItemOffer:](v21, "setItemOffer:", v22);

    -[SUUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUniversal:", SUUIItemDeviceFamilyIsUniversal(objc_msgSend(v6, "deviceFamilies")));

    if (objc_msgSend(v6, "hasInAppPurchases"))
    {
      objc_msgSend(v7, "valueForConfigurationKey:", CFSTR("inappnote"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    -[SUUIItemCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", v24);
  }
  else
  {
    if (v6 && !configureForItem_clientContext__sViewOffer_1)
    {
      v25 = [SUUIItemOffer alloc];
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:", CFSTR("VIEW_BUTTON"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("VIEW_BUTTON"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SUUIItemOffer initWithButtonText:](v25, "initWithButtonText:", v26);
      v28 = (void *)configureForItem_clientContext__sViewOffer_1;
      configureForItem_clientContext__sViewOffer_1 = v27;

    }
    -[SUUIItemCellLayout setItemOffer:](self->_layout, "setItemOffer:");
    -[SUUIItemCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", 0);
    -[SUUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUniversal:", 0);
  }

  v29.receiver = self;
  v29.super_class = (Class)SUUILockupItemCollectionViewCell;
  -[SUUIItemCollectionViewCell configureForItem:clientContext:](&v29, sel_configureForItem_clientContext_, v6, v7);

}

- (SUUILockupItemCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
