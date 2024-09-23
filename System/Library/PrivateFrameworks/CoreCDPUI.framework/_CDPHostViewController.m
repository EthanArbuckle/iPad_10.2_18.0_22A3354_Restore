@implementation _CDPHostViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void (**viewServiceTerminationBlock)(void);

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CDPHostViewController viewServiceDidTerminateWithError:].cold.1((uint64_t)v4, v5);

  viewServiceTerminationBlock = (void (**)(void))self->_viewServiceTerminationBlock;
  if (viewServiceTerminationBlock)
    viewServiceTerminationBlock[2]();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_CDPHostViewController;
  -[_UIRemoteViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[_CDPHostViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 1, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_CDPHostViewController;
  -[_UIRemoteViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[_CDPHostViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, v3);

}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A0EC40);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A27668);
}

- (void)hostKeyboardOffset:(id)a3
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = a3;
    -[_CDPHostViewController _keyboardHeightOffset](self, "_keyboardHeightOffset");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v6, v7);

  }
}

- (double)_keyboardHeightOffset
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MaxY;
  double v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v30;
  CGRect v31;
  CGRect v32;

  objc_msgSend(MEMORY[0x24BEBD6C8], "sizeForInterfaceOrientation:", -[_CDPHostViewController interfaceOrientation](self, "interfaceOrientation"));
  v30 = v3;
  -[_CDPHostViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDPHostViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "convertRect:toView:", 0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  MaxY = CGRectGetMaxY(v31);
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  v24 = v30 - (MaxY - CGRectGetMaxY(v32));
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceIdiom");
  v27 = 50.0;
  if (v26 != 1)
    v27 = 0.0;
  v28 = v24 + v27;

  return v28;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[_CDPHostViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_CDPHostViewController weakExtension](self, "weakExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDPHostViewController request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)_CDPHostViewController;
  -[_UIRemoteViewController dealloc](&v6, sel_dealloc);
}

- (NSCopying)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSExtension)weakExtension
{
  return (NSExtension *)objc_loadWeakRetained((id *)&self->_weakExtension);
}

- (void)setWeakExtension:(id)a3
{
  objc_storeWeak((id *)&self->_weakExtension, a3);
}

- (id)viewServiceTerminationBlock
{
  return self->_viewServiceTerminationBlock;
}

- (void)setViewServiceTerminationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewServiceTerminationBlock, 0);
  objc_destroyWeak((id *)&self->_weakExtension);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_ERROR, "\"CDP view service terminated with error: %@\", (uint8_t *)&v2, 0xCu);
}

@end
