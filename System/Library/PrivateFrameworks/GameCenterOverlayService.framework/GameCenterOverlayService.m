uint64_t sub_23C950630()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = v0;
  return swift_task_switch();
}

uint64_t sub_23C950648()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  void *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper);
  *(_QWORD *)(v0 + 64) = v1;
  if (v1)
  {
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_23C950774;
    return sub_23C953C8C(v0 + 16, 0);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_23C950F54(v0 + 16, &qword_256BD55E8);
    if (qword_256BD5588 != -1)
      swift_once();
    v4 = sub_23C95A588();
    __swift_project_value_buffer(v4, (uint64_t)qword_256BD5BC8);
    v5 = (void *)sub_23C95A570();
    v6 = sub_23C95A654();
    if (OUTLINED_FUNCTION_9(v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_12() = 0;
      OUTLINED_FUNCTION_7(&dword_23C94E000, v7, v8, "Failed to create GameOverlayUI Multiplayer Remote Proxy");
      OUTLINED_FUNCTION_8();
    }

    return OUTLINED_FUNCTION_2(0, *(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_23C950774()
{
  swift_task_dealloc();
  swift_release();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C9507C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(v0 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD55F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v1 = *(_QWORD *)(v0 + 48);
      return OUTLINED_FUNCTION_2(v1, *(uint64_t (**)(void))(v0 + 8));
    }
  }
  else
  {
    sub_23C950F54(v0 + 16, &qword_256BD55E8);
  }
  if (qword_256BD5588 != -1)
    swift_once();
  v2 = sub_23C95A588();
  __swift_project_value_buffer(v2, (uint64_t)qword_256BD5BC8);
  v3 = (void *)sub_23C95A570();
  v4 = sub_23C95A654();
  if (OUTLINED_FUNCTION_9(v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_12() = 0;
    OUTLINED_FUNCTION_7(&dword_23C94E000, v5, v6, "Failed to create GameOverlayUI Multiplayer Remote Proxy");
    OUTLINED_FUNCTION_8();
  }

  v1 = 0;
  return OUTLINED_FUNCTION_2(v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C9508C4()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23C95A630();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  v4 = (_QWORD *)OUTLINED_FUNCTION_10();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v0;
  v5 = OUTLINED_FUNCTION_11((uint64_t)v2);
  v6 = v0;
  if (v5 == 1)
  {
    sub_23C950F54((uint64_t)v2, &qword_256BD5590);
    v7 = 0;
    v8 = 0;
  }
  else
  {
    sub_23C95A624();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
    if (v4[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v7 = sub_23C95A60C();
      v8 = v9;
      swift_unknownObjectRelease();
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
  }
  v10 = OUTLINED_FUNCTION_10();
  *(_QWORD *)(v10 + 16) = &unk_256BD55A0;
  *(_QWORD *)(v10 + 24) = v4;
  if (v8 | v7)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v7;
    v12[3] = v8;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_23C950A74()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23C950ABC;
  return sub_23C950630();
}

uint64_t sub_23C950ABC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 24) = a1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C950B10()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
  {
    objc_msgSend(*(id *)(v0 + 24), sel_showMultiplayerUI);
    swift_unknownObjectRelease();
  }
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C950B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23C95A630();
  if (OUTLINED_FUNCTION_11(a1) == 1)
  {
    sub_23C950F54(a1, &qword_256BD5590);
  }
  else
  {
    sub_23C95A624();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23C95A60C();
    swift_unknownObjectRelease();
  }
  v7 = OUTLINED_FUNCTION_10();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242626824]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23C950CD4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23C950D00()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23C950D6C;
  return sub_23C950A74();
}

uint64_t sub_23C950D6C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

char *MultiplayerClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  objc_class *v1;
  id v3;
  char v5;

  v3 = objc_allocWithZone(v1);
  v5 = *a1;
  return ClientProxy.init(serviceKind:)(&v5);
}

char *MultiplayerClientProxy.init(serviceKind:)(char *a1)
{
  char v2;

  v2 = *a1;
  return ClientProxy.init(serviceKind:)(&v2);
}

id MultiplayerClientProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MultiplayerClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23C950E34(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23C950E98;
  return v6(a1);
}

uint64_t sub_23C950E98()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C950EC0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3(v1);
  return OUTLINED_FUNCTION_1(v2, v3, v4, v5);
}

uint64_t type metadata accessor for MultiplayerClientProxy()
{
  return objc_opt_self();
}

uint64_t method lookup function for MultiplayerClientProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MultiplayerClientProxy.showMultiplayerUI()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t sub_23C950F54(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23C950FA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C950FCC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3(v1);
  return OUTLINED_FUNCTION_1(v2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void OUTLINED_FUNCTION_8()
{
  JUMPOUT(0x2426268A8);
}

BOOL OUTLINED_FUNCTION_9(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_slowAlloc();
}

void sub_23C9510EC()
{
  swift_unknownObjectRetain();
  sub_23C951158();
}

uint64_t sub_23C951114()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate;
  OUTLINED_FUNCTION_10_0();
  return MEMORY[0x242626920](v1);
}

void sub_23C951158()
{
  OUTLINED_FUNCTION_10_0();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_14();
}

void (*sub_23C9511A4(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_10_0();
  v3[3] = MEMORY[0x242626920](v5);
  return sub_23C951210;
}

void sub_23C951210(void **a1, char a2)
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
    OUTLINED_FUNCTION_7_0();
  }
  free(v3);
}

uint64_t sub_23C951278()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = v0;
  return swift_task_switch();
}

uint64_t sub_23C951290()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  void *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper);
  *(_QWORD *)(v0 + 64) = v1;
  if (v1)
  {
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_23C9513B4;
    return sub_23C953C8C(v0 + 16, 0);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_23C951B7C(v0 + 16);
    if (qword_256BD5588 != -1)
      swift_once();
    v4 = sub_23C95A588();
    __swift_project_value_buffer(v4, (uint64_t)qword_256BD5BC8);
    v5 = (void *)sub_23C95A570();
    v6 = sub_23C95A654();
    if (OUTLINED_FUNCTION_9(v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_12() = 0;
      OUTLINED_FUNCTION_7(&dword_23C94E000, v7, v8, "Failed to create GameOverlayUI Authentication Remote Proxy");
      OUTLINED_FUNCTION_8();
    }

    return OUTLINED_FUNCTION_2(0, *(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_23C9513B4()
{
  OUTLINED_FUNCTION_6();
  swift_release();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C9513FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(v0 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5658);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v1 = *(_QWORD *)(v0 + 48);
      return OUTLINED_FUNCTION_2(v1, *(uint64_t (**)(void))(v0 + 8));
    }
  }
  else
  {
    sub_23C951B7C(v0 + 16);
  }
  if (qword_256BD5588 != -1)
    swift_once();
  v2 = sub_23C95A588();
  __swift_project_value_buffer(v2, (uint64_t)qword_256BD5BC8);
  v3 = (void *)sub_23C95A570();
  v4 = sub_23C95A654();
  if (OUTLINED_FUNCTION_9(v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_12() = 0;
    OUTLINED_FUNCTION_7(&dword_23C94E000, v5, v6, "Failed to create GameOverlayUI Authentication Remote Proxy");
    OUTLINED_FUNCTION_8();
  }

  v1 = 0;
  return OUTLINED_FUNCTION_2(v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C9514F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23C951694(a1, a2, a3, a4, (uint64_t)&unk_250D94DF8, (uint64_t)&unk_256BD5610);
}

uint64_t sub_23C951504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;

  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a5;
  v8[3] = a6;
  v9 = (_QWORD *)swift_task_alloc();
  v8[6] = v9;
  *v9 = v8;
  v9[1] = sub_23C951554;
  return sub_23C951278();
}

uint64_t sub_23C951554(uint64_t a1)
{
  OUTLINED_FUNCTION_1_0(a1);
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C951584()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(v1 + 56))
  {
    v2 = OUTLINED_FUNCTION_13();
    v3 = (void *)v2;
    if (v0)
    {
      v2 = sub_23C95A5B8();
      v0 = (void *)v2;
    }
    OUTLINED_FUNCTION_8_0(v2, sel_presentOnboardingFlowWithGameBundleID_sceneIdentifier_);

    OUTLINED_FUNCTION_7_0();
  }
  return OUTLINED_FUNCTION_4_0(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23C9515E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_9_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2_0(v1);
  return sub_23C951504(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23C951644()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C951680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23C951694(a1, a2, a3, a4, (uint64_t)&unk_250D94E20, (uint64_t)&unk_256BD5620);
}

uint64_t sub_23C951694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23C95A630();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v6;
  v15[5] = a1;
  v15[6] = a2;
  v15[7] = a3;
  v15[8] = a4;
  swift_bridgeObjectRetain();
  v16 = v6;
  swift_bridgeObjectRetain();
  sub_23C950B50((uint64_t)v13, a6, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_23C951780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;

  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a5;
  v8[3] = a6;
  v9 = (_QWORD *)swift_task_alloc();
  v8[6] = v9;
  *v9 = v8;
  v9[1] = sub_23C9517D0;
  return sub_23C951278();
}

uint64_t sub_23C9517D0(uint64_t a1)
{
  OUTLINED_FUNCTION_1_0(a1);
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C951800()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(v1 + 56))
  {
    v2 = OUTLINED_FUNCTION_13();
    v3 = (void *)v2;
    if (v0)
    {
      v2 = sub_23C95A5B8();
      v0 = (void *)v2;
    }
    OUTLINED_FUNCTION_8_0(v2, sel_presentActivitySharingRepromptWithRecipientName_sceneIdentifier_);

    OUTLINED_FUNCTION_7_0();
  }
  return OUTLINED_FUNCTION_4_0(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C95189C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_9_0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2_0(v1);
  return sub_23C951780(v2, v3, v4, v5, v6, v7, v8, v9);
}

char *AuthenticationClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AuthenticationClientProxy.init(serviceKind:)(a1);
}

char *AuthenticationClientProxy.init(serviceKind:)(char *a1)
{
  char v1;
  char v3;

  v1 = *a1;
  swift_unknownObjectWeakInit();
  v3 = v1;
  return ClientProxy.init(serviceKind:)(&v3);
}

uint64_t sub_23C951970()
{
  uint64_t v0;

  return sub_23C951B58(v0 + OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate);
}

id AuthenticationClientProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthenticationClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AuthenticationClientProxy()
{
  return objc_opt_self();
}

Swift::Void __swiftcall AuthenticationClientProxy.didFinishOnboarding(error:)(NSError_optional *error)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v3 = v1 + OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate;
  OUTLINED_FUNCTION_10_0();
  v4 = (void *)MEMORY[0x242626920](v3);
  if (v4)
  {
    objc_msgSend(v4, sel_didFinishOnboardingWithError_, error);
    OUTLINED_FUNCTION_7_0();
  }
  OUTLINED_FUNCTION_14();
}

uint64_t sub_23C951A3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23C951114();
  *a1 = result;
  return result;
}

uint64_t method lookup function for AuthenticationClientProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AuthenticationClientProxy.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AuthenticationClientProxy.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AuthenticationClientProxy.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AuthenticationClientProxy.presentOnboardingFlow(gameBundleID:sceneIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AuthenticationClientProxy.presentActivitySharingReprompt(recipientName:sceneIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t sub_23C951B58(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_23C951B7C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD55E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v3 + 56) = a1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_2_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_6()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_unknownObjectRelease();
}

id OUTLINED_FUNCTION_8_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  return objc_msgSend(v3, a2, v2, v4);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_23C95A5B8();
}

char *ClientProxy.init(serviceKind:)(char *a1)
{
  _BYTE *v1;
  char v2;
  _QWORD *v3;
  id v4;
  uint64_t v5;
  char *v6;
  objc_super v8;

  v2 = *a1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper] = 0;
  v3 = &v1[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler];
  *v3 = 0;
  v3[1] = 0;
  v1[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_kind] = v2;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ClientProxy();
  v4 = objc_msgSendSuper2(&v8, sel_init);
  type metadata accessor for ClientProxy.ConnectionHelper();
  v5 = swift_allocObject();
  v6 = (char *)v4;
  sub_23C95217C(v6);
  *(_QWORD *)&v6[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper] = v5;
  swift_release();
  return v6;
}

