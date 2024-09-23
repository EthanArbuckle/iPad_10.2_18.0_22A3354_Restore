_QWORD *sub_1D7FB2C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A648);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

id SFTipsCoordinator.init()()
{
  _BYTE *v0;
  objc_class *ObjectType;
  uint64_t v2;
  _QWORD *v3;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v0[OBJC_IVAR____SFTipsCoordinator_webSearchTipAvailable] = 0;
  swift_unknownObjectWeakInit();
  v2 = OBJC_IVAR____SFTipsCoordinator_webSearchTipManager;
  type metadata accessor for WebSearchTipManager();
  v3 = (_QWORD *)swift_allocObject();
  v3[3] = 0;
  v3[4] = 0;
  v3[2] = 0;
  *(_QWORD *)&v0[v2] = v3;
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D82A2810]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D82A281C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void _s17MobileSafariSwift17SFTipsCoordinatorC14startObservingyyF_0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A470);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D7FB6EE0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v29 - v8;
  v30 = objc_msgSend((id)objc_opt_self(), sel_safari_browserDefaults);
  v10 = (void *)sub_1D7FB6EF8();
  v11 = objc_msgSend(v30, sel_BOOLForKey_, v10);

  if ((v11 & 1) != 0)
  {
    if (qword_1EDA1A460 != -1)
      swift_once();
    v12 = sub_1D7FB6D0C();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EDA1A760);
    v13 = sub_1D7FB6CF4();
    v14 = sub_1D7FB6F70();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D7FB1000, v13, v14, "Web search tip invalidated by defaults override", v15, 2u);
      MEMORY[0x1D82A287C](v15, -1, -1);
    }
LABEL_6:

    return;
  }
  v16 = *(_QWORD *)(v0 + OBJC_IVAR____SFTipsCoordinator_webSearchTipManager);
  sub_1D7FB50C0();
  sub_1D7FB6D6C();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  v18 = *MEMORY[0x1E0CE9838];
  v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  v19(v7, v3);
  v19(v9, v3);
  if (v17 == v18)
  {
    if (qword_1EDA1A460 != -1)
      swift_once();
    v20 = sub_1D7FB6D0C();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EDA1A760);
    v13 = sub_1D7FB6CF4();
    v21 = sub_1D7FB6F70();
    if (os_log_type_enabled(v13, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D7FB1000, v13, v21, "Web search tip is already invalidated", v22, 2u);
      MEMORY[0x1D82A287C](v22, -1, -1);
    }
    goto LABEL_6;
  }
  v23 = sub_1D7FB6F58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v2, 1, 1, v23);
  v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1D7FB6F40();
  swift_retain();
  v25 = sub_1D7FB6F34();
  v26 = (_QWORD *)swift_allocObject();
  v27 = MEMORY[0x1E0DF06E8];
  v26[2] = v25;
  v26[3] = v27;
  v26[4] = v24;
  swift_release();
  v28 = sub_1D7FB5C08((uint64_t)v2, (uint64_t)&unk_1F0161EF8, (uint64_t)v26);

  *(_QWORD *)(v16 + 16) = v28;
  swift_release();
}

