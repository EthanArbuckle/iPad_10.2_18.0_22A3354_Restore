@implementation FBALoginFlowViewController

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBALoginFlowViewController;
  -[FBALoginFlowViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if ((-[FBALoginFlowViewController pendingUI](self, "pendingUI") & 2) != 0)
  {
    -[FBALoginFlowViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBAStartupLicensePresentation"), self);
    -[FBALoginFlowViewController setPendingUI:](self, "setPendingUI:", -[FBALoginFlowViewController pendingUI](self, "pendingUI") & 0xFFFFFFFFFFFFFFFDLL);
  }
  else if ((-[FBALoginFlowViewController pendingUI](self, "pendingUI") & 4) == 0)
  {
    -[FBALoginFlowViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBAUnwindLoginFlow"), self);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 6;
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("FBAStartupLicensePresentation"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100038708;
    v12[3] = &unk_1000E6730;
    objc_copyWeak(&v13, &location);
    v12[4] = self;
    objc_msgSend(v11, "setCompletion:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

- (unint64_t)pendingUI
{
  return self->_pendingUI;
}

- (void)setPendingUI:(unint64_t)a3
{
  self->_pendingUI = a3;
}

@end