uint64_t type metadata accessor for ClientProxy()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ClientProxy.ConnectionHelper()
{
  return objc_opt_self();
}

uint64_t sub_23C951D68()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler);
  OUTLINED_FUNCTION_10_0();
  v2 = *v1;
  sub_23C9521C0(*v1);
  return v2;
}

void sub_23C951DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler);
  OUTLINED_FUNCTION_10_0();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  sub_23C9521D0(v6);
  OUTLINED_FUNCTION_19();
}

uint64_t (*sub_23C951E08())()
{
  OUTLINED_FUNCTION_10_0();
  return j__swift_endAccess;
}

id sub_23C951E4C(uint64_t a1)
{
  OUTLINED_FUNCTION_26(a1, &qword_256BD5938);
  if (qword_256BD5580 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23C952034();
}

_QWORD *sub_23C951EE4()
{
  _QWORD *result;

  type metadata accessor for GameOverlayUIConfig.SharedResources();
  swift_allocObject();
  result = GameOverlayUIConfig.SharedResources.init()();
  qword_256BD5BC0 = (uint64_t)result;
  return result;
}

void sub_23C951F20()
{
  strcpy((char *)&qword_256BD5660, "BasicAngelIPC");
  *(_WORD *)&algn_256BD5668[6] = -4864;
}

uint64_t sub_23C951F50@<X0>(void (**a1)()@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)();

  result = sub_23C951D68();
  if (result)
  {
    v4 = result;
    v5 = v3;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    *(_QWORD *)(result + 24) = v5;
    v6 = sub_23C95422C;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (void (*)())result;
  return result;
}

void sub_23C951FB4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_23C95422C;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_23C9521C0(v1);
  sub_23C951DBC((uint64_t)v4, v3);
}

id sub_23C952034()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)sub_23C95A5B8();
  swift_bridgeObjectRelease();
  v1 = (void *)sub_23C95A5B8();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_attributeWithDomain_name_, v0, v1);

  return v2;
}

void sub_23C9520C4()
{
  char *v0;
  char *v1;

  *(_QWORD *)&v0[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper] = 0;
  v1 = &v0[OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;

  sub_23C95A6FC();
  __break(1u);
}

void ClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  ClientProxy.init(serviceKind:)(a1);
  OUTLINED_FUNCTION_17();
}

void sub_23C95217C(void *a1)
{
  uint64_t v1;

  swift_defaultActor_initialize();
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v1 + 120) = 0;
  *(_QWORD *)(v1 + 128) = 0;
  *(_BYTE *)(v1 + 136) = 0;
  swift_unknownObjectWeakAssign();

  OUTLINED_FUNCTION_17();
}

uint64_t sub_23C9521C0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23C9521D0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23C9521E0(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 108) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  *(_QWORD *)(v2 + 56) = swift_task_alloc();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C952238()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t (*v19)();
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;

  v1 = MEMORY[0x242626920](*(_QWORD *)(v0 + 48) + 112);
  *(_QWORD *)(v0 + 64) = v1;
  if (!v1)
  {
    if (qword_256BD5588 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_8_1();
    v7 = __swift_project_value_buffer(v6, (uint64_t)qword_256BD5BC8);
    sub_23C95A570();
    v8 = OUTLINED_FUNCTION_13_0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23C94E000, v7, v8, "Connection helper unexpectedly has a nil client proxy", v9, 2u);
      OUTLINED_FUNCTION_0_0();
    }

    goto LABEL_11;
  }
  v2 = (void *)v1;
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(void **)(v3 + 120);
  if (v4 && *(_BYTE *)(v3 + 136) == 1)
  {
    v5 = v4;
    if (objc_msgSend(v5, sel_remoteTarget))
    {
      sub_23C95A6A8();

      swift_unknownObjectRelease();
      sub_23C954194(v0 + 16, &qword_256BD55E8);
LABEL_11:
      OUTLINED_FUNCTION_18();
      return OUTLINED_FUNCTION_11_0(*(uint64_t (**)(void))(v0 + 8));
    }

    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_23C954194(v0 + 16, &qword_256BD55E8);
  }
  if (qword_256BD5588 != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_8_1();
  __swift_project_value_buffer(v11, (uint64_t)qword_256BD5BC8);
  OUTLINED_FUNCTION_22();
  v12 = sub_23C95A570();
  v13 = sub_23C95A648();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_6_0();
    *(_DWORD *)v14 = 67109120;
    *(_DWORD *)(v0 + 104) = *(_QWORD *)(v3 + 120) == 0;
    sub_23C95A690();
    swift_release();
    _os_log_impl(&dword_23C94E000, v12, v13, "Connection helper start setting up connection. is connection nil %{BOOL}d", v14, 8u);
    OUTLINED_FUNCTION_0_0();
  }
  swift_release();

  v15 = *(_QWORD *)(v0 + 48);
  objc_msgSend(*(id *)(v3 + 120), sel_invalidate);
  v16 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = 0;

  v17 = *(_QWORD *)(v15 + 128);
  *(_QWORD *)(v0 + 72) = v17;
  if (v17)
  {
    OUTLINED_FUNCTION_22();
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5880);
    v19 = sub_23C952610;
  }
  else
  {
    v21 = *(_QWORD *)(v0 + 48);
    v20 = *(_QWORD *)(v0 + 56);
    v22 = *(_BYTE *)(v0 + 108);
    v23 = sub_23C95A630();
    OUTLINED_FUNCTION_20(v20, v24, v25, v23);
    v26 = sub_23C9540A8();
    v27 = OUTLINED_FUNCTION_10();
    *(_QWORD *)(v27 + 16) = v21;
    *(_QWORD *)(v27 + 24) = v26;
    *(_BYTE *)(v27 + 32) = v22;
    *(_QWORD *)(v27 + 40) = v2;
    *(_QWORD *)(v27 + 48) = v21;
    swift_retain_n();
    v28 = v2;
    *(_QWORD *)(v15 + 128) = sub_23C953ADC(v20, (uint64_t)&unk_256BD5878, v27);
    swift_release();
    v29 = *(_QWORD *)(v15 + 128);
    *(_QWORD *)(v0 + 88) = v29;
    if (!v29)
    {

      OUTLINED_FUNCTION_7_1();
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_22();
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5880);
    v19 = sub_23C9526AC;
  }
  *v18 = v0;
  v18[1] = v19;
  return sub_23C95A63C();
}

uint64_t sub_23C952610()
{
  void *v0;
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  OUTLINED_FUNCTION_25(&v3);
  if (v0)

  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_23C952668()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);

  OUTLINED_FUNCTION_23();
  *(_QWORD *)(v1 + 128) = 0;
  swift_release();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_11_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C9526AC()
{
  void *v0;
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  OUTLINED_FUNCTION_25(&v3);
  if (v0)
  {

    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_23C952728()
{
  uint64_t v0;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C952760()
{
  uint64_t v0;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C952790(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 88) = a5;
  *(_QWORD *)(v6 + 96) = a6;
  *(_BYTE *)(v6 + 178) = a4;
  return swift_task_switch();
}

uint64_t sub_23C9527AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  if (*(_BYTE *)(v0 + 178) == 1)
    __asm { BR              X10 }
  v1 = *(_QWORD *)(v0 + 88);
  sub_23C9540A8();
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5888);
  *v3 = v0;
  v3[1] = sub_23C952B50;
  return sub_23C95A720();
}

void sub_23C952ADC()
{
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_23C952B50()
{
  OUTLINED_FUNCTION_6();
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_23C952B98()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  os_log_type_t v10;
  BOOL v11;
  void *v12;
  _DWORD *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  id v21;

  v1 = *(void **)(v0 + 64);
  if (!v1)
  {
    if (qword_256BD5588 != -1)
      swift_once();
    v6 = *(void **)(v0 + 88);
    v7 = OUTLINED_FUNCTION_8_1();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_256BD5BC8);
    v9 = v6;
    sub_23C95A570();
    v10 = OUTLINED_FUNCTION_13_0();
    v11 = os_log_type_enabled(v8, v10);
    v12 = *(void **)(v0 + 88);
    if (v11)
    {
      v13 = (_DWORD *)OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_6_0();
      *v13 = 136315138;
      __asm { BR              X10 }
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_QWORD *)(v0 + 120) = v1;
  *(_QWORD *)(v0 + 128) = v1;
  v2 = v1;
  v3 = objc_msgSend((id)objc_opt_self(), sel_connectionWithEndpoint_, v2);
  *(_QWORD *)(v0 + 136) = v3;
  if (!v3)
  {
    if (qword_256BD5588 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_8_1();
    v15 = __swift_project_value_buffer(v14, (uint64_t)qword_256BD5BC8);
    v16 = v2;
    v17 = v15;
    sub_23C95A570();
    v18 = OUTLINED_FUNCTION_13_0();
    if (os_log_type_enabled(v15, v18))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      v20 = (_QWORD *)OUTLINED_FUNCTION_6_0();
      *(_DWORD *)v19 = 138412290;
      *(_QWORD *)(v0 + 80) = v16;
      v21 = v16;
      sub_23C95A690();
      *v20 = v1;

      OUTLINED_FUNCTION_16(&dword_23C94E000, v17, v18, "Could not create connection with endpoint: %@", v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5890);
      OUTLINED_FUNCTION_14_0();
      OUTLINED_FUNCTION_0_0();
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (qword_256BD5578 != -1)
    swift_once();
  v4 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 144) = qword_256BD5BC0;
  LOBYTE(v4) = *(_BYTE *)(v4 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_kind);
  *(_BYTE *)(v0 + 179) = v4;
  *(_BYTE *)(v0 + 176) = v4;
  return swift_task_switch();
}

uint64_t sub_23C952F8C()
{
  uint64_t v0;
  uint64_t v1;

  sub_23C959620(v0 + 176);
  *(_QWORD *)(v0 + 152) = v1;
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_23C952FC8()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 179);
  *(_QWORD *)(v0 + 160) = qword_256BD5BC0;
  *(_BYTE *)(v0 + 177) = v1;
  return swift_task_switch();
}

uint64_t sub_23C952FEC()
{
  uint64_t v0;
  uint64_t v1;

  sub_23C959B0C(v0 + 177);
  *(_QWORD *)(v0 + 168) = v1;
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_23C953028()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t result;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v1 = (void *)v0[21];
  v2 = (void *)v0[19];
  v3 = (void *)v0[17];
  v5 = (void *)v0[11];
  v4 = v0[12];
  v6 = (_QWORD *)OUTLINED_FUNCTION_10();
  v6[2] = v1;
  v6[3] = v2;
  v6[4] = v5;
  v6[5] = v4;
  v7 = OUTLINED_FUNCTION_10();
  v0[2] = MEMORY[0x24BDAC760];
  *(_QWORD *)(v7 + 16) = sub_23C954210;
  *(_QWORD *)(v7 + 24) = v6;
  v0[6] = sub_23C95422C;
  v0[7] = v7;
  v0[3] = 1107296256;
  v0[4] = sub_23C953AA0;
  v0[5] = &block_descriptor;
  v8 = _Block_copy(v0 + 2);
  v9 = v5;
  v10 = v1;
  v11 = v2;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_configureConnection_, v8);
  _Block_release(v8);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v13 = (void *)v0[21];
    v14 = (void *)v0[19];
    v16 = (void *)v0[16];
    v15 = (void *)v0[17];
    v17 = (void *)v0[15];
    v18 = v0[12];
    v19 = *(void **)(v18 + 120);
    *(_QWORD *)(v18 + 120) = v15;
    v20 = v15;

    objc_msgSend(v20, sel_activate);
    OUTLINED_FUNCTION_23();

    return OUTLINED_FUNCTION_4_1((uint64_t (*)(void))v0[1]);
  }
  return result;
}

