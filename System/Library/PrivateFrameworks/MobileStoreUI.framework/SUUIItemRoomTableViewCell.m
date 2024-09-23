@implementation SUUIItemRoomTableViewCell

- (SUUIItemRoomTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIItemRoomTableViewCell *v4;
  SUUIItemBrowseCellLayout *v5;
  SUUIItemBrowseCellLayout *layout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIItemRoomTableViewCell;
  v4 = -[SUUITableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = -[SUUIItemBrowseCellLayout initWithTableViewCell:]([SUUIItemBrowseCellLayout alloc], "initWithTableViewCell:", v4);
    layout = v4->_layout;
    v4->_layout = v5;

  }
  return v4;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5
{
  id v8;
  id v9;
  SUUIItemBrowseCellLayout *layout;
  void *v11;
  void *v12;
  SUUIItemBrowseCellLayout *v13;
  void *v14;
  SUUIItemBrowseCellLayout *v15;
  float v16;
  void *v17;
  uint64_t v18;
  SUUIItemBrowseCellLayout *v19;
  void *v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  layout = self->_layout;
  objc_msgSend(v8, "primaryItemOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemCellLayout setItemOffer:](layout, "setItemOffer:", v11);

  -[SUUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUniversal:", SUUIItemDeviceFamilyIsUniversal(objc_msgSend(v8, "deviceFamilies")));

  -[SUUIItemBrowseCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", objc_msgSend(v8, "numberOfUserRatings"));
  v13 = self->_layout;
  objc_msgSend(v8, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemBrowseCellLayout setTitle:](v13, "setTitle:", v14);

  v15 = self->_layout;
  objc_msgSend(v8, "userRating");
  -[SUUIItemBrowseCellLayout setUserRating:](v15, "setUserRating:", (float)(v16 / 5.0));
  if (objc_msgSend(v8, "hasInAppPurchases"))
  {
    objc_msgSend(v9, "valueForConfigurationKey:", CFSTR("inappnote"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  -[SUUIItemCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", v17);
  v18 = objc_msgSend(v8, "itemKind");
  v19 = self->_layout;
  if (v18 == 17)
    SUUILockupItemCountString(v8, v9);
  else
    objc_msgSend(v8, "categoryName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemBrowseCellLayout setSubtitle:](v19, "setSubtitle:", v20);

  v21.receiver = self;
  v21.super_class = (Class)SUUIItemRoomTableViewCell;
  -[SUUIItemTableViewCell configureForItem:clientContext:rowIndex:](&v21, sel_configureForItem_clientContext_rowIndex_, v8, v9, a5);

}

- (SUUIItemBrowseCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
