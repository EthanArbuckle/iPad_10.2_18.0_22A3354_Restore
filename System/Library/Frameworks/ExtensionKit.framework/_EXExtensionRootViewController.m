@implementation _EXExtensionRootViewController

- (UIViewController)contentViewController
{
  return self->_embededViewController;
}

- (void)embedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_EXExtensionRootViewController embededViewController](self, "embededViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_EXExtensionRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    -[_EXExtensionRootViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v6, "leftAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v21;
    objc_msgSend(v6, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    objc_msgSend(v6, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v10;
    objc_msgSend(v6, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v24 = v4;
    v12 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v15);

    v5 = v12;
    v4 = v24;

    -[_EXExtensionRootViewController setEmbededViewController:](self, "setEmbededViewController:", v24);
    -[_EXExtensionRootViewController addChildViewController:](self, "addChildViewController:", v24);

  }
  if (v5)
    objc_msgSend(v5, "removeFromParentViewController");

}

- (UIViewController)embededViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 968, 1);
}

- (void)setEmbededViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embededViewController, 0);
}

@end
