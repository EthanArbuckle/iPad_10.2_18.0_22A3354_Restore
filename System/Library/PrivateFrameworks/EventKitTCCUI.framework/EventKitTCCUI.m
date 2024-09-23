id logHandle()
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global);
  return (id)logHandle_handle;
}

void __logHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)EKTCCUILogSubsystem, "factory");
  v1 = (void *)logHandle_handle;
  logHandle_handle = (uint64_t)v0;

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id EventPreviewWrapper.__allocating_init(event:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR____TtC13EventKitTCCUI19EventPreviewWrapper_event] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id EventPreviewWrapper.init(event:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR____TtC13EventKitTCCUI19EventPreviewWrapper_event] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for EventPreviewWrapper();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for EventPreviewWrapper()
{
  return objc_opt_self();
}

void __swiftcall EventPreviewWrapper.getPreviewController(forPrompt:)(UIViewController_optional *__return_ptr retstr, Swift::Bool forPrompt)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  unsigned int *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;

  v4 = sub_23A94EB28();
  v5 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569CB830);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - v11;
  v13 = *(void **)(v2 + OBJC_IVAR____TtC13EventKitTCCUI19EventPreviewWrapper_event);
  if (v13)
  {
    v14 = (unsigned int *)MEMORY[0x24BE148C0];
    if (!forPrompt)
      v14 = (unsigned int *)MEMORY[0x24BE148C8];
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *v14, v4);
    v15 = v13;
    sub_23A94EB1C();
    sub_23A94E93C((uint64_t)v12, (uint64_t)v10);
    v16 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2569CB838));
    v17 = objc_msgSend((id)sub_23A94EB34(), sel_view);
    if (v17)
    {
      v18 = v17;
      v19 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
      objc_msgSend(v18, sel_setBackgroundColor_, v19);

      sub_23A94E984((uint64_t)v12);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B85C2F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A94E93C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569CB830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A94E984(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569CB830);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id EventPreviewWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void EventPreviewWrapper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id EventPreviewWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EventPreviewWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A94EB1C()
{
  return MEMORY[0x24BE148B0]();
}

uint64_t sub_23A94EB28()
{
  return MEMORY[0x24BE148D0]();
}

uint64_t sub_23A94EB34()
{
  return MEMORY[0x24BDEF1D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

