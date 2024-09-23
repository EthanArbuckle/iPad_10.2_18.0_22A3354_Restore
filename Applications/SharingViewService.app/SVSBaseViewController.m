@implementation SVSBaseViewController

- (SVSBaseViewController)initWithMainController:(id)a3
{
  id v4;
  SVSBaseViewController *v5;
  SVSBaseViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SVSBaseViewController;
  v5 = -[SVSBaseViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
    -[SVSBaseViewController setMainController:](v5, "setMainController:", v4);

  return v6;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)cancelProxCardDraggingWithCompletion:(id)a3
{
  SVSCardContainerView *containerView;

  containerView = self->_containerView;
  if (containerView)
    -[SVSCardContainerView cancelProxCardDraggingWithCompletion:](containerView, "cancelProxCardDraggingWithCompletion:", a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SVSBaseViewController;
  -[SVSBaseViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController navigationController](self, "navigationController"));
  if (!v5 || (v6 = objc_opt_class(SVSCommonNavController, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    -[SVSBaseViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  SVSCardContainerView *containerView;
  void *v9;
  NSLayoutConstraint *bottomMarginConstraint;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SVSBaseViewController;
  -[SVSBaseViewController viewDidAppear:](&v14, "viewDidAppear:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController navigationController](self, "navigationController"));
  if (!v5 || (v6 = objc_opt_class(SVSCommonNavController, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    location = 0;
    objc_initWeak(&location, self);
    -[SVSCardContainerView setNeedsLayout](self->_containerView, "setNeedsLayout");
    -[SVSCardContainerView layoutIfNeeded](self->_containerView, "layoutIfNeeded");
    containerView = self->_containerView;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dimmingView"));
    bottomMarginConstraint = self->_bottomMarginConstraint;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001154D8;
    v11[3] = &unk_10017DE88;
    objc_copyWeak(&v12, &location);
    -[SVSCardContainerView activateWithDimmingView:bottomMarginConstraint:dismissHandler:](containerView, "activateWithDimmingView:bottomMarginConstraint:dismissHandler:", v9, bottomMarginConstraint, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)viewDidLayoutSubviews
{
  if (!self->_didReactivateContainerViewAfterLayingOut)
  {
    self->_didReactivateContainerViewAfterLayingOut = 1;
    -[SVSCardContainerView reactivate](self->_containerView, "reactivate");
  }
}

- (NSLayoutConstraint)bottomMarginConstraint
{
  return self->_bottomMarginConstraint;
}

- (void)setBottomMarginConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomMarginConstraint, a3);
}

- (SVSCardContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (id)mainController
{
  return self->_mainController;
}

- (void)setMainController:(id)a3
{
  objc_storeStrong(&self->_mainController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mainController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);
}

@end
