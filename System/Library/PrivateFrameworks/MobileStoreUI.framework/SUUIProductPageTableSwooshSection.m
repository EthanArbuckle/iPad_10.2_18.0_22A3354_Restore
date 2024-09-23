@implementation SUUIProductPageTableSwooshSection

- (SUUIProductPageTableSwooshSection)initWithItems:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  SUUIProductPageTableSwooshSection *v8;
  SUUIItemList *v9;
  SUUISwooshPageComponent *v10;
  SUUISwooshPageComponent *swooshComponent;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIProductPageTableSwooshSection;
  v8 = -[SUUIProductPageTableSwooshSection init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(SUUIItemList);
    -[SUUIItemList setItems:](v9, "setItems:", v6);
    -[SUUIItemList setTitle:](v9, "setTitle:", v7);
    v10 = -[SUUISwooshPageComponent initWithItemList:]([SUUISwooshPageComponent alloc], "initWithItemList:", v9);
    swooshComponent = v8->_swooshComponent;
    v8->_swooshComponent = v10;

  }
  return v8;
}

- (SUUIProductPageTableSwooshSection)initWithLockups:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  SUUIProductPageTableSwooshSection *v8;
  SUUISwooshPageComponent *v9;
  SUUISwooshPageComponent *swooshComponent;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIProductPageTableSwooshSection;
  v8 = -[SUUIProductPageTableSwooshSection init](&v12, sel_init);
  if (v8)
  {
    v9 = -[SUUISwooshPageComponent initWithLockups:swooshType:title:]([SUUISwooshPageComponent alloc], "initWithLockups:swooshType:title:", v6, 0, v7);
    swooshComponent = v8->_swooshComponent;
    v8->_swooshComponent = v9;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", 0);
  -[SUUILockupSwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageTableSwooshSection;
  -[SUUIProductPageTableSwooshSection dealloc](&v3, sel_dealloc);
}

- (SUUIColorScheme)colorScheme
{
  void *v2;
  void *v3;

  -[SUUIProductPageTableSwooshSection _swooshViewController](self, "_swooshViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUIColorScheme *)v3;
}

- (void)setColorScheme:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUUIProductPageTableSwooshSection _swooshViewController](self, "_swooshViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorScheme:", v4);

}

- (id)headerViewForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (!self->_missingItemLoader
    && -[SUUISwooshPageComponent isMissingItemData](self->_swooshComponent, "isMissingItemData", a3))
  {
    -[SUUIProductPageTableSwooshSection _missingItemLoader](self, "_missingItemLoader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadItemsForPageComponent:startIndex:reason:", self->_swooshComponent, 0, 1);

  }
  -[SUUIProductPageTableSwooshSection _swooshViewController](self, "_swooshViewController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v6;
  SUUILockupSwooshViewController *swooshViewController;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "count"))
  {
    v6 = -[SUUISwooshPageComponent _updateLockupItemsWithItems:](self->_swooshComponent, "_updateLockupItemsWithItems:", v10);
    swooshViewController = self->_swooshViewController;
    -[SUUISwooshPageComponent lockups](self->_swooshComponent, "lockups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupSwooshViewController setLockups:](swooshViewController, "setLockups:", v8);

    -[SUUIProductPageTableSwooshSection _artworkLoader](self, "_artworkLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadImagesForNextPageWithReason:", 0);

  }
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  void *v6;
  void (**actionBlock)(id, void *);
  void *v8;
  id v9;

  if (self->_actionBlock)
  {
    objc_msgSend(a3, "lockups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    actionBlock = (void (**)(id, void *))self->_actionBlock;
    objc_msgSend(v9, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    actionBlock[2](actionBlock, v8);

  }
}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[SUUIProductPageTableSwooshSection _artworkLoader](self, "_artworkLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lockups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v12 = v7;
    v13 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v7, "cachedImageForItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v7, "loadImageForItem:reason:", v10, 1);
    v12 = v7;
    v13 = v10;
LABEL_5:
    objc_msgSend(v12, "placeholderImageForItem:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_artworkLoader
{
  SUUILockupSwooshArtworkLoader *artworkLoader;
  SUUILockupSwooshArtworkLoader *v4;
  void *v5;
  void *v6;
  SUUILockupSwooshArtworkLoader *v7;
  SUUILockupSwooshArtworkLoader *v8;

  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    v4 = [SUUILockupSwooshArtworkLoader alloc];
    -[SUUIProductPageTableSwooshSection resourceLoader](self, "resourceLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageTableSwooshSection _swooshViewController](self, "_swooshViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SUUILockupSwooshArtworkLoader initWithArtworkLoader:swoosh:](v4, "initWithArtworkLoader:swoosh:", v5, v6);
    v8 = self->_artworkLoader;
    self->_artworkLoader = v7;

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (id)_missingItemLoader
{
  SUUIMissingItemLoader *missingItemLoader;
  SUUIMissingItemLoader *v4;
  void *v5;
  SUUIMissingItemLoader *v6;
  SUUIMissingItemLoader *v7;

  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    v4 = [SUUIMissingItemLoader alloc];
    -[SUUIProductPageTableSwooshSection resourceLoader](self, "resourceLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIMissingItemLoader initWithResourceLoader:](v4, "initWithResourceLoader:", v5);
    v7 = self->_missingItemLoader;
    self->_missingItemLoader = v6;

    -[SUUIMissingItemLoader setDelegate:](self->_missingItemLoader, "setDelegate:", self);
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (id)_swooshViewController
{
  SUUILockupSwooshViewController *swooshViewController;
  SUUILockupSwooshViewController *v4;
  SUUILockupSwooshViewController *v5;
  SUUILockupSwooshViewController *v6;
  void *v7;
  SUUILockupSwooshViewController *v8;
  void *v9;
  void *v10;

  swooshViewController = self->_swooshViewController;
  if (!swooshViewController)
  {
    v4 = -[SUUILockupSwooshViewController initWithSwoosh:]([SUUILockupSwooshViewController alloc], "initWithSwoosh:", self->_swooshComponent);
    v5 = self->_swooshViewController;
    self->_swooshViewController = v4;

    v6 = self->_swooshViewController;
    -[SUUIProductPageTableSection clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUILockupSwooshViewController setClientContext:](v6, "setClientContext:", v7);

    -[SUUILockupSwooshViewController setDelegate:](self->_swooshViewController, "setDelegate:", self);
    v8 = self->_swooshViewController;
    -[SUUILockupSwooshViewController artworkContext](v8, "artworkContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconConsumer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageSize");
    -[SUUILockupSwooshViewController _setExpectedImageSize:](v8, "_setExpectedImageSize:");

    swooshViewController = self->_swooshViewController;
  }
  return swooshViewController;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SUUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_swooshComponent, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