uint64_t sub_1D7FB3364(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D7FB33A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1D7FB2C7C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1D7FB6FA0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1D7FB6FF4();
      __break(1u);
LABEL_10:
      v2 = sub_1D7FB6F10();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1D7FB7000();
    __break(1u);
LABEL_14:
    result = sub_1D7FB6FF4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

uint64_t sub_1D7FB3514(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1D7FB33A0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1D7FB61EC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1D7FB61EC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D7FB35A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D7FB35E4()
{
  uint64_t v0;

  v0 = sub_1D7FB6D0C();
  __swift_allocate_value_buffer(v0, qword_1EDA1A760);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDA1A760);
  return sub_1D7FB6D00();
}

uint64_t sub_1D7FB3650(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1D7FB6034(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1D7FB3364((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1D7FB3364((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_1D7FB6DD8();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for WebSearchTipManager()
{
  return objc_opt_self();
}

unint64_t sub_1D7FB3794()
{
  unint64_t result;

  result = qword_1EDA1A568;
  if (!qword_1EDA1A568)
  {
    result = MEMORY[0x1D82A2828](&unk_1D7FB7BC4, &type metadata for WebSearchTip);
    atomic_store(result, (unint64_t *)&qword_1EDA1A568);
  }
  return result;
}

uint64_t sub_1D7FB37D8()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A588);
  __swift_allocate_value_buffer(v0, qword_1EDA1A778);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDA1A778);
  return sub_1D7FB6EC8();
}

uint64_t sub_1D7FB38C0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EmptyClass()
{
  return objc_opt_self();
}

uint64_t sub_1D7FB38F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1D7FB390C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1D7FB700C();
  sub_1D7FB700C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_1D7FB3980;
  return sub_1D7FB6CE8();
}

uint64_t sub_1D7FB3980()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D7FB3B10(int a1, void *a2, void *a3, void *aBlock)
{
  _QWORD *v4;
  uint64_t v7;
  id v8;
  id v9;

  v4[2] = a2;
  v4[3] = a3;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_1D7FB6F04();
  v4[6] = v7;
  v8 = a2;
  v9 = a3;
  return swift_task_switch();
}

uint64_t sub_1D7FB3B7C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1D7FB700C();
  sub_1D7FB700C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_1D7FB3BF0;
  return sub_1D7FB6CE8();
}

uint64_t sub_1D7FB3BF0()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(*v1 + 16);
  v2 = *(void **)(*v1 + 24);
  v4 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v4 + 32);
  if (v0)
  {
    v6 = (void *)sub_1D7FB6CDC();

    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v4 + 32), 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

id AppDistributorWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AppDistributorWrapper.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDistributorWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for AppDistributorWrapper()
{
  return objc_opt_self();
}

id AppDistributorWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDistributorWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AppDistributorWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static AppDistributorWrapper.handlePunchout(WithBundleID:adamID:externalVersionID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v4 + 80) + *(_QWORD *)(v4 + 80));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_1D7FB3E10;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_1D7FB3E10()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D7FB3E58()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_1D7FB3E94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1D7FB3E10;
  return ((uint64_t (*)(int, void *, void *, void *))((char *)&dword_1F0161E98 + dword_1F0161E98))(v2, v3, v4, v5);
}

uint64_t sub_1D7FB3F14(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1D7FB43B4;
  return v6();
}

uint64_t sub_1D7FB3F6C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1D7FB43B4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1F0161EA8 + dword_1F0161EA8))(v2, v3, v4);
}

uint64_t sub_1D7FB3FE4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1D7FB43B4;
  return v7();
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D7FB4068(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1D7FB43B4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F0161EB8 + dword_1F0161EB8))(a1, v4, v5, v6);
}

uint64_t sub_1D7FB40EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1D7FB6F58();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D7FB6F4C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1D7FB4230(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D7FB6F1C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1D7FB4230(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A470);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D7FB4270(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1D7FB42D4;
  return v6(a1);
}

uint64_t sub_1D7FB42D4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D7FB4320()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D7FB4344(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D7FB43B4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F0161EC8 + dword_1F0161EC8))(a1, v4);
}

uint64_t SFTipsCoordinator.webSearchTipAvailable.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____SFTipsCoordinator_webSearchTipAvailable);
  swift_beginAccess();
  return *v1;
}

uint64_t SFTipsCoordinator.webSearchTipAvailable.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____SFTipsCoordinator_webSearchTipAvailable);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SFTipsCoordinator.webSearchTipAvailable.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SFTipsCoordinator.observer.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____SFTipsCoordinator_observer;
  swift_beginAccess();
  return MEMORY[0x1D82A28F4](v1);
}

uint64_t SFTipsCoordinator.observer.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*SFTipsCoordinator.observer.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SFTipsCoordinator_observer;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1D82A28F4](v5);
  return sub_1D7FB4674;
}

