@implementation MVSAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance", a3, a4));
  objc_msgSend(v4, "_setBlocksConnectionAtResume:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v5, "addListenerID:capabilities:", CFSTR("MessagesViewService"), CKMVCListenerCapabilities());

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v6, "blockUntilConnected");

  +[IMServiceImpl iMessageEnabled](IMServiceImpl, "iMessageEnabled");
  v7 = dispatch_time(0, 0);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_1000040B8);
  return 1;
}

@end
