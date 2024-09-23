void sub_2310085AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_231008838(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExpanded"))
    objc_msgSend(*(id *)(a1 + 32), "_configureMenu");
  v2 = *(void **)(a1 + 32);
  if ((objc_msgSend(v2, "isExpanded") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(*(id *)(a1 + 32), "isSelected");
  objc_msgSend(v2, "setSelected:", v3);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "glyphState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlyphState:", v5);

}

void sub_231008B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_231008B78(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "toggleLowPowerMode");

  return 0;
}

uint64_t sub_231008BA8(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "toggleMobileChargeMode");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "refreshStateAnimated:", 1);

  return 0;
}

id sub_231008E24()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)qword_25414D208;
  v6 = qword_25414D208;
  if (!qword_25414D208)
  {
    v1 = (void *)sub_231009444();
    v0 = (id *)dlsym(v1, "PowerUIMCMStatusAsNotification");
    v4[3] = (uint64_t)v0;
    qword_25414D208 = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    sub_231009534();
  return *v0;
}

void sub_231008EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_231008FD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshStateAnimated:", 1);
}

void sub_2310090D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2310090F4(uint64_t a1, int a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v5 = a3;
  if (a2)
  {
    v17 = v5;
    v6 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = (id *)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_STATUS_LOW_POWER_MODE_ON"), &stru_24FFDE900, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained(v9);
      objc_msgSend(WeakRetained, "contentModuleContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BE19B78];
      v14 = v10;
      v15 = 1;
    }
    else
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_STATUS_LOW_POWER_MODE_OFF"), &stru_24FFDE900, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained(v9);
      objc_msgSend(WeakRetained, "contentModuleContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BE19B78];
      v14 = v10;
      v15 = 2;
    }
    objc_msgSend(v13, "statusUpdateWithMessage:type:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueueStatusUpdate:", v16);

    v5 = v17;
  }

}

Class sub_2310093F0(uint64_t a1)
{
  Class result;

  sub_231009444();
  result = objc_getClass("PowerUISmartChargeClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_2310095D8();
  qword_25414D210 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_231009444()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!qword_25414D200)
  {
    v2 = xmmword_24FFDE8A8;
    v3 = 0;
    qword_25414D200 = _sl_dlopen();
  }
  if (!qword_25414D200)
    sub_231009650(&v1);
  return qword_25414D200;
}

void sub_2310094EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_231009504(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2310094EC(&dword_231007000, a1, a3, "Unable to retrieve state of Mobile Charge Mode.", a5, a6, a7, a8, 0);
  sub_2310094FC();
}

void sub_231009534()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getPowerUIMCMStatusAsNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCUILowPowerModule.m"), 22, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_2310095A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2310094EC(&dword_231007000, a1, a3, "Unable to set Mobile Charge Mode.", a5, a6, a7, a8, 0);
  sub_2310094FC();
}

void sub_2310095D8()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPowerUISmartChargeClientClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CCUILowPowerModule.m"), 21, CFSTR("Unable to find class %s"), "PowerUISmartChargeClient");

  __break(1u);
}

void sub_231009650(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PowerUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCUILowPowerModule.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
  MGGetBoolAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x24BDF7228]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

