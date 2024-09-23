@implementation NSXPCConnection(CPSBundleHelpers)

- (id)cp_bundleIdentifier
{
  NSObject *log;
  os_log_type_t v4;
  uint8_t v5[15];
  os_log_type_t type;
  os_log_t oslog;
  int v8;
  id location[3];
  id v10;

  location[2] = a1;
  location[1] = a2;
  location[0] = (id)objc_msgSend(a1, "valueForEntitlement:", CFSTR("application-identifier"));
  if (location[0])
  {
    v10 = _CPAppIdentifierFromTeamAppTuple(location[0]);
    v8 = 1;
  }
  else
  {
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      v4 = type;
      __os_log_helper_16_0_0(v5);
      _os_log_error_impl(&dword_21E389000, log, v4, "Unable to locate an application-identifier for the client app.", v5, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v10 = 0;
    v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v10;
}

@end
