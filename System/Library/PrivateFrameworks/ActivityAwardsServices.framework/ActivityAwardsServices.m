uint64_t TransportDispatching.register<A>(_:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1D2A9BCB4(a1, a2, a3, a4, a5, a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D2A9BD2C);
}

{
  return sub_1D2A9BCB4(a1, a2, a3, a4, a5, a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D2AA553C);
}

uint64_t static Log.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D2A98DCC(&qword_1ED978B60, (uint64_t)qword_1ED978D88, a1);
}

uint64_t SerializableAchievementCollection.achievements.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1D2A98A20()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1D2A98C94;
  return ((uint64_t (*)(int, void *, void *))((char *)&dword_1EFC9AF08 + dword_1EFC9AF08))(v2, v3, v4);
}

uint64_t type metadata accessor for TransportDispatchService()
{
  return objc_opt_self();
}

uint64_t sub_1D2A98AAC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1D2AB6634();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1D2AB6628();
}

uint64_t type metadata accessor for UnfairLock()
{
  return objc_opt_self();
}

void sub_1D2A98B40(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t UnfairLock.init()()
{
  uint64_t v0;
  _DWORD *v1;

  v1 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = 0;
  return v0;
}

uint64_t sub_1D2A98BAC()
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
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1D2A98C94;
  return ((uint64_t (*)(uint64_t, void *, void *, void *))((char *)&dword_1EFC9B190 + dword_1EFC9B190))(v2, v3, v5, v4);
}

_QWORD *SerializableAchievementCollection.__allocating_init(serializedData:)(uint64_t a1, unint64_t a2)
{
  return sub_1D2A9DE40(a1, a2);
}

uint64_t sub_1D2A98C38(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v5;
  id v6;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v3[4] = sub_1D2AB6694();
  v3[5] = v5;
  v6 = a3;
  return swift_task_switch();
}

uint64_t sub_1D2A98C94()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t SerializableAchievementCollection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t TransportDispatchService.init()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = sub_1D2AA5720(MEMORY[0x1E0DEE9D8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978B30);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v0 + 16) = v2;
  return v0;
}

uint64_t dispatch thunk of UnfairLock.acquire<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

void sub_1D2A98D6C(void (*a1)(void))
{
  uint64_t v1;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + 16));
  a1();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + 16));
}

uint64_t sub_1D2A98DCC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1D2AB6634();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1D2A98E34(uint64_t a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  if (a2)
  {
    v7 = a2;
    v8 = a4;
    v9 = sub_1D2AB6550();
    v11 = v10;

  }
  else
  {
    v12 = a4;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  v4[5] = v9;
  v4[6] = v11;
  return swift_task_switch();
}

uint64_t TransportSerializable<>.serialized()()
{
  uint64_t v0;

  sub_1D2AB649C();
  swift_allocObject();
  sub_1D2AB6490();
  v0 = sub_1D2AB6484();
  swift_release();
  return v0;
}

uint64_t sub_1D2A98F4C(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)sub_1D2AB6550();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_1D2A9E2D0((uint64_t)v4, v8);
  return swift_release();
}

uint64_t sub_1D2A98FE0(uint64_t a1, unint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
  return sub_1D2A99038(a1, a2, a3);
}

uint64_t sub_1D2A99038(uint64_t a1, unint64_t a2, id a3)
{
  id v3;
  _BYTE *v4;

  if (a3)
  {
    v3 = a3;
LABEL_5:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
    return sub_1D2AB67E4();
  }
  if (a2 >> 60 == 15)
  {
    sub_1D2A990E0();
    swift_allocError();
    *v4 = 2;
    goto LABEL_5;
  }
  sub_1D2A9E2E4(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
  return sub_1D2AB67F0();
}

unint64_t sub_1D2A990E0()
{
  unint64_t result;

  result = qword_1ED978800;
  if (!qword_1ED978800)
  {
    result = MEMORY[0x1D82426B0](&protocol conformance descriptor for ProxyError, &type metadata for ProxyError);
    atomic_store(result, (unint64_t *)&qword_1ED978800);
  }
  return result;
}

uint64_t sub_1D2A991CC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  _BYTE v30[16];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v30[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v30[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_1D2AB64E4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v30[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = (uint64_t)&v1[OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_dateComponents];
  swift_beginAccess();
  sub_1D2A99548(v12, (uint64_t)v7);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_1D2A9950C((uint64_t)v7, &qword_1ED9787B0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 32))(v11, v7, v8);
  v14 = *(void **)&v1[OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_achievementStore];
  v15 = (void *)sub_1D2AB64A8();
  v16 = objc_msgSend(v14, sel_achievementsForEarnedDateComponents_, v15);

  sub_1D2A9BC78();
  sub_1D2A9D770();
  v17 = sub_1D2AB6820();

  v18 = swift_bridgeObjectRetain();
  sub_1D2AA1668(v18, v17);
  v20 = v19;
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
  {
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
    return swift_bridgeObjectRelease();
  }
  if ((v17 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(v17 + 16))
      goto LABEL_7;
LABEL_9:
    v22 = MEMORY[0x1E0DEE9D8];
    goto LABEL_10;
  }
  if (!sub_1D2AB6988())
    goto LABEL_9;
LABEL_7:
  v21 = swift_bridgeObjectRetain();
  v22 = sub_1D2A9D338(v21);
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  type metadata accessor for SerializableAchievementCollection();
  *(_QWORD *)(swift_initStackObject() + 16) = v22;
  SerializableAchievementCollection.serialized()();
  v24 = v23;
  v26 = v25;
  swift_bridgeObjectRelease();
  if (v26 >> 60 != 15)
  {
    v27 = sub_1D2AB6808();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v4, 1, 1, v27);
    v28 = (_QWORD *)swift_allocObject();
    v28[2] = 0;
    v28[3] = 0;
    v28[4] = v1;
    v28[5] = v24;
    v28[6] = v26;
    v29 = v1;
    sub_1D2A9B810(v24, v26);
    sub_1D2AA1B14((uint64_t)v4, (uint64_t)&unk_1EFC9ADA8, (uint64_t)v28);
    swift_release();
    sub_1D2A9E2D0(v24, v26);
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1D2A9950C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D2A99548(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t TransportDispatching.unregister(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v4;
  uint64_t *v5;
  os_unfair_lock_s *v6;

  v4 = *(os_unfair_lock_s **)((*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3) + 16);
  v5 = (uint64_t *)&v4[4];
  v6 = v4 + 6;
  os_unfair_lock_lock(v4 + 6);
  sub_1D2A9BE8C(v5, a1);
  os_unfair_lock_unlock(v6);
  return swift_release();
}

uint64_t sub_1D2A99600(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1D2A9962C()
{
  uint64_t v0;

  sub_1D2A9964C(*(void **)(v0 + 16), "XPC connection for endpoint %{public}s invalidated.");
}

void sub_1D2A9964C(void *a1, const char *a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;

  if (qword_1ED978B60 != -1)
    swift_once();
  v4 = sub_1D2AB6634();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED978D88);
  v11 = a1;
  v5 = sub_1D2AB661C();
  v6 = sub_1D2AB6868();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = *(_QWORD *)&v11[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_name];
    v10 = *(_QWORD *)&v11[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_name + 8];
    swift_bridgeObjectRetain();
    sub_1D2A9CC8C(v9, v10, &v12);
    sub_1D2AB68E0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D2A96000, v5, v6, a2, v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v8, -1, -1);
    MEMORY[0x1D8242734](v7, -1, -1);

  }
  else
  {

  }
}

void sub_1D2A99B3C(_BYTE *a1, uint64_t a2)
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  unint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29[5];

  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v4)
  {
    __break(1u);
    return;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_isStandalonePhoneFitnessMode);

  if (a1[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_platform] != 2
    && (a1[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_platform] || v6 == 0))
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v8 = sub_1D2AB6634();
    __swift_project_value_buffer(v8, (uint64_t)qword_1ED9786E8);
    v9 = sub_1D2AB661C();
    v10 = sub_1D2AB6874();
    if (!os_log_type_enabled(v9, v10))
      goto LABEL_24;
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D2A96000, v9, v10, "Not notifying for achievement because platform is unsupported for notifications", v11, 2u);
    v12 = v11;
LABEL_23:
    MEMORY[0x1D8242734](v12, -1, -1);
LABEL_24:

    return;
  }
  v13 = sub_1D2AB6694();
  v15 = v14;
  v16 = *(void **)&a1[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_fitnessAppsStateObserver];
  v17 = (void *)sub_1D2AB6688();
  v18 = objc_msgSend(v16, sel_installStateForBundleIdentifier_, v17);

  if (v18 != (id)1)
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v24 = sub_1D2AB6634();
    __swift_project_value_buffer(v24, (uint64_t)qword_1ED9786E8);
    swift_bridgeObjectRetain();
    v9 = sub_1D2AB661C();
    v25 = sub_1D2AB6874();
    if (!os_log_type_enabled(v9, v25))
    {

      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v29[0] = v27;
    *(_DWORD *)v26 = 136315138;
    swift_bridgeObjectRetain();
    v29[4] = sub_1D2A9CC8C(v13, v15, v29);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D2A96000, v9, v25, "Not notifying for achievement because %s is not installed", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v27, -1, -1);
    v12 = v26;
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  if ((objc_msgSend(*(id *)(*__swift_project_boxed_opaque_existential_1(&a1[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationSuppresionProvider], *(_QWORD *)&a1[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationSuppresionProvider+ 24])+ 16), sel_notificationsSuppressed) & 1) != 0)
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v19 = sub_1D2AB6634();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED9786E8);
    v20 = sub_1D2AB661C();
    v21 = sub_1D2AB6874();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D2A96000, v20, v21, "Coaching notifications are suppressed, saving received achievements to consider for notification later", v22, 2u);
      MEMORY[0x1D8242734](v22, -1, -1);
    }

    swift_beginAccess();
    v23 = swift_bridgeObjectRetain();
    sub_1D2AA68C4(v23);
    swift_endAccess();
  }
  else
  {
    v28 = a1;
    sub_1D2A9D038(a2, (uint64_t)v28, v6);

  }
}

uint64_t sub_1D2A99F80(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[7];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = *(_QWORD *)&a2[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_lock];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v9 + 16));
  sub_1D2A9A138(a2, a1, aBlock);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v9 + 16));
  v10 = (void *)aBlock[0];
  v11 = (void *)sub_1D2AB6544();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_1D2A98FE0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D2A98F4C;
  aBlock[3] = &block_descriptor_35;
  v14 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v10, sel_transportRequest_data_completion_, a3, v11, v14);
  _Block_release(v14);

  return swift_unknownObjectRelease();
}

void sub_1D2A9A138(char *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  char *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _BYTE *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _BYTE *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD aBlock[8];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = *(void **)&a1[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_connection];
  if (v9)
  {
    v27 = a3;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v6);
    v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a1;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    aBlock[4] = sub_1D2AB0174;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D2AAF8DC;
    aBlock[3] = &block_descriptor_41;
    v12 = _Block_copy(aBlock);
    v13 = v9;
    v14 = a1;
    swift_release();
    v15 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v12);
    _Block_release(v12);
    sub_1D2AB6928();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978AE8);
    if ((swift_dynamicCast() & 1) != 0)
    {

      *v27 = aBlock[7];
    }
    else
    {
      if (qword_1ED978B60 != -1)
        swift_once();
      v21 = sub_1D2AB6634();
      __swift_project_value_buffer(v21, (uint64_t)qword_1ED978D88);
      v22 = sub_1D2AB661C();
      v23 = sub_1D2AB6868();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1D2A96000, v22, v23, "No proxy when trying to send request", v24, 2u);
        MEMORY[0x1D8242734](v24, -1, -1);
      }

      sub_1D2A990E0();
      swift_allocError();
      *v25 = 1;
      swift_willThrow();

    }
  }
  else
  {
    if (qword_1ED978B60 != -1)
      swift_once();
    v16 = sub_1D2AB6634();
    __swift_project_value_buffer(v16, (uint64_t)qword_1ED978D88);
    v17 = sub_1D2AB661C();
    v18 = sub_1D2AB6868();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D2A96000, v17, v18, "No connection when trying to send request", v19, 2u);
      MEMORY[0x1D8242734](v19, -1, -1);
    }

    sub_1D2A990E0();
    swift_allocError();
    *v20 = 0;
    swift_willThrow();
  }
}

uint64_t sub_1D2A9A520(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t aBlock;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  void (*v34)();
  uint64_t v35;
  char v36;
  _OWORD v37[2];

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_requiredEntitlements);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v5 = (unint64_t *)(v3 + 40);
    while (1)
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      swift_bridgeObjectRetain();
      v8 = (void *)sub_1D2AB6688();
      v9 = objc_msgSend(a1, sel_valueForEntitlement_, v8);

      if (v9)
      {
        sub_1D2AB6928();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v37, 0, sizeof(v37));
      }
      sub_1D2A9CFF0((uint64_t)v37, (uint64_t)&aBlock);
      if (!v33)
        break;
      if ((swift_dynamicCast() & 1) == 0 || (v36 & 1) == 0)
        goto LABEL_17;
      v5 += 2;
      swift_bridgeObjectRelease();
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        v1 = v29;
        goto LABEL_11;
      }
    }
    sub_1D2AA6430((uint64_t)&aBlock);
LABEL_17:
    swift_bridgeObjectRelease();
    if (qword_1ED978B60 != -1)
      swift_once();
    v24 = sub_1D2AB6634();
    __swift_project_value_buffer(v24, (uint64_t)qword_1ED978D88);
    swift_bridgeObjectRetain();
    v25 = sub_1D2AB661C();
    v26 = sub_1D2AB6868();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      aBlock = v28;
      *(_DWORD *)v27 = 141558274;
      *(_QWORD *)&v37[0] = 1752392040;
      sub_1D2AB68E0();
      *(_WORD *)(v27 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v37[0] = sub_1D2A9CC8C(v7, v6, &aBlock);
      sub_1D2AB68E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D2A96000, v25, v26, "Rejecting connection missing entitlement: %{mask.hash}s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v28, -1, -1);
      MEMORY[0x1D8242734](v27, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  else
  {
LABEL_11:
    v10 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EFC9D348);
    objc_msgSend(a1, sel_setExportedInterface_, v10);

    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3B50]), sel_init);
    objc_msgSend(a1, sel_setRemoteObjectInterface_, v11);

    objc_msgSend(a1, sel_setExportedObject_, v1);
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a1;
    v34 = sub_1D2AA6494;
    v35 = v12;
    v13 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v31 = 1107296256;
    v32 = sub_1D2A99600;
    v33 = &block_descriptor;
    v14 = _Block_copy(&aBlock);
    v15 = a1;
    swift_release();
    objc_msgSend(v15, sel_setInvalidationHandler_, v14);
    _Block_release(v14);
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v34 = sub_1D2AA64B4;
    v35 = v16;
    aBlock = v13;
    v31 = 1107296256;
    v32 = sub_1D2A99600;
    v33 = &block_descriptor_18;
    v17 = _Block_copy(&aBlock);
    v18 = v15;
    swift_release();
    objc_msgSend(v18, sel_setInterruptionHandler_, v17);
    _Block_release(v17);
    objc_msgSend(v18, sel_resume);
    if (qword_1ED978B60 != -1)
      swift_once();
    v19 = sub_1D2AB6634();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED978D88);
    v20 = sub_1D2AB661C();
    v21 = sub_1D2AB6874();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D2A96000, v20, v21, "Endpoint provider XPC connection established.", v22, 2u);
      MEMORY[0x1D8242734](v22, -1, -1);
    }

    return 1;
  }
}

uint64_t sub_1D2A9AA40()
{
  uint64_t v0;
  void *v1;
  void (**v2)(_QWORD, _QWORD, _QWORD);
  char *v3;
  id v4;

  v1 = *(void **)(v0 + 16);
  v2 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 24);
  v3 = sub_1D2A9AAE4(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  v4 = objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_listener], sel_endpoint);

  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, id, _QWORD))v2)[2](v2, v4, 0);
  _Block_release(v2);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

char *sub_1D2A9AAE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  char *v10;
  uint64_t v11;
  char *v13;

  v3 = v2;
  if (qword_1ED978B60 != -1)
    swift_once();
  v6 = sub_1D2AB6634();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED978D88);
  swift_bridgeObjectRetain_n();
  v7 = sub_1D2AB661C();
  v8 = sub_1D2AB6874();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (char *)swift_slowAlloc();
    v13 = v10;
    *(_DWORD *)v9 = 136446210;
    swift_bridgeObjectRetain();
    sub_1D2A9CC8C(a1, a2, (uint64_t *)&v13);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D2A96000, v7, v8, "Instantiating endpoint for %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v10, -1, -1);
    MEMORY[0x1D8242734](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_lock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v11 + 16));
  sub_1D2A9ACC4(v3, a1, a2, &v13);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v11 + 16));
  return v13;
}

void sub_1D2A9ACC4(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  id v21;
  char *v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25[3];
  uint64_t v26;

  v6 = (uint64_t *)(a1 + OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_endpointsByEndpointName);
  swift_beginAccess();
  v7 = *v6;
  if (*(_QWORD *)(*v6 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8 = sub_1D2A9B108(a2, a3);
    if ((v9 & 1) != 0)
    {
      v10 = (char *)*(id *)(*(_QWORD *)(v7 + 56) + 8 * v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_1ED978B60 != -1)
        swift_once();
      v11 = sub_1D2AB6634();
      __swift_project_value_buffer(v11, (uint64_t)qword_1ED978D88);
      swift_bridgeObjectRetain_n();
      v12 = sub_1D2AB661C();
      v13 = sub_1D2AB6874();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        v15 = swift_slowAlloc();
        v25[0] = v15;
        *(_DWORD *)v14 = 136446210;
        swift_bridgeObjectRetain();
        v26 = sub_1D2A9CC8C(a2, a3, v25);
        sub_1D2AB68E0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1D2A96000, v12, v13, "Found existing endpoint for %{public}s", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D8242734](v15, -1, -1);
        MEMORY[0x1D8242734](v14, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      goto LABEL_14;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_1ED978B60 != -1)
    swift_once();
  v16 = sub_1D2AB6634();
  __swift_project_value_buffer(v16, (uint64_t)qword_1ED978D88);
  swift_bridgeObjectRetain_n();
  v17 = sub_1D2AB661C();
  v18 = sub_1D2AB6874();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v25[0] = v20;
    *(_DWORD *)v19 = 136446210;
    swift_bridgeObjectRetain();
    v26 = sub_1D2A9CC8C(a2, a3, v25);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D2A96000, v17, v18, "Creating new endpoint for %{public}s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v20, -1, -1);
    MEMORY[0x1D8242734](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v21 = objc_allocWithZone((Class)type metadata accessor for XPCEndpoint());
  swift_bridgeObjectRetain();
  v22 = XPCEndpoint.init(endpointName:)(a2, a3);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v10 = v22;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v26 = *v6;
  *v6 = 0x8000000000000000;
  sub_1D2AA3548((uint64_t)v10, a2, a3, isUniquelyReferenced_nonNull_native);
  *v6 = v26;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_14:
  *a4 = v10;
}

unint64_t sub_1D2A9B108(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D2AB6B74();
  sub_1D2AB66C4();
  v4 = sub_1D2AB6B8C();
  return sub_1D2A9B16C(a1, a2, v4);
}

unint64_t sub_1D2A9B16C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1D2AB6B14() & 1) == 0)
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
      while (!v14 && (sub_1D2AB6B14() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1D2A9B24C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD v25[3];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED978AF8 != -1)
    swift_once();
  v10 = sub_1D2AB6634();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED978B00);
  swift_bridgeObjectRetain();
  v11 = sub_1D2AB661C();
  v12 = sub_1D2AB6874();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    if ((a1 & 0xC000000000000001) != 0)
      v14 = sub_1D2AB6988();
    else
      v14 = *(_QWORD *)(a1 + 16);
    v25[1] = v14;
    sub_1D2AB68E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D2A96000, v11, v12, a2, v13, 0xCu);
    MEMORY[0x1D8242734](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v15 = swift_bridgeObjectRetain();
  v16 = sub_1D2A9D338(v15);
  swift_bridgeObjectRelease();
  type metadata accessor for SerializableAchievementCollection();
  *(_QWORD *)(swift_initStackObject() + 16) = v16;
  SerializableAchievementCollection.serialized()();
  v18 = v17;
  v20 = v19;
  result = swift_release();
  if (v20 >> 60 != 15)
  {
    v22 = sub_1D2AB6808();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
    v23 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = 0;
    v24[3] = 0;
    v24[4] = v23;
    v24[5] = v18;
    v24[6] = v20;
    sub_1D2A9E2E4(v18, v20);
    sub_1D2AAC670((uint64_t)v9, a4, (uint64_t)v24);
    swift_release();
    sub_1D2A9E2D0(v18, v20);
    return sub_1D2A9B4EC((uint64_t)v9);
  }
  return result;
}

uint64_t sub_1D2A9B4EC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D2A9B52C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(void **)(v0 + 24);
  sub_1D2A9B64C(*(_QWORD *)(v0 + 16), v2, v1);
  v5 = v4;
  v7 = v6;

  sub_1D2A9E2D0(v2, v1);
  if (v7 >> 60 == 15)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v8 = sub_1D2AB6544();
    sub_1D2A9E2D0(v5, v7);
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 32);
  v10[2](v10, v8, 0);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t dispatch thunk of TransportDispatchService.dispatch(_:data:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

void sub_1D2A9B64C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v8;
  unint64_t v9;
  os_unfair_lock_s *v10;
  void (*v11)(__int128 *__return_ptr, _QWORD *);
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v8 = *(os_unfair_lock_s **)(v3 + 16);
  v9 = (unint64_t)&v8[4];
  v10 = v8 + 6;
  os_unfair_lock_lock(v8 + 6);
  sub_1D2A9BF30(v9, a1, &v16);
  if (v4)
  {
    os_unfair_lock_unlock(v10);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v10);
    v11 = (void (*)(__int128 *__return_ptr, _QWORD *))v16;
    if ((_QWORD)v16)
    {
      v15[0] = a2;
      v15[1] = a3;
      swift_retain();
      v11(&v16, v15);
      v13 = v17;
      if (v17)
      {
        v14 = v18;
        __swift_project_boxed_opaque_existential_1(&v16, v17);
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
        sub_1D2AA58A8((uint64_t)v11);
        sub_1D2AA58A8((uint64_t)v11);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v16);
      }
      else
      {
        sub_1D2AA58A8((uint64_t)v11);
        sub_1D2AA58A8((uint64_t)v11);
        sub_1D2A9BAE4((uint64_t)&v16);
      }
    }
    else
    {
      sub_1D2AA42D8();
      swift_allocError();
      *v12 = 1;
      swift_willThrow();
    }
  }
}

uint64_t sub_1D2A9B810(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1D2A9E2E4(a1, a2);
  return a1;
}

uint64_t sub_1D2A9B824(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

void sub_1D2A9B84C()
{
  SerializableAchievementCollection.serialized()();
}

uint64_t sub_1D2A9B86C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1D2A9B888(a1, a2, *(void (**)(char *))(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_1D2A9B888@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void (*a3)(char *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t (*v18)(uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v20;
  void (*v21)(char *);
  uint64_t v22;
  _BYTE *v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *);
  uint64_t v28;
  uint64_t v29;

  v27 = a3;
  v28 = a4;
  v25 = a7;
  v26 = sub_1D2AB68C8();
  v12 = *(_QWORD *)(v26 - 8);
  v13 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v15 = (char *)&v25 - v14;
  v29 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a6 + 16);
  sub_1D2A9B810(a1, a2);
  result = v18(a1, a2, a5, a6);
  if (!v7)
  {
    v20 = v26;
    v21 = v27;
    v22 = v29;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v15, 1, a5) == 1)
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v20);
      sub_1D2AA42D8();
      swift_allocError();
      *v23 = 0;
      return swift_willThrow();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v17, v15, a5);
      v21(v17);
      result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v17, a5);
      v24 = (_OWORD *)v25;
      *(_QWORD *)(v25 + 32) = 0;
      *v24 = 0u;
      v24[1] = 0u;
    }
  }
  return result;
}

_QWORD *sub_1D2A9BA2C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;

  result = sub_1D2A9DE40(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

double sub_1D2A9BA54@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  double result;
  uint64_t v5;

  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  v3 = v5;
  if (v5)
  {
    *(_QWORD *)(a1 + 24) = type metadata accessor for SerializableAchievementCollection();
    *(_QWORD *)(a1 + 32) = &protocol witness table for SerializableAchievementCollection;
    *(_QWORD *)a1 = v3;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1D2A9BABC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_1D2A9BAE4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9ADF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D2A9BB24()
{
  uint64_t v0;

  return sub_1D2A9BB2C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1D2A9BB2C(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v1 = *(void **)(a1 + OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_achievementStore);
  objc_msgSend(v1, sel_recalculateProgressForAllAchievements);
  v2 = objc_msgSend(v1, sel_allAchievements);
  sub_1D2A9BC78();
  sub_1D2A9D770();
  sub_1D2AB6820();

  v3 = swift_bridgeObjectRetain();
  v4 = sub_1D2A9D338(v3);
  swift_bridgeObjectRelease_n();
  type metadata accessor for SerializableAchievementCollection();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v4;
  return result;
}

uint64_t sub_1D2A9BBD8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  id v12;

  sub_1D2A9BC78();
  sub_1D2A9D770();
  v11 = sub_1D2AB6820();
  swift_unknownObjectRetain();
  v12 = a1;
  sub_1D2A9B24C(v11, a5, a6, a7);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

unint64_t sub_1D2A9BC78()
{
  unint64_t result;

  result = qword_1ED978B70;
  if (!qword_1ED978B70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED978B70);
  }
  return result;
}

uint64_t sub_1D2A9BCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  (*(void (**)(uint64_t, uint64_t))(a6 + 8))(a4, a6);
  a8(a1, a2, a3, a5, a7);
  return swift_release();
}

uint64_t sub_1D2A9BD2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  os_unfair_lock_s *v14;

  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = a2;
  v11[5] = a3;
  v12 = *(_QWORD *)(v5 + 16);
  v13 = (uint64_t *)(v12 + 16);
  v14 = (os_unfair_lock_s *)(v12 + 24);
  swift_retain();
  os_unfair_lock_lock(v14);
  sub_1D2A9BDDC(v13, a1, (uint64_t)sub_1D2A9B86C, (uint64_t)v11);
  os_unfair_lock_unlock(v14);
  return swift_release();
}

uint64_t sub_1D2A9BDDC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *a1;
  *a1 = 0x8000000000000000;
  sub_1D2A9BFA0((uint64_t)sub_1D2A9B824, v8, a2, isUniquelyReferenced_nonNull_native);
  *a1 = v11;
  return swift_bridgeObjectRelease();
}

unint64_t sub_1D2A9BE8C(uint64_t *a1, uint64_t a2)
{
  unint64_t result;
  char v4;
  unint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;

  result = sub_1D2A9C0DC(a2);
  if ((v4 & 1) != 0)
  {
    v5 = result;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v7 = *a1;
    v8 = *a1;
    *a1 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1D2AA393C();
      v7 = v8;
    }
    sub_1D2A9C4A4(v5, v7);
    *a1 = v7;
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1D2A9BF30@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4;
  __int128 v5;
  char v6;
  __int128 v7;

  v4 = *(_QWORD *)result;
  v5 = 0uLL;
  if (*(_QWORD *)(*(_QWORD *)result + 16))
  {
    result = sub_1D2A9C0DC(a2);
    v5 = 0uLL;
    if ((v6 & 1) != 0)
    {
      v7 = *(_OWORD *)(*(_QWORD *)(v4 + 56) + 16 * result);
      result = swift_retain();
      v5 = v7;
    }
  }
  *a3 = v5;
  return result;
}

uint64_t sub_1D2A9BFA0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1D2A9C0DC(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1D2AA393C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_release();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_QWORD *)(v18[6] + 8 * v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_1D2A9C1D0(result, a4 & 1);
  result = sub_1D2A9C0DC(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for AACTransportItem(0);
  result = sub_1D2AB6B38();
  __break(1u);
  return result;
}

unint64_t sub_1D2A9C0DC(uint64_t a1)
{
  uint64_t v2;

  sub_1D2AB6B74();
  sub_1D2AB6B80();
  v2 = sub_1D2AB6B8C();
  return sub_1D2A9C134(a1, v2);
}

unint64_t sub_1D2A9C134(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_1D2A9C1D0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  __int128 v30;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED978A20);
  result = sub_1D2AB6AD8();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v29 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v12)
          goto LABEL_33;
        v21 = v29[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v12)
            goto LABEL_33;
          v21 = v29[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v28 = 1 << *(_BYTE *)(v5 + 32);
              if (v28 >= 64)
                bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v29 = -1 << v28;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v29[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v12)
                  goto LABEL_33;
                v21 = v29[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v30 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v19);
      if ((a2 & 1) == 0)
        swift_retain();
      sub_1D2AB6B74();
      sub_1D2AB6B80();
      result = sub_1D2AB6B8C();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v17) = v27;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v17) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

unint64_t sub_1D2A9C4A4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1D2AB6934();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1D2AB6B74();
        sub_1D2AB6B80();
        result = sub_1D2AB6B8C();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_QWORD *)(v10 + 8 * v3);
          v12 = (_QWORD *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1D2A9C65C(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t aBlock;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  void (*v43)();
  uint64_t v44;
  char v45;
  _OWORD v46[2];

  v2 = *(_QWORD *)&v1[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_requiredEntitlements];
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = (unint64_t *)(v2 + 40);
    while (1)
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      swift_bridgeObjectRetain();
      v7 = (void *)sub_1D2AB6688();
      v8 = objc_msgSend(a1, sel_valueForEntitlement_, v7);

      if (v8)
      {
        sub_1D2AB6928();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v46, 0, sizeof(v46));
      }
      sub_1D2A9CFF0((uint64_t)v46, (uint64_t)&aBlock);
      if (!v42)
        break;
      if ((swift_dynamicCast() & 1) == 0 || (v45 & 1) == 0)
        goto LABEL_18;
      v4 += 2;
      swift_bridgeObjectRelease();
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        v1 = v37;
        goto LABEL_11;
      }
    }
    sub_1D2A9950C((uint64_t)&aBlock, &qword_1ED978A40);
LABEL_18:
    swift_bridgeObjectRelease();
    if (qword_1ED978B60 != -1)
      swift_once();
    v32 = sub_1D2AB6634();
    __swift_project_value_buffer(v32, (uint64_t)qword_1ED978D88);
    swift_bridgeObjectRetain();
    v33 = sub_1D2AB661C();
    v34 = sub_1D2AB6868();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      aBlock = v36;
      *(_DWORD *)v35 = 141558274;
      *(_QWORD *)&v46[0] = 1752392040;
      sub_1D2AB68E0();
      *(_WORD *)(v35 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v46[0] = sub_1D2A9CC8C(v6, v5, &aBlock);
      sub_1D2AB68E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D2A96000, v33, v34, "Rejecting connection missing entitlement: %{mask.hash}s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v36, -1, -1);
      MEMORY[0x1D8242734](v35, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  else
  {
LABEL_11:
    if (qword_1ED9788D8 != -1)
      swift_once();
    v9 = sub_1D2AB6634();
    __swift_project_value_buffer(v9, (uint64_t)qword_1ED9786E8);
    v10 = v1;
    v11 = sub_1D2AB661C();
    v12 = sub_1D2AB6874();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      aBlock = v14;
      *(_DWORD *)v13 = 136446210;
      v15 = *(_QWORD *)&v10[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_name];
      v16 = *(_QWORD *)&v10[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_name + 8];
      swift_bridgeObjectRetain();
      *(_QWORD *)&v46[0] = sub_1D2A9CC8C(v15, v16, &aBlock);
      sub_1D2AB68E0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D2A96000, v11, v12, "XPCEndpoint with name %{public}s accepting new NSXPCConnection.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v14, -1, -1);
      MEMORY[0x1D8242734](v13, -1, -1);

    }
    else
    {

    }
    v17 = (void *)objc_opt_self();
    v18 = objc_msgSend(v17, sel_interfaceWithProtocol_, &unk_1EFC9D500);
    objc_msgSend(a1, sel_setExportedInterface_, v18);

    v19 = objc_msgSend(v17, sel_interfaceWithProtocol_, &unk_1EFC9D500);
    objc_msgSend(a1, sel_setRemoteObjectInterface_, v19);

    objc_msgSend(a1, sel_setExportedObject_, v10);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v10;
    v43 = sub_1D2A9962C;
    v44 = v20;
    v21 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v40 = 1107296256;
    v41 = sub_1D2A99600;
    v42 = &block_descriptor_3;
    v22 = _Block_copy(&aBlock);
    v23 = v10;
    swift_release();
    objc_msgSend(a1, sel_setInvalidationHandler_, v22);
    _Block_release(v22);
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v43 = sub_1D2AB0078;
    v44 = v24;
    aBlock = v21;
    v40 = 1107296256;
    v41 = sub_1D2A99600;
    v42 = &block_descriptor_29;
    v25 = _Block_copy(&aBlock);
    v26 = v23;
    swift_release();
    objc_msgSend(a1, sel_setInterruptionHandler_, v25);
    _Block_release(v25);
    objc_msgSend(a1, sel_resume);
    v27 = *(_QWORD *)&v26[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_lock];
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v27 + 16));
    v28 = OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_connection;
    objc_msgSend(*(id *)&v26[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_connection], sel_invalidate);
    v29 = *(void **)&v26[v28];
    *(_QWORD *)&v26[v28] = a1;
    v30 = a1;

    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v27 + 16));
    return 1;
  }
}

