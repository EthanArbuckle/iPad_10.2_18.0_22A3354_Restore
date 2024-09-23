id HomeManager.manager.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager);
}

id HomeManager.accessorySettingsDataSource.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_accessorySettingsDataSource);
}

char *HomeManager.__allocating_init(homeDelegate:options:cachePolicy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return HomeManager.init(homeDelegate:options:cachePolicy:)(a1, a2, a3);
}

char *HomeManager.init(homeDelegate:options:cachePolicy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  char *v15;
  char *v16;
  void *v17;
  char *v18;
  id v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  uint64_t v28;

  v24 = a2;
  v25 = a3;
  v26 = a1;
  v23 = sub_2147B1F14();
  v4 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2147B1F08();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_2147B1E9C();
  MEMORY[0x24BDAC7A8]();
  v3[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoaded] = 0;
  v22 = OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_serialQueue;
  v21[1] = sub_2147AFA80(0, &qword_254D85ED0);
  v8 = v3;
  sub_2147B1E90();
  v28 = MEMORY[0x24BEE4AF8];
  sub_2147AF9D4(&qword_254D85ED8, v7, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85EE0);
  sub_2147AFA14(&qword_254D85EE8, &qword_254D85EE0);
  sub_2147B1F8C();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5750], v23);
  *(_QWORD *)&v3[v22] = sub_2147B1F2C();
  *(_QWORD *)&v8[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoadedHandlers] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v8[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homeDelegate] = 0;
  v9 = objc_allocWithZone(MEMORY[0x24BDD7838]);
  v10 = objc_msgSend(v9, sel_initWithOptions_cachePolicy_, v24, v25);
  objc_msgSend(v10, sel_setDiscretionary_, 0);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
  objc_msgSend(v10, sel_setDelegateQueue_, v11);

  objc_msgSend(v10, sel_setAdaptive_, 1);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD76D8]), sel_initWithConfiguration_, v10);
  *(_QWORD *)&v8[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager] = v12;
  v13 = objc_msgSend(v12, sel_createAccessorySettingsDataSource);
  *(_QWORD *)&v8[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_accessorySettingsDataSource] = v13;

  v14 = (objc_class *)type metadata accessor for HomeManager();
  v27.receiver = v8;
  v27.super_class = v14;
  v15 = (char *)objc_msgSendSuper2(&v27, sel_init);
  *(_QWORD *)&v15[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homeDelegate] = v26;
  v16 = v15;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v17 = *(void **)&v16[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager];
  v18 = v16;
  v19 = v17;
  objc_msgSend(v19, sel_setDelegate_, v18);

  swift_unknownObjectRelease();
  return v18;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D56AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D56B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for HomeManager()
{
  return objc_opt_self();
}

id HomeManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *HomeManager.init()()
{
  id v0;
  char *v1;

  v0 = objc_allocWithZone((Class)type metadata accessor for HomeManager());
  v1 = HomeManager.init(homeDelegate:options:cachePolicy:)(0, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v1;
}

uint64_t sub_2147AEEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_2147B1E84();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2147B1E9C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *(_QWORD *)(v3 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_serialQueue);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v14;
  v15[3] = a1;
  v15[4] = a2;
  aBlock[4] = sub_2147AF9B0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2147AF28C;
  aBlock[3] = &block_descriptor;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_2147B1E90();
  v20 = MEMORY[0x24BEE4AF8];
  sub_2147AF9D4(&qword_254D85F00, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85F08);
  sub_2147AFA14(&qword_254D85F10, &qword_254D85F08);
  sub_2147B1F8C();
  MEMORY[0x2199D5280](0, v13, v9, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_release();
  return swift_release();
}

void sub_2147AF134(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x2199D5760](v5);
  if (v6)
  {
    v7 = (char *)v6;
    if ((*(_BYTE *)(v6 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoaded) & 1) != 0)
    {
      a2();
    }
    else
    {
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = a2;
      *(_QWORD *)(v8 + 24) = a3;
      v9 = &v7[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoadedHandlers];
      swift_beginAccess();
      v10 = *(_QWORD **)v9;
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)v9 = v10;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v10 = sub_2147AFBD0(0, v10[2] + 1, 1, v10);
        *(_QWORD *)v9 = v10;
      }
      v13 = v10[2];
      v12 = v10[3];
      if (v13 >= v12 >> 1)
      {
        v10 = sub_2147AFBD0((_QWORD *)(v12 > 1), v13 + 1, 1, v10);
        *(_QWORD *)v9 = v10;
      }
      v10[2] = v13 + 1;
      v14 = &v10[2 * v13];
      v14[4] = sub_2147AFBB0;
      v14[5] = v8;
      swift_endAccess();
    }

  }
  else
  {
    a2();
  }
}