id sub_23C9531B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v7 = (void *)sub_23C95A5B8();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_23C95A5B8();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v9 = (void *)sub_23C95A5B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_endpointForSystemMachName_service_instance_, v7, v8, v9);

  return v10;
}

void sub_23C953288(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5930);
  MEMORY[0x24BDAC7A8]();
  v3 = objc_msgSend((id)objc_opt_self(), sel_proxyForLocalPlayer);
  v4 = objc_msgSend(v3, sel_utilityService);

  sub_23C95A5B8();
  __asm { BR              X10 }
}

void sub_23C95338C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v7 = (void *)sub_23C95A5B8();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, v4, v0);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v9 + v8, v2, v0);
  *(_QWORD *)(v6 - 96) = sub_23C9544C8;
  *(_QWORD *)(v6 - 88) = v9;
  *(_QWORD *)(v6 - 128) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v6 - 120) = 1107296256;
  *(_QWORD *)(v6 - 112) = sub_23C953518;
  *(_QWORD *)(v6 - 104) = &block_descriptor_43;
  v10 = _Block_copy((const void *)(v6 - 128));
  swift_release();
  objc_msgSend(v1, sel_getBSServiceConnectionEndpointForMachName_service_instance_handler_, v3, v7, 0, v10);
  _Block_release(v10);
  swift_unknownObjectRelease();

}

uint64_t sub_23C9534D4(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5930);
  return sub_23C95A618();
}

void sub_23C953518(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_23C95356C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  uint64_t (*v19)(void *);
  uint64_t v20;

  objc_msgSend(a1, sel_setTargetQueue_, a2);
  v7 = objc_msgSend((id)objc_opt_self(), sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v7);

  objc_msgSend(a1, sel_setInterface_, a3);
  objc_msgSend(a1, sel_setInterfaceTarget_, a4);
  v8 = swift_allocObject();
  swift_weakInit();
  v19 = sub_23C954284;
  v20 = v8;
  v9 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  v16 = 1107296256;
  v17 = sub_23C9537C4;
  v18 = &block_descriptor_17;
  v10 = _Block_copy(&v15);
  swift_release();
  objc_msgSend(a1, sel_setActivationHandler_, v10);
  _Block_release(v10);
  v11 = swift_allocObject();
  swift_weakInit();
  v19 = sub_23C9542B4;
  v20 = v11;
  v15 = v9;
  v16 = 1107296256;
  v17 = sub_23C9537C4;
  v18 = &block_descriptor_21;
  v12 = _Block_copy(&v15);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v12);
  _Block_release(v12);
  v13 = swift_allocObject();
  swift_weakInit();
  v19 = sub_23C9542E4;
  v20 = v13;
  v15 = v9;
  v16 = 1107296256;
  v17 = sub_23C9537C4;
  v18 = &block_descriptor_25;
  v14 = _Block_copy(&v15);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v14);
  _Block_release(v14);
}

uint64_t sub_23C953798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_23C9537B0()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 136) = 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23C9537C4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23C953814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_23C95382C()
{
  uint64_t v0;

  sub_23C953C04(0);
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23C953858(void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  _QWORD *v19;
  id v20;
  id v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a2 + 16;
  if (qword_256BD5588 != -1)
    swift_once();
  v13 = OUTLINED_FUNCTION_8_1();
  __swift_project_value_buffer(v13, (uint64_t)qword_256BD5BC8);
  v14 = a1;
  v15 = sub_23C95A570();
  v16 = sub_23C95A648();
  if (os_log_type_enabled(v15, v16))
  {
    v31 = a4;
    v17 = OUTLINED_FUNCTION_6_0();
    v32 = a5;
    v18 = (uint8_t *)v17;
    v19 = (_QWORD *)OUTLINED_FUNCTION_6_0();
    *(_DWORD *)v18 = 138412290;
    v33 = v14;
    v29 = a3;
    v20 = v14;
    v30 = v12;
    v21 = v20;
    sub_23C95A690();
    *v19 = v14;

    OUTLINED_FUNCTION_16(&dword_23C94E000, v15, v16, v29, v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5890);
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_10_0();
  result = swift_weakLoadStrong();
  if (result)
  {
    v23 = result;
    v24 = sub_23C95A630();
    OUTLINED_FUNCTION_20((uint64_t)v11, v25, v26, v24);
    v27 = (_QWORD *)OUTLINED_FUNCTION_10();
    v27[2] = 0;
    v27[3] = 0;
    v27[4] = v23;
    sub_23C950B50((uint64_t)v11, a5, (uint64_t)v27);
    return swift_release();
  }
  return result;
}

uint64_t sub_23C953A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_23C953AA0(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_23C953ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_23C95A630();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_23C954194(a1, &qword_256BD5590);
  }
  else
  {
    sub_23C95A624();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23C95A60C();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_23C953C04(char a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  void (*v5)(void);

  *(_BYTE *)(v1 + 136) = a1;
  if ((a1 & 1) == 0)
  {
    objc_msgSend(*(id *)(v1 + 120), sel_invalidate);
    v2 = MEMORY[0x242626920](v1 + 112);
    if (v2)
    {
      v3 = (void *)v2;
      v4 = (uint64_t *)(v2 + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_invalidationHandler);
      OUTLINED_FUNCTION_10_0();
      v5 = (void (*)(void))*v4;
      sub_23C9521C0(*v4);

      if (v5)
      {
        v5();
        sub_23C9521D0((uint64_t)v5);
      }
    }
  }
  OUTLINED_FUNCTION_19();
}

uint64_t sub_23C953C8C(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;

  v3[7] = a1;
  v3[8] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v3[9] = v5;
  *v5 = v3;
  v5[1] = sub_23C953CDC;
  return sub_23C9521E0(a2);
}

uint64_t sub_23C953CDC()
{
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C953D1C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _OWORD *v11;

  v1 = MEMORY[0x242626920](*(_QWORD *)(v0 + 64) + 112);
  if (!v1)
    goto LABEL_7;
  v2 = (void *)v1;
  v3 = *(void **)(*(_QWORD *)(v0 + 64) + 120);
  if (!v3 || (*(_QWORD *)(v0 + 48) = &unk_256BD8F48, (v4 = swift_dynamicCastObjCProtocolConditional()) == 0))
  {

LABEL_7:
    v11 = *(_OWORD **)(v0 + 56);
    *v11 = 0u;
    v11[1] = 0u;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = (void *)v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5858);
  v6 = OUTLINED_FUNCTION_10();
  *(_OWORD *)(v6 + 16) = xmmword_23C95C6A0;
  v7 = v3;
  *(_QWORD *)(v6 + 32) = sub_23C951E4C((uint64_t)v7);
  v8 = sub_23C95A600();
  OUTLINED_FUNCTION_26(v8, &qword_256BD5860);
  v9 = (void *)sub_23C95A5F4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v5, sel_remoteTargetWithLaunchingAssertionAttributes_, v9);

  if (v10)
  {
    sub_23C95A6A8();
    swift_unknownObjectRelease();

  }
  else
  {

    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  sub_23C953FEC(v0 + 16, *(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23C953E8C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  if (v1)
    objc_msgSend(v1, sel_invalidate);
  swift_unknownObjectWeakDestroy();

  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_23C953ED4()
{
  sub_23C953E8C();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23C953EEC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23C953EF8()
{
  return sub_23C953EEC();
}

id ClientProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ClientProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ClientProxy.invalidationHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ClientProxy.invalidationHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ClientProxy.invalidationHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ClientProxy.__allocating_init(serviceKind:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_23C953FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD55E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23C954034()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_8_1();
  __swift_allocate_value_buffer(v0, qword_256BD5BC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256BD5BC8);
  sub_23C95A57C();
  OUTLINED_FUNCTION_17();
}

unint64_t sub_23C9540A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256BD5870;
  if (!qword_256BD5870)
  {
    v1 = type metadata accessor for ClientProxy.ConnectionHelper();
    result = MEMORY[0x24262683C](&unk_23C95C724, v1);
    atomic_store(result, (unint64_t *)&qword_256BD5870);
  }
  return result;
}

uint64_t sub_23C9540E4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C954118(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v9 = swift_task_alloc();
  v10 = (_QWORD *)OUTLINED_FUNCTION_24(v9);
  *v10 = v2;
  v10[1] = sub_23C951644;
  return sub_23C952790(a1, v4, v5, v6, v8, v7);
}

void sub_23C954194(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_17();
}

void sub_23C9541CC(uint64_t a1)
{
  uint64_t v1;

  sub_23C953288(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23C9541D4()
{
  id *v0;

  swift_release();
  return swift_deallocObject();
}

void sub_23C954210(void *a1)
{
  uint64_t *v1;

  sub_23C95356C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23C95421C()
{
  return swift_deallocObject();
}

void sub_23C95422C()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_17();
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

uint64_t sub_23C954260()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23C954284(void *a1)
{
  uint64_t v1;

  return sub_23C953858(a1, v1, "GameOverlayUI Client Proxy Activation Handler: %@", (uint64_t)&unk_250D95010, (uint64_t)&unk_256BD5928);
}

uint64_t sub_23C9542B4(void *a1)
{
  uint64_t v1;

  return sub_23C953858(a1, v1, "GameOverlayUI Client Proxy Invalidation Handler: %@", (uint64_t)&unk_250D94FE8, (uint64_t)&unk_256BD5918);
}

uint64_t sub_23C9542E4(void *a1)
{
  uint64_t v1;

  return sub_23C953858(a1, v1, "GameOverlayUI Client Proxy Interruption Handler: %@", (uint64_t)&unk_250D94FC0, (uint64_t)&unk_256BD5908);
}

uint64_t sub_23C954318()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_24(v0);
  v2 = OUTLINED_FUNCTION_3_0(v1);
  return sub_23C953A88(v2, v3, v4, v5);
}

uint64_t sub_23C954368()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_24(v0);
  v2 = OUTLINED_FUNCTION_3_0(v1);
  return sub_23C953814(v2, v3, v4, v5);
}

uint64_t sub_23C9543B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t objectdestroy_27Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23C954418()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_24(v0);
  v2 = OUTLINED_FUNCTION_3_0(v1);
  return sub_23C953798(v2, v3, v4, v5);
}

uint64_t sub_23C954464()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5930);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23C9544C8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5930);
  return sub_23C9534D4(a1);
}

uint64_t sub_23C954508(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_23C954540()
{
  swift_release();
  return swift_deallocObject();
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

void OUTLINED_FUNCTION_0_0()
{
  JUMPOUT(0x2426268A8);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_3_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 48) + 128) = 0;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_23C95A588();
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_23C95A654();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_25@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1, unint64_t *a2)
{
  return sub_23C954508(0, a2);
}

void AccessPointAnchoring.bottom.getter()
{
  OUTLINED_FUNCTION_83();
  __asm { BR              X9 }
}

void sub_23C954744()
{
  char v0;
  int v1;
  uint64_t v2;

  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_13_1();
  v2 = OUTLINED_FUNCTION_72();
  if ((v0 & 1) != 0)
    OUTLINED_FUNCTION_49();
  else
    ((void (*)(uint64_t))((char *)&loc_23C9547BC + 4 * byte_23C95C765[v1]))(v2);
}

void sub_23C95482C(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_23C954890(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23C954910 + 4 * byte_23C95C770[a2]))(0x6F50737365636361);
}

uint64_t sub_23C954910(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x6F50737365636361 && v1 == 0xEF796C6E4F746E69)
    v3 = 1;
  else
    v3 = sub_23C95A738();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23C9549BC(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aTopleaditoptra[8 * a1] == *(_QWORD *)&aTopleaditoptra[8 * a2]
    && *(_QWORD *)&aTopleaditoptra[8 * a1 + 40] == *(_QWORD *)&aTopleaditoptra[8 * a2 + 40])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_23C95A738();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_23C954A40(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_23C954AA4(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23C954AE8 + 4 * byte_23C95C77A[a2]))(a3 + 5);
}

uint64_t sub_23C954AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v6;

  if (a1 == a3 + 5 && v4 == ((v3 - 32) | 0x8000000000000000))
    v6 = 1;
  else
    v6 = OUTLINED_FUNCTION_29();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

void AccessPointAnchoring.leading.getter()
{
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_85();
  __asm { BR              X9 }
}

void sub_23C954BB8()
{
  char v0;
  int v1;

  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_72();
  if ((v0 & 1) != 0)
    OUTLINED_FUNCTION_49();
  else
    ((void (*)(unint64_t))((char *)&loc_23C954C68 + 4 * byte_23C95C783[v1 - 1]))(0xED0000676E696461);
}

void AccessPointAnchoring.centered.getter()
{
  OUTLINED_FUNCTION_83();
  __asm { BR              X11 }
}

uint64_t sub_23C954CEC()
{
  char v0;

  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_84();
  v0 = OUTLINED_FUNCTION_29();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

GameCenterOverlayService::AccessPointAnchoring_optional __swiftcall AccessPointAnchoring.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  unint64_t v2;
  char *v3;
  char v4;
  GameCenterOverlayService::AccessPointAnchoring_optional result;

  v3 = v1;
  sub_23C95A714();
  OUTLINED_FUNCTION_68();
  v4 = 5;
  if (v2 < 5)
    v4 = v2;
  *v3 = v4;
  OUTLINED_FUNCTION_40();
  return result;
}

uint64_t AccessPointAnchoring.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aTopleaditoptra[8 * *v0];
}

