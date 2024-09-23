@implementation CPSInlineCardViewController

- (CPSInlineCardViewController)initWithURL:(id)a3
{
  id v4;
  CPSInlineCardViewController *v5;
  uint64_t v6;
  NSURL *url;
  CPSInlineCardViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSInlineCardViewController;
  v5 = -[CPSInlineCardViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  CPSLaunchContentViewController *v4;
  CPSLaunchContentViewController *launchContentViewController;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPSInlineCardViewController;
  -[CPSInlineCardViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (!self->_launchContentViewController)
  {
    v4 = -[CPSLaunchContentViewController initWithURL:displayMode:]([CPSLaunchContentViewController alloc], "initWithURL:displayMode:", self->_url, 1);
    launchContentViewController = self->_launchContentViewController;
    self->_launchContentViewController = v4;

    -[CPSLaunchContentViewController setDelegate:](self->_launchContentViewController, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSInlineCardViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[CPSInlineCardViewController _setupInlineCardViewWithProxCardKit](self, "_setupInlineCardViewWithProxCardKit");
  }
}

- (void)_setupInlineCardViewWithProxCardKit
{
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  PRXCardContainerViewController *v7;
  PRXCardContainerViewController *proxController;
  void *v9;
  void *v10;
  void *v11;
  CPSInlineCardContainerView *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  CPSInlineCardContainerView *v54;
  uint64_t v55;
  uint64_t v56;
  Class (*v57)(uint64_t);
  void *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[10];

  v64[8] = *MEMORY[0x1E0C80C00];
  v60 = 0;
  v61 = &v60;
  v62 = 0x2050000000;
  v3 = (void *)getPRXFlowConfigurationClass_softClass;
  v63 = getPRXFlowConfigurationClass_softClass;
  if (!getPRXFlowConfigurationClass_softClass)
  {
    v55 = MEMORY[0x1E0C809B0];
    v56 = 3221225472;
    v57 = __getPRXFlowConfigurationClass_block_invoke;
    v58 = &unk_1E8E8B540;
    v59 = &v60;
    __getPRXFlowConfigurationClass_block_invoke((uint64_t)&v55);
    v3 = (void *)v61[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v60, 8);
  objc_msgSend(v4, "defaultConfiguration");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setSupportsDarkMode:", 1);
  v60 = 0;
  v61 = &v60;
  v62 = 0x2050000000;
  v5 = (void *)getPRXCardContainerViewControllerClass_softClass;
  v63 = getPRXCardContainerViewControllerClass_softClass;
  if (!getPRXCardContainerViewControllerClass_softClass)
  {
    v55 = MEMORY[0x1E0C809B0];
    v56 = 3221225472;
    v57 = __getPRXCardContainerViewControllerClass_block_invoke;
    v58 = &unk_1E8E8B540;
    v59 = &v60;
    __getPRXCardContainerViewControllerClass_block_invoke((uint64_t)&v55);
    v5 = (void *)v61[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v60, 8);
  v7 = (PRXCardContainerViewController *)objc_msgSend([v6 alloc], "initWithConfiguration:", v52);
  proxController = self->_proxController;
  self->_proxController = v7;

  -[PRXCardContainerViewController mainNavigationController](self->_proxController, "mainNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", self->_launchContentViewController, 0);

  -[PRXCardContainerViewController view](self->_proxController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSInlineCardViewController addChildViewController:](self, "addChildViewController:", self->_proxController);
  -[CPSInlineCardViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  -[PRXCardContainerViewController didMoveToParentViewController:](self->_proxController, "didMoveToParentViewController:", self);
  v53 = v10;
  objc_msgSend(v53, "backgroundView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_setContinuousCornerRadius:", 13.0);
  v12 = [CPSInlineCardContainerView alloc];
  v54 = -[CPSInlineCardContainerView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CPSInlineCardContainerView setTranslatesAutoresizingMaskIntoConstraints:](v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPSInlineCardContainerView setDelegate:](v54, "setDelegate:", self);
  -[CPSLaunchContentViewController view](self->_launchContentViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSInlineCardContainerView setContentView:](v54, "setContentView:", v13);

  -[CPSInlineCardViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v54);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:name:object:", v53, *MEMORY[0x1E0CEB978], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObserver:name:object:", v53, *MEMORY[0x1E0CEB970], 0);

  v27 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v53, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSInlineCardViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v47;
  objc_msgSend(v53, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSInlineCardViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v43;
  objc_msgSend(v53, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSInlineCardViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v39;
  objc_msgSend(v53, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPSInlineCardViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v35;
  -[CPSInlineCardContainerView centerXAnchor](v54, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSInlineCardViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v31;
  -[CPSInlineCardContainerView centerYAnchor](v54, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSInlineCardViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v17;
  -[CPSInlineCardContainerView widthAnchor](v54, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSInlineCardViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v21;
  -[CPSInlineCardContainerView heightAnchor](v54, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPSInlineCardViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v26);

}

- (void)launchContentViewControllerDidDisappear:(id)a3 didOpenClip:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (!v4)
    -[CPSLaunchContentViewController cancelSession](self->_launchContentViewController, "cancelSession");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "cardViewControllerDidDisappear:clipDidOpen:persistUserSettings:", self, v4, 0);

  }
}

- (void)launchContentViewController:(id)a3 didTapCloseButton:(BOOL)a4
{
  id WeakRetained;
  char v6;
  id v7;

  -[CPSLaunchContentViewController cancelSession](self->_launchContentViewController, "cancelSession", a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "cardViewControllerDidDisappear:clipDidOpen:persistUserSettings:", self, 0, 1);

  }
}

- (void)didTapBackgroundView:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[CPSLaunchContentViewController cancelSession](self->_launchContentViewController, "cancelSession", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "cardViewControllerDidDisappear:clipDidOpen:persistUserSettings:", self, 0, 0);

  }
}

- (NSURL)url
{
  return self->_url;
}

- (CPSInlineCardViewControllerDelegate)delegate
{
  return (CPSInlineCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_proxController, 0);
  objc_storeStrong((id *)&self->_launchContentViewController, 0);
}

@end
