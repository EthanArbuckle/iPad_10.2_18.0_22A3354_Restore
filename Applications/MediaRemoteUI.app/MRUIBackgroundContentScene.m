@implementation MRUIBackgroundContentScene

- (void)handleTouchAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LockScreenCoordinator shared](_TtC13MediaRemoteUI21LockScreenCoordinator, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artworkView"));
  objc_msgSend(v6, "center");

  objc_msgSend(v3, "location");
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v11, "setIdleTimerDisabled:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v12, "setIdleTimerDisabled:", 0);

  v13 = (id)objc_claimAutoreleasedReturnValue(+[LockScreenCoordinator shared](_TtC13MediaRemoteUI21LockScreenCoordinator, "shared"));
  objc_msgSend(v13, "handleBackgroundTapAt:", v8, v10);

}

@end
