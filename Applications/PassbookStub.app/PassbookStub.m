int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;

  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(AppDelegate);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, v8);

  objc_autoreleasePoolPop(v5);
  return (int)argv;
}

void sub_100005770(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t Object;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    Object = PKLogFacilityTypeGetObject(0);
    v8 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to open url %@ with error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void sub_100005A78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t Object;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    Object = PKLogFacilityTypeGetObject(0);
    v8 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to re-direct url: %@ to Safari with error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__componentsForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_componentsForURL:");
}

id objc_msgSend__handleIssuerBindingRequestWithIssuerData_signature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleIssuerBindingRequestWithIssuerData:signature:");
}

id objc_msgSend__handleURLWithHost_components_path_query_supportedHosts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleURLWithHost:components:path:query:supportedHosts:");
}

id objc_msgSend__handleUniversalLinkWithUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleUniversalLinkWithUserActivity:");
}

id objc_msgSend__openURLInSafari_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openURLInSafari:");
}

id objc_msgSend__prefsURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prefsURL");
}

id objc_msgSend__prefsURLWithHost_path_query_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prefsURLWithHost:path:query:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fragment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fragment");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_presentIssuerBindingFlowForIssuerData_signature_orientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentIssuerBindingFlowForIssuerData:signature:orientation:");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "query");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_setSensitive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSensitive:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windows");
}
