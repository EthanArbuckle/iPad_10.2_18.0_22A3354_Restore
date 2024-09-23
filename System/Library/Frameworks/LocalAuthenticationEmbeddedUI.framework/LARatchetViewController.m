@implementation LARatchetViewController

- (LARatchetViewController)initWithOptions:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  LARatchetViewController *v8;
  LARatchetViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *internalOptions;
  void *v14;
  uint64_t v15;
  UIPageViewController *pageViewController;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  LARatchetViewController *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)LARatchetViewController;
  v8 = -[LARatchetViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_isInViewHierarchy = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_24FDDD9B8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_presentationContext, v10);

    v11 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v11, "removeObjectForKey:", &unk_24FDDD9B8);
    objc_storeStrong((id *)&v9->_options, v11);
    objc_msgSend(MEMORY[0x24BDDA950], "optionsForRatchetArmOptions:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    internalOptions = v9->_internalOptions;
    v9->_internalOptions = (NSDictionary *)v12;

    v14 = v7;
    if (!v7)
      v14 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v9->_configuration, v14);
    if (!v7)

    objc_storeWeak((id *)&v9->_delegate, 0);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD7D8]), "initWithTransitionStyle:navigationOrientation:options:", 1, 0, 0);
    pageViewController = v9->_pageViewController;
    v9->_pageViewController = (UIPageViewController *)v15;

    LACLogDTO();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v9;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_22FE91000, v17, OS_LOG_TYPE_DEFAULT, "%@ created with options: %@ configuration: %@", buf, 0x20u);
    }

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  LARatchetViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[LARatchetViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopWithReason:invalidate:", CFSTR("Instance was deallocated"), 0);

  -[LARatchetViewController clean](self, "clean");
  LACLogDTO();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_22FE91000, v4, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)LARatchetViewController;
  -[LARatchetViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LARatchetViewController;
  -[LARatchetViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[LARatchetViewController setIsInViewHierarchy:](self, "setIsInViewHierarchy:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LARatchetViewController;
  -[LARatchetViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[LARatchetViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopWithReason:invalidate:", CFSTR("View did disappear"), 0);

}

- (BOOL)isInViewHierarchy
{
  return self->_isInViewHierarchy;
}

- (void)setIsInViewHierarchy:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id WeakRetained;
  char v7;
  NSObject *v8;
  id v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  LARatchetViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_isInViewHierarchy != a3)
  {
    v3 = a3;
    LACLogDTO();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[LARatchetViewController setIsInViewHierarchy:].cold.1((uint64_t)self, v3, v5);

    self->_isInViewHierarchy = v3;
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        LACLogDTO();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_loadWeakRetained((id *)&self->_delegate);
          v11 = 138412546;
          v12 = v9;
          v13 = 2112;
          v14 = self;
          _os_log_impl(&dword_22FE91000, v8, OS_LOG_TYPE_DEFAULT, "%@ informed that %@ appeared", (uint8_t *)&v11, 0x16u);

        }
        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v10, "ratchetViewControllerDidAppear:", self);

      }
    }
  }
}

- (id)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (id)pageViewController
{
  return self->_pageViewController;
}

- (id)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (id)internalOptions
{
  return self->_internalOptions;
}

- (id)presentationContext
{
  return objc_loadWeakRetained((id *)&self->_presentationContext);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x24BDDA950], "ratchetResultForResult:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDA950], "ratchetErrorForError:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ratchetViewController:didFinishWithResult:error:", self, v10, v11);

  }
}

- (NSDictionary)options
{
  return self->_options;
}

- (LARatchetViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (LARatchetViewControllerDelegate)delegate
{
  return (LARatchetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_presentationContext);
  objc_storeStrong((id *)&self->_internalOptions, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

+ (id)makeViewControllerWithOptions:(id)a3
{
  id v3;

  sub_22FEB1880();
  swift_getObjCClassMetadata();
  v3 = sub_22FEAD7B0();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)makeViewControllerWithOptions:(id)a3 configuration:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = sub_22FEB1880();
  swift_getObjCClassMetadata();
  v6 = a4;
  v7 = sub_22FEAD8B0(v5, v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (void)evaluateAndShowViewController
{
  sub_22FEADF84(self, (uint64_t)a2, MEMORY[0x24BE607F0]);
}

- (void)evaluateAndPresentViewController
{
  sub_22FEADF84(self, (uint64_t)a2, MEMORY[0x24BE607F8]);
}

- (void)invalidate
{
  LARatchetViewController *v2;

  v2 = self;
  sub_22FEAE028();

}

- (void)clean
{
  LARatchetViewController *v2;

  v2 = self;
  sub_22FEAE288();

}

- (void)setIsInViewHierarchy:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_debug_impl(&dword_22FE91000, log, OS_LOG_TYPE_DEBUG, "%@ is in view hierarchy %d", (uint8_t *)&v3, 0x12u);
}

@end
