@implementation SUUIAccountButtonsSection

- (SUUIAccountButtonsSection)initWithPageComponent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIAccountButtonsSection;
  return -[SUUIStorePageSection initWithPageComponent:](&v4, sel_initWithPageComponent_, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIAccountButtonsViewController setDelegate:](self->_accountButtonsViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIAccountButtonsSection;
  -[SUUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItemViewElement:", v6);

}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ikBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIAccountButtonsSection;
    -[SUUIStorePageSection backgroundColorForIndexPath:](&v13, sel_backgroundColorForIndexPath_, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SUUIAccountButtonsSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIAccountButtonsSection _accountButtonsViewController](self, "_accountButtonsViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentChildView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    -[SUUIAccountButtonsSection backgroundColorForIndexPath:](self, "backgroundColorForIndexPath:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v11);

    objc_msgSend(v7, "setContentChildView:", v9);
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePageWidth");
  v6 = v5;

  -[SUUIAccountButtonsSection _accountButtonsViewController](self, "_accountButtonsViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", v6, 0.0);
  v10 = v9;

  v11 = v6;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SUUIAccountButtonsSection;
  -[SUUIStorePageSection collectionViewWillDisplayCellForItemAtIndexPath:](&v9, sel_collectionViewWillDisplayCellForItemAtIndexPath_, v4);

}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeMetricsImpressionSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endActiveImpressionForViewElement:", v6);

  v9.receiver = self;
  v9.super_class = (Class)SUUIAccountButtonsSection;
  -[SUUIStorePageSection collectionViewDidEndDisplayingCellForItemAtIndexPath:](&v9, sel_collectionViewDidEndDisplayingCellForItemAtIndexPath_, v4);

}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SUUIAccountButtonsSectionReuseIdentifier"));
  v6.receiver = self;
  v6.super_class = (Class)SUUIAccountButtonsSection;
  -[SUUIStorePageSection willAppearInContext:](&v6, sel_willAppearInContext_, v4);

}

- (void)accountButtonsViewControllerDidSignIn:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BEB1EC0]);
  objc_msgSend(v6, "setAccountEventTypeWithEventIdentifier:", 0);
  -[SUUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEvent:", v6);

}

- (void)accountButtonsViewControllerDidSignOut:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BEB1EC0]);
  objc_msgSend(v6, "setAccountEventTypeWithEventIdentifier:", 1);
  -[SUUIStorePageSection context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordEvent:", v6);

}

- (void)accountButtonsViewControllerDidTapECommerceLink:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SUUIStorePageSection pageComponent](self, "pageComponent", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ECommerceLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    SUUIMetricsOpenURL(v4);
  }
  else if (v5)
  {
    objc_msgSend(v5, "firstChildForElementType:", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

  }
}

- (id)_accountButtonsViewController
{
  SUUIAccountButtonsViewController *accountButtonsViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SUUIAccountButtonsViewController *v9;
  SUUIAccountButtonsViewController *v10;
  void *v11;
  void *v12;
  SUUILink *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;

  accountButtonsViewController = self->_accountButtonsViewController;
  if (!accountButtonsViewController)
  {
    -[SUUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(SUUIAccountButtonsViewController);
    v10 = self->_accountButtonsViewController;
    self->_accountButtonsViewController = v9;

    -[SUUIAccountButtonsViewController setClientContext:](self->_accountButtonsViewController, "setClientContext:", v8);
    -[SUUIAccountButtonsViewController setDelegate:](self->_accountButtonsViewController, "setDelegate:", self);
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIAccountButtonsViewController setTermsAndConditionsHidden:](self->_accountButtonsViewController, "setTermsAndConditionsHidden:", objc_msgSend(v11, "hidesTermsAndConditions"));
    objc_msgSend(v6, "firstChildForElementType:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ECommerceLink");
    v13 = (SUUILink *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    if (!v13 && v12)
    {
      objc_msgSend(v12, "buttonText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "length"))
        v13 = -[SUUILink initWithURL:title:targetString:]([SUUILink alloc], "initWithURL:title:targetString:", 0, v15, 0);
      else
        v13 = 0;

    }
    -[SUUIAccountButtonsViewController setECommerceLink:](self->_accountButtonsViewController, "setECommerceLink:", v13);
    objc_msgSend(v8, "valueForConfigurationKey:", CFSTR("mgift"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && (objc_msgSend(v16, "BOOLValue") & 1) == 0)
      -[SUUIAccountButtonsViewController setGiftingHidden:](self->_accountButtonsViewController, "setGiftingHidden:", 1);
    v26 = v8;
    objc_msgSend(v7, "addChildViewController:", self->_accountButtonsViewController);
    v27 = v6;
    if (v6)
    {
      objc_msgSend(v6, "style");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ikColor");
      v19 = v7;
      v20 = v4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "color");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v20;
      v7 = v19;
    }
    else
    {
      objc_msgSend(v4, "colorScheme");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "primaryTextColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.4, 1.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SUUIAccountButtonsViewController view](self->_accountButtonsViewController, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTintColor:", v22);

    accountButtonsViewController = self->_accountButtonsViewController;
  }
  return accountButtonsViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountButtonsViewController, 0);
}

@end
