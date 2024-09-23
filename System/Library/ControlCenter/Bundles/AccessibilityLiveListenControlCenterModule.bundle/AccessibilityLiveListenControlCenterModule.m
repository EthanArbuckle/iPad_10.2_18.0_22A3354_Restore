void sub_232BF9E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_232BF9E78(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  int v3;
  uint64_t v4;

  v1 = *MEMORY[0x24BDF73B0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isLiveListenEnabled");

  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v1;
}

void sub_232BF9ED4(uint64_t a1, char a2, double a3)
{
  id v5[2];
  char v6;

  objc_copyWeak(v5, (id *)(a1 + 32));
  v6 = a2;
  v5[1] = *(id *)&a3;
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v5);
}

void sub_232BF9F5C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232BF9F70(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  int v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsLiveListenEnabled:", v2);

  v5 = *(unsigned __int8 *)(a1 + 48);
  v6 = objc_loadWeakRetained(v3);
  v7 = (void *)MEMORY[0x24BDF6AC8];
  if (v5)
  {
    v8 = *(double *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 30.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemImageNamed:variableValue:withConfiguration:", CFSTR("mic.and.signal.meter.fill"), v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGlyphImage:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("mic.fill"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 30.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageByApplyingSymbolConfiguration:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGlyphImage:", v11);

  }
  v12 = objc_loadWeakRetained(v3);
  objc_msgSend(v12, "_updateSelectedStatus");

}

uint64_t AXLogUltron()
{
  return MEMORY[0x24BE00258]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BE00298]();
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

uint64_t liveListenStreamSelected()
{
  return MEMORY[0x24BE4BEE8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