void sub_1D7FB4674(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id SFTipsCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SFTipsCoordinator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D7FB48F8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____SFTipsCoordinator_observer;
  swift_beginAccess();
  result = MEMORY[0x1D82A28F4](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1D7FB494C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t type metadata accessor for SFTipsCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_1D7FB49C0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1D7FB49E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v32 = a1;
  v1 = sub_1D7FB6CB8();
  v30 = *(_QWORD *)(v1 - 8);
  v31 = v1;
  MEMORY[0x1E0C80A78](v1);
  v28 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A5A0);
  v4 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  v34 = v4;
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A5A8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A5B0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A5B8);
  v29 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7FB6C40(&qword_1EDA1A5C0, &qword_1EDA1A5A8, MEMORY[0x1E0CAF898]);
  sub_1D7FB6CD0();
  swift_getKeyPath();
  sub_1D7FB6CA0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_getKeyPath();
  v17 = MEMORY[0x1E0CAF868];
  sub_1D7FB6C40(&qword_1EDA1A5C8, &qword_1EDA1A5B0, MEMORY[0x1E0CAF868]);
  sub_1D7FB6CA0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v35 = 5;
  sub_1D7FB6CC4();
  v19 = v30;
  v18 = v31;
  v20 = v28;
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v28, *MEMORY[0x1E0CAF808], v31);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A5D0);
  v22 = v32;
  v32[3] = v21;
  v22[4] = sub_1D7FB6974();
  __swift_allocate_boxed_opaque_existential_1(v22);
  sub_1D7FB6C40(&qword_1EDA1A600, &qword_1EDA1A5B8, v17);
  sub_1D7FB6C40(&qword_1EDA1A608, &qword_1EDA1A5A0, MEMORY[0x1E0CAF850]);
  v23 = v27;
  v24 = v33;
  sub_1D7FB6CAC();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v18);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v23);
}

unint64_t sub_1D7FB4D3C()
{
  return 0xD000000000000020;
}

uint64_t sub_1D7FB4D58()
{
  return sub_1D7FB6D60();
}

uint64_t sub_1D7FB4D84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A588);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1D7FB6EA4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDA1A468 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v0, (uint64_t)qword_1EDA1A778);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v8, v0);
  sub_1D7FB6DE4();
  sub_1D7FB68A8(&qword_1EDA1A590, MEMORY[0x1E0CE9488]);
  sub_1D7FB68A8(&qword_1EDA1A598, MEMORY[0x1E0CE9478]);
  sub_1D7FB6EB0();
  sub_1D7FB6DCC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v9 = sub_1D7FB6DD8();
  swift_bridgeObjectRelease();
  return v9;
}

void sub_1D7FB4F04(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x80000001D7FB77B0;
}

id sub_1D7FB4F24()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v1 = *(void **)(v0 + 24);
  if (v1)
  {
    v2 = *(id *)(v0 + 24);
  }
  else
  {
    v3 = v0;
    sub_1D7FB6D90();
    sub_1D7FB50C0();
    objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
    v4 = (void *)sub_1D7FB6D9C();
    v5 = *(void **)(v0 + 24);
    *(_QWORD *)(v3 + 24) = v4;
    v2 = v4;

    v1 = 0;
  }
  v6 = v1;
  return v2;
}

