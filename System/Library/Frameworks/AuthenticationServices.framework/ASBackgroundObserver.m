@implementation ASBackgroundObserver

- (ASBackgroundObserver)initWithViewController:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  ASBackgroundObserver *v8;
  uint64_t v9;
  id block;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = -[ASBackgroundObserver init](self, "init");
  objc_storeWeak((id *)&v8->_viewController, v7);

  v9 = MEMORY[0x212BBEFEC](v6);
  block = v8->_block;
  v8->_block = (id)v9;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__sceneDidEnterBackground_, *MEMORY[0x24BEBE6F0], 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__hostDidEnterBackground_, CFSTR("_UIViewServiceHostDidEnterBackgroundNotification"), 0);

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASBackgroundObserver;
  -[ASBackgroundObserver dealloc](&v4, sel_dealloc);
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_msgSend(v9, "object"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v7 == v8))
    (*((void (**)(void))self->_block + 2))();

}

- (void)_hostDidEnterBackground:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  if (WeakRetained != v10)
  {
    do
    {
      objc_msgSend(WeakRetained, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(WeakRetained, "parentViewController");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(WeakRetained, "presentingViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_8;
        objc_msgSend(WeakRetained, "presentingViewController");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (id)v7;

      WeakRetained = v9;
    }
    while (v9 != v10);
  }
  (*((void (**)(void))self->_block + 2))();
  WeakRetained = v10;
LABEL_8:

}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
