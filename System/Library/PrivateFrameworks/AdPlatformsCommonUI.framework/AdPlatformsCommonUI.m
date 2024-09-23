void sub_227BEE434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227BEE510(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227BEE66C()
{
  APClientInfoUI *v0;
  void *v1;

  v0 = objc_alloc_init(APClientInfoUI);
  v1 = (void *)qword_253DA4DD0;
  qword_253DA4DD0 = (uint64_t)v0;

}

id sub_227BEE6DC(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDFA9B0];
  v5 = a3;
  objc_msgSend(v4, "remoteObjectInterfaceWithProtocol:", &unk_255932240);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteObjectRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerExportedObject:interface:", v5, v6);

  return v6;
}

void sub_227BEE754(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a1, "_remoteObjectRegistry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterExportedObject:interface:", a1, v5);

}

id sub_227BEE7A8(void *a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDFA9B0], "remoteObjectInterfaceWithProtocol:", &unk_2559323D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteObjectRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithInterface:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t sub_227BEE814(void *a1)
{
  uint64_t result;

  objc_msgSend(a1, "_setInputDelegate:", a1);
  objc_msgSend(a1, "_setResourceLoadDelegate:", a1);
  result = objc_msgSend(MEMORY[0x24BDFD4B8], "isAppleInternalInstall");
  if ((_DWORD)result)
    return MEMORY[0x24BEDD108](a1, sel__setObservedRenderingProgressEvents_);
  return result;
}

uint64_t sub_227BEE868()
{
  return 0;
}

void sub_227BEE870(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  sub_227BEEA70((uint64_t)APWebViewResourceLoadCAReporter, v9, v10, a6);
  if (v10)
  {
    if ((byte_25591EAF8 & 1) == 0
      && objc_msgSend(v10, "code") == -1002
      && (objc_msgSend(v10, "domain"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD1308]),
          v11,
          v12))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WebKit custom protocols were not registered. Proxy is running: %d"), *MEMORY[0x24BE022B8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      APSimulateCrash();
      byte_25591EAF8 = 1;

    }
    else
    {
      APLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "domain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v10, "code");
        objc_msgSend(v9, "originalURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "host");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141559042;
        v20 = 1752392040;
        v21 = 2048;
        v22 = a1;
        v23 = 2114;
        v24 = v15;
        v25 = 2048;
        v26 = v16;
        v27 = 2114;
        v28 = v18;
        _os_log_impl(&dword_227BED000, v14, OS_LOG_TYPE_ERROR, "WebView (%{mask.hash}p) request failed: %{public}@:%ld. Host: %{public}@", buf, 0x34u);

      }
    }
  }

}

void sub_227BEEA70(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_self();
  objc_msgSend(v6, "originalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("blob")) & 1) != 0)
  {
    objc_msgSend(v6, "originalURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resourceSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("null"));

    if ((v14 & 1) != 0)
      goto LABEL_17;
    if (!v7)
      goto LABEL_13;
  }
  else
  {

    if (!v7)
      goto LABEL_13;
  }
  if (!objc_msgSend(v7, "code"))
  {
    objc_msgSend(v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
    {
      objc_msgSend(v7, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Redirection to URL with a scheme that is not HTTP(S)")) & 1) != 0)
      {
        objc_msgSend(v6, "originalURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v9, "_isHTTPOrHTTPSURL:", v17);

        if ((v18 & 1) == 0)
          goto LABEL_17;
        goto LABEL_13;
      }

    }
  }
LABEL_13:
  v27 = -1;
  v28 = 0;
  v26 = 0;
  objc_msgSend(v9, "_parseResourceLoadResultForError:response:result:errorDomain:errorCode:", v7, v8, &v28, &v26, &v27);
  v19 = v26;
  if (v28)
  {
    v20 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_227BEECD0;
    v25[3] = &unk_24F05BB40;
    v25[4] = v28;
    objc_msgSend(MEMORY[0x24BDFD478], "sendEventLazy:eventPayloadBuilder:", CFSTR("wk.resource.result"), v25);
    if (v28 != 1)
    {
      v21 = (void *)MEMORY[0x24BDFD478];
      v22[0] = v20;
      v22[1] = 3221225472;
      v22[2] = sub_227BEED70;
      v22[3] = &unk_24F05BB68;
      v23 = v19;
      v24 = v27;
      objc_msgSend(v21, "sendEventLazy:eventPayloadBuilder:", CFSTR("wk.resource.error"), v22);

    }
  }

LABEL_17:
}

id sub_227BEECD0(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id sub_227BEED70(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), *(_QWORD *)(a1 + 40), CFSTR("domain"), CFSTR("error"), *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_227BEF098(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "normalizedEnabledInputModeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setUserKeyboards:", v2);

}

uint64_t APLogForCategory()
{
  return MEMORY[0x24BDFD458]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x24BDFD468]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x24BED3BC0]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x24BED3BE0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x24BED3BF8]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

