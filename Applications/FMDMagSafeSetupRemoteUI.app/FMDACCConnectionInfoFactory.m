@implementation FMDACCConnectionInfoFactory

+ (BOOL)isAutomationActive
{
  id v2;
  NSObject *v3;
  _DWORD v5[2];

  if (qword_100042DA8 != -1)
    dispatch_once(&qword_100042DA8, &stru_1000358C0);
  v2 = sub_1000114EC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = byte_100042DA0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDACCConnectionInfoFactory: isAutomationActive: %d", (uint8_t *)v5, 8u);
  }

  return byte_100042DA0;
}

+ (id)connectionInfo
{
  id v2;

  if (+[FMDACCConnectionInfoFactory isAutomationActive](FMDACCConnectionInfoFactory, "isAutomationActive"))
  {
    if (qword_100042DB8 != -1)
      dispatch_once(&qword_100042DB8, &stru_1000358E0);
    v2 = (id)qword_100042DB0;
  }
  else
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance"));
  }
  return v2;
}

@end
