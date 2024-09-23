void sub_100002288(id a1)
{
  qword_100008A10 = (uint64_t)os_log_create("com.apple.telephony.abm", "diagext");
}

void sub_100002390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100002424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RFSelfAuthExtensionHelper;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100002450(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100002844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_addAPTagToTicket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAPTagToTicket");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_clearRFSelfTestTicket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRFSelfTestTicket");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_ds_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ds_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_getOSLogHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOSLogHandler");
}

id objc_msgSend_getPersonalizationInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPersonalizationInfo");
}

id objc_msgSend_getSignedTicketAndStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSignedTicketAndStore:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_loadTestConfigFromUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTestConfigFromUserDefaults");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_resetAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAll");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setAddAPTagToTicket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddAPTagToTicket:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_testConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testConfiguration");
}