uint64_t sub_1D2A9CC8C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1D2A9CD98(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1D2A9CD5C((uint64_t)v12, *a3);
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
      sub_1D2A9CD5C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1D2A9CD5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D2A9CD98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1D2AB68EC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1D2AB6078(a5, a6);
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
  v8 = sub_1D2AB6A54();
  if (!v8)
  {
    sub_1D2AB6AA8();
    __break(1u);
LABEL_17:
    result = sub_1D2AB6AF0();
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D8242698]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1D2A9CFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1D2A9D038(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  void *v30;

  v4 = v3;
  v6 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1D2AB6958();
    sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
    sub_1D2A9D770();
    sub_1D2AB6844();
    v6 = v25;
    v23 = v26;
    v7 = v27;
    v8 = v28;
    v9 = v29;
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v23 = a1 + 56;
    v11 = ~v10;
    v12 = -v10;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v9 = v13 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v7 = v11;
    v8 = 0;
  }
  v22 = (unint64_t)(v7 + 64) >> 6;
  v14 = a3 & 1;
  if ((v6 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_8:
  if (sub_1D2AB69B8())
  {
    sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v30;
    swift_unknownObjectRelease();
    v16 = v8;
    v17 = v9;
    while (v15)
    {
      v30 = v15;
      sub_1D2A9E348(&v30, a2, v14);

      if (v4)
        break;
      v8 = v16;
      v9 = v17;
      if (v6 < 0)
        goto LABEL_8;
LABEL_11:
      if (v9)
      {
        v17 = (v9 - 1) & v9;
        v18 = __clz(__rbit64(v9)) | (v8 << 6);
        v16 = v8;
      }
      else
      {
        v16 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          return;
        }
        if (v16 >= v22)
          break;
        v19 = *(_QWORD *)(v23 + 8 * v16);
        if (!v19)
        {
          v20 = v8 + 2;
          if (v8 + 2 >= v22)
            break;
          v19 = *(_QWORD *)(v23 + 8 * v20);
          if (v19)
            goto LABEL_22;
          v20 = v8 + 3;
          if (v8 + 3 >= v22)
            break;
          v19 = *(_QWORD *)(v23 + 8 * v20);
          if (v19)
            goto LABEL_22;
          v20 = v8 + 4;
          if (v8 + 4 >= v22)
            break;
          v19 = *(_QWORD *)(v23 + 8 * v20);
          if (v19)
          {
LABEL_22:
            v16 = v20;
          }
          else
          {
            v16 = v8 + 5;
            if (v8 + 5 >= v22)
              break;
            v19 = *(_QWORD *)(v23 + 8 * v16);
            if (!v19)
            {
              v21 = v8 + 6;
              while (v22 != v21)
              {
                v19 = *(_QWORD *)(v23 + 8 * v21++);
                if (v19)
                {
                  v16 = v21 - 1;
                  goto LABEL_23;
                }
              }
              break;
            }
          }
        }
LABEL_23:
        v17 = (v19 - 1) & v19;
        v18 = __clz(__rbit64(v19)) + (v16 << 6);
      }
      v15 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v18);
    }
  }
  sub_1D2AA8BE4();
}

uint64_t sub_1D2A9D338(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_1D2AB6988();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x1E0DEE9D8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978DC8);
    v3 = (_QWORD *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v5 = v4 - 32;
    if (v4 < 32)
      v5 = v4 - 25;
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v6 = sub_1D2A9D430(&v8, v3 + 4, v2, a1);
  result = sub_1D2AA8BE4();
  if (v6 == (_QWORD *)v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

_QWORD *sub_1D2A9D430(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;

  v4 = a4;
  v6 = a2;
  v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_1D2AB6958();
    sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
    sub_1D2A9D770();
    result = (_QWORD *)sub_1D2AB6844();
    v4 = v27;
    v8 = v28;
    v9 = v29;
    v10 = v30;
    v11 = v31;
    v24 = v7;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v12 = 0;
LABEL_46:
    *v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (_QWORD *)v12;
  }
  v10 = 0;
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v8 = a4 + 56;
  v9 = ~v20;
  v21 = -v20;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v11 = v22 & *(_QWORD *)(a4 + 56);
  v24 = result;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0)
    goto LABEL_48;
  v12 = 0;
  v25 = (unint64_t)(v9 + 64) >> 6;
  v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_1D2AB69B8())
        goto LABEL_45;
      sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v26;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v26)
        goto LABEL_45;
      goto LABEL_8;
    }
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v16 >= v25)
    {
      v11 = 0;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v16);
    if (v17)
      goto LABEL_23;
    v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25)
        goto LABEL_42;
      v17 = *(_QWORD *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        v16 = v10 + 3;
        goto LABEL_23;
      }
      v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      v17 = *(_QWORD *)(v8 + 8 * v18);
      if (!v17)
      {
        v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          v11 = 0;
          v10 = v18;
          goto LABEL_45;
        }
        v17 = *(_QWORD *)(v8 + 8 * v16);
        if (!v17)
        {
          v19 = v10 + 6;
          while (v25 != v19)
          {
            v17 = *(_QWORD *)(v8 + 8 * v19++);
            if (v17)
            {
              v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          v11 = 0;
          v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    v16 = v18;
LABEL_23:
    v11 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v16 << 6);
    v10 = v16;
LABEL_7:
    result = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    v15 = result;
    if (!result)
      goto LABEL_45;
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      v12 = a3;
LABEL_45:
      v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_1D2A9D738(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1D2A9D770()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1ED9789D0;
  if (!qword_1ED9789D0)
  {
    v1 = sub_1D2A9BC78();
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED9789D0);
  }
  return result;
}

void SerializableAchievementCollection.serialized()()
{
  uint64_t v0;
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _BYTE *v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _BYTE *v16;
  unint64_t v17;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5010]), sel_init);
  if (!v1)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v8 = 0;
    swift_willThrow();
    return;
  }
  v2 = v1;
  v3 = *(_QWORD *)(v0 + 16);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1D2AB6AC0();
    if (v4)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x1E0DEE9D8];
    goto LABEL_15;
  }
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4)
    goto LABEL_14;
LABEL_4:
  v17 = MEMORY[0x1E0DEE9D8];
  sub_1D2AB6A78();
  if (v4 < 0)
  {
    __break(1u);
    return;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
    v5 = 0;
    do
    {
      v6 = v5 + 1;
      MEMORY[0x1D8242098]();
      v7 = (id)ACHCodableFromAchievement();
      swift_unknownObjectRelease();
      sub_1D2AB6A60();
      sub_1D2AB6A84();
      sub_1D2AB6A90();
      sub_1D2AB6A6C();
      v5 = v6;
    }
    while (v4 != v6);
  }
  else
  {
    v9 = v3 + 32;
    do
    {
      v9 += 8;
      v10 = (id)ACHCodableFromAchievement();
      sub_1D2AB6A60();
      sub_1D2AB6A84();
      sub_1D2AB6A90();
      sub_1D2AB6A6C();
      --v4;
    }
    while (v4);
  }
  v11 = v17;
  swift_bridgeObjectRelease();
LABEL_15:
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), sel_init);
  sub_1D2A9DA88(v11);
  swift_bridgeObjectRelease();
  v13 = (void *)sub_1D2AB6784();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_addObjectsFromArray_, v13);

  objc_msgSend(v2, sel_setAchievements_, v12);
  v14 = objc_msgSend(v2, sel_data);
  if (v14)
  {
    v15 = v14;
    sub_1D2AB6550();

  }
  else
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v16 = 0;
    swift_willThrow();

  }
}

uint64_t sub_1D2A9DA88(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1D2AB6AC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1D2A9DCB8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1D8242098](i, a1);
        sub_1D2A9E250();
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1D2A9DCB8(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1D2A9DCB8(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_1D2A9E240(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_1D2A9E250();
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1D2A9DCB8(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1D2A9DCB8(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_1D2A9E240(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D2A9DCB8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1D2A9DCD4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1D2A9DCD4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED978750);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1D2AB6AF0();
  __break(1u);
  return result;
}

_QWORD *sub_1D2A9DE40(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _BYTE *v9;
  _QWORD *result;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  unint64_t v37;

  v5 = sub_1D2AB6514();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v9 = 0;
    return (_QWORD *)swift_willThrow();
  }
  v11 = objc_allocWithZone(MEMORY[0x1E0CF5010]);
  sub_1D2A9E2E4(a1, a2);
  v12 = (void *)sub_1D2AB6544();
  v13 = objc_msgSend(v11, sel_initWithData_, v12);

  if (!v13)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v27 = 0;
    swift_willThrow();
    sub_1D2A9E2D0(a1, a2);
    return (_QWORD *)sub_1D2A9E2D0(a1, a2);
  }
  v14 = MEMORY[0x1E0DEE9D8];
  v37 = MEMORY[0x1E0DEE9D8];
  v15 = objc_msgSend(v13, sel_achievementsCount);
  v31 = v13;
  v32 = a1;
  if (!v15)
  {
    v18 = v14;
    v19 = v14;
    if (!(v14 >> 62))
      goto LABEL_14;
LABEL_24:
    swift_bridgeObjectRetain();
    v20 = sub_1D2AB6AC0();
    if (v20)
      goto LABEL_15;
LABEL_25:

    sub_1D2A9E2D0(a1, a2);
    sub_1D2A9E2D0(a1, a2);
    swift_bridgeObjectRelease();
    v24 = MEMORY[0x1E0DEE9D8];
LABEL_26:
    swift_bridgeObjectRelease();
    type metadata accessor for SerializableAchievementCollection();
    result = (_QWORD *)swift_allocObject();
    result[2] = v24;
    return result;
  }
  result = objc_msgSend(v13, sel_achievements);
  if (!result)
    goto LABEL_28;
  v16 = result;
  sub_1D2AB68A4();

  sub_1D2AB6508();
  while (v36)
  {
    sub_1D2A9E240(&v35, &v34);
    sub_1D2A9E250();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v17 = v33;
      MEMORY[0x1D8241DC8]();
      if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1D2AB67B4();
      sub_1D2AB67CC();
      sub_1D2AB67A8();

    }
    sub_1D2AB6508();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v18 = v37;
  v13 = v31;
  a1 = v32;
  v19 = MEMORY[0x1E0DEE9D8];
  if (v37 >> 62)
    goto LABEL_24;
LABEL_14:
  v20 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v20)
    goto LABEL_25;
LABEL_15:
  v29 = a2;
  v30 = v2;
  *(_QWORD *)&v35 = v19;
  result = (_QWORD *)sub_1D2AB6A78();
  if ((v20 & 0x8000000000000000) == 0)
  {
    v21 = 0;
    do
    {
      if ((v18 & 0xC000000000000001) != 0)
        v22 = (id)MEMORY[0x1D8242098](v21, v18);
      else
        v22 = *(id *)(v18 + 8 * v21 + 32);
      v23 = v22;
      ++v21;
      objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF4FE0]), sel_initWithCodable_, v22);

      sub_1D2AB6A60();
      sub_1D2AB6A84();
      sub_1D2AB6A90();
      sub_1D2AB6A6C();
    }
    while (v20 != v21);
    v24 = v35;

    v25 = v32;
    v26 = v29;
    sub_1D2A9E2D0(v32, v29);
    sub_1D2A9E2D0(v25, v26);
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

_OWORD *sub_1D2A9E240(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1D2A9E250()
{
  unint64_t result;

  result = qword_1ED978DB8;
  if (!qword_1ED978DB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED978DB8);
  }
  return result;
}

uint64_t sub_1D2A9E28C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1D2A9E2D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1D2A9E28C(a1, a2);
  return a1;
}

uint64_t sub_1D2A9E2E4(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for SerializableAchievementCollection()
{
  return objc_opt_self();
}

void sub_1D2A9E348(void **a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  uint8_t *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint8_t *v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  os_log_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  os_log_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_t v48;
  uint64_t v49;
  uint64_t v50;

  LODWORD(v48) = a3;
  v6 = sub_1D2AB6634();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v42 - v11;
  v13 = *a1;
  sub_1D2A9E868(*a1);
  if ((v14 & 1) != 0)
  {
    v15 = sub_1D2AB6694();
    v17 = sub_1D2AAC21C(0xD000000000000015, 0x80000001D2AB87E0, v15, v16, 1);
    swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
    {
      if (qword_1ED9788D8 != -1)
        swift_once();
      v18 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED9786E8);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v18, v6);
      v19 = v13;
      v20 = sub_1D2AB661C();
      v21 = sub_1D2AB6874();
      if (!os_log_type_enabled(v20, (os_log_type_t)v21))
      {

        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
        goto LABEL_14;
      }
      LODWORD(v43) = v21;
      v44 = v20;
      v45 = a2;
      v46 = v3;
      v47 = v13;
      v22 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v50 = v42;
      *(_DWORD *)v22 = 136315138;
      v23 = -[NSObject template](v19, sel_template);
      v24 = objc_msgSend(v23, sel_uniqueName);

      if (v24)
      {
        v25 = sub_1D2AB6694();
        v27 = v26;

        v49 = sub_1D2A9CC8C(v25, v27, &v50);
        sub_1D2AB68E0();

        swift_bridgeObjectRelease();
        v28 = v44;
        _os_log_impl(&dword_1D2A96000, v44, (os_log_type_t)v43, "Notifying for achievement: %s", v22, 0xCu);
        v29 = v42;
        swift_arrayDestroy();
        MEMORY[0x1D8242734](v29, -1, -1);
        MEMORY[0x1D8242734](v22, -1, -1);

        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
        a2 = v45;
        v13 = v47;
LABEL_14:
        v41 = (char)v48;
        __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationPostingProvider), *(_QWORD *)(a2 + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationPostingProvider + 24));
        sub_1D2AAD128(v19, v41 & 1);
LABEL_17:
        sub_1D2AA6B98(v13);
        return;
      }

      __break(1u);
LABEL_20:

      __break(1u);
      return;
    }
    if (qword_1ED9788D8 != -1)
      swift_once();
    v30 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED9786E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v30, v6);
    v47 = v13;
    v24 = v13;
    v31 = sub_1D2AB661C();
    v32 = sub_1D2AB6874();
    if (os_log_type_enabled(v31, (os_log_type_t)v32))
    {
      LODWORD(v44) = v32;
      v48 = v31;
      v45 = a2;
      v46 = v3;
      v33 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v50 = v43;
      *(_DWORD *)v33 = 136315138;
      v34 = -[NSObject template](v24, sel_template);
      v35 = objc_msgSend(v34, sel_uniqueName);

      if (!v35)
        goto LABEL_20;
      v36 = sub_1D2AB6694();
      v38 = v37;

      v49 = sub_1D2A9CC8C(v36, v38, &v50);
      sub_1D2AB68E0();

      swift_bridgeObjectRelease();
      v39 = v48;
      _os_log_impl(&dword_1D2A96000, v48, (os_log_type_t)v44, "Not notifying for achievement because alerts are disabled: %s", v33, 0xCu);
      v40 = v43;
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v40, -1, -1);
      MEMORY[0x1D8242734](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    v13 = v47;
    goto LABEL_17;
  }
}

void sub_1D2A9E868(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v2 = sub_1D2AB6634();
  v32 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D2AB658C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(a1, sel_template);
  v10 = objc_msgSend(v9, sel_alertabilityPredicate);

  if (v10)
  {
    sub_1D2AB6694();

    sub_1D2A9D738(0, (unint64_t *)&unk_1EFC9AFB0);
    v11 = (void *)sub_1D2AB6850();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v11, sel_evaluateWithObject_, 0);

  }
  else
  {
    v12 = 1;
  }
  sub_1D2AB6580();
  v13 = sub_1D2A9EC30((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1D2A9F468(a1);
  v15 = v14;
  sub_1D2A9F0FC(a1);
  v17 = v16;
  sub_1D2AA7A50(a1);
  if (v12
    && v13
    && (v18 & 1) != 0
    && ((v15 | v17) & 1) != 0
    && (objc_msgSend(a1, sel_hasClientRequiredURLs) & 1) == 0)
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED9786E8);
    v20 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v4, v19, v2);
    v21 = a1;
    v22 = sub_1D2AB661C();
    v23 = sub_1D2AB6874();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v34 = v31;
      *(_DWORD *)v24 = 136315138;
      v25 = objc_msgSend(v21, sel_template);
      v26 = objc_msgSend(v25, sel_uniqueName);

      if (v26)
      {
        v27 = sub_1D2AB6694();
        v29 = v28;

        v33 = sub_1D2A9CC8C(v27, v29, &v34);
        sub_1D2AB68E0();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1D2A96000, v22, v23, "Should alert achievement %s, but it doesn't have the required asset urls yet. Not alerting.", v24, 0xCu);
        v30 = v31;
        swift_arrayDestroy();
        MEMORY[0x1D8242734](v30, -1, -1);
        MEMORY[0x1D8242734](v24, -1, -1);

        (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v2);
      }
      else
      {

        __break(1u);
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
    }
  }
}

BOOL sub_1D2A9EC30(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void (*v46)(char *, uint64_t);
  void (*v47)(char *, char *, uint64_t);
  unsigned int (*v48)(char *, uint64_t, uint64_t);
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;

  v2 = v1;
  v50 = a1;
  v3 = sub_1D2AB6604();
  v54 = *(_QWORD *)(v3 - 8);
  v55 = v3;
  MEMORY[0x1E0C80A78](v3);
  v51 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787C0);
  v6 = MEMORY[0x1E0C80A78](v5);
  v52 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v47 - v8;
  v10 = sub_1D2AB658C();
  v57 = *(_QWORD *)(v10 - 8);
  v58 = v10;
  v11 = MEMORY[0x1E0C80A78](v10);
  v49 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v53 = (char *)&v47 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1D2AB64E4();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v56 = (char *)&v47 - v22;
  v23 = sub_1D2AB6610();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v26 = (char *)&v47 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  sub_1D2AB65D4();

  v28 = objc_msgSend(v2, sel_relevantEarnedInstance);
  if (!v28)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    return 1;
  }
  v29 = v28;
  v30 = objc_msgSend(v28, sel_earnedDateComponents);
  if (!v30)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
    goto LABEL_8;
  }
  v31 = v30;
  sub_1D2AB64C0();

  v32 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v32(v16, v21, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
LABEL_8:

    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    v36 = &qword_1ED9787B0;
    v37 = (uint64_t)v16;
LABEL_12:
    sub_1D2A9950C(v37, v36);
    return 1;
  }
  v33 = v56;
  v32(v56, v16, v17);
  sub_1D2AB65E0();
  v35 = v57;
  v34 = v58;
  v48 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48);
  if (v48(v9, 1, v58) == 1)
  {

    (*(void (**)(char *, uint64_t))(v18 + 8))(v33, v17);
LABEL_11:
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    v36 = &qword_1ED9787C0;
    v37 = (uint64_t)v9;
    goto LABEL_12;
  }
  v47 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
  v47(v53, v9, v34);
  v38 = v51;
  (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v51, *MEMORY[0x1E0CB1130], v55);
  v9 = v52;
  sub_1D2AB65EC();
  v39 = v58;
  (*(void (**)(char *, uint64_t))(v54 + 8))(v38, v55);
  if (v48(v9, 1, v39) == 1)
  {

    (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v39);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v56, v17);
    goto LABEL_11;
  }
  v41 = v49;
  v47(v49, v9, v39);
  sub_1D2AB655C();
  v43 = v42;
  sub_1D2AB655C();
  v45 = v44;

  v46 = *(void (**)(char *, uint64_t))(v57 + 8);
  v46(v41, v39);
  v46(v53, v39);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v56, v17);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  return v43 <= v45;
}

void sub_1D2A9F0FC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  char IsRemote;
  id v11;
  char IsMonthlyChallenge;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *i;
  char v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = v1;
  v4 = (id)ACHPairedWatchCountryCode();
  if (v4)
  {
    v5 = v4;
    v6 = sub_1D2AB6694();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xE000000000000000;
  }
  if (!objc_msgSend(a1, sel_unearned)
    || (v9 = objc_msgSend(a1, sel_template),
        IsRemote = ACHTemplateIsRemote(),
        v9,
        v11 = objc_msgSend(a1, sel_template),
        IsMonthlyChallenge = ACHTemplateIsMonthlyChallenge(),
        v11,
        (IsRemote & 1) == 0)
    && (IsMonthlyChallenge & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return;
  }
  v13 = objc_msgSend(a1, sel_template);
  v14 = objc_msgSend(v13, sel_availableCountryCodes);

  if (v14)
  {
    v15 = sub_1D2AB679C();

    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v33 = v2;
      sub_1D2AA0464();
      swift_bridgeObjectRetain();
      for (i = (uint64_t *)(v15 + 40); ; i += 2)
      {
        v36 = *(i - 1);
        v37 = *i;
        v34 = v6;
        v35 = v8;
        if (!sub_1D2AB6904())
          break;
        if (!--v16)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          return;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_19;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_19:
  sub_1D2A9FE34();
  if ((v18 & 1) != 0)
  {
    v19 = objc_msgSend(a1, sel_template);
    v20 = ACHTemplateIsRemote();

    if (!v20
      || (v21 = sub_1D2AB6694(),
          v23 = sub_1D2AAC21C(0xD000000000000032, 0x80000001D2AB8800, v21, v22, 1),
          swift_bridgeObjectRelease(),
          (v23 & 1) != 0))
    {
      v24 = objc_msgSend(a1, sel_template, v33, v34, v35, v36, v37);
      v25 = ACHTemplateIsMonthlyChallenge();

      if (!v25
        || (v26 = objc_msgSend(a1, sel_goal)) != 0
        && (v27 = v26, v28 = objc_msgSend(v26, sel__isZero), v27, (v28 & 1) == 0))
      {
        v29 = objc_msgSend(a1, sel_template);
        v30 = objc_msgSend(v29, sel_uniqueName);

        if (!v30)
        {
          __break(1u);
          return;
        }
        sub_1D2AB6694();

        sub_1D2AB6880();
        v32 = v31;
        swift_bridgeObjectRelease();
        if (v32)
          goto LABEL_7;
      }
    }
  }
}

void sub_1D2A9F468(void *a1)
{
  id v2;
  int IsMonthlyChallenge;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, sel_template);
  IsMonthlyChallenge = ACHTemplateIsMonthlyChallenge();

  if (IsMonthlyChallenge)
  {
    if ((objc_msgSend(a1, sel_unearned) & 1) == 0)
    {
      v4 = objc_msgSend(a1, sel_template);
      v5 = objc_msgSend(v4, sel_uniqueName);

      if (v5)
      {
        sub_1D2AB6694();

        sub_1D2AB6880();
        v7 = v6;
        swift_bridgeObjectRelease();
        if (v7)
          swift_bridgeObjectRelease();
      }
      else
      {
        __break(1u);
      }
    }
  }
  else if ((sub_1D2A9F5A0() & 1) != 0)
  {
    sub_1D2AA76B8(a1);
  }
}

uint64_t sub_1D2A9F5A0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void (*v22)(char *, char *, uint64_t);
  id v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v29 = sub_1D2AB658C();
  v2 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D2AB6610();
  v30 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1D2AB64E4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v27 - v16;
  v18 = objc_msgSend(v1, sel_relevantEarnedInstance);
  if (!v18)
    goto LABEL_9;
  v19 = v18;
  v28 = v5;
  v20 = objc_msgSend(v18, sel_earnedDateComponents);
  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_8;
  }
  v21 = v20;
  sub_1D2AB64C0();

  v22 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v22(v10, v15, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
LABEL_8:

    sub_1D2A9950C((uint64_t)v10, &qword_1ED9787B0);
LABEL_9:
    v24 = 0;
    return v24 & 1;
  }
  v22(v17, v10, v11);
  v23 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  sub_1D2AB65D4();

  if (qword_1ED978580 != -1)
    swift_once();
  sub_1D2AB6580();
  sub_1D2AB65BC();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v29);
  v24 = MEMORY[0x1D8241B04](v15, v17);

  v25 = *(void (**)(char *, uint64_t))(v12 + 8);
  v25(v15, v11);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v28);
  v25(v17, v11);
  return v24 & 1;
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

void type metadata accessor for AACTransportItem(uint64_t a1)
{
  sub_1D2A98B40(a1, &qword_1ED978DA8);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1D2A98B40(a1, &qword_1ED978DB0);
}

unint64_t sub_1D2A9F940()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED978DA0;
  if (!qword_1ED978DA0)
  {
    type metadata accessor for AACTransportItem(255);
    result = MEMORY[0x1D82426B0](&unk_1D2AB7474, v1);
    atomic_store(result, (unint64_t *)&qword_1ED978DA0);
  }
  return result;
}

uint64_t sub_1D2A9F988(uint64_t a1)
{
  return sub_1D2A98AAC(a1, qword_1ED978D88);
}

uint64_t TransportDispatching.register<A, B>(_:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  (*(void (**)(uint64_t, uint64_t))(a7 + 8))(a4, a7);
  sub_1D2AA5210(a1, a2, a3, a5, a6, a8, a9);
  return swift_release();
}

uint64_t dispatch thunk of TransportDispatching.transportDispatchService.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void type metadata accessor for ACHTriggerOptions(uint64_t a1)
{
  sub_1D2A98B40(a1, (unint64_t *)&unk_1ED978718);
}

void sub_1D2A9FA54(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void sub_1D2A9FA60(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1D2A9FA6C()
{
  sub_1D2AB6B74();
  sub_1D2AB6B80();
  return sub_1D2AB6B8C();
}

uint64_t sub_1D2A9FAB0()
{
  return sub_1D2AB6B80();
}

uint64_t sub_1D2A9FAD8()
{
  sub_1D2AB6B74();
  sub_1D2AB6B80();
  return sub_1D2AB6B8C();
}

BOOL sub_1D2A9FB18(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_1D2A9FB2C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1D2A9FB44(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v21;
  int64_t v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t (*v29)(char *);
  uint64_t v30;

  v29 = a1;
  v5 = sub_1D2AB64E4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a3 + 56);
  v27 = a3 + 56;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v28 = (unint64_t)(v13 + 63) >> 6;
  v30 = a3;
  result = swift_bridgeObjectRetain();
  v17 = 0;
  while (v15)
  {
    v18 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v19 = v18 | (v17 << 6);
LABEL_19:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(_QWORD *)(v30 + 48) + *(_QWORD *)(v6 + 72) * v19, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v11, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
      goto LABEL_29;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    v23 = v29(v8);
    if (v3)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      swift_release();
      return v25 & 1;
    }
    v24 = v23;
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if ((v24 & 1) != 0)
    {
      swift_release();
      v25 = 1;
      return v25 & 1;
    }
  }
  if (__OFADD__(v17++, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v17 >= v28)
    goto LABEL_28;
  v21 = *(_QWORD *)(v27 + 8 * v17);
  if (v21)
  {
LABEL_18:
    v15 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v17 << 6);
    goto LABEL_19;
  }
  v22 = v17 + 1;
  if (v17 + 1 >= v28)
    goto LABEL_28;
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v17 + 2;
  if (v17 + 2 >= v28)
    goto LABEL_28;
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v17 + 3;
  if (v17 + 3 >= v28)
    goto LABEL_28;
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v17 + 4;
  if (v17 + 4 >= v28)
  {
LABEL_28:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v11, 1, 1, v5);
LABEL_29:
    swift_release();
    v25 = 0;
    return v25 & 1;
  }
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
  {
LABEL_17:
    v17 = v22;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v17 >= v28)
      goto LABEL_28;
    v21 = *(_QWORD *)(v27 + 8 * v17);
    ++v22;
    if (v21)
      goto LABEL_18;
  }
LABEL_32:
  __break(1u);
  return result;
}

void sub_1D2A9FE34()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  int IsMonthlyChallenge;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  __int16 v31;
  unsigned __int8 *v32;
  int v33;
  int IsRemote;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  unsigned __int8 *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  __int16 v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  void (*v54)(char *, uint64_t);
  unsigned __int8 *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v1 = v0;
  v2 = sub_1D2AB658C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1D2AB64E4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v57 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v55 - v10;
  v12 = sub_1D2AB6610();
  v58 = *(_QWORD *)(v12 - 8);
  v59 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  sub_1D2AB65D4();

  if (qword_1ED978580 != -1)
    swift_once();
  sub_1D2AB6580();
  sub_1D2AB65BC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v16 = objc_msgSend(v1, sel_template);
  IsMonthlyChallenge = ACHTemplateIsMonthlyChallenge();

  v18 = objc_msgSend(v1, sel_template);
  v19 = v18;
  if (IsMonthlyChallenge)
  {
    v20 = objc_msgSend(v18, sel_uniqueName);

    if (v20)
    {
      v21 = sub_1D2AB6694();
      v23 = v22;

      v60 = v21;
      v61 = v23;
      v24 = sub_1D2AA0464();
      v25 = (_QWORD *)MEMORY[0x1D8241F6C](95, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x1E0DEA968], v24);
      swift_bridgeObjectRelease();
      if (v25[2] == 3)
      {
        v26 = v25[8];
        v27 = v25[9];
        v56 = v7;
        if ((v27 ^ v26) < 0x4000)
        {
          v55 = 0;
          LOBYTE(v32) = 1;
        }
        else
        {
          v29 = v25[10];
          v28 = v25[11];
          v30 = sub_1D2AA0DAC(v26, v27, v29, v28, 10);
          if ((v31 & 0x100) != 0)
          {
            swift_bridgeObjectRetain();
            v32 = sub_1D2AA0584(v26, v27, v29, v28, 10);
            v40 = v39;
            swift_bridgeObjectRelease();
            v33 = v40 & 1;
          }
          else
          {
            v32 = (unsigned __int8 *)v30;
            v33 = v31 & 1;
          }
          if (v33)
            v41 = 0;
          else
            v41 = v32;
          if (v25[2] < 3uLL)
          {
            __break(1u);
            goto LABEL_24;
          }
          v55 = v41;
          LOBYTE(v32) = v33;
        }
        v42 = v25[12];
        v43 = v25[13];
        v44 = v25[14];
        v45 = v25[15];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if ((v43 ^ v42) >= 0x4000)
        {
          sub_1D2AA0DAC(v42, v43, v44, v45, 10);
          if ((v46 & 0x100) != 0)
            sub_1D2AA0584(v42, v43, v44, v45, 10);
        }
LABEL_24:
        swift_bridgeObjectRelease();
        v47 = v56;
        v48 = v57;
        v49 = sub_1D2AB64CC();
        v51 = v50;
        if ((v32 & 1) != 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v48, v11, v6);
          if ((v51 & 1) == 0)
            goto LABEL_32;
LABEL_29:
          sub_1D2AB64D8();
          v53 = *(void (**)(char *, uint64_t))(v47 + 8);
          v53(v48, v6);
          (*(void (**)(char *, uint64_t))(v58 + 8))(v14, v59);
          v53(v11, v6);
          return;
        }
        if ((v50 & 1) != 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v48, v11, v6);
        }
        else
        {
          v52 = v49;
          (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v48, v11, v6);
          if (v55 == (unsigned __int8 *)v52)
            goto LABEL_29;
        }
LABEL_32:
        v54 = *(void (**)(char *, uint64_t))(v47 + 8);
        v54(v48, v6);
        (*(void (**)(char *, uint64_t))(v58 + 8))(v14, v59);
        v54(v11, v6);
        return;
      }
      (*(void (**)(char *, uint64_t))(v58 + 8))(v14, v59);
      swift_bridgeObjectRelease();
LABEL_14:
      (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
      return;
    }
    __break(1u);
  }
  else
  {
    IsRemote = ACHTemplateIsRemote();

    if (!IsRemote)
    {
      (*(void (**)(char *, uint64_t))(v58 + 8))(v14, v59);
      goto LABEL_14;
    }
    v35 = objc_msgSend(v1, sel_template);
    v36 = objc_msgSend(v35, sel_alertDates);

    if (v36)
    {
      sub_1D2AA03EC();
      v37 = sub_1D2AB6820();

      MEMORY[0x1E0C80A78](v38);
      *(&v55 - 2) = (unsigned __int8 *)v11;
      sub_1D2A9FB44((uint64_t (*)(char *))sub_1D2AA0434, (uint64_t)(&v55 - 4), v37);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v14, v59);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v58 + 8))(v14, v59);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    }
  }
}

unint64_t sub_1D2AA03EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC9ACB0;
  if (!qword_1EFC9ACB0)
  {
    v1 = sub_1D2AB64E4();
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0CAEAD8], v1);
    atomic_store(result, (unint64_t *)&qword_1EFC9ACB0);
  }
  return result;
}

uint64_t sub_1D2AA0434(uint64_t a1)
{
  uint64_t v1;

  return MEMORY[0x1D8241B04](*(_QWORD *)(v1 + 16), a1) & 1;
}

unint64_t sub_1D2AA0464()
{
  unint64_t result;

  result = qword_1ED9789B8;
  if (!qword_1ED9789B8)
  {
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED9789B8);
  }
  return result;
}

_QWORD *sub_1D2AA04A8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC9ACC0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1D2AA050C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_1D2AB6730();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1D8241D5C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unsigned __int8 *sub_1D2AA0584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_1D2AA0E7C();
  swift_bridgeObjectRetain();
  v7 = sub_1D2AB6748();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_1D2AA08F0();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_1D2AB6A54();
  }
LABEL_7:
  v13 = sub_1D2AA0674(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_1D2AA0674(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      v23 = a3 + 48;
      v24 = a3 + 55;
      v25 = a3 + 87;
      if (a3 > 10)
      {
        v23 = 58;
      }
      else
      {
        v25 = 97;
        v24 = 65;
      }
      if (result)
      {
        v26 = 0;
        do
        {
          v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v13 = 0;
              if (v27 < 0x61 || v27 >= v25)
                return (unsigned __int8 *)v13;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
            return 0;
          v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v15 = a2 - 1;
  if (a2 == 1)
    return 0;
  v16 = a3 + 48;
  v17 = a3 + 55;
  v18 = a3 + 87;
  if (a3 > 10)
  {
    v16 = 58;
  }
  else
  {
    v18 = 97;
    v17 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v19 = result + 1;
  do
  {
    v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        v13 = 0;
        if (v20 < 0x61 || v20 >= v18)
          return (unsigned __int8 *)v13;
        v21 = -87;
      }
      else
      {
        v21 = -55;
      }
    }
    else
    {
      v21 = -48;
    }
    v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21)))
      return 0;
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1D2AA08F0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1D2AB6754();
  v4 = sub_1D2AA096C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1D2AA096C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_1D2AA0AB0(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1D2AA04A8(v9, 0);
      v12 = sub_1D2AA0B9C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1D8241D08](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1D8241D08);
LABEL_9:
      sub_1D2AB6A54();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1D8241D08]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1D2AA0AB0(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_1D2AA050C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1D2AA050C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_1D2AB6718();
  }
  __break(1u);
  return result;
}