id sub_1D7FB4FC8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 32);
  if (v1)
  {
    v2 = *(id *)(v0 + 32);
  }
  else
  {
    v3 = sub_1D7FB64F4();
    v4 = *(void **)(v0 + 32);
    *(_QWORD *)(v0 + 32) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

id sub_1D7FB501C(void *a1)
{
  unsigned int v1;
  void *v2;
  char **v3;

  v1 = objc_msgSend(a1, sel_sf_usesVibrantAppearance);
  v2 = (void *)objc_opt_self();
  v3 = &selRef_systemBackgroundColor;
  if (!v1)
    v3 = &selRef_systemGroupedBackgroundColor;
  return objc_msgSend(v2, *v3);
}

uint64_t sub_1D7FB5074()
{
  uint64_t v0;

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t SFTipsCoordinator.webSearchTipViewController.getter()
{
  return sub_1D7FB5190((uint64_t (*)(void))sub_1D7FB4F24);
}

unint64_t sub_1D7FB50C0()
{
  unint64_t result;

  result = qword_1EDA1A4A8;
  if (!qword_1EDA1A4A8)
  {
    result = MEMORY[0x1D82A2828](&unk_1D7FB7BFC, &type metadata for WebSearchTip);
    atomic_store(result, (unint64_t *)&qword_1EDA1A4A8);
  }
  return result;
}

id sub_1D7FB5110(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v5;
  void *v6;

  sub_1D7FB50C0();
  v5 = a1;
  if ((sub_1D7FB6D3C() & 1) != 0)
    v6 = (void *)a3();
  else
    v6 = 0;

  return v6;
}

uint64_t SFTipsCoordinator.webSearchTipView.getter()
{
  return sub_1D7FB5190((uint64_t (*)(void))sub_1D7FB4FC8);
}

uint64_t sub_1D7FB5190(uint64_t (*a1)(void))
{
  sub_1D7FB50C0();
  if ((sub_1D7FB6D3C() & 1) != 0)
    return a1();
  else
    return 0;
}

uint64_t sub_1D7FB51E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[15] = a4;
  v5 = sub_1D7FB6D0C();
  v4[16] = v5;
  v4[17] = *(_QWORD *)(v5 - 8);
  v4[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A610);
  v4[19] = swift_task_alloc();
  v6 = sub_1D7FB6EE0();
  v4[20] = v6;
  v4[21] = *(_QWORD *)(v6 - 8);
  v4[22] = swift_task_alloc();
  v4[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A618);
  v4[24] = swift_task_alloc();
  v4[25] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A620);
  v4[26] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A628);
  v4[27] = v7;
  v4[28] = *(_QWORD *)(v7 - 8);
  v4[29] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A630);
  v4[30] = v8;
  v4[31] = *(_QWORD *)(v8 - 8);
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  v4[34] = sub_1D7FB6F40();
  v4[35] = sub_1D7FB6F34();
  v4[36] = sub_1D7FB6F1C();
  v4[37] = v9;
  return swift_task_switch();
}

uint64_t sub_1D7FB537C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 120) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1D82A28F4](v1);
  *(_QWORD *)(v0 + 304) = v2;
  if (!v2)
    goto LABEL_6;
  v3 = (void *)v2;
  v4 = v2 + OBJC_IVAR____SFTipsCoordinator_observer;
  swift_beginAccess();
  v5 = MEMORY[0x1D82A28F4](v4);
  *(_QWORD *)(v0 + 312) = v5;
  if (!v5)
  {

LABEL_6:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 232);
  v8 = *(_QWORD *)(v0 + 216);
  sub_1D7FB50C0();
  sub_1D7FB6D48();
  sub_1D7FB6FB8();
  sub_1D7FB6C40(&qword_1EDA1A638, &qword_1EDA1A618, MEMORY[0x1E0DF0848]);
  sub_1D7FB6F64();
  sub_1D7FB6FD0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  sub_1D7FB6FDC();
  *(_QWORD *)(v0 + 320) = OBJC_IVAR____SFTipsCoordinator_webSearchTipAvailable;
  swift_beginAccess();
  v9 = sub_1D7FB6F34();
  *(_QWORD *)(v0 + 328) = v9;
  if (v9)
  {
    swift_getObjectType();
    v10 = sub_1D7FB6F1C();
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  *(_QWORD *)(v0 + 336) = v10;
  *(_QWORD *)(v0 + 344) = v12;
  return swift_task_switch();
}

uint64_t sub_1D7FB55D4()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 352) = sub_1D7FB6FC4();
  sub_1D7FB6C40(&qword_1EDA1A640, &qword_1EDA1A620, MEMORY[0x1E0DF0830]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v1;
  *v1 = v0;
  v1[1] = sub_1D7FB567C;
  return sub_1D7FB6F28();
}

uint64_t sub_1D7FB567C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(uint64_t, _QWORD))(v2 + 352))(v2 + 16, 0);
  return swift_task_switch();
}

