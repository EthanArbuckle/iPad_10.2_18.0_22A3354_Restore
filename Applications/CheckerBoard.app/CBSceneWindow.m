@implementation CBSceneWindow

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CBSceneWindow _topViewController](self, "_topViewController"));
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v8);

}

- (void)dismissViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneWindow _topViewController](self, "_topViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneWindow rootViewController](self, "rootViewController"));

  if (v5 != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow windowManager](self, "windowManager"));
    objc_msgSend(v7, "windowWillDismiss:", self);

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000098F8;
    v8[3] = &unk_100075510;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)viewControllerDidDismiss
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWindow windowManager](self, "windowManager"));
  objc_msgSend(v3, "windowWillDismiss:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBWindow windowManager](self, "windowManager"));
  objc_msgSend(v4, "windowDidDismiss:", self);

}

- (id)_topViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBSceneWindow rootViewController](self, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

  if (v3)
  {
    do
    {
      v4 = CheckerBoardLogHandleForCategory(9);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CBSceneManager: presentingVC.presentingViewController", v9, 2u);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));

      v2 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v2;
  }
  return v6;
}

- (CBRecordingIndicatorManager)recordingIndicatorManager
{
  return self->_recordingIndicatorManager;
}

- (void)setRecordingIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_recordingIndicatorManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingIndicatorManager, 0);
}

@end