unint64_t sub_1D2AA0B9C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_1D2AA050C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_1D2AB6724();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_1D2AB6A54();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_1D2AA050C(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_1D2AB6700();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1D2AA0DAC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t result;
  char v13;
  _QWORD v14[2];
  char v15;

  if ((a4 & 0x1000000000000000) != 0)
  {
    result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v11 = (_QWORD *)sub_1D2AB6A54();
  }
  result = sub_1D2AA0EC0((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

unint64_t sub_1D2AA0E7C()
{
  unint64_t result;

  result = qword_1EFC9ACB8;
  if (!qword_1EFC9ACB8)
  {
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0DEBB10], MEMORY[0x1E0DEBAF0]);
    atomic_store(result, (unint64_t *)&qword_1EFC9ACB8);
  }
  return result;
}

uint64_t sub_1D2AA0EC0(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  uint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unsigned int v36;
  char v37;
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  uint64_t v42;
  unsigned int v43;
  char v44;
  uint64_t v45;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_1D2AA050C(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_95;
  result = sub_1D2AB6718();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_1D2AA050C(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_1D2AA050C(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_91;
  if (v17 < a3 >> 16)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  result = sub_1D2AB6718();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_90;
  }
  if (v18 < v15)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v31 = a6 + 48;
        v32 = a6 + 55;
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v31 = 58;
        }
        else
        {
          v33 = 97;
          v32 = 65;
        }
        if (v19)
        {
          v24 = 0;
          v34 = v19 + 1;
          v35 = result - 1;
          do
          {
            v36 = *v34;
            if (v36 < 0x30 || v36 >= v31)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                v29 = 0;
                if (v36 < 0x61 || v36 >= v33)
                  return v29;
                v37 = -87;
              }
              else
              {
                v37 = -55;
              }
            }
            else
            {
              v37 = -48;
            }
            v38 = v24 * a6;
            if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63)
              return 0;
            v24 = v38 + (v36 + v37);
            if (__OFADD__(v38, (v36 + v37)))
              return 0;
            ++v34;
            --v35;
          }
          while (v35);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_94;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v39 = a6 + 48;
      v40 = a6 + 55;
      v41 = a6 + 87;
      if (a6 > 10)
      {
        v39 = 58;
      }
      else
      {
        v41 = 97;
        v40 = 65;
      }
      if (v19)
      {
        v42 = 0;
        do
        {
          v43 = *v19;
          if (v43 < 0x30 || v43 >= v39)
          {
            if (v43 < 0x41 || v43 >= v40)
            {
              v29 = 0;
              if (v43 < 0x61 || v43 >= v41)
                return v29;
              v44 = -87;
            }
            else
            {
              v44 = -55;
            }
          }
          else
          {
            v44 = -48;
          }
          v45 = v42 * a6;
          if ((unsigned __int128)(v42 * (__int128)a6) >> 64 != (v42 * a6) >> 63)
            return 0;
          v42 = v45 + (v43 + v44);
          if (__OFADD__(v45, (v43 + v44)))
            return 0;
          ++v19;
          --result;
        }
        while (result);
        return v45 + (v43 + v44);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 48;
      v22 = a6 + 55;
      v23 = a6 + 87;
      if (a6 > 10)
      {
        v21 = 58;
      }
      else
      {
        v23 = 97;
        v22 = 65;
      }
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              if (v27 < 0x61 || v27 >= v23)
                return v29;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v30 = v24 * a6;
          if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63)
            return 0;
          v24 = v30 - (v27 + v28);
          if (__OFSUB__(v30, (v27 + v28)))
            return 0;
          ++v25;
          if (!--v26)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_1D2AA12E4()
{
  return sub_1D2AA1304();
}

uint64_t sub_1D2AA1304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v29 - v6;
  v8 = sub_1D2AB64E4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v29 - v13;
  v15 = (void *)sub_1D2AB6688();
  v16 = (id)ACHYearMonthDayDateComponentsFromString();

  if (v16)
  {
    sub_1D2AB64C0();

    v17 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v17(v7, v12, v8);
    v18 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56);
    v18(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v17(v14, v7, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v14, v8);
      v18(v5, 0, 1, v8);
      v19 = v1 + OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_dateComponents;
      swift_beginAccess();
      sub_1D2AA2048((uint64_t)v5, v19);
      swift_endAccess();
      v20 = *(void **)(v1 + OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_achievementStore);
      v21 = (void *)sub_1D2AB64A8();
      v22 = objc_msgSend(v20, sel_achievementsForEarnedDateComponents_, v21);

      sub_1D2A9BC78();
      sub_1D2A9D770();
      v23 = sub_1D2AB6820();

      *(_QWORD *)(v1 + OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_lastAchievementsForDate) = v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v23 & 0xC000000000000001) != 0)
      {
        if (sub_1D2AB6988())
        {
LABEL_5:
          v24 = swift_bridgeObjectRetain();
          v25 = sub_1D2A9D338(v24);
          swift_bridgeObjectRelease();
LABEL_14:
          swift_bridgeObjectRelease();
          type metadata accessor for SerializableAchievementCollection();
          v27 = swift_allocObject();
          *(_QWORD *)(v27 + 16) = v25;
          (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
          return v27;
        }
      }
      else if (*(_QWORD *)(v23 + 16))
      {
        goto LABEL_5;
      }
      v25 = MEMORY[0x1E0DEE9D8];
      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1D2A9950C((uint64_t)v7, &qword_1ED9787B0);
  if ((MEMORY[0x1E0DEE9E8] & 0xC000000000000001) != 0 && sub_1D2AB6988())
    v26 = sub_1D2A9D338(MEMORY[0x1E0DEE9E8]);
  else
    v26 = MEMORY[0x1E0DEE9D8];
  type metadata accessor for SerializableAchievementCollection();
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v26;
  return v27;
}

void sub_1D2AA1668(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;

  v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v4)
    {
      sub_1D2AB69AC();
      return;
    }
    v6 = v5;
    v7 = a2;
    goto LABEL_13;
  }
  if (v4)
  {
    if (a2 < 0)
      v6 = a2;
    else
      v6 = a2 & 0xFFFFFFFFFFFFFF8;
    v7 = a1;
LABEL_13:
    sub_1D2AA1E38(v6, v7);
    return;
  }
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v27 = a1 + 56;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(a1 + 56);
  sub_1D2A9BC78();
  v11 = 0;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v12 = a2 + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_39;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v15 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v28)
        return;
      v16 = *(_QWORD *)(v27 + 8 * v11);
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v28)
          return;
        v16 = *(_QWORD *)(v27 + 8 * v11);
        if (!v16)
        {
          v11 = v15 + 3;
          if (v15 + 3 >= v28)
            return;
          v16 = *(_QWORD *)(v27 + 8 * v11);
          if (!v16)
            break;
        }
      }
    }
LABEL_38:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_39:
    v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v14);
    v19 = sub_1D2AB68B0();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_46;
    v29 = v11;
    v22 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
    v23 = sub_1D2AB68BC();

    if ((v23 & 1) == 0)
    {
      v24 = ~v20;
      while (1)
      {
        v21 = (v21 + 1) & v24;
        if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        v25 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
        v26 = sub_1D2AB68BC();

        if ((v26 & 1) != 0)
          goto LABEL_20;
      }
LABEL_46:

      return;
    }
LABEL_20:

    v11 = v29;
  }
  v17 = v15 + 4;
  if (v17 >= v28)
    return;
  v16 = *(_QWORD *)(v27 + 8 * v17);
  if (v16)
  {
    v11 = v17;
    goto LABEL_38;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_38;
  }
LABEL_49:
  __break(1u);
}

uint64_t sub_1D2AA196C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a1;
  v6[5] = a4;
  return swift_task_switch();
}

uint64_t sub_1D2AA1988()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[6];
  v1 = v0[7];
  v3 = *(_QWORD *)(v0[5] + OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_endpoint);
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = v4;
  v4[2] = v3;
  v4[3] = 7;
  v4[4] = v2;
  v4[5] = v1;
  v5 = (_QWORD *)swift_task_alloc();
  v0[9] = v5;
  *v5 = v0;
  v5[1] = sub_1D2AA1A50;
  return sub_1D2AB6B20();
}

uint64_t sub_1D2AA1A50()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1D2AA1ABC()
{
  uint64_t v0;

  *(_OWORD *)*(_QWORD *)(v0 + 32) = *(_OWORD *)(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AA1AD4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AA1B08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1D2AA1B14(a1, a2, a3);
}

uint64_t sub_1D2AA1B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1D2AB6808();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1D2AB67FC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_1D2A9950C(a1, &qword_1ED978710);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D2AB67D8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

id sub_1D2AA1C70()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAwardsDateQueryListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D2AA1D04()
{
  return type metadata accessor for ActivityAwardsDateQueryListener();
}

uint64_t type metadata accessor for ActivityAwardsDateQueryListener()
{
  uint64_t result;

  result = qword_1ED9787E8;
  if (!qword_1ED9787E8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1D2AA1D48()
{
  unint64_t v0;

  sub_1D2AA1DD8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1D2AA1DD8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED9787B8)
  {
    sub_1D2AB64E4();
    v0 = sub_1D2AB68C8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED9787B8);
  }
}

void sub_1D2AA1E38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  char v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 != sub_1D2AB6988())
    return;
  v4 = 0;
  v5 = a2 + 56;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_6:
    v12 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v11);
    v13 = sub_1D2AB69C4();

    if ((v13 & 1) == 0)
      return;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v14);
  ++v4;
  if (v15)
    goto LABEL_19;
  v4 = v14 + 1;
  if (v14 + 1 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    v8 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  v16 = v14 + 2;
  if (v16 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v9)
      return;
    v15 = *(_QWORD *)(v5 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_1D2AA1F88()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  sub_1D2A9E28C(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_1D2AA1FBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;

  v7 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_1D2A98C94;
  *(_QWORD *)(v5 + 56) = v4;
  *(_OWORD *)(v5 + 40) = v7;
  *(_QWORD *)(v5 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_1D2AA203C(uint64_t a1)
{
  uint64_t v1;

  return sub_1D2A99F80(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1D2AA2048(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D2AA2090()
{
  void *v0;
  id v1;
  int IsMonthlyChallenge;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v1 = objc_msgSend(v0, sel_template);
  IsMonthlyChallenge = ACHTemplateIsMonthlyChallenge();

  if (!IsMonthlyChallenge)
  {
    v4 = objc_msgSend(v0, sel_template);
    ACHTemplateIsRemote();

  }
  v3 = (void *)objc_opt_self();
  v5 = (void *)sub_1D2AB6688();
  v6 = objc_msgSend(v3, sel_localizedUserNotificationStringForKey_arguments_, v5, 0);

  v7 = sub_1D2AB6694();
  return v7;
}

void sub_1D2AA21BC(unint64_t a1, int a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  char IsRemote;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t inited;
  unint64_t v48;
  unsigned __int8 v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void (*v54)(void);
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char isUniquelyReferenced_nonNull_native;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  char *v78;
  unint64_t v79;
  _OWORD v80[2];
  __int128 v81;
  uint64_t v82;
  _QWORD v83[5];

  v3 = v2;
  LODWORD(v75) = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9ADB0);
  MEMORY[0x1E0C80A78](v5);
  v68 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_1D2AB6538();
  v7 = *(_QWORD *)(v70 - 8);
  v8 = MEMORY[0x1E0C80A78](v70);
  v67 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v66 = (char *)&v65 - v10;
  v77 = sub_1D2AB658C();
  v74 = *(_QWORD *)(v77 - 8);
  v11 = MEMORY[0x1E0C80A78](v77);
  v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v78 = (char *)&v65 - v14;
  v73 = sub_1D2AB6610();
  v15 = *(_QWORD *)(v73 - 8);
  MEMORY[0x1E0C80A78](v73);
  v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1D2AB65B0();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D2AB65A4();
  v71 = sub_1D2AB6598();
  v72 = v22;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CEC6E0]), sel_init);
  v24 = objc_msgSend(v3, sel_template);
  LOBYTE(v18) = ACHTemplateIsRemote();

  v76 = a1;
  if ((v18 & 1) == 0)
  {
    v25 = objc_msgSend(v3, sel_template);
    ACHTemplateIsMonthlyChallenge();

  }
  v26 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setCategoryIdentifier_, v26);

  v27 = objc_msgSend(v3, sel_template);
  IsRemote = ACHTemplateIsRemote();

  v69 = v7;
  if ((IsRemote & 1) == 0)
  {
    v29 = objc_msgSend(v3, sel_template);
    ACHTemplateIsMonthlyChallenge();

  }
  v30 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setThreadIdentifier_, v30);

  v31 = objc_msgSend((id)objc_opt_self(), sel_soundWithAlertType_, 19);
  sub_1D2AB6694();
  v32 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  objc_msgSend(v31, sel_setAlertTopic_, v32);

  objc_msgSend(v23, sel_setSound_, v31);
  sub_1D2AB65F8();
  v33 = (void *)sub_1D2AB65C8();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v73);
  sub_1D2AB6580();
  v34 = (void *)sub_1D2AB6568();
  v35 = v13;
  v36 = v33;
  v37 = v77;
  v74 = *(_QWORD *)(v74 + 8);
  ((void (*)(char *, uint64_t))v74)(v35, v77);
  v38 = objc_msgSend(v33, sel_hk_startOfDateByAddingDays_toDate_, 1, v34);

  sub_1D2AB6574();
  v39 = (void *)sub_1D2AB6568();
  objc_msgSend(v23, sel_setExpirationDate_, v39);

  sub_1D2AA2090();
  v40 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setTitle_, v40);

  sub_1D2AA2B20(v76, v75 & 1);
  v41 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_setBody_, v41);

  v42 = (id)ACHCodableFromAchievement();
  v43 = objc_msgSend(v42, sel_data);

  if (v43)
  {
    v44 = sub_1D2AB6550();
    v46 = v45;

  }
  else
  {
    v44 = 0;
    v46 = 0xF000000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9ADB8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D2AB7580;
  v83[0] = 0x6D65766569686361;
  v83[1] = 0xEB00000000746E65;
  sub_1D2AB69F4();
  *(_QWORD *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978AD0);
  *(_QWORD *)(inited + 72) = v44;
  *(_QWORD *)(inited + 80) = v46;
  sub_1D2A9B810(v44, v46);
  v48 = sub_1D2AA5080(inited);
  v49 = objc_msgSend(v3, sel_unearned);
  v76 = v46;
  if ((v49 & 1) != 0)
    goto LABEL_16;
  v50 = objc_msgSend(v3, sel_template);
  v51 = objc_msgSend(v50, sel_uniqueName);

  if (v51)
  {
    v75 = v44;
    v52 = objc_msgSend((id)objc_opt_self(), sel_celebrationMovieURLForAchievementIdentifer_, v51);

    if (v52)
    {
      sub_1D2AB652C();

      v53 = v69;
      v54 = *(void (**)(void))(v69 + 32);
      v55 = (uint64_t)v68;
      v56 = v70;
      v54();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v53 + 56))(v55, 0, 1, v56);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v55, 1, v56) != 1)
      {
        v57 = v66;
        ((void (*)(char *, uint64_t, uint64_t))v54)(v66, v55, v56);
        strcpy((char *)&v81, "introMovieURL");
        HIWORD(v81) = -4864;
        v58 = MEMORY[0x1E0DEA968];
        sub_1D2AB69F4();
        v59 = sub_1D2AB6520();
        v82 = v58;
        *(_QWORD *)&v81 = v59;
        *((_QWORD *)&v81 + 1) = v60;
        sub_1D2A9E240(&v81, v80);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v79 = v48;
        sub_1D2AA33DC(v80, (uint64_t)v83, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        sub_1D2AA3514((uint64_t)v83);
        (*(void (**)(char *, uint64_t))(v53 + 8))(v57, v56);
LABEL_15:
        v44 = v75;
LABEL_16:
        v62 = (void *)sub_1D2AB6658();
        swift_bridgeObjectRelease();
        objc_msgSend(v23, sel_setUserInfo_, v62);

        v63 = v23;
        v64 = (void *)sub_1D2AB6688();
        swift_bridgeObjectRelease();
        objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v64, v63, 0);

        sub_1D2A9E2D0(v44, v76);
        ((void (*)(char *, uint64_t))v74)(v78, v37);
        return;
      }
    }
    else
    {
      v55 = (uint64_t)v68;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56))(v68, 1, 1, v70);
    }
    sub_1D2AA2C88(v55);
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_1D2AA2B20(uint64_t a1, char a2)
{
  uint64_t v2;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF4FE8]), sel_init);
  objc_msgSend(v5, sel_setWheelchairUser_, a1 == 2);
  objc_msgSend(v5, sel_setIsPregnant_, a2 & 1);
  v6 = objc_msgSend(v5, sel_titleForAchievement_, v2);
  if (v6)
  {
    v7 = v6;
    v8 = sub_1D2AB6694();

  }
  else
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v9 = sub_1D2AB6634();
    __swift_project_value_buffer(v9, (uint64_t)qword_1ED9786E8);
    v10 = sub_1D2AB661C();
    v11 = sub_1D2AB6868();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D2A96000, v10, v11, "Unable to get localized title for notification", v12, 2u);
      MEMORY[0x1D8242734](v12, -1, -1);
    }

    return 0;
  }
  return v8;
}

uint64_t sub_1D2AA2C88(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9ADB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1D2AA2CC8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D2AB69DC();
  return sub_1D2AA2CF8(a1, v2);
}

unint64_t sub_1D2AA2CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1D2AA3900(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D8242038](v9, a1);
      sub_1D2AA3514((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1D2AA2DBC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9ADC0);
  v6 = sub_1D2AB6AD8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_1D2A9E240((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1D2AA3900(v25, (uint64_t)&v38);
      sub_1D2A9CD5C(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_1D2AB69DC();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_1D2A9E240(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1D2AA30D0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978A18);
  v38 = a2;
  v6 = sub_1D2AB6AD8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_1D2AB6B74();
    sub_1D2AB66C4();
    result = sub_1D2AB6B8C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_1D2AA33DC(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1D2AA2CC8(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
        return sub_1D2A9E240(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1D2AA371C();
      goto LABEL_7;
    }
    sub_1D2AA2DBC(v13, a3 & 1);
    v19 = sub_1D2AA2CC8(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1D2AA3900(a2, (uint64_t)v21);
      return sub_1D2AA36A4(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_1D2AB6B38();
  __break(1u);
  return result;
}

uint64_t sub_1D2AA3514(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

void sub_1D2AA3548(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1D2A9B108(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1D2AA3AE4();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_1D2AA30D0(v15, a4 & 1);
  v20 = sub_1D2A9B108(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1D2AB6B38();
  __break(1u);
}

_OWORD *sub_1D2AA36A4(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_1D2A9E240(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_1D2AA371C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9ADC0);
  v2 = *v0;
  v3 = sub_1D2AB6ACC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_1D2AA3900(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1D2A9CD5C(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1D2A9E240(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1D2AA3900(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

void *sub_1D2AA393C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED978A20);
  v2 = *v0;
  v3 = sub_1D2AB6ACC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1D2AA3AE4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978A18);
  v2 = *v0;
  v3 = sub_1D2AB6ACC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t UnfairLock.__allocating_init()()
{
  uint64_t v0;
  _DWORD *v1;

  v0 = swift_allocObject();
  v1 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = 0;
  return v0;
}

void sub_1D2AA3CD8()
{
  uint64_t v0;

  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(v0 + 16));
}

uint64_t UnfairLock.deinit()
{
  uint64_t v0;

  MEMORY[0x1D8242734](*(_QWORD *)(v0 + 16), -1, -1);
  return v0;
}

uint64_t UnfairLock.__deallocating_deinit()
{
  uint64_t v0;

  MEMORY[0x1D8242734](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

uint64_t method lookup function for UnfairLock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UnfairLock.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of UnfairLock.assertAcquired()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t sub_1D2AA3D50(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t result;
  uint64_t v7;

  if (a2 >> 60 == 15)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v3 = 0;
    return swift_willThrow();
  }
  else
  {
    sub_1D2AB6478();
    swift_allocObject();
    sub_1D2AB646C();
    sub_1D2AB6460();
    swift_release();
    result = sub_1D2A9E2D0(a1, a2);
    if (!v2)
      return v7;
  }
  return result;
}

uint64_t sub_1D2AA3E3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t result;
  uint64_t v7;

  if (a2 >> 60 == 15)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v3 = 0;
    return swift_willThrow();
  }
  else
  {
    sub_1D2AB6478();
    swift_allocObject();
    sub_1D2AB646C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9ADD0);
    sub_1D2AA4A5C();
    sub_1D2AB6460();
    swift_release();
    result = sub_1D2A9E2D0(a1, a2);
    if (!v2)
      return v7;
  }
  return result;
}

uint64_t sub_1D2AA3F2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t result;
  uint64_t v7;

  if (a2 >> 60 == 15)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v3 = 0;
    return swift_willThrow();
  }
  else
  {
    sub_1D2AB6478();
    swift_allocObject();
    sub_1D2AB646C();
    type metadata accessor for ACHTriggerOptions(0);
    sub_1D2AA4A1C(&qword_1ED9789E0, (uint64_t)&protocol conformance descriptor for ACHTriggerOptions);
    sub_1D2AB6460();
    swift_release();
    result = sub_1D2A9E2D0(a1, a2);
    if (!v2)
      return v7;
  }
  return result;
}

uint64_t sub_1D2AA4028(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  char v4;
  char v8;

  if (a2 >> 60 == 15)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v3 = 0;
    swift_willThrow();
  }
  else
  {
    sub_1D2AB6478();
    swift_allocObject();
    sub_1D2AB646C();
    sub_1D2AB6460();
    swift_release();
    sub_1D2A9E2D0(a1, a2);
    if (!v2)
      v4 = v8;
  }
  return v4 & 1;
}

uint64_t sub_1D2AA4110(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t result;
  uint64_t v7;

  if (a2 >> 60 == 15)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v3 = 0;
    return swift_willThrow();
  }
  else
  {
    sub_1D2AB6478();
    swift_allocObject();
    sub_1D2AB646C();
    sub_1D2AB6460();
    swift_release();
    result = sub_1D2A9E2D0(a1, a2);
    if (!v2)
      return v7;
  }
  return result;
}

uint64_t TransportSerializable<>.init(serializedData:)(uint64_t a1, unint64_t a2)
{
  _BYTE *v2;

  if (a2 >> 60 == 15)
  {
    sub_1D2AA42D8();
    swift_allocError();
    *v2 = 0;
    return swift_willThrow();
  }
  else
  {
    sub_1D2AB6478();
    swift_allocObject();
    sub_1D2AB646C();
    sub_1D2AB6460();
    swift_release();
    return sub_1D2A9E2D0(a1, a2);
  }
}

unint64_t sub_1D2AA42D8()
{
  unint64_t result;

  result = qword_1ED978AF0;
  if (!qword_1ED978AF0)
  {
    result = MEMORY[0x1D82426B0](&unk_1D2AB7E40, &type metadata for TransportError);
    atomic_store(result, (unint64_t *)&qword_1ED978AF0);
  }
  return result;
}

uint64_t sub_1D2AA431C()
{
  uint64_t v0;

  sub_1D2AB649C();
  swift_allocObject();
  sub_1D2AB6490();
  v0 = sub_1D2AB6484();
  swift_release();
  return v0;
}

uint64_t sub_1D2AA43AC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_1D2AA4028(a1, a2);
  if (!v3)
    *a3 = result & 1;
  return result;
}

uint64_t sub_1D2AA43D8()
{
  uint64_t v0;

  sub_1D2AB649C();
  swift_allocObject();
  sub_1D2AB6490();
  v0 = sub_1D2AB6484();
  swift_release();
  return v0;
}

uint64_t sub_1D2AA4468@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_1D2AA4110(a1, a2);
  if (!v3)
  {
    *(_QWORD *)a3 = result;
    *(_BYTE *)(a3 + 8) = 0;
  }
  return result;
}

uint64_t sub_1D2AA4494()
{
  uint64_t v0;

  sub_1D2AB649C();
  swift_allocObject();
  sub_1D2AB6490();
  v0 = sub_1D2AB6484();
  swift_release();
  return v0;
}

uint64_t sub_1D2AA4524@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v6;

  result = sub_1D2AA3D50(a1, a2);
  if (!v3)
  {
    *a3 = result;
    a3[1] = v6;
  }
  return result;
}

uint64_t sub_1D2AA454C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 - 16);
  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1D82426B0](MEMORY[0x1E0DEAF40], a1, &v6);
  v5 = v3;
  MEMORY[0x1D82426B0](MEMORY[0x1E0DEAF10], a1, &v5);
  return TransportSerializable<>.serialized()();
}

uint64_t sub_1D2AA45C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD v13[3];

  v10 = *(_QWORD *)(a4 - 16);
  v13[0] = *(_QWORD *)(a4 - 8);
  MEMORY[0x1D82426B0](MEMORY[0x1E0DEAF40], a3, v13);
  v12 = v10;
  MEMORY[0x1D82426B0](MEMORY[0x1E0DEAF10], a3, &v12);
  result = TransportSerializable<>.init(serializedData:)(a1, a2);
  if (!v5)
    *a5 = v13[2];
  return result;
}

uint64_t Optional<A>.serialized()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v10 + 16))(v9, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4) == 1)
    return 0;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v9, v4);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(v4, a2);
  if (!v2)
    a2 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a2;
}

uint64_t Optional<A>.init(serializedData:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v9 = sub_1D2AB68C8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v14 - v11;
  if (a2 >> 60 == 15)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a4, 1, 1, v9);
  sub_1D2AB6478();
  swift_allocObject();
  sub_1D2AB646C();
  v15 = a3;
  MEMORY[0x1D82426B0](MEMORY[0x1E0DEE9A0], v9, &v15);
  sub_1D2AB6460();
  swift_release();
  result = sub_1D2A9E2D0(a1, a2);
  if (!v4)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a4, v12, v9);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(a4, 0, 1, v9);
  }
  return result;
}

uint64_t sub_1D2AA48EC(uint64_t a1, uint64_t a2)
{
  return Optional<A>.serialized()(a1, *(_QWORD *)(a2 - 8));
}

uint64_t sub_1D2AA4904@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return Optional<A>.init(serializedData:)(a1, a2, *(_QWORD *)(a3 - 16), a4);
}

uint64_t dispatch thunk of TransportSerializable.serialized()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TransportSerializable.init(serializedData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_1D2AA4950()
{
  uint64_t v0;

  sub_1D2AB649C();
  swift_allocObject();
  sub_1D2AB6490();
  sub_1D2AA4A1C(&qword_1EFC9ADC8, (uint64_t)&protocol conformance descriptor for ACHTriggerOptions);
  v0 = sub_1D2AB6484();
  swift_release();
  return v0;
}

uint64_t sub_1D2AA49F0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_1D2AA3F2C(a1, a2);
  if (!v3)
  {
    *(_QWORD *)a3 = result;
    *(_BYTE *)(a3 + 8) = 0;
  }
  return result;
}

uint64_t sub_1D2AA4A1C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for ACHTriggerOptions(255);
    result = MEMORY[0x1D82426B0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1D2AA4A5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EFC9ADD8;
  if (!qword_1EFC9ADD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFC9ADD0);
    v2 = MEMORY[0x1E0DEA9A0];
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0DEAF40], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EFC9ADD8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D82426A4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1D2AA4AFC()
{
  id v0;
  void *v1;
  int deviceClassNumber;

  v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    deviceClassNumber = MobileGestalt_get_deviceClassNumber();

    byte_1ED978AD8 = deviceClassNumber == 3;
  }
  else
  {
    __break(1u);
  }
}

uint64_t static Platform.current.getter()
{
  if (qword_1ED9789B0 != -1)
    swift_once();
  swift_beginAccess();
  return byte_1ED978AD8;
}

uint64_t static Platform.current.setter(char a1)
{
  uint64_t result;

  if (qword_1ED9789B0 != -1)
    swift_once();
  result = swift_beginAccess();
  byte_1ED978AD8 = a1;
  return result;
}

uint64_t (*static Platform.current.modify())()
{
  if (qword_1ED9789B0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

id Platform.internalInstall.getter()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    sub_1D2AB6694();

    v2 = sub_1D2AB66A0();
    swift_bridgeObjectRelease();
    v3 = v2 + 32;
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend((id)objc_opt_self(), sel_isInternal_, v3);
  swift_unknownObjectRelease();
  return v4;
}

ActivityAwardsServices::Platform_optional __swiftcall Platform.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3)
    LOBYTE(rawValue) = 3;
  return (ActivityAwardsServices::Platform_optional)rawValue;
}

void *static Platform.allCases.getter()
{
  return &unk_1E941E7D8;
}

uint64_t Platform.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_1D2AA4D78(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1D2AA4D90()
{
  unint64_t result;

  result = qword_1EFC9ADE0;
  if (!qword_1EFC9ADE0)
  {
    result = MEMORY[0x1D82426B0](&protocol conformance descriptor for Platform, &type metadata for Platform);
    atomic_store(result, (unint64_t *)&qword_1EFC9ADE0);
  }
  return result;
}

uint64_t sub_1D2AA4DD4()
{
  sub_1D2AB6B74();
  sub_1D2AB6B80();
  return sub_1D2AB6B8C();
}

uint64_t sub_1D2AA4E18()
{
  return sub_1D2AB6B80();
}

uint64_t sub_1D2AA4E40()
{
  sub_1D2AB6B74();
  sub_1D2AB6B80();
  return sub_1D2AB6B8C();
}

uint64_t *sub_1D2AA4E80@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_1D2AA4E98(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_1D2AA4EA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC9ADE8;
  if (!qword_1EFC9ADE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFC9ADF0);
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EFC9ADE8);
  }
  return result;
}

void sub_1D2AA4EF4(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E941E800;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Platform(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Platform(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1D2AA4FEC + 4 * byte_1D2AB76D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D2AA5020 + 4 * byte_1D2AB76D0[v4]))();
}

uint64_t sub_1D2AA5020(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D2AA5028(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D2AA5030);
  return result;
}

uint64_t sub_1D2AA503C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D2AA5044);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D2AA5048(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D2AA5050(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D2AA505C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1D2AA5068(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Platform()
{
  return &type metadata for Platform;
}

unint64_t sub_1D2AA5080(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9ADC0);
  v2 = sub_1D2AB6AE4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1D2AA58F0(v6, (uint64_t)v15);
    result = sub_1D2AA2CC8((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_1D2A9E240(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t TransportDispatchService.__allocating_init()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v0 = swift_allocObject();
  v1 = sub_1D2AA5720(MEMORY[0x1E0DEE9D8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978B30);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v0 + 16) = v2;
  return v0;
}

uint64_t sub_1D2AA5210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  os_unfair_lock_s *v18;

  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a4;
  v15[3] = a5;
  v15[4] = a6;
  v15[5] = a7;
  v15[6] = a2;
  v15[7] = a3;
  v16 = *(_QWORD *)(v7 + 16);
  v17 = (uint64_t *)(v16 + 16);
  v18 = (os_unfair_lock_s *)(v16 + 24);
  swift_retain();
  os_unfair_lock_lock(v18);
  sub_1D2A9BDDC(v17, a1, (uint64_t)sub_1D2AA5848, (uint64_t)v15);
  os_unfair_lock_unlock(v18);
  return swift_release();
}

uint64_t sub_1D2AA52D4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void (*a3)(char *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)(uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t result;
  void (*v25)(char *);
  char *v26;
  _BYTE *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v37 = a8;
  v43 = a3;
  v44 = a4;
  v40 = a6;
  v41 = a9;
  v13 = sub_1D2AB68C8();
  v38 = *(_QWORD *)(v13 - 8);
  v39 = v13;
  MEMORY[0x1E0C80A78](v13);
  v42 = (char *)&v36 - v14;
  v15 = sub_1D2AB68C8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v36 - v18;
  v45 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a7 + 16);
  sub_1D2A9B810(a1, a2);
  v23 = v46;
  result = v22(a1, a2, a5, a7);
  if (!v23)
  {
    v25 = v43;
    v26 = v42;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v19, 1, a5) == 1)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
      sub_1D2AA42D8();
      swift_allocError();
      *v27 = 0;
      return swift_willThrow();
    }
    else
    {
      v28 = v21;
      (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v21, v19, a5);
      v29 = v26;
      v25(v21);
      v30 = v40;
      v31 = *(_QWORD *)(v40 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v40) == 1)
      {
        (*(void (**)(char *, uint64_t))(v45 + 8))(v28, a5);
        result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v29, v39);
        v32 = (_OWORD *)v41;
        *(_QWORD *)(v41 + 32) = 0;
        *v32 = 0u;
        v32[1] = 0u;
      }
      else
      {
        v33 = (uint64_t *)v41;
        v34 = v37;
        *(_QWORD *)(v41 + 24) = v30;
        v33[4] = v34;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
        (*(void (**)(uint64_t *, char *, uint64_t))(v31 + 32))(boxed_opaque_existential_1, v29, v30);
        return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v28, a5);
      }
    }
  }
  return result;
}

uint64_t sub_1D2AA553C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  os_unfair_lock_s *v14;

  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = a2;
  v11[5] = a3;
  v12 = *(_QWORD *)(v5 + 16);
  v13 = (uint64_t *)(v12 + 16);
  v14 = (os_unfair_lock_s *)(v12 + 24);
  swift_retain();
  os_unfair_lock_lock(v14);
  sub_1D2A9BDDC(v13, a1, (uint64_t)sub_1D2AA588C, (uint64_t)v11);
  os_unfair_lock_unlock(v14);
  return swift_release();
}