uint64_t sub_23C954DC4(char *a1, char *a2)
{
  return sub_23C9549BC(*a1, *a2);
}

void sub_23C954DD0()
{
  sub_23C9591D4();
}

uint64_t sub_23C954DD8()
{
  return sub_23C9592EC();
}

void sub_23C954DE0()
{
  sub_23C9593B8();
}

GameCenterOverlayService::AccessPointAnchoring_optional sub_23C954DE8(Swift::String *a1)
{
  return AccessPointAnchoring.init(rawValue:)(*a1);
}

void sub_23C954DF4(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = AccessPointAnchoring.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_17();
}

void sub_23C954E14()
{
  swift_unknownObjectRetain();
  sub_23C954E48();
}

void sub_23C954E3C()
{
  sub_23C954F54();
}

void sub_23C954E48()
{
  sub_23C954F98();
}

void sub_23C954E54()
{
  _QWORD *v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_35();
  *v0 = v1;
  OUTLINED_FUNCTION_7_2((uint64_t)v1, OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_dashboardDelegate);
  OUTLINED_FUNCTION_32();
}

void sub_23C954E80(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_40();
}

void sub_23C954E9C()
{
  swift_unknownObjectRetain();
  sub_23C954ED0();
}

void sub_23C954EC4()
{
  sub_23C954F54();
}

void sub_23C954ED0()
{
  sub_23C954F98();
}

void sub_23C954EDC()
{
  _QWORD *v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_35();
  *v0 = v1;
  OUTLINED_FUNCTION_7_2((uint64_t)v1, OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_accessPointDelegate);
  OUTLINED_FUNCTION_32();
}

void sub_23C954F08(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_40();
}

void sub_23C954F20()
{
  swift_unknownObjectRetain();
  sub_23C954F8C();
}

void sub_23C954F48()
{
  sub_23C954F54();
}

void sub_23C954F54()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_32();
}

void sub_23C954F8C()
{
  sub_23C954F98();
}

void sub_23C954F98()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_14();
}

void sub_23C954FE0()
{
  _QWORD *v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_35();
  *v0 = v1;
  OUTLINED_FUNCTION_7_2((uint64_t)v1, OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_gameModeDelegate);
  OUTLINED_FUNCTION_32();
}

void sub_23C95500C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_40();
}

uint64_t sub_23C955024(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = v1;
  *(_BYTE *)(v2 + 80) = a1;
  OUTLINED_FUNCTION_18_0();
  return swift_task_switch();
}

