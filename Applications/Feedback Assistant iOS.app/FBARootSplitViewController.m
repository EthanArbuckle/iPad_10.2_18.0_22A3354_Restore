@implementation FBARootSplitViewController

- (FBARootSplitViewController)initWithCoder:(id)a3
{
  FBARootSplitViewController *v3;
  FBARootSplitViewController *v4;
  id performOnAppear;
  NSString *presentedSegueName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBARootSplitViewController;
  v3 = -[FBARootSplitViewController initWithCoder:](&v8, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_pendingStartupUI = 0;
    performOnAppear = v3->_performOnAppear;
    v3->_performOnAppear = 0;

    presentedSegueName = v4->_presentedSegueName;
    v4->_presentedSegueName = 0;

  }
  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FBARootSplitViewController;
  -[FBARootSplitViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST")));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "displayLoginSplash", FBKUserIsLoggingOutNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notificationCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "displayNonParticipant", FBKUserNoProgramsNotification, 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBARootSplitViewController;
  -[FBARootSplitViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController performOnAppear](self, "performOnAppear"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController performOnAppear](self, "performOnAppear"));
    v5[2]();

    -[FBARootSplitViewController setPerformOnAppear:](self, "setPerformOnAppear:", 0);
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)FBARootSplitViewController;
  -[FBARootSplitViewController dealloc](&v6, "dealloc");
}

- (void)resetViewControllers:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = a3;
  if ((-[FBARootSplitViewController isCollapsed](self, "isCollapsed") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController viewControllers](self, "viewControllers"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));

    v6 = objc_msgSend(v11, "popToRootViewControllerAnimated:", v3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController storyboard](self, "storyboard"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", CFSTR("FBAEmptyStack")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController viewControllers](self, "viewControllers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));

    v10 = objc_msgSend(v9, "popToRootViewControllerAnimated:", v3);
    -[FBARootSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v9, 0);
    -[FBARootSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v11, 2);

  }
}

- (void)dismissSecondaryOrShowEmptyViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[FBARootSplitViewController isCollapsed](self, "isCollapsed"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController viewControllers](self, "viewControllers"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v6 = objc_msgSend(v8, "popViewControllerAnimated:", v3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController storyboard](self, "storyboard"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", CFSTR("FBAEmptyStack")));

    -[FBARootSplitViewController showDetailViewController:sender:](self, "showDetailViewController:sender:", v8, 0);
  }

}

- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBARootSplitViewController;
  v6 = a3;
  -[FBARootSplitViewController performSegueWithIdentifier:sender:](&v7, "performSegueWithIdentifier:sender:", v6, a4);
  -[FBARootSplitViewController setPresentedSegueName:](self, "setPresentedSegueName:", v6, v7.receiver, v7.super_class);

}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("FBALoginFlowModalPresentation"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationViewController"));
    objc_msgSend(v7, "setPendingUI:", -[FBARootSplitViewController pendingStartupUI](self, "pendingStartupUI"));

    -[FBARootSplitViewController setPendingStartupUI:](self, "setPendingStartupUI:", 0);
  }

}

- (void)clearBlockingUI
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028E8C;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)displayLoginSplash
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028F74;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)displayNonParticipant
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029008;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentConnectionErrorUI
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029068;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentVersionOutdatedUI
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000291BC;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)presentStartupUI:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[8];

  if ((a3 & 6) != 0)
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100029318;
    v5[3] = &unk_1000E6FF8;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)unwindLoginFlow:(id)a3
{
  -[FBARootSplitViewController setPresentedSegueName:](self, "setPresentedSegueName:", 0);
}

- (void)unwindToOutdatedVersion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[FBARootSplitViewController setPresentedSegueName:](self, "setPresentedSegueName:", 0);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029570;
  v5[3] = &unk_1000E6328;
  objc_copyWeak(&v6, &location);
  -[FBARootSplitViewController setPerformOnAppear:](self, "setPerformOnAppear:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)unwindToNonParticipant:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[FBARootSplitViewController setPresentedSegueName:](self, "setPresentedSegueName:", 0);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029694;
  v5[3] = &unk_1000E6328;
  objc_copyWeak(&v6, &location);
  -[FBARootSplitViewController setPerformOnAppear:](self, "setPerformOnAppear:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

+ (BOOL)presentsAuthKitUIModally
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3 != 0;
}

- (id)topMostController
{
  FBARootSplitViewController *v2;
  void *v3;
  FBARootSplitViewController *v4;
  void *v5;
  uint64_t v6;
  FBARootSplitViewController *v7;
  FBARootSplitViewController *v8;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController presentedViewController](v2, "presentedViewController"));

  if (v3)
  {
    do
    {
      v4 = (FBARootSplitViewController *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController presentedViewController](v2, "presentedViewController"));

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController presentedViewController](v4, "presentedViewController"));
      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  v6 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = (FBARootSplitViewController *)objc_claimAutoreleasedReturnValue(-[FBARootSplitViewController topViewController](v4, "topViewController"));
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (BOOL)isPresentingConsentView
{
  return self->_isPresentingConsentView;
}

- (void)setIsPresentingConsentView:(BOOL)a3
{
  self->_isPresentingConsentView = a3;
}

- (id)performOnAppear
{
  return self->_performOnAppear;
}

- (void)setPerformOnAppear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)presentedSegueName
{
  return self->_presentedSegueName;
}

- (void)setPresentedSegueName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)pendingStartupUI
{
  return self->_pendingStartupUI;
}

- (void)setPendingStartupUI:(unint64_t)a3
{
  self->_pendingStartupUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedSegueName, 0);
  objc_storeStrong(&self->_performOnAppear, 0);
}

- (void)createAndShowNonParticipantView
{
  FBARootSplitViewController *v2;

  v2 = self;
  sub_100072DCC();

}

- (void)signOutHandler
{
  void *v3;
  id v4;
  id v5;
  FBARootSplitViewController *v6;

  v3 = (void *)objc_opt_self(FBKData);
  v6 = self;
  v4 = objc_msgSend(v3, "sharedInstance");
  v5 = objc_msgSend(v4, "loginManager");

  objc_msgSend(v5, "logOut");
  objc_msgSend((id)objc_opt_self(FBKFileManager), "deleteAllDraftDirectories");
  -[FBARootSplitViewController dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)drainAndPresentConsentsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  FBARootSplitViewController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1000E99C8, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100055654;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10007306C((uint64_t)v7, v6);
  sub_10005565C((uint64_t)v7, v6);

}

- (BOOL)canDismissPresentedController:(id)a3
{
  uint64_t v4;

  v4 = sub_10004BB9C(&qword_1001171A0);
  return swift_dynamicCastClass(a3, v4) == 0;
}

@end