uint64_t sub_1D2AA55EC@<X0>(void (*a1)(uint64_t)@<X2>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v16;

  v8 = sub_1D2AB68C8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v16 - v11;
  a1(v10);
  v13 = *(_QWORD *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, a2) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    *(_QWORD *)(a4 + 32) = 0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  else
  {
    *(_QWORD *)(a4 + 24) = a2;
    *(_QWORD *)(a4 + 32) = a3;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a4);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v13 + 32))(boxed_opaque_existential_1, v12, a2);
  }
  return result;
}

uint64_t TransportDispatchService.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t TransportDispatchService.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_1D2AA5720(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  unint64_t result;
  char v6;
  _OWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  _OWORD *v11;
  char v12;
  __int128 v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9E0];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED978A20);
  v3 = (_QWORD *)sub_1D2AB6AE4();
  v4 = *(_QWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 40);
  result = sub_1D2A9C0DC(v4);
  if ((v6 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  v7 = (_OWORD *)(a1 + 64);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v4;
    *(_OWORD *)(v3[7] + 16 * result) = v13;
    v8 = v3[2];
    v9 = __OFADD__(v8, 1);
    v10 = v8 + 1;
    if (v9)
      break;
    v3[2] = v10;
    if (!--v1)
      goto LABEL_8;
    v11 = (_OWORD *)((char *)v7 + 24);
    v4 = *((_QWORD *)v7 - 1);
    v13 = *v7;
    swift_retain();
    result = sub_1D2A9C0DC(v4);
    v7 = v11;
    if ((v12 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D2AA5824()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AA5848@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1D2AA52D4(a1, a2, *(void (**)(char *))(v3 + 48), *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), a3);
}

uint64_t sub_1D2AA5868()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AA588C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D2AA55EC(*(void (**)(uint64_t))(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1D2AA58A8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t method lookup function for TransportDispatchService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TransportDispatchService.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of TransportDispatchService.register<A, B>(_:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of TransportDispatchService.register<A>(_:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t sub_1D2AA58F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC9AE00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_1D2AA5974()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AA599C()
{
  sub_1D2AA5AE8();
  return sub_1D2AB6760();
}

uint64_t sub_1D2AA59E8()
{
  sub_1D2AA5AE8();
  return sub_1D2AB676C();
}

id ACHTriggerOptions.description.getter()
{
  id result;
  void *v1;
  uint64_t v2;

  result = (id)ACHTriggerOptionsToString();
  if (result)
  {
    v1 = result;
    v2 = sub_1D2AB6694();

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1D2AA5A94()
{
  id result;
  void *v1;
  uint64_t v2;

  result = (id)ACHTriggerOptionsToString();
  if (result)
  {
    v1 = result;
    v2 = sub_1D2AB6694();

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1D2AA5AE8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED9789D8;
  if (!qword_1ED9789D8)
  {
    type metadata accessor for ACHTriggerOptions(255);
    result = MEMORY[0x1D82426B0](&unk_1D2AB74D4, v1);
    atomic_store(result, (unint64_t *)&qword_1ED9789D8);
  }
  return result;
}

uint64_t ACHCodableEarnedInstanceArray.serialized()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D2AB6550();

  return v3;
}

uint64_t sub_1D2AA5B9C()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D2AB6550();

  return v3;
}

id sub_1D2AA5C08@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  id v7;
  id result;

  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  result = sub_1D2AA5C68(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

id sub_1D2AA5C68(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)sub_1D2AB6544();
    sub_1D2A9E2D0(a1, a2);
  }
  v10[0] = 0;
  v6 = objc_msgSend(v2, sel_initWithSerializedData_error_, v3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_1D2AB64FC();

    swift_willThrow();
  }
  return v6;
}

id XPCEndpointProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *XPCEndpointProvider.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  id v6;
  char *v7;
  objc_super v9;

  *(_QWORD *)&v0[OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_endpointsByEndpointName] = MEMORY[0x1E0DEE9E0];
  type metadata accessor for UnfairLock();
  v1 = swift_allocObject();
  v2 = v0;
  v3 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_lock] = v1;
  sub_1D2AB6694();
  v4 = objc_allocWithZone(MEMORY[0x1E0CB3B58]);
  v5 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithMachServiceName_, v5);

  *(_QWORD *)&v2[OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_listener] = v6;
  *(_QWORD *)&v2[OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_requiredEntitlements] = &unk_1E941E828;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for XPCEndpointProvider();
  v7 = (char *)objc_msgSendSuper2(&v9, sel_init);
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_listener], sel_setDelegate_, v7);
  return v7;
}

uint64_t type metadata accessor for XPCEndpointProvider()
{
  return objc_opt_self();
}

id sub_1D2AA5EE8()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  Swift::String v3;

  if (qword_1ED9788D8 != -1)
    swift_once();
  v1 = sub_1D2AB6634();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED9786E8);
  v2._object = (void *)0x80000001D2AB8530;
  v2._countAndFlagsBits = 0xD000000000000069;
  v3._countAndFlagsBits = 0x6574617669746361;
  v3._object = (void *)0xEA00000000002928;
  Logger.trace(file:function:)(v2, v3);
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_listener), sel_resume);
}

id XPCEndpointProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCEndpointProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Bool __swiftcall XPCEndpointProvider.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return sub_1D2A9A520(shouldAcceptNewConnection.super.isa);
}

void sub_1D2AA601C(void *a1, const char *a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;

  if (qword_1ED978B60 != -1)
    swift_once();
  v4 = sub_1D2AB6634();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED978D88);
  v14 = a1;
  v5 = sub_1D2AB661C();
  v6 = sub_1D2AB6868();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v15 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = objc_msgSend(v14, sel_serviceName);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1D2AB6694();
      v13 = v12;

    }
    else
    {
      v13 = 0xEB00000000646569;
      v11 = 0x6669636570736E75;
    }
    sub_1D2A9CC8C(v11, v13, &v15);
    sub_1D2AB68E0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D2A96000, v5, v6, a2, v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v8, -1, -1);
    MEMORY[0x1D8242734](v7, -1, -1);

  }
  else
  {

  }
}

uint64_t XPCEndpointProvider.createEndpointNamed(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1D2AA6238()
{
  uint64_t v0;
  char *v1;
  id v2;

  v1 = sub_1D2A9AAE4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  v2 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_listener], sel_endpoint);

  return (*(uint64_t (**)(id))(v0 + 8))(v2);
}

uint64_t method lookup function for XPCEndpointProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCEndpointProvider.activate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t sub_1D2AA62CC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1D2AA6304()
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
  v5[1] = sub_1D2AA64D4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EFC9B1A0 + dword_1EFC9B1A0))(v2, v3, v4);
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AA63AC(uint64_t a1)
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
  v7[1] = sub_1D2AA64D4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EFC9B1B0 + dword_1EFC9B1B0))(a1, v4, v5, v6);
}

uint64_t sub_1D2AA6430(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978A40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D2AA6470()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1D2AA6494()
{
  uint64_t v0;

  sub_1D2AA601C(*(void **)(v0 + 16), "XPC client connection (%{public}s) invalidated");
}

void sub_1D2AA64B4()
{
  uint64_t v0;

  sub_1D2AA601C(*(void **)(v0 + 16), "XPC client connection (%{public}s) interrupted");
}

id sub_1D2AA64E4()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for NotificationSystem();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_1D2AA66A0()
{
  _BYTE *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  if (qword_1ED9788D8 != -1)
    swift_once();
  v1 = sub_1D2AB6634();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED9786E8);
  v2 = sub_1D2AB661C();
  v3 = sub_1D2AB6874();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2A96000, v2, v3, "Received notificationSuppressionChanged notification, re-notify any pending achievements", v4, 2u);
    MEMORY[0x1D8242734](v4, -1, -1);
  }

  v5 = *(_QWORD *)&v0[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_lock];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v5 + 16));
  v6 = (uint64_t *)&v0[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_pendingAchievementsToNotify];
  swift_beginAccess();
  v7 = *v6;
  *v6 = MEMORY[0x1E0DEE9E8];
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v5 + 16));
  if ((v7 & 0xC000000000000001) != 0)
  {
    if (sub_1D2AB6988())
    {
LABEL_7:
      os_unfair_lock_lock(*(os_unfair_lock_t *)(v5 + 16));
      sub_1D2A99B3C(v0, v7);
      os_unfair_lock_unlock(*(os_unfair_lock_t *)(v5 + 16));
      swift_bridgeObjectRelease();
      return;
    }
  }
  else if (*(_QWORD *)(v7 + 16))
  {
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  v8 = sub_1D2AB661C();
  v9 = sub_1D2AB685C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D2A96000, v8, v9, "No pending achievements to notify", v10, 2u);
    MEMORY[0x1D8242734](v10, -1, -1);
  }

}

void sub_1D2AA68C4(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  int64_t v15;
  _QWORD *v16;
  id v17[6];

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1D2AB6958();
    sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
    sub_1D2A9D770();
    sub_1D2AB6844();
    v1 = (unint64_t)v17[1];
    v16 = v17[2];
    v2 = (uint64_t)v17[3];
    v3 = v17[4];
    v4 = (unint64_t)v17[5];
  }
  else
  {
    v3 = 0;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v16 = (_QWORD *)(a1 + 56);
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
  }
  v15 = (unint64_t)(v2 + 64) >> 6;
  if ((v1 & 0x8000000000000000) != 0)
    goto LABEL_10;
  while (1)
  {
    if (v4)
    {
      v8 = (v4 - 1) & v4;
      v9 = __clz(__rbit64(v4)) | ((_QWORD)v3 << 6);
      v10 = (char *)v3;
      goto LABEL_29;
    }
    v12 = (uint64_t)v3 + 1;
    if (__OFADD__(v3, 1))
      break;
    if (v12 >= v15)
      goto LABEL_32;
    v13 = v16[v12];
    v10 = (char *)v3 + 1;
    if (!v13)
    {
      v10 = (char *)v3 + 2;
      if ((uint64_t)v3 + 2 >= v15)
        goto LABEL_32;
      v13 = v16[(_QWORD)v10];
      if (!v13)
      {
        v10 = (char *)v3 + 3;
        if ((uint64_t)v3 + 3 >= v15)
          goto LABEL_32;
        v13 = v16[(_QWORD)v10];
        if (!v13)
        {
          v10 = (char *)v3 + 4;
          if ((uint64_t)v3 + 4 >= v15)
            goto LABEL_32;
          v13 = v16[(_QWORD)v10];
          if (!v13)
          {
            v10 = (char *)v3 + 5;
            if ((uint64_t)v3 + 5 >= v15)
              goto LABEL_32;
            v13 = v16[(_QWORD)v10];
            if (!v13)
            {
              v14 = (char *)v3 + 6;
              while ((char *)v15 != v14)
              {
                v13 = v16[(_QWORD)v14++];
                if (v13)
                {
                  v10 = v14 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1D2AA8BE4();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v8 = (v13 - 1) & v13;
    v9 = __clz(__rbit64(v13)) + ((_QWORD)v10 << 6);
LABEL_29:
    v11 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v9);
    if (!v11)
      goto LABEL_32;
    while (1)
    {
      sub_1D2AA7E60(v17, v11, (unint64_t *)&qword_1ED978B70, 0x1E0CF4FE0, (uint64_t *)&unk_1EFC9AF98);

      v3 = v10;
      v4 = v8;
      if ((v1 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (sub_1D2AB69B8())
      {
        sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v11 = v17[0];
        swift_unknownObjectRelease();
        v10 = (char *)v3;
        v8 = v4;
        if (v11)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

void sub_1D2AA6B98(NSObject *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  unsigned int v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  id v44;
  id v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void (*v56)(char *, uint64_t);
  id v57;
  id v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  os_log_t v62;
  char *v63;
  os_log_t v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  unsigned int v69;
  char *v70;
  void (*v71)(os_log_t, uint64_t);
  id v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  id v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  int v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  void (*v87)(char *, uint64_t);
  id v88;
  id v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  NSObject *v93;
  void (*v94)(char *, uint64_t);
  char *v95;
  char *v96;
  os_log_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  id v108[2];

  v108[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = sub_1D2AB6634();
  v100 = *(_QWORD *)(v2 - 8);
  v101 = v2;
  v3 = MEMORY[0x1E0C80A78](v2);
  v102 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v96 = (char *)&v95 - v5;
  v6 = sub_1D2AB658C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D2AB6610();
  v98 = *(_QWORD *)(v10 - 8);
  v99 = v10;
  MEMORY[0x1E0C80A78](v10);
  v104 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v95 - v16;
  v18 = sub_1D2AB64E4();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x1E0C80A78](v18);
  v95 = (char *)&v95 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v95 - v23;
  v25 = MEMORY[0x1E0C80A78](v22);
  v27 = (char *)&v95 - v26;
  MEMORY[0x1E0C80A78](v25);
  v97 = (os_log_t)((char *)&v95 - v28);
  v105 = a1;
  v29 = -[NSObject relevantEarnedInstance](a1, sel_relevantEarnedInstance);
  v106 = v18;
  if (!v29)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
LABEL_7:
    sub_1D2AA8BEC((uint64_t)v17);
    v34 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
    v35 = v104;
    sub_1D2AB65D4();

    if (qword_1ED978580 != -1)
      swift_once();
    sub_1D2AB6580();
    sub_1D2AB65BC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v36 = (void *)sub_1D2AB64A8();
    v37 = (id)ACHYearMonthDayStringFromDateComponents();

    v38 = *(void **)&v103[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_unearnedKeyValueStore];
    v39 = -[NSObject template](v105, sel_template);
    v40 = objc_msgSend(v39, sel_uniqueName);

    if (v40)
    {
      v108[0] = 0;
      v41 = objc_msgSend(v38, sel_setString_forKey_error_, v37, v40, v108);

      v42 = v102;
      if (v41)
      {
        v43 = *(void (**)(char *, uint64_t))(v19 + 8);
        v44 = v108[0];
        v43(v27, v106);
        (*(void (**)(char *, uint64_t))(v98 + 8))(v35, v99);
        return;
      }
      v45 = v108[0];
      v46 = (char *)sub_1D2AB64FC();

      v103 = v46;
      swift_willThrow();
      if (qword_1ED9788D8 != -1)
        swift_once();
      v47 = v101;
      v48 = __swift_project_value_buffer(v101, (uint64_t)qword_1ED9786E8);
      v49 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v42, v48, v47);
      v50 = v95;
      v51 = v106;
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v95, v27, v106);
      v40 = v105;
      v52 = sub_1D2AB661C();
      LODWORD(v105) = sub_1D2AB6868();
      if (!os_log_type_enabled(v52, (os_log_type_t)v105))
      {

        v73 = v51;
        v74 = *(void (**)(char *, uint64_t))(v19 + 8);
        v74(v50, v73);
        (*(void (**)(char *, uint64_t))(v49 + 8))(v42, v47);
        v74(v27, v73);
        goto LABEL_21;
      }
      v97 = v52;
      v53 = swift_slowAlloc();
      v96 = (char *)swift_slowAlloc();
      v108[0] = v96;
      *(_DWORD *)v53 = 136315394;
      sub_1D2AA8C2C();
      v54 = sub_1D2AB6AFC();
      v107 = sub_1D2A9CC8C(v54, v55, (uint64_t *)v108);
      sub_1D2AB68E0();
      swift_bridgeObjectRelease();
      v56 = *(void (**)(char *, uint64_t))(v19 + 8);
      v56(v50, v51);
      *(_WORD *)(v53 + 12) = 2080;
      v57 = -[NSObject template](v40, sel_template);
      v58 = objc_msgSend(v57, sel_uniqueName);

      if (v58)
      {
        v59 = sub_1D2AB6694();
        v61 = v60;

        v107 = sub_1D2A9CC8C(v59, v61, (uint64_t *)v108);
        sub_1D2AB68E0();

        swift_bridgeObjectRelease();
        v62 = v97;
        _os_log_impl(&dword_1D2A96000, v97, (os_log_type_t)v105, "Error setting unearned alert date %s for achivement %s", (uint8_t *)v53, 0x16u);
        v63 = v96;
        swift_arrayDestroy();
        MEMORY[0x1D8242734](v63, -1, -1);
        MEMORY[0x1D8242734](v53, -1, -1);

        (*(void (**)(char *, uint64_t))(v100 + 8))(v102, v101);
        v56(v27, v106);
LABEL_21:
        (*(void (**)(char *, uint64_t))(v98 + 8))(v104, v99);
        return;
      }
      goto LABEL_30;
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:

    __break(1u);
    goto LABEL_31;
  }
  v30 = v29;
  v31 = objc_msgSend(v29, sel_earnedDateComponents);

  if (v31)
  {
    sub_1D2AB64C0();

    v32 = 0;
  }
  else
  {
    v32 = 1;
  }
  v33 = v106;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v15, v32, 1, v106);
  sub_1D2AA8C74((uint64_t)v15, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v33) == 1)
    goto LABEL_7;
  v64 = v97;
  (*(void (**)(os_log_t, char *, uint64_t))(v19 + 32))(v97, v17, v33);
  v65 = (void *)sub_1D2AB64A8();
  v66 = (id)ACHYearMonthDayStringFromDateComponents();

  v40 = *(NSObject **)&v103[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_earnedKeyValueStore];
  v67 = -[NSObject template](v105, sel_template);
  v68 = objc_msgSend(v67, sel_uniqueName);

  if (!v68)
    goto LABEL_29;
  v108[0] = 0;
  v69 = -[NSObject setString:forKey:error:](v40, sel_setString_forKey_error_, v66, v68, v108);

  v70 = v96;
  if (v69)
  {
    v71 = *(void (**)(os_log_t, uint64_t))(v19 + 8);
    v72 = v108[0];
    v71(v64, v106);
    return;
  }
  v75 = v108[0];
  v76 = (char *)sub_1D2AB64FC();

  v104 = v76;
  swift_willThrow();
  if (qword_1ED9788D8 != -1)
    swift_once();
  v77 = v101;
  v78 = __swift_project_value_buffer(v101, (uint64_t)qword_1ED9786E8);
  v79 = v100;
  (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v70, v78, v77);
  v80 = v106;
  (*(void (**)(char *, os_log_t, uint64_t))(v19 + 16))(v24, v64, v106);
  v40 = v105;
  v81 = sub_1D2AB661C();
  v82 = sub_1D2AB6868();
  if (!os_log_type_enabled(v81, (os_log_type_t)v82))
  {

    v94 = *(void (**)(char *, uint64_t))(v19 + 8);
    v94(v24, v80);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v70, v77);
    v94((char *)v64, v80);
    return;
  }
  LODWORD(v103) = v82;
  v105 = v81;
  v83 = swift_slowAlloc();
  v84 = (void *)swift_slowAlloc();
  v108[0] = v84;
  *(_DWORD *)v83 = 136315394;
  sub_1D2AA8C2C();
  v85 = sub_1D2AB6AFC();
  v107 = sub_1D2A9CC8C(v85, v86, (uint64_t *)v108);
  sub_1D2AB68E0();
  swift_bridgeObjectRelease();
  v87 = *(void (**)(char *, uint64_t))(v19 + 8);
  v87(v24, v80);
  *(_WORD *)(v83 + 12) = 2080;
  v88 = -[NSObject template](v40, sel_template);
  v89 = objc_msgSend(v88, sel_uniqueName);

  if (v89)
  {
    v90 = sub_1D2AB6694();
    v92 = v91;

    v107 = sub_1D2A9CC8C(v90, v92, (uint64_t *)v108);
    sub_1D2AB68E0();

    swift_bridgeObjectRelease();
    v93 = v105;
    _os_log_impl(&dword_1D2A96000, v105, (os_log_type_t)v103, "Error setting earned alert date %s for achivement %s", (uint8_t *)v83, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v84, -1, -1);
    MEMORY[0x1D8242734](v83, -1, -1);

    (*(void (**)(char *, uint64_t))(v100 + 8))(v96, v101);
    v87((char *)v97, v80);
    return;
  }
LABEL_31:

  __break(1u);
}

uint64_t type metadata accessor for NotificationSystem()
{
  return objc_opt_self();
}

void sub_1D2AA76B8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void (*v23)(char *, char *, uint64_t);
  id v24;
  char *v25;
  void *v26;
  void *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v2 = sub_1D2AB658C();
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D2AB6610();
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  MEMORY[0x1E0C80A78](v5);
  v31 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D2AB64E4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v29 - v15;
  v17 = objc_msgSend(a1, sel_template);
  v18 = objc_msgSend(v17, sel_uniqueName);

  if (!v18)
  {
    __break(1u);
    return;
  }
  sub_1D2AB6694();

  sub_1D2AB6880();
  v20 = v19;
  swift_bridgeObjectRelease();
  if (v20)
  {
    v21 = (void *)sub_1D2AB6688();
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = 0;
  }
  v22 = (id)ACHYearMonthDayDateComponentsFromString();

  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
    goto LABEL_11;
  }
  sub_1D2AB64C0();

  v23 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v23(v9, v14, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
LABEL_11:
    sub_1D2AA8BEC((uint64_t)v9);
    return;
  }
  v23(v16, v9, v10);
  v24 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  v25 = v31;
  sub_1D2AB65D4();

  if (qword_1ED978580 != -1)
    swift_once();
  sub_1D2AB6580();
  sub_1D2AB65BC();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v4, v30);
  v26 = (void *)sub_1D2AB64A8();
  v27 = (void *)sub_1D2AB64A8();
  ACHDateComponentsAreEqualForYearMonthDay();

  v28 = *(void (**)(char *, uint64_t))(v11 + 8);
  v28(v14, v10);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v33);
  v28(v16, v10);
}

void sub_1D2AA7A50(id a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[2];

  v3 = sub_1D2AB6634();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v7)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:

    __break(1u);
    return;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, sel_features);

  if (!v9)
    goto LABEL_19;
  v10 = objc_msgSend(v9, sel_pauseRings);

  if (v10)
  {
    v34 = v6;
    v35 = v4;
    v33 = v3;
    LODWORD(v36) = objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_pauseRingsCoordinator), sel_isPaused);
    v11 = 0;
    while (1)
    {
      v13 = *(_QWORD *)((char *)&unk_1E941E888 + v11 + 32);
      v12 = *(_QWORD *)((char *)&unk_1E941E888 + v11 + 40);
      swift_bridgeObjectRetain();
      v14 = objc_msgSend(a1, sel_template);
      v15 = objc_msgSend(v14, sel_uniqueName);

      if (!v15)
      {
        __break(1u);
        goto LABEL_18;
      }
      v16 = sub_1D2AB6694();
      v18 = v17;

      v39[0] = v16;
      v39[1] = v18;
      v37 = v13;
      v38 = v12;
      sub_1D2AA0464();
      v19 = sub_1D2AB6910();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        break;
      swift_bridgeObjectRelease();
      v11 += 16;
      if (v11 == 176)
      {
        swift_arrayDestroy();
        return;
      }
    }
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    if ((v36 & 1) == 0)
      return;
    if (qword_1ED9788D8 != -1)
      swift_once();
    v20 = v33;
    v21 = __swift_project_value_buffer(v33, (uint64_t)qword_1ED9786E8);
    v23 = v34;
    v22 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v34, v21, v20);
    a1 = a1;
    v24 = sub_1D2AB661C();
    v25 = sub_1D2AB6874();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v39[0] = v36;
      *(_DWORD *)v26 = 136315138;
      v27 = objc_msgSend(a1, sel_template);
      v28 = objc_msgSend(v27, sel_uniqueName);

      if (!v28)
        goto LABEL_20;
      v29 = sub_1D2AB6694();
      v31 = v30;

      v37 = sub_1D2A9CC8C(v29, v31, v39);
      sub_1D2AB68E0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D2A96000, v24, v25, "Will skip alerting %s achievement because we are currently paused.", v26, 0xCu);
      v32 = v36;
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v32, -1, -1);
      MEMORY[0x1D8242734](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v20);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v20);
    }
  }
}

uint64_t sub_1D2AA7E44(_QWORD *a1, void *a2)
{
  return sub_1D2AA7E60(a1, a2, &qword_1EFC9AFC0, 0x1E0CF5050, &qword_1EFC9AFC8);
}

uint64_t sub_1D2AA7E60(_QWORD *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v8;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = v5;
  v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0)
      v12 = *v5;
    else
      v12 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v13 = a2;
    v14 = sub_1D2AB6994();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_1D2A9D738(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1D2AB6988();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v26 = sub_1D2AA8128(v12, result + 1, a5, a3);
    v37 = v26;
    v27 = *(_QWORD *)(v26 + 16);
    if (*(_QWORD *)(v26 + 24) <= v27)
    {
      v32 = v27 + 1;
      v33 = v13;
      sub_1D2AA8328(v32, a5);
      v28 = v37;
    }
    else
    {
      v28 = v26;
      v29 = v13;
    }
    sub_1D2AA85C0((uint64_t)v13, v28);
    *v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    v16 = sub_1D2AB68B0();
    v17 = -1 << *(_BYTE *)(v11 + 32);
    v18 = v16 & ~v17;
    if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
    {
      sub_1D2A9D738(0, a3);
      v19 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
      v20 = sub_1D2AB68BC();

      if ((v20 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v24 = *(void **)(*(_QWORD *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        v25 = v24;
        return 0;
      }
      v21 = ~v17;
      while (1)
      {
        v18 = (v18 + 1) & v21;
        if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          break;
        v22 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
        v23 = sub_1D2AB68BC();

        if ((v23 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v38 = *v5;
    *v5 = 0x8000000000000000;
    v31 = a2;
    sub_1D2AA8640((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

uint64_t sub_1D2AA8128(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_1D2AB6A18();
    v19 = v6;
    sub_1D2AB6958();
    if (sub_1D2AB69B8())
    {
      sub_1D2A9D738(0, a4);
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_1D2AA8328(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_1D2AB68B0();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_1D2AB69B8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  return v6;
}

uint64_t sub_1D2AA8328(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_1D2AB6A0C();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_1D2AB68B0();
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t sub_1D2AA85C0(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_1D2AB68B0();
  result = sub_1D2AB6940();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_1D2AA8640(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(_QWORD *)(*v5 + 16);
  v10 = *(_QWORD *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0)
    goto LABEL_14;
  v11 = v9 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1D2AA8328(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_1D2AA87D0(a4);
      goto LABEL_14;
    }
    sub_1D2AA8970(v11, a4);
  }
  v12 = *v5;
  v13 = sub_1D2AB68B0();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_1D2A9D738(0, a5);
    v15 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
    v16 = sub_1D2AB68BC();

    if ((v16 & 1) != 0)
    {
LABEL_13:
      sub_1D2AB6B2C();
      __break(1u);
    }
    else
    {
      v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
        v19 = sub_1D2AB68BC();

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * a2) = a1;
  v21 = *(_QWORD *)(v20 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v23;
}

id sub_1D2AA87D0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1D2AB6A00();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1D2AA8970(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_1D2AB6A0C();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_1D2AB68B0();
    v22 = -1 << *(_BYTE *)(v6 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1D2AA8BE4()
{
  return swift_release();
}

uint64_t sub_1D2AA8BEC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1D2AA8C2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC9AFA8;
  if (!qword_1EFC9AFA8)
  {
    v1 = sub_1D2AB64E4();
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0CAEAF0], v1);
    atomic_store(result, (unint64_t *)&qword_1EFC9AFA8);
  }
  return result;
}

uint64_t sub_1D2AA8C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED9787B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AwardingListener(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for AwardingListener(id *a1)
{

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

_QWORD *initializeWithCopy for AwardingListener(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = *(void **)(a2 + 32);
  v7 = *(void **)(a2 + 40);
  a1[4] = v6;
  a1[5] = v7;
  v8 = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9 = v5;
  v10 = v6;
  v11 = v7;
  return a1;
}

uint64_t assignWithCopy for AwardingListener(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v7 = *(void **)(a2 + 24);
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 32);
  v11 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  v12 = v10;

  v13 = *(void **)(a2 + 40);
  v14 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v13;
  v15 = v13;

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AwardingListener(uint64_t a1, _OWORD *a2)
{
  void *v4;
  void *v5;

  *(_OWORD *)a1 = *a2;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  v5 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];

  return a1;
}

uint64_t getEnumTagSinglePayload for AwardingListener(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AwardingListener(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AwardingListener()
{
  return &type metadata for AwardingListener;
}

uint64_t sub_1D2AA8F6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D2AB6808();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v6 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v6 + 48) = v7;
  *(_OWORD *)(v6 + 64) = *(_OWORD *)(a1 + 32);
  v8 = *(void **)a1;
  v9 = *(void **)(a1 + 24);
  v11 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v12 = v8;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = v9;
  v14 = v11;
  v15 = v10;
  sub_1D2AA1B08((uint64_t)v4, (uint64_t)&unk_1EFC9B068, v6);
  swift_release();
  return 1701736260;
}

id sub_1D2AA9080(uint64_t a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v1 = objc_msgSend(*(id *)(a1 + 8), sel_allAchievements);
  sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
  sub_1D2AAC0E8((unint64_t *)&qword_1ED9789D0, (unint64_t *)&qword_1ED978B70);
  v2 = sub_1D2AB6820();

  sub_1D2AA9524(v2);
  swift_bridgeObjectRelease();
  v3 = objc_allocWithZone(MEMORY[0x1E0CF5010]);
  sub_1D2A9D738(0, (unint64_t *)&qword_1ED978DB8);
  v4 = (void *)sub_1D2AB6784();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithCodableAchievements_, v4);

  return v5;
}

id sub_1D2AA9190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)(a3 + 8);
  v4 = (void *)sub_1D2AB6688();
  v5 = objc_msgSend(v3, sel_ephemeralAchievementWithTemplateUniqueName_, v4);

  if (!v5)
    return 0;
  v6 = (id)ACHCodableFromAchievement();

  return v6;
}

id sub_1D2AA9200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v9;

  v3 = *(void **)(a3 + 40);
  v4 = (void *)sub_1D2AB6688();
  v5 = objc_msgSend(v3, sel_templatesForSource_, v4);

  sub_1D2A9D738(0, &qword_1ED9789C8);
  v6 = sub_1D2AB679C();

  sub_1D2AA973C(v6);
  swift_bridgeObjectRelease();
  v7 = objc_allocWithZone(MEMORY[0x1E0CF5040]);
  sub_1D2A9D738(0, (unint64_t *)&unk_1ED9789F0);
  v8 = (void *)sub_1D2AB6784();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_initWithCodableTemplates_, v8);

  return v9;
}

uint64_t sub_1D2AA9300(void *a1, uint64_t a2)
{
  return sub_1D2AAA2C4(a1, *(void **)(a2 + 40));
}

uint64_t sub_1D2AA9308(void *a1, uint64_t a2)
{
  return sub_1D2AAA530(a1, *(void **)(a2 + 40));
}

id sub_1D2AA9310(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_1D2AAA9C0(a1, a2, *(void **)(a3 + 40));
}

id sub_1D2AA9318(uint64_t a1, uint64_t a2)
{
  return sub_1D2AAAC88(a1, *(void **)(a2 + 40));
}

uint64_t sub_1D2AA9320(void *a1, uint64_t a2)
{
  return sub_1D2AAB068(a1, *(void **)(a2 + 24));
}

uint64_t sub_1D2AA9328(void *a1, uint64_t a2)
{
  return sub_1D2AAB530(a1, *(void **)(a2 + 24));
}

uint64_t sub_1D2AA9330(void *a1, uint64_t a2)
{
  return sub_1D2AAB9C0(a1, *(void **)(a2 + 32));
}

BOOL sub_1D2AA9338(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_1D2AABD7C(a1, a2, *(void **)(a3 + 32));
}

uint64_t sub_1D2AA9340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 120) = a1;
  *(_QWORD *)(v4 + 128) = a4;
  return swift_task_switch();
}

uint64_t sub_1D2AA9358()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[16] + 16);
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_1D2AA93F0;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_1D2AA94A4;
  v3[3] = &block_descriptor_0;
  v3[4] = v2;
  objc_msgSend(v1, sel_requestAwardingEvaluationWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_1D2AA93F0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1D2AA9450()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 120) = *(_BYTE *)(v0 + 144);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AA9468()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AA94A4(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED978A30);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1D2AA9524(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  int64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  void (*v19)(_BYTE *, _QWORD);
  _BYTE v20[32];
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = sub_1D2AB6988();
    result = MEMORY[0x1E0DEE9D8];
    if (!v3)
      return result;
    v24 = MEMORY[0x1E0DEE9D8];
    sub_1D2AB6A78();
    v21 = sub_1D2AB694C();
    v22 = v5;
    v23 = 1;
    if ((v3 & 0x8000000000000000) == 0)
      goto LABEL_9;
    __break(1u);
  }
  v3 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v24 = MEMORY[0x1E0DEE9D8];
    sub_1D2AB6A78();
    v21 = sub_1D2AAA048(a1);
    v22 = v6;
    v23 = v7 & 1;
    while (1)
    {
LABEL_9:
      while (1)
      {
        v13 = v21;
        v14 = v22;
        v15 = v23;
        sub_1D2AA9DE0(v21, v22, v23, a1);
        v17 = v16;
        v18 = (id)ACHCodableFromAchievement();

        sub_1D2AB6A60();
        sub_1D2AB6A84();
        sub_1D2AB6A90();
        result = sub_1D2AB6A6C();
        if (v2)
          break;
        v8 = sub_1D2AA9CFC(v13, v14, v15, a1);
        v10 = v9;
        v12 = v11;
        sub_1D2AAC128(v13, v14, v15);
        v21 = v8;
        v22 = v10;
        v23 = v12 & 1;
        if (!--v3)
          goto LABEL_14;
      }
      if ((v15 & 1) == 0)
        break;
      if (sub_1D2AB6964())
        swift_isUniquelyReferenced_nonNull_native();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC9B050);
      v19 = (void (*)(_BYTE *, _QWORD))sub_1D2AB6838();
      sub_1D2AB69D0();
      v19(v20, 0);
      if (!--v3)
      {
LABEL_14:
        sub_1D2AAC128(v21, v22, v23);
        return v24;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1D2AA973C(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  if (a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x1E0DEE9D8];
    if (!v2)
      break;
    v8 = MEMORY[0x1E0DEE9D8];
    result = sub_1D2AB6A78();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D8242098](v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      v7 = (id)ACHCodableFromTemplate();

      sub_1D2AB6A60();
      sub_1D2AB6A84();
      sub_1D2AB6A90();
      sub_1D2AB6A6C();
      if (v2 == v4)
        return v8;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v2 = sub_1D2AB6AC0();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1D2AA9874(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  os_log_type_t v34;
  uint8_t *v35;
  NSObject *v36;
  _QWORD *v37;

  v3 = *a1;
  v4 = objc_msgSend(*a1, sel_templateUniqueName);
  if (!v4)
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v27 = sub_1D2AB6634();
    __swift_project_value_buffer(v27, (uint64_t)qword_1ED9786E8);
    v28 = sub_1D2AB661C();
    v29 = sub_1D2AB6868();
    if (!os_log_type_enabled(v28, v29))
      goto LABEL_20;
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    v31 = "Could not deserialize template or find achievement";
LABEL_13:
    _os_log_impl(&dword_1D2A96000, v28, v29, v31, v30, 2u);
    MEMORY[0x1D8242734](v30, -1, -1);
LABEL_20:

    v26 = 0;
    goto LABEL_21;
  }
  v5 = v4;
  sub_1D2AB6694();

  v6 = objc_msgSend(v3, sel_progressQuantityUnit);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    if (qword_1ED9788D8 != -1)
      swift_once();
    v32 = sub_1D2AB6634();
    __swift_project_value_buffer(v32, (uint64_t)qword_1ED9786E8);
    v28 = sub_1D2AB661C();
    v29 = sub_1D2AB6868();
    if (!os_log_type_enabled(v28, v29))
      goto LABEL_20;
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    v31 = "Could not deserialize progress unit string";
    goto LABEL_13;
  }
  v7 = v6;
  v37 = a2;
  sub_1D2AB6694();

  objc_msgSend(v3, sel_progressQuantityValue);
  v9 = v8;
  v10 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_unitFromString_, v10);

  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_quantityWithUnit_doubleValue_, v12, v9);
  v15 = objc_msgSend(v3, sel_goalQuantityUnit);
  if (!v15)
  {
    swift_bridgeObjectRelease();
    if (qword_1ED9788D8 != -1)
      swift_once();
    v33 = sub_1D2AB6634();
    __swift_project_value_buffer(v33, (uint64_t)qword_1ED9786E8);
    v28 = sub_1D2AB661C();
    v34 = sub_1D2AB6868();
    if (os_log_type_enabled(v28, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1D2A96000, v28, v34, "Could not deserialize goal unit string", v35, 2u);
      MEMORY[0x1D8242734](v35, -1, -1);
      v36 = v12;
    }
    else
    {
      v36 = v28;
      v28 = v12;
    }
    a2 = v37;

    goto LABEL_20;
  }
  v16 = v15;
  sub_1D2AB6694();

  objc_msgSend(v3, sel_goalQuantityValue);
  v18 = v17;
  v19 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v11, sel_unitFromString_, v19);

  v21 = objc_msgSend(v13, sel_quantityWithUnit_doubleValue_, v20, v18);
  v22 = objc_allocWithZone(MEMORY[0x1E0CF4FF0]);
  v23 = v14;
  v24 = v21;
  v25 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v22, sel_initWithTemplateUniqueName_progressQuantity_goalQuantity_, v25, v23, v24);

  a2 = v37;
LABEL_21:
  *a2 = v26;
}

int64_t sub_1D2AA9CFC(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_1D2AA9DE0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_1D2AB6970() == *(_DWORD *)(a4 + 36))
      {
        sub_1D2AB697C();
        sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_1D2AB68B0();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_1D2AB68BC();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_1D2AB68BC();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x1D8241FF0](a1, a2, v7);
  sub_1D2A9D738(0, (unint64_t *)&qword_1ED978B70);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_1D2AAA048(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_1D2AAA0D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t result;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v0 = sub_1D2AB6634();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED9788D8 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED9786E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_1D2AB661C();
  v6 = sub_1D2AB6874();
  if (!os_log_type_enabled(v5, v6))
    goto LABEL_6;
  v7 = (uint8_t *)swift_slowAlloc();
  v15 = swift_slowAlloc();
  v17 = v15;
  *(_DWORD *)v7 = 136315138;
  result = (uint64_t)(id)ACHTriggerOptionsToString();
  if (result)
  {
    v9 = (void *)result;
    v10 = sub_1D2AB6694();
    v12 = v11;

    v16 = sub_1D2A9CC8C(v10, v12, &v17);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D2A96000, v5, v6, "Received triggers %s!", v7, 0xCu);
    v13 = v15;
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v13, -1, -1);
    MEMORY[0x1D8242734](v7, -1, -1);
LABEL_6:

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D2AAA2C4(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  _BYTE v20[32];
  _OWORD v21[2];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v4 = sub_1D2AB6514();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_templatesCount))
  {
    v8 = objc_msgSend(a1, sel_templates);
    if (v8)
    {
      v17 = v5;
      v18 = a2;
      v24 = MEMORY[0x1E0DEE9D8];
      v9 = v8;
      sub_1D2AB68A4();
      v16 = v9;

      sub_1D2AAC0A0();
      sub_1D2AB68D4();
      while (v23)
      {
        sub_1D2A9E240(&v22, v21);
        sub_1D2A9CD5C((uint64_t)v21, (uint64_t)v20);
        sub_1D2A9D738(0, (unint64_t *)&unk_1ED9789F0);
        if (swift_dynamicCast())
        {
          v10 = v19;
          v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5058]), sel_initWithCodable_, v19);

          v12 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
          if (v11)
          {
            MEMORY[0x1D8241DC8](v12);
            if (*(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1D2AB67B4();
            sub_1D2AB67CC();
            sub_1D2AB67A8();
          }
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
        }
        sub_1D2AB68D4();
      }
      (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v4);
      sub_1D2A9D738(0, &qword_1ED9789C8);
      v13 = (void *)sub_1D2AB6784();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_addTemplates_, v13);

    }
  }
  return 1;
}

