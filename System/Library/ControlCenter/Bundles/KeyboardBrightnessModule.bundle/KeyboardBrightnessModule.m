uint64_t sub_231005404(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a2, sel_performSelectorOnMainThread_withObject_waitUntilDone_, sel_hardwareKeyboardAvailabilityChanged, 0, 0);
}

void sub_231005608(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2310056AC;
  v6[3] = &unk_24FFDDC48;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v8);
}

void sub_2310056AC(uint64_t a1)
{
  id WeakRetained;
  char isKindOfClass;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isTracking;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v19 = WeakRetained;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    WeakRetained = v19;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_sliderView(v19, (const char *)v19, v4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      isTracking = objc_msgSend_isTracking(v7, v8, v9, v10, v11);

      WeakRetained = v19;
      if ((isTracking & 1) == 0)
      {
        objc_msgSend_floatValue(*(void **)(a1 + 32), (const char *)v19, v13, v14, v15);
        objc_msgSend_updateControlsForValue_animated_(v19, v16, 1, v17, v18);
        WeakRetained = v19;
      }
    }
  }

}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x24BE3D5A8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