uint64_t sub_1D7FB56EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  int *v12;

  v1 = v0[20];
  v2 = v0[21];
  v3 = v0[19];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1D7FB35A8(v3, &qword_1EDA1A610);
    swift_release();
    return swift_task_switch();
  }
  else
  {
    v6 = v0[32];
    v5 = v0[33];
    v7 = v0[30];
    v8 = v0[31];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(v0[22], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    v9 = (int *)sub_1D7FB6FD0();
    v0[46] = v10;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    v12 = (int *)((char *)v9 + *v9);
    v11 = (_QWORD *)swift_task_alloc();
    v0[47] = v11;
    *v11 = v0;
    v11[1] = sub_1D7FB5900;
    return ((uint64_t (*)(_QWORD *, _QWORD))v12)(v0 + 48, v0[22]);
  }
}

uint64_t sub_1D7FB5830()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 352))(v0 + 16, 1);
}

uint64_t sub_1D7FB5840()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 304);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 240));
  swift_unknownObjectRelease();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D7FB5900()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v3 = *(_QWORD *)(*v0 + 168);
  v2 = *(_QWORD *)(*v0 + 176);
  v4 = *(_QWORD *)(*v0 + 160);
  swift_task_dealloc();
  swift_release();
  *(_BYTE *)(v1 + 385) = *(_BYTE *)(v1 + 384);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_1D7FB5984()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1D7FB59BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  if (qword_1EDA1A460 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EDA1A760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_1D7FB6CF4();
  v6 = sub_1D7FB6F70();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(unsigned __int8 *)(v0 + 385);
    v9 = *(_QWORD *)(v0 + 136);
    v8 = *(_QWORD *)(v0 + 144);
    v10 = *(_QWORD *)(v0 + 128);
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v25 = v12;
    *(_DWORD *)v11 = 136315138;
    if (v7)
      v13 = 0x6C62616C69617661;
    else
      v13 = 0x616C696176616E75;
    if (v7)
      v14 = 0xE900000000000065;
    else
      v14 = 0xEB00000000656C62;
    *(_QWORD *)(v11 + 4) = sub_1D7FB3650(v13, v14, &v25);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D7FB1000, v5, v6, "Web search tip became %s", (uint8_t *)v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D82A287C](v12, -1, -1);
    MEMORY[0x1D82A287C](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 136);
    v15 = *(_QWORD *)(v0 + 144);
    v17 = *(_QWORD *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  v18 = *(_QWORD *)(v0 + 320);
  if (*(_BYTE *)(v0 + 385) == 1)
  {
    *(_BYTE *)(*(_QWORD *)(v0 + 304) + v18) = 1;
  }
  else
  {
    v19 = *(void **)(v0 + 312);
    *(_BYTE *)(*(_QWORD *)(v0 + 304) + v18) = 0;
    objc_msgSend(v19, sel_webSearchTipDidBecomeUnavailable);
  }
  v20 = sub_1D7FB6F34();
  *(_QWORD *)(v0 + 328) = v20;
  if (v20)
  {
    swift_getObjectType();
    v21 = sub_1D7FB6F1C();
    v23 = v22;
  }
  else
  {
    v21 = 0;
    v23 = 0;
  }
  *(_QWORD *)(v0 + 336) = v21;
  *(_QWORD *)(v0 + 344) = v23;
  return swift_task_switch();
}

uint64_t sub_1D7FB5C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1D7FB6F58();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D7FB6F4C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1D7FB35A8(a1, &qword_1EDA1A470);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D7FB6F1C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

Swift::Void __swiftcall SFTipsCoordinator.invalidateWebSearchTip()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  int v12;
  int v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;

  v1 = sub_1D7FB6E44();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D7FB6EE0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v19 - v10;
  v20 = *(_QWORD *)(v0 + OBJC_IVAR____SFTipsCoordinator_webSearchTipManager);
  sub_1D7FB50C0();
  sub_1D7FB6D6C();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
  v13 = *MEMORY[0x1E0CE9838];
  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v14(v11, v5);
  if (v12 != v13)
  {
    if (qword_1EDA1A460 != -1)
      swift_once();
    v15 = sub_1D7FB6D0C();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EDA1A760);
    v16 = sub_1D7FB6CF4();
    v17 = sub_1D7FB6F70();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D7FB1000, v16, v17, "Invalidate web search tip", v18, 2u);
      MEMORY[0x1D82A287C](v18, -1, -1);
    }

    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0CE9610], v1);
    sub_1D7FB6D30();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    *(_QWORD *)(v20 + 16) = 0;
    swift_release();
  }
}

