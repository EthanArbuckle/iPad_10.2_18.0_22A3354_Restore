void sub_231015F40(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_updateState:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "setDelegate:", 0);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 1040);
    *(_QWORD *)(v4 + 1040) = 0;

  }
  else
  {
    objc_msgSend(v2, "_updateState:", 2);
  }
}

void sub_231015FF8(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateState:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setDelegate:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1040);
  *(_QWORD *)(v2 + 1040) = 0;

}

void sub_231016138(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[127])
  {
    objc_msgSend(v2, "_updateState:", 0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v3 = v2[129];
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, &unk_24FFE23F8);
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_getFGSceneIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, &unk_24FFE2410);
    v4 = v5;
  }

}

void sub_2310161CC(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_231016244;
  v4[3] = &unk_24FFE1808;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void sub_231016244(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 1024);
  *(_QWORD *)(v2 + 1024) = 0;

}

void sub_231016594(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE719E8], "getCurrentConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE719F0], "initWithConfig:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1040);
  *(_QWORD *)(v3 + 1040) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "startPerformanceTrace");

}

void sub_2310166E4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1016) = *(int *)(a1 + 40);
  switch(*(_DWORD *)(a1 + 40))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "setSelected:", 0);
      objc_msgSend(*(id *)(a1 + 32), "buttonView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v2;
      v3 = 1;
      goto LABEL_4;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "setSelected:", 0);
      objc_msgSend(*(id *)(a1 + 32), "buttonView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v2;
      v3 = 0;
LABEL_4:
      objc_msgSend(v2, "setEnabled:", v3);
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_STATUS_PERFORMANCE_TRACE_STARTED"), &stru_24FFE1918, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setSelected:", 1);
      objc_msgSend(*(id *)(a1 + 32), "contentModuleContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE19B78], "statusUpdateWithMessage:type:", v13, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "enqueueStatusUpdate:", v6);

      objc_msgSend(*(id *)(a1 + 32), "buttonView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_STATUS_PERFORMANCE_TRACE_PROCESSING"), &stru_24FFE1918, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setSelected:", 0);
      objc_msgSend(*(id *)(a1 + 32), "contentModuleContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE19B78], "statusUpdateWithMessage:type:", v13, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "enqueueStatusUpdate:", v12);

      objc_msgSend(*(id *)(a1 + 32), "buttonView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
LABEL_7:
      objc_msgSend(v7, "setEnabled:", v9);

LABEL_8:
      break;
    default:
      return;
  }
}

void *sub_23101699C()
{
  void *result;

  result = dlopen("/AppleInternal/Library/Frameworks/TraceCart.framework/TraceCart", 2);
  if (result)
  {
    result = NSClassFromString(CFSTR("TCArtraceSession"));
    qword_255EB2410 = (uint64_t)result;
  }
  return result;
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x24BE0BB30]();
}

uint64_t CCSIsInternalInstall()
{
  return MEMORY[0x24BE199F8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

