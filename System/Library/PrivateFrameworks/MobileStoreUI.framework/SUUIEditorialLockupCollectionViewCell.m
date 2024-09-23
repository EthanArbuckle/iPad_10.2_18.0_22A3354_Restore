@implementation SUUIEditorialLockupCollectionViewCell

- (SUUIEditorialLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIEditorialLockupCollectionViewCell *v3;
  SUUIEditorialLockupCellLayout *v4;
  SUUIEditorialLockupCellLayout *layout;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIEditorialLockupCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[SUUICellLayout initWithCollectionViewCell:]([SUUIEditorialLockupCellLayout alloc], "initWithCollectionViewCell:", v3);
    layout = v3->_layout;
    v3->_layout = v4;

  }
  return v3;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  SUUIItemOffer *v15;
  SUUIEditorialLockupCellLayout *layout;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  -[SUUIEditorialLockupCellLayout lockupCellLayout](self->_layout, "lockupCellLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categoryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCategoryString:", v9);

  SUUILockupItemCountString(v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemCountString:", v10);

  objc_msgSend(v8, "setNumberOfUserRatings:", objc_msgSend(v6, "numberOfUserRatings"));
  objc_msgSend(v6, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v11);

  objc_msgSend(v6, "userRating");
  *(float *)&v13 = v12 / 5.0;
  objc_msgSend(v8, "setUserRating:", v13);
  if (!v6)
  {
    -[SUUIEditorialLockupCellLayout setItemOffer:](self->_layout, "setItemOffer:", 0);
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "itemKind") != 12)
  {
    if (!configureForItem_clientContext__sViewOffer)
    {
      v15 = [SUUIItemOffer alloc];
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:", CFSTR("VIEW_BUTTON"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("VIEW_BUTTON"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SUUIItemOffer initWithButtonText:](v15, "initWithButtonText:", v19);
      v21 = (void *)configureForItem_clientContext__sViewOffer;
      configureForItem_clientContext__sViewOffer = v20;

    }
    -[SUUIEditorialLockupCellLayout setItemOffer:](self->_layout, "setItemOffer:");
    -[SUUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUniversal:", 0);

    goto LABEL_14;
  }
  if (objc_msgSend(v6, "hasInAppPurchases"))
  {
    objc_msgSend(v7, "valueForConfigurationKey:", CFSTR("inappnote"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  layout = self->_layout;
  objc_msgSend(v6, "primaryItemOffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIEditorialLockupCellLayout setItemOffer:](layout, "setItemOffer:", v17);

  -[SUUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUniversal:", SUUIItemDeviceFamilyIsUniversal(objc_msgSend(v6, "deviceFamilies")));

LABEL_15:
  -[SUUIEditorialLockupCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", v14);
  v23.receiver = self;
  v23.super_class = (Class)SUUIEditorialLockupCollectionViewCell;
  -[SUUIItemCollectionViewCell configureForItem:clientContext:](&v23, sel_configureForItem_clientContext_, v6, v7);

}

- (SUUIEditorialLockupCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
