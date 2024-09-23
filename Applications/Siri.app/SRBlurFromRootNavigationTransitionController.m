@implementation SRBlurFromRootNavigationTransitionController

- (SRBlurFromRootNavigationTransitionController)initWithDelegate:(id)a3
{
  id v4;
  SRBlurFromRootNavigationTransitionController *v5;
  SRBlurFromRootNavigationTransitionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SRBlurFromRootNavigationTransitionController;
  v5 = -[SRBlurFromRootNavigationTransitionController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[SRBlurFromRootNavigationTransitionController operation](self, "operation"))
  {
    if ((id)-[SRBlurFromRootNavigationTransitionController operation](self, "operation") == (id)2)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
      v6 = objc_msgSend(v5, "count");

      if (v6 == (id)1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
        objc_msgSend(v7, "blurFromRootNavigationTransitionController:requestHostBlurVisible:requestPresentationBlurVisible:", self, 0, 1);

      }
    }
    -[SRBlurFromRootNavigationTransitionController _coordinateTransitionWithTransitionCoordination:](self, "_coordinateTransitionWithTransitionCoordination:", v8);
  }

}

- (void)_coordinateTransitionWithTransitionCoordination:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100037C50;
  v7[3] = &unk_100122C18;
  objc_copyWeak(&v8, &location);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100037CA8;
  v5[3] = &unk_100122C18;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v7, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_performPushAnimations
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = objc_msgSend(v4, "count");

  if (v5 == (id)2)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
    objc_msgSend(v6, "blurFromRootNavigationTransitionController:requestBackgroundBlurViewVisible:", self, 1);

  }
}

- (void)_performPopAnimations
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = objc_msgSend(v4, "count");

  if (v5 == (id)1)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
    objc_msgSend(v6, "blurFromRootNavigationTransitionController:requestBackgroundBlurViewVisible:", self, 0);

  }
}

- (void)_updateBlurVisibility
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  SRBlurFromRootNavigationTransitionController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = objc_msgSend(v4, "count");

  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
    v12 = v6;
    v7 = self;
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController _navigationController](self, "_navigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewControllers"));
    v11 = objc_msgSend(v10, "count");

    if (v11 != (id)2)
      return;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRBlurFromRootNavigationTransitionController delegate](self, "delegate"));
    v12 = v6;
    v7 = self;
    v8 = 1;
  }
  objc_msgSend(v6, "blurFromRootNavigationTransitionController:requestHostBlurVisible:requestPresentationBlurVisible:", v7, v8, 0);

}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SRBlurFromRootNavigationTransitionControllerDelegate)delegate
{
  return (SRBlurFromRootNavigationTransitionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UINavigationController)_navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)_setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
