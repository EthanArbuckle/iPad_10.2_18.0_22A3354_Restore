void sub_1000031E8(id a1, BOOL a2)
{
  uint64_t v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  _SLLog(v2, 7);

}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v4;
  Class v5;

  v4 = *(_QWORD *)&argc;
  v5 = NSClassFromString(CFSTR("PKService"));
  if (!v5)
  {
    if (!dlopen("/System/Library/PrivateFrameworks/PlugInKit.framework/PlugInKit", 1))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000032D0();
      exit(1);
    }
    v5 = NSClassFromString(CFSTR("PKService"));
  }
  if (!v5)
    sub_100003314();
  return -[objc_class _defaultRun:arguments:](v5, "_defaultRun:arguments:", v4, argv);
}

void sub_1000032D0()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "unable to load PlugInKit.framework - aborting", v0, 2u);
}

void sub_100003314()
{
  __assert_rtn("main", "libpkstart.m", 38, "pkService");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_cancelRequestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelRequestWithError:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_completeRequestReturningItems_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeRequestReturningItems:completionHandler:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_initWithItem_typeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItem:typeIdentifier:");
}

id objc_msgSend_initWithWebClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWebClient:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setAuthFlowDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthFlowDelegate:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setNavBarTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavBarTitle:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}