uint64_t sub_23C955044()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = (_OWORD *)(v0 + 16);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + OBJC_IVAR____TtC24GameCenterOverlayService11ClientProxy_helper);
  *(_QWORD *)(v0 + 64) = v2;
  if (v2)
  {
    swift_retain();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v3;
    *v3 = v0;
    v3[1] = sub_23C95516C;
    return sub_23C953C8C(v0 + 16, *(_BYTE *)(v0 + 80));
  }
  else
  {
    *v1 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_23C951B7C(v0 + 16);
    if (qword_256BD5588 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_21_0(v5, (uint64_t)qword_256BD5BC8);
    v6 = OUTLINED_FUNCTION_13_0();
    if (OUTLINED_FUNCTION_9(v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      *(_WORD *)v7 = 0;
      OUTLINED_FUNCTION_38(&dword_23C94E000, (v0 + 16), OS_LOG_TYPE_DEFAULT, "Failed to create GameOverlayUI Dashboard Remote Proxy", v7);
      OUTLINED_FUNCTION_0_0();
    }

    return OUTLINED_FUNCTION_2(0, *(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_23C95516C()
{
  OUTLINED_FUNCTION_6();
  swift_release();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C9551B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t isa;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (*(_QWORD *)(v1 + 40))
  {
    v0 = (v1 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5A30);
    if ((swift_dynamicCast() & 1) != 0)
    {
      isa = (uint64_t)v0->isa;
      return OUTLINED_FUNCTION_2(isa, *(uint64_t (**)(void))(v1 + 8));
    }
  }
  else
  {
    sub_23C951B7C(v1 + 16);
  }
  if (qword_256BD5588 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_21_0(v3, (uint64_t)qword_256BD5BC8);
  v4 = OUTLINED_FUNCTION_13_0();
  if (OUTLINED_FUNCTION_9(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_6_0();
    *(_WORD *)v5 = 0;
    OUTLINED_FUNCTION_38(&dword_23C94E000, v0, (os_log_type_t)(v1 + 16), "Failed to create GameOverlayUI Dashboard Remote Proxy", v5);
    OUTLINED_FUNCTION_0_0();
  }

  isa = 0;
  return OUTLINED_FUNCTION_2(isa, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23C9552A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_47();
  v12 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_20(v6, v13, v14, v12);
  v15 = (_QWORD *)OUTLINED_FUNCTION_10();
  v16 = OUTLINED_FUNCTION_62(v15);
  *((_BYTE *)v16 + 40) = a4;
  v16[6] = a1;
  *((_BYTE *)v16 + 56) = a5;
  v16[8] = a2;
  v16[9] = a3;
  swift_bridgeObjectRetain();
  v17 = v5;
  OUTLINED_FUNCTION_43();
  sub_23C950B50(v6, (uint64_t)&unk_256BD5960, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_23C955370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v10;
  uint64_t v12;

  *(_QWORD *)(v8 + 32) = a8;
  *(_QWORD *)(v8 + 40) = v12;
  *(_BYTE *)(v8 + 64) = a7;
  *(_QWORD *)(v8 + 24) = a6;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 48) = v10;
  *v10 = v8;
  v10[1] = sub_23C955404;
  return sub_23C955024(a5);
}

uint64_t sub_23C955404(uint64_t a1)
{
  OUTLINED_FUNCTION_3_1(a1);
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C955458()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;

  v2 = *(void **)(v0 + 56);
  if (v2)
  {
    v3 = (void *)objc_opt_self();
    v4 = sub_23C95A5AC();
    *(_QWORD *)(v0 + 16) = 0;
    v5 = objc_msgSend(v3, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v4, 1, v0 + 16);
    OUTLINED_FUNCTION_39();
    v6 = *(id *)(v0 + 16);
    if (v1)
    {
      v7 = *(void **)(v0 + 40);
      v8 = *(unsigned __int8 *)(v0 + 64);
      OUTLINED_FUNCTION_65();
      OUTLINED_FUNCTION_75();
      v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v8);
      v10 = (void *)OUTLINED_FUNCTION_63();
      if (v7)
        v7 = (void *)OUTLINED_FUNCTION_73();
      objc_msgSend(v2, sel_showDashboardWithInitialState_canDismissWithGesture_sceneIdentifier_, v10, v9, v7);

      OUTLINED_FUNCTION_82();
    }
    else
    {
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_55();
      OUTLINED_FUNCTION_4_2();
      if (qword_256BD5588 != -1)
        swift_once();
      v11 = OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_21_0(v11, (uint64_t)qword_256BD5BC8);
      v12 = OUTLINED_FUNCTION_13_0();
      if (os_log_type_enabled(v4, v12))
      {
        v13 = (uint8_t *)OUTLINED_FUNCTION_6_0();
        *(_WORD *)v13 = 0;
        OUTLINED_FUNCTION_38(&dword_23C94E000, v4, v12, "Failed to serialize initialState dictionary", v13);
        OUTLINED_FUNCTION_0_0();
      }

    }
    OUTLINED_FUNCTION_44();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

char *DashboardClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DashboardClientProxy.init(serviceKind:)(a1);
}

char *DashboardClientProxy.init(serviceKind:)(char *a1)
{
  char v1;
  char v3;

  v1 = *a1;
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_36();
  v3 = v1;
  return ClientProxy.init(serviceKind:)(&v3);
}

uint64_t sub_23C9556E0()
{
  uint64_t v0;

  sub_23C951B58(v0 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_dashboardDelegate);
  sub_23C951B58(v0 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_accessPointDelegate);
  return sub_23C951B58(v0 + OBJC_IVAR____TtC24GameCenterOverlayService20DashboardClientProxy_gameModeDelegate);
}

id DashboardClientProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DashboardClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

GameCenterOverlayService::DashboardClientProxy::AccessPointUseCase_optional __swiftcall DashboardClientProxy.AccessPointUseCase.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  unint64_t v2;
  char *v3;
  char v4;
  GameCenterOverlayService::DashboardClientProxy::AccessPointUseCase_optional result;

  v3 = v1;
  sub_23C95A714();
  OUTLINED_FUNCTION_68();
  v4 = 6;
  if (v2 < 6)
    v4 = v2;
  *v3 = v4;
  OUTLINED_FUNCTION_40();
  return result;
}

uint64_t DashboardClientProxy.AccessPointUseCase.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C955810 + 4 * byte_23C95C78C[*v0]))(0xD000000000000011, 0x800000023C95AC50);
}

uint64_t sub_23C955810()
{
  return 0x6F50737365636361;
}

uint64_t sub_23C955834(uint64_t a1)
{
  return a1 + 10;
}

uint64_t sub_23C955864()
{
  return 0x6142656D61476E69;
}

void sub_23C955884(char *a1)
{
  sub_23C95482C(*a1);
}

void sub_23C955890()
{
  sub_23C9591E0();
}

void sub_23C955898(uint64_t a1)
{
  char *v1;

  sub_23C959224(a1, *v1);
}

void sub_23C9558A0()
{
  sub_23C9593C4();
}

GameCenterOverlayService::DashboardClientProxy::AccessPointUseCase_optional sub_23C9558A8(Swift::String *a1)
{
  return DashboardClientProxy.AccessPointUseCase.init(rawValue:)(*a1);
}

void sub_23C9558B4(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = DashboardClientProxy.AccessPointUseCase.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_17();
}

Swift::Void __swiftcall DashboardClientProxy.setUpAccessPoint(anchoring:useCase:didReturnToForeground:newToGameCenter:sceneIdentifier:)(GameCenterOverlayService::AccessPointAnchoring anchoring, GameCenterOverlayService::DashboardClientProxy::AccessPointUseCase useCase, Swift::Bool didReturnToForeground, Swift::Bool newToGameCenter, Swift::String_optional sceneIdentifier)
{
  void *v5;
  void *object;
  uint64_t countAndFlagsBits;
  char *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;

  object = sceneIdentifier.value._object;
  countAndFlagsBits = sceneIdentifier.value._countAndFlagsBits;
  v10 = (char *)useCase;
  v11 = (_BYTE *)anchoring;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25_0();
  v14 = v13 - v12;
  LOBYTE(v11) = *v11;
  v15 = *v10;
  v16 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_20(v14, v17, v18, v16);
  v19 = (_QWORD *)OUTLINED_FUNCTION_10();
  v20 = OUTLINED_FUNCTION_62(v19);
  *((_BYTE *)v20 + 40) = (_BYTE)v11;
  *((_BYTE *)v20 + 41) = v15;
  *((_BYTE *)v20 + 42) = didReturnToForeground;
  *((_BYTE *)v20 + 43) = newToGameCenter;
  v20[6] = countAndFlagsBits;
  v20[7] = object;
  OUTLINED_FUNCTION_43();
  v21 = v5;
  sub_23C950B50(v14, (uint64_t)&unk_256BD5970, (uint64_t)v19);
  swift_release();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_23C9559A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, char a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v8 + 32) = v11;
  *(_QWORD *)(v8 + 40) = v12;
  *(_BYTE *)(v8 + 67) = a8;
  *(_BYTE *)(v8 + 66) = a7;
  *(_BYTE *)(v8 + 65) = a6;
  *(_BYTE *)(v8 + 64) = a5;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 48) = v9;
  *v9 = v8;
  v9[1] = sub_23C955A30;
  return sub_23C955024(0);
}

uint64_t sub_23C955A30(uint64_t a1)
{
  OUTLINED_FUNCTION_3_1(a1);
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C955A84()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  _DWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (*(_QWORD *)(v0 + 56))
  {
    objc_opt_self();
    v1 = objc_msgSend((id)objc_opt_self(), sel_currentGame);
    v2 = objc_msgSend(v1, sel_internal);

    *(_QWORD *)(v0 + 16) = 0;
    v4 = OUTLINED_FUNCTION_41(v3, sel_archivedDataWithRootObject_requiringSecureCoding_error_);

    v5 = *(id *)(v0 + 16);
    if (v4)
    {
      OUTLINED_FUNCTION_65();

    }
    else
    {
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_55();
      if (qword_256BD5588 != -1)
        swift_once();
      v6 = OUTLINED_FUNCTION_8_1();
      v7 = (void *)__swift_project_value_buffer(v6, (uint64_t)qword_256BD5BC8);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_14_1();
      sub_23C95A570();
      v8 = OUTLINED_FUNCTION_13_0();
      if (OUTLINED_FUNCTION_20_0(v8))
      {
        v9 = (_DWORD *)OUTLINED_FUNCTION_6_0();
        v10 = (_QWORD *)OUTLINED_FUNCTION_6_0();
        *v9 = 138412290;
        OUTLINED_FUNCTION_14_1();
        v11 = OUTLINED_FUNCTION_66();
        *(_QWORD *)(v0 + 24) = v11;
        OUTLINED_FUNCTION_70();
        *v10 = v11;
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_17_0(&dword_23C94E000, v12, v13, "Game could not be serialized: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5890);
        OUTLINED_FUNCTION_19_0();
        OUTLINED_FUNCTION_0_0();
      }
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_4_2();

    }
    v14 = *(unsigned __int8 *)(v0 + 65);
    sub_23C95A5B8();
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall DashboardClientProxy.tearDownAccessPoint(sceneIdentifier:)(Swift::String_optional sceneIdentifier)
{
  sub_23C95604C(sceneIdentifier.value._countAndFlagsBits, (uint64_t)sceneIdentifier.value._object, (uint64_t)&unk_250D95140, (uint64_t)&unk_256BD5980);
}

uint64_t sub_23C955E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v6[2] = a5;
  v6[3] = a6;
  v7 = (_QWORD *)swift_task_alloc();
  v6[4] = v7;
  *v7 = v6;
  v7[1] = sub_23C955ECC;
  return sub_23C955024(0);
}

uint64_t sub_23C955ECC(uint64_t a1)
{
  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C955EF8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(v1 + 40))
  {
    if (*(_QWORD *)(v1 + 24))
    {
      a1 = OUTLINED_FUNCTION_78();
      v2 = (void *)a1;
    }
    else
    {
      v2 = 0;
    }
    OUTLINED_FUNCTION_42(a1, sel_tearDownAccessPointWithSceneIdentifier_);

    OUTLINED_FUNCTION_7_0();
  }
  return OUTLINED_FUNCTION_11_0(*(uint64_t (**)(void))(v1 + 8));
}

Swift::Void __swiftcall DashboardClientProxy.showAccessPoint(sceneIdentifier:)(Swift::String_optional sceneIdentifier)
{
  sub_23C95604C(sceneIdentifier.value._countAndFlagsBits, (uint64_t)sceneIdentifier.value._object, (uint64_t)&unk_250D95168, (uint64_t)&unk_256BD5990);
}

uint64_t sub_23C955F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v6[2] = a5;
  v6[3] = a6;
  v7 = (_QWORD *)swift_task_alloc();
  v6[4] = v7;
  *v7 = v6;
  v7[1] = sub_23C955FB4;
  return sub_23C955024(0);
}

uint64_t sub_23C955FB4(uint64_t a1)
{
  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C955FE0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(v1 + 40))
  {
    if (*(_QWORD *)(v1 + 24))
    {
      a1 = OUTLINED_FUNCTION_78();
      v2 = (void *)a1;
    }
    else
    {
      v2 = 0;
    }
    OUTLINED_FUNCTION_42(a1, sel_showAccessPointWithSceneIdentifier_);

    OUTLINED_FUNCTION_7_0();
  }
  return OUTLINED_FUNCTION_11_0(*(uint64_t (**)(void))(v1 + 8));
}

Swift::Void __swiftcall DashboardClientProxy.hideAccessPoint(sceneIdentifier:)(Swift::String_optional sceneIdentifier)
{
  sub_23C95604C(sceneIdentifier.value._countAndFlagsBits, (uint64_t)sceneIdentifier.value._object, (uint64_t)&unk_250D95190, (uint64_t)&unk_256BD59A0);
}

void sub_23C95604C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25_0();
  v10 = v9 - v8;
  v11 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_20(v10, v12, v13, v11);
  v14 = (_QWORD *)OUTLINED_FUNCTION_10();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v4;
  v14[5] = a1;
  v14[6] = a2;
  swift_bridgeObjectRetain();
  v15 = v4;
  sub_23C950B50(v10, a4, (uint64_t)v14);
  swift_release();
  OUTLINED_FUNCTION_49();
}

uint64_t sub_23C9560F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v6[2] = a5;
  v6[3] = a6;
  v7 = (_QWORD *)swift_task_alloc();
  v6[4] = v7;
  *v7 = v6;
  v7[1] = sub_23C956140;
  return sub_23C955024(0);
}

uint64_t sub_23C956140(uint64_t a1)
{
  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C95616C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(v1 + 40))
  {
    if (*(_QWORD *)(v1 + 24))
    {
      a1 = OUTLINED_FUNCTION_78();
      v2 = (void *)a1;
    }
    else
    {
      v2 = 0;
    }
    OUTLINED_FUNCTION_42(a1, sel_hideAccessPointWithSceneIdentifier_);

    OUTLINED_FUNCTION_7_0();
  }
  return OUTLINED_FUNCTION_11_0(*(uint64_t (**)(void))(v1 + 8));
}

Swift::Void __swiftcall DashboardClientProxy.updateAccessPoint(anchoring:sceneIdentifier:)(GameCenterOverlayService::AccessPointAnchoring anchoring, Swift::String_optional sceneIdentifier)
{
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;

  object = sceneIdentifier.value._object;
  countAndFlagsBits = sceneIdentifier.value._countAndFlagsBits;
  v5 = (char *)anchoring;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25_0();
  v8 = v7 - v6;
  v9 = *v5;
  v10 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_20(v8, v11, v12, v10);
  v13 = (_QWORD *)OUTLINED_FUNCTION_10();
  v14 = OUTLINED_FUNCTION_62(v13);
  *((_BYTE *)v14 + 40) = v9;
  v14[6] = countAndFlagsBits;
  v14[7] = object;
  OUTLINED_FUNCTION_43();
  v15 = v2;
  sub_23C950B50(v8, (uint64_t)&unk_256BD59B0, (uint64_t)v13);
  swift_release();
  OUTLINED_FUNCTION_49();
}

uint64_t sub_23C95626C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  *(_QWORD *)(v7 + 32) = a6;
  *(_QWORD *)(v7 + 40) = a7;
  *(_BYTE *)(v7 + 64) = a5;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 48) = v8;
  *v8 = v7;
  v8[1] = sub_23C9562EC;
  return sub_23C955024(0);
}