id sub_1D7FB5FE0(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_1D7FB6034(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1D7FB6F94();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1D7FB3514(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1D7FB6FAC();
  if (!v8)
  {
    sub_1D7FB6FF4();
    __break(1u);
LABEL_17:
    result = sub_1D7FB7000();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1D7FB61EC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A648);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1D7FB7000();
  __break(1u);
  return result;
}

uint64_t sub_1D7FB6338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  _QWORD v16[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A570);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A578);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A580);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1D7FB7AF0;
  v9 = sub_1D7FB6E2C();
  v10 = MEMORY[0x1E0CE95C0];
  *(_QWORD *)(v8 + 56) = v9;
  *(_QWORD *)(v8 + 64) = v10;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 32));
  sub_1D7FB6E38();
  v11 = sub_1D7FB6E14();
  v12 = MEMORY[0x1E0CE9540];
  *(_QWORD *)(v8 + 96) = v11;
  *(_QWORD *)(v8 + 104) = v12;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 72));
  sub_1D7FB6E20();
  sub_1D7FB6DF0();
  swift_bridgeObjectRelease();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x1D82A23D8](v7, v4, OpaqueTypeConformance2);
  v16[0] = v4;
  v16[1] = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v14 = sub_1D7FB6DFC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

id sub_1D7FB64F4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD aBlock[3];
  ValueMetadata *v10;
  unint64_t v11;
  uint64_t v12;

  v0 = sub_1D7FB6D24();
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)aBlock - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &type metadata for WebSearchTip;
  v11 = sub_1D7FB50C0();
  v3 = objc_allocWithZone((Class)sub_1D7FB6DB4());
  v4 = (void *)sub_1D7FB6DC0();
  v5 = objc_allocWithZone(MEMORY[0x1E0DC3658]);
  v11 = (unint64_t)sub_1D7FB501C;
  v12 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D7FB5FE0;
  v10 = (ValueMetadata *)&block_descriptor;
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, sel_initWithDynamicProvider_, v6);
  _Block_release(v6);
  swift_release();
  sub_1D7FB6DA8();
  v7 = v4;
  MEMORY[0x1D82A254C]();
  sub_1D7FB6D18();
  MEMORY[0x1D82A2558](v2);

  return v7;
}

uint64_t _s17MobileSafariSwift17SFTipsCoordinatorC030donatePerformSearchFromDefaultH18EngineWebPageEventyyF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  int v7;
  int v8;
  void (*v9)(char *, uint64_t);
  uint64_t result;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;

  v0 = sub_1D7FB6EE0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v16 - v5;
  sub_1D7FB50C0();
  sub_1D7FB6D6C();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v7 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v4, v0);
  v8 = *MEMORY[0x1E0CE9838];
  v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v4, v0);
  result = ((uint64_t (*)(char *, uint64_t))v9)(v6, v0);
  if (v7 != v8)
  {
    if (qword_1EDA1A460 != -1)
      swift_once();
    v11 = sub_1D7FB6D0C();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EDA1A760);
    v12 = sub_1D7FB6CF4();
    v13 = sub_1D7FB6F70();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D7FB1000, v12, v13, "Donate event for web search tip", v14, 2u);
      MEMORY[0x1D82A287C](v14, -1, -1);
    }

    if (qword_1EDA1A468 != -1)
      swift_once();
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A588);
    __swift_project_value_buffer(v15, (uint64_t)qword_1EDA1A778);
    return sub_1D7FB6EBC();
  }
  return result;
}

ValueMetadata *type metadata accessor for WebSearchTip()
{
  return &type metadata for WebSearchTip;
}

uint64_t sub_1D7FB685C()
{
  return MEMORY[0x1E0DEA978];
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1D7FB68A8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1D7FB6DE4();
    result = MEMORY[0x1D82A2828](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D7FB68E8()
{
  return sub_1D7FB68A8(&qword_1EDA1A590, MEMORY[0x1E0CE9488]);
}

uint64_t sub_1D7FB690C()
{
  return sub_1D7FB68A8(&qword_1EDA1A598, MEMORY[0x1E0CE9478]);
}

uint64_t sub_1D7FB6930@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1A588);
  result = sub_1D7FB6ED4();
  *a1 = result;
  return result;
}

