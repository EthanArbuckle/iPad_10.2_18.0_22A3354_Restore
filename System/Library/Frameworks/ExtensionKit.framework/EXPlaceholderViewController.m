@implementation EXPlaceholderViewController

- (EXPlaceholderViewController)init
{
  EXPlaceholderViewController *v2;
  EXPlaceholderViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EXPlaceholderViewController;
  v2 = -[EXPlaceholderViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2)
    -[EXPlaceholderViewController setState:](v2, "setState:", 0);
  return v3;
}

- (EXPlaceholderViewController)initWithCoder:(id)a3
{
  EXPlaceholderViewController *v3;
  EXPlaceholderViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EXPlaceholderViewController;
  v3 = -[EXPlaceholderViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[EXPlaceholderViewController setState:](v3, "setState:", 0);
  return v4;
}

- (void)loadView
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *completeIcon;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDC79B8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "defaultPlaceholderViewControllerShowsState");

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setHidesWhenStopped:", 1);
    -[EXPlaceholderViewController setActivityView:](self, "setActivityView:", v6);
    objc_msgSend(v3, "addSubview:", v6);
    v29 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v6, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v9;
    objc_msgSend(v6, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v13);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("puzzlepiece"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v30);
    completeIcon = self->_completeIcon;
    self->_completeIcon = v14;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_completeIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setHidden:](self->_completeIcon, "setHidden:", 1);
    objc_msgSend(v3, "addSubview:", self->_completeIcon);
    v24 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView heightAnchor](self->_completeIcon, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", 64.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v27;
    -[UIImageView widthAnchor](self->_completeIcon, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_completeIcon, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v16;
    -[UIImageView centerXAnchor](self->_completeIcon, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v19;
    -[UIImageView centerYAnchor](self->_completeIcon, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v23);

  }
  -[EXPlaceholderViewController setView:](self, "setView:", v3);

}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_initWeak(&location, self);
  _EXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[EXPlaceholderViewController setState:].cold.5(a3, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x24BDC79B8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "defaultPlaceholderViewControllerShowsState");

  if ((v13 & 1) != 0)
  {
    if (a3 == 1)
    {
      v14 = (void *)MEMORY[0x24BDBCF40];
      objc_msgSend(MEMORY[0x24BDC79B8], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "defaultPlaceholderDelayBeforeShowingLoadingIndicator");
      v17 = v16;
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __40__EXPlaceholderViewController_setState___block_invoke;
      v27 = &unk_24C3E3A10;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v14, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v24, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EXPlaceholderViewController setTimer:](self, "setTimer:", v18, v24, v25, v26, v27);

      objc_destroyWeak(&v28);
    }
    else
    {
      -[EXPlaceholderViewController timer](self, "timer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "invalidate");

      if (a3 == 2)
      {
        _EXDefaultLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[EXPlaceholderViewController setState:].cold.4();

        -[UIActivityIndicatorView startAnimating](self->_activityView, "startAnimating");
LABEL_19:
        if (self->_state == 4)
        {
          _EXDefaultLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            -[EXPlaceholderViewController setState:].cold.2();

        }
        -[UIImageView setHidden:](self->_completeIcon, "setHidden:", 1);
        goto LABEL_24;
      }
    }
    if (self->_state == 2)
    {
      _EXDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[EXPlaceholderViewController setState:].cold.3();

    }
    -[UIActivityIndicatorView stopAnimating](self->_activityView, "stopAnimating");
    if (a3 - 3 <= 1)
    {
      _EXDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[EXPlaceholderViewController setState:].cold.1();

      -[UIImageView setHidden:](self->_completeIcon, "setHidden:", 0);
      goto LABEL_24;
    }
    goto LABEL_19;
  }
LABEL_24:
  self->_state = a3;
  objc_destroyWeak(&location);
}

void __40__EXPlaceholderViewController_setState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setState:", 2);

}

- (void)viewWillAppear:(BOOL)a3
{
  -[EXPlaceholderViewController setState:](self, "setState:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  -[EXPlaceholderViewController setState:](self, "setState:", 0);
}

- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[EXPlaceholderViewController hostViewController:didPrepareToHost:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[EXPlaceholderViewController hostViewController:didBeginHosting:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a5;
  _EXDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[EXPlaceholderViewController hostViewController:didEndHosting:error:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  if (v6)
    v14 = 3;
  else
    v14 = 4;
  -[EXPlaceholderViewController setState:](self, "setState:", v14);

}

- (UIActivityIndicatorView)activityView
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 968, 1);
}

- (void)setActivityView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (NSTimer)timer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_timer);
}

- (void)setTimer:(id)a3
{
  objc_storeWeak((id *)&self->_timer, a3);
}

- (UIImageView)completeIcon
{
  return (UIImageView *)objc_getProperty(self, a2, 984, 1);
}

- (void)setCompleteIcon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeIcon, 0);
  objc_destroyWeak((id *)&self->_timer);
  objc_storeStrong((id *)&self->_activityView, 0);
}

- (void)setState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "showing error UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)setState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "hideing error UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)setState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "stopping loading progress animation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)setState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "starting loading progress animation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)setState:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, a2, a3, "placeholder updated to state: %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostViewController:(uint64_t)a3 didPrepareToHost:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, a1, a3, "%{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostViewController:(uint64_t)a3 didBeginHosting:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, a1, a3, "%{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)hostViewController:(uint64_t)a3 didEndHosting:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20AE73000, a2, a3, "Hosting did end error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
