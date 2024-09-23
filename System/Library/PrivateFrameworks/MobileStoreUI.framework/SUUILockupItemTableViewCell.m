@implementation SUUILockupItemTableViewCell

- (SUUILockupItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUILockupItemTableViewCell *v4;
  SUUILockupItemCellLayout *v5;
  SUUILockupItemCellLayout *layout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUILockupItemTableViewCell;
  v4 = -[SUUITableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = -[SUUILockupItemCellLayout initWithTableViewCell:]([SUUILockupItemCellLayout alloc], "initWithTableViewCell:", v4);
    layout = v4->_layout;
    v4->_layout = v5;

  }
  return v4;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5
{
  SUUILockupItemCellLayout *layout;
  id v9;
  id v10;
  void *v11;
  SUUILockupItemCellLayout *v12;
  void *v13;
  SUUILockupItemCellLayout *v14;
  void *v15;
  SUUILockupItemCellLayout *v16;
  void *v17;
  SUUILockupItemCellLayout *v18;
  objc_super v19;

  layout = self->_layout;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "categoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemCellLayout setCategoryString:](layout, "setCategoryString:", v11);

  v12 = self->_layout;
  SUUILockupItemCountString(v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemCellLayout setItemCountString:](v12, "setItemCountString:", v13);

  v14 = self->_layout;
  objc_msgSend(v10, "primaryItemOffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemCellLayout setItemOffer:](v14, "setItemOffer:", v15);

  -[SUUILockupItemCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", objc_msgSend(v10, "numberOfUserRatings"));
  v16 = self->_layout;
  objc_msgSend(v10, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupItemCellLayout setTitle:](v16, "setTitle:", v17);

  v18 = self->_layout;
  objc_msgSend(v10, "userRating");
  -[SUUILockupItemCellLayout setUserRating:](v18, "setUserRating:");
  v19.receiver = self;
  v19.super_class = (Class)SUUILockupItemTableViewCell;
  -[SUUIItemTableViewCell configureForItem:clientContext:rowIndex:](&v19, sel_configureForItem_clientContext_rowIndex_, v10, v9, a5);

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