uint64_t sub_2147AF28C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_2147AF2B8()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;

  v0 = dispatch_group_create();
  dispatch_group_enter(v0);
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v0;
  v2 = v0;
  sub_2147AEEFC((uint64_t)sub_2147AFA78, v1);
  swift_release();
  sub_2147B1EFC();

}

uint64_t sub_2147AF334()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;

  v1 = v0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  v4 = v2;
  sub_2147AEEFC((uint64_t)sub_2147AFDEC, v3);
  swift_release();
  sub_2147B1EFC();

  v5 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager), sel_homes));
  sub_2147AFA80(0, &qword_254D85F18);
  v6 = sub_2147B1ED8();

  return v6;
}

id sub_2147AF404()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager), sel_currentHome));
}

id sub_2147AF430()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_manager), sel_currentAccessory));
}

id HomeManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall HomeManager.homeManagerDidUpdateHomes(_:)(HMHomeManager a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  HMHomeManager *v13;
  void *v14;
  objc_class *v15;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_2147B1E84();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v17 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2147B1E9C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = *(_QWORD *)(v2 + OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_serialQueue);
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v13 = (HMHomeManager *)swift_allocObject();
  v13[2].super.isa = (Class)v12;
  v13[3].super.isa = a1.super.isa;
  aBlock[4] = sub_2147AFAE4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2147AF28C;
  aBlock[3] = &block_descriptor_17;
  v14 = _Block_copy(aBlock);
  swift_retain();
  v15 = a1.super.isa;
  sub_2147B1E90();
  v18 = MEMORY[0x24BEE4AF8];
  sub_2147AF9D4(&qword_254D85F00, v5, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85F08);
  sub_2147AFA14(&qword_254D85F10, &qword_254D85F08);
  sub_2147B1F8C();
  MEMORY[0x2199D5280](0, v11, v7, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  swift_release();
}

uint64_t sub_2147AF720(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  _BYTE *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;

  v3 = a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x2199D5760](v3);
  if (!result)
    return result;
  v5 = (_BYTE *)result;
  v6 = objc_msgSend(a2, sel_homes);
  sub_2147AFA80(0, &qword_254D85F18);
  v7 = sub_2147B1ED8();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_2147B1FC8();
    v8 = result;
    if (result)
      goto LABEL_4;
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_4:
      if (v8 < 1)
      {
        __break(1u);
        return result;
      }
      v9 = 0;
      v10 = OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homeDelegate;
      do
      {
        if ((v7 & 0xC000000000000001) != 0)
          v11 = (id)MEMORY[0x2199D5304](v9, v7);
        else
          v11 = *(id *)(v7 + 8 * v9 + 32);
        v12 = v11;
        ++v9;
        objc_msgSend(v11, sel_setDelegate_, *(_QWORD *)&v5[v10]);

      }
      while (v8 != v9);
    }
  }
  swift_bridgeObjectRelease_n();
  v5[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoaded] = 1;
  v13 = &v5[OBJC_IVAR____TtC18HomeMessagingUtils11HomeManager_homesLoadedHandlers];
  swift_beginAccess();
  v14 = *(_QWORD *)v13;
  v15 = *(_QWORD *)(*(_QWORD *)v13 + 16);
  if (v15)
  {
    swift_bridgeObjectRetain();
    v16 = v14 + 40;
    do
    {
      v17 = *(void (**)(uint64_t))(v16 - 8);
      v18 = swift_retain();
      v17(v18);
      swift_release();
      v16 += 16;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)v13 = MEMORY[0x24BEE4AF8];

  return swift_bridgeObjectRelease();
}

