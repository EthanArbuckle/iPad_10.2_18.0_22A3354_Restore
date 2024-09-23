@implementation DDFallbackController

- (DDFallbackController)initWithWindow:(id)a3 interactionDelegate:(id)a4
{
  id v6;
  id v7;
  DDFallbackController *v8;
  id interactionDelegate;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DDFallbackController;
  v7 = a3;
  v8 = -[DDFallbackController init](&v11, sel_init);
  objc_storeWeak((id *)&v8->_baseWindow, v7);

  interactionDelegate = v8->_interactionDelegate;
  v8->_interactionDelegate = v6;

  return v8;
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(v3, "setBackgroundColor:", 0);
  -[DDFallbackController setView:](self, "setView:", v3);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  UIWindow *v13;
  UIWindow *ourWindow;
  UIWindow *v15;
  id WeakRetained;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  objc_super v28;

  v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E0CEAC18];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = (UIWindow *)objc_msgSend(v11, "initWithFrame:");
  ourWindow = self->_ourWindow;
  self->_ourWindow = v13;

  v15 = self->_ourWindow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_baseWindow);
  objc_msgSend(WeakRetained, "windowLevel");
  -[UIWindow setWindowLevel:](v15, "setWindowLevel:", v17 + 1.0);

  -[UIWindow setOpaque:](v15, "setOpaque:", 0);
  -[UIWindow setBackgroundColor:](v15, "setBackgroundColor:", 0);
  -[UIWindow bounds](v15, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[DDFallbackController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  -[DDFallbackController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow addSubview:](v15, "addSubview:", v27);

  -[UIWindow makeKeyAndOrderFront:](v15, "makeKeyAndOrderFront:", 0);
  -[UIWindow beginDisablingInterfaceAutorotation](v15, "beginDisablingInterfaceAutorotation");
  v28.receiver = self;
  v28.super_class = (Class)DDFallbackController;
  -[DDFallbackController presentViewController:animated:completion:](&v28, sel_presentViewController_animated_completion_, v10, v5, v9);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  DDFallbackController *v8;
  id v9;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __65__DDFallbackController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_1E4258540;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)DDFallbackController;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[DDFallbackController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

void __65__DDFallbackController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 976);
  objc_msgSend(v6, "setDelegate:", 0);
  objc_msgSend(v6, "orderOut:", 0);
  objc_msgSend(v6, "endDisablingInterfaceAutorotation");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 976);
  *(_QWORD *)(v3 + 976) = 0;

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interactionDelegate, 0);
  objc_storeStrong((id *)&self->_ourWindow, 0);
  objc_destroyWeak((id *)&self->_baseWindow);
}

@end