uint64_t sub_1D2AAA530(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  _BYTE v33[32];
  _OWORD v34[2];
  uint64_t v35[3];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = sub_1D2AB6514();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(a1, sel_templatesCount))
    return 1;
  v8 = objc_msgSend(a1, sel_templates);
  if (!v8)
    return 1;
  v28 = v5;
  v29 = a2;
  v32 = MEMORY[0x1E0DEE9D8];
  v9 = v8;
  sub_1D2AB68A4();
  v30 = v9;

  sub_1D2AAC0A0();
  sub_1D2AB68D4();
  while (v36)
  {
    sub_1D2A9E240(v35, v34);
    sub_1D2A9CD5C((uint64_t)v34, (uint64_t)v33);
    sub_1D2A9D738(0, (unint64_t *)&unk_1ED9789F0);
    if (swift_dynamicCast())
    {
      v10 = v31;
      v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5058]), sel_initWithCodable_, v31);

      v12 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
      if (v11)
      {
        MEMORY[0x1D8241DC8](v12);
        if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1D2AB67B4();
        sub_1D2AB67CC();
        sub_1D2AB67A8();
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    }
    sub_1D2AB68D4();
  }
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v4);
  sub_1D2A9D738(0, &qword_1ED9789C8);
  v13 = (void *)sub_1D2AB6784();
  swift_bridgeObjectRelease();
  v35[0] = 0;
  v14 = objc_msgSend(v29, sel_removeTemplates_error_, v13, v35);

  if ((v14 & 1) != 0)
  {
    v15 = (id)v35[0];

    return 1;
  }
  v17 = (id)v35[0];
  v18 = (void *)sub_1D2AB64FC();

  swift_willThrow();
  if (qword_1ED9788D8 != -1)
    swift_once();
  v19 = sub_1D2AB6634();
  __swift_project_value_buffer(v19, (uint64_t)qword_1ED9786E8);
  v20 = v18;
  v21 = v18;
  v22 = sub_1D2AB661C();
  v23 = sub_1D2AB6868();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v35[0] = v25;
    *(_DWORD *)v24 = 136315138;
    swift_getErrorValue();
    v26 = Error.logOutput.getter();
    *(_QWORD *)&v34[0] = sub_1D2A9CC8C(v26, v27, v35);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D2A96000, v22, v23, "Error removing templates: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v25, -1, -1);
    MEMORY[0x1D8242734](v24, -1, -1);

  }
  else
  {

  }
  return 0;
}

id sub_1D2AAA9C0(uint64_t a1, unint64_t a2, void *a3)
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = (void *)sub_1D2AB6688();
  v21[0] = 0;
  v7 = objc_msgSend(a3, sel_removeTemplatesForSource_error_, v6, v21);

  if ((_DWORD)v7)
  {
    v8 = v21[0];
  }
  else
  {
    v9 = v21[0];
    v10 = (void *)sub_1D2AB64FC();

    swift_willThrow();
    if (qword_1ED9788D8 != -1)
      swift_once();
    v11 = sub_1D2AB6634();
    __swift_project_value_buffer(v11, (uint64_t)qword_1ED9786E8);
    swift_bridgeObjectRetain();
    v12 = v10;
    swift_bridgeObjectRetain();
    v13 = v10;
    v14 = sub_1D2AB661C();
    v15 = sub_1D2AB6868();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v17 = (void *)swift_slowAlloc();
      v21[0] = v17;
      *(_DWORD *)v16 = 136315394;
      swift_bridgeObjectRetain();
      sub_1D2A9CC8C(a1, a2, (uint64_t *)v21);
      sub_1D2AB68E0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2080;
      swift_getErrorValue();
      v18 = Error.logOutput.getter();
      sub_1D2A9CC8C(v18, v19, (uint64_t *)v21);
      sub_1D2AB68E0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D2A96000, v14, v15, "Error removing templates for source (%s): %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v17, -1, -1);
      MEMORY[0x1D8242734](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v7;
}

id sub_1D2AAAC88(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = (void *)sub_1D2AB6784();
  v18[0] = 0;
  v4 = objc_msgSend(a2, sel_removeTemplatesWithUniqueNames_error_, v3, v18);

  if ((_DWORD)v4)
  {
    v5 = v18[0];
  }
  else
  {
    v6 = v18[0];
    v7 = (void *)sub_1D2AB64FC();

    swift_willThrow();
    if (qword_1ED9788D8 != -1)
      swift_once();
    v8 = sub_1D2AB6634();
    __swift_project_value_buffer(v8, (uint64_t)qword_1ED9786E8);
    v9 = v7;
    v10 = v7;
    v11 = sub_1D2AB661C();
    v12 = sub_1D2AB6868();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = (void *)swift_slowAlloc();
      v18[0] = v14;
      *(_DWORD *)v13 = 136315138;
      swift_getErrorValue();
      v15 = Error.logOutput.getter();
      sub_1D2A9CC8C(v15, v16, (uint64_t *)v18);
      sub_1D2AB68E0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1D2A96000, v11, v12, "Error removing templates for unique names: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v14, -1, -1);
      MEMORY[0x1D8242734](v13, -1, -1);

    }
    else
    {

    }
  }
  return v4;
}

uint64_t sub_1D2AAAEF0(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1D2AB6AC0();
    swift_bridgeObjectRelease();
  }
  sub_1D2A9D738(0, &qword_1EFC9AFC0);
  sub_1D2AAC0E8((unint64_t *)&unk_1EFC9B040, &qword_1EFC9AFC0);
  result = sub_1D2AB682C();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1D2AB6AC0();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x1D8242098](i, a1);
        sub_1D2AA7E44(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_1D2AA7E44(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D2AAB068(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  unint64_t v32;
  _BYTE v33[32];
  _OWORD v34[2];
  uint64_t v35[3];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = sub_1D2AB6514();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(a1, sel_earnedInstancesCount))
    return 1;
  v8 = objc_msgSend(a1, sel_earnedInstances);
  if (!v8)
    return 1;
  v28 = v5;
  v29 = a2;
  v32 = MEMORY[0x1E0DEE9D8];
  v9 = v8;
  sub_1D2AB68A4();
  v30 = v9;

  sub_1D2AAC0A0();
  sub_1D2AB68D4();
  while (v36)
  {
    sub_1D2A9E240(v35, v34);
    sub_1D2A9CD5C((uint64_t)v34, (uint64_t)v33);
    sub_1D2A9D738(0, &qword_1EFC9B038);
    if (swift_dynamicCast())
    {
      v10 = v31;
      v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5050]), sel_initWithCodable_, v31);

      v12 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
      if (v11)
      {
        MEMORY[0x1D8241DC8](v12);
        if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1D2AB67B4();
        sub_1D2AB67CC();
        sub_1D2AB67A8();
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    }
    sub_1D2AB68D4();
  }
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v4);
  sub_1D2AAAEF0(v32);
  swift_bridgeObjectRelease();
  sub_1D2A9D738(0, &qword_1EFC9AFC0);
  sub_1D2AAC0E8((unint64_t *)&unk_1EFC9B040, &qword_1EFC9AFC0);
  v13 = (void *)sub_1D2AB6814();
  swift_bridgeObjectRelease();
  v35[0] = 0;
  v14 = objc_msgSend(v29, sel_addEarnedInstances_error_, v13, v35);

  if ((v14 & 1) != 0)
  {
    v15 = (id)v35[0];

    return 1;
  }
  v17 = (id)v35[0];
  v18 = (void *)sub_1D2AB64FC();

  swift_willThrow();
  if (qword_1ED9788D8 != -1)
    swift_once();
  v19 = sub_1D2AB6634();
  __swift_project_value_buffer(v19, (uint64_t)qword_1ED9786E8);
  v20 = v18;
  v21 = v18;
  v22 = sub_1D2AB661C();
  v23 = sub_1D2AB6868();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v35[0] = v25;
    *(_DWORD *)v24 = 136315138;
    swift_getErrorValue();
    v26 = Error.logOutput.getter();
    *(_QWORD *)&v34[0] = sub_1D2A9CC8C(v26, v27, v35);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D2A96000, v22, v23, "Error adding earned instances: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v25, -1, -1);
    MEMORY[0x1D8242734](v24, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_1D2AAB530(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  _BYTE v33[32];
  _OWORD v34[2];
  uint64_t v35[3];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = sub_1D2AB6514();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(a1, sel_earnedInstancesCount))
    return 1;
  v8 = objc_msgSend(a1, sel_earnedInstances);
  if (!v8)
    return 1;
  v28 = v5;
  v29 = a2;
  v32 = MEMORY[0x1E0DEE9D8];
  v9 = v8;
  sub_1D2AB68A4();
  v30 = v9;

  sub_1D2AAC0A0();
  sub_1D2AB68D4();
  while (v36)
  {
    sub_1D2A9E240(v35, v34);
    sub_1D2A9CD5C((uint64_t)v34, (uint64_t)v33);
    sub_1D2A9D738(0, &qword_1EFC9B038);
    if (swift_dynamicCast())
    {
      v10 = v31;
      v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5050]), sel_initWithCodable_, v31);

      v12 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
      if (v11)
      {
        MEMORY[0x1D8241DC8](v12);
        if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1D2AB67B4();
        sub_1D2AB67CC();
        sub_1D2AB67A8();
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    }
    sub_1D2AB68D4();
  }
  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v4);
  sub_1D2A9D738(0, &qword_1EFC9AFC0);
  v13 = (void *)sub_1D2AB6784();
  swift_bridgeObjectRelease();
  v35[0] = 0;
  v14 = objc_msgSend(v29, sel_removeEarnedInstances_error_, v13, v35);

  if ((v14 & 1) != 0)
  {
    v15 = (id)v35[0];

    return 1;
  }
  v17 = (id)v35[0];
  v18 = (void *)sub_1D2AB64FC();

  swift_willThrow();
  if (qword_1ED9788D8 != -1)
    swift_once();
  v19 = sub_1D2AB6634();
  __swift_project_value_buffer(v19, (uint64_t)qword_1ED9786E8);
  v20 = v18;
  v21 = v18;
  v22 = sub_1D2AB661C();
  v23 = sub_1D2AB6868();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v35[0] = v25;
    *(_DWORD *)v24 = 136315138;
    swift_getErrorValue();
    v26 = Error.logOutput.getter();
    *(_QWORD *)&v34[0] = sub_1D2A9CC8C(v26, v27, v35);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D2A96000, v22, v23, "Error adding earned instances: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v25, -1, -1);
    MEMORY[0x1D8242734](v24, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_1D2AAB9C0(void *a1, void *a2)
{
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  id v20;
  void *v22;
  uint64_t v23;
  id v24;
  unint64_t v25;

  if (qword_1ED9788D8 != -1)
    goto LABEL_22;
  while (1)
  {
    v4 = sub_1D2AB6634();
    __swift_project_value_buffer(v4, (uint64_t)qword_1ED9786E8);
    v5._countAndFlagsBits = 0xD00000000000006CLL;
    v5._object = (void *)0x80000001D2AB8880;
    v6._object = (void *)0x80000001D2AB88F0;
    v6._countAndFlagsBits = 0xD000000000000021;
    Logger.trace(file:function:)(v5, v6);
    v7 = objc_msgSend(a1, sel_achievementProgressUpdates);
    if (!v7)
      break;
    v8 = v7;
    v25 = 0;
    sub_1D2A9D738(0, &qword_1ED978738);
    sub_1D2AB6790();

    v9 = v25;
    if (!v25)
      break;
    v25 = MEMORY[0x1E0DEE9D8];
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      v10 = sub_1D2AB6AC0();
      if (!v10)
      {
LABEL_24:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1D2A9D738(0, (unint64_t *)&unk_1ED978A00);
        v22 = (void *)sub_1D2AB6784();
        swift_bridgeObjectRelease();
        objc_msgSend(a2, sel_processAchievementProgressUpdates_, v22);

        return 1;
      }
    }
    else
    {
      v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v10)
        goto LABEL_24;
    }
    a1 = 0;
    v11 = 4;
    while (1)
    {
      v12 = (v9 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1D8242098](v11 - 4, v9) : *(id *)(v9 + 8 * v11);
      v13 = v12;
      v14 = v11 - 3;
      if (__OFADD__(v11 - 4, 1))
        break;
      v24 = v12;
      sub_1D2AA9874(&v24, &v23);

      if (v23)
      {
        MEMORY[0x1D8241DC8]();
        if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1D2AB67B4();
        sub_1D2AB67CC();
        sub_1D2AB67A8();
      }
      ++v11;
      if (v14 == v10)
        goto LABEL_24;
    }
    __break(1u);
LABEL_22:
    swift_once();
  }
  v15 = a1;
  v16 = sub_1D2AB661C();
  v17 = sub_1D2AB6868();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v18 = 138412290;
    v25 = (unint64_t)v15;
    v20 = v15;
    sub_1D2AB68E0();
    *v19 = v15;

    _os_log_impl(&dword_1D2A96000, v16, v17, "No achievementProgressUpdates found: %@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED978B20);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v19, -1, -1);
    MEMORY[0x1D8242734](v18, -1, -1);

  }
  else
  {

  }
  return 0;
}

BOOL sub_1D2AABD7C(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v18;

  if (qword_1ED9788D8 != -1)
    swift_once();
  v6 = sub_1D2AB6634();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED9786E8);
  swift_bridgeObjectRetain_n();
  v7 = sub_1D2AB661C();
  v8 = sub_1D2AB6874();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v18 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_1D2A9CC8C(a1, a2, &v18);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D2A96000, v7, v8, "Received requestProgressUpdateForProgressProviderIdentifier -> %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v10, -1, -1);
    MEMORY[0x1D8242734](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v11 = (void *)sub_1D2AB6688();
  v12 = objc_msgSend(a3, sel_providerWithIdentifier_, v11);

  if (v12)
  {
    objc_msgSend(a3, sel_requestProgressUpdateForProgressProvider_, v12);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain_n();
    v13 = sub_1D2AB661C();
    v14 = sub_1D2AB6868();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_1D2A9CC8C(a1, a2, &v18);
      sub_1D2AB68E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D2A96000, v13, v14, "Could not find progress provider with identifier: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v16, -1, -1);
      MEMORY[0x1D8242734](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v12 != 0;
}

unint64_t sub_1D2AAC0A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED978568;
  if (!qword_1ED978568)
  {
    v1 = sub_1D2AB6514();
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0CAFB80], v1);
    atomic_store(result, (unint64_t *)&qword_1ED978568);
  }
  return result;
}

uint64_t sub_1D2AAC0E8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1D2A9D738(255, a2);
    result = MEMORY[0x1D82426B0](MEMORY[0x1E0DEFCF8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D2AAC128(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1D2AAC134()
{
  id *v0;

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1D2AAC188(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1D2A98C94;
  v4[15] = a1;
  v4[16] = v1 + 32;
  return swift_task_switch();
}

uint64_t sub_1D2AAC1EC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BridgeSettings()
{
  return objc_opt_self();
}

uint64_t sub_1D2AAC21C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  char v15;
  __int128 v16;
  __int128 v17;

  v8 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v9 = (void *)sub_1D2AB6688();
  v10 = objc_msgSend(v8, sel_persistentDomainForName_, v9);

  if (!v10)
    return a5 & 1;
  v11 = sub_1D2AB6664();

  if (!*(_QWORD *)(v11 + 16))
  {
    v16 = 0u;
    v17 = 0u;
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v12 = sub_1D2A9B108(a1, a2);
  if ((v13 & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_1D2A9CD5C(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v17 + 1))
  {
LABEL_10:
    sub_1D2AA6430((uint64_t)&v16);
    return a5 & 1;
  }
  if (swift_dynamicCast())
    a5 = v15;
  return a5 & 1;
}

id sub_1D2AAC3BC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAwardsQueryListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ActivityAwardsQueryListener()
{
  return objc_opt_self();
}

uint64_t sub_1D2AAC444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[9] = a5;
  v6[10] = a6;
  v6[7] = a1;
  v6[8] = a4;
  return swift_task_switch();
}

uint64_t sub_1D2AAC460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 64) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1D82427AC](v1);
  v3 = (void *)v2;
  if (v2)
  {
    v5 = *(_QWORD *)(v0 + 72);
    v4 = *(_QWORD *)(v0 + 80);
    v6 = *(void **)(v2 + OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_endpoint);
    *(_QWORD *)(v0 + 88) = v6;
    v7 = v6;

    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v8;
    v8[2] = v7;
    v8[3] = 3;
    v8[4] = v5;
    v8[5] = v4;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v9;
    *v9 = v0;
    v9[1] = sub_1D2AAC58C;
    return sub_1D2AB6B20();
  }
  else
  {
    *(_OWORD *)*(_QWORD *)(v0 + 56) = xmmword_1D2AB7A80;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1D2AAC58C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1D2AAC5F8()
{
  uint64_t v0;

  *(_OWORD *)*(_QWORD *)(v0 + 56) = *(_OWORD *)(v0 + 40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AAC638()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 88);
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AAC670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D2AACC54(a1, (uint64_t)v7);
  v8 = sub_1D2AB6808();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1D2A9B4EC((uint64_t)v7);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_1D2AB67D8();
      v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_1D2AB67FC();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v10 = 0;
  v12 = 0;
LABEL_6:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978AD0);
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

uint64_t sub_1D2AAC7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[9] = a5;
  v6[10] = a6;
  v6[7] = a1;
  v6[8] = a4;
  return swift_task_switch();
}

uint64_t sub_1D2AAC818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 64) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1D82427AC](v1);
  v3 = (void *)v2;
  if (v2)
  {
    v5 = *(_QWORD *)(v0 + 72);
    v4 = *(_QWORD *)(v0 + 80);
    v6 = *(void **)(v2 + OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_endpoint);
    *(_QWORD *)(v0 + 88) = v6;
    v7 = v6;

    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v8;
    v8[2] = v7;
    v8[3] = 5;
    v8[4] = v5;
    v8[5] = v4;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v9;
    *v9 = v0;
    v9[1] = sub_1D2AAC944;
    return sub_1D2AB6B20();
  }
  else
  {
    *(_OWORD *)*(_QWORD *)(v0 + 56) = xmmword_1D2AB7A80;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1D2AAC944()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1D2AAC9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[9] = a5;
  v6[10] = a6;
  v6[7] = a1;
  v6[8] = a4;
  return swift_task_switch();
}

uint64_t sub_1D2AAC9CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 64) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1D82427AC](v1);
  v3 = (void *)v2;
  if (v2)
  {
    v5 = *(_QWORD *)(v0 + 72);
    v4 = *(_QWORD *)(v0 + 80);
    v6 = *(void **)(v2 + OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_endpoint);
    *(_QWORD *)(v0 + 88) = v6;
    v7 = v6;

    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v8;
    v8[2] = v7;
    v8[3] = 4;
    v8[4] = v5;
    v8[5] = v4;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v9;
    *v9 = v0;
    v9[1] = sub_1D2AAC944;
    return sub_1D2AB6B20();
  }
  else
  {
    *(_OWORD *)*(_QWORD *)(v0 + 56) = xmmword_1D2AB7A80;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

void *sub_1D2AACB18(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_1D2AB6AF0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_1D2AACBAC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D2AACBD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;

  v7 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_1D2AA64D4;
  *(_QWORD *)(v5 + 80) = v4;
  *(_OWORD *)(v5 + 64) = v7;
  *(_QWORD *)(v5 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_1D2AACC54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D2AACCA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;

  v7 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_1D2AA64D4;
  *(_QWORD *)(v5 + 80) = v4;
  *(_OWORD *)(v5 + 64) = v7;
  *(_QWORD *)(v5 + 56) = a1;
  return swift_task_switch();
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_1D2A9E28C(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_1D2AACD58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;

  v7 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_1D2A98C94;
  *(_QWORD *)(v5 + 80) = v4;
  *(_OWORD *)(v5 + 64) = v7;
  *(_QWORD *)(v5 + 56) = a1;
  return swift_task_switch();
}

uint64_t ACHCodableAchievementProgressUpdateArray.serialized()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D2AB6550();

  return v3;
}

BOOL static ProxyError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ProxyError.hash(into:)()
{
  return sub_1D2AB6B80();
}

uint64_t ProxyError.hashValue.getter()
{
  sub_1D2AB6B74();
  sub_1D2AB6B80();
  return sub_1D2AB6B8C();
}

unint64_t sub_1D2AACED4()
{
  unint64_t result;

  result = qword_1EFC9B0C0;
  if (!qword_1EFC9B0C0)
  {
    result = MEMORY[0x1D82426B0](&protocol conformance descriptor for ProxyError, &type metadata for ProxyError);
    atomic_store(result, &qword_1EFC9B0C0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ProxyError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1D2AACF74 + 4 * byte_1D2AB7B35[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D2AACFA8 + 4 * byte_1D2AB7B30[v4]))();
}

uint64_t sub_1D2AACFA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D2AACFB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D2AACFB8);
  return result;
}

uint64_t sub_1D2AACFC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D2AACFCCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D2AACFD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D2AACFD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProxyError()
{
  return &type metadata for ProxyError;
}

uint64_t ACHCodableAchievement.serialized()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D2AB6550();

  return v3;
}

uint64_t SerializableAchievementCollection.__allocating_init(achievements:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t SerializableAchievementCollection.init(achievements:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t SerializableAchievementCollection.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t method lookup function for SerializableAchievementCollection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SerializableAchievementCollection.__allocating_init(achievements:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1D2AAD0CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_1D2AAD0D4()
{
  id *v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NotificationPostingProvider()
{
  return objc_opt_self();
}

void sub_1D2AAD128(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  id v22[2];

  v3 = v2;
  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    sub_1D2AAD940(a1);
  }
  else
  {
    v4 = *(void **)(v2 + 16);
    v22[0] = 0;
    v5 = objc_msgSend(v4, sel_wheelchairUseWithError_, v22);
    if (v5)
    {
      v6 = v5;
      v7 = v22[0];
      v8 = objc_msgSend(v6, sel_wheelchairUse);

      sub_1D2AA21BC((unint64_t)v8, (int)objc_msgSend(*(id *)(v2 + 32), sel_isPregnant));
      v10 = v9;
      objc_msgSend(*(id *)(v3 + 24), sel_addNotificationRequest_withCompletionHandler_, v9, 0);

    }
    else
    {
      v11 = v22[0];
      v12 = (void *)sub_1D2AB64FC();

      swift_willThrow();
      if (qword_1ED9788D8 != -1)
        swift_once();
      v13 = sub_1D2AB6634();
      __swift_project_value_buffer(v13, (uint64_t)qword_1ED9786E8);
      v14 = v12;
      v15 = v12;
      v16 = sub_1D2AB661C();
      v17 = sub_1D2AB6868();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        v19 = (void *)swift_slowAlloc();
        v22[0] = v19;
        *(_DWORD *)v18 = 136315138;
        swift_getErrorValue();
        v20 = ((uint64_t (*)())Error.logOutput.getter)();
        sub_1D2A9CC8C(v20, v21, (uint64_t *)v22);
        sub_1D2AB68E0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1D2A96000, v16, v17, "Failed to get wheelchair use for achievement notification %s", v18, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D8242734](v19, -1, -1);
        MEMORY[0x1D8242734](v18, -1, -1);

      }
      else
      {

      }
    }
  }
}

uint64_t sub_1D2AAD408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 152) = a4;
  return swift_task_switch();
}

uint64_t sub_1D2AAD420()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_1ED9788D8 != -1)
    swift_once();
  v1 = sub_1D2AB6634();
  v0[20] = __swift_project_value_buffer(v1, (uint64_t)qword_1ED9786E8);
  v2 = sub_1D2AB661C();
  v3 = sub_1D2AB6874();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2A96000, v2, v3, "Posting notification for standalone fitness mode", v4, 2u);
    MEMORY[0x1D8242734](v4, -1, -1);
  }
  v5 = v0[19];

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D220C8]), sel_init);
  v0[21] = v6;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D220D0]), sel_initWithAchievement_, v5);
  v0[22] = v7;
  v0[2] = v0;
  v0[3] = sub_1D2AAD5AC;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v9 = v0 + 10;
  v9[1] = 0x40000000;
  v9[2] = sub_1D2AAD81C;
  v9[3] = &block_descriptor_1;
  v9[4] = v8;
  objc_msgSend(v6, sel_postAchievementNotification_completion_, v7, v9);
  return swift_continuation_await();
}

uint64_t sub_1D2AAD5AC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 184) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1D2AAD60C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 168);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AAD640()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;

  v1 = *(void **)(v0 + 184);
  swift_willThrow();
  v2 = v1;
  v3 = v1;
  v4 = sub_1D2AB661C();
  v5 = sub_1D2AB6868();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 184);
    v14 = *(void **)(v0 + 176);
    v15 = *(void **)(v0 + 168);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v16 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = Error.logOutput.getter();
    *(_QWORD *)(v0 + 80) = sub_1D2A9CC8C(v9, v10, &v16);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D2A96000, v4, v5, "Failed to post achievement notification %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v8, -1, -1);
    MEMORY[0x1D8242734](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 184);
    v12 = *(void **)(v0 + 168);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AAD81C(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED978A30);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_1D2AAD890(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1D2AAD8F4;
  return v6(a1);
}

uint64_t sub_1D2AAD8F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1D2AAD940(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D2AB6808();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  v9 = a1;
  if (v8 == 1)
  {
    sub_1D2A9B4EC((uint64_t)v4);
    v10 = 0;
    v11 = 0;
  }
  else
  {
    sub_1D2AB67FC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_1D2AB67D8();
      v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &unk_1EFC9B0D0;
  *(_QWORD *)(v13 + 24) = v7;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_1D2AADB08()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1D2AADB34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1D2A98C94;
  v3[19] = v2;
  return swift_task_switch();
}

uint64_t sub_1D2AADB94()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AADBB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D2A98C94;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFC9B0D8 + dword_1EFC9B0D8))(a1, v4);
}

void static Sandbox.bootstrap(_:)()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  size_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *oslog;
  uint64_t v21;
  unint64_t v22;

  v0 = sub_1D2AB67C0();
  *(_QWORD *)(v0 + 16) = 1024;
  bzero((void *)(v0 + 32), 0x400uLL);
  sub_1D2AB66A0();
  swift_bridgeObjectRetain();
  v1 = _set_user_dir_suffix();
  v2 = swift_release();
  if (!v1)
  {
    v7 = MEMORY[0x1D8241C90](v2);
    if (strerror(v7))
      goto LABEL_18;
    __break(1u);
    goto LABEL_14;
  }
  v3 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v0 = (uint64_t)sub_1D2AAE4BC(0, *(_QWORD *)(v0 + 16), 0, (char *)v0);
  if (!confstr(65537, (char *)(v0 + 32), v3))
  {
LABEL_14:
    v8 = MEMORY[0x1D8241C90]();
    if (strerror(v8))
    {
      sub_1D2AB66E8();
      v21 = 0;
      v22 = 0xE000000000000000;
      sub_1D2AB6A30();
      sub_1D2AB66DC();
      sub_1D2AB66DC();
      v14 = sub_1D2AB66DC();
      MEMORY[0x1D8241C90](v14);
      sub_1D2AB6AFC();
      sub_1D2AB66DC();
      swift_bridgeObjectRelease();
      sub_1D2AB66DC();
      sub_1D2AB66DC();
      if (qword_1ED9788D8 != -1)
        swift_once();
      v15 = sub_1D2AB6634();
      __swift_project_value_buffer(v15, (uint64_t)qword_1ED9786E8);
      swift_bridgeObjectRetain_n();
      v12 = sub_1D2AB661C();
      v13 = sub_1D2AB6868();
      if (os_log_type_enabled(v12, v13))
        goto LABEL_31;
      goto LABEL_32;
    }
    __break(1u);
    goto LABEL_16;
  }
  if (!mkdir((const char *)(v0 + 32), 0x2BCu) && MEMORY[0x1D8241C90]() != 17)
  {
LABEL_16:
    v9 = MEMORY[0x1D8241C90]();
    if (strerror(v9))
    {
      sub_1D2AB66E8();
      v21 = 0;
      v22 = 0xE000000000000000;
      sub_1D2AB6A30();
      sub_1D2AB66DC();
      sub_1D2AB66DC();
      v16 = sub_1D2AB66DC();
      MEMORY[0x1D8241C90](v16);
      sub_1D2AB6AFC();
      sub_1D2AB66DC();
      swift_bridgeObjectRelease();
      sub_1D2AB66DC();
      sub_1D2AB66DC();
      if (qword_1ED9788D8 != -1)
        swift_once();
      v17 = sub_1D2AB6634();
      __swift_project_value_buffer(v17, (uint64_t)qword_1ED9786E8);
      swift_bridgeObjectRetain_n();
      v12 = sub_1D2AB661C();
      v13 = sub_1D2AB6868();
      if (os_log_type_enabled(v12, v13))
        goto LABEL_31;
      goto LABEL_32;
    }
    __break(1u);
LABEL_18:
    sub_1D2AB66E8();
    v21 = 0;
    v22 = 0xE000000000000000;
    sub_1D2AB6A30();
    sub_1D2AB66DC();
    sub_1D2AB66DC();
    v10 = sub_1D2AB66DC();
    MEMORY[0x1D8241C90](v10);
    sub_1D2AB6AFC();
    sub_1D2AB66DC();
    swift_bridgeObjectRelease();
    sub_1D2AB66DC();
    sub_1D2AB66DC();
    if (qword_1ED9788D8 != -1)
      swift_once();
    v11 = sub_1D2AB6634();
    __swift_project_value_buffer(v11, (uint64_t)qword_1ED9786E8);
    swift_bridgeObjectRetain_n();
    v12 = sub_1D2AB661C();
    v13 = sub_1D2AB6868();
    if (os_log_type_enabled(v12, v13))
    {
LABEL_31:
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v18 = 136446210;
      swift_bridgeObjectRetain();
      sub_1D2A9CC8C(0, 0xE000000000000000, &v21);
      sub_1D2AB68E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1D2A96000, v12, v13, "Sandbox bootstrap error: %{public}s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D8242734](v19, -1, -1);
      MEMORY[0x1D8242734](v18, -1, -1);

LABEL_33:
      sub_1D2AB6AB4();
      __break(1u);
      return;
    }
LABEL_32:

    swift_bridgeObjectRelease_n();
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  if (qword_1ED9788D8 != -1)
    swift_once();
  v4 = sub_1D2AB6634();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED9786E8);
  oslog = sub_1D2AB661C();
  v5 = sub_1D2AB6874();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2A96000, oslog, v5, "Sandbox bootstrapped successfully", v6, 2u);
    MEMORY[0x1D8242734](v6, -1, -1);
  }

}