uint64_t sub_23C9562EC(uint64_t a1)
{
  OUTLINED_FUNCTION_3_1(a1);
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C956340()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  os_log_type_t v9;
  _DWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v1 = *(void **)(v0 + 56);
  if (v1)
  {
    objc_opt_self();
    v2 = objc_msgSend((id)objc_opt_self(), sel_currentGame);
    v3 = objc_msgSend(v2, sel_internal);

    *(_QWORD *)(v0 + 16) = 0;
    v5 = OUTLINED_FUNCTION_41(v4, sel_archivedDataWithRootObject_requiringSecureCoding_error_);

    v6 = *(id *)(v0 + 16);
    if (v5)
    {
      OUTLINED_FUNCTION_65();
      OUTLINED_FUNCTION_75();
    }
    else
    {
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_55();
      if (qword_256BD5588 != -1)
        swift_once();
      v7 = OUTLINED_FUNCTION_8_1();
      v8 = (void *)__swift_project_value_buffer(v7, (uint64_t)qword_256BD5BC8);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_14_1();
      sub_23C95A570();
      v9 = OUTLINED_FUNCTION_13_0();
      if (OUTLINED_FUNCTION_20_0(v9))
      {
        v10 = (_DWORD *)OUTLINED_FUNCTION_6_0();
        v11 = (_QWORD *)OUTLINED_FUNCTION_6_0();
        *v10 = 138412290;
        OUTLINED_FUNCTION_14_1();
        v12 = OUTLINED_FUNCTION_66();
        *(_QWORD *)(v0 + 24) = v12;
        OUTLINED_FUNCTION_70();
        *v11 = v12;
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_17_0(&dword_23C94E000, v13, v14, "Game could not be serialized: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5890);
        OUTLINED_FUNCTION_19_0();
        OUTLINED_FUNCTION_0_0();
      }
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_4_2();

    }
    v15 = *(void **)(v0 + 40);
    v16 = (void *)sub_23C95A5B8();
    swift_bridgeObjectRelease();
    v17 = (void *)OUTLINED_FUNCTION_63();
    if (v15)
      v15 = (void *)OUTLINED_FUNCTION_73();
    objc_msgSend(v1, sel_updateAccessPointWithLocation_gameInternal_sceneIdentifier_, v16, v17, v15);
    OUTLINED_FUNCTION_82();

    OUTLINED_FUNCTION_44();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void DashboardClientProxy.showInGameBanner(useCase:title:message:imageData:identifier:sceneIdentifier:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v11;
  uint64_t v12;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  id v24;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_47();
  v18 = *a1;
  v19 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_20(v12, v20, v21, v19);
  v22 = (_QWORD *)OUTLINED_FUNCTION_10();
  v23 = OUTLINED_FUNCTION_62(v22);
  *((_BYTE *)v23 + 40) = v18;
  v23[6] = a2;
  v23[7] = a3;
  v23[8] = a4;
  v23[9] = a5;
  v23[10] = a6;
  v23[11] = a7;
  v23[12] = a8;
  v23[13] = a9;
  v23[14] = a10;
  v23[15] = a11;
  swift_bridgeObjectRetain();
  v24 = v11;
  swift_bridgeObjectRetain();
  sub_23C957CD4(a6, a7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23C950B50(v12, (uint64_t)&unk_256BD59C0, (uint64_t)v22);
  swift_release();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_23C9566E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 104) = v14;
  *(_OWORD *)(v8 + 88) = v13;
  *(_OWORD *)(v8 + 72) = v12;
  *(_OWORD *)(v8 + 56) = v11;
  *(_QWORD *)(v8 + 40) = a7;
  *(_QWORD *)(v8 + 48) = a8;
  *(_QWORD *)(v8 + 32) = a6;
  *(_BYTE *)(v8 + 128) = a5;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 112) = v9;
  *v9 = v8;
  v9[1] = sub_23C956788;
  return sub_23C955024(0);
}

uint64_t sub_23C956788(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C956804()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  _DWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_QWORD *)(v0 + 120))
  {
    v1 = (void *)objc_opt_self();
    v2 = objc_msgSend((id)objc_opt_self(), sel_currentGame);
    v3 = objc_msgSend(v2, sel_internal);

    *(_QWORD *)(v0 + 16) = 0;
    v4 = objc_msgSend(v1, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v3, 1, v0 + 16);

    v5 = *(id *)(v0 + 16);
    if (v4)
    {
      sub_23C95A564();

    }
    else
    {
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_55();
      if (qword_256BD5588 != -1)
        swift_once();
      v6 = OUTLINED_FUNCTION_8_1();
      v7 = (void *)__swift_project_value_buffer(v6, (uint64_t)qword_256BD5BC8);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_14_1();
      sub_23C95A570();
      v8 = OUTLINED_FUNCTION_13_0();
      if (OUTLINED_FUNCTION_20_0(v8))
      {
        v9 = (_DWORD *)OUTLINED_FUNCTION_6_0();
        v10 = (_QWORD *)OUTLINED_FUNCTION_6_0();
        *v9 = 138412290;
        OUTLINED_FUNCTION_14_1();
        v11 = OUTLINED_FUNCTION_66();
        *(_QWORD *)(v0 + 24) = v11;
        sub_23C95A690();
        *v10 = v11;
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_17_0(&dword_23C94E000, v12, v13, "Game could not be serialized: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5890);
        OUTLINED_FUNCTION_19_0();
        OUTLINED_FUNCTION_0_0();
      }
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_4_2();

    }
    __asm { BR              X10 }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall DashboardClientProxy.showGameModeBanner(bundleIdentifier:available:required:enabled:showText:usingLocalEndPoint:)(Swift::String bundleIdentifier, Swift::Bool available, Swift::Bool required, Swift::Bool enabled, Swift::Bool showText, Swift::Bool usingLocalEndPoint)
{
  void *v6;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  id v22;

  object = bundleIdentifier._object;
  countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5590);
  OUTLINED_FUNCTION_12_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25_0();
  v16 = v15 - v14;
  v17 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_20(v16, v18, v19, v17);
  v20 = (_QWORD *)OUTLINED_FUNCTION_10();
  v21 = OUTLINED_FUNCTION_62(v20);
  *((_BYTE *)v21 + 40) = usingLocalEndPoint;
  v21[6] = countAndFlagsBits;
  v21[7] = object;
  *((_BYTE *)v21 + 64) = available;
  *((_BYTE *)v21 + 65) = required;
  *((_BYTE *)v21 + 66) = enabled;
  *((_BYTE *)v21 + 67) = showText;
  v22 = v6;
  OUTLINED_FUNCTION_43();
  sub_23C950B50(v16, (uint64_t)&unk_256BD59D0, (uint64_t)v20);
  swift_release();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_23C956D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  _QWORD *v10;
  char v12;
  __int16 v13;

  *(_WORD *)(v8 + 50) = v13;
  *(_BYTE *)(v8 + 49) = v12;
  *(_BYTE *)(v8 + 48) = a8;
  *(_QWORD *)(v8 + 16) = a6;
  *(_QWORD *)(v8 + 24) = a7;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 32) = v10;
  *v10 = v8;
  v10[1] = sub_23C956D8C;
  return sub_23C955024(a5);
}

uint64_t sub_23C956D8C(uint64_t a1)
{
  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4();
}

uint64_t sub_23C956DB8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v1 = *(void **)(v0 + 40);
  if (v1)
  {
    v2 = *(unsigned __int8 *)(v0 + 51);
    v3 = *(unsigned __int8 *)(v0 + 50);
    v4 = *(unsigned __int8 *)(v0 + 49);
    v5 = *(unsigned __int8 *)(v0 + 48);
    v6 = (void *)sub_23C95A5B8();
    v7 = objc_msgSend(OUTLINED_FUNCTION_53(), sel_initWithBool_, v5);
    v8 = objc_msgSend(OUTLINED_FUNCTION_53(), sel_initWithBool_, v4);
    v9 = objc_msgSend(OUTLINED_FUNCTION_53(), sel_initWithBool_, v3);
    v10 = objc_msgSend(OUTLINED_FUNCTION_53(), sel_initWithBool_, v2);
    objc_msgSend(v1, sel_showGameModeBannerWithBundleIdentifier_available_required_enabled_showText_, v6, v7, v8, v9, v10);

    OUTLINED_FUNCTION_7_0();
  }
  return OUTLINED_FUNCTION_11_0(*(uint64_t (**)(void))(v0 + 8));
}

Swift::Void __swiftcall DashboardClientProxy.didDismissDashboard()()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_32();
}

void sub_23C956ED8(void *a1)
{
  if (a1)
  {
    objc_msgSend(a1, sel_didDismissDashboard);
    OUTLINED_FUNCTION_44();
  }
  OUTLINED_FUNCTION_14();
}

void sub_23C956F18()
{
  void *v0;

}

Swift::Void __swiftcall DashboardClientProxy.updateAccessPointFrameCoordinates(_:)(NSValue a1)
{
  MEMORY[0x24262653C](a1.super.isa);
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_32();
}

void *sub_23C956F74(void *result)
{
  double v1;
  double v2;
  double v3;
  double v4;

  if (result)
  {
    objc_msgSend(result, sel_updateAccessPointFrameCoordinates_, v1, v2, v3, v4);
    return (void *)OUTLINED_FUNCTION_44();
  }
  return result;
}

void sub_23C956FEC()
{
  void *v0;
  void *v1;

}

Swift::Void __swiftcall DashboardClientProxy.isPresentingDashboardFromAccessPoint(_:)(NSValue a1)
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_61();
}

void sub_23C957038(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;

  if (a1)
  {
    objc_msgSend(a1, sel_isPresentingDashboardFromAccessPoint_, objc_msgSend(v16, sel_BOOLValueSafe));
    OUTLINED_FUNCTION_7_0();
  }
  OUTLINED_FUNCTION_14();
}

void sub_23C9570A8()
{
  void *v0;
  void *v1;

}

void DashboardClientProxy.finishAndPlay(_:)()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_61();
}

void sub_23C9570FC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  void *v9;

  if (!a1)
    goto LABEL_4;
  v2 = OUTLINED_FUNCTION_26(a1, &qword_256BD59D8);
  OUTLINED_FUNCTION_26(v2, &qword_256BD59E0);
  v3 = OUTLINED_FUNCTION_67();
  if (v1)
  {
    OUTLINED_FUNCTION_28();

LABEL_4:
    if (qword_256BD5588 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_8_1();
    v5 = OUTLINED_FUNCTION_21_0(v4, (uint64_t)qword_256BD5BC8);
    v6 = sub_23C95A654();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      *(_WORD *)v7 = 0;
      OUTLINED_FUNCTION_38(&dword_23C94E000, v5, v6, "Could not deserialize challenge data", v7);
      OUTLINED_FUNCTION_0_0();
    }
    goto LABEL_12;
  }
  v5 = v3;
  if (!v3)
  {
    OUTLINED_FUNCTION_28();
    goto LABEL_4;
  }
  v8 = objc_msgSend((id)objc_opt_self(), sel_challengeForInternalRepresentation_, v3);
  if (v8)
  {
    v9 = v8;
    OUTLINED_FUNCTION_71((uint64_t)v8, sel_finishAndPlay_);

  }
  OUTLINED_FUNCTION_28();
LABEL_12:

}

void DashboardClientProxy.finish(with:)()
{
  sub_23C957274();
}

void DashboardClientProxy.quitTurnBasedMatch(_:)()
{
  sub_23C957274();
}

void sub_23C957274()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_61();
}

void sub_23C9572B4(uint64_t a1)
{
  const char **v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[16];

  if (!a1)
    goto LABEL_4;
  v3 = OUTLINED_FUNCTION_26(a1, &qword_256BD59D8);
  v4 = OUTLINED_FUNCTION_26(v3, &qword_256BD59E8);
  v5 = OUTLINED_FUNCTION_67();
  if (v2)
  {
    OUTLINED_FUNCTION_28();

LABEL_4:
    if (qword_256BD5588 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_8_1();
    v7 = OUTLINED_FUNCTION_21_0(v6, (uint64_t)qword_256BD5BC8);
    v8 = sub_23C95A654();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_6_0();
      *(_WORD *)v9 = 0;
      OUTLINED_FUNCTION_38(&dword_23C94E000, v7, v8, "Could not deserialize turn based match data", v9);
      OUTLINED_FUNCTION_0_0();
    }
    goto LABEL_12;
  }
  v10 = (void *)v5;
  if (!v5)
  {
    OUTLINED_FUNCTION_28();
    goto LABEL_4;
  }
  v13[3] = v4;
  v13[0] = v5;
  objc_allocWithZone(MEMORY[0x24BE3A2A8]);
  v7 = v10;
  v11 = sub_23C95775C(v13);
  if (v11)
  {
    v12 = v11;
    OUTLINED_FUNCTION_71((uint64_t)v11, *v1);

  }
  OUTLINED_FUNCTION_28();
LABEL_12:

}

