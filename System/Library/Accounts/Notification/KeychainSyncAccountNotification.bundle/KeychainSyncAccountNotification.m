void sub_230F2FF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_230F30210(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend_allKeys(*(void **)(a1 + 32), a2, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, v21, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v7, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_event(*(void **)(a1 + 40), v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v12, v11);

      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, v21, 16);
    }
    while (v8);
  }

}

void sub_230F30344(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  id v5;

  objc_msgSend_event(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_populateUnderlyingErrorsStartingWithRootError_(v5, v4, *(_QWORD *)(a1 + 40));

}

Class sub_230F30384(uint64_t a1)
{
  Class result;

  sub_230F303F0();
  result = objc_getClass("AAFAnalyticsEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_25414BF90 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)sub_230F303F0();
  }
  return result;
}

uint64_t sub_230F303F0()
{
  uint64_t v0;
  void *v2;

  if (qword_25414BF80)
    return qword_25414BF80;
  qword_25414BF80 = _sl_dlopen();
  v0 = qword_25414BF80;
  if (!qword_25414BF80)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_230F304B0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)qword_25414BFB0;
  v7 = qword_25414BFB0;
  if (!qword_25414BFB0)
  {
    v1 = (void *)sub_230F303F0();
    v0 = (id *)dlsym(v1, "kAAFDeviceSessionId");
    v5[3] = (uint64_t)v0;
    qword_25414BFB0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_230F307AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_230F307CC(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_25414BF88)
  {
    qword_25414BF88 = _sl_dlopen();
    if (!qword_25414BF88)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AKAccountManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_25414BFA8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230F308D0()
{
  NSObject *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (!qword_25414BF88)
  {
    v1 = xmmword_24FFB5FB0;
    v2 = 0;
    qword_25414BF88 = _sl_dlopen();
  }
  if (qword_25414BF88)
  {
    byte_25414BF60 = 1;
  }
  else
  {
    secLogObjForScope();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1) = 0;
      _os_log_impl(&dword_230F2E000, v0, OS_LOG_TYPE_DEFAULT, "aafanalyticsevent-security: failed to softlink AuthKit", (uint8_t *)&v1, 2u);
    }

  }
}

void sub_230F309B4()
{
  NSObject *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (!qword_25414BF80)
  {
    v1 = xmmword_24FFB5F98;
    v2 = 0;
    qword_25414BF80 = _sl_dlopen();
  }
  if (qword_25414BF80)
  {
    byte_25414BF50 = 1;
  }
  else
  {
    secLogObjForScope();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1) = 0;
      _os_log_impl(&dword_230F2E000, v0, OS_LOG_TYPE_DEFAULT, "aafanalyticsevent-security: failed to softlink AAAFoundation", (uint8_t *)&v1, 2u);
    }

  }
}

void sub_230F30BA0(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  objc_msgSend_getEvent(*(void **)(a1 + 32), a2, a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v4, *(unsigned __int8 *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v6, (uint64_t)v5, CFSTR("didSucceed"));

  objc_msgSend_populateUnderlyingErrorsStartingWithRootError_(v12, v7, *(_QWORD *)(a1 + 40));
  objc_msgSend_rtcAnalyticsReporter(SecurityAnalyticsReporterRTC, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_(v10, v11, (uint64_t)v12);

}

void sub_230F30C34()
{
  void *v0;
  id v1;
  const char *v2;
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v0 = (void *)qword_25414BFA0;
  v17 = qword_25414BFA0;
  if (!qword_25414BFA0)
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = sub_230F30DC0;
    v12 = &unk_24FFB6038;
    v13 = &v14;
    sub_230F30DC0((uint64_t)&v9);
    v0 = (void *)v15[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v14, 8);
  objc_msgSend_analyticsTransportRTCWithClientType_clientBundleId_clientName_(v1, v2, (uint64_t)&unk_24FFB7F48, CFSTR("com.apple.securityd"), CFSTR("com.apple.aaa.dnu"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)qword_25414BF98;
  v17 = qword_25414BF98;
  if (!qword_25414BF98)
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = sub_230F30E2C;
    v12 = &unk_24FFB6038;
    v13 = &v14;
    sub_230F30E2C((uint64_t)&v9);
    v4 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  objc_msgSend_analyticsReporterWithTransport_(v5, v6, (uint64_t)v3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_25414BF78;
  qword_25414BF78 = v7;

}

void sub_230F30DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_230F30DC0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_230F30E98();
  result = objc_getClass("AAFAnalyticsTransportRTC");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_25414BFA0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)sub_230F30E2C(v3);
  }
  return result;
}

void sub_230F30E2C(uint64_t a1)
{
  sub_230F30E98();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AAFAnalyticsReporter");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_25414BF98 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    sub_230F30E98();
  }
}

