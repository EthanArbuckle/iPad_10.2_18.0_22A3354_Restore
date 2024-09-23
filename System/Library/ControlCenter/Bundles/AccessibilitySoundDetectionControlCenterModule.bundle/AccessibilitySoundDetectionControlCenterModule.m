uint64_t sub_230F768D4(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__initializeViewContent);
}

id sub_230F76B30(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24FFC2D20, CFSTR("Accessibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_230F76ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_230F76F08(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "soundDetectionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSoundDetectionSettings");

  return 0;
}

void sub_230F76F48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axSettingsDidChange");

}

uint64_t sub_230F77D88(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "_confirmedToggleSoundDetectionStatusForType:");
  else
    return objc_msgSend(v1, "_confirmedEnableSoundDetection:", 1);
}

uint64_t sub_230F77ED4(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "_confirmedToggleSoundDetectionStatusForCustomType:");
  else
    return objc_msgSend(v1, "_confirmedEnableSoundDetection:", 1);
}

void sub_230F79198(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x380]);
  _Unwind_Resume(a1);
}

uint64_t sub_230F79488(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF150]))
    v4 = objc_msgSend(v2, "isModelReady");
  else
    v4 = 0;

  return v4;
}

uint64_t sub_230F794F0(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFF140]))
    v4 = objc_msgSend(v2, "isModelReady");
  else
    v4 = 0;

  return v4;
}

uint64_t sub_230F79558(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF220]);

  return 0;
}

uint64_t sub_230F79594(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF258]);

  return 0;
}

uint64_t sub_230F795D0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF260]);

  return 0;
}

uint64_t sub_230F7960C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForCustomType:", *(_QWORD *)(a1 + 32));

  return 0;
}

uint64_t sub_230F79644(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF1F0]);

  return 0;
}

uint64_t sub_230F79680(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF208]);

  return 0;
}

uint64_t sub_230F796BC(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF1D0]);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF1D8]);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF1E0]);

  return 0;
}

uint64_t sub_230F7973C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF1E8]);

  return 0;
}

uint64_t sub_230F79778(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF218]);

  return 0;
}

uint64_t sub_230F797B4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF210]);

  return 0;
}

uint64_t sub_230F797F0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF230]);

  return 0;
}

uint64_t sub_230F7982C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF240]);

  return 0;
}

uint64_t sub_230F79868(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF268]);

  return 0;
}

uint64_t sub_230F798A4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForCustomType:", *(_QWORD *)(a1 + 32));

  return 0;
}

uint64_t sub_230F798DC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF200]);

  return 0;
}

uint64_t sub_230F79918(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF250]);

  return 0;
}

uint64_t sub_230F79954(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSoundDetectionStatusForType:", *MEMORY[0x24BDFF1F8]);

  return 0;
}

uint64_t AXDeviceSupportsConcurrentHPLPMics()
{
  return MEMORY[0x24BDFFFE8]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x24BDFE1F8]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE240]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

