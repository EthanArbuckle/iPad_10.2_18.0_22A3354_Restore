@implementation _EXExtensionViewController

- (id)makeContentViewController
{
  void *v3;
  void *v4;
  id v5;
  objc_class *v6;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[_EXViewControllerSceneConfiguration storyboard](self->_sceneConfiguration, "storyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "instantiateInitialViewController"), (v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = -[_EXViewControllerSceneConfiguration viewControllerClass](self->_sceneConfiguration, "viewControllerClass");
    if (v6)
      v5 = objc_alloc_init(v6);
    else
      v5 = 0;
  }

  return v5;
}

- (UIViewController)contentViewController
{
  UIViewController *contentViewController;
  UIViewController *v4;
  UIViewController *v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    -[_EXExtensionViewController makeContentViewController](self, "makeContentViewController");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentViewController;
    self->_contentViewController = v4;

    contentViewController = self->_contentViewController;
  }
  return contentViewController;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  uint8_t buf[8];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[_EXExtensionViewController setView:](self, "setView:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EXExtensionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[_EXExtensionViewController contentViewController](self, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "view");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_EXExtensionViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    -[_EXExtensionViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD1628];
    -[NSObject leftAnchor](v8, "leftAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    -[NSObject topAnchor](v8, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v19;
    -[NSObject rightAnchor](v8, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v12;
    -[NSObject bottomAnchor](v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v17);

    v7 = v15;
    -[_EXExtensionViewController addChildViewController:](self, "addChildViewController:", v15);

  }
  else
  {
    _EXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AE73000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load extension's content view controller", buf, 2u);
    }
  }

}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[_EXExtensionViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_EXExtensionViewController contentViewController](self, "contentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldAcceptXPCConnection:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_EXViewControllerSceneConfiguration)sceneConfiguration
{
  return (_EXViewControllerSceneConfiguration *)objc_getProperty(self, a2, 976, 1);
}

- (void)setSceneConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneConfiguration, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