char *sub_1D2AAE4BC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9B0E8);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x1E0DEE9D8];
      v12 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1D2AAE5C4(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for Sandbox()
{
  return &type metadata for Sandbox;
}

char *sub_1D2AAE5C4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_1D2AB6AF0();
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for TransportError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TransportError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1D2AAE784 + 4 * byte_1D2AB7DA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1D2AAE7B8 + 4 * asc_1D2AB7DA0[v4]))();
}

uint64_t sub_1D2AAE7B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D2AAE7C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D2AAE7C8);
  return result;
}

uint64_t sub_1D2AAE7D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D2AAE7DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1D2AAE7E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D2AAE7E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1D2AAE7F4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TransportError()
{
  return &type metadata for TransportError;
}

unint64_t sub_1D2AAE814()
{
  unint64_t result;

  result = qword_1EFC9B0F0;
  if (!qword_1EFC9B0F0)
  {
    result = MEMORY[0x1D82426B0](&unk_1D2AB7E18, &type metadata for TransportError);
    atomic_store(result, (unint64_t *)&qword_1EFC9B0F0);
  }
  return result;
}

BOOL sub_1D2AAE858(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1D2AAE870(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D2AA64D4;
  return v7(a1, a2);
}

uint64_t sub_1D2AAE8DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1D2AB6808();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D2AB67FC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1D2A9B4EC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D2AB67D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC9B128);
  return swift_task_create();
}

uint64_t sub_1D2AAEA28()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 116) & 1) == 0)
    notify_cancel(*(_DWORD *)(v0 + 112));
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for LanguageChangeObserver()
{
  return objc_opt_self();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for LanguageChangeObserver.State(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LanguageChangeObserver.State(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_1D2AAEAD4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1D2AAEAF0(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LanguageChangeObserver.State()
{
  return &type metadata for LanguageChangeObserver.State;
}

uint64_t sub_1D2AAEB20()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1D2AAEB2C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  return swift_task_switch();
}

uint64_t sub_1D2AAEB90()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  void *v3;
  uint32_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  int v9;

  v1 = *(_QWORD *)(v0 + 64);
  if (*(_BYTE *)(v1 + 116) == 1)
  {
    *(_DWORD *)(v0 + 72) = -1;
    sub_1D2AAED70();
    v2 = sub_1D2AB688C();
    *(_QWORD *)(v0 + 16) = MEMORY[0x1E0C809B0];
    *(_QWORD *)(v0 + 48) = sub_1D2AAEE88;
    *(_QWORD *)(v0 + 56) = v1;
    *(_QWORD *)(v0 + 24) = 1107296256;
    *(_QWORD *)(v0 + 32) = sub_1D2AAF03C;
    *(_QWORD *)(v0 + 40) = &block_descriptor_2;
    v3 = _Block_copy((const void *)(v0 + 16));
    swift_retain();
    swift_release();
    v4 = notify_register_dispatch("com.apple.language.changed", (int *)(v0 + 72), v2, v3);
    _Block_release(v3);

    if (v4 || (v9 = *(_DWORD *)(v0 + 72), v9 == -1))
    {
      if (qword_1ED9788D8 != -1)
        swift_once();
      v5 = sub_1D2AB6634();
      __swift_project_value_buffer(v5, (uint64_t)qword_1ED9786E8);
      v6 = sub_1D2AB661C();
      v7 = sub_1D2AB6868();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D2A96000, v6, v7, "Failed to register for language changes", v8, 2u);
        MEMORY[0x1D8242734](v8, -1, -1);
      }

    }
    else
    {
      *(_DWORD *)(v1 + 112) = v9;
      *(_BYTE *)(v1 + 116) = 0;
    }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1D2AAED70()
{
  unint64_t result;

  result = qword_1ED9789E8;
  if (!qword_1ED9789E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED9789E8);
  }
  return result;
}

uint64_t sub_1D2AAEDAC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978710);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1D2AB6808();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = swift_allocObject();
  swift_weakInit();
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v4;
  sub_1D2AAE8DC((uint64_t)v2, (uint64_t)&unk_1EFC9B110, (uint64_t)v5);
  return swift_release();
}

uint64_t sub_1D2AAEE88()
{
  return sub_1D2AAEDAC();
}

uint64_t sub_1D2AAEE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 48) = a4;
  return swift_task_switch();
}

uint64_t sub_1D2AAEEA8()
{
  uint64_t v0;
  uint64_t Strong;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
    return swift_task_switch();
  **(_BYTE **)(v0 + 40) = 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AAEF28()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_1ED9788D8 != -1)
    swift_once();
  v0 = sub_1D2AB6634();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED9786E8);
  v1 = sub_1D2AB661C();
  v2 = sub_1D2AB6874();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D2A96000, v1, v2, "### Language change - exiting clean ###", v3, 2u);
    MEMORY[0x1D8242734](v3, -1, -1);
  }

  xpc_transaction_exit_clean();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1D2AAF020()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AAF03C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1D2AAF078()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D2AAF09C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AAF0C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D2A98C94;
  v5[5] = a1;
  v5[6] = v4;
  return swift_task_switch();
}

uint64_t sub_1D2AAF12C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_1D2AAF194;
  return v5(v2 + 32);
}

uint64_t sub_1D2AAF194()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_1D2AAF1E4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AAF208(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D2A98C94;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFC9B118 + dword_1EFC9B118))(a1, v4);
}

uint64_t ACHCodableAchievementProgressUpdate.serialized()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D2AB6550();

  return v3;
}

uint64_t ACHCodableTemplateArray.serialized()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D2AB6550();

  return v3;
}

char *XPCEndpoint.__allocating_init(endpointName:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return XPCEndpoint.init(endpointName:)(a1, a2);
}

uint64_t XPCEndpoint.transportDispatchService.getter()
{
  return swift_retain();
}

char *XPCEndpoint.init(endpointName:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  char *v6;
  _DWORD *v7;
  id v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  char *v15;
  id v16;
  objc_super v18;

  *(_QWORD *)&v2[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_connection] = 0;
  type metadata accessor for UnfairLock();
  v5 = swift_allocObject();
  v6 = v2;
  v7 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_lock] = v5;
  v8 = objc_msgSend((id)objc_opt_self(), sel_anonymousListener);
  *(_QWORD *)&v6[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_listener] = v8;
  v9 = &v6[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_name];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;
  *(_QWORD *)&v6[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_requiredEntitlements] = &unk_1E941E858;
  type metadata accessor for TransportDispatchService();
  v10 = swift_allocObject();
  v11 = sub_1D2AA5720(MEMORY[0x1E0DEE9D8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978B30);
  v12 = swift_allocObject();
  *(_DWORD *)(v12 + 24) = 0;
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v10 + 16) = v12;
  *(_QWORD *)&v6[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_transportDispatchService] = v10;

  v18.receiver = v6;
  v18.super_class = (Class)type metadata accessor for XPCEndpoint();
  v13 = (char *)objc_msgSendSuper2(&v18, sel_init);
  v14 = *(void **)&v13[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_listener];
  v15 = v13;
  objc_msgSend(v14, sel_setDelegate_, v15);
  v16 = v14;
  objc_msgSend(v16, sel_resume);

  return v15;
}

uint64_t sub_1D2AAF52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return swift_task_switch();
}

uint64_t sub_1D2AAF548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v6 = *(_OWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v6;
  *(_QWORD *)(v3 + 40) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_1D2AAF60C;
  return sub_1D2AB6B20();
}

uint64_t sub_1D2AAF60C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1D2AAF678()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1D2AAF688(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v18;

  if (qword_1ED978B60 != -1)
    swift_once();
  v4 = sub_1D2AB6634();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED978D88);
  v5 = a1;
  v6 = a1;
  v7 = a2;
  v8 = sub_1D2AB661C();
  v9 = sub_1D2AB6868();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v18 = v11;
    *(_DWORD *)v10 = 136315394;
    v12 = *(_QWORD *)&v7[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_name];
    v13 = *(_QWORD *)&v7[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_name + 8];
    swift_bridgeObjectRetain();
    sub_1D2A9CC8C(v12, v13, &v18);
    sub_1D2AB68E0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    swift_getErrorValue();
    v14 = Error.logOutput.getter();
    sub_1D2A9CC8C(v14, v15, &v18);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1D2A96000, v8, v9, "Error encountered on remote proxy for endpoint %s: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v11, -1, -1);
    MEMORY[0x1D8242734](v10, -1, -1);
  }
  else
  {

  }
  v18 = (uint64_t)a1;
  v16 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
  return sub_1D2AB67E4();
}

void sub_1D2AAF8DC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id XPCEndpoint.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void XPCEndpoint.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id XPCEndpoint.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCEndpoint();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Bool __swiftcall XPCEndpoint.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return sub_1D2A9C65C(shouldAcceptNewConnection.super.isa);
}

uint64_t XPCEndpoint.transportRequest(_:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1D2AAFA74()
{
  uint64_t v0;

  sub_1D2A9B64C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void XPCEndpoint.transportEvent(_:data:)()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;

  if (qword_1ED9788D8 != -1)
    swift_once();
  v0 = sub_1D2AB6634();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED9786E8);
  v1._countAndFlagsBits = 0xD000000000000061;
  v1._object = (void *)0x80000001D2AB8D90;
  v2._object = (void *)0x80000001D2AB8E00;
  v2._countAndFlagsBits = 0xD000000000000017;
  Logger.trace(file:function:)(v1, v2);
}

uint64_t sub_1D2AAFC5C()
{
  return swift_retain();
}

uint64_t sub_1D2AAFC70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1D2AA64D4;
  return v6();
}

uint64_t sub_1D2AAFCC4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1D2AA64D4;
  return v7();
}

uint64_t sub_1D2AAFD18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1D2AB6808();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1D2AB67FC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1D2A9950C(a1, &qword_1ED978710);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1D2AB67D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t type metadata accessor for XPCEndpoint()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCEndpoint()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCEndpoint.__allocating_init(endpointName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of XPCEndpoint.send(request:payload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v8 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v3) + 0xA0);
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1D2AAFF24;
  return v11(a1, a2, a3);
}

uint64_t sub_1D2AAFF24(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_1D2AAFF84()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_1D2AAFFC0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AAFFE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1D2A98C94;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFC9B1C0 + dword_1EFC9B1C0))(a1, v4);
}

uint64_t sub_1D2AB0054()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1D2AB0078()
{
  uint64_t v0;

  sub_1D2A9964C(*(void **)(v0 + 16), "XPC connection for endpoint %{public}s interrupted.");
}

uint64_t sub_1D2AB0098()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1D2AB00FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1D2AB0174(void *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978708);
  return sub_1D2AAF688(a1, *(void **)(v1 + 16));
}

double sub_1D2AB01D4@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void (*a3)(uint64_t *__return_ptr, _QWORD *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  double result;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  sub_1D2A9B810(a1, a2);
  v9 = sub_1D2AA3D50(a1, a2);
  if (!v4)
  {
    v14[0] = v9;
    v14[1] = v10;
    a3(&v13, v14);
    v12 = v13;
    if (v13)
    {
      *(_QWORD *)(a4 + 24) = type metadata accessor for SerializableAchievementCollection();
      *(_QWORD *)(a4 + 32) = &protocol witness table for SerializableAchievementCollection;
      swift_bridgeObjectRelease();
      *(_QWORD *)a4 = v12;
    }
    else
    {
      swift_bridgeObjectRelease();
      result = 0.0;
      *(_OWORD *)(a4 + 24) = 0u;
      *(_OWORD *)(a4 + 8) = 0u;
      *(_QWORD *)a4 = 0;
    }
  }
  return result;
}

uint64_t sub_1D2AB0294@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void (*a3)(char *__return_ptr, uint64_t *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  char v10;
  char v11;
  uint64_t v12;

  sub_1D2A9B810(a1, a2);
  result = sub_1D2AA3E3C(a1, a2);
  if (!v4)
  {
    v12 = result;
    a3(&v11, &v12);
    v10 = v11;
    if (v11 == 2)
    {
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
    }
    else
    {
      *(_QWORD *)(a4 + 24) = MEMORY[0x1E0DEAFA0];
      *(_QWORD *)(a4 + 32) = &protocol witness table for Bool;
      result = swift_bridgeObjectRelease();
      *(_BYTE *)a4 = v10 & 1;
    }
  }
  return result;
}

uint64_t sub_1D2AB0358@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void (*a3)(char *__return_ptr, _QWORD *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v10;
  char v11;
  char v12;
  _QWORD v13[2];

  sub_1D2A9B810(a1, a2);
  result = sub_1D2AA3D50(a1, a2);
  if (!v4)
  {
    v13[0] = result;
    v13[1] = v10;
    a3(&v12, v13);
    v11 = v12;
    if (v12 == 2)
    {
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
    }
    else
    {
      *(_QWORD *)(a4 + 24) = MEMORY[0x1E0DEAFA0];
      *(_QWORD *)(a4 + 32) = &protocol witness table for Bool;
      result = swift_bridgeObjectRelease();
      *(_BYTE *)a4 = v11 & 1;
    }
  }
  return result;
}

void sub_1D2AB041C(uint64_t a1@<X0>, unint64_t a2@<X1>, void (*a3)(char *__return_ptr, uint64_t *)@<X2>, Class *a4@<X4>, uint64_t (*a5)(uint64_t, unint64_t)@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  void *v13;
  char v14;
  char v15;
  uint64_t v16;

  objc_allocWithZone(*a4);
  sub_1D2A9B810(a1, a2);
  v12 = a5(a1, a2);
  if (!v6)
  {
    v13 = (void *)v12;
    v16 = v12;
    a3(&v15, &v16);
    v14 = v15;
    if (v15 == 2)
    {

      *(_QWORD *)(a6 + 32) = 0;
      *(_OWORD *)a6 = 0u;
      *(_OWORD *)(a6 + 16) = 0u;
    }
    else
    {
      *(_QWORD *)(a6 + 24) = MEMORY[0x1E0DEAFA0];
      *(_QWORD *)(a6 + 32) = &protocol witness table for Bool;

      *(_BYTE *)a6 = v14 & 1;
    }
  }
}

double sub_1D2AB0500@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void (*a3)(uint64_t *__return_ptr, _QWORD *)@<X2>, unint64_t *a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  double result;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;

  sub_1D2A9B810(a1, a2);
  v13 = sub_1D2AA3D50(a1, a2);
  if (!v6)
  {
    v17[0] = v13;
    v17[1] = v14;
    a3(&v18, v17);
    v16 = v18;
    if (v18)
    {
      *(_QWORD *)(a6 + 24) = sub_1D2A9D738(0, a4);
      *(_QWORD *)(a6 + 32) = a5;
      swift_bridgeObjectRelease();
      *(_QWORD *)a6 = v16;
    }
    else
    {
      swift_bridgeObjectRelease();
      result = 0.0;
      *(_OWORD *)(a6 + 24) = 0u;
      *(_OWORD *)(a6 + 8) = 0u;
      *(_QWORD *)a6 = 0;
    }
  }
  return result;
}

_QWORD *sub_1D2AB05DC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *(*a3)(char *__return_ptr, _QWORD **)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  _QWORD *result;
  char v10;
  char v11;
  _QWORD *v12;

  sub_1D2A9B810(a1, a2);
  result = (_QWORD *)sub_1D2AA3F2C(a1, a2);
  if (!v4)
  {
    v12 = result;
    result = a3(&v11, &v12);
    v10 = v11;
    if (v11 == 2)
    {
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
    }
    else
    {
      *(_QWORD *)(a4 + 24) = MEMORY[0x1E0DEAFA0];
      *(_QWORD *)(a4 + 32) = &protocol witness table for Bool;
      *(_BYTE *)a4 = v10 & 1;
    }
  }
  return result;
}

uint64_t Daemon.bundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void Daemon.init()(uint64_t a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unsigned __int8 v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  unsigned __int8 v91;
  id v92;
  id v93;
  id v94;
  uint64_t *v95;
  void *v96;
  void *v97;
  id v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  char v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  uint64_t *v116;
  id v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  uint64_t v124;
  id v125;
  id v126;
  id v127;
  uint64_t *v128;
  id v129;
  void *v130;
  id v131;
  id v132;
  void *v133;
  id v134;
  uint64_t *v135;
  id v136;
  void *v137;
  id v138;
  id v139;
  id v140;
  __int128 v141;
  char *v142;
  id v143;
  id v144;
  id v145;
  char *v146;
  uint64_t v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  uint64_t *v154;
  id v155;
  id v156;
  id v157;
  id v158;
  uint64_t *v159;
  id v160;
  unsigned int v161;
  id v162;
  void *v163;
  id v164;
  id v165;
  id v166;
  int v167;
  _BYTE v168[24];
  uint64_t v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;

  *(_QWORD *)a1 = 0xD000000000000019;
  *(_QWORD *)(a1 + 8) = 0x80000001D2AB8140;
  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCEndpointProvider()), sel_init);
  *(_QWORD *)(a1 + 112) = v2;
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_sharedBehavior);
  if (!v5)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v6 = v5;
  v157 = v4;
  v7 = objc_msgSend(v5, sel_isAppleWatch);

  v161 = v7;
  if (v7)
    v8 = 1;
  else
    v8 = 2;
  v167 = v8;
  type metadata accessor for BridgeSettings();
  v9 = (void *)swift_allocObject();
  *(_QWORD *)(a1 + 72) = v9;
  v10 = qword_1ED9789B0;
  v162 = v9;
  swift_retain();
  if (v10 != -1)
    swift_once();
  swift_beginAccess();
  v11 = objc_allocWithZone(MEMORY[0x1E0CEC7A0]);
  v12 = (void *)sub_1D2AB6688();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithBundleIdentifier_, v12);

  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D22160]), sel_init);
  v15 = type metadata accessor for FitnessCoachingNotificationSuppressionProvider();
  swift_allocObject();
  v156 = v14;
  *(_QWORD *)(a1 + 232) = sub_1D2AB4C18(v156);
  v159 = (uint64_t *)(a1 + 232);
  *(_QWORD *)(a1 + 256) = v15;
  *(_QWORD *)(a1 + 264) = &off_1E9420078;
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6780]), sel_init);
  *(_QWORD *)(a1 + 16) = v16;
  v17 = objc_allocWithZone(MEMORY[0x1E0D21770]);
  v18 = v16;
  v19 = objc_msgSend(v17, sel_init);
  *(_QWORD *)(a1 + 120) = v19;
  v20 = objc_allocWithZone(MEMORY[0x1E0D21780]);
  v160 = v19;
  v21 = objc_msgSend(v20, sel_initWithHealthStore_, v18);
  *(_QWORD *)(a1 + 424) = v21;
  v22 = type metadata accessor for NotificationPostingProvider();
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = v18;
  v23[3] = v13;
  v23[4] = v21;
  *(_QWORD *)(a1 + 192) = v23;
  *(_QWORD *)(a1 + 216) = v22;
  *(_QWORD *)(a1 + 224) = &off_1E941F198;
  v24 = type metadata accessor for LanguageChangeObserver();
  v25 = swift_allocObject();
  v26 = v18;
  v27 = v21;
  v155 = v13;
  swift_defaultActor_initialize();
  *(_DWORD *)(v25 + 112) = 0;
  *(_BYTE *)(v25 + 116) = 1;
  *(_QWORD *)(a1 + 152) = v24;
  *(_QWORD *)(a1 + 160) = &off_1E941F3B8;
  *(_QWORD *)(a1 + 128) = v25;
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D21778]), sel_initWithHealthStore_, v26);
  *(_QWORD *)(a1 + 280) = v28;
  v29 = objc_allocWithZone(MEMORY[0x1E0CF5098]);
  v158 = v28;
  *(_QWORD *)(a1 + 304) = objc_msgSend(v29, sel_init);
  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF4FF8]), sel_initWithHealthStore_, v26);
  *(_QWORD *)(a1 + 64) = v30;
  v31 = objc_allocWithZone(MEMORY[0x1E0CF5048]);
  v32 = v30;
  v165 = v26;
  v33 = objc_msgSend(v31, sel_initWithHealthStore_, v26);
  *(_QWORD *)(a1 + 40) = v33;
  v34 = objc_allocWithZone(MEMORY[0x1E0CF5140]);
  v35 = v33;
  v36 = v167;
  v37 = v167;
  v38 = objc_msgSend(v34, sel_initWithClient_assertionClient_device_, v32, v35, v167);
  *(_QWORD *)(a1 + 408) = v38;
  v39 = objc_allocWithZone(MEMORY[0x1E0CF50C8]);
  v40 = v38;
  v41 = objc_msgSend(v39, sel_initWithTemplateStore_, v40);
  if (!v41)
    goto LABEL_29;
  *(_QWORD *)(a1 + 96) = v41;
  v166 = v35;
  v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF50D0]), sel_initWithClient_assertionClient_earnedInstanceDuplicateUtility_device_, v32, v35, v41, v37);
  if (!v42)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v43 = v42;
  *(_QWORD *)(a1 + 104) = v42;
  v44 = objc_allocWithZone(MEMORY[0x1E0CF5118]);
  v45 = v43;
  v46 = objc_msgSend(v44, sel_initWithHealthStore_creatorDevice_, v165, v36);
  if (!v46)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v47 = v46;
  *(_QWORD *)(a1 + 328) = v46;
  v48 = objc_allocWithZone(MEMORY[0x1E0CF5130]);
  v153 = v47;
  v49 = objc_msgSend(v48, sel_initWithRemoteTemplateAvailabilityKeyProvider_);
  if (!v49)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v50 = v49;
  *(_QWORD *)(a1 + 392) = v49;
  v51 = objc_allocWithZone(MEMORY[0x1E0CF5078]);
  v52 = v50;
  v53 = objc_msgSend(v51, sel_init);
  *(_QWORD *)(a1 + 296) = v53;
  v54 = objc_allocWithZone(MEMORY[0x1E0CF5080]);
  v55 = v32;
  v56 = v40;
  v57 = v45;
  v58 = v53;
  v59 = objc_msgSend(v54, sel_initWithClient_templateStore_earnedInstanceStore_templateAssetRegistry_progressEngine_, v55, v56, v57, v52, v58);

  v164 = v57;
  *(_QWORD *)(a1 + 24) = v59;
  v60 = v59;
  v163 = v58;
  objc_msgSend(v58, sel_setAchievementStore_, v60);
  sub_1D2AB1CA0(a1 + 192, (uint64_t)&v170);
  sub_1D2AB1CA0((uint64_t)v159, (uint64_t)v168);
  v61 = byte_1ED978AD8;
  v62 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v170, *((uint64_t *)&v171 + 1));
  v159 = &v147;
  MEMORY[0x1E0C80A78](v62);
  v64 = (uint64_t *)((char *)&v147 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v65 + 16))(v64);
  v66 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v168, v169);
  v154 = &v147;
  MEMORY[0x1E0C80A78](v66);
  v68 = (uint64_t *)((char *)&v147 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v69 + 16))(v68);
  v70 = *v64;
  v71 = *v68;
  v72 = v165;
  v73 = v158;
  v74 = v60;
  v75 = v160;
  v76 = v70;
  v77 = (uint64_t *)v56;
  v78 = v74;
  v79 = sub_1D2AB388C(v74, (uint64_t)v162, v160, v72, v76, v71, v73, v61);

  swift_release();
  v158 = v73;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v168);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v170);
  *(_QWORD *)(a1 + 272) = v79;
  v80 = objc_allocWithZone(MEMORY[0x1E0CF5138]);
  v160 = v55;
  v81 = objc_msgSend(v80, sel_initWithClient_assertionClient_templateStore_achievementStore_, v55, v166, v77, v78);
  if (!v81)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  *(_QWORD *)(a1 + 400) = v81;
  *(_QWORD *)(a1 + 80) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF50A8]), sel_init);
  *(_QWORD *)(a1 + 288) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5110]), sel_init);
  v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5090]), sel_initWithHealthStore_shouldIncludePrivateProperties_, v72, 1);
  v83 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5000]), sel_initWithHealthStore_, v72);
  v84 = objc_allocWithZone(MEMORY[0x1E0CF50F8]);
  v165 = v83;
  v85 = objc_msgSend(v84, sel_initWithActivitySummaryIterator_workoutClient_, v82, v83);
  v86 = objc_allocWithZone(MEMORY[0x1E0CF5100]);
  v159 = v77;
  v87 = objc_msgSend(v86, sel_initWithHealthStore_earnedInstanceStore_templateStore_activitySummaryIterator_, v72, v164, v77, v82);
  v88 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5128]), sel_initWithHealthStore_, v72);
  v89 = objc_allocWithZone(MEMORY[0x1E0CF5108]);
  v162 = v85;
  v90 = objc_msgSend(v89, sel_initWithDataSource_dataProvider_templateCache_, v85, v87, v88);
  v91 = v167;
  if (!v90)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(_QWORD *)(a1 + 184) = v90;
  v92 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF50A0]), sel_initWithHealthStore_creatorDevice_, v72, v91);
  v93 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF50E8]), sel_init);
  v94 = objc_allocWithZone(MEMORY[0x1E0CF5120]);
  v95 = (uint64_t *)v92;
  v96 = v94;
  v97 = v153;
  v98 = objc_msgSend(v96, sel_initWithMobileAssetProvider_backCompatWriter_remoteTemplateAvailabilityKeyProvider_, v93, v95, v153);
  v154 = v95;

  if (!v98)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  *(_QWORD *)(a1 + 336) = v98;
  v152 = v78;
  v151 = v82;
  v150 = v87;
  v149 = v88;
  v148 = v93;
  if (v161)
  {
    if (FIIsActivePairedDeviceSatellitePaired())
    {
      ACHTinkerHistoricalEvaluationPolicy();
      v99 = v170;
      v100 = *((_QWORD *)&v170 + 1);
      v101 = v171;
      v102 = BYTE8(v171);
      LODWORD(v153) = 1;
      goto LABEL_20;
    }
    ACHGizmoHistoricalEvaluationPolicy();
  }
  else
  {
    ACHCompanionHistoricalEvaluationPolicy();
  }
  LODWORD(v153) = 0;
  v99 = v170;
  v100 = *((_QWORD *)&v170 + 1);
  v101 = v171;
  v102 = BYTE8(v171);
LABEL_20:
  v103 = BYTE9(v171);
  v104 = objc_allocWithZone(MEMORY[0x1E0CF50B8]);
  v105 = v166;
  v106 = objc_msgSend(v104, sel_initWithHealthStore_assertionClient_, v72, v166);
  *(_QWORD *)(a1 + 88) = v106;
  v107 = objc_allocWithZone(MEMORY[0x1E0CF50C0]);
  v108 = v106;
  v109 = v105;
  v110 = v108;
  LOBYTE(v170) = v99;
  *((_QWORD *)&v170 + 1) = v100;
  *(_QWORD *)&v171 = v101;
  BYTE8(v171) = v102;
  BYTE9(v171) = v103;
  v111 = v160;
  v112 = v164;
  v113 = objc_msgSend(v107, sel_initWithClient_assertionClient_dataStore_earnedInstanceStore_historicalEvaluationPolicy_, v160, v109, v108, v164, &v170);
  *(_QWORD *)(a1 + 48) = v113;
  v114 = objc_allocWithZone(MEMORY[0x1E0CF5088]);
  v115 = v72;
  v116 = v159;
  v117 = v110;
  v118 = v113;
  v119 = v114;
  v120 = v158;
  v121 = v163;
  v122 = objc_msgSend(v119, sel_initWithHealthStore_dataStore_templateStore_pauseRingsCoordinator_awardingEngine_progressEngine_, v115, v117, v116, v158, v118, v163);

  *(_QWORD *)(a1 + 32) = v122;
  v123 = objc_allocWithZone(MEMORY[0x1E0CF50E0]);
  v124 = v167;
  v125 = v165;
  *(_QWORD *)(a1 + 168) = objc_msgSend(v123, sel_initWithClient_healthStore_workoutClient_awardingEngine_templateStore_creatorDevice_progressEngine_, v111, v115, v165, v118, v116, v167, v121);
  *(_QWORD *)(a1 + 416) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF5150]), sel_initWithClient_healthStore_awardingEngine_dataStore_templateStore_creatorDevice_progressEngine_workoutUtility_, v111, v115, v118, v117, v116, v124, v121, v125);
  v126 = objc_allocWithZone(MEMORY[0x1E0CF50F0]);
  *(_QWORD *)(a1 + 176) = objc_msgSend(v126, sel_initWithHealthStore_awardingEngine_templateStore_earnedInstanceStore_monthlyDataSource_creatorDevice_progressEngine_, v115, v118, v116, v112, v162, v124, v121);
  if ((_DWORD)v153)
  {

    v127 = objc_allocWithZone(MEMORY[0x1E0CF5148]);
    v128 = v116;
    v129 = v112;
    v130 = v127;
    v131 = v166;
    v111 = objc_msgSend(v130, sel_initWithHealthStore_assertionClient_dataStore_earnedInstanceStore_templateStore_awardingEngine_, v115, v166, v117, v129, v128, v118);

    if (v111)
      goto LABEL_27;
    __break(1u);
  }
  if (!v161)
    goto LABEL_26;

  v132 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF50D8]), sel_initWithClient_dataStore_awardingEngine_, v111, v117, v118);
  v133 = v111;
  v111 = v132;

  if (v111)
  {
LABEL_27:
    *(_QWORD *)(a1 + 56) = v111;
    v139 = v157;
    v140 = v152;
    swift_unknownObjectRetain();
    sub_1D2AB21D4(v139, v140, (uint64_t *)v111, v112, v163, v116, (uint64_t **)&v170);
    v141 = v171;
    *(_OWORD *)(a1 + 344) = v170;
    *(_OWORD *)(a1 + 360) = v141;
    *(_OWORD *)(a1 + 376) = v172;
    v142 = (char *)objc_allocWithZone((Class)type metadata accessor for ActivityAwardsDateQueryListener());
    v143 = v139;
    v144 = v140;
    *(_QWORD *)(a1 + 312) = sub_1D2AB3380(v143, v144, v142);
    v145 = objc_allocWithZone((Class)type metadata accessor for ActivityAwardsQueryListener());
    v146 = sub_1D2AB1FEC(v143, v144, v145);

    *(_QWORD *)(a1 + 320) = v146;
    return;
  }
  __break(1u);
LABEL_26:

  v134 = objc_allocWithZone(MEMORY[0x1E0CF50B0]);
  v135 = v116;
  v136 = v112;
  v137 = v134;
  v138 = v166;
  v111 = objc_msgSend(v137, sel_initWithHealthStore_assertionClient_dataStore_earnedInstanceStore_templateStore_awardingEngine_, v115, v166, v117, v136, v135, v118);

  if (v111)
    goto LABEL_27;
LABEL_36:
  __break(1u);
}

uint64_t Daemon.activate()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_1D2AB14EC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;

  if (qword_1ED9788D8 != -1)