uint64_t sub_2147AF960()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2147AF984()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2147AF9B0()
{
  uint64_t v0;

  sub_2147AF134(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24), *(_QWORD *)(v0 + 32));
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

uint64_t sub_2147AF9D4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199D56C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2147AFA14(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199D56C4](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2147AFA54()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2147AFA78()
{
  uint64_t v0;

  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t sub_2147AFA80(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2147AFAB8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2147AFAE4()
{
  uint64_t v0;

  return sub_2147AF720(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t method lookup function for HomeManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HomeManager.__allocating_init(homeDelegate:options:cachePolicy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of HomeManager.loadHomes(completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HomeManager.waitForHomesToLoad()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HomeManager.homes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HomeManager.currentHome.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of HomeManager.currentAccessory.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t sub_2147AFB8C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2147AFBB0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

_QWORD *sub_2147AFBD0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D85FA8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2147AFCDC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2147AFCDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D85FB0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2147B1FD4();
  __break(1u);
  return result;
}

uint64_t sub_2147AFDF8()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init);
  type metadata accessor for ContactStore();
  v1 = swift_allocObject();
  sub_2147B1E48();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate + 8) = 0;
  result = swift_unknownObjectWeakInit();
  *(_QWORD *)(v1 + 16) = v0;
  qword_254D85FC0 = v1;
  return result;
}

uint64_t ContactStore.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(id))(v0 + 160))(objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init));
}

uint64_t static ContactStore.sharedContactStore.getter()
{
  if (qword_254D85C60 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_2147AFF24(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  sub_2147AFF98();
  return swift_unknownObjectRelease();
}

uint64_t sub_2147AFF98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D860F8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2147B1F68();
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2147B1F38();
  v22 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D86100);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber))
  {
    swift_retain();
    sub_2147B1E60();
    swift_release();
  }
  *(_QWORD *)(v0 + v14) = 0;
  swift_release();
  v15 = v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  v16 = MEMORY[0x2199D5760](v15);
  result = swift_unknownObjectRelease();
  if (v16)
  {
    v18 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    sub_2147B1F44();

    sub_2147B1F5C();
    v25 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
    v19 = sub_2147B1F50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v3, 1, 1, v19);
    sub_2147AFA80(0, &qword_254D86108);
    sub_2147B1CD8();
    v21 = v11;
    sub_2147B1D20();
    sub_2147B1E6C();
    sub_2147B1D78((uint64_t)v3);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v24);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v7);
    swift_allocObject();
    swift_weakInit();
    sub_2147B1DE4();
    v20 = sub_2147B1E78();
    swift_release();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v10);
    *(_QWORD *)(v1 + v14) = v20;
    return swift_release();
  }
  return result;
}

uint64_t sub_2147B02C0()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = result + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
    swift_beginAccess();
    if (MEMORY[0x2199D5760](v2))
    {
      v3 = *(_QWORD *)(v2 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(v1, ObjectType, v3);
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2147B0378()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  return MEMORY[0x2199D5760](v1);
}

uint64_t sub_2147B03C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  sub_2147AFF98();
  return swift_unknownObjectRelease();
}

void (*sub_2147B0430(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x2199D5760](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_2147B04A4;
}

void sub_2147B04A4(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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
    sub_2147AFF98();
  }
  free(v3);
}