void sub_23C957414(void *a1, uint64_t a2, void *a3, void (*a4)(uint64_t, uint64_t))
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a3;
  a1;
  v7 = sub_23C95A564();
  v9 = v8;

  a4(v7, v9);
  JUMPOUT(0x23C95746CLL);
}

Swift::Void __swiftcall DashboardClientProxy.setGameMode(bundleIdentifier:enabled:)(Swift::String bundleIdentifier, NSValue enabled)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  objc_class *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  objc_class *v10;
  _QWORD *v11;
  uint64_t v12[3];

  object = bundleIdentifier._object;
  countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  if (qword_256BD5588 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_8_1();
  __swift_project_value_buffer(v5, (uint64_t)qword_256BD5BC8);
  swift_bridgeObjectRetain_n();
  v6 = enabled.super.isa;
  v7 = sub_23C95A570();
  v8 = sub_23C95A648();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = OUTLINED_FUNCTION_6_0();
    v11 = (_QWORD *)OUTLINED_FUNCTION_6_0();
    v12[0] = OUTLINED_FUNCTION_6_0();
    *(_DWORD *)v9 = 136315394;
    OUTLINED_FUNCTION_43();
    sub_23C957EA4(countAndFlagsBits, (unint64_t)object, v12);
    sub_23C95A690();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2112;
    v10 = v6;
    sub_23C95A690();
    *v11 = v6;

    _os_log_impl(&dword_23C94E000, v7, v8, "Game Mode for bundleID %s was enabled: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5890);
    OUTLINED_FUNCTION_79();
    OUTLINED_FUNCTION_0_0();
  }

  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_61();
}

uint64_t sub_23C957740()
{
  void *v0;
  void *v1;

  return swift_bridgeObjectRelease();
}

id sub_23C95775C(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v2 = a1[3];
  if (v2)
  {
    v4 = __swift_project_boxed_opaque_existential_0(a1, a1[3]);
    v5 = *(_QWORD *)(v2 - 8);
    MEMORY[0x24BDAC7A8](v4, v4);
    v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = sub_23C95A72C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v1, sel_initWithInternalRepresentation_, v8);
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_23C957840(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23C957850(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23C957884()
{
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C9578B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  OUTLINED_FUNCTION_60();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_24(v1);
  *v2 = v0;
  v2[1] = sub_23C951BBC;
  OUTLINED_FUNCTION_46();
  return sub_23C955370(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t type metadata accessor for DashboardClientProxy()
{
  return objc_opt_self();
}

uint64_t sub_23C957968()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;

  OUTLINED_FUNCTION_60();
  v1 = OUTLINED_FUNCTION_86();
  v2 = (_QWORD *)OUTLINED_FUNCTION_24(v1);
  *v2 = v0;
  v2[1] = sub_23C951BBC;
  OUTLINED_FUNCTION_46();
  return sub_23C9559A0(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23C9579FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_26_0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_24(v0);
  v2 = OUTLINED_FUNCTION_6_1(v1);
  return sub_23C955E7C(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_23C957A54()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_26_0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_24(v0);
  v2 = OUTLINED_FUNCTION_6_1(v1);
  return sub_23C955F64(v2, v3, v4, v5, v6, v7);
}

uint64_t objectdestroy_7Tm()
{
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C957AD8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_26_0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_24(v0);
  v2 = OUTLINED_FUNCTION_6_1(v1);
  return sub_23C9560F0(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_23C957B30()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_64();
  v1 = OUTLINED_FUNCTION_86();
  v2 = (_QWORD *)OUTLINED_FUNCTION_24(v1);
  *v2 = v0;
  v2[1] = sub_23C951BBC;
  v3 = OUTLINED_FUNCTION_24_0();
  return sub_23C95626C(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_23C957B90()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 88);
  if (v1 >> 60 != 15)
    sub_23C957BEC(*(_QWORD *)(v0 + 80), v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C957BEC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_23C957C30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_64();
  v2 = *(_QWORD *)(v0 + 64);
  v3 = OUTLINED_FUNCTION_86();
  v4 = (_QWORD *)OUTLINED_FUNCTION_24(v3);
  *v4 = v1;
  v4[1] = sub_23C951BBC;
  v5 = OUTLINED_FUNCTION_24_0();
  return sub_23C9566E8(v5, v6, v7, v8, v9, v10, v11, v2);
}

uint64_t sub_23C957CD4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23C957CE8(a1, a2);
  return a1;
}

uint64_t sub_23C957CE8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_23C957D2C()
{
  return objectdestroy_3Tm();
}

uint64_t objectdestroy_3Tm()
{
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23C957D6C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  OUTLINED_FUNCTION_60();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_24(v1);
  *v2 = v0;
  v2[1] = sub_23C951644;
  OUTLINED_FUNCTION_46();
  return sub_23C956D14(v3, v4, v5, v6, v7, v8, v9, v10);
}

_BYTE **sub_23C957E10(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_23C957E20(uint64_t (*a1)(void))
{
  return a1();
}

void sub_23C957E40(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = a4();
  sub_23C957EA4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23C95A690();
  swift_bridgeObjectRelease();
  *a1 = v8;
  OUTLINED_FUNCTION_48();
}

uint64_t sub_23C957EA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_18_0();
  v9 = sub_23C957F70(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_23C958BB4((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_23C958BB4((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return v10;
}

uint64_t sub_23C957F70(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23C9580C4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23C95A69C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23C958188(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23C95A6D8();
    if (!v8)
    {
      result = sub_23C95A6F0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_23C9580C4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23C95A708();
  __break(1u);
  return result;
}

uint64_t sub_23C958188(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23C95821C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23C9583F0(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23C9583F0((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23C95821C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23C95A5E8();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_23C95838C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23C95A6CC();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_23C95A708();
  __break(1u);
LABEL_14:
  result = sub_23C95A6F0();
  __break(1u);
  return result;
}

_QWORD *sub_23C95838C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5A38);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23C9583F0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD5A38);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23C958588(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23C9584C4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23C9584C4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23C95A708();
  __break(1u);
  return result;
}

char *sub_23C958588(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23C95A708();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_23C958608(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_23C95A690();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
  OUTLINED_FUNCTION_48();
}

unint64_t sub_23C9586B0()
{
  unint64_t result;

  result = qword_256BD59F0;
  if (!qword_256BD59F0)
  {
    result = MEMORY[0x24262683C](&protocol conformance descriptor for AccessPointAnchoring, &type metadata for AccessPointAnchoring);
    atomic_store(result, (unint64_t *)&qword_256BD59F0);
  }
  return result;
}

unint64_t sub_23C9586F0()
{
  unint64_t result;

  result = qword_256BD59F8;
  if (!qword_256BD59F8)
  {
    result = MEMORY[0x24262683C](&protocol conformance descriptor for DashboardClientProxy.AccessPointUseCase, &type metadata for DashboardClientProxy.AccessPointUseCase);
    atomic_store(result, (unint64_t *)&qword_256BD59F8);
  }
  return result;
}

void sub_23C95872C()
{
  sub_23C954E3C();
}

void sub_23C958744(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_17();
}

void sub_23C958754()
{
  sub_23C954EC4();
}

void sub_23C95876C(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_17();
}

void sub_23C95877C()
{
  sub_23C954F48();
}

void sub_23C958794(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_17();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccessPointAnchoring(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 4) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AccessPointAnchoring(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23C958888 + 4 * byte_23C95C797[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C9588BC + 4 * byte_23C95C792[v4]))();
}

uint64_t sub_23C9588BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C9588C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C9588CCLL);
  return result;
}

uint64_t sub_23C9588D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C9588E0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C9588E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C9588EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C9588F8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C958904(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccessPointAnchoring()
{
  return &type metadata for AccessPointAnchoring;
}

uint64_t method lookup function for DashboardClientProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DashboardClientProxy.dashboardDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of DashboardClientProxy.dashboardDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of DashboardClientProxy.dashboardDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of DashboardClientProxy.accessPointDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of DashboardClientProxy.accessPointDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of DashboardClientProxy.accessPointDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of DashboardClientProxy.gameModeDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of DashboardClientProxy.gameModeDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of DashboardClientProxy.gameModeDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of DashboardClientProxy.showDashboard(initialState:sceneIdentifier:usingLocalEndPoint:canDismissWithGesture:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t getEnumTagSinglePayload for DashboardClientProxy.AccessPointUseCase(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 5) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DashboardClientProxy.AccessPointUseCase(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23C958B14 + 4 * byte_23C95C7A1[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23C958B48 + 4 * byte_23C95C79C[v4]))();
}

uint64_t sub_23C958B48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C958B50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C958B58);
  return result;
}

uint64_t sub_23C958B64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C958B6CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23C958B70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C958B78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DashboardClientProxy.AccessPointUseCase()
{
  return &type metadata for DashboardClientProxy.AccessPointUseCase;
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

uint64_t sub_23C958BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23C958C18(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23C957BEC(a1, a2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v3 + 40) = a1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v3 + 56) = a1;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_4_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_6_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_7_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 32) = v2;
  *(_QWORD *)(a1 + 40) = a2;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_23C95A738();
}

id OUTLINED_FUNCTION_14_1()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_17_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_arrayDestroy();
}

BOOL OUTLINED_FUNCTION_20_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_23C95A570();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_23C95A738();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_23C95A630();
}

void OUTLINED_FUNCTION_32()
{
  JUMPOUT(0x242626920);
}

void *OUTLINED_FUNCTION_35()
{
  return malloc(0x30uLL);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_unknownObjectWeakInit();
}

void OUTLINED_FUNCTION_38(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

void OUTLINED_FUNCTION_39()
{
  void *v0;

}

id OUTLINED_FUNCTION_41(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(v2, a2, v4, 1, v3);
}

id OUTLINED_FUNCTION_42(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return objectdestroy_3Tm();
}

void OUTLINED_FUNCTION_51()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_unknownObjectRelease();
}

id OUTLINED_FUNCTION_53()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 1760));
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_23C95A54C();
}

void OUTLINED_FUNCTION_61()
{
  JUMPOUT(0x242626920);
}

_QWORD *OUTLINED_FUNCTION_62(_QWORD *result)
{
  uint64_t v1;

  result[2] = 0;
  result[3] = 0;
  result[4] = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_23C95A558();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_23C95A564();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return sub_23C95A660();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_23C95A690();
}

id OUTLINED_FUNCTION_71(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return sub_23C95A5B8();
}

void OUTLINED_FUNCTION_75()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_76()
{
  return 0x72546D6F74746F62;
}

uint64_t OUTLINED_FUNCTION_78()
{
  return sub_23C95A5B8();
}

uint64_t OUTLINED_FUNCTION_79()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_80()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23C957BEC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_82()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23C957BEC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_83()
{
  return 0x696461654C706F74;
}

uint64_t OUTLINED_FUNCTION_84()
{
  return 0x6C69617254706F74;
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_task_alloc();
}

char *InternalClientProxy.__allocating_init(serviceKind:)(char *a1)
{
  objc_class *v1;
  id v3;
  char v5;

  v3 = objc_allocWithZone(v1);
  v5 = *a1;
  return ClientProxy.init(serviceKind:)(&v5);
}

char *InternalClientProxy.init(serviceKind:)(char *a1)
{
  char v2;

  v2 = *a1;
  return ClientProxy.init(serviceKind:)(&v2);
}

id InternalClientProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InternalClientProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for InternalClientProxy()
{
  return objc_opt_self();
}

uint64_t method lookup function for InternalClientProxy()
{
  return swift_lookUpClassMethod();
}

void GameOverlayUIConfig.SharedResources.__allocating_init()()
{
  swift_allocObject();
  GameOverlayUIConfig.SharedResources.init()();
  OUTLINED_FUNCTION_17();
}

uint64_t GameOverlayUIConfig.ServiceKind.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23C95919C + 4 * byte_23C95CA70[*v0]))(0xD000000000000024, 0x800000023C95ACE0);
}

uint64_t sub_23C95919C(uint64_t a1)
{
  return a1 + 5;
}

void sub_23C9591D4()
{
  sub_23C9591EC();
}

void sub_23C9591E0()
{
  sub_23C9591EC();
}

void sub_23C9591EC()
{
  uint64_t v0;

  v0 = sub_23C95A750();
  OUTLINED_FUNCTION_10_1(v0);
  sub_23C95A75C();
  OUTLINED_FUNCTION_9_2();
}

void sub_23C959224(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23C959268()
{
  sub_23C95A5D0();
  return OUTLINED_FUNCTION_3_2();
}

uint64_t sub_23C9592EC()
{
  sub_23C95A5D0();
  return OUTLINED_FUNCTION_3_2();
}

void sub_23C959328(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23C95936C()
{
  sub_23C95A5D0();
  return swift_bridgeObjectRelease();
}

void sub_23C9593B8()
{
  sub_23C9593D0();
}

void sub_23C9593C4()
{
  sub_23C9593D0();
}

void sub_23C9593D0()
{
  uint64_t v0;

  v0 = sub_23C95A750();
  OUTLINED_FUNCTION_10_1(v0);
  sub_23C95A75C();
  OUTLINED_FUNCTION_9_2();
}

unint64_t static GameOverlayUIConfig.machServiceDomain.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

unint64_t static GameOverlayUIConfig.machServiceName.getter()
{
  return OUTLINED_FUNCTION_2_1();
}

id GameOverlayUIConfig.ServiceKind.serverProtocol.getter()
{
  char *v0;

  return OUTLINED_FUNCTION_0_1(*v0);
}

id GameOverlayUIConfig.ServiceKind.clientProtocol.getter()
{
  char *v0;

  return OUTLINED_FUNCTION_0_1(*v0);
}

GameCenterOverlayService::GameOverlayUIConfig::ServiceKind_optional static GameOverlayUIConfig.ServiceKind.from(name:)@<W0>(uint64_t a1@<X0>, void *a2@<X1>, _BYTE *a3@<X8>)
{
  Swift::String v6;
  GameCenterOverlayService::GameOverlayUIConfig::ServiceKind_optional result;
  char v8;

  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  result.value = GameOverlayUIConfig.ServiceKind.init(rawValue:)(v6).value;
  if (v8 == 4)
  {
    sub_23C95A6C0();
    swift_bridgeObjectRelease();
    sub_23C95A5DC();
    result.value = sub_23C95A6FC();
    __break(1u);
  }
  else
  {
    *a3 = v8;
  }
  return result;
}

GameCenterOverlayService::GameOverlayUIConfig::ServiceKind_optional __swiftcall GameOverlayUIConfig.ServiceKind.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  GameCenterOverlayService::GameOverlayUIConfig::ServiceKind_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23C95A714();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_23C959570(char *a1)
{
  sub_23C954A40(*a1);
}

void sub_23C95957C()
{
  sub_23C9591EC();
}

void sub_23C95959C(uint64_t a1)
{
  char *v1;

  sub_23C959328(a1, *v1);
}

void sub_23C9595A4()
{
  sub_23C9593D0();
}

GameCenterOverlayService::GameOverlayUIConfig::ServiceKind_optional sub_23C9595C4(Swift::String *a1)
{
  return GameOverlayUIConfig.ServiceKind.init(rawValue:)(*a1);
}

uint64_t sub_23C9595D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = GameOverlayUIConfig.ServiceKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_QWORD *GameOverlayUIConfig.SharedResources.init()()
{
  _QWORD *v0;
  uint64_t v1;

  swift_defaultActor_initialize();
  v1 = MEMORY[0x24BEE4B00];
  v0[14] = MEMORY[0x24BEE4B00];
  v0[15] = v1;
  v0[16] = v1;
  return v0;
}

void sub_23C959620(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23C959698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_10_0();
  v4 = *(_QWORD *)(v1 + 112);
  swift_bridgeObjectRetain();
  sub_23C959948(v0 + 5, (v3 - 32) | 0x8000000000000000, v4);
  v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v6)
    __asm { BR              X10 }
  return v6;
}

void sub_23C959948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  id v6;

  if (*(_QWORD *)(a3 + 16))
  {
    v4 = sub_23C959EF0(a1, a2);
    if ((v5 & 1) != 0)
      v6 = *(id *)(*(_QWORD *)(a3 + 56) + 8 * v4);
  }
  OUTLINED_FUNCTION_17();
}

id sub_23C959988()
{
  void *v0;
  id v1;

  v0 = (void *)sub_23C95A5B8();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_interfaceWithIdentifier_, v0);

  return v1;
}

id sub_23C9599E8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];

  if (a2)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a2;
    *(_QWORD *)(v6 + 24) = a3;
    v10[4] = sub_23C95422C;
    v10[5] = v6;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_23C959AC4;
    v10[3] = &block_descriptor_0;
    v7 = _Block_copy(v10);
    swift_release();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_protocolForProtocol_interpreter_, a1, v7);

  _Block_release(v7);
  return v8;
}

