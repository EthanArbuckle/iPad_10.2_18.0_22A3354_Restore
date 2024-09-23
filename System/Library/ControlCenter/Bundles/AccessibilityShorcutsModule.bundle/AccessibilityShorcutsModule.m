void sub_230F71EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;

  _Block_object_dispose(&a33, 8);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_230F71F08(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v1, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)v2, &stru_24FFC1E20, CFSTR("Accessibility"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t sub_230F71F88(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend__updateShortcutActionsIfVisible(a2, (const char *)a2, a3);
}

void sub_230F71F90(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateShortcutActionsIfVisible(WeakRetained, v1, v2);

}

void sub_230F71FBC(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateShortcutActionsIfVisible(WeakRetained, v1, v2);

}

uint64_t sub_230F720D8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateShortcutActions(*(void **)(a1 + 32), a2, a3);
}

void sub_230F72370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_230F72398(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_shortcutDelegate(WeakRetained, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openAccessibilityShortcutSettings(v4, v5, v6);

  return 0;
}

void sub_230F724FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_230F72524(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_msgSend_intValue(*(void **)(a1 + 32), v4, v5);
  objc_msgSend__toggleOption_(WeakRetained, v7, v6);

  objc_copyWeak(&v9, v2);
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v9);
  return 0;
}

void sub_230F725CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230F725E0(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateShortcutActions(WeakRetained, v1, v2);

}

uint64_t sub_230F7280C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_server(MEMORY[0x24BE005C0], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_guidedAccessEffectiveAppBundleIdentifier(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1248) = v7 == 0;

  return AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t sub_230F728A8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateShortcutActions(*(void **)(a1 + 32), a2, a3);
}

void sub_230F72A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230F72A98(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  int isEqual;

  objc_msgSend_source(a2, (const char *)a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v4, v5, *MEMORY[0x24BE00790]);

  if (isEqual)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

Class sub_230F72C10(uint64_t a1)
{
  Class result;

  if (!qword_255EAE190)
  {
    qword_255EAE190 = _sl_dlopen();
    if (!qword_255EAE190)
    {
      abort_report_np();
LABEL_6:
      sub_230F73290();
    }
  }
  result = objc_getClass("HUComfortSoundsSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  qword_255EAE188 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230F73290()
{
  abort_report_np();
  AXCurrentRootDescription();
}

uint64_t AXCurrentRootDescription()
{
  return MEMORY[0x24BDFDFA8]();
}

uint64_t AXCurrentRootLooksLikeBNI()
{
  return MEMORY[0x24BDFDFB0]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BDFE088]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE240]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

