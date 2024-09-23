@implementation ServicePINEntryViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "actions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  -[ServicePINEntryViewController setDidAcceptPINAction:](self, "setDidAcceptPINAction:", v8);

  v9[2]();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServicePINEntryViewController;
  -[ServicePINEntryViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePINEntryViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ServicePINEntryViewController;
  -[ServicePINEntryViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  if (!-[ServicePINEntryViewController pinControllerShown](self, "pinControllerShown"))
  {
    v4 = objc_alloc_init((Class)DevicePINController);
    v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);
    v6 = objc_alloc_init((Class)PSSpecifier);
    objc_msgSend(v6, "setEditPaneClass:", objc_opt_class(DevicePINPane));
    objc_msgSend(v6, "setProperty:forKey:", &off_10004CE98, CFSTR("mode"));
    objc_msgSend(v4, "setSpecifier:", v6);
    objc_msgSend(v4, "setPinDelegate:", self);
    if (-[ServicePINEntryViewController _usesModalPresentation](self, "_usesModalPresentation"))
    {
      objc_msgSend(v5, "setModalPresentationStyle:", 7);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "popoverPresentationController"));
      objc_msgSend(v7, "setDelegate:", self);
      objc_msgSend(v7, "setPermittedArrowDirections:", 0);
      objc_msgSend(v7, "setSourceView:", 0);
      objc_msgSend(v7, "_setCentersPopoverIfSourceViewNotSet:", 1);

    }
    else
    {
      objc_msgSend(v5, "setModalPresentationStyle:", 0);
    }
    -[ServicePINEntryViewController setPinController:](self, "setPinController:", v4);
    -[ServicePINEntryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
    -[ServicePINEntryViewController setPinControllerShown:](self, "setPinControllerShown:", 1);

  }
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePINEntryViewController didAcceptPINAction](self, "didAcceptPINAction"));
  v5 = objc_msgSend(v4, "canSendResponse");

  if (v5)
  {
    v6 = objc_alloc_init((Class)BSMutableSettings);
    objc_msgSend(v6, "setObject:forSetting:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePINEntryViewController didAcceptPINAction](self, "didAcceptPINAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v6));
    objc_msgSend(v7, "sendResponse:", v8);

  }
  -[ServicePINEntryViewController _dismiss](self, "_dismiss");

}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return !-[ServicePINEntryViewController _usesModalPresentation](self, "_usesModalPresentation", a3);
}

- (void)_dismiss
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePINEntryViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePINEntryViewController pinController](self, "pinController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePINEntryViewController pinController](self, "pinController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000C5DC;
    v6[3] = &unk_1000490B8;
    v7 = v3;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    objc_msgSend(v3, "dismiss");
  }

}

- (DevicePINController)pinController
{
  return self->_pinController;
}

- (void)setPinController:(id)a3
{
  objc_storeStrong((id *)&self->_pinController, a3);
}

- (BOOL)pinControllerShown
{
  return self->_pinControllerShown;
}

- (void)setPinControllerShown:(BOOL)a3
{
  self->_pinControllerShown = a3;
}

- (BSAction)didAcceptPINAction
{
  return self->_didAcceptPINAction;
}

- (void)setDidAcceptPINAction:(id)a3
{
  objc_storeStrong((id *)&self->_didAcceptPINAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didAcceptPINAction, 0);
  objc_storeStrong((id *)&self->_pinController, 0);
}

@end
