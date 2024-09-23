@implementation SBSRemoteContentHostInterfaceShim

+ (void)getContentBoundsWithBlock:(id)a3 interface:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = HKSPLogForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[LockScreenViewController] calling getContentBoundsWithReplyBlock from ObjC shim...", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010720;
  v10[3] = &unk_100014F08;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v6, "getContentBoundsWithReplyBlock:", v10);

}

@end
