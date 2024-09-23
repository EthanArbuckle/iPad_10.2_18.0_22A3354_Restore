@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a5;
  if (+[BacklinkIndicator isBacklinkIndicatorRequestForScene:willConnectToSession:options:](BacklinkIndicator, "isBacklinkIndicatorRequestForScene:willConnectToSession:options:", a3, a4, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userActivities"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));

    -[SceneDelegate _showBacklinkIndicatorForUserActivity:](self, "_showBacklinkIndicatorForUserActivity:", v10);
    v11 = sub_100002020();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "backlink indicator request handled.", v13, 2u);
    }

  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  if (+[BacklinkIndicator isBacklinkIndicatorRequestForScene:continueUserActivity:](BacklinkIndicator, "isBacklinkIndicatorRequestForScene:continueUserActivity:", a3, v6))
  {
    -[SceneDelegate _showBacklinkIndicatorForUserActivity:](self, "_showBacklinkIndicatorForUserActivity:", v6);
    v7 = sub_100002020();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "backlink indicator request handled.", v9, 2u);
    }

  }
}

- (void)_showBacklinkIndicatorForUserActivity:(id)a3
{
  void *v4;
  BacklinkIndicator *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SceneDelegate backlinkIndicator](self, "backlinkIndicator"));

  if (!v4)
  {
    v5 = objc_alloc_init(BacklinkIndicator);
    -[SceneDelegate setBacklinkIndicator:](self, "setBacklinkIndicator:", v5);

  }
  v6 = objc_msgSend(v9, "_syIsShowBacklinkIndicatorUserActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SceneDelegate backlinkIndicator](self, "backlinkIndicator"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "showWithUserActivity:", v9);
  else
    objc_msgSend(v7, "hide");

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BacklinkIndicator)backlinkIndicator
{
  return self->_backlinkIndicator;
}

- (void)setBacklinkIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_backlinkIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlinkIndicator, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
