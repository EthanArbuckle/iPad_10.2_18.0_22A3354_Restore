void sub_231021B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_231021B88(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_231021C2C;
  v5[3] = &unk_24FFE3C68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void sub_231021C2C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateMenuItemsWithDate:", *(_QWORD *)(a1 + 32));

}

void sub_23102215C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

uint64_t sub_2310221B4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_turnOnSpokenMessages");
    objc_msgSend(v2, "_refreshState");
  }

  return 1;
}

uint64_t sub_2310221F4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_muteSpokenMessages");
    objc_msgSend(v2, "_refreshState");
  }

  return 1;
}

uint64_t sub_231022234(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_turnOffSpokenMessagesForTheDay");
    objc_msgSend(v2, "_refreshState");
  }

  return 1;
}

void sub_2310229D0(uint64_t a1, char a2)
{
  _QWORD v4[5];
  id v5;
  char v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_231022A70;
  v4[3] = &unk_24FFE3CE0;
  v6 = a2;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void sub_231022A70(uint64_t a1)
{
  _BOOL8 v2;
  id WeakRetained;

  v2 = !*(_BYTE *)(a1 + 48)
    && objc_msgSend(*(id *)(a1 + 32), "isDeviceInEligibleAnnounceNotificationsConfiguration")
    && objc_msgSend(*(id *)(a1 + 32), "contentRenderingMode") != 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_refreshStateWithSelected:expanded:", v2, objc_msgSend(*(id *)(a1 + 32), "isExpanded"));

}

uint64_t sub_231022CCC(uint64_t a1)
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

void sub_231022EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_231022EC8(uint64_t a1, char a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if ((a2 & 1) != 0)
    objc_msgSend(WeakRetained, "_turnOnSpokenMessages");
  else
    objc_msgSend(WeakRetained, "_turnOffSpokenMessagesForTheDay");

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "_refreshState");

}

uint64_t sub_231022FFC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMenuItems");
}

void sub_23102326C(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_fetchAnnounceSettingsAndRefreshState");
    WeakRetained = v2;
  }

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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

