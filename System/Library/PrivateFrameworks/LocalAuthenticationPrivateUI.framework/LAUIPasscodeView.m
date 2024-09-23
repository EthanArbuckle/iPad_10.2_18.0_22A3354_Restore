@implementation LAUIPasscodeView

- (LAUIPasscodeView)initWithContext:(id)a3
{
  return -[LAUIPasscodeView initWithContext:shouldPresentUI:](self, "initWithContext:shouldPresentUI:", a3, 0);
}

- (LAUIPasscodeView)initWithContext:(id)a3 shouldPresentUI:(BOOL)a4
{
  id v6;
  LAUIPasscodeView *v7;
  LAUIPasscodeView *v8;
  id v9;
  void *v10;
  id WeakRetained;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAUIPasscodeView;
  v7 = -[LAUIPasscodeView initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v9 = objc_storeWeak((id *)&v7->_context, v6);
    objc_msgSend(v6, "uiDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_originalDelegate, v10);

    WeakRetained = objc_loadWeakRetained((id *)&v8->_context);
    objc_msgSend(WeakRetained, "setUiDelegate:", v8);

    v8->_shouldBecomeFirstResponder = 1;
    v8->_shouldPresentUI = a4;
    -[LAUIPasscodeView _prepareRemoteView](v8, "_prepareRemoteView");
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  id v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);
  v5 = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(v5, "setUiDelegate:", WeakRetained);

  v6.receiver = self;
  v6.super_class = (Class)LAUIPasscodeView;
  -[LAUIPasscodeView dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[LAUIPasscodeView setView:](self, "setView:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LAUIPasscodeView;
  -[LAUIPasscodeView viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (self->_shouldBecomeFirstResponder)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
    objc_msgSend(WeakRetained, "startEditing");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LAUIPasscodeView;
  -[LAUIPasscodeView viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
  objc_msgSend(WeakRetained, "endEditing");

}

- (BOOL)becomeFirstResponder
{
  LAUIPasscodeView *v2;
  unsigned __int8 v3;
  id WeakRetained;
  id v5;
  BOOL v6;
  objc_super v8;

  v2 = self;
  v8.receiver = self;
  v8.super_class = (Class)LAUIPasscodeView;
  v3 = -[LAUIPasscodeView becomeFirstResponder](&v8, sel_becomeFirstResponder);
  v2->_shouldBecomeFirstResponder = 1;
  v2 = (LAUIPasscodeView *)((char *)v2 + 984);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_msgSend(WeakRetained, "startEditing");

  v5 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  if (v5)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (BOOL)resignFirstResponder
{
  LAUIPasscodeView *v2;
  unsigned __int8 v3;
  id WeakRetained;
  id v5;
  BOOL v6;
  objc_super v8;

  v2 = self;
  v8.receiver = self;
  v8.super_class = (Class)LAUIPasscodeView;
  v3 = -[LAUIPasscodeView resignFirstResponder](&v8, sel_resignFirstResponder);
  v2->_shouldBecomeFirstResponder = 0;
  v2 = (LAUIPasscodeView *)((char *)v2 + 984);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_msgSend(WeakRetained, "endEditing");

  v5 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  if (v5)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v15 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalDelegate);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)&self->_originalDelegate);
    objc_msgSend(v10, "event:params:reply:", a3, v15, v8);

  }
  if (a3 == 2)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", &unk_24C284E58);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v15, "objectForKeyedSubscript:", &unk_24C284E58);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if (v14)
      {
        self->_shouldPresentUI = 1;
        -[LAUIPasscodeView _presentRemoteView](self, "_presentRemoteView");
      }
    }
  }

}

- (void)_prepareRemoteView
{
  id WeakRetained;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);

  if (!WeakRetained)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __38__LAUIPasscodeView__prepareRemoteView__block_invoke;
    v5[3] = &unk_24C27E9F0;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    v4 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](_PasscodeEmbeddedRemoteViewControllerHost, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PasscodeEmbeddedRemoteViewController"), CFSTR("com.apple.CoreAuthUI"), v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __38__LAUIPasscodeView__prepareRemoteView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __38__LAUIPasscodeView__prepareRemoteView__block_invoke_cold_2();
    }
    else if ((objc_msgSend(v5, "conformsToProtocol:", &unk_2545C7148) & 1) != 0)
    {
      v8 = objc_storeWeak(WeakRetained + 123, v5);
      v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968));
      objc_msgSend(v9, "externalizedContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContext:", v10);

      objc_msgSend(*(id *)(a1 + 32), "_presentRemoteView");
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      __38__LAUIPasscodeView__prepareRemoteView__block_invoke_cold_1();
    }
  }

}

