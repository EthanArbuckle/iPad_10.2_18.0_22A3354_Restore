id sub_21AD47688(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "nextComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runWithInput:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_21AD47DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21AD47DF4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  id v9;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v9 = v3;
    if (objc_msgSend(v3, "state") == 1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v9, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v5);

    }
    else
    {
      objc_msgSend(v9, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v6, *(int *)(a1 + 64));

      v7 = (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v8 = objc_msgSend(*(id *)(a1 + 40), "count") == v7;
      v3 = v9;
      if (!v8)
        goto LABEL_8;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "fullfillWithValue:", *(_QWORD *)(a1 + 40));
    }
    v3 = v9;
  }
LABEL_8:

}

void sub_21AD47F9C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "failWithError:", v8);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_21AD4809C;
    v9[3] = &unk_24DDFFED8;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "registerCompletionBlock:", v9);

  }
}

void sub_21AD4809C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v5 = *(void **)(a1 + 32);
  if (v4 == 1)
  {
    objc_msgSend(v3, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "failWithError:", v6);
  }
  else
  {
    objc_msgSend(v3, "value");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "fullfillWithValue:", v6);
  }

}

id IMCorePipelineHelloWorldClass.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id IMCorePipelineHelloWorldClass.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMCorePipelineHelloWorldClass();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for IMCorePipelineHelloWorldClass()
{
  return objc_opt_self();
}

id IMCorePipelineHelloWorldClass.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMCorePipelineHelloWorldClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for IMCorePipelineHelloWorldClass()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IMCorePipelineHelloWorldClass.printGreeting()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x50))();
}

ValueMetadata *type metadata accessor for IMCorePipelineHelloWorld()
{
  return &type metadata for IMCorePipelineHelloWorld;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