uint64_t ContactStore.__allocating_init(contactStore:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  ContactStore.init(contactStore:)(a1);
  return v2;
}

uint64_t ContactStore.init(contactStore:)(uint64_t a1)
{
  uint64_t v1;

  sub_2147B1E48();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t ContactStore.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0;
  v2 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber))
  {
    swift_retain();
    sub_2147B1E60();
    swift_release();
  }
  *(_QWORD *)(v0 + v2) = 0;
  swift_release();

  v3 = v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_logger;
  v4 = sub_2147B1E54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_2147B0690(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate);
  return v1;
}

uint64_t sub_2147B0690(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t ContactStore.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0;
  v2 = OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_subscriber))
  {
    swift_retain();
    sub_2147B1E60();
    swift_release();
  }
  *(_QWORD *)(v0 + v2) = 0;
  swift_release();

  v3 = v0 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_logger;
  v4 = sub_2147B1E54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_2147B0690(v1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate);
  return swift_deallocClassInstance();
}

CNContact_optional __swiftcall ContactStore.contact(forPhoneNumber:keys:)(Swift::String forPhoneNumber, Swift::OpaquePointer keys)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  Swift::Bool v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  objc_class *v28;
  id v29[2];
  CNContact_optional result;

  object = forPhoneNumber._object;
  countAndFlagsBits = forPhoneNumber._countAndFlagsBits;
  v29[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = objc_allocWithZone(MEMORY[0x24BDBAD88]);
  swift_bridgeObjectRetain();
  v6 = (void *)sub_2147B1EA8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithStringValue_, v6);

  v8 = objc_msgSend((id)objc_opt_self(), sel_predicateForContactsMatchingPhoneNumber_, v7);
  v9 = *(void **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85FD8);
  v10 = (void *)sub_2147B1ECC();
  v29[0] = 0;
  v11 = objc_msgSend(v9, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v8, v10, v29);

  v12 = v29[0];
  if (v11)
  {
    sub_2147AFA80(0, &qword_254D85FE0);
    v13 = sub_2147B1ED8();
    v14 = v12;

    if (v13 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = sub_2147B1FC8();
      swift_bridgeObjectRelease();
      if (v15)
        goto LABEL_4;
    }
    else
    {
      v15 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v15)
      {
LABEL_4:
        if ((v13 & 0xC000000000000001) != 0)
        {
          v16 = (id)MEMORY[0x2199D5304](0, v13);
        }
        else
        {
          if (!*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
            __break(1u);
          v16 = *(id *)(v13 + 32);
        }
        v15 = (uint64_t)v16;
      }
    }

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v18 = v29[0];
  v19 = (void *)sub_2147B1E30();

  swift_willThrow();
  swift_bridgeObjectRetain();
  v20 = v19;
  swift_bridgeObjectRetain();
  v21 = v19;
  v22 = sub_2147B1E3C();
  v23 = sub_2147B1EF0();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = (void *)swift_slowAlloc();
    v29[0] = v25;
    *(_DWORD *)v24 = 136315394;
    swift_bridgeObjectRetain();
    sub_2147B141C(countAndFlagsBits, (unint64_t)object, (uint64_t *)v29);
    sub_2147B1F74();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 12) = 2080;
    swift_getErrorValue();
    v26 = sub_2147B1FE0();
    sub_2147B141C(v26, v27, (uint64_t *)v29);
    sub_2147B1F74();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147A9000, v22, v23, "Failed to find contact with phone number %s %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199D5718](v25, -1, -1);
    MEMORY[0x2199D5718](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v15 = 0;
LABEL_13:
  v28 = (objc_class *)v15;
  result.value.super.isa = v28;
  result.is_nil = v17;
  return result;
}

