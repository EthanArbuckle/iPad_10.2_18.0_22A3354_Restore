void sub_100001724(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  if (!a2)
  {
    v5 = sub_100001F00();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100002040();

  }
}

void sub_100001EDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100001F00()
{
  if (qword_100008D18 != -1)
    dispatch_once(&qword_100008D18, &stru_1000041C0);
  return (id)qword_100008D10;
}

void sub_100001F40(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.calls.FaceTimeLinkTrampoline", "Default");
  v2 = (void *)qword_100008D10;
  qword_100008D10 = (uint64_t)v1;

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(FLTAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_100001FE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001EF4();
  sub_100001EDC((void *)&_mh_execute_header, v0, v1, "Could not make record for InCallService: %@", v2, v3, v4, v5, v6);
  sub_100001EEC();
}

void sub_100002040()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001EF4();
  sub_100001EDC((void *)&_mh_execute_header, v0, v1, "Could not bounce activity to InCallService: %@", v2, v3, v4, v5, v6);
  sub_100001EEC();
}

void sub_1000020A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001EF4();
  sub_100001EDC((void *)&_mh_execute_header, v0, v1, "Could not bounce openURL to InCallService: %@", v2, v3, v4, v5, v6);
  sub_100001EEC();
}

void sub_100002100()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001EF4();
  sub_100001EDC((void *)&_mh_execute_header, v0, v1, "Malformed conversation link: %@", v2, v3, v4, v5, v6);
  sub_100001EEC();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_conversationHandoffEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationHandoffEnabled");
}

id objc_msgSend_conversationLinkForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationLinkForURL:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureFlags");
}

id objc_msgSend_ftAppDeletionEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ftAppDeletionEnabled");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFaceTimeApplicationInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFaceTimeApplicationInstalled");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_openUserActivity_usingApplicationRecord_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openUserActivity:usingApplicationRecord:configuration:completionHandler:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_transferUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transferUserActivity:");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webpageURL");
}
