void sub_230FD0EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_230FD0EF4(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isEqualToString;
  uint64_t v11;

  v1 = *MEMORY[0x24BDF73B0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_assetState(WeakRetained, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v7, v8, HACCIconAssetStateOff, v9);

    v11 = *MEMORY[0x24BDF7430];
    if (isEqualToString)
      v11 = 0;
    v1 |= v11;
  }

  return v1;
}

id sub_230FD0F74(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_assetState(WeakRetained, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v6, v7, (uint64_t)HACCIconAssetStateSafe, v8) & 1) != 0
      || objc_msgSend_isEqualToString_(v6, v9, (uint64_t)HACCIconAssetStateWarning, v10))
    {
      hearingLocString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_230FD1168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FD11A4(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateSelectedStatus(WeakRetained, v1, v2, v3);

}

void sub_230FD11D0(uint64_t a1, char a2)
{
  id v3;
  char v4;

  objc_copyWeak(&v3, (id *)(a1 + 32));
  v4 = a2;
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v3);
}

void sub_230FD1248(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230FD125C(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_setIsLiveListenEnabled_(WeakRetained, v4, v1, v5);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend__updateSelectedStatus(v9, v6, v7, v8);

}

id sub_230FD17B0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_230FD1A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FD1A24(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  AXPerformBlockOnMainThread();

  objc_destroyWeak(&v5);
}

void sub_230FD1AC0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230FD1AD4(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_updateViewWithAudioSample_(WeakRetained, v2, *(_QWORD *)(a1 + 32), v3);

}

uint64_t AXLogAggregate()
{
  return MEMORY[0x24BE001E8]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x24BE00258]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BE00298]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t HAInitializeLogging()
{
  return MEMORY[0x24BE4BD80]();
}

uint64_t UIAccessibilityControlCenterModuleExpandPlatterHint()
{
  return MEMORY[0x24BEBAEE8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t hearingLocString()
{
  return MEMORY[0x24BE4BED8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

