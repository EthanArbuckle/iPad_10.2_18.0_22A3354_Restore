@implementation SUUIViewElementSlideshowController

- (SUUIViewElementSlideshowController)initWithShelf:(id)a3 selectedLockup:(id)a4
{
  id v6;
  id v7;
  SUUIViewElementSlideshowController *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *lockups;
  uint64_t v12;
  NSString *title;
  _QWORD v15[4];
  id v16;
  SUUIViewElementSlideshowController *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SUUIViewElementSlideshowController;
  v8 = -[SUUIViewElementSlideshowController init](&v18, sel_init);
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    -[SUUIViewElementSlideshowController setDataConsumers:](v8, "setDataConsumers:", v9);

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    lockups = v8->_lockups;
    v8->_lockups = v10;

    v8->_selectedIndex = 0;
    objc_msgSend(v6, "slideshowTitle");
    v12 = objc_claimAutoreleasedReturnValue();
    title = v8->_title;
    v8->_title = (NSString *)v12;

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67__SUUIViewElementSlideshowController_initWithShelf_selectedLockup___block_invoke;
    v15[3] = &unk_2511F78E0;
    v16 = v7;
    v17 = v8;
    objc_msgSend(v6, "enumerateChildrenUsingBlock:", v15);

  }
  return v8;
}

void __67__SUUIViewElementSlideshowController_initWithShelf_selectedLockup___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SUUIScreenshotDataConsumer *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "elementType") == 66;
  v4 = v11;
  if (v3)
  {
    v5 = v11;
    objc_msgSend(v5, "fullscreenImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstChildForElementType:", 49);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      if (*(id *)(a1 + 32) == v5)
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", v5);
      v9 = -[SUUIStyledImageDataConsumer initWithViewElement:]([SUUIScreenshotDataConsumer alloc], "initWithViewElement:", v6);
      objc_msgSend(v6, "size");
      -[SUUIStyledImageDataConsumer setImageSize:](v9, "setImageSize:");
      objc_msgSend(*(id *)(a1 + 40), "dataConsumers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

    }
    v4 = v11;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SUUISlideshowViewController setDataSource:](self->_padViewController, "setDataSource:", 0);
  -[SUUISlideshowViewController setDelegate:](self->_padViewController, "setDelegate:", 0);
  -[SUUIIPhoneSlideshowViewController setDataSource:](self->_phoneViewController, "setDataSource:", 0);
  -[SUUIIPhoneSlideshowViewController setDelegate:](self->_phoneViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIViewElementSlideshowController;
  -[SUUIViewElementSlideshowController dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfSlideshowItems
{
  return -[NSMutableArray count](self->_lockups, "count");
}

- (void)presentFromParentViewController:(id)a3
{
  SUUIViewElementLayoutContext *layoutContext;
  id v5;
  void *v6;
  SUUISlideshowViewController *v7;
  void *padViewController;
  id *p_padViewController;
  void *v10;
  id v11;

  layoutContext = self->_layoutContext;
  v5 = a3;
  -[SUUIViewElementLayoutContext clientContext](layoutContext, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SUUIUserInterfaceIdiom(v6) == 1)
  {
    v7 = objc_alloc_init(SUUISlideshowViewController);
    p_padViewController = (id *)&self->_padViewController;
    padViewController = self->_padViewController;
  }
  else
  {
    v7 = objc_alloc_init(SUUIIPhoneSlideshowViewController);
    p_padViewController = (id *)&self->_phoneViewController;
    padViewController = self->_phoneViewController;
  }
  *p_padViewController = v7;

  objc_msgSend(*p_padViewController, "setClientContext:", v6);
  objc_msgSend(*p_padViewController, "setDataSource:", self);
  objc_msgSend(*p_padViewController, "setDelegate:", self);
  objc_msgSend(*p_padViewController, "setCurrentIndex:", self->_selectedIndex);
  v11 = *p_padViewController;
  if (self->_title)
    objc_msgSend(v11, "setTitle:");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v11);
  objc_msgSend(v10, "setModalPresentationStyle:", 17);
  objc_msgSend(v5, "presentViewController:animated:completion:", v10, 1, 0);

}

- (int64_t)numberOfItemsInSlideshowViewController:(id)a3
{
  return -[NSMutableArray count](self->_lockups, "count", a3);
}

- (id)slideshowViewController:(id)a3 placeholderImageAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableArray objectAtIndex:](self->_lockups, "objectAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstChildForElementType:", 49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElementLayoutContext requestIdentifierForViewElement:](self->_layoutContext, "requestIdentifierForViewElement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUUIViewElementLayoutContext resourceLoader](self->_layoutContext, "resourceLoader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedResourceForRequestIdentifier:", objc_msgSend(v7, "unsignedIntegerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)slideshowViewController:(id)a3 imageURLAtIndex:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableArray objectAtIndex:](self->_lockups, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullscreenImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)slideshowViewController:(id)a3 dataConsumerAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[SUUIViewElementSlideshowController dataConsumers](self, "dataConsumers", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIViewElementLayoutContext clientContext](self->_layoutContext, "clientContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SUUIUserInterfaceIdiom(v8) != 1)
    objc_msgSend(v7, "setForcesPortrait:", 1);

  return v7;
}

- (void)slideshowViewControllerDidFinish:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SUUIViewElementSlideshowController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "viewElementSlideshowWillDismiss:", self);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (SUUIViewElementSlideshowDelegate)delegate
{
  return (SUUIViewElementSlideshowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIViewElementLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(id)a3
{
  objc_storeStrong((id *)&self->_layoutContext, a3);
}

- (NSMutableArray)dataConsumers
{
  return self->_dataConsumers;
}

- (void)setDataConsumers:(id)a3
{
  objc_storeStrong((id *)&self->_dataConsumers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataConsumers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_phoneViewController, 0);
  objc_storeStrong((id *)&self->_padViewController, 0);
  objc_storeStrong((id *)&self->_lockups, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