CNContact_optional __swiftcall ContactStore.contact(forEmailAddress:keys:)(Swift::String forEmailAddress, Swift::OpaquePointer keys)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  Swift::Bool v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  objc_class *v27;
  id v28[2];
  CNContact_optional result;

  object = forEmailAddress._object;
  countAndFlagsBits = forEmailAddress._countAndFlagsBits;
  v28[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_2147B1EA8();
  v7 = objc_msgSend(v5, sel_predicateForContactsMatchingEmailAddress_, v6);

  v8 = *(void **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85FD8);
  v9 = (void *)sub_2147B1ECC();
  v28[0] = 0;
  v10 = objc_msgSend(v8, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v7, v9, v28);

  v11 = v28[0];
  if (v10)
  {
    sub_2147AFA80(0, &qword_254D85FE0);
    v12 = sub_2147B1ED8();
    v13 = v11;

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      v14 = sub_2147B1FC8();
      swift_bridgeObjectRelease();
      if (v14)
        goto LABEL_4;
    }
    else
    {
      v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v14)
      {
LABEL_4:
        if ((v12 & 0xC000000000000001) != 0)
        {
          v15 = (id)MEMORY[0x2199D5304](0, v12);
        }
        else
        {
          if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
            __break(1u);
          v15 = *(id *)(v12 + 32);
        }
        v14 = (uint64_t)v15;
      }
    }
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  v17 = v28[0];
  v18 = (void *)sub_2147B1E30();

  swift_willThrow();
  swift_bridgeObjectRetain();
  v19 = v18;
  swift_bridgeObjectRetain();
  v20 = v18;
  v21 = sub_2147B1E3C();
  v22 = sub_2147B1EF0();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = swift_slowAlloc();
    v24 = (void *)swift_slowAlloc();
    v28[0] = v24;
    *(_DWORD *)v23 = 136315394;
    swift_bridgeObjectRetain();
    sub_2147B141C(countAndFlagsBits, (unint64_t)object, (uint64_t *)v28);
    sub_2147B1F74();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2080;
    swift_getErrorValue();
    v25 = sub_2147B1FE0();
    sub_2147B141C(v25, v26, (uint64_t *)v28);
    sub_2147B1F74();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2147A9000, v21, v22, "Failed to find contact with email address %s %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199D5718](v24, -1, -1);
    MEMORY[0x2199D5718](v23, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v14 = 0;
LABEL_13:
  v27 = (objc_class *)v14;
  result.value.super.isa = v27;
  result.is_nil = v16;
  return result;
}

