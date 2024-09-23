uint64_t start(int a1, char **a2)
{
  return UIApplicationMain(a1, a2, 0, CFSTR("AppDelegateService"));
}

id objc_msgSend_daemonProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonProxy");
}

id objc_msgSend_localPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localPlayer");
}

id objc_msgSend_setDataUpdateDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataUpdateDelegate:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_updateFromLocalPlayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFromLocalPlayer:");
}
