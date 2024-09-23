@implementation PasscodeActiveViewFactory

- (id)passcodeViewForPasscode:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  double v17;
  id v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  double v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = (id)3221225472;
  v19[2] = sub_100007058;
  v19[3] = &unk_100079A58;
  v19[4] = self;
  v20 = v6;
  v21 = v7;
  v9 = v7;
  v10 = v6;
  v11 = sub_100007058(v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v12, "setShowsEmergencyCallButton:", 0);
  objc_msgSend(v12, "setBiometricAuthenticationAllowed:", 0);
  v15 = LALogForCategory(0, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "timeIntervalSinceNow");
    *(_DWORD *)buf = 134217984;
    v23 = -v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SBUIPasscodeLockViewFactory call took %.2f secs", buf, 0xCu);
  }

  return v12;
}

- (int)_lockStyleForPasscodeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return a3;
  else
    return 0;
}

@end