LABEL_35:
    swift_once();
  v1 = (_QWORD *)v0[15];
  v2 = sub_1D2AB6634();
  v0[16] = __swift_project_value_buffer(v2, (uint64_t)qword_1ED9786E8);
  v3._object = (void *)0x80000001D2AB8F30;
  v3._countAndFlagsBits = 0xD000000000000058;
  v4._countAndFlagsBits = 0x6574617669746361;
  v4._object = (void *)0xEA00000000002928;
  Logger.trace(file:function:)(v3, v4);
  v5 = v1[10];
  v6 = (void *)v1[50];
  objc_msgSend(v6, sel_registerTemplateSource_, v5);
  v7 = (void *)v1[49];
  objc_msgSend(v7, sel_registerTemplateAssetSource_, v5);
  v8 = v1[36];
  objc_msgSend(v6, sel_registerTemplateSource_, v8);
  objc_msgSend(v7, sel_registerTemplateAssetSource_, v8);
  v9 = v1[23];
  objc_msgSend(v6, sel_registerTemplateSource_, v9);
  objc_msgSend(v7, sel_registerTemplateAssetSource_, v9);
  v10 = v1[42];
  objc_msgSend(v6, sel_registerTemplateSource_, v10);
  objc_msgSend(v7, sel_registerTemplateAssetSource_, v10);
  v43 = (id)v1[38];
  v11 = objc_msgSend(v43, sel_createTemplateAssetSources);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED978728);
  v12 = sub_1D2AB6664();
  v0[17] = v12;

  v13 = v12 + 64;
  v14 = -1;
  v15 = -1 << *(_BYTE *)(v12 + 32);
  if (-v15 < 64)
    v14 = ~(-1 << -(char)v15);
  v16 = v14 & *(_QWORD *)(v12 + 64);
  v17 = (unint64_t)(63 - v15) >> 6;
  swift_bridgeObjectRetain();
  v18 = 0;
  while (1)
  {
    if (v16)
    {
      v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v20 = v19 | (v18 << 6);
      goto LABEL_6;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v22 >= v17)
      goto LABEL_24;
    v23 = *(_QWORD *)(v13 + 8 * v22);
    ++v18;
    if (!v23)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v17)
        goto LABEL_24;
      v23 = *(_QWORD *)(v13 + 8 * v18);
      if (!v23)
      {
        v18 = v22 + 2;
        if (v22 + 2 >= v17)
          goto LABEL_24;
        v23 = *(_QWORD *)(v13 + 8 * v18);
        if (!v23)
        {
          v18 = v22 + 3;
          if (v22 + 3 >= v17)
            goto LABEL_24;
          v23 = *(_QWORD *)(v13 + 8 * v18);
          if (!v23)
            break;
        }
      }
    }
LABEL_23:
    v16 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v18 << 6);
LABEL_6:
    v21 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v20);
    swift_unknownObjectRetain();
    objc_msgSend(v7, sel_registerTemplateAssetSource_, v21);
    swift_unknownObjectRelease();
  }
  v24 = v22 + 4;
  if (v24 < v17)
  {
    v23 = *(_QWORD *)(v13 + 8 * v24);
    if (!v23)
    {
      while (1)
      {
        v18 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_34;
        if (v18 >= v17)
          goto LABEL_24;
        v23 = *(_QWORD *)(v13 + 8 * v18);
        ++v24;
        if (v23)
          goto LABEL_23;
      }
    }
    v18 = v24;
    goto LABEL_23;
  }
LABEL_24:
  swift_release();
  v25 = objc_msgSend(v43, sel_createProgressProviders);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978A10);
  v26 = sub_1D2AB6664();

  v27 = (unint64_t)sub_1D2AB1D0C(v26);
  result = swift_bridgeObjectRelease();
  if ((v27 & 0x8000000000000000) != 0 || (v27 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v29 = sub_1D2AB6AC0();
    result = swift_release();
    if (!v29)
      goto LABEL_37;
LABEL_27:
    if (v29 >= 1)
    {
      v30 = 0;
      v31 = *(void **)(v0[15] + 296);
      do
      {
        if ((v27 & 0xC000000000000001) != 0)
        {
          v32 = MEMORY[0x1D8242098](v30, v27);
        }
        else
        {
          v32 = *(_QWORD *)(v27 + 8 * v30 + 32);
          swift_unknownObjectRetain();
        }
        ++v30;
        objc_msgSend(v31, sel_registerProgressProvider_, v32);
        swift_unknownObjectRelease();
      }
      while (v29 != v30);
      goto LABEL_37;
    }
    __break(1u);
  }
  else
  {
    v29 = *(_QWORD *)(v27 + 16);
    if (v29)
      goto LABEL_27;
LABEL_37:
    v33 = v0[15];
    swift_release();
    v34 = *(void **)(v33 + 48);
    v0[18] = v34;
    v35 = *(_QWORD *)(v33 + 32);
    objc_msgSend(v34, sel_registerSource_, v35);
    v36 = *(void **)(v33 + 296);
    objc_msgSend(v36, sel_registerProgressProvider_, v35);
    v37 = *(_QWORD *)(v33 + 416);
    v0[19] = v37;
    objc_msgSend(v34, sel_registerSource_, v37);
    objc_msgSend(v36, sel_registerProgressProvider_, v37);
    v38 = *(_QWORD *)(v33 + 176);
    objc_msgSend(v34, sel_registerSource_, v38);
    objc_msgSend(v36, sel_registerProgressProvider_, v38);
    v39 = *(_QWORD *)(v33 + 168);
    v0[20] = v39;
    objc_msgSend(v34, sel_registerSource_, v39);
    objc_msgSend(v36, sel_registerProgressProvider_, v39);
    objc_msgSend(*(id *)(v33 + 88), sel_activate);
    v40 = *(void **)(v33 + 24);
    v0[7] = v0 + 22;
    v0[2] = v0;
    v0[3] = sub_1D2AB1A14;
    v41 = swift_continuation_init();
    v0[10] = MEMORY[0x1E0C809B0];
    v42 = v0 + 10;
    v42[1] = 0x40000000;
    v42[2] = sub_1D2AB1C8C;
    v42[3] = &block_descriptor_4;
    v42[4] = v41;
    objc_msgSend(v40, sel_loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler_, v42);
    return swift_continuation_await();
  }
  return result;
}

uint64_t sub_1D2AB1A14()
{
  return swift_task_switch();
}

uint64_t sub_1D2AB1A60()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 152);
  v2 = *(void **)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 120);
  objc_msgSend(*(id *)(v0 + 144), sel_activate);
  objc_msgSend(*(id *)(v3 + 56), sel_activate);
  objc_msgSend(v2, sel_activate);
  objc_msgSend(v1, sel_activate);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 128), *(_QWORD *)(v3 + 152));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v4;
  *v4 = v0;
  v4[1] = sub_1D2AB1AF8;
  return sub_1D2AAEB2C();
}

uint64_t sub_1D2AB1AF8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1D2AB1B4C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 120) + 272);
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_achievementStore), sel_addObserver_, v1);
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1ED978578 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 120);
  objc_msgSend(v2, sel_addObserver_selector_name_object_, v1, sel_notificationSuppressionChanged, qword_1ED9790D0, 0);

  v4 = *(_QWORD *)(v3 + 112);
  v5._object = (void *)0x80000001D2AB8530;
  v5._countAndFlagsBits = 0xD000000000000069;
  v6._countAndFlagsBits = 0x6574617669746361;
  v6._object = (void *)0xEA00000000002928;
  Logger.trace(file:function:)(v5, v6);
  objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC22ActivityAwardsServices19XPCEndpointProvider_listener), sel_resume);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1D2AB1C8C(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_1D2AB1CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

_QWORD *sub_1D2AB1D0C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978DC8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_1D2AB1DF4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1D2AA8BE4();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1D2AB1DF4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_unknownObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    result = swift_unknownObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

char *sub_1D2AB1FEC(void *a1, void *a2, void *a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  os_unfair_lock_s *v21;
  char *v22;
  char *v23;
  objc_super v25;

  v6 = sub_1D2AB6694();
  v8 = v7;
  v9 = a3;
  v10 = sub_1D2A9AAE4(v6, v8);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v9[OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_endpoint] = v10;
  *(_QWORD *)&v9[OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_achievementStore] = a2;
  swift_unknownObjectRetain();

  v25.receiver = v9;
  v25.super_class = (Class)type metadata accessor for ActivityAwardsQueryListener();
  v11 = (char *)objc_msgSendSuper2(&v25, sel_init);
  v12 = *(void **)&v11[OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_achievementStore];
  v13 = v11;
  objc_msgSend(v12, sel_addObserver_, v13);
  v14 = *(char **)&v13[OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_endpoint];
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1D2A9BB24;
  *(_QWORD *)(v16 + 24) = v15;
  v17 = *(_QWORD *)&v14[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_transportDispatchService];
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_1D2A9BABC;
  *(_QWORD *)(v18 + 24) = v16;
  v19 = *(_QWORD *)(v17 + 16);
  v20 = (uint64_t *)(v19 + 16);
  v21 = (os_unfair_lock_s *)(v19 + 24);
  v22 = v13;
  v23 = v14;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v21);
  sub_1D2A9BDDC(v20, 2, (uint64_t)sub_1D2A9BA54, v18);
  os_unfair_lock_unlock(v21);

  swift_release();
  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_1D2AB21D4@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X3>, void *a5@<X4>, uint64_t *a6@<X5>, uint64_t **a7@<X8>)
{
  uint64_t v12;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  char *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  char *v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  os_unfair_lock_s *v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t **v45;
  void *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  os_unfair_lock_s *v54;
  uint64_t **v55;
  id v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  _QWORD *v60;
  uint64_t **v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  os_unfair_lock_s *v67;
  uint64_t **v68;
  uint64_t *v69;
  uint64_t *v70;
  _QWORD *v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  os_unfair_lock_s *v80;
  uint64_t **v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  _QWORD *v86;
  uint64_t **v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  os_unfair_lock_s *v95;
  uint64_t *v96;
  os_unfair_lock_s *v97;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  uint64_t *v103;
  _QWORD *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  os_unfair_lock_s *v113;
  uint64_t *v114;
  uint64_t *v115;
  _QWORD *v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  os_unfair_lock_s *v127;
  uint64_t *v128;
  uint64_t *v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t *v132;
  _QWORD *v133;
  uint64_t *v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  os_unfair_lock_s *v142;
  uint64_t *v143;
  uint64_t *v144;
  _QWORD *v145;
  uint64_t *v146;
  uint64_t *v147;
  uint64_t *v148;
  uint64_t *v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  os_unfair_lock_s *v156;
  uint64_t *v157;
  uint64_t *v158;
  uint64_t *v159;
  uint64_t *v160;
  uint64_t *v161;
  _QWORD *v162;
  uint64_t *v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t *v170;
  os_unfair_lock_s *v171;
  uint64_t *v172;
  uint64_t *v173;
  _QWORD *v174;
  uint64_t *v175;
  uint64_t *v176;
  uint64_t *v177;
  uint64_t *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  os_unfair_lock_s *v184;
  uint64_t *v185;
  uint64_t *v186;
  uint64_t *v187;
  uint64_t *v188;
  _QWORD *v189;
  uint64_t *v190;
  uint64_t *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t *v197;
  os_unfair_lock_s *v198;
  uint64_t *v199;
  uint64_t *v200;
  uint64_t *v201;
  uint64_t *v202;
  char *v203;
  uint64_t *v204;
  uint64_t result;
  uint64_t **v206;
  uint64_t *v207;
  uint64_t *v208;
  uint64_t *v209;
  uint64_t *v210;
  uint64_t *v211;
  uint64_t *v212;
  uint64_t *v213;
  uint64_t **v214;
  uint64_t **v215;
  id v216;
  uint64_t **v217;
  uint64_t *v218;
  uint64_t *v219;
  char *v220;
  uint64_t *v221;

  v215 = (uint64_t **)a6;
  v216 = a1;
  v217 = a7;
  v12 = sub_1D2AB6694();
  v14 = sub_1D2A9AAE4(v12, v13);
  swift_bridgeObjectRelease();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v14;
  v15[3] = a2;
  v219 = a3;
  v220 = v14;
  v15[4] = a3;
  v15[5] = a4;
  v15[6] = a5;
  v15[7] = a6;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_1D2AB46E4;
  *(_QWORD *)(v16 + 24) = v15;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1D2AB46EC;
  *(_QWORD *)(v17 + 24) = v16;
  v221 = (uint64_t *)OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_transportDispatchService;
  v18 = *(_QWORD *)&v14[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_transportDispatchService];
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_1D2AB470C;
  *(_QWORD *)(v19 + 24) = v17;
  v20 = *(_QWORD *)(v18 + 16);
  v218 = (uint64_t *)(v20 + 16);
  v21 = (os_unfair_lock_s *)(v20 + 24);
  v22 = v14;
  v23 = a2;
  swift_unknownObjectRetain_n();
  v24 = a4;
  v25 = a5;
  v26 = v215;
  v27 = v22;
  v28 = v23;
  v29 = (uint64_t *)v24;
  v213 = v29;
  v212 = (uint64_t *)v25;
  v30 = v26;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v21);
  sub_1D2A9BDDC(v218, 0, (uint64_t)sub_1D2AB4734, v19);
  v218 = 0;
  os_unfair_lock_unlock(v21);
  swift_release();
  swift_release();
  swift_release();
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = v27;
  v31[3] = v28;
  v31[4] = v219;
  v31[5] = v29;
  v32 = v212;
  v31[6] = v212;
  v31[7] = v30;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = sub_1D2AB47AC;
  *(_QWORD *)(v33 + 24) = v31;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = sub_1D2AB4AF4;
  *(_QWORD *)(v34 + 24) = v33;
  v35 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v36 = swift_allocObject();
  v215 = &v207;
  *(_QWORD *)(v36 + 16) = sub_1D2AB4AFC;
  *(_QWORD *)(v36 + 24) = v34;
  v37 = *(_QWORD *)(v35 + 16);
  v38 = (uint64_t *)(v37 + 16);
  v39 = (os_unfair_lock_s *)(v37 + 24);
  v214 = v27;
  v40 = v28;
  swift_unknownObjectRetain();
  v213 = v213;
  v212 = v32;
  v41 = v30;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v39);
  v42 = v218;
  sub_1D2A9BDDC(v38, 1, (uint64_t)sub_1D2AB47B4, v36);
  v218 = v42;
  os_unfair_lock_unlock(v39);
  swift_release();
  swift_release();
  swift_release();
  v43 = (_QWORD *)swift_allocObject();
  v44 = v213;
  v45 = v214;
  v43[2] = v214;
  v43[3] = v40;
  v46 = v40;
  v47 = v219;
  v43[4] = v219;
  v43[5] = v44;
  v48 = v212;
  v43[6] = v212;
  v43[7] = v41;
  v49 = v41;
  v50 = swift_allocObject();
  *(_QWORD *)(v50 + 16) = sub_1D2AB47D0;
  *(_QWORD *)(v50 + 24) = v43;
  v51 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v52 = swift_allocObject();
  v215 = &v207;
  *(_QWORD *)(v52 + 16) = sub_1D2AB4AF8;
  *(_QWORD *)(v52 + 24) = v50;
  v53 = *(_QWORD *)(v51 + 16);
  v211 = (uint64_t *)(v53 + 16);
  v54 = (os_unfair_lock_s *)(v53 + 24);
  v55 = v45;
  v56 = v46;
  swift_unknownObjectRetain();
  v57 = v44;
  v210 = v57;
  v214 = v48;
  v58 = v49;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v54);
  v59 = v218;
  sub_1D2A9BDDC(v211, 2, (uint64_t)sub_1D2AB47D8, v52);
  v218 = v59;
  os_unfair_lock_unlock(v54);
  swift_release();
  swift_release();
  swift_release();
  v60 = (_QWORD *)swift_allocObject();
  v60[2] = v55;
  v60[3] = v56;
  v60[4] = v47;
  v60[5] = v57;
  v61 = v214;
  v60[6] = v214;
  v60[7] = v58;
  v62 = swift_allocObject();
  *(_QWORD *)(v62 + 16) = sub_1D2AB4854;
  *(_QWORD *)(v62 + 24) = v60;
  v63 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v64 = swift_allocObject();
  v215 = &v207;
  *(_QWORD *)(v64 + 16) = sub_1D2AB46C4;
  *(_QWORD *)(v64 + 24) = v62;
  v65 = *(_QWORD *)(v63 + 16);
  v66 = (uint64_t *)(v65 + 16);
  v67 = (os_unfair_lock_s *)(v65 + 24);
  v68 = v55;
  v213 = (uint64_t *)v56;
  swift_unknownObjectRetain();
  v69 = v210;
  v212 = v61;
  v211 = v58;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v67);
  v70 = v218;
  sub_1D2A9BDDC(v66, 15, (uint64_t)sub_1D2AB485C, v64);
  v218 = v70;
  os_unfair_lock_unlock(v67);
  swift_release();
  swift_release();
  swift_release();
  v71 = (_QWORD *)swift_allocObject();
  v72 = v212;
  v73 = v213;
  v71[2] = v68;
  v71[3] = v73;
  v71[4] = v219;
  v71[5] = v69;
  v74 = v69;
  v75 = v211;
  v71[6] = v72;
  v71[7] = v75;
  v76 = swift_allocObject();
  *(_QWORD *)(v76 + 16) = sub_1D2AB4890;
  *(_QWORD *)(v76 + 24) = v71;
  v77 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v78 = swift_allocObject();
  v214 = &v207;
  *(_QWORD *)(v78 + 16) = sub_1D2AB46C4;
  *(_QWORD *)(v78 + 24) = v76;
  v79 = *(_QWORD *)(v77 + 16);
  v215 = (uint64_t **)(v79 + 16);
  v80 = (os_unfair_lock_s *)(v79 + 24);
  v81 = v68;
  v213 = v73;
  swift_unknownObjectRetain();
  v82 = v74;
  v83 = v72;
  v84 = v75;
  v212 = v84;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v80);
  v85 = v218;
  sub_1D2A9BDDC((uint64_t *)v215, 8, (uint64_t)sub_1D2AB48C8, v78);
  v215 = (uint64_t **)v85;
  os_unfair_lock_unlock(v80);
  swift_release();
  swift_release();
  swift_release();
  v86 = (_QWORD *)swift_allocObject();
  v87 = v81;
  v86[2] = v81;
  v88 = v213;
  v89 = v219;
  v86[3] = v213;
  v86[4] = v89;
  v86[5] = v82;
  v86[6] = v83;
  v90 = v83;
  v86[7] = v84;
  v91 = swift_allocObject();
  *(_QWORD *)(v91 + 16) = sub_1D2AB48FC;
  *(_QWORD *)(v91 + 24) = v86;
  v92 = swift_allocObject();
  *(_QWORD *)(v92 + 16) = sub_1D2AB4AF4;
  *(_QWORD *)(v92 + 24) = v91;
  v93 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v94 = swift_allocObject();
  v214 = &v207;
  *(_QWORD *)(v94 + 16) = sub_1D2AB4AFC;
  *(_QWORD *)(v94 + 24) = v92;
  v95 = *(os_unfair_lock_s **)(v93 + 16);
  v96 = (uint64_t *)&v95[4];
  v97 = v95 + 6;
  v218 = v87;
  v98 = v88;
  swift_unknownObjectRetain();
  v99 = v82;
  v210 = v99;
  v100 = v90;
  v211 = v100;
  v101 = v212;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v97);
  v102 = v96;
  v103 = (uint64_t *)v215;
  sub_1D2A9BDDC(v102, 9, (uint64_t)sub_1D2AB4904, v94);
  v215 = (uint64_t **)v103;
  os_unfair_lock_unlock(v97);
  swift_release();
  swift_release();
  swift_release();
  v104 = (_QWORD *)swift_allocObject();
  v104[2] = v218;
  v104[3] = v98;
  v105 = v98;
  v104[4] = v89;
  v104[5] = v99;
  v104[6] = v100;
  v104[7] = v101;
  v106 = v101;
  v107 = swift_allocObject();
  *(_QWORD *)(v107 + 16) = sub_1D2AB4930;
  *(_QWORD *)(v107 + 24) = v104;
  v108 = swift_allocObject();
  *(_QWORD *)(v108 + 16) = sub_1D2AB4AF4;
  *(_QWORD *)(v108 + 24) = v107;
  v109 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v110 = swift_allocObject();
  *(_QWORD *)(v110 + 16) = sub_1D2AB4AFC;
  *(_QWORD *)(v110 + 24) = v108;
  v111 = *(_QWORD *)(v109 + 16);
  v112 = (uint64_t *)(v111 + 16);
  v113 = (os_unfair_lock_s *)(v111 + 24);
  v114 = v218;
  v213 = v105;
  swift_unknownObjectRetain();
  v212 = v210;
  v211 = v211;
  v210 = v106;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v113);
  v115 = (uint64_t *)v215;
  sub_1D2A9BDDC(v112, 10, (uint64_t)sub_1D2AB4B00, v110);
  v215 = (uint64_t **)v115;
  os_unfair_lock_unlock(v113);
  swift_release();
  swift_release();
  swift_release();
  v116 = (_QWORD *)swift_allocObject();
  v117 = v114;
  v116[2] = v114;
  v118 = v212;
  v119 = v213;
  v116[3] = v213;
  v116[4] = v89;
  v120 = v210;
  v121 = v211;
  v116[5] = v118;
  v116[6] = v121;
  v116[7] = v120;
  v122 = swift_allocObject();
  *(_QWORD *)(v122 + 16) = sub_1D2AB493C;
  *(_QWORD *)(v122 + 24) = v116;
  v123 = swift_allocObject();
  *(_QWORD *)(v123 + 16) = sub_1D2AB4968;
  *(_QWORD *)(v123 + 24) = v122;
  v124 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v125 = swift_allocObject();
  v214 = &v207;
  *(_QWORD *)(v125 + 16) = sub_1D2AB498C;
  *(_QWORD *)(v125 + 24) = v123;
  v126 = *(_QWORD *)(v124 + 16);
  v209 = (uint64_t *)(v126 + 16);
  v127 = (os_unfair_lock_s *)(v126 + 24);
  v218 = v117;
  v128 = v119;
  swift_unknownObjectRetain();
  v129 = v118;
  v212 = v129;
  v130 = v121;
  v211 = v130;
  v131 = v120;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v127);
  v132 = (uint64_t *)v215;
  sub_1D2A9BDDC(v209, 11, (uint64_t)sub_1D2AB4990, v125);
  v215 = (uint64_t **)v132;
  os_unfair_lock_unlock(v127);
  swift_release();
  swift_release();
  swift_release();
  v133 = (_QWORD *)swift_allocObject();
  v133[2] = v218;
  v133[3] = v128;
  v134 = v128;
  v133[4] = v89;
  v133[5] = v129;
  v133[6] = v130;
  v133[7] = v131;
  v135 = v131;
  v136 = swift_allocObject();
  *(_QWORD *)(v136 + 16) = sub_1D2AB49AC;
  *(_QWORD *)(v136 + 24) = v133;
  v137 = swift_allocObject();
  *(_QWORD *)(v137 + 16) = sub_1D2AB4968;
  *(_QWORD *)(v137 + 24) = v136;
  v138 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v139 = swift_allocObject();
  *(_QWORD *)(v139 + 16) = sub_1D2AB49B4;
  *(_QWORD *)(v139 + 24) = v137;
  v140 = *(_QWORD *)(v138 + 16);
  v141 = (uint64_t *)(v140 + 16);
  v142 = (os_unfair_lock_s *)(v140 + 24);
  v143 = v218;
  v213 = v134;
  swift_unknownObjectRetain();
  v212 = v212;
  v211 = v211;
  v208 = v135;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v142);
  v144 = (uint64_t *)v215;
  sub_1D2A9BDDC(v141, 12, (uint64_t)sub_1D2AB49E0, v139);
  v215 = (uint64_t **)v144;
  os_unfair_lock_unlock(v142);
  swift_release();
  swift_release();
  swift_release();
  v145 = (_QWORD *)swift_allocObject();
  v146 = v143;
  v145[2] = v143;
  v147 = v212;
  v148 = v213;
  v145[3] = v213;
  v145[4] = v89;
  v149 = v211;
  v145[5] = v147;
  v145[6] = v149;
  v150 = v208;
  v145[7] = v208;
  v151 = swift_allocObject();
  *(_QWORD *)(v151 + 16) = sub_1D2AB49FC;
  *(_QWORD *)(v151 + 24) = v145;
  v152 = swift_allocObject();
  *(_QWORD *)(v152 + 16) = sub_1D2AB4AF4;
  *(_QWORD *)(v152 + 24) = v151;
  v153 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v154 = swift_allocObject();
  v214 = &v207;
  *(_QWORD *)(v154 + 16) = sub_1D2AB4AFC;
  *(_QWORD *)(v154 + 24) = v152;
  v155 = *(_QWORD *)(v153 + 16);
  v207 = (uint64_t *)(v155 + 16);
  v156 = (os_unfair_lock_s *)(v155 + 24);
  v218 = v146;
  v157 = v148;
  swift_unknownObjectRetain();
  v158 = v147;
  v209 = v158;
  v159 = v149;
  v210 = v159;
  v160 = v150;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v156);
  v161 = (uint64_t *)v215;
  sub_1D2A9BDDC(v207, 13, (uint64_t)sub_1D2AB4A04, v154);
  v215 = (uint64_t **)v161;
  os_unfair_lock_unlock(v156);
  swift_release();
  swift_release();
  swift_release();
  v162 = (_QWORD *)swift_allocObject();
  v162[2] = v218;
  v162[3] = v157;
  v163 = v157;
  v162[4] = v89;
  v162[5] = v158;
  v162[6] = v159;
  v162[7] = v160;
  v164 = v160;
  v165 = swift_allocObject();
  *(_QWORD *)(v165 + 16) = sub_1D2AB4A30;
  *(_QWORD *)(v165 + 24) = v162;
  v166 = swift_allocObject();
  *(_QWORD *)(v166 + 16) = sub_1D2AB4AF4;
  *(_QWORD *)(v166 + 24) = v165;
  v167 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v168 = swift_allocObject();
  *(_QWORD *)(v168 + 16) = sub_1D2AB4AFC;
  *(_QWORD *)(v168 + 24) = v166;
  v169 = *(_QWORD *)(v167 + 16);
  v170 = (uint64_t *)(v169 + 16);
  v171 = (os_unfair_lock_s *)(v169 + 24);
  v213 = v218;
  v212 = v163;
  swift_unknownObjectRetain();
  v211 = v209;
  v172 = v210;
  v210 = v172;
  v209 = v164;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v171);
  v173 = (uint64_t *)v215;
  sub_1D2A9BDDC(v170, 14, (uint64_t)sub_1D2AB4B14, v168);
  v218 = v173;
  os_unfair_lock_unlock(v171);
  swift_release();
  swift_release();
  swift_release();
  v174 = (_QWORD *)swift_allocObject();
  v176 = v212;
  v175 = v213;
  v174[2] = v213;
  v174[3] = v176;
  v177 = v211;
  v174[4] = v89;
  v174[5] = v177;
  v178 = v209;
  v174[6] = v172;
  v174[7] = v178;
  v179 = swift_allocObject();
  *(_QWORD *)(v179 + 16) = sub_1D2AB4A3C;
  *(_QWORD *)(v179 + 24) = v174;
  v180 = swift_allocObject();
  *(_QWORD *)(v180 + 16) = sub_1D2AB4AF4;
  *(_QWORD *)(v180 + 24) = v179;
  v181 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v182 = swift_allocObject();
  v214 = &v207;
  *(_QWORD *)(v182 + 16) = sub_1D2AB4AFC;
  *(_QWORD *)(v182 + 24) = v180;
  v183 = *(_QWORD *)(v181 + 16);
  v208 = (uint64_t *)(v183 + 16);
  v184 = (os_unfair_lock_s *)(v183 + 24);
  v185 = v175;
  v215 = (uint64_t **)v185;
  v213 = v176;
  swift_unknownObjectRetain();
  v186 = v177;
  v212 = v210;
  v187 = v178;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v184);
  v188 = v218;
  sub_1D2A9BDDC(v208, 16, (uint64_t)sub_1D2AB4A44, v182);
  v218 = v188;
  os_unfair_lock_unlock(v184);
  swift_release();
  swift_release();
  swift_release();
  v189 = (_QWORD *)swift_allocObject();
  v191 = v212;
  v190 = v213;
  v189[2] = v185;
  v189[3] = v190;
  v189[4] = v89;
  v189[5] = v186;
  v189[6] = v191;
  v189[7] = v187;
  v192 = swift_allocObject();
  *(_QWORD *)(v192 + 16) = sub_1D2AB4ABC;
  *(_QWORD *)(v192 + 24) = v189;
  v193 = swift_allocObject();
  *(_QWORD *)(v193 + 16) = sub_1D2AB4AF4;
  *(_QWORD *)(v193 + 24) = v192;
  v194 = *(uint64_t *)((char *)v221 + (_QWORD)v220);
  v195 = swift_allocObject();
  *(_QWORD *)(v195 + 16) = sub_1D2AB498C;
  *(_QWORD *)(v195 + 24) = v193;
  v196 = *(_QWORD *)(v194 + 16);
  v197 = (uint64_t *)(v196 + 16);
  v198 = (os_unfair_lock_s *)(v196 + 24);
  v221 = v190;
  swift_unknownObjectRetain();
  v199 = v186;
  v200 = v191;
  v201 = v187;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v198);
  sub_1D2A9BDDC(v197, 17, (uint64_t)sub_1D2AB4B28, v195);
  os_unfair_lock_unlock(v198);
  v202 = (uint64_t *)v215;

  v203 = (char *)v221;
  v204 = v219;
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  result = swift_release();
  v206 = v217;
  *v217 = v202;
  v206[1] = (uint64_t *)v203;
  v206[2] = v204;
  v206[3] = v199;
  v206[4] = v200;
  v206[5] = v201;
  return result;
}

char *sub_1D2AB3380(void *a1, void *a2, char *a3)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  void *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  os_unfair_lock_s *v23;
  char *v24;
  char *v25;
  objc_super v27;

  v6 = &a3[OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_dateComponents];
  v7 = sub_1D2AB64E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)&a3[OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_lastAchievementsForDate] = MEMORY[0x1E0DEE9E8];
  v8 = sub_1D2AB6694();
  v10 = v9;
  v11 = a3;
  v12 = sub_1D2A9AAE4(v8, v10);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v11[OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_endpoint] = v12;
  *(_QWORD *)&v11[OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_achievementStore] = a2;
  swift_unknownObjectRetain();

  v27.receiver = v11;
  v27.super_class = (Class)type metadata accessor for ActivityAwardsDateQueryListener();
  v13 = (char *)objc_msgSendSuper2(&v27, sel_init);
  v14 = *(void **)&v13[OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_achievementStore];
  v15 = v13;
  objc_msgSend(v14, sel_addObserver_, v15);
  v16 = *(char **)&v15[OBJC_IVAR____TtC22ActivityAwardsServices31ActivityAwardsDateQueryListener_endpoint];
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_1D2AB46BC;
  *(_QWORD *)(v18 + 24) = v17;
  v19 = *(_QWORD *)&v16[OBJC_IVAR____TtC22ActivityAwardsServices11XPCEndpoint_transportDispatchService];
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_1D2AB46C4;
  *(_QWORD *)(v20 + 24) = v18;
  v21 = *(_QWORD *)(v19 + 16);
  v22 = (uint64_t *)(v21 + 16);
  v23 = (os_unfair_lock_s *)(v21 + 24);
  v24 = v15;
  v25 = v16;
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v23);
  sub_1D2A9BDDC(v22, 6, (uint64_t)sub_1D2AB46C8, v20);
  os_unfair_lock_unlock(v23);

  swift_release();
  swift_release();
  swift_release();
  return v24;
}

id sub_1D2AB35AC(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, char a8, char *a9)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  _DWORD *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  objc_super v36;
  _QWORD v37[5];
  _QWORD v38[5];

  v38[3] = type metadata accessor for NotificationPostingProvider();
  v38[4] = &off_1E941F198;
  v38[0] = a5;
  v17 = type metadata accessor for FitnessCoachingNotificationSuppressionProvider();
  *(_QWORD *)&a9[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_achievementStore] = a1;
  v37[4] = &off_1E9420078;
  *(_QWORD *)&a9[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_bridgeSettings] = a2;
  *(_QWORD *)&a9[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_fitnessAppsStateObserver] = a3;
  v37[3] = v17;
  v37[0] = a6;
  *(_QWORD *)&a9[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_healthStore] = a4;
  type metadata accessor for UnfairLock();
  v18 = swift_allocObject();
  v19 = a9;
  v20 = a1;
  swift_retain();
  v21 = a3;
  v22 = a4;
  v23 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v18 + 16) = v23;
  *v23 = 0;
  *(_QWORD *)&v19[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_lock] = v18;
  sub_1D2AB1CA0((uint64_t)v38, (uint64_t)&v19[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationPostingProvider]);
  sub_1D2AB1CA0((uint64_t)v37, (uint64_t)&v19[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_notificationSuppresionProvider]);
  *(_QWORD *)&v19[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_pauseRingsCoordinator] = a7;
  v24 = a7;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1D2AB6AC0())
    sub_1D2AB55E0(MEMORY[0x1E0DEE9D8]);
  else
    v25 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v19[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_pendingAchievementsToNotify] = v25;
  v19[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_platform] = a8;
  v26 = objc_allocWithZone(MEMORY[0x1E0CB67F0]);
  v27 = v22;
  v28 = (void *)sub_1D2AB6688();
  v29 = objc_msgSend(v26, sel_initWithCategory_domainName_healthStore_, 0, v28, v27);

  *(_QWORD *)&v19[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_earnedKeyValueStore] = v29;
  v30 = objc_allocWithZone(MEMORY[0x1E0CB67F0]);
  v31 = v27;
  v32 = (void *)sub_1D2AB6688();
  v33 = objc_msgSend(v30, sel_initWithCategory_domainName_healthStore_, 0, v32, v31);

  *(_QWORD *)&v19[OBJC_IVAR____TtC22ActivityAwardsServices18NotificationSystem_unearnedKeyValueStore] = v33;
  v36.receiver = v19;
  v36.super_class = (Class)type metadata accessor for NotificationSystem();
  v34 = objc_msgSendSuper2(&v36, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v38);
  return v34;
}

id sub_1D2AB388C(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  id v25;
  _QWORD v27[3];
  uint64_t v28;
  _UNKNOWN **v29;
  _QWORD v30[3];
  uint64_t v31;
  _UNKNOWN **v32;

  v31 = type metadata accessor for NotificationPostingProvider();
  v32 = &off_1E941F198;
  v30[0] = a5;
  v28 = type metadata accessor for FitnessCoachingNotificationSuppressionProvider();
  v29 = &off_1E9420078;
  v27[0] = a6;
  v16 = (char *)objc_allocWithZone((Class)type metadata accessor for NotificationSystem());
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, v31);
  MEMORY[0x1E0C80A78](v17);
  v19 = (_QWORD *)((char *)v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v28);
  MEMORY[0x1E0C80A78](v21);
  v23 = (_QWORD *)((char *)v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  v25 = sub_1D2AB35AC(a1, a2, a3, a4, *v19, *v23, a7, a8, v16);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  return v25;
}

