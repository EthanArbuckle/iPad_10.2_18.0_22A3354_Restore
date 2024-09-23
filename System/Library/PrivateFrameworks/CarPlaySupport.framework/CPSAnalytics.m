@implementation CPSAnalytics

+ (id)sharedInstance
{
  uint64_t obj;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  SEL v9;
  id v10;
  id location;
  dispatch_once_t *v12;

  v10 = a1;
  v9 = a2;
  obj = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __30__CPSAnalytics_sharedInstance__block_invoke;
  v7 = &__block_descriptor_40_e5_v8__0l;
  v8 = a1;
  v12 = (dispatch_once_t *)&sharedInstance_onceToken;
  location = 0;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance___sharedAnalytics;
}

void __30__CPSAnalytics_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedAnalytics;
  sharedInstance___sharedAnalytics = (uint64_t)v1;

}

- (BOOL)shouldRecordAnalyticsEvents
{
  return NSClassFromString(CFSTR("XCTestCase")) == 0;
}

- (void)_sendCoreAnalyticsEvent:(id)a3 withDictionary:(id)a4
{
  os_log_t oslog;
  int v6;
  id v7;
  id location[2];
  CPSAnalytics *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (-[CPSAnalytics shouldRecordAnalyticsEvents](v9, "shouldRecordAnalyticsEvents"))
  {
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)location[0]);
      _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_INFO, "Sending CA event %@", v10, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    AnalyticsSendEvent();
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)navigationStartedWithBundleIdentifier:(id)a3
{
  CPSAnalytics *v3;
  id v4;
  id location[2];
  CPSAnalytics *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v7 = CFSTR("bundleID");
  v8[0] = location[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  -[CPSAnalytics _sendCoreAnalyticsEvent:withDictionary:](v3, "_sendCoreAnalyticsEvent:withDictionary:", CFSTR("com.apple.carexperience.navigationstarted"));

  objc_storeStrong(location, 0);
}

- (void)audioAppMetadataThrottledWithBundleIdentifier:(id)a3
{
  CPSAnalytics *v3;
  id v4;
  id location[2];
  CPSAnalytics *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v7 = CFSTR("bundleID");
  v8[0] = location[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  -[CPSAnalytics _sendCoreAnalyticsEvent:withDictionary:](v3, "_sendCoreAnalyticsEvent:withDictionary:", CFSTR("com.apple.carexperience.audioTemplateThrottled"));

  objc_storeStrong(location, 0);
}

@end
