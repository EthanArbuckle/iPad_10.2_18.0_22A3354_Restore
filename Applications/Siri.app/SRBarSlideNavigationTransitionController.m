@implementation SRBarSlideNavigationTransitionController

- (void)configureWithNavigationController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  objc_opt_class(SiriUINavigationController, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    -[SRBarSlideNavigationTransitionController _setNavigationController:](self, "_setNavigationController:", v4);
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009DD50(v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));
  objc_msgSend(v8, "setAlpha:", 0.0);

}

- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019174;
  v7[3] = &unk_100122BF0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000191B4;
  v5[3] = &unk_100122C18;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v7, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SiriUINavigationController)_navigationController
{
  return (SiriUINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)_setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
}

@end
