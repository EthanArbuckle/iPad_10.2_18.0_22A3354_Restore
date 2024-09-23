@implementation _UIColorPickerViewServiceOperatorViewController

- (void)viewDidLoad
{
  _UIColorPickerContainerViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIColorPickerContainerViewController *containerViewController;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIColorPickerContainerViewController *v24;
  objc_super v25;
  _QWORD v26[4];

  v25.receiver = self;
  v25.super_class = (Class)_UIColorPickerViewServiceOperatorViewController;
  -[_UIColorPickerViewServiceOperatorViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = objc_alloc_init(_UIColorPickerContainerViewController);
  -[_UIColorPickerViewServiceOperatorViewController addChildViewController:](self, "addChildViewController:", v3);
  v24 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerContainerViewController view](v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UIColorPickerContainerViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v26[0] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v26[1] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v7));
  v26[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v26[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  -[_UIColorPickerContainerViewController _setDelegate:](v24, "_setDelegate:", self);
  containerViewController = self->_containerViewController;
  self->_containerViewController = v24;

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  if (self->_containerViewController == a3)
  {
    objc_msgSend(a3, "preferredContentSize");
    -[_UIColorPickerViewServiceOperatorViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____UIColorPickerRemoteViewControllerService);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____UIColorPickerRemoteViewControllerHost);
}

- (id)host
{
  return -[_UIColorPickerViewServiceOperatorViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
}

- (void)_setSelectedColor:(id)a3 colorSpace:(id)a4
{
  -[_UIColorPickerContainerViewController _setSelectedColor:colorSpace:](self->_containerViewController, "_setSelectedColor:colorSpace:", a3, a4);
}

- (void)_setConfiguration:(id)a3
{
  -[_UIColorPickerContainerViewController _setConfiguration:](self->_containerViewController, "_setConfiguration:", a3);
}

- (void)dismissEyedropper:(BOOL)a3
{
  -[_UIColorPickerContainerViewController dismissEyedropper:](self->_containerViewController, "dismissEyedropper:", a3);
}

- (void)_prepareForDisplayWithCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)_pickerDidFinish
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController host](self, "host"));
  objc_msgSend(v2, "_pickerDidFinish");

}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController host](self, "host"));
  objc_msgSend(v10, "_pickerDidSelectColor:colorSpace:isVolatile:", v9, v8, v5);

}

- (void)_pickerDidShowEyedropper
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController host](self, "host"));
  objc_msgSend(v2, "_pickerDidShowEyedropper");

}

- (void)_pickerDidFloatEyedropper
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController host](self, "host"));
  objc_msgSend(v2, "_pickerDidFloatEyedropper");

}

- (void)_pickerDidDismissEyedropper
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_UIColorPickerViewServiceOperatorViewController host](self, "host"));
  objc_msgSend(v2, "_pickerDidDismissEyedropper");

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end