void sub_230F30E98()
{
  void *v0;

  if (!qword_255EACA00)
  {
    qword_255EACA00 = _sl_dlopen();
    if (!qword_255EACA00)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

void sub_230F31B94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v3, v5, v6);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v26 = objc_msgSend_UTF8String(v7, v8, v9);
      _os_log_impl(&dword_230F2E000, v4, OS_LOG_TYPE_DEFAULT, "octagon-account: error signing in: %s", buf, 0xCu);

    }
    v10 = *(void **)(a1 + 40);
    v23 = CFSTR("octagonSignInResult");
    v24 = MEMORY[0x24BDBD1C0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)&v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addMetrics_(v10, v13, (uint64_t)v12);

    objc_msgSend_sendMetricWithEvent_success_error_(SecurityAnalyticsReporterRTC, v14, *(_QWORD *)(a1 + 40), 0, v3);
  }
  else
  {
    secLogObjForScope();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230F2E000, v15, OS_LOG_TYPE_DEFAULT, "account now signed in for octagon operation", buf, 2u);
    }

    v16 = *(void **)(a1 + 40);
    v21 = CFSTR("octagonSignInResult");
    v22 = MEMORY[0x24BDBD1C8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)&v22, &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addMetrics_(v16, v19, (uint64_t)v18);

    objc_msgSend_sendMetricWithEvent_success_error_(SecurityAnalyticsReporterRTC, v20, *(_QWORD *)(a1 + 40), 1, 0);
  }

}

void sub_230F31D84(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v3, v5, v6);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = 136315138;
      v12 = objc_msgSend_UTF8String(v7, v8, v9);
      _os_log_impl(&dword_230F2E000, v4, OS_LOG_TYPE_DEFAULT, "octagon-account: error with idms trust level change in: %s", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    secLogObjForScope();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_230F2E000, v4, OS_LOG_TYPE_DEFAULT, "informed octagon of IDMS trust level change", (uint8_t *)&v11, 2u);
    }
  }

  objc_msgSend_sendMetricWithEvent_success_error_(SecurityAnalyticsReporterRTC, v10, *(_QWORD *)(a1 + 40), v3 == 0, v3);
}

void sub_230F31ECC(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    secLogObjForScope();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v2, v4, v5);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = 136315138;
      v10 = objc_msgSend_UTF8String(v6, v7, v8);
      _os_log_impl(&dword_230F2E000, v3, OS_LOG_TYPE_DEFAULT, "octagon-account: error signing out: %s", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    secLogObjForScope();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_230F2E000, v3, OS_LOG_TYPE_DEFAULT, "signed out of octagon trust", (uint8_t *)&v9, 2u);
    }
  }

}

uint64_t OctagonSupportsPersonaMultiuser()
{
  return MEMORY[0x24BDE8538]();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return MEMORY[0x24BDE8588]();
}

uint64_t SOSCCLoggedIntoAccount()
{
  return MEMORY[0x24BDE8598]();
}

uint64_t SOSCCLoggedOutOfAccount()
{
  return MEMORY[0x24BDE85A0]();
}

uint64_t SOSCCSetCompatibilityMode()
{
  return MEMORY[0x24BDE85E8]();
}

uint64_t SOSCompatibilityModeEnabled()
{
  return MEMORY[0x24BDE8628]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t secLogObjForScope()
{
  return MEMORY[0x24BDE9568]();
}

