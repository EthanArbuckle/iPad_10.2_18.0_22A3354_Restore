@implementation SUUILockupSwooshCollectionViewCell

- (SUUILockupSwooshCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUILockupSwooshCollectionViewCell *v3;
  SUUILockupSwooshCellLayout *v4;
  SUUILockupSwooshCellLayout *layout;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUILockupSwooshCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[SUUILockupSwooshCellLayout initWithCollectionViewCell:]([SUUILockupSwooshCellLayout alloc], "initWithCollectionViewCell:", v3);
    layout = v3->_layout;
    v3->_layout = v4;

    -[SUUIItemCellLayout setDisplaysItemOfferButton:](v3->_layout, "setDisplaysItemOfferButton:", 0);
  }
  return v3;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUILockupSwooshCellLayout *layout;
  void *v9;
  SUUILockupSwooshCellLayout *v10;
  void *v11;
  SUUILockupSwooshCellLayout *v12;
  void *v13;
  SUUILockupSwooshCellLayout *v14;
  void *v15;
  void *v16;
  void *v17;
  SUUIItemOffer *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  layout = self->_layout;
  objc_msgSend(v6, "artistName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupSwooshCellLayout setArtistName:](layout, "setArtistName:", v9);

  v10 = self->_layout;
  objc_msgSend(v6, "categoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupSwooshCellLayout setCategory:](v10, "setCategory:", v11);

  v12 = self->_layout;
  SUUILockupItemCountString(v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupSwooshCellLayout setItemCountString:](v12, "setItemCountString:", v13);

  v14 = self->_layout;
  objc_msgSend(v6, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILockupSwooshCellLayout setTitle:](v14, "setTitle:", v15);

  objc_msgSend(v6, "primaryItemOffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!SUUIItemKindIsSoftwareKind(objc_msgSend(v6, "itemKind")))
  {
    v17 = (void *)configureForItem_clientContext__sViewOffer_0;
    if (!configureForItem_clientContext__sViewOffer_0)
    {
      v18 = [SUUIItemOffer alloc];
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:", CFSTR("VIEW_BUTTON"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("VIEW_BUTTON"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SUUIItemOffer initWithButtonText:](v18, "initWithButtonText:", v19);
      v21 = (void *)configureForItem_clientContext__sViewOffer_0;
      configureForItem_clientContext__sViewOffer_0 = v20;

      v17 = (void *)configureForItem_clientContext__sViewOffer_0;
    }
    v22 = v17;

    v16 = v22;
  }
  -[SUUILockupSwooshCellLayout setItemOffer:](self->_layout, "setItemOffer:", v16);
  v23.receiver = self;
  v23.super_class = (Class)SUUILockupSwooshCollectionViewCell;
  -[SUUIItemCollectionViewCell configureForItem:clientContext:](&v23, sel_configureForItem_clientContext_, v6, v7);

}

- (SUUILockupSwooshCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