id sub_23C959AC4(uint64_t a1, void *a2)
{
  uint64_t (*v2)(void);
  id v3;
  void *v4;

  v2 = *(uint64_t (**)(void))(a1 + 32);
  v3 = a2;
  v4 = (void *)v2();

  return v4;
}

id sub_23C959B00(void *a1)
{
  return objc_msgSend(a1, sel_copyAsOnewayVoid);
}

void sub_23C959B0C(uint64_t a1)
{
  sub_23C95A678();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25_0();
  sub_23C95A66C();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25_0();
  sub_23C95A5A0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25_0();
  __asm { BR              X9 }
}

uint64_t sub_23C959C18()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (v0 - 32) | 0x8000000000000000;
  OUTLINED_FUNCTION_10_0();
  v6 = *(_QWORD *)(v2 + 120);
  swift_bridgeObjectRetain();
  sub_23C959948(v3 + 5, v5, v6);
  v8 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v8)
  {
    *(_QWORD *)(v4 - 128) = 0;
    *(_QWORD *)(v4 - 120) = 0xE000000000000000;
    *(_QWORD *)(v4 - 160) = v1;
    __asm { BR              X9 }
  }
  return v8;
}

uint64_t GameOverlayUIConfig.SharedResources.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t GameOverlayUIConfig.SharedResources.__deallocating_deinit()
{
  GameOverlayUIConfig.SharedResources.deinit();
  return swift_defaultActor_deallocate();
}

void GameOverlayUIConfig.SharedResources.unownedExecutor.getter()
{
  OUTLINED_FUNCTION_7_3();
}

void sub_23C959ED8()
{
  GameOverlayUIConfig.SharedResources.unownedExecutor.getter();
}

unint64_t sub_23C959EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23C95A750();
  sub_23C95A5D0();
  v4 = sub_23C95A75C();
  return sub_23C95A3F0(a1, a2, v4);
}

unint64_t sub_23C959F54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256BD5A80;
  if (!qword_256BD5A80)
  {
    v1 = sub_23C95A66C();
    result = MEMORY[0x24262683C](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_256BD5A80);
  }
  return result;
}

unint64_t sub_23C959F94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256BD5A90;
  if (!qword_256BD5A90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256BD5A88);
    result = MEMORY[0x24262683C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256BD5A90);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242626830](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23C95A01C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v11;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v4;
  *v4 = 0x8000000000000000;
  sub_23C95A288(a1, a2, a3, isUniquelyReferenced_nonNull_native, a4);
  *v4 = v11;
  return swift_bridgeObjectRelease();
}

unint64_t sub_23C95A0A4()
{
  unint64_t result;

  result = qword_256BD5A98;
  if (!qword_256BD5A98)
  {
    result = MEMORY[0x24262683C](&protocol conformance descriptor for GameOverlayUIConfig.ServiceKind, &type metadata for GameOverlayUIConfig.ServiceKind);
    atomic_store(result, (unint64_t *)&qword_256BD5A98);
  }
  return result;
}

void type metadata accessor for GameOverlayUIConfig()
{
  OUTLINED_FUNCTION_7_3();
}

uint64_t getEnumTagSinglePayload for GameOverlayUIConfig.ServiceKind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 3) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for GameOverlayUIConfig.ServiceKind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_23C95A1C0 + 4 * byte_23C95CA9B[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23C95A1F4 + 4 * byte_23C95CA96[v4]))();
}

uint64_t sub_23C95A1F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C95A1FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C95A204);
  return result;
}

uint64_t sub_23C95A210(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C95A218);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23C95A21C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C95A224(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for GameOverlayUIConfig.ServiceKind()
{
  OUTLINED_FUNCTION_7_3();
}

uint64_t type metadata accessor for GameOverlayUIConfig.SharedResources()
{
  return objc_opt_self();
}

uint64_t method lookup function for GameOverlayUIConfig.SharedResources()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GameOverlayUIConfig.SharedResources.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of GameOverlayUIConfig.SharedResources.interface(kind:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of GameOverlayUIConfig.SharedResources.connectionQueue(kind:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

void sub_23C95A288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  _QWORD *v5;
  _QWORD **v7;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;
  uint64_t v19;

  v7 = (_QWORD **)v5;
  v11 = (_QWORD *)*v5;
  v12 = sub_23C959EF0(a2, a3);
  if (__OFADD__(v11[2], (v13 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = v12;
  v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  if ((sub_23C95A6E4() & 1) == 0)
    goto LABEL_5;
  v16 = sub_23C959EF0(a2, a3);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    sub_23C95A744();
    __break(1u);
    return;
  }
  v14 = v16;
LABEL_5:
  v18 = *v7;
  if ((v15 & 1) != 0)
  {
    v19 = v18[7];

    *(_QWORD *)(v19 + 8 * v14) = a1;
  }
  else
  {
    sub_23C95A3A8(v14, a2, a3, a1, v18);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_23C95A3A8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_23C95A3F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23C95A738() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23C95A738() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23C95A4D0()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

id OUTLINED_FUNCTION_0_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return **(id **)(v1 + 8 * a1);
}

unint64_t OUTLINED_FUNCTION_2_1()
{
  return 0xD000000000000017;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_6_2()
{
  return sub_23C959988();
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

uint64_t sub_23C95A54C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23C95A558()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23C95A564()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23C95A570()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23C95A57C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C95A588()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C95A594()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23C95A5A0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23C95A5AC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23C95A5B8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23C95A5C4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23C95A5D0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C95A5DC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23C95A5E8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23C95A5F4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23C95A600()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23C95A60C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23C95A618()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23C95A624()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23C95A630()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23C95A63C()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_23C95A648()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23C95A654()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23C95A660()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_23C95A66C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23C95A678()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23C95A684()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23C95A690()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23C95A69C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23C95A6A8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23C95A6B4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23C95A6C0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23C95A6CC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23C95A6D8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23C95A6E4()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_23C95A6F0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23C95A6FC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23C95A708()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23C95A714()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23C95A720()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23C95A72C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23C95A738()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C95A744()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23C95A750()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C95A75C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BSRectFromValue()
{
  return MEMORY[0x24BE0BCA8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

