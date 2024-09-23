@implementation PBADeviceUnlockViewController

- (void)successfulAuthHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_100018C90);
  if (objc_msgSend(v4, "type") == (id)1)
  {
    dispatch_group_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController authenticationController](self, "authenticationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "createKeybagUnlockAssertionWithReason:", CFSTR("com.apple.PreBoard.StashBagCreate")));

    objc_msgSend(v7, "activate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SBFMobileKeyBag sharedInstance](SBFMobileKeyBag, "sharedInstance"));
    v9 = objc_alloc((Class)SBFMobileKeyBagUnlockOptions);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "passcode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));
    v12 = objc_msgSend(v9, "initWithPasscode:skipSEKeepUserDataOperation:", v11, 1);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100009630;
    v17[3] = &unk_1000188E0;
    v18 = v7;
    v19 = v5;
    v13 = v7;
    objc_msgSend(v8, "createStashBagWithOptions:completion:", v12, v17);

  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009658;
  v15[3] = &unk_100018748;
  v16 = v5;
  v14 = v5;
  -[PBADevicePasscodeViewController handlePasscodeEntrySuccessful:](self, "handlePasscodeEntrySuccessful:", v15);

}

@end
