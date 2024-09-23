@implementation NDOAMSUIWebViewWrapperController

- (NDOAMSUIWebViewWrapperController)initWithViewController:(id)a3
{
  id v5;
  NDOAMSUIWebViewWrapperController *v6;
  NDOAMSUIWebViewWrapperController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDOAMSUIWebViewWrapperController;
  v6 = -[NDOAMSUIWebViewWrapperController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewController, a3);

  return v7;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_1(&dword_229EC7000, a1, a3, "dismissing via dealloc", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)loadView
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NDOAMSUIWebViewWrapperController;
  -[AMSUICommonViewController loadView](&v5, sel_loadView);
  -[NDOAMSUIWebViewWrapperController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)NDOAMSUIWebViewWrapperController;
  -[AMSUICommonViewController setChildViewController:](&v4, sel_setChildViewController_, v3);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NDOAMSUIWebViewWrapperController;
  -[NDOAMSUIWebViewWrapperController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[NDOAMSUIWebViewWrapperController viewController](self, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(void);
  objc_super v20;

  v3 = a3;
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NDOAMSUIWebViewWrapperController viewDidDisappear:].cold.4(self);

  _NDOLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[NDOAMSUIWebViewWrapperController viewDidDisappear:].cold.3(self);

  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[NDOAMSUIWebViewWrapperController viewDidDisappear:].cold.2(self);

  if ((-[NDOAMSUIWebViewWrapperController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    -[NDOAMSUIWebViewWrapperController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isBeingDismissed"))
    {

    }
    else
    {
      v9 = -[NDOAMSUIWebViewWrapperController isMovingFromParentViewController](self, "isMovingFromParentViewController");

      if (!v9)
        goto LABEL_15;
    }
  }
  -[NDOAMSUIWebViewWrapperController dismissBlock](self, "dismissBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _NDOLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[NDOAMSUIWebViewWrapperController viewDidDisappear:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    -[NDOAMSUIWebViewWrapperController dismissBlock](self, "dismissBlock");
    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v19[2]();

    -[NDOAMSUIWebViewWrapperController setDismissBlock:](self, "setDismissBlock:", 0);
  }
LABEL_15:
  v20.receiver = self;
  v20.super_class = (Class)NDOAMSUIWebViewWrapperController;
  -[NDOAMSUIWebViewWrapperController viewDidDisappear:](&v20, sel_viewDidDisappear_, v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(void);

  -[NDOAMSUIWebViewWrapperController dismissBlock](self, "dismissBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _NDOLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[NDOAMSUIWebViewWrapperController presentationControllerDidDismiss:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    -[NDOAMSUIWebViewWrapperController dismissBlock](self, "dismissBlock");
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();

    -[NDOAMSUIWebViewWrapperController setDismissBlock:](self, "setDismissBlock:", 0);
  }
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
}

- (void)viewDidDisappear:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_229EC7000, a1, a3, "dismissing from view did disappear", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)viewDidDisappear:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "isMovingFromParentViewController");
  OUTLINED_FUNCTION_0_1(&dword_229EC7000, v1, v2, "dismissal isMovingFromParentViewController %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_2_1();
}

- (void)viewDidDisappear:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "isBeingDismissed");
  OUTLINED_FUNCTION_0_1(&dword_229EC7000, v2, v3, "dismissal navigationController isBeingDismissed %d", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_2_1();
}

- (void)viewDidDisappear:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "isBeingDismissed");
  OUTLINED_FUNCTION_0_1(&dword_229EC7000, v1, v2, "dismissal isBeingDismissed %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_2_1();
}

- (void)presentationControllerDidDismiss:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_229EC7000, a1, a3, "dismissing from presentation controller did dismiss.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