CNContact_optional __swiftcall ContactStore.contact(for:keys:)(Swift::String a1, Swift::OpaquePointer_optional keys)
{
  void *object;
  uint64_t countAndFlagsBits;
  Swift::OpaquePointer v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unsigned int v11;
  Swift::String v12;
  objc_class *v13;
  Swift::Bool v14;
  NSObject *v15;
  int v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  objc_class *v23;
  uint64_t v24;
  CNContact_optional result;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  if (keys.value._rawValue)
    v4._rawValue = keys.value._rawValue;
  else
    v4._rawValue = (void *)sub_2147B1A5C();
  swift_bridgeObjectRetain();
  v5 = (void *)sub_2147B1EA8();
  v6 = objc_msgSend(v5, sel_hmu_isEmail);

  v7 = countAndFlagsBits;
  v8 = object;
  if (v6)
  {
    v9 = (unint64_t)ContactStore.contact(forEmailAddress:keys:)(*(Swift::String *)&v7, v4);
    goto LABEL_8;
  }
  v10 = (void *)sub_2147B1EA8();
  v11 = objc_msgSend(v10, sel_hmu_isPhoneNumber);

  if (v11)
  {
    v12._countAndFlagsBits = countAndFlagsBits;
    v12._object = object;
    v9 = (unint64_t)ContactStore.contact(forPhoneNumber:keys:)(v12, v4);
LABEL_8:
    v13 = (objc_class *)v9;
    swift_bridgeObjectRelease();
    if (v13)
      goto LABEL_18;
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  v15 = sub_2147B1E3C();
  v16 = sub_2147B1EF0();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v24 = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain();
    sub_2147B141C(countAndFlagsBits, (unint64_t)object, &v24);
    sub_2147B1F74();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2147A9000, v15, (os_log_type_t)v16, "HMUser userID invalid %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D5718](v18, -1, -1);
    MEMORY[0x2199D5718](v17, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

LABEL_14:
  swift_bridgeObjectRetain_n();
  v19 = sub_2147B1E3C();
  v20 = sub_2147B1EF0();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v24 = v22;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    sub_2147B141C(countAndFlagsBits, (unint64_t)object, &v24);
    sub_2147B1F74();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2147A9000, v19, v20, "No contact found for userID %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D5718](v22, -1, -1);
    MEMORY[0x2199D5718](v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v13 = 0;
LABEL_18:
  v23 = v13;
  result.value.super.isa = v23;
  result.is_nil = v14;
  return result;
}

Swift::String_optional __swiftcall ContactStore.name(for:)(Swift::String a1)
{
  void *object;
  uint64_t countAndFlagsBits;
  id v3;
  uint64_t v4;
  Swift::String v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  Swift::String_optional result;
  Swift::OpaquePointer_optional v15;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACC0]), sel_init);
  objc_msgSend(v3, sel_setStyle_, 1000);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85FE8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2147B29A0;
  *(_QWORD *)(v4 + 32) = objc_msgSend((id)objc_opt_self(), sel_descriptorForRequiredKeysForStyle_, objc_msgSend(v3, sel_style));
  sub_2147B1EE4();
  v5._countAndFlagsBits = countAndFlagsBits;
  v5._object = object;
  v15.value._rawValue = (void *)v4;
  v6 = (void *)ContactStore.contact(for:keys:)(v5, v15);
  swift_bridgeObjectRelease();
  if (!v6)
  {

LABEL_6:
    v9 = 0;
    v11 = 0;
    goto LABEL_7;
  }
  v7 = objc_msgSend(v3, sel_stringFromContact_, v6);
  if (!v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  v9 = sub_2147B1EB4();
  v11 = v10;

LABEL_7:
  v12 = v9;
  v13 = v11;
  result.value._object = v13;
  result.value._countAndFlagsBits = v12;
  return result;
}

CNContact_optional __swiftcall ContactStore.contact(forUser:)(HMUser forUser)
{
  objc_class *v1;
  Swift::Bool v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String v7;
  unint64_t v8;
  CNContact_optional result;
  Swift::OpaquePointer_optional v10;

  v1 = (objc_class *)-[objc_class userID](forUser.super.isa, sel_userID);
  if (v1)
  {
    v3 = v1;
    v4 = sub_2147B1EB4();
    v6 = v5;

    v7._countAndFlagsBits = v4;
    v7._object = v6;
    v10.value._rawValue = 0;
    v8 = (unint64_t)ContactStore.contact(for:keys:)(v7, v10);
    swift_bridgeObjectRelease();
    v1 = (objc_class *)v8;
  }
  result.value.super.isa = v1;
  result.is_nil = v2;
  return result;
}

uint64_t sub_2147B141C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2147B14EC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2147B1C9C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2147B1C9C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2147B14EC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2147B1F80();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2147B16A4(a5, a6);
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
  v8 = sub_2147B1FB0();
  if (!v8)
  {
    sub_2147B1FBC();
    __break(1u);
LABEL_17:
    result = sub_2147B1FD4();
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

uint64_t sub_2147B16A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2147B1738(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2147B1910(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2147B1910(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2147B1738(uint64_t a1, unint64_t a2)
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
      v3 = sub_2147B18AC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2147B1F98();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2147B1FBC();
      __break(1u);
LABEL_10:
      v2 = sub_2147B1EC0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2147B1FD4();
    __break(1u);
LABEL_14:
    result = sub_2147B1FBC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2147B18AC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D860F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2147B1910(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D860F0);
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
  result = sub_2147B1FD4();
  __break(1u);
  return result;
}

uint64_t sub_2147B1A5C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D85FE8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2147B29B0;
  v1 = (void *)*MEMORY[0x24BDBA328];
  v2 = (void *)*MEMORY[0x24BDBA2C8];
  *(_QWORD *)(v0 + 32) = *MEMORY[0x24BDBA328];
  *(_QWORD *)(v0 + 40) = v2;
  v3 = (void *)*MEMORY[0x24BDBA2C0];
  v4 = (void *)*MEMORY[0x24BDBA2F0];
  *(_QWORD *)(v0 + 48) = *MEMORY[0x24BDBA2C0];
  *(_QWORD *)(v0 + 56) = v4;
  v10 = v0;
  sub_2147B1EE4();
  v5 = v1;
  v6 = v2;
  v7 = v3;
  v8 = v4;
  return v10;
}

uint64_t sub_2147B1B0C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC18HomeMessagingUtils12ContactStore_delegate;
  swift_beginAccess();
  result = MEMORY[0x2199D5760](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t dispatch thunk of ContactsStoreDelegate.contactsStoreContactsDidChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_2147B1B70()
{
  return type metadata accessor for ContactStore();
}

uint64_t type metadata accessor for ContactStore()
{
  uint64_t result;

  result = qword_254D86018;
  if (!qword_254D86018)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2147B1BB4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2147B1E54();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ContactStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContactStore.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ContactStore.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ContactStore.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ContactStore.__allocating_init(contactStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
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

uint64_t sub_2147B1C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2147B1CD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D86110;
  if (!qword_254D86110)
  {
    v1 = sub_2147B1F38();
    result = MEMORY[0x2199D56C4](MEMORY[0x24BDD0070], v1);
    atomic_store(result, (unint64_t *)&qword_254D86110);
  }
  return result;
}

unint64_t sub_2147B1D20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D86118;
  if (!qword_254D86118)
  {
    v1 = sub_2147AFA80(255, &qword_254D86108);
    result = MEMORY[0x2199D56C4](MEMORY[0x24BDD0408], v1);
    atomic_store(result, (unint64_t *)&qword_254D86118);
  }
  return result;
}

uint64_t sub_2147B1D78(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D860F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2147B1DB8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2147B1DDC()
{
  return sub_2147B02C0();
}

unint64_t sub_2147B1DE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D86120;
  if (!qword_254D86120)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D86100);
    result = MEMORY[0x2199D56C4](MEMORY[0x24BDB9920], v1);
    atomic_store(result, (unint64_t *)&qword_254D86120);
  }
  return result;
}

uint64_t sub_2147B1E30()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2147B1E3C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2147B1E48()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2147B1E54()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2147B1E60()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_2147B1E6C()
{
  return MEMORY[0x24BDBA0A0]();
}

uint64_t sub_2147B1E78()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2147B1E84()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2147B1E90()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2147B1E9C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2147B1EA8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2147B1EB4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2147B1EC0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2147B1ECC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2147B1ED8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2147B1EE4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2147B1EF0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2147B1EFC()
{
  return MEMORY[0x24BEE5658]();
}

uint64_t sub_2147B1F08()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2147B1F14()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2147B1F20()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2147B1F2C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2147B1F38()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_2147B1F44()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_2147B1F50()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_2147B1F5C()
{
  return MEMORY[0x24BDD03E8]();
}

uint64_t sub_2147B1F68()
{
  return MEMORY[0x24BDD03F0]();
}

uint64_t sub_2147B1F74()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2147B1F80()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2147B1F8C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2147B1F98()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2147B1FA4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2147B1FB0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2147B1FBC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2147B1FC8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2147B1FD4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2147B1FE0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return MEMORY[0x24BE4F958]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

