uint64_t sub_23101C5FC(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "refreshState");
  objc_msgSend(*(id *)(a1 + 32), "configureMenuItems");
  result = objc_msgSend(*(id *)(a1 + 32), "isExpanded");
  if ((result & 1) == 0)
    return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_updateStatusMessage);
  return result;
}

uint64_t sub_23101C6FC(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setSelected:", 0);
    v4 = *(void **)(a1 + 32);
  }
  else
  {
    objc_msgSend(v3, "setSelected:", *(unsigned __int8 *)(a1 + 41));
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "isSelected");
    v4 = v5;
  }
  return MEMORY[0x24BEDD108](v4, sel_setGlyphState_);
}

void sub_23101C838(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "contentModuleContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19B78], "statusUpdateWithMessage:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueStatusUpdate:", v2);

}

void sub_23101C924(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[156], "dismissModule");
    WeakRetained = v2;
  }

}

uint64_t sub_23101CA04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_23101CB7C(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    shcore_log_object();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_23101B000, v6, OS_LOG_TYPE_ERROR, "Failed to access Shazam, %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_23101CF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_23101CF94(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissModule");
  objc_msgSend(WeakRetained, "toggleManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleRecognitionState");

  return 0;
}

void sub_23101D0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_23101D0F8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissModule");
  objc_msgSend(WeakRetained, "presentHistoryWithAuthentication");

  return 0;
}

void sub_23101D1BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23101D1D8(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_23101D258;
    v5[3] = &unk_24FFE2AE0;
    v5[4] = WeakRetained;
    objc_msgSend(WeakRetained, "requestAuthenticationIfShazamIsInstalledAndProtected:", v5);
  }
  else
  {
    objc_msgSend(WeakRetained, "dismissModule");
  }

}

uint64_t sub_23101D258(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return MEMORY[0x24BEDD108](MEMORY[0x24BDE97F0], sel__presentMediaLibraryWithCompletionHandler_);
  else
    return objc_msgSend(*(id *)(a1 + 32), "dismissModule");
}

void sub_23101D278(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    shcore_log_object();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_23101B000, v3, OS_LOG_TYPE_ERROR, "Failed to present Shazam Library with error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x24BDB6988](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

uint64_t shcore_log_object()
{
  return MEMORY[0x24BE905B8]();
}