- (void)_presentRemoteView
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD block[4];
  id v46;
  id buf[2];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    if (self->_shouldPresentUI)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
      if (WeakRetained)
      {
        v4 = WeakRetained;
        -[LAUIPasscodeView view](self, "view");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subviews");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_loadWeakRetained((id *)&self->_remoteVC);
        objc_msgSend(v7, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v6, "containsObject:", v8);

        if ((v9 & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_209E00000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Presenting remote UI", (uint8_t *)buf, 2u);
          }
          -[LAUIPasscodeView view](self, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_loadWeakRetained((id *)&self->_remoteVC);
          objc_msgSend(v11, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addSubview:", v12);

          v13 = objc_loadWeakRetained((id *)&self->_remoteVC);
          objc_msgSend(v13, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

          v15 = objc_loadWeakRetained((id *)&self->_remoteVC);
          objc_msgSend(v15, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "topAnchor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[LAUIPasscodeView view](self, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "topAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "constraintEqualToAnchor:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setActive:", 1);

          v21 = objc_loadWeakRetained((id *)&self->_remoteVC);
          objc_msgSend(v21, "view");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "bottomAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[LAUIPasscodeView view](self, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "bottomAnchor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "constraintEqualToAnchor:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setActive:", 1);

          v27 = objc_loadWeakRetained((id *)&self->_remoteVC);
          objc_msgSend(v27, "view");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "leadingAnchor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[LAUIPasscodeView view](self, "view");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "leadingAnchor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "constraintEqualToAnchor:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setActive:", 1);

          v33 = objc_loadWeakRetained((id *)&self->_remoteVC);
          objc_msgSend(v33, "view");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "trailingAnchor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[LAUIPasscodeView view](self, "view");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "trailingAnchor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "constraintEqualToAnchor:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setActive:", 1);

          v39 = objc_loadWeakRetained((id *)&self->_remoteVC);
          -[LAUIPasscodeView addChildViewController:](self, "addChildViewController:", v39);

          v40 = objc_loadWeakRetained((id *)&self->_remoteVC);
          objc_msgSend(v40, "didMoveToParentViewController:", self);

          LODWORD(v40) = self->_shouldBecomeFirstResponder;
          v41 = objc_loadWeakRetained((id *)&self->_remoteVC);
          v42 = v41;
          if ((_DWORD)v40)
            objc_msgSend(v41, "startEditing");
          else
            objc_msgSend(v41, "endEditing");

          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObserver:selector:name:object:", self, sel__appDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObserver:selector:name:object:", self, sel__appDidBecomeInactive_, *MEMORY[0x24BDF75D8], 0);

        }
      }
    }
  }
  else
  {
    objc_initWeak(buf, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__LAUIPasscodeView__presentRemoteView__block_invoke;
    block[3] = &unk_24C27EA18;
    objc_copyWeak(&v46, buf);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v46);
    objc_destroyWeak(buf);
  }
}

void __38__LAUIPasscodeView__presentRemoteView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentRemoteView");
    WeakRetained = v2;
  }

}

- (void)_appDidBecomeActive:(id)a3
{
  id WeakRetained;

  if (self->_shouldBecomeFirstResponder)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
    objc_msgSend(WeakRetained, "startEditing");

  }
}

- (void)_appDidBecomeInactive:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
  objc_msgSend(WeakRetained, "endEditing");

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteVC);
  objc_destroyWeak((id *)&self->_originalDelegate);
  objc_destroyWeak((id *)&self->_context);
}

void __38__LAUIPasscodeView__prepareRemoteView__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E00000, MEMORY[0x24BDACB70], v0, "Received remote VC has unexpected type %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __38__LAUIPasscodeView__prepareRemoteView__block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_209E00000, MEMORY[0x24BDACB70], v0, "Could not obtain remote VC %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
