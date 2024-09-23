@implementation FMDAVRouteControllerFactory

+ (BOOL)isAutomationActive
{
  id v2;
  NSObject *v3;
  _DWORD v5[2];

  if (qword_10002D6D0 != -1)
    dispatch_once(&qword_10002D6D0, &stru_100021090);
  v2 = sub_100007584();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = byte_10002D6C8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDAutomationAVRouteController: isAutomationActive: %d", (uint8_t *)v5, 8u);
  }

  return byte_10002D6C8;
}

+ (id)routeController
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  FMDAVRouteController *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[16];

  if (+[FMDAVRouteControllerFactory isAutomationActive](FMDAVRouteControllerFactory, "isAutomationActive"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAutomationHelperFactory sharedFactory](FMDAutomationHelperFactory, "sharedFactory"));
    v3 = objc_msgSend(v2, "automationHelperClassWithName:", CFSTR("FMDAutomationAVRouteController"));

    v4 = sub_100007584();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAVRouteController: switching to automation", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006D84;
    block[3] = &unk_1000210B0;
    block[4] = v3;
    if (qword_10002D6E0 != -1)
      dispatch_once(&qword_10002D6E0, block);
  }
  else
  {
    v6 = objc_alloc_init(FMDAVRouteController);
    v7 = (void *)qword_10002D6D8;
    qword_10002D6D8 = (uint64_t)v6;

  }
  return (id)qword_10002D6D8;
}

@end
