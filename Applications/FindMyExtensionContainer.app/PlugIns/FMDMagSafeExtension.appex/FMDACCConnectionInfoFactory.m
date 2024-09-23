@implementation FMDACCConnectionInfoFactory

+ (BOOL)isAutomationActive
{
  id v2;
  NSObject *v3;
  _DWORD v5[2];

  if (qword_1000312D0 != -1)
    dispatch_once(&qword_1000312D0, &stru_100024AC8);
  v2 = sub_10000430C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = byte_1000312C8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDACCConnectionInfoFactory: isAutomationActive: %d", (uint8_t *)v5, 8u);
  }

  return byte_1000312C8;
}

+ (id)connectionInfo
{
  id v2;

  if (+[FMDACCConnectionInfoFactory isAutomationActive](FMDACCConnectionInfoFactory, "isAutomationActive"))
  {
    if (qword_1000312E0 != -1)
      dispatch_once(&qword_1000312E0, &stru_100024AE8);
    v2 = (id)qword_1000312D8;
  }
  else
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance"));
  }
  return v2;
}

@end
