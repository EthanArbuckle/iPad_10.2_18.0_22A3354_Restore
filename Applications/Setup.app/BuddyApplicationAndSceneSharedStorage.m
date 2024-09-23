@implementation BuddyApplicationAndSceneSharedStorage

+ (SetupController)setupController
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v5[3];
  char v6;
  os_log_t oslog[3];

  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  if (!qword_1002EE8A0)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(a1);
    v6 = 17;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
    {
      v2 = oslog[0];
      v3 = v6;
      sub_100038C3C(v5);
      _os_log_fault_impl((void *)&_mh_execute_header, v2, v3, "setup controller does not exist", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  return (SetupController *)(id)qword_1002EE8A0;
}

+ (void)ensureSetupControllerWithFactoryBlock:(id)a3
{
  id v3;
  void *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!qword_1002EE8A0)
  {
    v3 = (id)(*((uint64_t (**)(void))location[0] + 2))();
    v4 = (void *)qword_1002EE8A0;
    qword_1002EE8A0 = (uint64_t)v3;

  }
  objc_storeStrong(location, 0);
}

@end
