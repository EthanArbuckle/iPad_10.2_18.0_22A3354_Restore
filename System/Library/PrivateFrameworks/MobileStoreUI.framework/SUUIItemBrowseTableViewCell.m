@implementation SUUIItemBrowseTableViewCell

- (SUUIItemBrowseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIItemBrowseTableViewCell *v4;
  SUUIItemBrowseCellLayout *v5;
  SUUIItemBrowseCellLayout *layout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIItemBrowseTableViewCell;
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
  SUUIItemBrowseCellLayout *v12;
  void *v13;
  void *v14;
  SUUIItemBrowseCellLayout *v15;
  void *v16;
  SUUIItemBrowseCellLayout *v17;
  float v18;
  void *v19;
  uint64_t v20;
  SUUIItemBrowseCellLayout *v21;
  void *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  layout = self->_layout;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a5 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemBrowseCellLayout setIndexNumberString:](layout, "setIndexNumberString:", v11);

  v12 = self->_layout;
  objc_msgSend(v8, "primaryItemOffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemCellLayout setItemOffer:](v12, "setItemOffer:", v13);

  -[SUUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUniversal:", SUUIItemDeviceFamilyIsUniversal(objc_msgSend(v8, "deviceFamilies")));

  -[SUUIItemBrowseCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", objc_msgSend(v8, "numberOfUserRatings"));
  v15 = self->_layout;
  objc_msgSend(v8, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemBrowseCellLayout setTitle:](v15, "setTitle:", v16);

  v17 = self->_layout;
  objc_msgSend(v8, "userRating");
  -[SUUIItemBrowseCellLayout setUserRating:](v17, "setUserRating:", (float)(v18 / 5.0));
  if (objc_msgSend(v8, "hasInAppPurchases"))
  {
    objc_msgSend(v9, "valueForConfigurationKey:", CFSTR("inappnote"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  -[SUUIItemCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", v19);
  v20 = objc_msgSend(v8, "itemKind");
  v21 = self->_layout;
  if (v20 == 17)
    SUUILockupItemCountString(v8, v9);
  else
    objc_msgSend(v8, "categoryName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemBrowseCellLayout setSubtitle:](v21, "setSubtitle:", v22);

  v23.receiver = self;
  v23.super_class = (Class)SUUIItemBrowseTableViewCell;
  -[SUUIItemTableViewCell configureForItem:clientContext:rowIndex:](&v23, sel_configureForItem_clientContext_rowIndex_, v8, v9, a5);

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
