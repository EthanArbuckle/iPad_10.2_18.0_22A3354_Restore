@implementation PKPaletteTapToRadarRegularExecution

- (void)run
{
  void *v3;
  void *v4;
  PKTextInputDebugRadarViewController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIWindow *v12;
  UIWindow *window;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKPaletteTapToRadarRegularExecution;
  -[PKPaletteTapToRadarCommandExecution run](&v23, "run");
  -[PKPaletteTapToRadarCommandExecution configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugSharpenerLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PKTextInputDebugRadarViewController initWithSharpenerLog:]([PKTextInputDebugRadarViewController alloc], "initWithSharpenerLog:", v4);
  -[PKTextInputDebugRadarViewController setDelegate:](v5, "setDelegate:", self);
  v6 = objc_alloc(MEMORY[0x1E0DC3F98]);
  -[PKPaletteTapToRadarCommandExecution configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UIWindow *)objc_msgSend(v6, "initWithWindowScene:", v11);
  window = self->_window;
  self->_window = v12;

  v14 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v14);

  -[PKPaletteTapToRadarCommandExecution configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentationViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "windowLevel");
  -[UIWindow setWindowLevel:](self->_window, "setWindowLevel:", v19 + -0.1);

  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(v20, "setModalPresentationStyle:", 2);
  objc_msgSend(v20, "presentationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[UIWindow rootViewController](self->_window, "rootViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentViewController:animated:completion:", v20, 1, 0);

}

- (void)_dismiss
{
  UIWindow *window;

  -[UIWindow setHidden:](self->_window, "setHidden:", 1);
  window = self->_window;
  self->_window = 0;

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 2 * (objc_msgSend(a4, "horizontalSizeClass", a3) != 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
