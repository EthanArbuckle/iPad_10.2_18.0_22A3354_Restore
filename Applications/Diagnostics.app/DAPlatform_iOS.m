@implementation DAPlatform_iOS

- (BOOL)isCheckerBoardActive
{
  return +[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive");
}

- (void)exitCheckerBoard
{
  if (-[DAPlatform_iOS isCheckerBoardActive](self, "isCheckerBoardActive"))
    +[CBSUtilities exitCheckerBoard](CBSUtilities, "exitCheckerBoard");
}

- (BOOL)didSetProxyServerInformation
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  if (!-[DAPlatform_iOS isCheckerBoardActive](self, "isCheckerBoardActive"))
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CBSUtilities proxyServer](CBSUtilities, "proxyServer"));
  v3 = DiagnosticLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBSUtilities proxyServer: %@", (uint8_t *)&v18, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "server"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "port"));
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment"));
    objc_msgSend(v10, "setSOCKSProxyServer:", v5);
    objc_msgSend(v10, "setSOCKSProxyPort:", v7);
    v11 = DiagnosticLogHandleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "SOCKSProxyServer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "SOCKSProxyPort"));
      v18 = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set ASTEnvironment to %@, %@", (uint8_t *)&v18, 0x16u);

    }
  }

  return v9;
}

- (BOOL)isInBoxUpdateModeActive
{
  if (qword_10016E8B8 != -1)
    dispatch_once(&qword_10016E8B8, &stru_1001334D0);
  return byte_10016E8B0;
}

- (void)showSceneStatusBar
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (-[DAPlatform_iOS isCheckerBoardActive](self, "isCheckerBoardActive"))
  {
    v2 = DiagnosticLogHandleForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBSUtilities: showSceneStatusBar", v4, 2u);
    }

    +[CBSUtilities showSceneStatusBar](CBSUtilities, "showSceneStatusBar");
  }
}

- (void)hideSceneStatusBar
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (-[DAPlatform_iOS isCheckerBoardActive](self, "isCheckerBoardActive"))
  {
    v2 = DiagnosticLogHandleForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBSUtilities: hideSceneStatusBar", v4, 2u);
    }

    +[CBSUtilities hideSceneStatusBar](CBSUtilities, "hideSceneStatusBar");
  }
}

- (void)sceneStatusBarStyle:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  int64_t v7;

  if (-[DAPlatform_iOS isCheckerBoardActive](self, "isCheckerBoardActive"))
  {
    v4 = DiagnosticLogHandleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CBSUtilities: sceneStatusBarStyle %li", (uint8_t *)&v6, 0xCu);
    }

    +[CBSUtilities sceneStatusBarStyle:](CBSUtilities, "sceneStatusBarStyle:", a3);
  }
}

- (void)dimCheckerBoardDisplay
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (-[DAPlatform_iOS isCheckerBoardActive](self, "isCheckerBoardActive"))
  {
    v2 = DiagnosticLogHandleForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBSUtilities: dimCheckerBoardDisplay", v4, 2u);
    }

    +[CBSUtilities dimDisplay](CBSUtilities, "dimDisplay");
  }
}

- (void)undimCheckerBoardDisplay
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (-[DAPlatform_iOS isCheckerBoardActive](self, "isCheckerBoardActive"))
  {
    v2 = DiagnosticLogHandleForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CBSUtilities: undimCheckerBoardDisplay", v4, 2u);
    }

    +[CBSUtilities undimDisplay](CBSUtilities, "undimDisplay");
  }
}

@end