uint64_t sub_1D7FB6964@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*(_QWORD *)result + 16);
  return result;
}

unint64_t sub_1D7FB6974()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDA1A5D8;
  if (!qword_1EDA1A5D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDA1A5D0);
    v2[0] = sub_1D7FB69F8();
    v2[1] = sub_1D7FB6C40(&qword_1EDA1A5F8, &qword_1EDA1A5A0, MEMORY[0x1E0CE9228]);
    result = MEMORY[0x1D82A2828](MEMORY[0x1E0CE9210], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDA1A5D8);
  }
  return result;
}

unint64_t sub_1D7FB69F8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1EDA1A5E0;
  if (!qword_1EDA1A5E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDA1A5B8);
    v2 = sub_1D7FB6A5C();
    result = MEMORY[0x1D82A2828](MEMORY[0x1E0CE9238], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EDA1A5E0);
  }
  return result;
}

unint64_t sub_1D7FB6A5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EDA1A5E8;
  if (!qword_1EDA1A5E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDA1A5B0);
    v2 = sub_1D7FB6C40(&qword_1EDA1A5F0, &qword_1EDA1A5A8, MEMORY[0x1E0CE9248]);
    result = MEMORY[0x1D82A2828](MEMORY[0x1E0CE9238], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EDA1A5E8);
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1D7FB6AF0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D7FB6B14()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D7FB6B40(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1D7FB3E10;
  return sub_1D7FB51E0(a1, v4, v5, v6);
}

uint64_t sub_1D7FB6BAC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D7FB6BD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D7FB3E10;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F0161F00 + dword_1F0161F00))(a1, v4);
}

