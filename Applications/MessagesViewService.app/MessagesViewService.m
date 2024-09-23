void sub_100003BF4(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance"));
  objc_msgSend(v1, "_forceResumed");

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("UIDisableLegacyTextView"));

  IMSetEmbeddedTempDirectory();
  v6 = (objc_class *)objc_opt_class(MVSAppDelegate);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = UIApplicationMain(a1, a2, 0, v8);

  objc_autoreleasePoolPop(v4);
  return v9;
}

id objc_msgSend__forceResumed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_forceResumed");
}

id objc_msgSend__setBlocksConnectionAtResume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBlocksConnectionAtResume:");
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addListenerID:capabilities:");
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockUntilConnected");
}

id objc_msgSend_iMessageEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iMessageEnabled");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}
