@implementation AXSBVOTItemChooserRootViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[AXSBVOTItemChooserRootViewController setItems:](self, "setItems:", v6);

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (void)viewDidLoad
{
  UIView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  VOTUIItemChooserController *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXSBVOTItemChooserRootViewController;
  -[AXSBVOTItemChooserRootViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = objc_opt_new(UIView);
  -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBVOTItemChooserRootViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBVOTItemChooserRootViewController view](self, "view"));
  v7 = -[UIView ax_pinConstraintsInAllDimensionsToView:](v3, "ax_pinConstraintsInAllDimensionsToView:", v6);

  v8 = objc_alloc_init(VOTUIItemChooserController);
  -[AXSBVOTItemChooserRootViewController setItemChooserController:](self, "setItemChooserController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBVOTItemChooserRootViewController itemChooserController](self, "itemChooserController"));
  objc_msgSend(v9, "setDelegate:", self);

  -[AXSBVOTItemChooserRootViewController setItemChooserSelectedIndex:](self, "setItemChooserSelectedIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSBVOTItemChooserRootViewController;
  -[AXSBVOTItemChooserRootViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  -[AXSBVOTItemChooserRootViewController _setupRemoteProxy](self, "_setupRemoteProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBVOTItemChooserRootViewController itemChooserController](self, "itemChooserController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012CFC;
  v5[3] = &unk_100024748;
  v5[4] = self;
  -[AXSBVOTItemChooserRootViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 0, v5);

}

- (void)_dismiss
{
  int64_t v3;
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  _QWORD v11[5];
  __CFString *v12;
  int64_t v13;
  unsigned __int8 v14;

  v3 = -[AXSBVOTItemChooserRootViewController itemChooserSelectedIndex](self, "itemChooserSelectedIndex");
  v4 = -[AXSBVOTItemChooserRootViewController itemChooserActivate](self, "itemChooserActivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBVOTItemChooserRootViewController itemChooserController](self, "itemChooserController"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastSearchTerm"));
  v7 = (void *)v6;
  v8 = &stru_100024F18;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012E34;
  v11[3] = &unk_100024E98;
  v12 = v9;
  v13 = v3;
  v14 = v4;
  v11[4] = self;
  v10 = v9;
  -[AXSBVOTItemChooserRootViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v11);

}

- (void)_setupRemoteProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AXSBVOTItemChooserRootViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setOrientationChangedEventsEnabled:", 0);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setWallpaperTunnelActive:", 1);
  objc_msgSend(v2, "setWallpaperStyle:withDuration:", 4, 0.3);
  objc_msgSend(v2, "setStatusBarHidden:withDuration:", 1, 0.3);

}

- (void)removeFromParentViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("row");
  v9[1] = CFSTR("activate");
  v10[0] = &off_100025FC8;
  v10[1] = &__kCFBooleanFalse;
  v9[2] = CFSTR("searchTerm");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXSBVOTItemChooserRootViewController itemChooserController](self, "itemChooserController"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastSearchTerm"));
  v5 = (void *)v4;
  v6 = &stru_100024F18;
  if (v4)
    v6 = (const __CFString *)v4;
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  UIAccessibilityPostNotification(0x7EAu, v7);

  v8.receiver = self;
  v8.super_class = (Class)AXSBVOTItemChooserRootViewController;
  -[AXSBVOTItemChooserRootViewController removeFromParentViewController](&v8, "removeFromParentViewController");
}

- (void)itemChooser:(id)a3 didSelectItemAtIndex:(int64_t)a4 activate:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[AXSBVOTItemChooserRootViewController setItemChooserSelectedIndex:](self, "setItemChooserSelectedIndex:", a4);
  -[AXSBVOTItemChooserRootViewController setItemChooserActivate:](self, "setItemChooserActivate:", v5);
  -[AXSBVOTItemChooserRootViewController _dismiss](self, "_dismiss");
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  return a4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (VOTUIItemChooserController)itemChooserController
{
  return self->_itemChooserController;
}

- (void)setItemChooserController:(id)a3
{
  objc_storeStrong((id *)&self->_itemChooserController, a3);
}

- (NSDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (int64_t)itemChooserSelectedIndex
{
  return self->_itemChooserSelectedIndex;
}

- (void)setItemChooserSelectedIndex:(int64_t)a3
{
  self->_itemChooserSelectedIndex = a3;
}

- (BOOL)itemChooserActivate
{
  return self->_itemChooserActivate;
}

- (void)setItemChooserActivate:(BOOL)a3
{
  self->_itemChooserActivate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemChooserController, 0);
}

@end
