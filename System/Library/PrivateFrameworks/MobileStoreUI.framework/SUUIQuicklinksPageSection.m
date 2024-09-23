@implementation SUUIQuicklinksPageSection

- (SUUIQuicklinksPageSection)initWithPageComponent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIQuicklinksPageSection;
  return -[SUUIStorePageSection initWithPageComponent:](&v4, sel_initWithPageComponent_, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIQuicklinksViewController setDelegate:](self->_quicklinksViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIQuicklinksPageSection;
  -[SUUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SUUIQuicklinksPageSectionReuseIdentifier"));
  -[SUUIQuicklinksPageSection _quicklinksViewController](self, "_quicklinksViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "willTransitionToSize:withTransitionCoordinator:", 0, v7, v8);

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

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SUUIQuicklinksPageSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIQuicklinksPageSection _quicklinksViewController](self, "_quicklinksViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentChildView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
    objc_msgSend(v7, "setContentChildView:", v9);
  }

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[SUUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[SUUIQuicklinksPageSection _quicklinksViewController](self, "_quicklinksViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  v12 = v7;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)quicklinksViewController:(id)a3 didSelectLink:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  -[SUUIStorePageSection clickEventWithLink:elementName:index:](self, "clickEventWithLink:elementName:index:", v8, *MEMORY[0x24BEB2968], a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v14, "frameForLinkAtIndex:", a5);
    SUUIMetricsSetClickEventPositionWithPoint(v9, v10, v11);
    -[SUUIStorePageSection context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metricsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordEvent:", v9);

  }
  -[SUUIStorePageSection showPageWithLink:](self, "showPageWithLink:", v8);

}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  SUUIQuicklinksViewController *quicklinksViewController;
  id v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  quicklinksViewController = self->_quicklinksViewController;
  v8 = a4;
  -[SUUIQuicklinksViewController willTransitionToSize:withTransitionCoordinator:](quicklinksViewController, "willTransitionToSize:withTransitionCoordinator:", v8, width, height);
  v9.receiver = self;
  v9.super_class = (Class)SUUIQuicklinksPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (id)_quicklinksViewController
{
  SUUIQuicklinksViewController *quicklinksViewController;
  void *v4;
  SUUIQuicklinksViewController *v5;
  SUUIQuicklinksViewController *v6;
  void *v7;
  SUUIQuicklinksViewController *v8;
  void *v9;
  SUUIQuicklinksViewController *v10;
  void *v11;
  SUUIQuicklinksViewController *v12;
  void *v13;
  void *v14;

  quicklinksViewController = self->_quicklinksViewController;
  if (!quicklinksViewController)
  {
    -[SUUIStorePageSection context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(SUUIQuicklinksViewController);
    v6 = self->_quicklinksViewController;
    self->_quicklinksViewController = v5;

    -[SUUIQuicklinksViewController setDelegate:](self->_quicklinksViewController, "setDelegate:", self);
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_quicklinksViewController;
    objc_msgSend(v4, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIQuicklinksViewController setColoringWithColorScheme:](v8, "setColoringWithColorScheme:", v9);

    v10 = self->_quicklinksViewController;
    objc_msgSend(v7, "links");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIQuicklinksViewController setLinks:](v10, "setLinks:", v11);

    v12 = self->_quicklinksViewController;
    objc_msgSend(v7, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIQuicklinksViewController setTitle:](v12, "setTitle:", v13);

    objc_msgSend(v4, "parentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addChildViewController:", self->_quicklinksViewController);

    quicklinksViewController = self->_quicklinksViewController;
  }
  return quicklinksViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quicklinksViewController, 0);
}

@end