void destroy for Daemon(id *a1)
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(a1 + 16));

  __swift_destroy_boxed_opaque_existential_0((uint64_t)(a1 + 24));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(a1 + 29));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

uint64_t initializeWithCopy for Daemon(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  id v32;
  id v33;
  id v34;
  __int128 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void (*v80)(uint64_t, uint64_t, uint64_t);
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(void **)(a2 + 32);
  v8 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v9 = *(void **)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  v12 = *(void **)(a2 + 64);
  v11 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v11;
  v70 = *(void **)(a2 + 80);
  v71 = *(void **)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v70;
  *(_QWORD *)(a1 + 88) = v71;
  v73 = *(void **)(a2 + 96);
  v74 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v73;
  *(_QWORD *)(a1 + 104) = v74;
  v13 = *(void **)(a2 + 112);
  v82 = *(void **)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v13;
  *(_QWORD *)(a1 + 120) = v82;
  v84 = a2 + 128;
  v14 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 152) = v14;
  v76 = v13;
  v78 = v14;
  v80 = **(void (***)(uint64_t, uint64_t, uint64_t))(v14 - 8);
  swift_bridgeObjectRetain();
  v15 = v5;
  swift_unknownObjectRetain();
  v16 = v7;
  v17 = v8;
  v18 = v9;
  swift_unknownObjectRetain();
  v19 = v12;
  swift_retain();
  v20 = v70;
  v21 = v71;
  v22 = v73;
  v23 = v74;
  v24 = v76;
  v25 = v82;
  v80(a1 + 128, v84, v78);
  v26 = *(void **)(a2 + 168);
  v27 = *(void **)(a2 + 176);
  *(_QWORD *)(a1 + 168) = v26;
  *(_QWORD *)(a1 + 176) = v27;
  v28 = *(void **)(a2 + 184);
  *(_QWORD *)(a1 + 184) = v28;
  v29 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 216) = v29;
  v30 = v29;
  v31 = **(void (***)(uint64_t, uint64_t, uint64_t))(v29 - 8);
  v32 = v26;
  v33 = v27;
  v34 = v28;
  v31(a1 + 192, a2 + 192, v30);
  v35 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 256) = v35;
  (**(void (***)(uint64_t, uint64_t))(v35 - 8))(a1 + 232, a2 + 232);
  v36 = *(void **)(a2 + 272);
  v37 = *(void **)(a2 + 280);
  *(_QWORD *)(a1 + 272) = v36;
  *(_QWORD *)(a1 + 280) = v37;
  v39 = *(void **)(a2 + 288);
  v38 = *(void **)(a2 + 296);
  *(_QWORD *)(a1 + 288) = v39;
  *(_QWORD *)(a1 + 296) = v38;
  v40 = *(void **)(a2 + 304);
  v41 = *(void **)(a2 + 312);
  *(_QWORD *)(a1 + 304) = v40;
  *(_QWORD *)(a1 + 312) = v41;
  v43 = *(void **)(a2 + 320);
  v42 = *(void **)(a2 + 328);
  *(_QWORD *)(a1 + 320) = v43;
  *(_QWORD *)(a1 + 328) = v42;
  v45 = *(void **)(a2 + 336);
  v44 = *(void **)(a2 + 344);
  *(_QWORD *)(a1 + 336) = v45;
  *(_QWORD *)(a1 + 344) = v44;
  v72 = v44;
  v46 = *(_QWORD *)(a2 + 360);
  *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
  *(_QWORD *)(a1 + 360) = v46;
  v75 = *(void **)(a2 + 368);
  v47 = *(void **)(a2 + 376);
  *(_QWORD *)(a1 + 368) = v75;
  *(_QWORD *)(a1 + 376) = v47;
  v77 = v47;
  v79 = *(void **)(a2 + 384);
  v48 = *(void **)(a2 + 392);
  *(_QWORD *)(a1 + 384) = v79;
  *(_QWORD *)(a1 + 392) = v48;
  v81 = v48;
  v83 = *(void **)(a2 + 400);
  v85 = *(void **)(a2 + 408);
  *(_QWORD *)(a1 + 400) = v83;
  *(_QWORD *)(a1 + 408) = v85;
  v49 = *(void **)(a2 + 416);
  v50 = *(void **)(a2 + 424);
  v86 = v49;
  *(_QWORD *)(a1 + 416) = v49;
  *(_QWORD *)(a1 + 424) = v50;
  v51 = v36;
  v52 = v37;
  v53 = v39;
  v54 = v38;
  v55 = v40;
  v56 = v41;
  v57 = v43;
  v58 = v42;
  v59 = v45;
  v60 = v72;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v61 = v75;
  v62 = v77;
  v63 = v79;
  v64 = v81;
  v65 = v83;
  v66 = v85;
  v67 = v86;
  v68 = v50;
  return a1;
}

uint64_t *assignWithCopy for Daemon(uint64_t *a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  id v99;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = (uint64_t)v4;
  v6 = v4;

  a1[3] = a2[3];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v7 = (void *)a2[4];
  v8 = (void *)a1[4];
  a1[4] = (uint64_t)v7;
  v9 = v7;

  v10 = (void *)a2[5];
  v11 = (void *)a1[5];
  a1[5] = (uint64_t)v10;
  v12 = v10;

  v13 = (void *)a2[6];
  v14 = (void *)a1[6];
  a1[6] = (uint64_t)v13;
  v15 = v13;

  a1[7] = a2[7];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v16 = (void *)a2[8];
  v17 = (void *)a1[8];
  a1[8] = (uint64_t)v16;
  v18 = v16;

  a1[9] = a2[9];
  swift_retain();
  swift_release();
  v19 = (void *)a2[10];
  v20 = (void *)a1[10];
  a1[10] = (uint64_t)v19;
  v21 = v19;

  v22 = (void *)a2[11];
  v23 = (void *)a1[11];
  a1[11] = (uint64_t)v22;
  v24 = v22;

  v25 = (void *)a2[12];
  v26 = (void *)a1[12];
  a1[12] = (uint64_t)v25;
  v27 = v25;

  v28 = (void *)a2[13];
  v29 = (void *)a1[13];
  a1[13] = (uint64_t)v28;
  v30 = v28;

  v31 = (void *)a2[14];
  v32 = (void *)a1[14];
  a1[14] = (uint64_t)v31;
  v33 = v31;

  v34 = (void *)a2[15];
  v35 = (void *)a1[15];
  a1[15] = (uint64_t)v34;
  v36 = v34;

  __swift_assign_boxed_opaque_existential_1(a1 + 16, a2 + 16);
  v37 = (void *)a2[21];
  v38 = (void *)a1[21];
  a1[21] = (uint64_t)v37;
  v39 = v37;

  v40 = (void *)a2[22];
  v41 = (void *)a1[22];
  a1[22] = (uint64_t)v40;
  v42 = v40;

  v43 = (void *)a2[23];
  v44 = (void *)a1[23];
  a1[23] = (uint64_t)v43;
  v45 = v43;

  __swift_assign_boxed_opaque_existential_1(a1 + 24, a2 + 24);
  __swift_assign_boxed_opaque_existential_1(a1 + 29, a2 + 29);
  v46 = (void *)a2[34];
  v47 = (void *)a1[34];
  a1[34] = (uint64_t)v46;
  v48 = v46;

  v49 = (void *)a2[35];
  v50 = (void *)a1[35];
  a1[35] = (uint64_t)v49;
  v51 = v49;

  v52 = (void *)a2[36];
  v53 = (void *)a1[36];
  a1[36] = (uint64_t)v52;
  v54 = v52;

  v55 = (void *)a2[37];
  v56 = (void *)a1[37];
  a1[37] = (uint64_t)v55;
  v57 = v55;

  v58 = (void *)a2[38];
  v59 = (void *)a1[38];
  a1[38] = (uint64_t)v58;
  v60 = v58;

  v61 = (void *)a2[39];
  v62 = (void *)a1[39];
  a1[39] = (uint64_t)v61;
  v63 = v61;

  v64 = (void *)a2[40];
  v65 = (void *)a1[40];
  a1[40] = (uint64_t)v64;
  v66 = v64;

  v67 = (void *)a2[41];
  v68 = (void *)a1[41];
  a1[41] = (uint64_t)v67;
  v69 = v67;

  v70 = (void *)a2[42];
  v71 = (void *)a1[42];
  a1[42] = (uint64_t)v70;
  v72 = v70;

  v73 = (void *)a2[43];
  v74 = (void *)a1[43];
  a1[43] = (uint64_t)v73;
  v75 = v73;

  a1[44] = a2[44];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[45] = a2[45];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v76 = (void *)a2[46];
  v77 = (void *)a1[46];
  a1[46] = (uint64_t)v76;
  v78 = v76;

  v79 = (void *)a2[47];
  v80 = (void *)a1[47];
  a1[47] = (uint64_t)v79;
  v81 = v79;

  v82 = (void *)a2[48];
  v83 = (void *)a1[48];
  a1[48] = (uint64_t)v82;
  v84 = v82;

  v85 = (void *)a2[49];
  v86 = (void *)a1[49];
  a1[49] = (uint64_t)v85;
  v87 = v85;

  v88 = (void *)a2[50];
  v89 = (void *)a1[50];
  a1[50] = (uint64_t)v88;
  v90 = v88;

  v91 = (void *)a2[51];
  v92 = (void *)a1[51];
  a1[51] = (uint64_t)v91;
  v93 = v91;

  v94 = (void *)a2[52];
  v95 = (void *)a1[52];
  a1[52] = (uint64_t)v94;
  v96 = v94;

  v97 = (void *)a2[53];
  v98 = (void *)a1[53];
  a1[53] = (uint64_t)v97;
  v99 = v97;

  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

void *__swift_memcpy432_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1B0uLL);
}

uint64_t assignWithTake for Daemon(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_unknownObjectRelease();
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  v7 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_unknownObjectRelease();
  v9 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  v10 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);

  v11 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);

  v12 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);

  v13 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);

  v14 = *(void **)(a1 + 112);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);

  v15 = *(void **)(a1 + 120);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);

  __swift_destroy_boxed_opaque_existential_0(a1 + 128);
  v16 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v16;
  v17 = *(_QWORD *)(a2 + 168);
  v18 = *(void **)(a1 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v17;

  v19 = *(void **)(a1 + 176);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);

  v20 = *(void **)(a1 + 184);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);

  __swift_destroy_boxed_opaque_existential_0(a1 + 192);
  v21 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v21;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  __swift_destroy_boxed_opaque_existential_0(a1 + 232);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  v22 = *(_QWORD *)(a2 + 272);
  v23 = *(void **)(a1 + 272);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = v22;

  v24 = *(void **)(a1 + 280);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);

  v25 = *(void **)(a1 + 288);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);

  v26 = *(void **)(a1 + 296);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);

  v27 = *(void **)(a1 + 304);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);

  v28 = *(void **)(a1 + 312);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);

  v29 = *(void **)(a1 + 320);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);

  v30 = *(void **)(a1 + 328);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);

  v31 = *(void **)(a1 + 336);
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);

  v32 = *(void **)(a1 + 344);
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);

  *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  swift_unknownObjectRelease();
  v33 = *(void **)(a1 + 368);
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);

  v34 = *(void **)(a1 + 376);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);

  v35 = *(void **)(a1 + 384);
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);

  v36 = *(void **)(a1 + 392);
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);

  v37 = *(void **)(a1 + 400);
  *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);

  v38 = *(void **)(a1 + 408);
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);

  v39 = *(void **)(a1 + 416);
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);

  v40 = *(void **)(a1 + 424);
  *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);

  return a1;
}

uint64_t getEnumTagSinglePayload for Daemon(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 432))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Daemon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 424) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 432) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 432) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Daemon()
{
  return &type metadata for Daemon;
}

uint64_t sub_1D2AB4698()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D2AB46BC()
{
  return sub_1D2AA12E4();
}

double sub_1D2AB46C8@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1D2AB01D4(a1, a2, *(void (**)(uint64_t *__return_ptr, _QWORD *))(v3 + 16), a3);
}

uint64_t sub_1D2AB46E4()
{
  uint64_t v0;

  return sub_1D2AA8F6C(v0 + 16);
}

uint64_t sub_1D2AB46EC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D2AB470C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

double sub_1D2AB4734@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v6);
  v4 = v7;
  if (v7)
  {
    v5 = v6;
    *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(a1 + 32) = &protocol witness table for String;
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1D2AB47AC(uint64_t a1)
{
  uint64_t v1;

  return sub_1D2AA907C(a1, v1 + 16);
}

_QWORD *sub_1D2AB47B4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1D2AB05DC(a1, a2, *(_QWORD *(**)(char *__return_ptr, _QWORD **))(v3 + 16), a3);
}

id sub_1D2AB47D0()
{
  uint64_t v0;

  return sub_1D2AA9080(v0 + 16);
}

double sub_1D2AB47D8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  double result;
  uint64_t v5;

  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  v3 = v5;
  if (v5)
  {
    *(_QWORD *)(a1 + 24) = sub_1D2A9D738(0, (unint64_t *)&unk_1EFC9B250);
    *(_QWORD *)(a1 + 32) = &protocol witness table for ACHCodableAchievementArray;
    *(_QWORD *)a1 = v3;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

id sub_1D2AB4854(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1D2AA9190(a1, a2, v2 + 16);
}

double sub_1D2AB485C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1D2AB0500(a1, a2, *(void (**)(uint64_t *__return_ptr, _QWORD *))(v3 + 16), (unint64_t *)&qword_1ED978DB8, (uint64_t)&protocol witness table for ACHCodableAchievement, a3);
}

id sub_1D2AB4890(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1D2AA9200(a1, a2, v2 + 16);
}

uint64_t sub_1D2AB4898@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, a1[1]);
  *a2 = result;
  return result;
}

double sub_1D2AB48C8@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1D2AB0500(a1, a2, *(void (**)(uint64_t *__return_ptr, _QWORD *))(v3 + 16), (unint64_t *)&unk_1EFC9B240, (uint64_t)&protocol witness table for ACHCodableTemplateArray, a3);
}

uint64_t sub_1D2AB48FC(void *a1)
{
  uint64_t v1;

  return sub_1D2AA9300(a1, v1 + 16);
}

void sub_1D2AB4904(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  sub_1D2AB041C(a1, a2, *(void (**)(char *__return_ptr, uint64_t *))(v3 + 16), (Class *)0x1E0CF5040, (uint64_t (*)(uint64_t, unint64_t))sub_1D2AA5C68, a3);
}

uint64_t sub_1D2AB4930(void *a1)
{
  uint64_t v1;

  return sub_1D2AA9308(a1, v1 + 16);
}

id sub_1D2AB493C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1D2AA9310(a1, a2, v2 + 16);
}

uint64_t sub_1D2AB4944()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D2AB4968()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1D2AB4990@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1D2AB0358(a1, a2, *(void (**)(char *__return_ptr, _QWORD *))(v3 + 16), a3);
}

id sub_1D2AB49AC(uint64_t a1)
{
  uint64_t v1;

  return sub_1D2AA9318(a1, v1 + 16);
}

uint64_t sub_1D2AB49B4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1D2AB49E0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1D2AB0294(a1, a2, *(void (**)(char *__return_ptr, uint64_t *))(v3 + 16), a3);
}

uint64_t sub_1D2AB49FC(void *a1)
{
  uint64_t v1;

  return sub_1D2AA9320(a1, v1 + 16);
}

void sub_1D2AB4A04(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  sub_1D2AB041C(a1, a2, *(void (**)(char *__return_ptr, uint64_t *))(v3 + 16), (Class *)0x1E0CF5030, (uint64_t (*)(uint64_t, unint64_t))sub_1D2AA5C68, a3);
}

uint64_t sub_1D2AB4A30(void *a1)
{
  uint64_t v1;

  return sub_1D2AA9328(a1, v1 + 16);
}

uint64_t sub_1D2AB4A3C(void *a1)
{
  uint64_t v1;

  return sub_1D2AA9330(a1, v1 + 16);
}

void sub_1D2AB4A44(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  sub_1D2AB041C(a1, a2, *(void (**)(char *__return_ptr, uint64_t *))(v3 + 16), (Class *)0x1E0CF5020, (uint64_t (*)(uint64_t, unint64_t))sub_1D2AA5C68, a3);
}

uint64_t objectdestroy_19Tm()
{
  id *v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

BOOL sub_1D2AB4ABC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1D2AA9338(a1, a2, v2 + 16);
}

uint64_t sub_1D2AB4AC4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, a1[1]);
  *a2 = result;
  return result;
}

void sub_1D2AB4B00(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1D2AB4904(a1, a2, a3);
}

void sub_1D2AB4B14(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1D2AB4A04(a1, a2, a3);
}

uint64_t sub_1D2AB4B28@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1D2AB4990(a1, a2, a3);
}

uint64_t sub_1D2AB4BDC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1D2AB4BE4()
{
  uint64_t result;

  result = sub_1D2AB6688();
  qword_1ED9790D0 = result;
  return result;
}

uint64_t sub_1D2AB4C18(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint32_t v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD aBlock[6];
  int out_token;
  uint64_t v26;

  v2 = v1;
  v26 = *MEMORY[0x1E0C80C00];
  v4 = sub_1D2AB664C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_DWORD *)(v2 + 24) = -1;
  *(_QWORD *)(v2 + 16) = a1;
  out_token = -1;
  v8 = (const char *)*MEMORY[0x1E0D22020];
  sub_1D2AAED70();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF540], v4);
  v9 = a1;
  v10 = sub_1D2AB6898();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v11 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_1D2AB50F4;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D2AAF03C;
  aBlock[3] = &block_descriptor_5;
  v12 = _Block_copy(aBlock);
  swift_release();
  v13 = notify_register_dispatch(v8, &out_token, v10, v12);
  _Block_release(v12);

  if (v13)
    v14 = 1;
  else
    v14 = out_token == -1;
  if (v14)
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v15 = sub_1D2AB6634();
    __swift_project_value_buffer(v15, (uint64_t)qword_1ED9786E8);
    v16 = sub_1D2AB661C();
    v17 = sub_1D2AB6868();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v18 = 67240192;
      LODWORD(aBlock[0]) = v13;
      sub_1D2AB68E0();
      _os_log_impl(&dword_1D2A96000, v16, v17, "Error registering for Fitness Coaching Suppression State Changed, result: %{public}u", v18, 8u);
      MEMORY[0x1D8242734](v18, -1, -1);
    }

  }
  else
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v19 = sub_1D2AB6634();
    __swift_project_value_buffer(v19, (uint64_t)qword_1ED9786E8);
    v20 = sub_1D2AB661C();
    v21 = sub_1D2AB6874();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D2A96000, v20, v21, "Registered for Fitness Coaching Suppression State Changed", v22, 2u);
      MEMORY[0x1D8242734](v22, -1, -1);
    }

    *(_DWORD *)(v2 + 24) = out_token;
  }
  return v2;
}

uint64_t sub_1D2AB4F5C()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1D2AB50FC();
    return swift_release();
  }
  return result;
}

uint64_t sub_1D2AB4FB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (*(_DWORD *)(v0 + 24) != -1)
  {
    if (qword_1ED9788D8 != -1)
      swift_once();
    v2 = sub_1D2AB6634();
    __swift_project_value_buffer(v2, (uint64_t)qword_1ED9786E8);
    v3 = sub_1D2AB661C();
    v4 = sub_1D2AB6874();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D2A96000, v3, v4, "Unregistered for Fitness Coaching Suppression State Changed", v5, 2u);
      MEMORY[0x1D8242734](v5, -1, -1);
    }

    notify_cancel(*(_DWORD *)(v1 + 24));
    *(_DWORD *)(v1 + 24) = -1;
  }

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FitnessCoachingNotificationSuppressionProvider()
{
  return objc_opt_self();
}

uint64_t sub_1D2AB50D0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D2AB50F4()
{
  return sub_1D2AB4F5C();
}

void sub_1D2AB50FC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  id v5;

  if (qword_1ED9788D8 != -1)
    swift_once();
  v0 = sub_1D2AB6634();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED9786E8);
  v1 = sub_1D2AB661C();
  v2 = sub_1D2AB6874();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D2A96000, v1, v2, "Received Fitness Coaching Suppression State Changed notification", v3, 2u);
    MEMORY[0x1D8242734](v3, -1, -1);
  }

  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v5 = v4;
  if (qword_1ED978578 != -1)
  {
    swift_once();
    v4 = v5;
  }
  objc_msgSend(v4, sel_postNotificationName_object_, qword_1ED9790D0, 0);

}

uint64_t sub_1D2AB523C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978748);
  v0 = sub_1D2AB6604();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1D2AB80E0;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E0CB1130], v0);
  v6(v5 + v2, *MEMORY[0x1E0CB1160], v0);
  v6(v5 + 2 * v2, *MEMORY[0x1E0CB1158], v0);
  v7 = sub_1D2AB5348(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  result = swift_deallocClassInstance();
  qword_1ED9790D8 = v7;
  return result;
}

uint64_t sub_1D2AB5348(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_1D2AB6604();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED978740);
    v10 = sub_1D2AB6A24();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_1D2AB55A0(&qword_1ED9787C8, MEMORY[0x1E0CB11D0]);
      v14 = sub_1D2AB6670();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_1D2AB55A0(&qword_1ED9787D0, MEMORY[0x1E0CB11D8]);
          v20 = sub_1D2AB667C();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E8];
  }
  return result;
}

uint64_t sub_1D2AB55A0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1D2AB6604();
    result = MEMORY[0x1D82426B0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1D2AB55E0(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1D2AB6AC0();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC9AF98);
      v3 = sub_1D2AB6A24();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_1D2AB6AC0();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x1E0DEE9E8];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v41 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v39 = v1;
    while (1)
    {
      v8 = MEMORY[0x1D8242098](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = sub_1D2AB68B0();
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        sub_1D2A9BC78();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = sub_1D2AB68BC();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v39;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_1D2AB68BC();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v39;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v41)
        return;
    }
  }
  v24 = 0;
  v40 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v40)
  {
    v25 = *(id *)(v1 + 32 + 8 * v24);
    v26 = sub_1D2AB68B0();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_1D2A9BC78();
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_1D2AB68BC();

      if ((v33 & 1) != 0)
        goto LABEL_24;
      v34 = ~v27;
      v28 = (v28 + 1) & v34;
      v29 = v28 >> 6;
      v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
      v31 = 1 << v28;
      if ((v30 & (1 << v28)) != 0)
      {
        while (1)
        {
          v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
          v36 = sub_1D2AB68BC();

          if ((v36 & 1) != 0)
            break;
          v28 = (v28 + 1) & v34;
          v29 = v28 >> 6;
          v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
          v31 = 1 << v28;
          if ((v30 & (1 << v28)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v41;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v41;
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

Swift::String __swiftcall Platform.appBundle()()
{
  char v0;
  BOOL v1;
  uint64_t v2;
  void *v3;
  Swift::String result;

  v1 = (v0 & 0xFE) == 0;
  if ((v0 & 0xFE) != 0)
    v2 = 0xD00000000000001CLL;
  else
    v2 = 0xD000000000000011;
  if (v1)
    v3 = (void *)0x80000001D2AB8F10;
  else
    v3 = (void *)0x80000001D2AB8EF0;
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_1D2AB5974()
{
  unsigned __int8 *v0;
  __int128 v2;

  BYTE8(v2) = 0;
  *(_QWORD *)&v2 = *v0;
  sub_1D2AB6A9C();
  return *(_QWORD *)((char *)&v2 + 1);
}

Swift::Void __swiftcall Logger.trace(file:function:)(Swift::String file, Swift::String function)
{
  Swift::String v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  NSObject *oslog;
  uint64_t v7;

  v2 = Logger.path(file:function:)(file, function);
  swift_bridgeObjectRetain();
  oslog = sub_1D2AB661C();
  v3 = sub_1D2AB6874();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v7 = v5;
    *(_DWORD *)v4 = 136446210;
    swift_bridgeObjectRetain();
    sub_1D2A9CC8C(v2._countAndFlagsBits, (unint64_t)v2._object, &v7);
    sub_1D2AB68E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D2A96000, oslog, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D8242734](v5, -1, -1);
    MEMORY[0x1D8242734](v4, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
}

uint64_t _s22ActivityAwardsServices9LogOutputPAAE03logE0SSvg_0()
{
  sub_1D2AB6B08();
  return 0;
}

uint64_t sub_1D2AB5B80(uint64_t a1)
{
  return sub_1D2A98AAC(a1, qword_1ED9786E8);
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D2A98DCC(&qword_1ED9788D8, (uint64_t)qword_1ED9786E8, a1);
}

uint64_t sub_1D2AB5BBC(uint64_t a1)
{
  return sub_1D2A98AAC(a1, qword_1ED978B00);
}

uint64_t static Log.query.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D2A98DCC(&qword_1ED978AF8, (uint64_t)qword_1ED978B00, a1);
}

uint64_t sub_1D2AB5BF4(uint64_t a1)
{
  return sub_1D2A98AAC(a1, qword_1EFC9B260);
}

uint64_t static Log.testing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D2A98DCC(&qword_1EFC9AB80, (uint64_t)qword_1EFC9B260, a1);
}

Swift::String __swiftcall Logger.path(file:function:)(Swift::String file, Swift::String function)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _opaque_pthread_t *v23;
  uint64_t v24;
  void *v25;
  Swift::String result;

  object = function._object;
  countAndFlagsBits = function._countAndFlagsBits;
  v4 = file._object;
  v5 = file._countAndFlagsBits;
  sub_1D2AA0464();
  v6 = sub_1D2AB68F8();
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = v6 + 16 * v7;
    v5 = *(_QWORD *)(v8 + 16);
    v4 = *(void **)(v8 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_1D2AB5EB4(46, 0xE100000000000000, v5, (unint64_t)v4);
  v9 = sub_1D2AB6754();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_bridgeObjectRelease();
  MEMORY[0x1D8241CFC](v9, v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_1D2AB5EB4(40, 0xE100000000000000, countAndFlagsBits, (unint64_t)object);
  swift_bridgeObjectRetain();
  v16 = sub_1D2AB6754();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  swift_bridgeObjectRelease();
  MEMORY[0x1D8241CFC](v16, v18, v20, v22);
  swift_bridgeObjectRelease();
  v23 = pthread_self();
  pthread_mach_thread_np(v23);
  sub_1D2AB6AFC();
  sub_1D2AB66DC();
  swift_bridgeObjectRelease();
  sub_1D2AB66DC();
  sub_1D2AB66DC();
  swift_bridgeObjectRelease();
  sub_1D2AB66DC();
  sub_1D2AB66DC();
  swift_bridgeObjectRelease();
  v24 = 91;
  v25 = (void *)0xE100000000000000;
  result._object = v25;
  result._countAndFlagsBits = v24;
  return result;
}

unint64_t sub_1D2AB5EB4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;

  v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v4 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return 0;
  v7 = 4 * v4;
  v8 = 15;
  while (sub_1D2AB673C() != a1 || v9 != a2)
  {
    v10 = sub_1D2AB6B14();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return v8;
    v8 = sub_1D2AB66D0();
    if (v7 == v8 >> 14)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1D2AB5FA4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1D2AB5FB4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1D2AB5FE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1D2AB6008(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1D2A9CC8C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1D2AB68E0();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1D2AB6078(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1D2AB610C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1D2AB6280(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1D2AB6280(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D2AB610C(uint64_t a1, unint64_t a2)
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
      v3 = sub_1D2AA04A8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1D2AB6A3C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1D2AB6AA8();
      __break(1u);
LABEL_10:
      v2 = sub_1D2AB66F4();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1D2AB6AF0();
    __break(1u);
LABEL_14:
    result = sub_1D2AB6AA8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

uint64_t sub_1D2AB6280(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC9ACC0);
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
  result = sub_1D2AB6AF0();
  __break(1u);
  return result;
}

_BYTE **sub_1D2AB63CC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t dispatch thunk of LogOutput.logOutput.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t ACHCodableAchievementArray.serialized()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1D2AB6550();

  return v3;
}

uint64_t sub_1D2AB6460()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1D2AB646C()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1D2AB6478()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1D2AB6484()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1D2AB6490()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1D2AB649C()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1D2AB64A8()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_1D2AB64B4()
{
  return MEMORY[0x1E0CAE9B0]();
}

uint64_t sub_1D2AB64C0()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1D2AB64CC()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_1D2AB64D8()
{
  return MEMORY[0x1E0CAEA20]();
}

uint64_t sub_1D2AB64E4()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1D2AB64F0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D2AB64FC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D2AB6508()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_1D2AB6514()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1D2AB6520()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1D2AB652C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1D2AB6538()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1D2AB6544()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1D2AB6550()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D2AB655C()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1D2AB6568()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1D2AB6574()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1D2AB6580()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1D2AB658C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1D2AB6598()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1D2AB65A4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1D2AB65B0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D2AB65BC()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1D2AB65C8()
{
  return MEMORY[0x1E0CB1028]();
}

uint64_t sub_1D2AB65D4()
{
  return MEMORY[0x1E0CB1050]();
}

uint64_t sub_1D2AB65E0()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1D2AB65EC()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1D2AB65F8()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1D2AB6604()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1D2AB6610()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1D2AB661C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D2AB6628()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D2AB6634()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D2AB6640()
{
  return MEMORY[0x1E0DF2040]();
}

uint64_t sub_1D2AB664C()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1D2AB6658()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D2AB6664()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1D2AB6670()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1D2AB667C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1D2AB6688()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D2AB6694()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D2AB66A0()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1D2AB66AC()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1D2AB66B8()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1D2AB66C4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D2AB66D0()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1D2AB66DC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D2AB66E8()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1D2AB66F4()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D2AB6700()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1D2AB670C()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1D2AB6718()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1D2AB6724()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1D2AB6730()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1D2AB673C()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1D2AB6748()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1D2AB6754()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1D2AB6760()
{
  return MEMORY[0x1E0DEACC0]();
}

uint64_t sub_1D2AB676C()
{
  return MEMORY[0x1E0DEAD38]();
}

uint64_t sub_1D2AB6778()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1D2AB6784()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D2AB6790()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1D2AB679C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D2AB67A8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D2AB67B4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1D2AB67C0()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1D2AB67CC()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1D2AB67D8()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D2AB67E4()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1D2AB67F0()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1D2AB67FC()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D2AB6808()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D2AB6814()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1D2AB6820()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1D2AB682C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1D2AB6838()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1D2AB6844()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1D2AB6850()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1D2AB685C()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1D2AB6868()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D2AB6874()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1D2AB6880()
{
  return MEMORY[0x1E0CB4598]();
}

uint64_t sub_1D2AB688C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1D2AB6898()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1D2AB68A4()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1D2AB68B0()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1D2AB68BC()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1D2AB68C8()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D2AB68D4()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1D2AB68E0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D2AB68EC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D2AB68F8()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1D2AB6904()
{
  return MEMORY[0x1E0CB24B8]();
}

uint64_t sub_1D2AB6910()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1D2AB691C()
{
  return MEMORY[0x1E0DEFF58]();
}

uint64_t sub_1D2AB6928()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1D2AB6934()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1D2AB6940()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1D2AB694C()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1D2AB6958()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1D2AB6964()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1D2AB6970()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1D2AB697C()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1D2AB6988()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1D2AB6994()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1D2AB69A0()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1D2AB69AC()
{
  return MEMORY[0x1E0DEC108]();
}

uint64_t sub_1D2AB69B8()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1D2AB69C4()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1D2AB69D0()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1D2AB69DC()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D2AB69E8()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1D2AB69F4()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1D2AB6A00()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1D2AB6A0C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1D2AB6A18()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1D2AB6A24()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1D2AB6A30()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1D2AB6A3C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D2AB6A48()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1D2AB6A54()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D2AB6A60()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1D2AB6A6C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1D2AB6A78()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1D2AB6A84()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1D2AB6A90()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1D2AB6A9C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1D2AB6AA8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D2AB6AB4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D2AB6AC0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1D2AB6ACC()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1D2AB6AD8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1D2AB6AE4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D2AB6AF0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D2AB6AFC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D2AB6B08()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1D2AB6B14()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D2AB6B20()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1D2AB6B2C()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1D2AB6B38()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1D2AB6B44()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D2AB6B50()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1D2AB6B5C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1D2AB6B68()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D2AB6B74()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D2AB6B80()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D2AB6B8C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t ACHCodableFromAchievement()
{
  return MEMORY[0x1E0CF4F60]();
}

uint64_t ACHCodableFromTemplate()
{
  return MEMORY[0x1E0CF4F68]();
}

uint64_t ACHCompanionHistoricalEvaluationPolicy()
{
  return MEMORY[0x1E0CF5060]();
}

uint64_t ACHDateComponentsAreEqualForYearMonthDay()
{
  return MEMORY[0x1E0CF4F70]();
}

uint64_t ACHGizmoHistoricalEvaluationPolicy()
{
  return MEMORY[0x1E0CF5068]();
}

uint64_t ACHPairedWatchCountryCode()
{
  return MEMORY[0x1E0CF4F98]();
}

uint64_t ACHTemplateIsMonthlyChallenge()
{
  return MEMORY[0x1E0CF4FA8]();
}

uint64_t ACHTemplateIsRemote()
{
  return MEMORY[0x1E0CF4FB0]();
}

uint64_t ACHTinkerHistoricalEvaluationPolicy()
{
  return MEMORY[0x1E0CF5070]();
}

uint64_t ACHTriggerOptionsToString()
{
  return MEMORY[0x1E0CF4FC8]();
}

uint64_t ACHYearMonthDayDateComponentsFromString()
{
  return MEMORY[0x1E0CF4FD0]();
}

uint64_t ACHYearMonthDayStringFromDateComponents()
{
  return MEMORY[0x1E0CF4FD8]();
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  return MEMORY[0x1E0D216F8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x1E0DE2C08]();
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x1E0C811A0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C826D0](*(_QWORD *)&a1, a2, a3);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

