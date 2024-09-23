@implementation MPVolumeSettingsController

- (MPVolumeSettingsController)initWithAudioCategory:(id)a3
{
  id v5;
  MPVolumeSettingsController *v6;
  MPVolumeSettingsController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPVolumeSettingsController;
  v6 = -[MPVolumeSettingsController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audioCategory, a3);
    objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_previousWindow, v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__keyWindowDidChange_, *MEMORY[0x1E0DC5608], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeSettingsController;
  -[MPVolumeSettingsController dealloc](&v4, sel_dealloc);
}

- (void)presentAlertControllerInWindow:(id)a3
{
  UIWindow **p_hostingWindow;
  id v5;

  p_hostingWindow = &self->_hostingWindow;
  v5 = a3;
  objc_storeWeak((id *)p_hostingWindow, v5);
  objc_msgSend(v5, "setRootViewController:", self);
  objc_msgSend(v5, "makeKeyAndVisible");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  UIAlertController *v5;
  UIAlertController *alertController;
  MPVolumeViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  UIAlertController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPVolumeSettingsController;
  -[MPVolumeSettingsController viewDidAppear:](&v16, sel_viewDidAppear_);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v5 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alertController = self->_alertController;
  self->_alertController = v5;

  v7 = objc_alloc_init(MPVolumeViewController);
  -[MPVolumeViewController volumeView](v7, "volumeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_routeButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeTarget:action:forControlEvents:", v8, 0, 64);

  objc_msgSend(v8, "_routeButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__flip, 64);

  -[UIAlertController setContentViewController:](self->_alertController, "setContentViewController:", v7);
  v11 = self->_alertController;
  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, &__block_literal_global_7119);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v11, "addAction:", v15);

  -[MPVolumeSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alertController, v3, 0);
}

- (void)dismissAlertController
{
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostingWindow);
  v3 = objc_loadWeakRetained((id *)&self->_previousWindow);
  objc_msgSend(WeakRetained, "resignKeyWindow");
  objc_msgSend(v3, "makeKeyAndVisible");

}

- (void)_keyWindowDidChange:(id)a3
{
  UIWindow **p_previousWindow;
  id WeakRetained;
  id v6;
  char isKindOfClass;
  id obj;

  objc_msgSend(a3, "object");
  obj = (id)objc_claimAutoreleasedReturnValue();
  p_previousWindow = &self->_previousWindow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousWindow);
  if (WeakRetained == obj)
  {

  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_hostingWindow);
    if (v6 == obj)
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        objc_storeWeak((id *)p_previousWindow, obj);
    }
  }

}

- (void)_flip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPAVRoutingViewController *v7;

  v7 = -[MPAVRoutingViewController initWithStyle:]([MPAVRoutingViewController alloc], "initWithStyle:", 2);
  -[MPAVRoutingViewController view](v7, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[MPAVRoutingViewController _tableView](v7, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[UIAlertController setContentViewController:](self->_alertController, "setContentViewController:", v7);
}

- (UIWindow)hostingWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_hostingWindow);
}

- (void)setHostingWindow:(id)a3
{
  objc_storeWeak((id *)&self->_hostingWindow, a3);
}

- (UIWindow)previousWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_previousWindow);
}

- (void)setPreviousWindow:(id)a3
{
  objc_storeWeak((id *)&self->_previousWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousWindow);
  objc_destroyWeak((id *)&self->_hostingWindow);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
}

@end