uint64_t sub_1D7FB6C40(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D82A2828](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1D7FB6CA0()
{
  return MEMORY[0x1E0CAF7E8]();
}

uint64_t sub_1D7FB6CAC()
{
  return MEMORY[0x1E0CAF7F8]();
}

uint64_t sub_1D7FB6CB8()
{
  return MEMORY[0x1E0CAF818]();
}

uint64_t sub_1D7FB6CC4()
{
  return MEMORY[0x1E0CAF8A0]();
}

uint64_t sub_1D7FB6CD0()
{
  return MEMORY[0x1E0CAF8A8]();
}

uint64_t sub_1D7FB6CDC()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D7FB6CE8()
{
  return MEMORY[0x1E0CC1AE0]();
}

uint64_t sub_1D7FB6CF4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D7FB6D00()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D7FB6D0C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D7FB6D18()
{
  return MEMORY[0x1E0DC1DB0]();
}

uint64_t sub_1D7FB6D24()
{
  return MEMORY[0x1E0DC1E90]();
}

uint64_t sub_1D7FB6D30()
{
  return MEMORY[0x1E0CE9288]();
}

uint64_t sub_1D7FB6D3C()
{
  return MEMORY[0x1E0CE9298]();
}

uint64_t sub_1D7FB6D48()
{
  return MEMORY[0x1E0CE92B0]();
}

uint64_t sub_1D7FB6D54()
{
  return MEMORY[0x1E0CE92C8]();
}

uint64_t sub_1D7FB6D60()
{
  return MEMORY[0x1E0CE92E8]();
}

uint64_t sub_1D7FB6D6C()
{
  return MEMORY[0x1E0CE92F8]();
}

uint64_t sub_1D7FB6D78()
{
  return MEMORY[0x1E0CE9300]();
}

uint64_t sub_1D7FB6D84()
{
  return MEMORY[0x1E0CE9318]();
}

uint64_t sub_1D7FB6D90()
{
  return MEMORY[0x1E0CE9340]();
}

uint64_t sub_1D7FB6D9C()
{
  return MEMORY[0x1E0CE9350]();
}

uint64_t sub_1D7FB6DA8()
{
  return MEMORY[0x1E0CE9388]();
}

uint64_t sub_1D7FB6DB4()
{
  return MEMORY[0x1E0CE93A0]();
}

uint64_t sub_1D7FB6DC0()
{
  return MEMORY[0x1E0CE93C8]();
}

uint64_t sub_1D7FB6DCC()
{
  return MEMORY[0x1E0CE93F8]();
}

uint64_t sub_1D7FB6DD8()
{
  return MEMORY[0x1E0CE9430]();
}

uint64_t sub_1D7FB6DE4()
{
  return MEMORY[0x1E0CE9458]();
}

uint64_t sub_1D7FB6DF0()
{
  return MEMORY[0x1E0CE9490]();
}

uint64_t sub_1D7FB6DFC()
{
  return MEMORY[0x1E0CE94F8]();
}

uint64_t sub_1D7FB6E08()
{
  return MEMORY[0x1E0CE9510]();
}

uint64_t sub_1D7FB6E14()
{
  return MEMORY[0x1E0CE9558]();
}

uint64_t sub_1D7FB6E20()
{
  return MEMORY[0x1E0CE9570]();
}

uint64_t sub_1D7FB6E2C()
{
  return MEMORY[0x1E0CE95C8]();
}

uint64_t sub_1D7FB6E38()
{
  return MEMORY[0x1E0CE95F0]();
}

uint64_t sub_1D7FB6E44()
{
  return MEMORY[0x1E0CE9630]();
}

uint64_t sub_1D7FB6E50()
{
  return MEMORY[0x1E0CE9650]();
}

uint64_t sub_1D7FB6E5C()
{
  return MEMORY[0x1E0CE9658]();
}

uint64_t sub_1D7FB6E68()
{
  return MEMORY[0x1E0CE9670]();
}

uint64_t sub_1D7FB6E74()
{
  return MEMORY[0x1E0CE96C0]();
}

uint64_t sub_1D7FB6E80()
{
  return MEMORY[0x1E0CE96C8]();
}

uint64_t sub_1D7FB6E8C()
{
  return MEMORY[0x1E0CE96E0]();
}

uint64_t sub_1D7FB6E98()
{
  return MEMORY[0x1E0CE96E8]();
}

uint64_t sub_1D7FB6EA4()
{
  return MEMORY[0x1E0CE9740]();
}

uint64_t sub_1D7FB6EB0()
{
  return MEMORY[0x1E0CE9760]();
}

uint64_t sub_1D7FB6EBC()
{
  return MEMORY[0x1E0CE9780]();
}

uint64_t sub_1D7FB6EC8()
{
  return MEMORY[0x1E0CE9798]();
}

uint64_t sub_1D7FB6ED4()
{
  return MEMORY[0x1E0CE97C8]();
}

uint64_t sub_1D7FB6EE0()
{
  return MEMORY[0x1E0CE9858]();
}

uint64_t sub_1D7FB6EEC()
{
  return MEMORY[0x1E0CE98F0]();
}

uint64_t sub_1D7FB6EF8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D7FB6F04()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D7FB6F10()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D7FB6F1C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D7FB6F28()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_1D7FB6F34()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1D7FB6F40()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1D7FB6F4C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D7FB6F58()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D7FB6F64()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1D7FB6F70()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1D7FB6F7C()
{
  return MEMORY[0x1E0DC2FA0]();
}

uint64_t sub_1D7FB6F88()
{
  return MEMORY[0x1E0DC2FA8]();
}

uint64_t sub_1D7FB6F94()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D7FB6FA0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D7FB6FAC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D7FB6FB8()
{
  return MEMORY[0x1E0DF0C08]();
}

uint64_t sub_1D7FB6FC4()
{
  return MEMORY[0x1E0DF0C10]();
}

uint64_t sub_1D7FB6FD0()
{
  return MEMORY[0x1E0DF0C28]();
}

uint64_t sub_1D7FB6FDC()
{
  return MEMORY[0x1E0DF0C40]();
}

uint64_t sub_1D7FB6FE8()
{
  return MEMORY[0x1E0DF0C50]();
}

uint64_t sub_1D7FB6FF4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D7FB7000()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D7FB700C()
{
  return MEMORY[0x1E0CB2730]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

