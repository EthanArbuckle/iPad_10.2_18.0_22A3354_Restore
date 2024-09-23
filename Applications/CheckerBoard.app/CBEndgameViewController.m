@implementation CBEndgameViewController

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Diagnostics pane loaded", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)CBEndgameViewController;
  -[CBEndgameViewController viewDidLoad](&v6, "viewDidLoad");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBEndgameViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setHidesBackButton:", 1);

  -[CBEndgameViewController showDiagnostics](self, "showDiagnostics");
}

- (void)showDiagnostics
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = CheckerBoardLogHandleForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launching Diagnostics.", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CBEndGameViewControllerLaunchingDiagnosticsNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBAppManager sharedInstance](CBAppManager, "sharedInstance"));
  objc_msgSend(v5, "launchAppWithBundleID:suspended:native:completion:", CFSTR("com.apple.Diagnostics"), 0, 1, &stru_100075D00);

}

@end
