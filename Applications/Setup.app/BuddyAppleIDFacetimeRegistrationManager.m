@implementation BuddyAppleIDFacetimeRegistrationManager

+ (void)registerWithAllAliases
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  id v5;
  id v6;
  id location;
  uint8_t buf[7];
  os_log_type_t v9;
  os_log_t oslog[3];

  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(a1);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v9;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Register FaceTime aliases", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = objc_msgSend(sub_100193830(), "sharedInstance");
  location = objc_msgSend(v4, "candidateAliases");

  v5 = objc_msgSend(sub_100193830(), "sharedInstance");
  objc_msgSend(v5, "setSelectedAliases:", location);

  v6 = objc_msgSend(sub_100193830(), "sharedInstance");
  objc_msgSend(v6, "beginSetupWithCompletionHandler:", &stru_100284120);

  objc_storeStrong(&location, 0);
}

@end
