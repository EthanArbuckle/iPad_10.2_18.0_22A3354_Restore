@implementation SUUIProductPageActivityViewController

- (SUUIProductPageActivityViewController)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SUUIProductPageActivityViewController *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  -[SUUIProductPageActivityViewController _activityItemsForProductPageItem:clientContext:](self, "_activityItemsForProductPageItem:clientContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageActivityViewController _applicationActivitiesForProductPageItem:clientContext:](self, "_applicationActivitiesForProductPageItem:clientContext:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)SUUIProductPageActivityViewController;
  v11 = -[SUUIProductPageActivityViewController initWithActivityItems:applicationActivities:](&v16, sel_initWithActivityItems_applicationActivities_, v9, v10);
  if (v11)
  {
    v12 = *MEMORY[0x24BDF7478];
    v17[0] = *MEMORY[0x24BDF7468];
    v17[1] = v12;
    v13 = *MEMORY[0x24BDF74D8];
    v17[2] = *MEMORY[0x24BDF74B0];
    v17[3] = v13;
    v17[4] = *MEMORY[0x24BDF74E0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageActivityViewController setExcludedActivityTypes:](v11, "setExcludedActivityTypes:", v14);

    objc_storeStrong((id *)&v11->_clientContext, a4);
  }

  return v11;
}

- (id)_titleForActivity:(id)a3
{
  id v4;
  void *v5;
  SUUIClientContext *clientContext;

  v4 = a3;
  if ((id)*MEMORY[0x24BDF7480] == v4)
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("ACTIVITY_COPY_LINK"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACTIVITY_COPY_LINK"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_activityItemsForProductPageItem:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  SUUIURLActivityItemProvider *v7;
  SUUITextActivityItemProvider *v8;
  SUUIImageActivityItemProvider *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[SUUIURLActivityItemProvider initWithProductPageItem:clientContext:]([SUUIURLActivityItemProvider alloc], "initWithProductPageItem:clientContext:", v6, v5);
  v8 = -[SUUIDeferredActivityItemProvider initWithProductPageItem:clientContext:]([SUUITextActivityItemProvider alloc], "initWithProductPageItem:clientContext:", v6, v5);
  v9 = -[SUUIDeferredActivityItemProvider initWithProductPageItem:clientContext:]([SUUIImageActivityItemProvider alloc], "initWithProductPageItem:clientContext:", v6, v5);

  v12[0] = v8;
  v12[1] = v7;
  v12[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_activityItemsForProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  SUUIURLActivityItemProvider *v7;
  SUUITextActivityItemProvider *v8;
  SUUIImageActivityItemProvider *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[SUUIURLActivityItemProvider initWithProductPageItemProvider:clientContext:]([SUUIURLActivityItemProvider alloc], "initWithProductPageItemProvider:clientContext:", v6, v5);
  v8 = -[SUUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:]([SUUITextActivityItemProvider alloc], "initWithProductPageItemProvider:clientContext:", v6, v5);
  v9 = -[SUUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:]([SUUIImageActivityItemProvider alloc], "initWithProductPageItemProvider:clientContext:", v6, v5);

  v12[0] = v8;
  v12[1] = v7;
  v12[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_applicationActivitiesForProductPageItem:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SUUIAddToWishlistActivity *v15;
  void *v16;
  char v17;
  SUUIGiftActivity *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryItemOffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "price");
  if (v9 > 0.0)
  {
    v10 = objc_msgSend(v5, "itemIdentifier");
    +[SUUIWishlist activeWishlist](SUUIWishlist, "activeWishlist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && (objc_msgSend(v11, "containsItemWithIdentifier:", v10) & 1) == 0)
    {
      +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stateForItemWithIdentifier:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "state") & 0xF) == 0)
      {
        v15 = -[SUUIAddToWishlistActivity initWithItem:clientContext:]([SUUIAddToWishlistActivity alloc], "initWithItem:clientContext:", v5, v6);
        objc_msgSend(v7, "addObject:", v15);

      }
    }
    +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isItemRestrictedWithParentalControlsRank:", objc_msgSend(v5, "parentalControlsRank"));

    if ((v17 & 1) == 0)
    {
      v18 = -[SUUIGiftActivity initWithItem:clientContext:]([SUUIGiftActivity alloc], "initWithItem:clientContext:", v5, v6);
      objc_msgSend(v7, "addObject:", v18);

    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
