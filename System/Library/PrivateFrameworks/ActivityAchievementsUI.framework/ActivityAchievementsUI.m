_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_21CC0AF90(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t sub_21CC0AFC0()
{
  return sub_21CC3F6CC();
}

uint64_t sub_21CC0AFE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21CC3F72C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21CC3F720();
}

uint64_t type metadata accessor for AAUIAwardsQuery()
{
  return objc_opt_self();
}

uint64_t sub_21CC0B100()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21CC3F6A8();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t sub_21CC0B1E0()
{
  return sub_21CC3F6C0();
}

uint64_t sub_21CC0B208(unint64_t a1)
{
  return sub_21CC10328(a1, "[AAUIAwardsDataProvider] Received %ld updated achievements", (uint64_t)&unk_24E0B3DB0, (uint64_t)sub_21CC0F114, (uint64_t)&block_descriptor_64_0);
}

uint64_t sub_21CC0B22C(unint64_t a1)
{
  return sub_21CC10328(a1, "[AAUIAwardsDataProvider] Received initial %ld achievements", (uint64_t)&unk_24E0B3E00, (uint64_t)sub_21CC0CF8C, (uint64_t)&block_descriptor_71);
}

void sub_21CC0B250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  _QWORD *v5;
  uint64_t v8;

  v8 = *(_QWORD *)(*v5 + OBJC_IVAR___AAUIAwardsDataProvider_protectedObservers);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  objc_msgSend(*(id *)(v8 + 16), *a5, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
}

uint64_t sub_21CC0B2AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_21CC3F5C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_21CC3F5B8();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AAUIAwardsDataProvider.activate(isFitnessPlusSubscriber:)(Swift::Bool isFitnessPlusSubscriber)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  void *v9;

  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x250))() & 1) == 0)
  {
    (*(void (**)(uint64_t))((*v3 & *v1) + 0x258))(1);
    v4 = (*(uint64_t (**)(Swift::Bool))((*v3 & *v1) + 0x270))(isFitnessPlusSubscriber);
    v5 = *(uint64_t (**)(void))((*v3 & *v1) + 0x238);
    v6 = (_QWORD *)((uint64_t (*)(uint64_t))v5)(v4);
    if (v6)
    {
      v7 = v6;
      (*(void (**)(void))((*v3 & *v6) + 0x68))();

    }
    v8 = (_QWORD *)v5();
    if (v8)
    {
      v9 = v8;
      (*(void (**)(void))((*v3 & *v8) + 0x60))();

    }
  }
}

void sub_21CC0B83C(uint64_t a1, uint64_t a2)
{
  id v3;

  sub_21CC0B890();
  v3 = (id)sub_21CC3F840();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

unint64_t sub_21CC0B890()
{
  unint64_t result;

  result = qword_25531C7D0;
  if (!qword_25531C7D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25531C7D0);
  }
  return result;
}

uint64_t sub_21CC0BAF4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8B8);
  v3 = sub_21CC3F960();
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_25:
    result = swift_release();
    *v1 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = (_QWORD *)(v2 + 56);
  if (v4 < 64)
    v6 = ~(-1 << v4);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v4 + 63) >> 6;
  result = swift_retain();
  if (v7)
  {
    v10 = __clz(__rbit64(v7));
    goto LABEL_20;
  }
  if (v8 <= 1)
    goto LABEL_21;
  v11 = *(_QWORD *)(v2 + 64);
  v12 = 1;
  if (v11)
  {
LABEL_19:
    v10 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_20:
    v14 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v10);
    sub_21CC3FAE0();
    __asm { BR              X8 }
  }
  v12 = 2;
  if (v8 <= 2)
  {
LABEL_21:
    swift_release();
    v1 = v0;
    v15 = 1 << *(_BYTE *)(v2 + 32);
    if (v15 > 63)
      bzero((void *)(v2 + 56), ((unint64_t)(v15 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v5 = -1 << v15;
    *(_QWORD *)(v2 + 16) = 0;
    goto LABEL_25;
  }
  v11 = *(_QWORD *)(v2 + 72);
  if (v11)
    goto LABEL_19;
  v12 = 3;
  if (v8 <= 3)
    goto LABEL_21;
  v11 = *(_QWORD *)(v2 + 80);
  if (v11)
    goto LABEL_19;
  v13 = 4;
  if (v8 <= 4)
    goto LABEL_21;
  v11 = *(_QWORD *)(v2 + 88);
  if (v11)
  {
    v12 = 4;
    goto LABEL_19;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v8)
      goto LABEL_21;
    v11 = v5[v12];
    ++v13;
    if (v11)
      goto LABEL_19;
  }
  __break(1u);
  return result;
}

void sub_21CC0C004(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_21CC3F72C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = MEMORY[0x22078973C](a1 + 16);
  if (v8)
  {
    v9 = (_QWORD *)v8;
    v10 = sub_21CC106F4();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
    v11 = sub_21CC3F714();
    v12 = sub_21CC3F8B8();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21CC08000, v11, v12, a2, v13, 2u);
      MEMORY[0x2207896E8](v13, -1, -1);
    }

    v14 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v9) + 0x2B8))(v14);

  }
}

uint64_t sub_21CC0C158(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_21CC0C178()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_21CC0C19C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)(v0 + 16);
  *v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 24)) + 0x1C0))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC0C1E0()
{
  return sub_21CC19654();
}

void sub_21CC0C1EC()
{
  uint64_t v0;

  sub_21CC0F61C(v0);
}

uint64_t sub_21CC0C1F4()
{
  return sub_21CC31E24((uint64_t)sub_21CC22018, (uint64_t)&block_descriptor_36);
}

id AAUIAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)()
{
  objc_class *v0;
  id v1;
  id v2;
  char *v3;
  id v4;
  objc_super v6;

  v1 = objc_allocWithZone(v0);
  v2 = objc_allocWithZone((Class)sub_21CC3F6D8());
  v3 = (char *)v1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(_QWORD *)&v3[OBJC_IVAR____TtC22ActivityAchievementsUI15AAUIAwardsQuery_query] = sub_21CC3F6B4();

  v6.receiver = v3;
  v6.super_class = v0;
  v4 = objc_msgSendSuper2(&v6, sel_init);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v4;
}

uint64_t sub_21CC0C70C()
{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  id v34;
  id v35;
  id v36;
  uint64_t aBlock;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  void (*v41)();
  uint64_t v42;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_defaultCenter);
  v3 = *MEMORY[0x24BEBDFF0];
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_mainQueue);
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v41 = sub_21CC318E4;
  v42 = v6;
  aBlock = MEMORY[0x24BDAC760];
  v38 = 1107296256;
  v39 = sub_21CC0B2AC;
  v40 = &block_descriptor_0;
  v7 = _Block_copy(&aBlock);
  swift_release();
  v36 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v3, 0, v5, v7);
  _Block_release(v7);

  v8 = objc_msgSend(v1, (SEL)&selRef_setDepthAttachmentPixelFormat_ + 7);
  v9 = *MEMORY[0x24BEBE008];
  v10 = objc_msgSend(v4, sel_mainQueue);
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v41 = sub_21CC22080;
  v42 = v11;
  aBlock = MEMORY[0x24BDAC760];
  v38 = 1107296256;
  v39 = sub_21CC0B2AC;
  v40 = &block_descriptor_16;
  v12 = _Block_copy(&aBlock);
  swift_release();
  v35 = objc_msgSend(v8, sel_addObserverForName_object_queue_usingBlock_, v9, 0, v10, v12);
  _Block_release(v12);

  v13 = objc_msgSend(v1, sel_defaultCenter);
  v14 = *MEMORY[0x24BEBDF98];
  v15 = objc_msgSend(v4, sel_mainQueue);
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v41 = sub_21CC31A58;
  v42 = v16;
  aBlock = MEMORY[0x24BDAC760];
  v38 = 1107296256;
  v39 = sub_21CC0B2AC;
  v40 = &block_descriptor_20;
  v17 = _Block_copy(&aBlock);
  swift_release();
  v34 = objc_msgSend(v13, sel_addObserverForName_object_queue_usingBlock_, v14, 0, v15, v17);
  _Block_release(v17);

  v18 = objc_msgSend(v1, sel_defaultCenter);
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_didUpdatePauseStateNotification);
  v21 = objc_msgSend(v4, sel_mainQueue);
  v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v41 = sub_21CC31A60;
  v42 = v22;
  aBlock = MEMORY[0x24BDAC760];
  v38 = 1107296256;
  v39 = sub_21CC0B2AC;
  v40 = &block_descriptor_24;
  v23 = _Block_copy(&aBlock);
  swift_release();
  v24 = objc_msgSend(v18, sel_addObserverForName_object_queue_usingBlock_, v20, 0, v21, v23);
  _Block_release(v23);

  v25 = objc_msgSend(v1, sel_defaultCenter);
  v26 = objc_msgSend(v19, sel_initialPauseStateLoadedNotification);
  v27 = objc_msgSend(v4, sel_mainQueue);
  v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v41 = sub_21CC31A80;
  v42 = v28;
  aBlock = MEMORY[0x24BDAC760];
  v38 = 1107296256;
  v39 = sub_21CC0B2AC;
  v40 = &block_descriptor_28;
  v29 = _Block_copy(&aBlock);
  swift_release();
  v30 = objc_msgSend(v25, sel_addObserverForName_object_queue_usingBlock_, v26, 0, v27, v29);
  _Block_release(v29);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C838);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_21CC422C0;
  *(_QWORD *)(v31 + 56) = swift_getObjectType();
  *(_QWORD *)(v31 + 32) = v36;
  *(_QWORD *)(v31 + 88) = swift_getObjectType();
  *(_QWORD *)(v31 + 64) = v35;
  *(_QWORD *)(v31 + 120) = swift_getObjectType();
  *(_QWORD *)(v31 + 96) = v34;
  *(_QWORD *)(v31 + 152) = swift_getObjectType();
  *(_QWORD *)(v31 + 128) = v24;
  *(_QWORD *)(v31 + 184) = swift_getObjectType();
  *(_QWORD *)(v31 + 160) = v30;
  v32 = *(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x298);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v32(v31);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_21CC0CD18()
{
  return AAUIAwardsDataProvider.topThreeAchievements()();
}

uint64_t AAUIAwardsDataProvider.topThreeAchievements()()
{
  char *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char *v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v8;
  _QWORD aBlock[6];
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  v1 = *(NSObject **)&v0[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v10;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_21CC0C19C;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_21CC0C198;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0C158;
  aBlock[3] = &block_descriptor_13;
  v4 = _Block_copy(aBlock);
  v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v8 = v10;
    swift_release();
    return v8;
  }
  return result;
}

uint64_t sub_21CC0CE7C(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v3 = *(_QWORD *)(v1 + 24);
  v2 = *(_QWORD *)(v1 + 32);
  v4 = objc_msgSend(*a1, sel_template);
  v5 = objc_msgSend(v4, sel_uniqueName);

  if (v5)
  {
    v6 = sub_21CC3F7B0();
    v8 = v7;

    if (v6 == v3 && v8 == v2)
      v10 = 1;
    else
      v10 = sub_21CC3FAA4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_21CC0CF48(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21CC0CF74()
{
  uint64_t v0;

  sub_21CC0FF60(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56), *(_BYTE *)(v0 + 57));
}

void sub_21CC0CF8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess();
  v3 = (_QWORD *)MEMORY[0x22078973C](v2);
  if (v3)
  {
    v4 = v3;
    (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x138))(1);

  }
  swift_beginAccess();
  v5 = MEMORY[0x22078973C](v2);
  if (v5)
  {
    v6 = (void *)v5;
    sub_21CC0D034(v1);

  }
}

uint64_t sub_21CC0D034(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  id v20;
  id v21;
  _BOOL8 v22;
  id v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t, _BOOL8);
  uint64_t v28;
  void *v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, _BOOL8);
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v2 = v1;
  v41 = *MEMORY[0x24BDAC8D0];
  v4 = sub_21CC3F75C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (unint64_t)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void **)((char *)v2 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *(_QWORD *)v7 = v8;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5610], v4);
  v9 = v8;
  LOBYTE(v8) = sub_21CC3F768();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_17:
    v10 = sub_21CC3FA14();
    if (!v10)
      goto LABEL_18;
    goto LABEL_4;
  }
  v39 = MEMORY[0x24BEE4AF8];
  v40 = MEMORY[0x24BEE4AF8];
  v7 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0x2F0))(a1);
  v37 = a1;
  if (v7 >> 62)
    goto LABEL_17;
  v10 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
    goto LABEL_18;
LABEL_4:
  if (v10 < 1)
    __break(1u);
  for (i = 0; i != v10; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0)
      v12 = (id)MEMORY[0x220788B18](i, v7);
    else
      v12 = *(id *)(v7 + 8 * i + 32);
    if (objc_msgSend(v12, sel_unearned))
    {
      MEMORY[0x2207889BC]();
      if (*(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_21CC3F870();
    }
    else
    {
      MEMORY[0x2207889BC]();
      if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_21CC3F870();
    }
    sub_21CC3F888();
    sub_21CC3F864();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  v13 = *(void **)((char *)v2 + OBJC_IVAR___AAUIAwardsDataProvider_healthStore);
  v38 = 0;
  v14 = objc_msgSend(v13, sel_activityMoveModeWithError_, &v38);
  if (v14)
  {
    v15 = v38;
    v16 = (uint64_t)objc_msgSend(v14, sel_activityMoveMode);
  }
  else
  {
    v17 = v38;
    v18 = (void *)sub_21CC3F600();

    swift_willThrow();
    v16 = 1;
  }
  v19 = FIExperienceTypeWithHealthStore();
  v38 = 0;
  v20 = objc_msgSend(v13, sel_wheelchairUseWithError_, &v38);
  v36 = v14;
  if (v20)
  {
    v21 = v38;
    v22 = objc_msgSend(v20, sel_wheelchairUse) == (id)2;
  }
  else
  {
    v23 = v38;
    v24 = (void *)sub_21CC3F600();

    swift_willThrow();
    v22 = 0;
  }
  if (v19 <= 1)
    v25 = 1;
  else
    v25 = v19;
  v26 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BOOL8))((*MEMORY[0x24BEE4EA0] & *v2) + 0x300);
  v28 = swift_bridgeObjectRetain();
  v29 = (void *)v27(v28, v16, v25, v22);
  swift_bridgeObjectRelease();
  v38 = v29;
  v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BOOL8))((*v26 & *v2) + 0x308);
  v31 = swift_bridgeObjectRetain();
  v32 = v30(v31, v16, v25, v22);
  swift_bridgeObjectRelease();
  sub_21CC0D4B4(v32);
  sub_21CC140F4();
  LOBYTE(v32) = sub_21CC10790();
  v33 = (*(uint64_t (**)(void))((*v26 & *v2) + 0x2F8))();
  (*(void (**)(void))((*v26 & *v2) + 0x2C0))();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD, uint64_t, _QWORD))((*v26 & *v2) + 0x318))(v37, MEMORY[0x24BEE4AF8], v38, MEMORY[0x24BEE4AF8], v32 & 1, v33 & 1);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC0D4B4(uint64_t a1)
{
  char **v1;
  size_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  size_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  BOOL v13;
  size_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_21CC33220(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = &v3[v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[v8] && (unint64_t)v10 < a1 + 32 + v8)
    goto LABEL_24;
  memcpy(v10, (const void *)(a1 + 32), v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = *((_QWORD *)v3 + 2);
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    *((_QWORD *)v3 + 2) = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_21CC3FA50();
  __break(1u);
  return result;
}

uint64_t sub_21CC0D5FC(unint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  char v21;
  char v22;
  char v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  Swift::String v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  id v43;
  id v44;
  unint64_t v45;
  char v46;
  char v47;
  unint64_t v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  void (*v53)(char *, _QWORD);
  unint64_t *v54;
  unint64_t *v55;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  id v66;
  id v67;
  unint64_t v68;
  char v69;
  char v70;
  unint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  unint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  _BOOL4 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *, _QWORD);
  uint64_t *v99;
  uint64_t *v100;
  char v101;
  id v102;
  id v103;
  unint64_t v104;
  char v105;
  char v106;
  unint64_t v107;
  id v108;
  void *v109;
  id v110;
  uint64_t v111;
  char v112;
  id v113;
  id v114;
  unint64_t v115;
  char v116;
  char v117;
  void (*v118)(char *, _QWORD);
  void (*v119)(_QWORD *);
  _QWORD *v120;
  void *v121;
  id v122;
  char v123;
  char v124;
  void (*v125)(char *, _QWORD);
  _QWORD *v126;
  void (*v127)(_QWORD *);
  _QWORD *v128;
  id v129;
  uint64_t v130;
  unint64_t v131;
  int v132;
  uint64_t v133;
  unint64_t v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void (*v139)(char *, _QWORD);
  uint64_t *v140;
  uint64_t *v141;
  char v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  _QWORD *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v153;
  uint64_t v154;
  __int128 v155;
  unint64_t v156;
  char *v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t (*v163)(void);
  uint64_t v164;
  void *v165;
  uint64_t (*v166)(void);
  uint64_t v167;
  uint64_t v168;
  int v169;
  char v170[72];
  uint64_t v171[4];
  unint64_t v172;
  uint64_t v173;

  v5 = v4;
  v169 = a4;
  v167 = a2;
  v168 = a3;
  v7 = sub_21CC3F75C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v153 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(void **)((char *)v5 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *v10 = v11;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5610], v7);
  v12 = v11;
  LOBYTE(v11) = sub_21CC3F768();
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
  if ((v11 & 1) == 0)
    goto LABEL_150;
  v173 = MEMORY[0x24BEE4B08];
  if (a1 >> 62)
  {
LABEL_151:
    swift_bridgeObjectRetain();
    v13 = sub_21CC3FA14();
    if (v13)
      goto LABEL_4;
  }
  else
  {
    v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13)
    {
LABEL_4:
      v14 = 0;
      v154 = 0;
      v15 = *MEMORY[0x24BEE4EA0] & *v5;
      v160 = (unint64_t)v5 + OBJC_IVAR___AAUIAwardsDataProvider_calendar;
      v16 = a1 & 0xC000000000000001;
      v162 = a1 & 0xFFFFFFFFFFFFFF8;
      v161 = a1 + 32;
      v166 = *(uint64_t (**)(void))(v15 + 616);
      v164 = OBJC_IVAR___AAUIAwardsDataProvider_visibilityEvaluator;
      v155 = xmmword_21CC41F10;
      v157 = "ESS_PLUS";
      v156 = a1;
      v159 = v13;
      v158 = a1 & 0xC000000000000001;
      while (1)
      {
        while (1)
        {
          if (v16)
          {
            v17 = (id)MEMORY[0x220788B18](v14, a1);
          }
          else
          {
            if (v14 >= *(_QWORD *)(v162 + 16))
              goto LABEL_146;
            v17 = *(id *)(v161 + 8 * v14);
          }
          v18 = v17;
          v19 = __OFADD__(v14++, 1);
          if (v19)
          {
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
            goto LABEL_151;
          }
          v20 = *(void **)((char *)v5 + v164);
          v21 = v166();
          v165 = v20;
          sub_21CC197F8(v167, v168, v20, v21 & 1, v169 & 1);
          v23 = v22;
          v24 = objc_msgSend(v18, sel_section);
          v25 = sub_21CC3F7B0();
          v27 = v26;

          v28._countAndFlagsBits = v25;
          v28._object = v27;
          AAUIAwardsDataProviderSection.init(rawValue:)(v28);
          v29 = v170[0];
          if (v170[0] != 7 && (v23 & 1) != 0)
            break;

          if (v14 == v13)
            goto LABEL_144;
        }
        v30 = objc_msgSend(v18, sel_relevantEarnedInstance);
        if (v30)
        {
          v31 = v30;
          v32 = objc_msgSend(v30, sel_externalIdentifier);

          if (v32)
          {
            v33 = sub_21CC3F7B0();
            v35 = v34;

            v36 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v5) + 0x190);
            v37 = swift_bridgeObjectRetain();
            v38 = v36(v37);
            if (*(_QWORD *)(v38 + 16))
            {
              v39 = v33;
              v40 = sub_21CC2EF40(v33, v35);
              v41 = MEMORY[0x24BEE4AF8];
              if ((v42 & 1) != 0)
              {
                v41 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 8 * v40);
                swift_bridgeObjectRetain();
              }
            }
            else
            {
              v39 = v33;
              v41 = MEMORY[0x24BEE4AF8];
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v171[0] = v41;
            swift_bridgeObjectRetain();
            v43 = objc_msgSend(v18, sel_template);
            v44 = objc_msgSend(v43, sel_uniqueName);

            if (!v44)
              goto LABEL_162;
            sub_21CC3F7B0();

            sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
            v45 = sub_21CC19778();
            v47 = v46;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v47 & 1) != 0)
            {
              v51 = v18;
              MEMORY[0x2207889BC]();
              if (*(_QWORD *)((v171[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v171[0] & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
                sub_21CC3F870();
              sub_21CC3F888();
            }
            else
            {
              v48 = v171[0];
              v49 = v18;
              if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                || (v48 & 0x8000000000000000) != 0
                || (v48 & 0x4000000000000000) != 0)
              {
                sub_21CC1A2B4(v48);
              }
              if ((v45 & 0x8000000000000000) != 0)
              {
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
LABEL_157:
                __break(1u);
LABEL_158:
                __break(1u);
LABEL_159:
                __break(1u);
LABEL_160:
                __break(1u);
LABEL_161:
                __break(1u);
LABEL_162:
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                __break(1u);
LABEL_167:
                JUMPOUT(0x21CC0ED14);
              }
              if (v45 >= *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_155;
              v50 = *(void **)((v48 & 0xFFFFFFFFFFFFFF8) + 8 * v45 + 0x20);
              *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 8 * v45 + 0x20) = v49;

            }
            sub_21CC3F864();
            v52 = v171[0];
            v53 = (void (*)(char *, _QWORD))(*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & *v5)
                                                                                         + 0x1A0))(v170);
            v55 = v54;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v172 = *v55;
            *v55 = 0x8000000000000000;
            sub_21CC33D00(v52, v39, v35, isUniquelyReferenced_nonNull_native);
            *v55 = v172;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v53(v170, 0);
            a1 = v156;
          }
        }
        v163 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v5) + 0x160);
        v57 = v163();
        if (*(_QWORD *)(v57 + 16))
        {
          v58 = sub_21CC2EED8(v29);
          v59 = MEMORY[0x24BEE4AF8];
          if ((v60 & 1) != 0)
          {
            v59 = *(_QWORD *)(*(_QWORD *)(v57 + 56) + 8 * v58);
            swift_bridgeObjectRetain();
          }
        }
        else
        {
          v59 = MEMORY[0x24BEE4AF8];
        }
        v61 = swift_bridgeObjectRelease();
        v172 = v59;
        v62 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v5) + 0x178))(v61);
        if (!*(_QWORD *)(v62 + 16) || (v63 = sub_21CC2EED8(v29), (v64 & 1) == 0))
        {
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7C8);
          v74 = swift_allocObject();
          *(_OWORD *)(v74 + 16) = v155;
          *(_QWORD *)(v74 + 32) = v18;
          *(_QWORD *)v170 = v74;
          sub_21CC3F864();
          v75 = *(_QWORD *)v170;
          v76 = v18;
          goto LABEL_78;
        }
        v65 = *(_QWORD *)(*(_QWORD *)(v62 + 56) + 8 * v63);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)v170 = v65;
        swift_bridgeObjectRetain();
        v66 = objc_msgSend(v18, sel_template);
        v67 = objc_msgSend(v66, sel_uniqueName);

        if (!v67)
          goto LABEL_163;
        sub_21CC3F7B0();

        sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
        v68 = sub_21CC19778();
        v70 = v69;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v70 & 1) != 0)
        {
          v77 = v18;
          MEMORY[0x2207889BC]();
          if (*(_QWORD *)((*(_QWORD *)v170 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v170 & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
            sub_21CC3F870();
          sub_21CC3F888();
        }
        else
        {
          v71 = *(_QWORD *)v170;
          v72 = v18;
          if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
            || (v71 & 0x8000000000000000) != 0
            || (v71 & 0x4000000000000000) != 0)
          {
            sub_21CC1A2B4(v71);
          }
          if ((v68 & 0x8000000000000000) != 0)
            goto LABEL_156;
          if (v68 >= *(_QWORD *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_157;
          v73 = *(void **)((v71 & 0xFFFFFFFFFFFFFF8) + 8 * v68 + 0x20);
          *(_QWORD *)((v71 & 0xFFFFFFFFFFFFFF8) + 8 * v68 + 0x20) = v72;

        }
        sub_21CC3F864();
        v78 = *(_QWORD *)v170;
        if ((*(_QWORD *)v170 & 0x8000000000000000) != 0 || (*(_QWORD *)v170 & 0x4000000000000000) != 0)
        {
          swift_bridgeObjectRetain_n();
          v149 = v5;
          v79 = (uint64_t)sub_21CC33334(v78);
          swift_bridgeObjectRelease();
        }
        else
        {
          v79 = *(_QWORD *)v170 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n();
          v80 = v5;
        }
        v171[0] = v79;
        v81 = v5;
        v82 = v154;
        sub_21CC136AC(v171, v81);
        v154 = v82;
        if (v82)
        {

          swift_release();
          __break(1u);
          goto LABEL_167;
        }
        swift_bridgeObjectRelease();

        v83 = v171[0];
        swift_bridgeObjectRelease();
        v84 = v83 < 0 || (v83 & 0x4000000000000000) != 0;
        if (v84)
        {
          swift_bridgeObjectRetain();
          v145 = sub_21CC3FA14();
          swift_release();
          swift_bridgeObjectRetain();
          v146 = sub_21CC3FA14();
          swift_release();
          if (v146 < 0)
            goto LABEL_165;
          if (v145 >= 6)
            v147 = 6;
          else
            v147 = v145;
          if (v145 >= 0)
            v85 = v147;
          else
            v85 = 6;
          swift_bridgeObjectRetain();
          v148 = sub_21CC3FA14();
          swift_release();
          if (v148 < v85)
            goto LABEL_149;
        }
        else if (*(uint64_t *)(v83 + 16) >= 6)
        {
          v85 = 6;
        }
        else
        {
          v85 = *(_QWORD *)(v83 + 16);
        }
        if ((v83 & 0xC000000000000001) != 0 && v85)
        {
          v86 = 0;
          do
          {
            v87 = v86 + 1;
            sub_21CC3F984();
            v86 = v87;
          }
          while (v85 != v87);
        }
        if (v84)
        {
          swift_bridgeObjectRetain();
          v88 = sub_21CC3FA20();
          v90 = v89;
          v92 = v91;
          v94 = v93;
          swift_release_n();
          v83 = v88;
          if ((v94 & 1) == 0)
            goto LABEL_70;
        }
        else
        {
          v92 = 0;
          v90 = v83 + 32;
          v94 = (2 * v85) | 1;
          if ((v94 & 1) == 0)
            goto LABEL_70;
        }
        sub_21CC3FAB0();
        swift_unknownObjectRetain_n();
        v96 = swift_dynamicCastClass();
        if (!v96)
        {
          swift_unknownObjectRelease();
          v96 = MEMORY[0x24BEE4AF8];
        }
        v97 = *(_QWORD *)(v96 + 16);
        swift_release();
        if (__OFSUB__(v94 >> 1, v92))
          goto LABEL_158;
        if (v97 == (v94 >> 1) - v92)
        {
          v75 = swift_dynamicCastClass();
          a1 = v156;
          if (!v75)
          {
            swift_unknownObjectRelease();
            v75 = MEMORY[0x24BEE4AF8];
          }
          goto LABEL_77;
        }
        swift_unknownObjectRelease();
        a1 = v156;
LABEL_70:
        sub_21CC2EFA4(v83, v90, v92, v94);
        v75 = v95;
LABEL_77:
        swift_unknownObjectRelease();
LABEL_78:
        v98 = (void (*)(char *, _QWORD))(*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & *v5)
                                                                                     + 0x188))(v170);
        v100 = v99;
        v101 = swift_isUniquelyReferenced_nonNull_native();
        v171[0] = *v100;
        *v100 = 0x8000000000000000;
        sub_21CC33BCC(v75, v29, v101);
        *v100 = v171[0];
        swift_bridgeObjectRelease();
        v98(v170, 0);
        swift_bridgeObjectRetain();
        v102 = objc_msgSend(v18, sel_template);
        v103 = objc_msgSend(v102, sel_uniqueName);

        if (!v103)
          goto LABEL_161;
        sub_21CC3F7B0();

        sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
        v104 = sub_21CC19778();
        v106 = v105;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v106 & 1) != 0)
        {
          v110 = v18;
          MEMORY[0x2207889BC]();
          if (*(_QWORD *)((v172 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v172 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_21CC3F870();
          sub_21CC3F888();
        }
        else
        {
          v107 = v172;
          v108 = v18;
          if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
            || (v107 & 0x8000000000000000) != 0
            || (v107 & 0x4000000000000000) != 0)
          {
            sub_21CC1A2B4(v107);
          }
          if ((v104 & 0x8000000000000000) != 0)
            goto LABEL_147;
          if (v104 >= *(_QWORD *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_148;
          v109 = *(void **)((v107 & 0xFFFFFFFFFFFFFF8) + 8 * v104 + 0x20);
          *(_QWORD *)((v107 & 0xFFFFFFFFFFFFFF8) + 8 * v104 + 0x20) = v108;

        }
        v111 = sub_21CC3F864();
        if (*(_QWORD *)(((uint64_t (*)(uint64_t))v163)(v111) + 16))
        {
          sub_21CC2EED8(0);
          if ((v112 & 1) != 0)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v113 = objc_msgSend(v18, sel_template);
            v114 = objc_msgSend(v113, sel_uniqueName);

            if (!v114)
              goto LABEL_164;
            sub_21CC3F7B0();

            v115 = sub_21CC19778();
            v117 = v116;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v117 & 1) != 0)
              goto LABEL_97;
            v118 = (void (*)(char *, _QWORD))(*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & *v5)
                                                                                          + 0x170))(v170);
            v119 = sub_21CC32CE0(v171, 0);
            if (*v120)
            {
              v121 = (void *)sub_21CC1AA64(v115);
              ((void (*)(uint64_t *, _QWORD))v119)(v171, 0);
              v118(v170, 0);

            }
            else
            {
              ((void (*)(uint64_t *, _QWORD))v119)(v171, 0);
              v118(v170, 0);
            }
            v133 = v173;
            sub_21CC3FAE0();
            swift_bridgeObjectRetain();
            sub_21CC3F7D4();
            v134 = sub_21CC3FAEC() & ~(-1 << *(_BYTE *)(v133 + 32));
            if (((*(_QWORD *)(v133 + 56 + ((v134 >> 3) & 0xFFFFFFFFFFFFF8)) >> v134) & 1) != 0)
              __asm { BR              X9 }
            swift_bridgeObjectRelease();
            v135 = swift_isUniquelyReferenced_nonNull_native();
            v171[0] = v133;
            if (*(_QWORD *)(v133 + 24) <= *(_QWORD *)(v133 + 16))
            {
              if (v135)
                sub_21CC0BAF4();
              else
                sub_21CC1A6F4();
              v133 = v171[0];
              sub_21CC3FAE0();
              sub_21CC3F7D4();
              v134 = sub_21CC3FAEC() & ~(-1 << *(_BYTE *)(v133 + 32));
              if (((*(_QWORD *)(v133 + 56 + ((v134 >> 3) & 0xFFFFFFFFFFFFF8)) >> v134) & 1) != 0)
                __asm { BR              X9 }
              a1 = v156;
            }
            else
            {
              a1 = v156;
              if ((v135 & 1) == 0)
              {
                sub_21CC34708();
                v133 = v171[0];
              }
            }
            *(_QWORD *)(v133 + ((v134 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v134;
            *(_BYTE *)(*(_QWORD *)(v133 + 48) + v134) = 0;
            v143 = *(_QWORD *)(v133 + 16);
            v19 = __OFADD__(v143, 1);
            v144 = v143 + 1;
            if (v19)
              goto LABEL_160;
            *(_QWORD *)(v133 + 16) = v144;
            v173 = v133;
          }
        }
        swift_bridgeObjectRelease();
LABEL_97:
        v122 = objc_msgSend(v18, sel_shallowCopyWithRelevantEarnedInstance_, 0);
        if (sub_21CC36A18(v160)
          && (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v5) + 0x280))() & 1) == 0
           || (objc_msgSend(v18, sel_isRingsBased) & 1) == 0))
        {
          v123 = v166();
          sub_21CC197F8(v167, v168, v165, v123 & 1, v169 & 1);
          if ((v124 & 1) != 0)
          {
            v125 = (void (*)(char *, _QWORD))(*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & *v5)
                                                                                          + 0x170))(v170);
            v127 = sub_21CC32CE0(v171, 0);
            if (*v126)
            {
              v128 = v126;
              v129 = v122;
              MEMORY[0x2207889BC]();
              if (*(_QWORD *)((*v128 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v128 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_21CC3F870();
              sub_21CC3F888();
              sub_21CC3F864();
            }
            ((void (*)(uint64_t *, _QWORD))v127)(v171, 0);
            v125(v170, 0);
            v165 = v122;
            v130 = v173;
            sub_21CC3FAE0();
            swift_bridgeObjectRetain();
            sub_21CC3F7D4();
            v131 = sub_21CC3FAEC() & ~(-1 << *(_BYTE *)(v130 + 32));
            if (((*(_QWORD *)(v130 + 56 + ((v131 >> 3) & 0xFFFFFFFFFFFFF8)) >> v131) & 1) != 0)
              __asm { BR              X9 }
            swift_bridgeObjectRelease();
            v132 = swift_isUniquelyReferenced_nonNull_native();
            v171[0] = v130;
            if (*(_QWORD *)(v130 + 24) <= *(_QWORD *)(v130 + 16))
            {
              v122 = v165;
              if (v132)
                sub_21CC0BAF4();
              else
                sub_21CC1A6F4();
              v130 = v171[0];
              sub_21CC3FAE0();
              sub_21CC3F7D4();
              v131 = sub_21CC3FAEC() & ~(-1 << *(_BYTE *)(v130 + 32));
              if (((*(_QWORD *)(v130 + 56 + ((v131 >> 3) & 0xFFFFFFFFFFFFF8)) >> v131) & 1) != 0)
                __asm { BR              X9 }
            }
            else
            {
              v122 = v165;
              if ((v132 & 1) == 0)
              {
                sub_21CC34708();
                v130 = v171[0];
              }
            }
            *(_QWORD *)(v130 + ((v131 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v131;
            *(_BYTE *)(*(_QWORD *)(v130 + 48) + v131) = 0;
            v136 = *(_QWORD *)(v130 + 16);
            v19 = __OFADD__(v136, 1);
            v137 = v136 + 1;
            if (v19)
              goto LABEL_159;
            *(_QWORD *)(v130 + 16) = v137;
            v173 = v130;
            swift_bridgeObjectRelease();
            a1 = v156;
          }
        }
        v138 = v172;
        v139 = (void (*)(char *, _QWORD))(*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & *v5)
                                                                                      + 0x170))(v170);
        v141 = v140;
        v142 = swift_isUniquelyReferenced_nonNull_native();
        v171[0] = *v141;
        *v141 = 0x8000000000000000;
        sub_21CC33BCC(v138, v29, v142);
        *v141 = v171[0];
        swift_bridgeObjectRelease();
        v139(v170, 0);
        sub_21CC34010(v170, v29);

        v13 = v159;
        v16 = v158;
        if (v14 == v159)
        {
LABEL_144:
          swift_bridgeObjectRelease();
          v150 = v173;
          goto LABEL_153;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  v150 = MEMORY[0x24BEE4B08];
LABEL_153:
  v151 = sub_21CC1A1E0(v150);
  swift_bridgeObjectRelease();
  return v151;
}

uint64_t sub_21CC0ED44(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v2 = a1;
  v3 = *(_QWORD *)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_overrideDisplayState);
  if (v3 == 2)
  {
    if (!(a1 >> 62))
    {
      v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_6;
    }
  }
  else
  {
    if (v3 != 1)
    {
      swift_bridgeObjectRetain();
      return v2;
    }
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = sub_21CC3FA14();
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v5 = MEMORY[0x24BEE4AF8];
    if (!v11)
      return v5;
    v17 = MEMORY[0x24BEE4AF8];
    result = sub_21CC3F9CC();
    if (v11 < 0)
      goto LABEL_30;
    v12 = 0;
    while (v11 != v12)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x220788B18](v12, v2);
      else
        v13 = *(id *)(v2 + 8 * v12 + 32);
      v14 = v13;
      ++v12;
      v15 = v13;
      sub_21CC321C8(&v15, &v16);

      sub_21CC3F9B4();
      sub_21CC3F9D8();
      sub_21CC3F9E4();
      sub_21CC3F9C0();
      if (v11 == v12)
        return v17;
    }
    __break(1u);
  }
  swift_bridgeObjectRetain();
  v4 = sub_21CC3FA14();
  swift_bridgeObjectRelease();
LABEL_6:
  v5 = MEMORY[0x24BEE4AF8];
  if (!v4)
    return v5;
  v17 = MEMORY[0x24BEE4AF8];
  result = sub_21CC3F9CC();
  if ((v4 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x220788B18](v7, v2);
      else
        v8 = *(id *)(v2 + 8 * v7 + 32);
      v9 = v8;
      ++v7;
      v10 = objc_msgSend(v8, sel_shallowCopyWithRelevantEarnedInstance_, 0);

      sub_21CC3F9B4();
      sub_21CC3F9D8();
      sub_21CC3F9E4();
      sub_21CC3F9C0();
    }
    while (v4 != v7);
    return v17;
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21CC0EF9C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_initialAwardsBatchDelivered);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_21CC0EFE4()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  _QWORD v6[6];

  v1 = *(NSObject **)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue);
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_21CC0C1EC;
  *(_QWORD *)(v3 + 24) = v2;
  v6[4] = sub_21CC0C178;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_21CC0C158;
  v6[3] = &block_descriptor_43;
  v4 = _Block_copy(v6);
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v1 & 1) != 0)
    __break(1u);
  return result;
}

void sub_21CC0F114()
{
  sub_21CC0F120((void (*)(uint64_t))sub_21CC0D034);
}

void sub_21CC0F120(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 16) + 16;
  swift_beginAccess();
  v5 = (_QWORD *)MEMORY[0x22078973C](v4);
  if (v5)
  {
    v6 = v5;
    if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v5) + 0x130))() & 1) != 0)
      a1(v3);

  }
}

uint64_t sub_21CC0F1A4()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_initialAwardsBatchDelivered);
  swift_beginAccess();
  return *v1;
}

void sub_21CC0F1E8(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __CFString *v9;
  id v10;
  __CFString *v11;
  CFIndex AppIntegerValue;
  uint64_t (*v13)(void);
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;

  sub_21CC3F72C();
  MEMORY[0x24BDAC7A8]();
  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x22078973C](a1 + 16);
  if (v2)
  {
    v3 = v2;
    v4 = (_QWORD *)MEMORY[0x24BEE4EA0];
    (*(void (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x138))(0);
    v5 = MEMORY[0x24BEE4AF8];
    (*(void (**)(_QWORD))((*v4 & *v3) + 0x150))(MEMORY[0x24BEE4AF8]);
    v6 = sub_21CC13FF4(v5);
    (*(void (**)(unint64_t))((*v4 & *v3) + 0x168))(v6);
    v7 = sub_21CC13FF4(v5);
    (*(void (**)(unint64_t))((*v4 & *v3) + 0x180))(v7);
    v8 = sub_21CC15B80(v5);
    (*(void (**)(unint64_t))((*v4 & *v3) + 0x198))(v8);
    (*(void (**)(uint64_t))((*v4 & *v3) + 0x1B0))(v5);
    v9 = (__CFString *)sub_21CC3F7A4();
    v10 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v11 = (__CFString *)objc_msgSend(v10, sel_bundleIdentifier);

    if (v11)
    {
      AppIntegerValue = CFPreferencesGetAppIntegerValue(v9, v11, 0);

    }
    else
    {
      AppIntegerValue = 0;
    }
    *(_QWORD *)((char *)v3 + OBJC_IVAR___AAUIAwardsDataProvider_overrideDisplayState) = AppIntegerValue;
    v13 = *(uint64_t (**)(void))((*v4 & *v3) + 0x238);
    v14 = (_QWORD *)v13();
    if (v14)
    {
      v15 = v14;
      (*(void (**)(void))((*v4 & *v14) + 0x68))();

    }
    v16 = (_QWORD *)v13();
    if (v16)
    {
      v17 = v16;
      (*(void (**)(void))((*v4 & *v16) + 0x60))();

    }
  }
}

void *sub_21CC0F5D0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_query);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_21CC0F61C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(void);
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  os_log_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  os_log_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = sub_21CC3F72C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = MEMORY[0x22078973C](a1 + 16);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = sub_21CC106F4();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    v9 = v7;
    v10 = sub_21CC3F714();
    v11 = sub_21CC3F8B8();
    v12 = os_log_type_enabled(v10, v11);
    v13 = (_QWORD *)MEMORY[0x24BEE4EA0];
    if (v12)
    {
      v14 = swift_slowAlloc();
      v41 = v2;
      v15 = v14;
      v40 = swift_slowAlloc();
      v43 = v40;
      *(_DWORD *)v15 = 136315394;
      v16 = *(void (**)(void))((*v13 & *v9) + 0x1A8);
      v39 = v10;
      v16();
      v17 = MEMORY[0x2207889E0]();
      v19 = v18;
      swift_bridgeObjectRelease();
      v42 = sub_21CC0FA20(v17, v19, &v43);
      sub_21CC3F900();

      v20 = swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      v38[1] = v15 + 14;
      v21 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x148))(v20);
      v22 = sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
      v23 = MEMORY[0x2207889E0](v21, v22);
      LOBYTE(v19) = v11;
      v25 = v24;
      swift_bridgeObjectRelease();
      v42 = sub_21CC0FA20(v23, v25, &v43);
      sub_21CC3F900();

      swift_bridgeObjectRelease();
      v26 = v39;
      _os_log_impl(&dword_21CC08000, v39, (os_log_type_t)v19, "[AAUIAwardsDataProvider] Updating client properties:\norderedSections = %s,\ntopAchievements = %s", (uint8_t *)v15, 0x16u);
      v27 = v40;
      swift_arrayDestroy();
      MEMORY[0x2207896E8](v27, -1, -1);
      MEMORY[0x2207896E8](v15, -1, -1);

      v28 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v41);
    }
    else
    {

      v28 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    v29 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x1A8))(v28);
    v30 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x228))(v29);
    v31 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x160))(v30);
    v32 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x1E0))(v31);
    v33 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x148))(v32);
    v34 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x1C8))(v33);
    v35 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x190))(v34);
    v36 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x210))(v35);
    v37 = (*(uint64_t (**)(uint64_t))((*v13 & *v9) + 0x178))(v36);
    (*(void (**)(uint64_t))((*v13 & *v9) + 0x1F8))(v37);

  }
}

uint64_t sub_21CC0F9D4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC0FA20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21CC0FB2C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21CC0FAF0((uint64_t)v12, *a3);
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
      sub_21CC0FAF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21CC0FAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21CC0FB2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21CC3F90C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21CC30070(a5, a6);
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
  v8 = sub_21CC3F9A8();
  if (!v8)
  {
    sub_21CC3F9FC();
    __break(1u);
LABEL_17:
    result = sub_21CC3FA50();
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

uint64_t sub_21CC0FCE4()
{
  return sub_21CC19654();
}

uint64_t sub_21CC0FCF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _BYTE v22[4];
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v23 = a6;
  v12 = sub_21CC3F738();
  v27 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_21CC3F750();
  v25 = *(_QWORD *)(v15 - 8);
  v26 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v22[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = *(_QWORD *)(v6 + OBJC_IVAR___AAUIAwardsDataProvider_notifyQueue);
  v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  *(_QWORD *)(v19 + 24) = a1;
  *(_QWORD *)(v19 + 32) = a2;
  *(_QWORD *)(v19 + 40) = a3;
  *(_QWORD *)(v19 + 48) = a4;
  *(_BYTE *)(v19 + 56) = a5;
  *(_BYTE *)(v19 + 57) = v23;
  aBlock[4] = sub_21CC0CF74;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0CF48;
  aBlock[3] = &block_descriptor_50;
  v20 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21CC3F744();
  v28 = MEMORY[0x24BEE4AF8];
  sub_21CC10710(&qword_25531C840, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C848);
  sub_21CC10750(&qword_25531C850, &qword_25531C848, MEMORY[0x24BEE12C8]);
  sub_21CC3F93C();
  MEMORY[0x220788A64](0, v17, v14, v20);
  _Block_release(v20);
  (*(void (**)(_BYTE *, uint64_t))(v27 + 8))(v14, v12);
  (*(void (**)(_BYTE *, uint64_t))(v25 + 8))(v17, v26);
  swift_release();
  return swift_release();
}

void sub_21CC0FF60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  os_unfair_lock_s *v23;
  unint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t ObjectType;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v57 = a2;
  v13 = sub_21CC3F72C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v17 = (char *)MEMORY[0x22078973C](a1 + 16);
  if (v17)
  {
    v56 = v16;
    v52 = v13;
    v46 = v17;
    v18 = *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_protectedObservers];
    v19 = (os_unfair_lock_s *)(v18 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(v18 + 24));
    v20 = objc_msgSend(*(id *)(v18 + 16), sel_allObjects);
    v21 = MEMORY[0x24BEE4AD0];
    v22 = sub_21CC3F84C();

    v23 = v19;
    v24 = v22;
    os_unfair_lock_unlock(v23);
    v60 = v22;
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = v60;
      v44 = sub_21CC3FA14();
      swift_bridgeObjectRelease();
      v26 = v44;
      v27 = v52;
      if (v26)
        goto LABEL_4;
    }
    else
    {
      v26 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
      v27 = v52;
      if (v26)
      {
LABEL_4:
        if (v26 < 1)
        {
          __break(1u);
          return;
        }
        v28 = 0;
        v58 = v24 & 0xC000000000000001;
        *(_QWORD *)&v25 = 136315138;
        v49 = v25;
        v48 = v21 + 8;
        v47 = MEMORY[0x24BEE4AD8] + 8;
        v54 = a7 & 1;
        v55 = a6 & 1;
        v50 = a5;
        v51 = a4;
        v59 = v26;
        v53 = v14;
        v29 = v56;
        do
        {
          if (v58)
          {
            v31 = MEMORY[0x220788B18](v28, v24);
          }
          else
          {
            v31 = *(_QWORD *)(v24 + 8 * v28 + 32);
            swift_unknownObjectRetain();
          }
          swift_unknownObjectRetain();
          swift_getObjectType();
          v32 = swift_conformsToProtocol2();
          if (v32)
            v33 = v32;
          else
            v33 = 0;
          if (v32)
            v34 = v31;
          else
            v34 = 0;
          if (v34)
          {
            v61 = v33;
            v35 = sub_21CC106F4();
            (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v29, v35, v27);
            swift_unknownObjectRetain_n();
            v36 = sub_21CC3F714();
            v37 = sub_21CC3F8B8();
            if (os_log_type_enabled(v36, v37))
            {
              v38 = swift_slowAlloc();
              v39 = swift_slowAlloc();
              v62 = v31;
              v63 = v39;
              *(_DWORD *)v38 = v49;
              swift_unknownObjectRetain();
              v40 = sub_21CC3F7BC();
              *(_QWORD *)(v38 + 4) = sub_21CC0FA20(v40, v41, &v63);
              swift_unknownObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_21CC08000, v36, v37, "[AAUIAwardsDataProvider] Notifying observer of update: %s", (uint8_t *)v38, 0xCu);
              swift_arrayDestroy();
              v42 = v39;
              a5 = v50;
              a4 = v51;
              MEMORY[0x2207896E8](v42, -1, -1);
              v43 = v38;
              v27 = v52;
              MEMORY[0x2207896E8](v43, -1, -1);

            }
            else
            {

              swift_unknownObjectRelease_n();
            }
            v14 = v53;
            (*(void (**)(char *, uint64_t))(v53 + 8))(v29, v27);
            ObjectType = swift_getObjectType();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(v61 + 8))(v57, a3, a4, a5, v55, v54, ObjectType);
          }
          ++v28;
          swift_unknownObjectRelease_n();
          v24 = v60;
        }
        while (v59 != v28);
      }
    }

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21CC10328(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v29 = a3;
  v30 = a4;
  v28 = a2;
  v7 = sub_21CC3F738();
  v33 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21CC3F750();
  v31 = *(_QWORD *)(v10 - 8);
  v32 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21CC3F72C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_21CC106F4();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  swift_bridgeObjectRetain_n();
  v18 = sub_21CC3F714();
  v19 = sub_21CC3F8B8();
  if (os_log_type_enabled(v18, v19))
  {
    v26 = a5;
    v27 = v7;
    v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v20 = 134217984;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v21 = sub_21CC3FA14();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    aBlock[0] = v21;
    sub_21CC3F900();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21CC08000, v18, v19, v28, v20, 0xCu);
    MEMORY[0x2207896E8](v20, -1, -1);

    a5 = v26;
    v7 = v27;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v22;
  *(_QWORD *)(v23 + 24) = a1;
  aBlock[4] = v30;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0CF48;
  aBlock[3] = a5;
  v24 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21CC3F744();
  v34 = MEMORY[0x24BEE4AF8];
  sub_21CC10710(&qword_25531C840, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C848);
  sub_21CC10750(&qword_25531C850, &qword_25531C848, MEMORY[0x24BEE12C8]);
  sub_21CC3F93C();
  MEMORY[0x220788A64](0, v12, v9, v24);
  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v32);
  swift_release();
  return swift_release();
}

uint64_t sub_21CC106B4(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_21CC3F72C();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_21CC106F4()
{
  return sub_21CC106B4(qword_25531CA48, (uint64_t)qword_25531CC78);
}

uint64_t sub_21CC10710(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220789664](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21CC10750(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x220789664](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21CC10790()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  __CFString *v11;
  id v12;
  __CFString *v13;
  int AppBooleanValue;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  char *v23;

  v1 = sub_21CC3F75C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (uint64_t *)((char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)((char *)v0 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5610], v1);
  v6 = v5;
  LOBYTE(v5) = sub_21CC3F768();
  v7 = (*(uint64_t (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v9 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8);
    v10 = v9(v7);
    v11 = (__CFString *)sub_21CC3F7A4();
    v12 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v13 = (__CFString *)objc_msgSend(v12, sel_bundleIdentifier);

    if (v13)
    {
      AppBooleanValue = CFPreferencesGetAppBooleanValue(v11, v13, 0);

      LOBYTE(v13) = AppBooleanValue != 0;
    }
    v15 = (*(uint64_t (**)(void))((*v8 & *v0) + 0x160))();
    v16 = (char *)sub_21CC109C4(v15);
    swift_bridgeObjectRelease();
    v23 = v16;
    v17 = v0;
    swift_retain();
    sub_21CC10CDC(&v23, (char)v13, v17);
    swift_release();

    v18 = (*(uint64_t (**)(char *))((*v8 & *v17) + 0x1B0))(v23);
    v19 = v9(v18);
    v20 = sub_21CC10A98(v10, v19);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return (v20 & 1) == 0;
  }
  else
  {
    __break(1u);

    result = swift_release();
    __break(1u);
  }
  return result;
}

uint64_t sub_21CC109B8()
{
  return sub_21CC19654();
}

uint64_t sub_21CC109C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7B8);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * v4 - 64;
  v5 = sub_21CC10B48(&v7, (_BYTE *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_21CC2FA08();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_21CC10A98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  BOOL v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v6 = 1;
    }
    else
    {
      v3 = a1 + 32;
      v4 = a2 + 32;
      sub_21CC196FC();
      v5 = v2 - 1;
      do
      {
        ++v3;
        ++v4;
        v6 = sub_21CC3F798();
        v8 = v5-- != 0;
      }
      while ((v6 & 1) != 0 && v8);
    }
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

_QWORD *sub_21CC10B48(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_BYTE *)(*(_QWORD *)(a4 + 48) + v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

void sub_21CC10CDC(char **a1, char a2, void *a3)
{
  char *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9[2];

  v5 = *a1;
  v6 = a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_21CC10D80((uint64_t)v5);
  v7 = *((_QWORD *)v5 + 2);
  v9[0] = (uint64_t)(v5 + 32);
  v9[1] = v7;
  v8 = v6;
  sub_21CC10E7C(v9, a2 & 1, v8);

  *a1 = v5;
}

char *sub_21CC10D80(uint64_t a1)
{
  return sub_21CC10D94(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_21CC10D94(char *result, int64_t a2, char a3, char *a4)
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
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7B8);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

void sub_21CC10E7C(uint64_t *a1, char a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  char v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unsigned __int8 *v77;
  uint64_t v78;
  unsigned __int8 v79;
  uint64_t v80;
  unsigned __int8 *v81;
  char v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  unsigned __int8 *v97;
  uint64_t v98;
  int v99[2];
  char *v100;
  unsigned __int8 v102;
  unsigned __int8 v103;
  unsigned __int8 v104;
  unsigned __int8 v105;
  unsigned __int8 v106;
  unsigned __int8 v107;

  v5 = a1[1];
  v6 = a3;
  v7 = sub_21CC3FA74();
  if (v7 >= v5)
  {
    if (v5 < 0)
      goto LABEL_138;
    if (v5)
    {
      v11 = v6;
      sub_21CC11600(0, v5, 1, a1, a2 & 1, v11);

    }
    else
    {

    }
LABEL_115:

    return;
  }
  if (v5 >= 0)
    v8 = v5;
  else
    v8 = v5 + 1;
  if (v5 < -1)
    goto LABEL_137;
  v93 = v5;
  v91 = v7;
  v89 = a1;
  if (v5 > 1)
  {
    v9 = v8 >> 1;
    v10 = sub_21CC3F87C();
    *(_QWORD *)(v10 + 16) = v9;
    v90 = v10;
    v97 = (unsigned __int8 *)(v10 + 32);
    goto LABEL_12;
  }
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v97 = (unsigned __int8 *)(MEMORY[0x24BEE4AF8] + 32);
  v90 = MEMORY[0x24BEE4AF8];
  if (v5 != 1)
  {
    v26 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_102:
    if (v26 >= 2)
    {
      v83 = *v89;
      v100 = v6;
      v98 = *v89;
      do
      {
        v84 = v26 - 2;
        if (v26 < 2)
          goto LABEL_132;
        if (!v83)
          goto LABEL_146;
        v6 = v12;
        v85 = *(_QWORD *)&v12[16 * v84 + 32];
        v86 = *(_QWORD *)&v12[16 * v26 + 24];
        sub_21CC3D5AC((unsigned __int8 *)(v83 + v85), (unsigned __int8 *)(v83 + *(_QWORD *)&v12[16 * v26 + 16]), v83 + v86, v97, a2 & 1, v100);
        if (v3)
          goto LABEL_99;
        if (v86 < v85)
          goto LABEL_133;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v12 = sub_21CC335C8((uint64_t)v12);
        v6 = v100;
        if (v84 >= *((_QWORD *)v12 + 2))
          goto LABEL_134;
        v87 = &v12[16 * v84 + 32];
        *(_QWORD *)v87 = v85;
        *((_QWORD *)v87 + 1) = v86;
        v88 = *((_QWORD *)v12 + 2);
        if (v26 > v88)
          goto LABEL_135;
        memmove(&v12[16 * v26 + 16], &v12[16 * v26 + 32], 16 * (v88 - v26));
        *((_QWORD *)v12 + 2) = v88 - 1;
        v26 = v88 - 1;
        v83 = v98;
      }
      while (v88 > 2);
    }
LABEL_113:
    swift_bridgeObjectRelease();
LABEL_114:
    *(_QWORD *)(v90 + 16) = 0;

    swift_bridgeObjectRelease();
    goto LABEL_115;
  }
LABEL_12:
  v13 = 0;
  v14 = *a1;
  v94 = v5 - 2;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v15 = v5;
  v100 = v6;
  v95 = *a1;
  while (1)
  {
    v16 = v13 + 1;
    if (v13 + 1 >= v15)
      goto LABEL_31;
    v105 = *(_BYTE *)(v14 + v16);
    v104 = *(_BYTE *)(v14 + v13);
    v17 = sub_21CC116E4(&v105, &v104, a2 & 1, v6);
    if (v3)
      goto LABEL_113;
    v18 = v17;
    v19 = v13;
    v16 = v13 + 2;
    if (v13 + 2 >= v93)
      goto LABEL_19;
    do
    {
      v103 = *(_BYTE *)(v14 + v19 + 2);
      v102 = *(_BYTE *)(v14 + v19 + 1);
      if (((v18 ^ sub_21CC116E4(&v103, &v102, a2 & 1, v6)) & 1) != 0)
      {
        v16 = v19 + 2;
        if ((v18 & 1) != 0)
          goto LABEL_20;
LABEL_30:
        v15 = v93;
        goto LABEL_31;
      }
      ++v19;
    }
    while (v94 != v19);
    v16 = v93;
LABEL_19:
    if ((v18 & 1) == 0)
      goto LABEL_30;
LABEL_20:
    if (v16 < v13)
      goto LABEL_142;
    v15 = v93;
    if (v13 < v16)
    {
      v20 = v16 - 1;
      v21 = v13;
      do
      {
        if (v21 != v20)
        {
          if (!v14)
            goto LABEL_145;
          v22 = *(_BYTE *)(v14 + v21);
          *(_BYTE *)(v14 + v21) = *(_BYTE *)(v14 + v20);
          *(_BYTE *)(v14 + v20) = v22;
        }
        v57 = ++v21 < v20--;
      }
      while (v57);
    }
LABEL_31:
    if (v16 >= v15)
      goto LABEL_39;
    if (__OFSUB__(v16, v13))
      goto LABEL_139;
    if (v16 - v13 >= v91)
    {
LABEL_39:
      if (v16 < v13)
        goto LABEL_136;
      goto LABEL_40;
    }
    v23 = v13 + v91;
    if (__OFADD__(v13, v91))
      goto LABEL_140;
    if (v23 >= v15)
      v23 = v15;
    if (v23 < v13)
      break;
    if (v16 == v23)
      goto LABEL_39;
    v77 = (unsigned __int8 *)(v14 + v16);
    *(_QWORD *)v99 = v23;
    do
    {
      v78 = v16;
      v79 = *(_BYTE *)(v14 + v16);
      v80 = v13;
      v81 = v77;
      do
      {
        v107 = v79;
        v106 = *(v81 - 1);
        v82 = sub_21CC116E4(&v107, &v106, a2 & 1, v6);
        if (v3)
          goto LABEL_113;
        if ((v82 & 1) == 0)
          break;
        if (!v14)
          goto LABEL_144;
        v79 = *v81;
        *v81 = *(v81 - 1);
        *(v81 - 1) = v79;
        ++v80;
        --v81;
      }
      while (v78 != v80);
      v16 = v78 + 1;
      ++v77;
    }
    while (v78 + 1 != *(_QWORD *)v99);
    v16 = *(_QWORD *)v99;
    if (*(uint64_t *)v99 < v13)
      goto LABEL_136;
LABEL_40:
    v92 = v16;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_21CC33428(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v25 = *((_QWORD *)v12 + 2);
    v24 = *((_QWORD *)v12 + 3);
    v26 = v25 + 1;
    if (v25 >= v24 >> 1)
      v12 = sub_21CC33428((char *)(v24 > 1), v25 + 1, 1, v12);
    *((_QWORD *)v12 + 2) = v26;
    v96 = v12 + 32;
    v27 = &v12[16 * v25 + 32];
    *(_QWORD *)v27 = v13;
    *((_QWORD *)v27 + 1) = v16;
    if (v25)
    {
      v28 = v12 + 32;
      while (1)
      {
        v29 = v26 - 1;
        if (v26 >= 4)
        {
          v34 = &v28[16 * v26];
          v35 = *((_QWORD *)v34 - 8);
          v36 = *((_QWORD *)v34 - 7);
          v40 = __OFSUB__(v36, v35);
          v37 = v36 - v35;
          if (v40)
            goto LABEL_121;
          v39 = *((_QWORD *)v34 - 6);
          v38 = *((_QWORD *)v34 - 5);
          v40 = __OFSUB__(v38, v39);
          v32 = v38 - v39;
          v33 = v40;
          if (v40)
            goto LABEL_122;
          v41 = v26 - 2;
          v42 = &v28[16 * v26 - 32];
          v44 = *(_QWORD *)v42;
          v43 = *((_QWORD *)v42 + 1);
          v40 = __OFSUB__(v43, v44);
          v45 = v43 - v44;
          if (v40)
            goto LABEL_123;
          v40 = __OFADD__(v32, v45);
          v46 = v32 + v45;
          if (v40)
            goto LABEL_125;
          if (v46 >= v37)
          {
            v64 = &v28[16 * v29];
            v66 = *(_QWORD *)v64;
            v65 = *((_QWORD *)v64 + 1);
            v40 = __OFSUB__(v65, v66);
            v67 = v65 - v66;
            if (v40)
              goto LABEL_131;
            v57 = v32 < v67;
            goto LABEL_77;
          }
        }
        else
        {
          if (v26 != 3)
          {
            v58 = *((_QWORD *)v12 + 4);
            v59 = *((_QWORD *)v12 + 5);
            v40 = __OFSUB__(v59, v58);
            v51 = v59 - v58;
            v52 = v40;
            goto LABEL_71;
          }
          v31 = *((_QWORD *)v12 + 4);
          v30 = *((_QWORD *)v12 + 5);
          v40 = __OFSUB__(v30, v31);
          v32 = v30 - v31;
          v33 = v40;
        }
        if ((v33 & 1) != 0)
          goto LABEL_124;
        v41 = v26 - 2;
        v47 = &v28[16 * v26 - 32];
        v49 = *(_QWORD *)v47;
        v48 = *((_QWORD *)v47 + 1);
        v50 = __OFSUB__(v48, v49);
        v51 = v48 - v49;
        v52 = v50;
        if (v50)
          goto LABEL_126;
        v53 = &v28[16 * v29];
        v55 = *(_QWORD *)v53;
        v54 = *((_QWORD *)v53 + 1);
        v40 = __OFSUB__(v54, v55);
        v56 = v54 - v55;
        if (v40)
          goto LABEL_128;
        if (__OFADD__(v51, v56))
          goto LABEL_130;
        if (v51 + v56 >= v32)
        {
          v57 = v32 < v56;
LABEL_77:
          if (v57)
            v29 = v41;
          goto LABEL_79;
        }
LABEL_71:
        if ((v52 & 1) != 0)
          goto LABEL_127;
        v60 = &v28[16 * v29];
        v62 = *(_QWORD *)v60;
        v61 = *((_QWORD *)v60 + 1);
        v40 = __OFSUB__(v61, v62);
        v63 = v61 - v62;
        if (v40)
          goto LABEL_129;
        if (v63 < v51)
          goto LABEL_88;
LABEL_79:
        v68 = v29 - 1;
        if (v29 - 1 >= v26)
        {
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        if (!v14)
          goto LABEL_143;
        v69 = v12;
        v70 = v14;
        v6 = &v28[16 * v68];
        v71 = *(_QWORD *)v6;
        v72 = v29;
        v73 = &v28[16 * v29];
        v74 = *((_QWORD *)v73 + 1);
        sub_21CC3D5AC((unsigned __int8 *)(v70 + *(_QWORD *)v6), (unsigned __int8 *)(v70 + *(_QWORD *)v73), v70 + v74, v97, a2 & 1, v100);
        if (v3)
        {
LABEL_99:
          swift_bridgeObjectRelease();
          v6 = v100;
          goto LABEL_114;
        }
        if (v74 < v71)
          goto LABEL_118;
        if (v72 > *((_QWORD *)v69 + 2))
          goto LABEL_119;
        v75 = v72;
        *(_QWORD *)v6 = v71;
        v28 = v96;
        *(_QWORD *)&v96[16 * v68 + 8] = v74;
        v76 = *((_QWORD *)v69 + 2);
        if (v72 >= v76)
          goto LABEL_120;
        v12 = v69;
        v26 = v76 - 1;
        memmove(v73, v73 + 16, 16 * (v76 - 1 - v75));
        *((_QWORD *)v69 + 2) = v76 - 1;
        v6 = v100;
        v14 = v95;
        if (v76 <= 2)
          goto LABEL_88;
      }
    }
    v26 = 1;
LABEL_88:
    v13 = v92;
    v15 = v93;
    if (v92 >= v93)
      goto LABEL_102;
  }
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:

  __break(1u);
LABEL_144:

  __break(1u);
LABEL_145:

  __break(1u);
LABEL_146:

  __break(1u);
}

uint64_t sub_21CC11600(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, char a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  unsigned __int8 *v11;
  char v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;

  if (a3 != a2)
  {
    v8 = a3;
    v10 = *a4;
    v11 = (unsigned __int8 *)(*a4 + a3);
    v12 = a5 & 1;
    v16 = result;
LABEL_4:
    v13 = *(_BYTE *)(v10 + v8);
    v14 = result;
    v15 = v11;
    while (1)
    {
      v18 = v13;
      v17 = *(v15 - 1);
      result = sub_21CC116E4(&v18, &v17, v12, a6);
      if (v6)
        break;
      if ((result & 1) != 0)
      {
        if (!v10)
        {
          __break(1u);
          return result;
        }
        v13 = *v15;
        *v15 = *(v15 - 1);
        *(v15 - 1) = v13;
        ++v14;
        --v15;
        if (v8 != v14)
          continue;
      }
      ++v8;
      ++v11;
      result = v16;
      if (v8 != a2)
        goto LABEL_4;
      return result;
    }
  }
  return result;
}

uint64_t sub_21CC116E4(unsigned __int8 *a1, unsigned __int8 *a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t result;
  char v11;
  char v12;
  char v13;
  _QWORD *v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v6 = *a1;
  v7 = *a2;
  sub_21CC11E70();
  sub_21CC3F828();
  sub_21CC3F828();
  if (v55 == v53 && v56 == v54)
    goto LABEL_13;
  v9 = sub_21CC3FAA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 1;
  sub_21CC3F828();
  sub_21CC3F828();
  if (v55 == v53 && v56 == v54)
    goto LABEL_8;
  v11 = sub_21CC3FAA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v11 & 1) == 0)
  {
    if ((a3 & 1) == 0)
      goto LABEL_20;
    sub_21CC3F828();
    sub_21CC3F828();
    if (v55 == v53 && v56 == v54)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return 1;
    }
    v12 = sub_21CC3FAA4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      return 1;
    sub_21CC3F828();
    sub_21CC3F828();
    if (v55 == v53 && v56 == v54)
    {
LABEL_8:
      swift_bridgeObjectRelease_n();
      return 0;
    }
    v13 = sub_21CC3FAA4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v13 & 1) == 0)
    {
LABEL_20:
      v14 = (_QWORD *)MEMORY[0x24BEE4EA0];
      v15 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *a4) + 0x178);
      v16 = v15(0);
      if (*(_QWORD *)(v16 + 16))
      {
        v17 = sub_21CC2EED8(v6);
        if ((v18 & 1) != 0)
        {
          v19 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if (v19 >> 62)
          {
            swift_bridgeObjectRetain();
            v49 = sub_21CC3FA14();
            swift_bridgeObjectRelease();
            if (!v49)
              goto LABEL_27;
          }
          else if (!*(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_27;
          }
          if ((v19 & 0xC000000000000001) != 0)
            goto LABEL_69;
          if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
LABEL_33:
            v24 = *(id *)(v19 + 32);
LABEL_34:
            v25 = v24;
            v26 = swift_bridgeObjectRelease();
LABEL_36:
            v27 = v15(v26);
            if (*(_QWORD *)(v27 + 16))
            {
              v28 = sub_21CC2EED8(v7);
              if ((v29 & 1) != 0)
              {
                v30 = *(_QWORD *)(*(_QWORD *)(v27 + 56) + 8 * v28);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                if (v30 >> 62)
                {
                  swift_bridgeObjectRetain();
                  v50 = sub_21CC3FA14();
                  swift_bridgeObjectRelease();
                  if (!v50)
                    goto LABEL_43;
                }
                else if (!*(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10))
                {
                  goto LABEL_43;
                }
                if ((v30 & 0xC000000000000001) != 0)
                  goto LABEL_70;
                if (*(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10))
                {
LABEL_49:
                  v35 = *(id *)(v30 + 32);
LABEL_50:
                  v36 = v35;
                  swift_bridgeObjectRelease();
LABEL_52:
                  if (v25)
                  {
                    if (!v36)
                    {

                      return 1;
                    }
                    v37 = v25;
                    v36 = v36;
                    if (!objc_msgSend(v37, sel_unearned)
                      || (objc_msgSend(v36, sel_unearned) & 1) == 0)
                    {
                      v38 = sub_21CC39FFC(v37, v36);

                      return v38 == -1;
                    }

                  }
                  else
                  {
                    if (v36)
                    {

                      return 0;
                    }
                    v37 = 0;
                  }
                  v39 = static AAUIAwardsDataProviderSection.allCases.getter();
                  v40 = sub_21CC3ABE0(v6, (uint64_t)v39);
                  v42 = v41;
                  swift_bridgeObjectRelease();
                  if ((v42 & 1) != 0)
                    v43 = 0;
                  else
                    v43 = v40;
                  v44 = static AAUIAwardsDataProviderSection.allCases.getter();
                  v45 = sub_21CC3ABE0(v7, (uint64_t)v44);
                  v47 = v46;
                  swift_bridgeObjectRelease();

                  if ((v47 & 1) != 0)
                    v48 = 0;
                  else
                    v48 = v45;
                  return v43 < v48;
                }
                __break(1u);
              }
            }
LABEL_43:
            v31 = swift_bridgeObjectRelease();
            v32 = (*(uint64_t (**)(uint64_t))((*v14 & *a4) + 0x160))(v31);
            if (*(_QWORD *)(v32 + 16))
            {
              v33 = sub_21CC2EED8(v7);
              if ((v34 & 1) != 0)
              {
                v30 = *(_QWORD *)(*(_QWORD *)(v32 + 56) + 8 * v33);
                swift_bridgeObjectRetain();
                result = swift_bridgeObjectRelease();
                if (v30 >> 62)
                {
                  swift_bridgeObjectRetain();
                  v52 = sub_21CC3FA14();
                  result = swift_bridgeObjectRelease();
                  if (v52)
                  {
LABEL_47:
                    if ((v30 & 0xC000000000000001) == 0)
                    {
                      if (*(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10))
                        goto LABEL_49;
LABEL_80:
                      __break(1u);
                      return result;
                    }
LABEL_70:
                    v35 = (id)MEMORY[0x220788B18](0, v30);
                    goto LABEL_50;
                  }
                }
                else if (*(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10))
                {
                  goto LABEL_47;
                }
              }
            }
            swift_bridgeObjectRelease();
            v36 = 0;
            goto LABEL_52;
          }
          __break(1u);
        }
      }
LABEL_27:
      v20 = swift_bridgeObjectRelease();
      v21 = (*(uint64_t (**)(uint64_t))((*v14 & *a4) + 0x160))(v20);
      if (*(_QWORD *)(v21 + 16))
      {
        v22 = sub_21CC2EED8(v6);
        if ((v23 & 1) != 0)
        {
          v19 = *(_QWORD *)(*(_QWORD *)(v21 + 56) + 8 * v22);
          swift_bridgeObjectRetain();
          result = swift_bridgeObjectRelease();
          if (v19 >> 62)
          {
            swift_bridgeObjectRetain();
            v51 = sub_21CC3FA14();
            result = swift_bridgeObjectRelease();
            if (v51)
            {
LABEL_31:
              if ((v19 & 0xC000000000000001) == 0)
              {
                if (!*(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
                {
                  __break(1u);
                  goto LABEL_80;
                }
                goto LABEL_33;
              }
LABEL_69:
              v24 = (id)MEMORY[0x220788B18](0, v19);
              goto LABEL_34;
            }
          }
          else if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_31;
          }
        }
      }
      v26 = swift_bridgeObjectRelease();
      v25 = 0;
      goto LABEL_36;
    }
  }
  return result;
}

uint64_t sub_21CC11D68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AAUIAwardsDataProviderSection.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t AAUIAwardsDataProviderSection.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC11DC0
                                                            + 4 * asc_21CC42040[*v0]))(0x495F524F465F4F47, 0xE900000000000054);
}

uint64_t sub_21CC11DC0()
{
  return 0x5954495649544341;
}

uint64_t sub_21CC11DD8()
{
  return 0x5354554F4B524F57;
}

uint64_t sub_21CC11DF0()
{
  return 0x5F5353454E544946;
}

uint64_t sub_21CC11E10()
{
  return 0x5F444554494D494CLL;
}

unint64_t sub_21CC11E34()
{
  return 0xD000000000000012;
}

uint64_t sub_21CC11E50()
{
  return 0x54495445504D4F43;
}

unint64_t sub_21CC11E70()
{
  unint64_t result;

  result = qword_25531C7A0;
  if (!qword_25531C7A0)
  {
    result = MEMORY[0x220789664](&protocol conformance descriptor for AAUIAwardsDataProviderSection, &type metadata for AAUIAwardsDataProviderSection);
    atomic_store(result, (unint64_t *)&qword_25531C7A0);
  }
  return result;
}

uint64_t sub_21CC11EB4(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientOrderedSections);
}

uint64_t sub_21CC11EC0(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_orderedSections);
}

uint64_t sub_21CC11ECC(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientTopAchievements);
}

uint64_t sub_21CC11ED8(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientAchievementsPerWorkoutIdentifier);
}

uint64_t sub_21CC11EE4(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientAchievementsPerSection);
}

uint64_t sub_21CC11EF0(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientMostRecentlyEarnedAchievementsPerSection);
}

uint64_t sub_21CC11EFC()
{
  return sub_21CC19654();
}

uint64_t sub_21CC11F08()
{
  unint64_t v0;
  unint64_t i;
  uint64_t (*v2)(_QWORD);
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unsigned __int8 v78;
  uint64_t result;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t (*v85)(_QWORD);
  _QWORD *v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;

  v3 = v0;
  v4 = sub_21CC3F75C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void **)(v3 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *(_QWORD *)v7 = v8;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5610], v4);
  v9 = v8;
  v10 = sub_21CC3F768();
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  v12 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v2 = *(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v3) + 0x148);
  v13 = v2(v11);
  if ((v13 & 0x8000000000000000) != 0 || (v13 & 0x4000000000000000) != 0)
  {
    v87 = (unint64_t)sub_21CC33334(v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    v87 = v13 & 0xFFFFFFFFFFFFFF8;
  }
  v14 = *(uint64_t (**)(void))((*v12 & *(_QWORD *)v3) + 0x160);
  v15 = v14();
  v5 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v15 + 16))
  {
    v16 = sub_21CC2EED8(0);
    if ((v17 & 1) != 0)
    {
      v89 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
      swift_bridgeObjectRetain();
    }
    else
    {
      v89 = MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    v89 = MEMORY[0x24BEE4AF8];
  }
  v18 = swift_bridgeObjectRelease();
  v7 = v3;
  v19 = ((uint64_t (*)(uint64_t))v14)(v18);
  v20 = sub_21CC12D10(v19);
  swift_bridgeObjectRelease();
  v91 = v5;
  v21 = v20[2];
  if (v21)
  {
    swift_retain();
    v22 = 0;
    do
    {
      ++v22;
      v23 = swift_bridgeObjectRetain();
      v7 = (uint64_t)&v91;
      sub_21CC1293C(v23);
    }
    while (v21 != v22);
    swift_release_n();
    v10 = v91;
  }
  else
  {
    swift_release();
    v10 = MEMORY[0x24BEE4AF8];
  }
  v91 = v5;
  if (v10 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    v24 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
    if (v24)
      goto LABEL_17;
LABEL_26:
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
    goto LABEL_27;
  }
  v24 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v24)
    goto LABEL_26;
LABEL_17:
  if (v24 < 1)
    goto LABEL_117;
  for (i = 0; i != v24; ++i)
  {
    v25 = *(id *)(v10 + 8 * i + 32);
    if ((objc_msgSend(v25, sel_unearned) & 1) != 0)
    {

    }
    else
    {
      sub_21CC3F9B4();
      v5 = *(_QWORD *)(v91 + 16);
      sub_21CC3F9D8();
      sub_21CC3F9E4();
      sub_21CC3F9C0();
    }
  }
  swift_bridgeObjectRelease();
  v7 = v91;
LABEL_27:
  v26 = (id)v3;
  swift_retain();
  if (v7 < 0 || (v27 = (_QWORD *)v7, (v7 & 0x4000000000000000) != 0))
  {
LABEL_109:
    v27 = sub_21CC33334(v7);
    swift_release();
  }
  v91 = (unint64_t)v27;
  v28 = v26;
  v3 = 0;
  sub_21CC136AC((uint64_t *)&v91, v28);
  swift_release();

  v86 = v28;
  v7 = v91;
  v29 = (v91 & 0x8000000000000000) != 0 || (v91 & 0x4000000000000000) != 0;
  if (!v29)
  {
    v30 = *(_QWORD *)(v91 + 16);
    v88 = 0;
    if (v30)
      goto LABEL_34;
LABEL_60:
    swift_release();
    goto LABEL_61;
  }
  swift_retain();
  v30 = sub_21CC3FA14();
  swift_release();
  v88 = 0;
  if (!v30)
    goto LABEL_60;
LABEL_34:
  if ((v30 & 0x8000000000000000) == 0)
  {
    if (v30 >= 3)
      v31 = 3;
    else
      v31 = v30;
    if (v29)
      goto LABEL_39;
LABEL_42:
    v33 = *(_QWORD *)(v7 + 16);
    goto LABEL_43;
  }
  v31 = 3;
  if (!v29)
    goto LABEL_42;
LABEL_39:
  swift_bridgeObjectRetain();
  v32 = sub_21CC3FA14();
  swift_release();
  if (v32 < 0)
    goto LABEL_118;
  swift_bridgeObjectRetain();
  v33 = sub_21CC3FA14();
  swift_release();
LABEL_43:
  if (v33 < v31)
    goto LABEL_119;
  if ((v7 & 0xC000000000000001) != 0)
  {
    sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
    v34 = 0;
    do
    {
      v5 = v34 + 1;
      sub_21CC3F984();
      v34 = v5;
    }
    while (v31 != v5);
  }
  if (!v29)
  {
    i = 0;
    v37 = v7 + 32;
    v40 = (2 * v31) | 1;
    if ((v40 & 1) != 0)
      goto LABEL_52;
LABEL_51:
    sub_21CC2EFA4(v7, v37, i, v40);
    v42 = v41;
    swift_unknownObjectRelease();
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  v35 = sub_21CC3FA20();
  v37 = v36;
  i = v38;
  v40 = v39;
  swift_release_n();
  v7 = v35;
  if ((v40 & 1) == 0)
    goto LABEL_51;
LABEL_52:
  sub_21CC3FAB0();
  swift_unknownObjectRetain_n();
  v43 = swift_dynamicCastClass();
  if (!v43)
  {
    swift_unknownObjectRelease();
    v43 = MEMORY[0x24BEE4AF8];
  }
  v44 = *(_QWORD *)(v43 + 16);
  swift_release();
  if (__OFSUB__(v40 >> 1, i))
  {
    __break(1u);
    goto LABEL_126;
  }
  if (v44 != (v40 >> 1) - i)
  {
LABEL_126:
    swift_unknownObjectRelease();
    goto LABEL_51;
  }
  v42 = swift_dynamicCastClass();
  swift_unknownObjectRelease();
  if (v42)
    goto LABEL_62;
  swift_unknownObjectRelease();
LABEL_61:
  v42 = MEMORY[0x24BEE4AF8];
LABEL_62:
  v90 = v42;
  if (v42 >> 62)
  {
    swift_bridgeObjectRetain();
    v45 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
  }
  else
  {
    v45 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFSUB__(3, v45))
  {
    __break(1u);
    goto LABEL_112;
  }
  if (3 - v45 <= 1)
    v5 = 1;
  else
    v5 = 3 - v45;
  v7 = MEMORY[0x24BEE4AF8];
  if (!v45)
  {
LABEL_80:
    sub_21CC12DF4(v89, (_QWORD *)v7);
    v55 = v54;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 = sub_21CC13028(v5, v55);
    v3 = v56;
    v5 = v57;
    i = v58;
    swift_bridgeObjectRelease();
    if ((i & 1) != 0)
    {
      sub_21CC3FAB0();
      swift_unknownObjectRetain_n();
      v61 = swift_dynamicCastClass();
      if (!v61)
      {
        swift_unknownObjectRelease();
        v61 = MEMORY[0x24BEE4AF8];
      }
      v62 = *(_QWORD *)(v61 + 16);
      swift_release();
      if (__OFSUB__(i >> 1, v5))
        goto LABEL_121;
      if (v62 != (i >> 1) - v5)
        goto LABEL_122;
      v60 = swift_dynamicCastClass();
      if (!v60)
      {
        swift_unknownObjectRelease();
        v60 = MEMORY[0x24BEE4AF8];
      }
      goto LABEL_88;
    }
    while (1)
    {
      sub_21CC2EFA4(v7, v3, v5, i);
      v60 = v59;
LABEL_88:
      swift_unknownObjectRelease();
      v91 = v60;
      sub_21CC1293C(v90);
      v7 = v91;
      v5 = v91 >> 62;
      if (!(v91 >> 62))
        break;
LABEL_112:
      if (v7 < 0)
        v3 = v7;
      else
        v3 = v7 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      v48 = sub_21CC3FA14();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v80 = sub_21CC3FA14();
      swift_bridgeObjectRelease();
      if ((v80 & 0x8000000000000000) == 0)
        goto LABEL_128;
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      swift_unknownObjectRelease();
    }
    if (*(uint64_t *)((v91 & 0xFFFFFFFFFFFFF8) + 0x10) >= 3)
      v63 = 3;
    else
      v63 = *(_QWORD *)((v91 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_92;
  }
  v91 = MEMORY[0x24BEE4AF8];
  v26 = (id)(v45 & ~(v45 >> 63));
  v3 = v90;
  swift_bridgeObjectRetain();
  v7 = (uint64_t)&v91;
  sub_21CC33318(0, (int64_t)v26, 0);
  if (v45 < 0)
    goto LABEL_120;
  v84 = v5;
  v85 = v2;
  v2 = 0;
  v7 = v91;
  i = v3 & 0xC000000000000001;
  while (1)
  {
    if ((uint64_t (*)(_QWORD))v45 == v2)
    {
      __break(1u);
      goto LABEL_109;
    }
    v46 = i ? (id)MEMORY[0x220788B18](v2, v90) : *(id *)(v90 + 8 * (_QWORD)v2 + 32);
    v47 = v46;
    v48 = (uint64_t)objc_msgSend(v46, sel_template);
    v49 = objc_msgSend((id)v48, sel_uniqueName);

    if (!v49)
      break;
    v26 = (id)sub_21CC3F7B0();
    v5 = v50;

    v91 = v7;
    v52 = *(_QWORD *)(v7 + 16);
    v51 = *(_QWORD *)(v7 + 24);
    if (v52 >= v51 >> 1)
    {
      sub_21CC33318(v51 > 1, v52 + 1, 1);
      v7 = v91;
    }
    v2 = (uint64_t (*)(_QWORD))((char *)v2 + 1);
    *(_QWORD *)(v7 + 16) = v52 + 1;
    v53 = v7 + 16 * v52;
    *(_QWORD *)(v53 + 32) = v26;
    *(_QWORD *)(v53 + 40) = v5;
    if ((uint64_t (*)(_QWORD))v45 == v2)
    {
      swift_bridgeObjectRelease();
      v5 = v84;
      v2 = v85;
      goto LABEL_80;
    }
  }
  __break(1u);

  swift_release();
  __break(1u);
LABEL_128:
  if (v48 >= 3)
    v81 = 3;
  else
    v81 = v48;
  if (v48 >= 0)
    v63 = v81;
  else
    v63 = 3;
  swift_bridgeObjectRetain();
  v82 = sub_21CC3FA14();
  result = swift_bridgeObjectRelease();
  if (v82 >= v63)
  {
LABEL_92:
    if ((v7 & 0xC000000000000001) != 0 && v63)
    {
      sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
      v64 = 0;
      do
      {
        v65 = v64 + 1;
        sub_21CC3F984();
        v64 = v65;
      }
      while (v63 != v65);
    }
    if (v5)
    {
      swift_bridgeObjectRetain();
      v66 = sub_21CC3FA20();
      v67 = v69;
      v5 = v70;
      v68 = v71;
      swift_bridgeObjectRelease_n();
      if ((v68 & 1) == 0)
        goto LABEL_100;
    }
    else
    {
      v66 = v7 & 0xFFFFFFFFFFFFFF8;
      v67 = (v7 & 0xFFFFFFFFFFFFFF8) + 32;
      v68 = (2 * v63) | 1;
      if ((v68 & 1) == 0)
        goto LABEL_100;
    }
    sub_21CC3FAB0();
    swift_unknownObjectRetain_n();
    v74 = swift_dynamicCastClass();
    if (!v74)
    {
      swift_unknownObjectRelease();
      v74 = MEMORY[0x24BEE4AF8];
    }
    v75 = *(_QWORD *)(v74 + 16);
    swift_release();
    if (__OFSUB__(v68 >> 1, v5))
    {
      __break(1u);
    }
    else if (v75 == (v68 >> 1) - v5)
    {
      v73 = swift_dynamicCastClass();
      if (!v73)
      {
        swift_unknownObjectRelease();
        v73 = MEMORY[0x24BEE4AF8];
      }
      goto LABEL_107;
    }
    swift_unknownObjectRelease();
LABEL_100:
    sub_21CC2EFA4(v66, v67, v5, v68);
    v73 = v72;
LABEL_107:
    swift_unknownObjectRelease();
    v76 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v86) + 0x150))(v73);
    v77 = v2(v76);
    v78 = sub_21CC131C0(v87, v77);
    swift_bridgeObjectRelease();
    swift_release();
    return (v78 & 1) == 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC12930()
{
  return sub_21CC19654();
}

uint64_t sub_21CC1293C(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x220788B24](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_21CC12AF4(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_21CC3F864();
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC12AF4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_21CC10750((unint64_t *)&qword_25531C8C8, &qword_25531C8C0, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8C0);
          v12 = sub_21CC35184(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_21CC3FA50();
  __break(1u);
  return result;
}

_QWORD *sub_21CC12D10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7E0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  v6 = sub_21CC134B4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21CC2FA08();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_21CC12DF4(unint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;

  v2 = a1;
  v23 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_32:
    v3 = sub_21CC3FA14();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
    {
LABEL_3:
      v18 = v2;
      v4 = 0;
      v20 = v2 & 0xFFFFFFFFFFFFFF8;
      v21 = v2 & 0xC000000000000001;
      v19 = (_QWORD *)(v2 + 32);
      while (1)
      {
        if (v21)
        {
          v5 = (id)MEMORY[0x220788B18](v4, v18);
        }
        else
        {
          if (v4 >= *(_QWORD *)(v20 + 16))
          {
            __break(1u);
LABEL_30:
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          v5 = (id)v19[v4];
        }
        v6 = v5;
        if (__OFADD__(v4++, 1))
          goto LABEL_30;
        v8 = objc_msgSend(v5, sel_template);
        v9 = objc_msgSend(v8, sel_uniqueName);

        if (!v9)
        {
          __break(1u);
          return;
        }
        v10 = sub_21CC3F7B0();
        v2 = (unint64_t)v11;

        v12 = a2[2];
        if (!v12)
          goto LABEL_26;
        v13 = a2[4] == v10 && a2[5] == v2;
        if (!v13 && (sub_21CC3FAA4() & 1) == 0)
          break;
LABEL_4:

        swift_bridgeObjectRelease();
LABEL_5:
        if (v4 == v3)
          return;
      }
      if (v12 != 1)
      {
        v14 = a2 + 7;
        v15 = 1;
        do
        {
          v16 = v15 + 1;
          if (__OFADD__(v15, 1))
            goto LABEL_31;
          v17 = *(v14 - 1) == v10 && *v14 == v2;
          if (v17 || (sub_21CC3FAA4() & 1) != 0)
            goto LABEL_4;
          v14 += 2;
          ++v15;
        }
        while (v16 != v12);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      sub_21CC3F9B4();
      sub_21CC3F9D8();
      sub_21CC3F9E4();
      v2 = (unint64_t)&v23;
      sub_21CC3F9C0();
      goto LABEL_5;
    }
  }
}

uint64_t sub_21CC13028(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = result;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v5 = sub_21CC3FA14();
  result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  if (v5 < 0)
    v6 = v3;
  if (v3)
    v7 = v6;
  else
    v7 = 0;
  if (v4)
  {
    swift_bridgeObjectRetain();
    v9 = sub_21CC3FA14();
    result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    v8 = sub_21CC3FA14();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_21CC0B890();
    v10 = 0;
    do
    {
      v11 = v10 + 1;
      sub_21CC3F984();
      v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v12 = sub_21CC3FA20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

id sub_21CC131C0(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_21CC3FA14();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x220788B18](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x220788B18](0, v2);
LABEL_21:
    v14 = v13;
    sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
    v15 = sub_21CC3F8F4();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x220788B18](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x220788B18](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_21CC3F8F4();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_21CC3F8F4();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC134B4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    result = swift_bridgeObjectRetain();
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

void sub_21CC136AC(uint64_t *a1, void *a2)
{
  uint64_t v3;
  id v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  id v7;
  uint64_t v8[2];

  v3 = *a1;
  v4 = a2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_21CC14A34();
  v6 = *(_QWORD *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  v7 = v4;
  sub_21CC13748(v8, v7);

  sub_21CC3F9C0();
}

void sub_21CC13748(uint64_t *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  char v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  id v99;
  unint64_t v100;
  size_t v101;
  void *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  id v110;
  char *v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  char *v120;
  char *v121;
  char *v122;
  uint64_t v123;
  id *v124;
  uint64_t v125;
  void *__src;
  id *__srca;
  id *__srcb;
  uint64_t v129;
  id *v130;
  id v131;
  uint64_t v132;

  v3 = v2;
  v5 = a1[1];
  v131 = a2;
  v6 = sub_21CC3FA74();
  if (v6 >= v5)
  {
    if (v5 < 0)
      goto LABEL_136;
    if (v5)
    {
      v10 = v131;
      v11 = v5;
      v12 = v10;
      sub_21CC15480(0, v11, 1, a1);

    }
    else
    {

    }
    return;
  }
  if (v5 >= 0)
    v7 = v5;
  else
    v7 = v5 + 1;
  if (v5 < -1)
    goto LABEL_144;
  v115 = a1;
  v116 = v6;
  v118 = v5;
  if (v5 < 2)
  {
    v13 = (char *)MEMORY[0x24BEE4AF8];
    v132 = MEMORY[0x24BEE4AF8];
    v122 = (char *)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v5 != 1)
    {
      v17 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_101:
      if (v17 >= 2)
      {
        v103 = *v115;
        v125 = *v115;
        do
        {
          v104 = v17 - 2;
          if (v17 < 2)
            goto LABEL_131;
          if (!v103)
            goto LABEL_143;
          v105 = v3;
          v106 = (uint64_t)v13;
          v107 = *(_QWORD *)&v13[16 * v104 + 32];
          v108 = *(_QWORD *)&v13[16 * v17 + 24];
          v130 = (id *)(v103 + 8 * v107);
          __srcb = (id *)(v103 + 8 * *(_QWORD *)&v13[16 * v17 + 16]);
          v109 = v103 + 8 * v108;
          v110 = v131;
          sub_21CC3535C(v130, __srcb, v109, v122, v110);
          v3 = v105;
          if (v105)
            goto LABEL_98;

          if (v108 < v107)
            goto LABEL_132;
          v13 = (char *)v106;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v13 = sub_21CC335C8(v106);
          if (v104 >= *((_QWORD *)v13 + 2))
            goto LABEL_133;
          v111 = &v13[16 * v104 + 32];
          *(_QWORD *)v111 = v107;
          *((_QWORD *)v111 + 1) = v108;
          v112 = *((_QWORD *)v13 + 2);
          if (v17 > v112)
            goto LABEL_134;
          memmove(&v13[16 * v17 + 16], &v13[16 * v17 + 32], 16 * (v112 - v17));
          *((_QWORD *)v13 + 2) = v112 - 1;
          v17 = v112 - 1;
          v103 = v125;
        }
        while (v112 > 2);
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)((v132 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_21CC3F864();
      v102 = v131;
LABEL_113:

      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v8 = v7 >> 1;
    sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
    v9 = sub_21CC3F87C();
    *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    v122 = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    v132 = v9;
  }
  v14 = 0;
  v15 = *a1;
  v113 = *a1 - 8;
  v114 = *a1 + 16;
  v13 = (char *)MEMORY[0x24BEE4AF8];
  v16 = v118;
  v129 = *v115;
  while (1)
  {
    v18 = (uint64_t)v14;
    v19 = (uint64_t)(v14 + 1);
    __src = v14;
    if ((uint64_t)(v14 + 1) < v16)
    {
      v20 = v15;
      v21 = v13;
      v22 = v3;
      v23 = *(void **)(v20 + 8 * v18);
      v24 = *(id *)(v20 + 8 * v19);
      v25 = v23;
      v16 = v118;
      v26 = sub_21CC39FFC(v24, v25);

      v19 = v18 + 2;
      if (v18 + 2 < v118)
      {
        v27 = (id *)(v114 + 8 * v18);
        while (1)
        {
          v28 = v19;
          v29 = *(v27 - 1);
          v30 = *v27;
          v31 = v29;
          v32 = sub_21CC39FFC(v30, v31);

          if ((v26 == -1) == (v32 != -1))
            break;
          v19 = v28 + 1;
          ++v27;
          v16 = v118;
          if (v118 == v28 + 1)
          {
            v19 = v118;
            goto LABEL_22;
          }
        }
        v16 = v118;
        v19 = v28;
LABEL_22:
        v18 = (uint64_t)__src;
      }
      v3 = v22;
      v13 = v21;
      if (v26 == -1)
      {
        v15 = v129;
        if (v19 < v18)
          goto LABEL_139;
        if (v18 < v19)
        {
          v33 = (uint64_t *)(v113 + 8 * v19);
          v34 = v19;
          v35 = v18;
          v36 = (uint64_t *)(v129 + 8 * v18);
          do
          {
            if (v35 != --v34)
            {
              if (!v129)
                goto LABEL_142;
              v37 = *v36;
              *v36 = *v33;
              *v33 = v37;
            }
            ++v35;
            --v33;
            ++v36;
          }
          while (v35 < v34);
        }
      }
      else
      {
        v15 = v129;
      }
    }
    if (v19 < v16)
    {
      if (__OFSUB__(v19, v18))
        goto LABEL_135;
      if (v19 - v18 < v116)
        break;
    }
LABEL_50:
    if (v19 < v18)
      goto LABEL_130;
    v117 = (char *)v19;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_21CC33428(0, *((_QWORD *)v13 + 2) + 1, 1, v13);
    v50 = *((_QWORD *)v13 + 2);
    v49 = *((_QWORD *)v13 + 3);
    v17 = v50 + 1;
    if (v50 >= v49 >> 1)
      v13 = sub_21CC33428((char *)(v49 > 1), v50 + 1, 1, v13);
    *((_QWORD *)v13 + 2) = v17;
    v51 = v13 + 32;
    v52 = &v13[16 * v50 + 32];
    *(_QWORD *)v52 = v18;
    *((_QWORD *)v52 + 1) = v117;
    if (v50)
    {
      v119 = v13 + 32;
      v121 = v13;
      while (1)
      {
        v53 = v17 - 1;
        if (v17 >= 4)
        {
          v58 = &v51[16 * v17];
          v59 = *((_QWORD *)v58 - 8);
          v60 = *((_QWORD *)v58 - 7);
          v64 = __OFSUB__(v60, v59);
          v61 = v60 - v59;
          if (v64)
            goto LABEL_119;
          v63 = *((_QWORD *)v58 - 6);
          v62 = *((_QWORD *)v58 - 5);
          v64 = __OFSUB__(v62, v63);
          v56 = v62 - v63;
          v57 = v64;
          if (v64)
            goto LABEL_120;
          v65 = v17 - 2;
          v66 = &v51[16 * v17 - 32];
          v68 = *(_QWORD *)v66;
          v67 = *((_QWORD *)v66 + 1);
          v64 = __OFSUB__(v67, v68);
          v69 = v67 - v68;
          if (v64)
            goto LABEL_122;
          v64 = __OFADD__(v56, v69);
          v70 = v56 + v69;
          if (v64)
            goto LABEL_125;
          if (v70 >= v61)
          {
            v88 = &v51[16 * v53];
            v90 = *(_QWORD *)v88;
            v89 = *((_QWORD *)v88 + 1);
            v64 = __OFSUB__(v89, v90);
            v91 = v89 - v90;
            if (v64)
              goto LABEL_129;
            v81 = v56 < v91;
            goto LABEL_88;
          }
        }
        else
        {
          if (v17 != 3)
          {
            v82 = *((_QWORD *)v13 + 4);
            v83 = *((_QWORD *)v13 + 5);
            v64 = __OFSUB__(v83, v82);
            v75 = v83 - v82;
            v76 = v64;
            goto LABEL_82;
          }
          v55 = *((_QWORD *)v13 + 4);
          v54 = *((_QWORD *)v13 + 5);
          v64 = __OFSUB__(v54, v55);
          v56 = v54 - v55;
          v57 = v64;
        }
        if ((v57 & 1) != 0)
          goto LABEL_121;
        v65 = v17 - 2;
        v71 = &v51[16 * v17 - 32];
        v73 = *(_QWORD *)v71;
        v72 = *((_QWORD *)v71 + 1);
        v74 = __OFSUB__(v72, v73);
        v75 = v72 - v73;
        v76 = v74;
        if (v74)
          goto LABEL_124;
        v77 = &v51[16 * v53];
        v79 = *(_QWORD *)v77;
        v78 = *((_QWORD *)v77 + 1);
        v64 = __OFSUB__(v78, v79);
        v80 = v78 - v79;
        if (v64)
          goto LABEL_127;
        if (__OFADD__(v75, v80))
          goto LABEL_128;
        if (v75 + v80 >= v56)
        {
          v81 = v56 < v80;
LABEL_88:
          if (v81)
            v53 = v65;
          goto LABEL_90;
        }
LABEL_82:
        if ((v76 & 1) != 0)
          goto LABEL_123;
        v84 = &v51[16 * v53];
        v86 = *(_QWORD *)v84;
        v85 = *((_QWORD *)v84 + 1);
        v64 = __OFSUB__(v85, v86);
        v87 = v85 - v86;
        if (v64)
          goto LABEL_126;
        if (v87 < v75)
          goto LABEL_14;
LABEL_90:
        v92 = v53 - 1;
        if (v53 - 1 >= v17)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
          goto LABEL_138;
        }
        if (!v15)
          goto LABEL_141;
        v93 = v51;
        v94 = &v51[16 * v92];
        v95 = *(_QWORD *)v94;
        v96 = v53;
        v97 = &v93[16 * v53];
        v98 = *((_QWORD *)v97 + 1);
        v124 = (id *)(v15 + 8 * *(_QWORD *)v97);
        __srca = (id *)(v15 + 8 * *(_QWORD *)v94);
        v99 = v131;
        sub_21CC3535C(__srca, v124, v15 + 8 * v98, v122, v99);
        if (v3)
        {
LABEL_98:
          swift_bridgeObjectRelease();
          v102 = v131;

          *(_QWORD *)((v132 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_21CC3F864();
          goto LABEL_113;
        }

        if (v98 < v95)
          goto LABEL_116;
        if (v96 > *((_QWORD *)v121 + 2))
          goto LABEL_117;
        *(_QWORD *)v94 = v95;
        v51 = v119;
        *(_QWORD *)&v119[16 * v92 + 8] = v98;
        v100 = *((_QWORD *)v121 + 2);
        if (v96 >= v100)
          goto LABEL_118;
        v17 = v100 - 1;
        v101 = 16 * (v100 - 1 - v96);
        v13 = v121;
        memmove(v97, v97 + 16, v101);
        *((_QWORD *)v121 + 2) = v100 - 1;
        v15 = v129;
        if (v100 <= 2)
          goto LABEL_14;
      }
    }
    v17 = 1;
LABEL_14:
    v14 = v117;
    v16 = v118;
    if ((uint64_t)v117 >= v118)
      goto LABEL_101;
  }
  if (__OFADD__(v18, v116))
    goto LABEL_137;
  if (v18 + v116 >= v16)
    v38 = (char *)v16;
  else
    v38 = (char *)(v18 + v116);
  if ((uint64_t)v38 >= v18)
  {
    if ((char *)v19 != v38)
    {
      v120 = v13;
      v123 = v3;
      v39 = v113 + 8 * v19;
      do
      {
        v40 = *(void **)(v15 + 8 * v19);
        v41 = v18;
        v42 = v39;
        while (1)
        {
          v43 = v19;
          v44 = *(void **)v42;
          v45 = v40;
          v46 = v44;
          v47 = sub_21CC39FFC(v45, v46);

          if (v47 != -1)
            break;
          v15 = v129;
          if (!v129)
            goto LABEL_140;
          v19 = v43;
          v48 = *(void **)v42;
          v40 = *(void **)(v42 + 8);
          *(_QWORD *)v42 = v40;
          *(_QWORD *)(v42 + 8) = v48;
          v42 -= 8;
          if (v43 == ++v41)
            goto LABEL_43;
        }
        v15 = v129;
        v19 = v43;
LABEL_43:
        ++v19;
        v39 += 8;
        v18 = (uint64_t)__src;
      }
      while ((char *)v19 != v38);
      v19 = (uint64_t)v38;
      v3 = v123;
      v13 = v120;
    }
    goto LABEL_50;
  }
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:

  __break(1u);
LABEL_141:

  __break(1u);
LABEL_142:

  __break(1u);
LABEL_143:

  __break(1u);
LABEL_144:

  sub_21CC3F9FC();
  __break(1u);
}

uint64_t sub_21CC13FE8(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_topAchievements);
}

unint64_t sub_21CC13FF4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8A0);
  v2 = (_QWORD *)sub_21CC3FA44();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *((unsigned __int8 *)v4 - 8);
    v6 = *v4;
    swift_bridgeObjectRetain();
    result = sub_21CC2EED8(v5);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    *(_QWORD *)(v2[7] + 8 * result) = v6;
    v9 = v2[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      goto LABEL_11;
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
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

uint64_t sub_21CC140F4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t j;
  id v35;
  void *v36;
  unint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  void (*v63)(uint64_t *, _QWORD);
  uint64_t v64;
  char v65;
  uint64_t result;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  int64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  int64_t v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78[5];

  v1 = v0;
  v2 = sub_21CC3F75C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)((char *)v1 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5610], v2);
  v7 = v6;
  LOBYTE(v6) = sub_21CC3F768();
  v8 = (*(uint64_t (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
    goto LABEL_92;
  v9 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x160))(v8);
  v10 = 0;
  v11 = *(_QWORD *)(v9 + 64);
  v69 = v9 + 64;
  v71 = v9;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v15 = MEMORY[0x24BEE4AF8];
  v70 = (unint64_t)(v12 + 63) >> 6;
  v68 = v1;
  while (1)
  {
    if (v14)
    {
      v74 = (v14 - 1) & v14;
      v22 = __clz(__rbit64(v14)) | (v10 << 6);
    }
    else
    {
      if (__OFADD__(v10++, 1))
        goto LABEL_90;
      if (v10 >= v70)
        return swift_release();
      v24 = *(_QWORD *)(v69 + 8 * v10);
      if (!v24)
      {
        v25 = v10 + 1;
        if (v10 + 1 >= v70)
          return swift_release();
        v24 = *(_QWORD *)(v69 + 8 * v25);
        if (!v24)
        {
          v25 = v10 + 2;
          if (v10 + 2 >= v70)
            return swift_release();
          v24 = *(_QWORD *)(v69 + 8 * v25);
          if (!v24)
          {
            v25 = v10 + 3;
            if (v10 + 3 >= v70)
              return swift_release();
            v24 = *(_QWORD *)(v69 + 8 * v25);
            if (!v24)
            {
              while (1)
              {
                v10 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_91;
                if (v10 >= v70)
                  return swift_release();
                v24 = *(_QWORD *)(v69 + 8 * v10);
                ++v25;
                if (v24)
                  goto LABEL_20;
              }
            }
          }
        }
        v10 = v25;
      }
LABEL_20:
      v74 = (v24 - 1) & v24;
      v22 = __clz(__rbit64(v24)) + (v10 << 6);
    }
    v75 = v10;
    v3 = *(unsigned __int8 *)(*(_QWORD *)(v71 + 48) + v22);
    v26 = *(_QWORD *)(*(_QWORD *)(v71 + 56) + 8 * v22);
    v78[0] = v15;
    if (v26 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v27 = sub_21CC3FA14();
      v76 = v3;
      if (!v27)
      {
LABEL_38:
        swift_bridgeObjectRelease();
        v31 = v15;
        goto LABEL_39;
      }
    }
    else
    {
      v27 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      v76 = v3;
      if (!v27)
        goto LABEL_38;
    }
    if (v27 < 1)
      break;
    for (i = 0; i != v27; ++i)
    {
      if ((v26 & 0xC000000000000001) != 0)
        v29 = (id)MEMORY[0x220788B18](i, v26);
      else
        v29 = *(id *)(v26 + 8 * i + 32);
      v30 = v29;
      if ((objc_msgSend(v29, sel_unearned) & 1) != 0)
      {

      }
      else
      {
        sub_21CC3F9B4();
        sub_21CC3F9D8();
        sub_21CC3F9E4();
        sub_21CC3F9C0();
      }
    }
    swift_bridgeObjectRelease();
    v31 = v78[0];
    LODWORD(v3) = v76;
LABEL_39:
    switch((_DWORD)v3)
    {
      case 1:
        swift_bridgeObjectRetain();
        if ((v31 & 0x8000000000000000) != 0 || (v38 = (_QWORD *)v31, (v31 & 0x4000000000000000) != 0))
        {
          v38 = sub_21CC33334(v31);
          swift_release();
        }
        v78[0] = (uint64_t)v38;
        sub_21CC3AD24(v78);
        swift_release();
        break;
      case 2:
        v32 = sub_21CC1555C(v31);
LABEL_44:
        v33 = v32;
        swift_release();
        v78[0] = v15;
        if (!v27)
          goto LABEL_61;
        goto LABEL_45;
      case 3:
        v32 = sub_21CC3E39C(v31);
        goto LABEL_44;
      default:
        swift_retain();
        v39 = v1;
        if ((v31 & 0x8000000000000000) != 0 || (v40 = (_QWORD *)v31, (v31 & 0x4000000000000000) != 0))
        {
          v40 = sub_21CC33334(v31);
          swift_release();
        }
        v78[0] = (uint64_t)v40;
        v41 = v39;
        sub_21CC14998(v78, v41);
        swift_release();

        break;
    }
    v33 = v78[0];
    v78[0] = v15;
    if (!v27)
    {
LABEL_61:
      swift_bridgeObjectRelease();
      v37 = v15;
      goto LABEL_62;
    }
LABEL_45:
    for (j = 0; j != v27; ++j)
    {
      if ((v26 & 0xC000000000000001) != 0)
        v35 = (id)MEMORY[0x220788B18](j, v26);
      else
        v35 = *(id *)(v26 + 8 * j + 32);
      v36 = v35;
      if (objc_msgSend(v35, sel_unearned))
      {
        sub_21CC3F9B4();
        sub_21CC3F9D8();
        sub_21CC3F9E4();
        sub_21CC3F9C0();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    v37 = v78[0];
LABEL_62:
    v42 = v1;
    swift_retain();
    if ((v37 & 0x8000000000000000) != 0 || (v43 = (_QWORD *)v37, (v37 & 0x4000000000000000) != 0))
    {
      v43 = sub_21CC33334(v37);
      swift_release();
    }
    v78[0] = (uint64_t)v43;
    v3 = v42;
    sub_21CC14998(v78, (void *)v3);
    swift_release();

    v72 = v78[0];
    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      v44 = sub_21CC3FA14();
      v73 = (_QWORD *)v3;
      if (!v44)
      {
LABEL_79:
        swift_bridgeObjectRelease();
        v15 = MEMORY[0x24BEE4AF8];
        v46 = MEMORY[0x24BEE4AF8];
        goto LABEL_80;
      }
    }
    else
    {
      v44 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      v73 = (_QWORD *)v3;
      if (!v44)
        goto LABEL_79;
    }
    v78[0] = MEMORY[0x24BEE4AF8];
    sub_21CC3DCC8(0, v44 & ~(v44 >> 63), 0);
    if (v44 < 0)
      goto LABEL_89;
    v45 = 0;
    v46 = v78[0];
    do
    {
      if ((v33 & 0xC000000000000001) != 0)
        v47 = (id)MEMORY[0x220788B18](v45, v33);
      else
        v47 = *(id *)(v33 + 8 * v45 + 32);
      v48 = v47;
      v49 = objc_msgSend(v47, sel_template);
      v50 = objc_msgSend(v49, sel_uniqueName);

      if (v50)
      {
        v51 = sub_21CC3F7B0();
        v53 = v52;

      }
      else
      {

        v51 = 0;
        v53 = 0;
      }
      v78[0] = v46;
      v55 = *(_QWORD *)(v46 + 16);
      v54 = *(_QWORD *)(v46 + 24);
      if (v55 >= v54 >> 1)
      {
        sub_21CC3DCC8((_QWORD *)(v54 > 1), v55 + 1, 1);
        v46 = v78[0];
      }
      ++v45;
      *(_QWORD *)(v46 + 16) = v55 + 1;
      v56 = v46 + 16 * v55;
      *(_QWORD *)(v56 + 32) = v51;
      *(_QWORD *)(v56 + 40) = v53;
    }
    while (v44 != v45);
    swift_bridgeObjectRelease();
    v1 = v68;
    v15 = MEMORY[0x24BEE4AF8];
LABEL_80:
    v57 = v72;
    v58 = swift_retain();
    v59 = sub_21CC15278(v58, v46);
    swift_release();
    swift_bridgeObjectRelease();
    v60 = v76;
    if (((1 << v76) & 0x4E) != 0)
    {
      swift_release();
      v78[0] = v33;
      sub_21CC1293C(v59);
      v16 = v78[0];
      v3 = (*(uint64_t (**)(uint64_t *))((*MEMORY[0x24BEE4EA0] & *v73) + 0x170))(v78);
      v18 = v17;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v77 = *v18;
      *v18 = 0x8000000000000000;
      v20 = v16;
      v21 = v60;
LABEL_6:
      sub_21CC33BCC(v20, v21, isUniquelyReferenced_nonNull_native);
      *v18 = v77;
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t *, _QWORD))v3)(v78, 0);
      goto LABEL_7;
    }
    if (((1 << v76) & 0x30) != 0)
    {
      swift_bridgeObjectRelease();
      v78[0] = v57;
      sub_21CC1293C(v33);
      v61 = v78[0];
      v3 = (*(uint64_t (**)(uint64_t *))((*MEMORY[0x24BEE4EA0] & *v73) + 0x170))(v78);
      v18 = v62;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v77 = *v18;
      *v18 = 0x8000000000000000;
      v20 = v61;
      v21 = v76;
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v63 = (void (*)(uint64_t *, _QWORD))(*(uint64_t (**)(uint64_t *))((*MEMORY[0x24BEE4EA0] & *v73)
                                                                                       + 0x170))(v78);
    v3 = v64;
    v65 = swift_isUniquelyReferenced_nonNull_native();
    v77 = *(_QWORD *)v3;
    *(_QWORD *)v3 = 0x8000000000000000;
    sub_21CC33BCC(v57, 0, v65);
    *(_QWORD *)v3 = v77;
    swift_bridgeObjectRelease();
    v63(v78, 0);
LABEL_7:
    v14 = v74;
    v10 = v75;
  }
  __break(1u);
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);

  result = swift_release();
  __break(1u);
  return result;
}

void sub_21CC14998(uint64_t *a1, void *a2)
{
  uint64_t v3;
  id v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  id v7;
  uint64_t v8[2];

  v3 = *a1;
  v4 = a2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_21CC14A34();
  v6 = *(_QWORD *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  v7 = v4;
  sub_21CC14A48(v8, v7);

  sub_21CC3F9C0();
}

void sub_21CC14A34()
{
  JUMPOUT(0x220788BF0);
}

void sub_21CC14A48(uint64_t *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  char v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  id v99;
  unint64_t v100;
  size_t v101;
  void *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  id v110;
  char *v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  char *v120;
  char *v121;
  void **v122;
  uint64_t v123;
  void **v124;
  uint64_t v125;
  uint64_t v126;
  void **v127;
  void **v128;
  uint64_t v129;
  void **v130;
  id v131;
  uint64_t v132;

  v3 = v2;
  v5 = a1[1];
  v131 = a2;
  v6 = sub_21CC3FA74();
  if (v6 >= v5)
  {
    if (v5 < 0)
      goto LABEL_138;
    if (v5)
    {
      v10 = v131;
      v11 = v5;
      v12 = v10;
      sub_21CC15480(0, v11, 1, a1);

    }
    else
    {

    }
    return;
  }
  if (v5 >= 0)
    v7 = v5;
  else
    v7 = v5 + 1;
  if (v5 < -1)
    goto LABEL_137;
  v115 = a1;
  v116 = v6;
  v118 = v5;
  if (v5 > 1)
  {
    v8 = v7 >> 1;
    sub_21CC0B890();
    v9 = sub_21CC3F87C();
    *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    v122 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    v132 = v9;
    goto LABEL_12;
  }
  v13 = (char *)MEMORY[0x24BEE4AF8];
  v132 = MEMORY[0x24BEE4AF8];
  v122 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
  if (v5 == 1)
  {
LABEL_12:
    v14 = 0;
    v15 = *a1;
    v113 = *a1 - 8;
    v114 = *a1 + 16;
    v13 = (char *)MEMORY[0x24BEE4AF8];
    v16 = v118;
    v129 = *v115;
    while (1)
    {
      v18 = v14;
      v19 = v14 + 1;
      v126 = v14;
      if (v14 + 1 < v16)
      {
        v20 = v15;
        v21 = v13;
        v22 = v3;
        v23 = *(void **)(v20 + 8 * v18);
        v24 = *(id *)(v20 + 8 * v19);
        v25 = v23;
        v16 = v118;
        v26 = sub_21CC39FFC(v24, v25);

        v19 = v18 + 2;
        if (v18 + 2 < v118)
        {
          v27 = (id *)(v114 + 8 * v18);
          while (1)
          {
            v28 = v19;
            v29 = *(v27 - 1);
            v30 = *v27;
            v31 = v29;
            v32 = sub_21CC39FFC(v30, v31);

            if ((v26 == -1) == (v32 != -1))
              break;
            v19 = v28 + 1;
            ++v27;
            v16 = v118;
            if (v118 == v28 + 1)
            {
              v19 = v118;
              goto LABEL_22;
            }
          }
          v16 = v118;
          v19 = v28;
LABEL_22:
          v18 = v126;
        }
        v3 = v22;
        v13 = v21;
        if (v26 == -1)
        {
          v15 = v129;
          if (v19 < v18)
            goto LABEL_141;
          if (v18 < v19)
          {
            v33 = (uint64_t *)(v113 + 8 * v19);
            v34 = v19;
            v35 = v18;
            v36 = (uint64_t *)(v129 + 8 * v18);
            do
            {
              if (v35 != --v34)
              {
                if (!v129)
                  goto LABEL_144;
                v37 = *v36;
                *v36 = *v33;
                *v33 = v37;
              }
              ++v35;
              --v33;
              ++v36;
            }
            while (v35 < v34);
          }
        }
        else
        {
          v15 = v129;
        }
      }
      if (v19 < v16)
      {
        if (__OFSUB__(v19, v18))
          goto LABEL_136;
        if (v19 - v18 < v116)
        {
          if (__OFADD__(v18, v116))
            goto LABEL_139;
          if (v18 + v116 >= v16)
            v38 = v16;
          else
            v38 = v18 + v116;
          if (v38 < v18)
          {
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:

            __break(1u);
LABEL_143:

            __break(1u);
LABEL_144:

            __break(1u);
LABEL_145:

            __break(1u);
            return;
          }
          if (v19 != v38)
          {
            v120 = v13;
            v123 = v3;
            v39 = v113 + 8 * v19;
            do
            {
              v40 = *(void **)(v15 + 8 * v19);
              v41 = v18;
              v42 = v39;
              while (1)
              {
                v43 = v19;
                v44 = *(void **)v42;
                v45 = v40;
                v46 = v44;
                v47 = sub_21CC39FFC(v45, v46);

                if (v47 != -1)
                  break;
                v15 = v129;
                if (!v129)
                  goto LABEL_142;
                v19 = v43;
                v48 = *(void **)v42;
                v40 = *(void **)(v42 + 8);
                *(_QWORD *)v42 = v40;
                *(_QWORD *)(v42 + 8) = v48;
                v42 -= 8;
                if (v43 == ++v41)
                  goto LABEL_44;
              }
              v15 = v129;
              v19 = v43;
LABEL_44:
              ++v19;
              v39 += 8;
              v18 = v126;
            }
            while (v19 != v38);
            v19 = v38;
            v3 = v123;
            v13 = v120;
          }
        }
      }
      if (v19 < v18)
        goto LABEL_131;
      v117 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v13 = sub_21CC33428(0, *((_QWORD *)v13 + 2) + 1, 1, v13);
      v50 = *((_QWORD *)v13 + 2);
      v49 = *((_QWORD *)v13 + 3);
      v17 = v50 + 1;
      if (v50 >= v49 >> 1)
        v13 = sub_21CC33428((char *)(v49 > 1), v50 + 1, 1, v13);
      *((_QWORD *)v13 + 2) = v17;
      v51 = v13 + 32;
      v52 = &v13[16 * v50 + 32];
      *(_QWORD *)v52 = v18;
      *((_QWORD *)v52 + 1) = v117;
      if (v50)
        break;
      v17 = 1;
LABEL_14:
      v14 = v117;
      v16 = v118;
      if (v117 >= v118)
        goto LABEL_102;
    }
    v119 = v13 + 32;
    v121 = v13;
    while (1)
    {
      v53 = v17 - 1;
      if (v17 >= 4)
      {
        v58 = &v51[16 * v17];
        v59 = *((_QWORD *)v58 - 8);
        v60 = *((_QWORD *)v58 - 7);
        v64 = __OFSUB__(v60, v59);
        v61 = v60 - v59;
        if (v64)
          goto LABEL_120;
        v63 = *((_QWORD *)v58 - 6);
        v62 = *((_QWORD *)v58 - 5);
        v64 = __OFSUB__(v62, v63);
        v56 = v62 - v63;
        v57 = v64;
        if (v64)
          goto LABEL_121;
        v65 = v17 - 2;
        v66 = &v51[16 * v17 - 32];
        v68 = *(_QWORD *)v66;
        v67 = *((_QWORD *)v66 + 1);
        v64 = __OFSUB__(v67, v68);
        v69 = v67 - v68;
        if (v64)
          goto LABEL_122;
        v64 = __OFADD__(v56, v69);
        v70 = v56 + v69;
        if (v64)
          goto LABEL_124;
        if (v70 >= v61)
        {
          v88 = &v51[16 * v53];
          v90 = *(_QWORD *)v88;
          v89 = *((_QWORD *)v88 + 1);
          v64 = __OFSUB__(v89, v90);
          v91 = v89 - v90;
          if (v64)
            goto LABEL_130;
          v81 = v56 < v91;
          goto LABEL_89;
        }
      }
      else
      {
        if (v17 != 3)
        {
          v82 = *((_QWORD *)v13 + 4);
          v83 = *((_QWORD *)v13 + 5);
          v64 = __OFSUB__(v83, v82);
          v75 = v83 - v82;
          v76 = v64;
          goto LABEL_83;
        }
        v55 = *((_QWORD *)v13 + 4);
        v54 = *((_QWORD *)v13 + 5);
        v64 = __OFSUB__(v54, v55);
        v56 = v54 - v55;
        v57 = v64;
      }
      if ((v57 & 1) != 0)
        goto LABEL_123;
      v65 = v17 - 2;
      v71 = &v51[16 * v17 - 32];
      v73 = *(_QWORD *)v71;
      v72 = *((_QWORD *)v71 + 1);
      v74 = __OFSUB__(v72, v73);
      v75 = v72 - v73;
      v76 = v74;
      if (v74)
        goto LABEL_125;
      v77 = &v51[16 * v53];
      v79 = *(_QWORD *)v77;
      v78 = *((_QWORD *)v77 + 1);
      v64 = __OFSUB__(v78, v79);
      v80 = v78 - v79;
      if (v64)
        goto LABEL_127;
      if (__OFADD__(v75, v80))
        goto LABEL_129;
      if (v75 + v80 >= v56)
      {
        v81 = v56 < v80;
LABEL_89:
        if (v81)
          v53 = v65;
        goto LABEL_91;
      }
LABEL_83:
      if ((v76 & 1) != 0)
        goto LABEL_126;
      v84 = &v51[16 * v53];
      v86 = *(_QWORD *)v84;
      v85 = *((_QWORD *)v84 + 1);
      v64 = __OFSUB__(v85, v86);
      v87 = v85 - v86;
      if (v64)
        goto LABEL_128;
      if (v87 < v75)
        goto LABEL_14;
LABEL_91:
      v92 = v53 - 1;
      if (v53 - 1 >= v17)
      {
        __break(1u);
LABEL_117:
        __break(1u);
LABEL_118:
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
LABEL_124:
        __break(1u);
LABEL_125:
        __break(1u);
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
LABEL_129:
        __break(1u);
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
LABEL_134:
        __break(1u);
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
        goto LABEL_140;
      }
      if (!v15)
        goto LABEL_143;
      v93 = v51;
      v94 = &v51[16 * v92];
      v95 = *(_QWORD *)v94;
      v96 = v53;
      v97 = &v93[16 * v53];
      v98 = *((_QWORD *)v97 + 1);
      v124 = (void **)(v15 + 8 * *(_QWORD *)v97);
      v127 = (void **)(v15 + 8 * *(_QWORD *)v94);
      v99 = v131;
      sub_21CC3E904(v127, v124, v15 + 8 * v98, v122);
      if (v3)
      {
LABEL_99:
        swift_bridgeObjectRelease();
        v102 = v131;

        *(_QWORD *)((v132 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_21CC3F864();
        goto LABEL_114;
      }

      if (v98 < v95)
        goto LABEL_117;
      if (v96 > *((_QWORD *)v121 + 2))
        goto LABEL_118;
      *(_QWORD *)v94 = v95;
      v51 = v119;
      *(_QWORD *)&v119[16 * v92 + 8] = v98;
      v100 = *((_QWORD *)v121 + 2);
      if (v96 >= v100)
        goto LABEL_119;
      v17 = v100 - 1;
      v101 = 16 * (v100 - 1 - v96);
      v13 = v121;
      memmove(v97, v97 + 16, v101);
      *((_QWORD *)v121 + 2) = v100 - 1;
      v15 = v129;
      if (v100 <= 2)
        goto LABEL_14;
    }
  }
  v17 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_102:
  if (v17 >= 2)
  {
    v103 = *v115;
    v125 = *v115;
    do
    {
      v104 = v17 - 2;
      if (v17 < 2)
        goto LABEL_132;
      if (!v103)
        goto LABEL_145;
      v105 = v3;
      v106 = (uint64_t)v13;
      v107 = *(_QWORD *)&v13[16 * v104 + 32];
      v108 = *(_QWORD *)&v13[16 * v17 + 24];
      v128 = (void **)(v103 + 8 * *(_QWORD *)&v13[16 * v17 + 16]);
      v130 = (void **)(v103 + 8 * v107);
      v109 = v103 + 8 * v108;
      v110 = v131;
      sub_21CC3E904(v130, v128, v109, v122);
      v3 = v105;
      if (v105)
        goto LABEL_99;

      if (v108 < v107)
        goto LABEL_133;
      v13 = (char *)v106;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v13 = sub_21CC335C8(v106);
      if (v104 >= *((_QWORD *)v13 + 2))
        goto LABEL_134;
      v111 = &v13[16 * v104 + 32];
      *(_QWORD *)v111 = v107;
      *((_QWORD *)v111 + 1) = v108;
      v112 = *((_QWORD *)v13 + 2);
      if (v17 > v112)
        goto LABEL_135;
      memmove(&v13[16 * v17 + 16], &v13[16 * v17 + 32], 16 * (v112 - v17));
      *((_QWORD *)v13 + 2) = v112 - 1;
      v17 = v112 - 1;
      v103 = v125;
    }
    while (v112 > 2);
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)((v132 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_21CC3F864();
  v102 = v131;
LABEL_114:

  swift_bridgeObjectRelease();
}

uint64_t sub_21CC15278(unint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t i;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;

  v2 = a1;
  v21 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_30;
  for (i = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10); i; i = sub_21CC3FA14())
  {
    v18 = v2;
    v4 = 0;
    v5 = v2 & 0xFFFFFFFFFFFFFF8;
    v6 = (_QWORD *)(v2 + 32);
    v19 = v2 & 0xC000000000000001;
    while (1)
    {
      if (v19)
      {
        v7 = (id)MEMORY[0x220788B18](v4, v18);
        goto LABEL_9;
      }
      if (v4 >= *(_QWORD *)(v5 + 16))
        break;
      v7 = (id)v6[v4];
LABEL_9:
      v8 = v7;
      if (__OFADD__(v4++, 1))
        goto LABEL_29;
      v10 = objc_msgSend(v7, sel_template);
      v11 = objc_msgSend(v10, sel_uniqueName);

      if (v11)
      {
        v12 = sub_21CC3F7B0();
        v2 = (unint64_t)v13;

      }
      else
      {
        v12 = 0;
        v2 = 0;
      }
      v14 = *(_QWORD *)(a2 + 16);
      if (!v14)
      {
LABEL_4:
        swift_bridgeObjectRelease();
        sub_21CC3F9B4();
        sub_21CC3F9D8();
        sub_21CC3F9E4();
        v2 = (unint64_t)&v21;
        sub_21CC3F9C0();
        goto LABEL_5;
      }
      v15 = (_QWORD *)(a2 + 40);
      while (*v15)
      {
        if (v2)
        {
          v16 = *(v15 - 1) == v12 && *v15 == v2;
          if (v16 || (sub_21CC3FAA4() & 1) != 0)
          {

            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
        }
LABEL_16:
        v15 += 2;
        if (!--v14)
          goto LABEL_4;
      }
      if (v2)
        goto LABEL_16;

LABEL_5:
      if (v4 == i)
        return v21;
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    ;
  }
  return MEMORY[0x24BEE4AF8];
}

void sub_21CC15480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    v7 = *(void **)(v5 + 8 * v4);
    v8 = a1;
    v9 = v6;
    while (1)
    {
      v10 = *(void **)v9;
      v11 = v7;
      v12 = v10;
      v13 = sub_21CC39FFC(v11, v12);

      if (v13 != -1)
      {
LABEL_4:
        ++v4;
        v6 += 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
      if (!v5)
        break;
      v14 = *(void **)v9;
      v7 = *(void **)(v9 + 8);
      *(_QWORD *)v9 = v7;
      *(_QWORD *)(v9 + 8) = v14;
      v9 -= 8;
      if (v4 == ++v8)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_21CC1555C(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  void *v6;
  uint64_t j;
  id v8;
  uint64_t v9;
  uint64_t k;
  void *v11;
  uint64_t m;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v2 = MEMORY[0x24BEE4AF8];
  v15 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_21CC3FA14();
    v3 = result;
    if (!result)
      goto LABEL_16;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v3)
      goto LABEL_16;
  }
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_32;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v3; ++i)
    {
      v6 = (void *)MEMORY[0x220788B18](i, a1);
      if (AAUIIsGoldAchievement(v6))
      {
        sub_21CC3F9B4();
        sub_21CC3F9D8();
        sub_21CC3F9E4();
        sub_21CC3F9C0();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (j = 0; j != v3; ++j)
    {
      v8 = *(id *)(a1 + 8 * j + 32);
      if (AAUIIsGoldAchievement(v8))
      {
        sub_21CC3F9B4();
        sub_21CC3F9D8();
        sub_21CC3F9E4();
        sub_21CC3F9C0();
      }
      else
      {

      }
    }
  }
LABEL_16:
  swift_bridgeObjectRelease();
  v9 = sub_21CC1581C(v15);
  result = swift_release();
  v16 = v2;
  if (!v3)
  {
LABEL_30:
    v14 = sub_21CC1581C(v16);
    swift_release();
    sub_21CC1293C(v14);
    return v9;
  }
  if (v3 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      for (k = 0; k != v3; ++k)
      {
        v11 = (void *)MEMORY[0x220788B18](k, a1);
        if ((AAUIIsGoldAchievement(v11) & 1) != 0)
        {
          swift_unknownObjectRelease();
        }
        else
        {
          sub_21CC3F9B4();
          sub_21CC3F9D8();
          sub_21CC3F9E4();
          sub_21CC3F9C0();
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      for (m = 0; m != v3; ++m)
      {
        v13 = *(id *)(a1 + 8 * m + 32);
        if (AAUIIsGoldAchievement(v13))
        {

        }
        else
        {
          sub_21CC3F9B4();
          sub_21CC3F9D8();
          sub_21CC3F9E4();
          sub_21CC3F9C0();
        }
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_21CC1581C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t i;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t result;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v30 = MEMORY[0x24BEE4AF8];
  v29 = sub_21CC15B80(MEMORY[0x24BEE4AF8]);
  if (a1 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain();
    v2 = sub_21CC3FA14();
    if (!v2)
      goto LABEL_10;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v2)
      goto LABEL_10;
  }
  if (v2 < 1)
  {
    __break(1u);
    result = swift_release();
    __break(1u);
    return result;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = 0;
    do
    {
      v4 = MEMORY[0x220788B18](v3++, a1);
      v28 = v4;
      sub_21CC3AA74((void **)&v28, (uint64_t *)&v29);
      swift_unknownObjectRelease();
    }
    while (v2 != v3);
  }
  else
  {
    for (i = 0; i != v2; ++i)
    {
      v6 = *(_QWORD *)(a1 + 8 * i + 32);
      v28 = v6;
      sub_21CC3AA74((void **)&v28, (uint64_t *)&v29);
    }
  }
LABEL_10:
  swift_bridgeObjectRelease();
  v7 = v29;
  swift_bridgeObjectRetain_n();
  v8 = sub_21CC15C98(v7);
  swift_bridgeObjectRelease();
  v28 = (unint64_t)v8;
  sub_21CC15D7C((uint64_t *)&v28, sub_21CC15DF4, sub_21CC15F70);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v28 + 16);
  if (v9)
  {
    v10 = (char *)(v28 + 32);
    swift_retain();
    v11 = 0;
    v26 = v9;
    v27 = v7;
    v25 = v10;
    while (1)
    {
      if (!*(_QWORD *)(v7 + 16))
        goto LABEL_14;
      v12 = (uint64_t *)&v10[16 * v11];
      v13 = *v12;
      v14 = v12[1];
      swift_bridgeObjectRetain_n();
      v15 = sub_21CC2EF40(v13, v14);
      if ((v16 & 1) != 0)
        break;
      swift_bridgeObjectRelease();
LABEL_13:
      swift_bridgeObjectRelease();
LABEL_14:
      if (++v11 == v9)
      {
        swift_release_n();
        v23 = v30;
        goto LABEL_37;
      }
    }
    a1 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((a1 & 0x8000000000000000) != 0 || (a1 & 0x4000000000000000) != 0)
    {
      v22 = swift_bridgeObjectRetain();
      v17 = (unint64_t)sub_21CC33334(v22);
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
    }
    v28 = v17;
    sub_21CC3AD24((uint64_t *)&v28);
    swift_bridgeObjectRelease();
    v18 = v28;
    if ((v28 & 0x8000000000000000) != 0 || (v28 & 0x4000000000000000) != 0)
    {
      swift_retain();
      v19 = sub_21CC3FA14();
      if (v19)
        goto LABEL_23;
    }
    else
    {
      v19 = *(_QWORD *)(v28 + 16);
      swift_retain();
      if (v19)
      {
LABEL_23:
        if (v19 < 1)
        {
          __break(1u);
          goto LABEL_39;
        }
        for (j = 0; j != v19; ++j)
        {
          if ((v18 & 0xC000000000000001) != 0)
            MEMORY[0x220788B18](j, v18);
          else
            v21 = *(id *)(v18 + 8 * j + 32);
          MEMORY[0x2207889BC]();
          if (*(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_21CC3F870();
          sub_21CC3F888();
          sub_21CC3F864();
        }
      }
    }
    swift_release_n();
    v9 = v26;
    v7 = v27;
    v10 = v25;
    goto LABEL_13;
  }
  swift_release();
  v23 = MEMORY[0x24BEE4AF8];
LABEL_37:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v23;
}

unint64_t sub_21CC15B80(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8A8);
  v2 = (_QWORD *)sub_21CC3FA44();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_21CC2EF40(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

_QWORD *sub_21CC15C98(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7D8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_21CC3E090((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21CC2FA08();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_21CC15D7C(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_21CC15DF4(uint64_t a1)
{
  return sub_21CC15E08(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_21CC15E08(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21CC3FA50();
  __break(1u);
  return result;
}

uint64_t sub_21CC15F70(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  unint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;

  v3 = a1[1];
  result = sub_21CC3FA74();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_21CC3C8A0(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_151;
  v101 = result;
  v98 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v104 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = MEMORY[0x24BEE4AF8];
LABEL_117:
      result = v10;
      v100 = v7;
      if (v11 >= 2)
      {
        v91 = *v98;
        do
        {
          v92 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v91)
            goto LABEL_159;
          v93 = result;
          v94 = *(_QWORD *)(result + 32 + 16 * v92);
          v95 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_21CC3D380((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v91 + 16 * v95, v104);
          if (v1)
            break;
          if (v95 < v94)
            goto LABEL_147;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_21CC335C8(v93);
            v93 = result;
          }
          if (v92 >= *(_QWORD *)(v93 + 16))
            goto LABEL_148;
          v96 = (_QWORD *)(v93 + 32 + 16 * v92);
          *v96 = v94;
          v96[1] = v95;
          v97 = *(_QWORD *)(v93 + 16);
          if (v11 > v97)
            goto LABEL_149;
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          result = v93;
          *(_QWORD *)(v93 + 16) = v97 - 1;
          v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v100 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v100 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    result = sub_21CC3F87C();
    *(_QWORD *)(result + 16) = v6;
    v100 = result;
    v104 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v99 = v9 + 8;
  v10 = MEMORY[0x24BEE4AF8];
  v102 = v3;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_45;
    v13 = (uint64_t *)(v9 + 16 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 16 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_44;
      v17 = 0;
    }
    else
    {
      result = sub_21CC3FAA4();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v99 + 16 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 16 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_21CC3FAA4();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 2;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_155;
      if (v12 < v18)
      {
        v23 = 16 * v18;
        v24 = 16 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_158;
            v27 = v9 + v23;
            v28 = *(_QWORD *)(v9 + v24);
            v29 = *(_QWORD *)(v9 + v24 + 8);
            *(_OWORD *)(v9 + v24) = *(_OWORD *)(v9 + v23 - 16);
            *(_QWORD *)(v27 - 16) = v28;
            *(_QWORD *)(v27 - 8) = v29;
          }
          ++v26;
          v23 -= 16;
          v24 += 16;
        }
        while (v26 < v25);
      }
LABEL_44:
      v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_150;
      if (v8 - v12 < v101)
        break;
    }
LABEL_66:
    if (v8 < v12)
      goto LABEL_145;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_21CC33428(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v38 = *(_QWORD *)(v10 + 16);
    v37 = *(_QWORD *)(v10 + 24);
    v11 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      result = (uint64_t)sub_21CC33428((char *)(v37 > 1), v38 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v39 = v10 + 32;
    v40 = (uint64_t *)(v10 + 32 + 16 * v38);
    *v40 = v12;
    v40[1] = v8;
    if (v38)
    {
      v103 = v8;
      while (1)
      {
        v41 = v11 - 1;
        if (v11 >= 4)
        {
          v46 = v39 + 16 * v11;
          v47 = *(_QWORD *)(v46 - 64);
          v48 = *(_QWORD *)(v46 - 56);
          v52 = __OFSUB__(v48, v47);
          v49 = v48 - v47;
          if (v52)
            goto LABEL_134;
          v51 = *(_QWORD *)(v46 - 48);
          v50 = *(_QWORD *)(v46 - 40);
          v52 = __OFSUB__(v50, v51);
          v44 = v50 - v51;
          v45 = v52;
          if (v52)
            goto LABEL_135;
          v53 = v11 - 2;
          v54 = (uint64_t *)(v39 + 16 * (v11 - 2));
          v56 = *v54;
          v55 = v54[1];
          v52 = __OFSUB__(v55, v56);
          v57 = v55 - v56;
          if (v52)
            goto LABEL_136;
          v52 = __OFADD__(v44, v57);
          v58 = v44 + v57;
          if (v52)
            goto LABEL_138;
          if (v58 >= v49)
          {
            v76 = (uint64_t *)(v39 + 16 * v41);
            v78 = *v76;
            v77 = v76[1];
            v52 = __OFSUB__(v77, v78);
            v79 = v77 - v78;
            if (v52)
              goto LABEL_144;
            v69 = v44 < v79;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v70 = *(_QWORD *)(v10 + 32);
            v71 = *(_QWORD *)(v10 + 40);
            v52 = __OFSUB__(v71, v70);
            v63 = v71 - v70;
            v64 = v52;
            goto LABEL_98;
          }
          v43 = *(_QWORD *)(v10 + 32);
          v42 = *(_QWORD *)(v10 + 40);
          v52 = __OFSUB__(v42, v43);
          v44 = v42 - v43;
          v45 = v52;
        }
        if ((v45 & 1) != 0)
          goto LABEL_137;
        v53 = v11 - 2;
        v59 = (uint64_t *)(v39 + 16 * (v11 - 2));
        v61 = *v59;
        v60 = v59[1];
        v62 = __OFSUB__(v60, v61);
        v63 = v60 - v61;
        v64 = v62;
        if (v62)
          goto LABEL_139;
        v65 = (uint64_t *)(v39 + 16 * v41);
        v67 = *v65;
        v66 = v65[1];
        v52 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v52)
          goto LABEL_141;
        if (__OFADD__(v63, v68))
          goto LABEL_143;
        if (v63 + v68 >= v44)
        {
          v69 = v44 < v68;
LABEL_104:
          if (v69)
            v41 = v53;
          goto LABEL_106;
        }
LABEL_98:
        if ((v64 & 1) != 0)
          goto LABEL_140;
        v72 = (uint64_t *)(v39 + 16 * v41);
        v74 = *v72;
        v73 = v72[1];
        v52 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v52)
          goto LABEL_142;
        if (v75 < v63)
          goto LABEL_15;
LABEL_106:
        v80 = v41 - 1;
        if (v41 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v81 = v9;
        if (!v9)
          goto LABEL_157;
        v82 = v10;
        v83 = (uint64_t *)(v39 + 16 * v80);
        v84 = *v83;
        v85 = v39;
        v86 = v41;
        v87 = (_QWORD *)(v39 + 16 * v41);
        v88 = v87[1];
        v89 = v81;
        result = sub_21CC3D380((char *)(v81 + 16 * *v83), (char *)(v81 + 16 * *v87), v81 + 16 * v88, v104);
        if (v1)
          goto LABEL_114;
        if (v88 < v84)
          goto LABEL_131;
        if (v86 > *(_QWORD *)(v82 + 16))
          goto LABEL_132;
        *v83 = v84;
        *(_QWORD *)(v85 + 16 * v80 + 8) = v88;
        v90 = *(_QWORD *)(v82 + 16);
        if (v86 >= v90)
          goto LABEL_133;
        v10 = v82;
        v11 = v90 - 1;
        result = (uint64_t)memmove(v87, v87 + 2, 16 * (v90 - 1 - v86));
        v39 = v85;
        *(_QWORD *)(v82 + 16) = v90 - 1;
        v9 = v89;
        v8 = v103;
        if (v90 <= 2)
          goto LABEL_15;
      }
    }
    v11 = 1;
LABEL_15:
    v3 = v102;
    if (v8 >= v102)
    {
      v7 = v100;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v101))
    goto LABEL_153;
  if (v12 + v101 >= v3)
    v30 = v3;
  else
    v30 = v12 + v101;
  if (v30 >= v12)
  {
    if (v8 != v30)
    {
      v31 = (uint64_t *)(v9 + 16 * v8);
      do
      {
        v32 = (uint64_t *)(v9 + 16 * v8);
        result = *v32;
        v33 = v32[1];
        v34 = v12;
        v35 = v31;
        do
        {
          if (result == *(v35 - 2) && v33 == *(v35 - 1))
            break;
          result = sub_21CC3FAA4();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_156;
          result = *v35;
          v33 = v35[1];
          *(_OWORD *)v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = result;
          v35 -= 2;
          ++v34;
        }
        while (v8 != v34);
        ++v8;
        v31 += 2;
      }
      while (v8 != v30);
      v8 = v30;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t AAUIIsGoldAchievement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = a1;
  objc_msgSend(v1, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("Best")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v1, "template");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsString:", CFSTR("Longest")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v1, "template");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsString:", CFSTR("Fastest")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v1, "template");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v10, "isEqualToString:", CFSTR("7WorkoutWeek"));

      }
    }

  }
  return v4;
}

id AAUISortSubAchievementsByActivityType(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = v1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        AAUILocalizedActivityTypeForAchievement(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

        }
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sortUsingComparator:", &__block_literal_global_570);
        objc_msgSend(v2, "addObjectsFromArray:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v2;
}

__CFString *AAUILocalizedActivityTypeForAchievement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
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
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("FiftyKilometersCyclingWorkout")) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v1, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsString:", CFSTR("FiftyMilesCyclingWorkout")) & 1) != 0)
  {
LABEL_5:

LABEL_6:
LABEL_7:
    FILocalizedNameForIndoorAgnosticActivityType();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v1, "template");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsString:", CFSTR("OneHundredKilometersCyclingWorkout")) & 1) != 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v1, "template");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsString:", CFSTR("OneHundredMilesCyclingWorkout"));

  if ((v12 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v1, "template");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "containsString:", CFSTR("WheelchairMarathonWorkout")) & 1) != 0)
  {
LABEL_19:

    goto LABEL_7;
  }
  objc_msgSend(v1, "template");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "containsString:", CFSTR("FastestWheelchairMarathonWorkout")) & 1) != 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v1, "template");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uniqueName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "containsString:", CFSTR("WheelchairHalfMarathonWorkout")) & 1) != 0)
  {
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v1, "template");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uniqueName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "containsString:", CFSTR("FastestWheelchairHalfMarathonWorkout")) & 1) != 0)
  {
LABEL_16:

    goto LABEL_17;
  }
  v72 = v19;
  objc_msgSend(v1, "template");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "uniqueName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "containsString:", CFSTR("BestWheelchair10KDuration")) & 1) != 0)
  {

    v19 = v72;
    goto LABEL_16;
  }
  v67 = v22;
  v69 = v21;
  objc_msgSend(v1, "template");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "uniqueName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "containsString:", CFSTR("TenKilometerWheelchairWorkout")) & 1) != 0)
  {
    v24 = 1;
  }
  else
  {
    objc_msgSend(v1, "template");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "uniqueName");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v61, "containsString:", CFSTR("BestWheelchair5KDuration")) & 1) != 0)
    {
      v24 = 1;
    }
    else
    {
      objc_msgSend(v1, "template");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "uniqueName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v57, "containsString:", CFSTR("FiveKilometerWheelchairWorkout"));

    }
  }

  if ((v24 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v1, "template");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "uniqueName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "containsString:", CFSTR("HalfMarathonWorkout")) & 1) != 0)
  {
LABEL_37:

    goto LABEL_7;
  }
  objc_msgSend(v1, "template");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "uniqueName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "containsString:", CFSTR("FastestHalfMarathonWorkout")) & 1) != 0)
  {
LABEL_36:

    goto LABEL_37;
  }
  objc_msgSend(v1, "template");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "uniqueName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "containsString:", CFSTR("MarathonWorkout")) & 1) != 0)
  {
LABEL_35:

    goto LABEL_36;
  }
  objc_msgSend(v1, "template");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "uniqueName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "containsString:", CFSTR("FastestMarathonWorkout")) & 1) != 0)
  {
LABEL_34:

    goto LABEL_35;
  }
  objc_msgSend(v1, "template");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "uniqueName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v33, "containsString:", CFSTR("Best10KDuration")) & 1) != 0)
  {

    goto LABEL_34;
  }
  objc_msgSend(v1, "template");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "uniqueName");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v68, "containsString:", CFSTR("TenKilometerWorkout")) & 1) != 0)
  {
    v66 = 1;
  }
  else
  {
    objc_msgSend(v1, "template");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "uniqueName");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v62, "containsString:", CFSTR("Best5KDuration")) & 1) != 0)
    {
      v66 = 1;
    }
    else
    {
      objc_msgSend(v1, "template");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "uniqueName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v58, "containsString:", CFSTR("FiveKilometerWorkout"));

    }
  }

  if ((v66 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v1, "template");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "uniqueName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v35, "containsString:", CFSTR("DuathlonWorkout")) & 1) != 0)
    goto LABEL_53;
  objc_msgSend(v1, "template");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "uniqueName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v37, "containsString:", CFSTR("SprintTriathlonWorkout")) & 1) != 0)
  {
LABEL_52:

LABEL_53:
LABEL_54:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("TRIATHLON_ACTIVITY_TYPE"), &stru_24E0B4958, CFSTR("Localizable"));
    v43 = objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  objc_msgSend(v1, "template");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "uniqueName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "containsString:", CFSTR("FiftyKilometerTriathlonWorkout")) & 1) != 0)
  {
LABEL_51:

    goto LABEL_52;
  }
  objc_msgSend(v1, "template");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "uniqueName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "containsString:", CFSTR("HalfDistanceTriathlonWorkout")) & 1) != 0)
  {

    goto LABEL_51;
  }
  objc_msgSend(v1, "template");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "uniqueName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v44, "containsString:", CFSTR("FullDistanceTriathlonWorkout"));

  if ((v74 & 1) != 0)
    goto LABEL_54;
  objc_msgSend(v1, "template");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "uniqueName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("7WorkoutWeek"));

  if (v47)
  {
    objc_msgSend(v1, "template");
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "uniqueName");
    v43 = objc_claimAutoreleasedReturnValue();
LABEL_55:
    v8 = (__CFString *)v43;
LABEL_56:

    goto LABEL_8;
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v42 = (id)*MEMORY[0x24BE01338];
  v48 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v76;
    while (2)
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v76 != v50)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "unsignedIntegerValue");
        _HKWorkoutActivityNameForActivityType();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
        {
          objc_msgSend(v1, "template");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "uniqueName");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "containsString:", v52);

          if ((v55 & 1) != 0)
          {
            FILocalizedNameForIndoorAgnosticActivityType();
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_56;
          }
        }

      }
      v49 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      if (v49)
        continue;
      break;
    }
  }

  ACHLogDefault();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    AAUILocalizedActivityTypeForAchievement_cold_1(v1, v56);

  v8 = &stru_24E0B4958;
LABEL_8:

  return v8;
}

id AAUIAchievementInArrayWithUniqueName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __AAUIAchievementInArrayWithUniqueName_block_invoke;
  v7[3] = &unk_24E0B2F88;
  v8 = v3;
  v4 = v3;
  objc_msgSend(a1, "hk_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t sub_21CC19394(unint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  int v23;
  id v24;
  void *v25;
  uint64_t (*v26)(id *);
  void (*v27)(id *, _QWORD);
  uint64_t *v28;
  uint64_t *v29;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35[4];
  _QWORD *v36;
  uint64_t v37;

  v5 = v4;
  v10 = sub_21CC3F75C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(void **)((char *)v5 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEE5610], v10);
  v15 = v14;
  LOBYTE(v14) = sub_21CC3F768();
  v16 = (*(uint64_t (**)(_QWORD *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    v37 = MEMORY[0x24BEE4B08];
    v11 = MEMORY[0x24BEE4EA0];
    v17 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v5) + 0x160))(v16);
    if (*(_QWORD *)(v17 + 16) && (v18 = sub_21CC2EED8(0), (v19 & 1) != 0))
    {
      v13 = *(_QWORD **)(*(_QWORD *)(v17 + 56) + 8 * v18);
      swift_bridgeObjectRetain();
    }
    else
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    v36 = v13;
    if (!(a1 >> 62))
    {
      v20 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v20)
        goto LABEL_8;
LABEL_17:
      swift_bridgeObjectRelease();
LABEL_18:
      v26 = *(uint64_t (**)(id *))((*(_QWORD *)v11 & *v5) + 0x170);
      swift_bridgeObjectRetain();
      v27 = (void (*)(id *, _QWORD))v26(v35);
      v29 = v28;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v34 = *v29;
      *v29 = 0x8000000000000000;
      sub_21CC33BCC((uint64_t)v13, 0, isUniquelyReferenced_nonNull_native);
      *v29 = v34;
      swift_bridgeObjectRelease();
      v27(v35, 0);
      v31 = swift_bridgeObjectRetain();
      v32 = sub_21CC1A1E0(v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v32;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  result = sub_21CC3FA14();
  v20 = result;
  if (!result)
    goto LABEL_17;
LABEL_8:
  if (v20 >= 1)
  {
    v22 = 0;
    v23 = a4 & 1;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v24 = (id)MEMORY[0x220788B18](v22, a1);
      else
        v24 = *(id *)(a1 + 8 * v22 + 32);
      v25 = v24;
      ++v22;
      v35[0] = v24;
      sub_21CC324C0(v35, a2, a3, v5, v23, (unint64_t *)&v36, (uint64_t)&v37);

    }
    while (v20 != v22);
    swift_bridgeObjectRelease();
    v13 = v36;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC19654()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_21CC19698()
{
  return sub_21CC19654();
}

void sub_21CC196A4(uint64_t a1)
{
  char *v1;

  sub_21CC309D8(a1, *v1);
}

unint64_t sub_21CC196AC()
{
  unint64_t result;

  result = qword_25531C7C0;
  if (!qword_25531C7C0)
  {
    result = MEMORY[0x220789664](&protocol conformance descriptor for AAUIAwardsDataProviderSection, &type metadata for AAUIAwardsDataProviderSection);
    atomic_store(result, (unint64_t *)&qword_25531C7C0);
  }
  return result;
}

void sub_21CC196F0(char *a1)
{
  sub_21CC30680(*a1);
}

unint64_t sub_21CC196FC()
{
  unint64_t result;

  result = qword_25531C7A8;
  if (!qword_25531C7A8)
  {
    result = MEMORY[0x220789664](&protocol conformance descriptor for AAUIAwardsDataProviderSection, &type metadata for AAUIAwardsDataProviderSection);
    atomic_store(result, (unint64_t *)&qword_25531C7A8);
  }
  return result;
}

uint64_t sub_21CC19740(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21CC19778()
{
  uint64_t v0;
  uint64_t v2;

  v0 = sub_21CC3F894();
  MEMORY[0x220789664](MEMORY[0x24BEE12E0], v0);
  sub_21CC3F8A0();
  return v2;
}

void sub_21CC197F8(uint64_t a1, uint64_t a2, void *a3, char a4, int a5)
{
  void *v5;
  void *v6;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  char *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  char IsEarnable;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void (*v55)(void *, uint64_t);
  void *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  id v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76[2];

  v6 = v5;
  v69 = a5;
  v68 = a3;
  v70 = a1;
  v71 = a2;
  v8 = (_QWORD *)sub_21CC3F648();
  v9 = *(v8 - 1);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21CC3F72C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = ((char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (uint8_t *)&v68 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v68 - v20;
  if ((objc_msgSend(v6, sel_hasClientRequiredURLs) & 1) == 0)
  {
    v36 = sub_21CC106F4();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v21, v36, v12);
    v8 = v6;
    v16 = sub_21CC3F714();
    v37 = sub_21CC3F8B8();
    if (!os_log_type_enabled(v16, v37))
    {

      (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);
      return;
    }
    v72 = v12;
    v73 = v13;
    v19 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v76[0] = v38;
    *(_DWORD *)v19 = 136315138;
    v39 = objc_msgSend(v8, sel_template);
    v40 = objc_msgSend(v39, sel_uniqueName);

    if (v40)
    {
      v41 = sub_21CC3F7B0();
      v43 = v42;

      v74 = sub_21CC0FA20(v41, v43, v76);
      sub_21CC3F900();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21CC08000, v16, v37, "[%s] is missing client required URLs, not showing", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207896E8](v38, -1, -1);
      MEMORY[0x2207896E8](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v73 + 8))(v21, v72);
      return;
    }
    goto LABEL_26;
  }
  v72 = v12;
  v73 = v13;
  v22 = objc_msgSend(v6, sel_template);
  v23 = objc_msgSend(v22, sel_uniqueName);

  if (!v23)
  {
    __break(1u);
LABEL_26:

    __break(1u);
LABEL_27:

    __break(1u);
LABEL_28:

    __break(1u);
    return;
  }
  v24 = sub_21CC3F7B0();
  v26 = v25;

  v76[0] = v24;
  v76[1] = v26;
  v74 = 0xD000000000000010;
  v75 = 0x800000021CC43480;
  sub_21CC19F6C();
  v27 = sub_21CC3F930();
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0)
  {
    if (objc_msgSend(v6, sel_unearned))
    {
      sub_21CC3F63C();
      v28 = (void *)sub_21CC3F618();
      (*(void (**)(char *, _QWORD *))(v9 + 8))(v11, v8);
      IsEarnable = AAUIMonthlyChallengeIsEarnable(v6, v28);

      if ((IsEarnable & 1) == 0)
      {
        v57 = sub_21CC106F4();
        v45 = v72;
        v58 = v73;
        (*(void (**)(uint8_t *, uint64_t, uint64_t))(v73 + 16))(v19, v57, v72);
        v16 = v6;
        v59 = sub_21CC3F714();
        v60 = sub_21CC3F8B8();
        if (os_log_type_enabled(v59, v60))
        {
          v61 = (uint8_t *)swift_slowAlloc();
          v62 = swift_slowAlloc();
          v76[0] = v62;
          *(_DWORD *)v61 = 136315138;
          v63 = -[NSObject template](v16, sel_template);
          v64 = objc_msgSend(v63, sel_uniqueName);

          if (v64)
          {
            v65 = sub_21CC3F7B0();
            v67 = v66;

            v74 = sub_21CC0FA20(v65, v67, v76);
            sub_21CC3F900();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21CC08000, v59, v60, "[%s] is not earnable anymore, not showing", v61, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2207896E8](v62, -1, -1);
            MEMORY[0x2207896E8](v61, -1, -1);

            (*(void (**)(uint8_t *, uint64_t))(v73 + 8))(v19, v72);
            return;
          }
          goto LABEL_28;
        }

        v55 = *(void (**)(void *, uint64_t))(v58 + 8);
        v56 = v19;
        goto LABEL_24;
      }
    }
  }
  v30 = objc_msgSend(v6, sel_section, v68);
  v31 = sub_21CC3F7B0();
  v33 = v32;

  swift_bridgeObjectRelease();
  v34 = HIBYTE(v33) & 0xF;
  if ((v33 & 0x2000000000000000) == 0)
    v34 = v31 & 0xFFFFFFFFFFFFLL;
  v35 = v73;
  if (!v34)
  {
    v44 = sub_21CC106F4();
    v45 = v72;
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v35 + 16))(v16, v44, v72);
    v19 = v6;
    v46 = sub_21CC3F714();
    v47 = sub_21CC3F8B8();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v76[0] = v49;
      *(_DWORD *)v48 = 136315138;
      v50 = -[uint8_t template](v19, sel_template);
      v51 = objc_msgSend(v50, sel_uniqueName);

      if (v51)
      {
        v52 = sub_21CC3F7B0();
        v54 = v53;

        v74 = sub_21CC0FA20(v52, v54, v76);
        sub_21CC3F900();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21CC08000, v46, v47, "[%s] has no section set, not showing", v48, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2207896E8](v49, -1, -1);
        MEMORY[0x2207896E8](v48, -1, -1);

        (*(void (**)(NSObject *, uint64_t))(v73 + 8))(v16, v72);
        return;
      }
      goto LABEL_27;
    }

    v55 = *(void (**)(void *, uint64_t))(v35 + 8);
    v56 = v16;
LABEL_24:
    v55(v56, v45);
    return;
  }
  if (objc_msgSend(v6, sel_unearned))
    objc_msgSend(v68, sel_unearnedAchievementIsVisibleNow_activityMoveMode_experienceType_isFitnessPlusSubscriber_isWheelchairUser_, v6, v70, v71, a4 & 1, v69 & 1);
}

unint64_t sub_21CC19F6C()
{
  unint64_t result;

  result = qword_25531C7E8;
  if (!qword_25531C7E8)
  {
    result = MEMORY[0x220789664](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25531C7E8);
  }
  return result;
}

uint64_t sub_21CC19FB0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_isFitnessPlusSubscriber);
  swift_beginAccess();
  return *v1;
}

uint64_t (*sub_21CC19FF8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_21CC1A040()
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
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8A0);
  v2 = *v0;
  v3 = sub_21CC3FA2C();
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21CC1A1E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7B8);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * v4 - 64;
  v5 = sub_21CC1AB44(&v7, (_BYTE *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_21CC2FA08();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_21CC1A2B4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21CC3FA14();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x220788B24);
}

uint64_t sub_21CC1A31C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8A0);
  v6 = sub_21CC3FA38();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_28;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v18 = (unint64_t)(v7 + 63) >> 6;
  result = swift_retain();
  if (v9)
  {
    v11 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v18 <= 1)
  {
    swift_release();
    v12 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
    {
LABEL_28:
      result = swift_release();
      *v3 = v6;
      return result;
    }
LABEL_24:
    v17 = 1 << *(_BYTE *)(v5 + 32);
    if (v17 >= 64)
      bzero(v12, ((unint64_t)(v17 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v12 = -1 << v17;
    *(_QWORD *)(v5 + 16) = 0;
    goto LABEL_28;
  }
  v12 = (_QWORD *)(v5 + 64);
  v13 = *(_QWORD *)(v5 + 72);
  v14 = 1;
  if (v13)
    goto LABEL_17;
  v14 = 2;
  if (v18 <= 2)
    goto LABEL_21;
  v13 = *(_QWORD *)(v5 + 80);
  if (v13)
  {
LABEL_17:
    v11 = __clz(__rbit64(v13)) + (v14 << 6);
LABEL_18:
    v16 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v11);
    if ((a2 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_21CC3FAE0();
    __asm { BR              X8 }
  }
  v15 = 3;
  if (v18 <= 3)
  {
LABEL_21:
    swift_release();
    if ((a2 & 1) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
  v13 = *(_QWORD *)(v5 + 88);
  if (v13)
  {
    v14 = 3;
    goto LABEL_17;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v18)
      goto LABEL_21;
    v13 = *(_QWORD *)(v5 + 64 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC1A6F4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8B8);
  v3 = sub_21CC3F960();
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
    goto LABEL_23;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_retain();
  if (v6)
  {
    v9 = __clz(__rbit64(v6));
    goto LABEL_20;
  }
  if (v7 <= 1)
    goto LABEL_21;
  v10 = *(_QWORD *)(v2 + 64);
  v11 = 1;
  if (v10)
  {
LABEL_19:
    v9 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_20:
    v13 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v9);
    sub_21CC3FAE0();
    __asm { BR              X8 }
  }
  v11 = 2;
  if (v7 <= 2)
  {
LABEL_21:
    result = swift_release_n();
    v1 = v0;
LABEL_23:
    *v1 = v3;
    return result;
  }
  v10 = *(_QWORD *)(v2 + 72);
  if (v10)
    goto LABEL_19;
  v11 = 3;
  if (v7 <= 3)
    goto LABEL_21;
  v10 = *(_QWORD *)(v2 + 80);
  if (v10)
    goto LABEL_19;
  v12 = 4;
  if (v7 <= 4)
    goto LABEL_21;
  v10 = *(_QWORD *)(v2 + 88);
  if (v10)
  {
    v11 = 4;
    goto LABEL_19;
  }
  while (1)
  {
    v11 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v11 >= v7)
      goto LABEL_21;
    v10 = *(_QWORD *)(v2 + 56 + 8 * v11);
    ++v12;
    if (v10)
      goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC1AA64(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_21CC1A2B4(v3);
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      sub_21CC3F864();
      return v10;
    }
  }
  result = sub_21CC3FA50();
  __break(1u);
  return result;
}

_QWORD *sub_21CC1AB44(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_BYTE *)(*(_QWORD *)(a4 + 48) + v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t AAUICompareAchievements(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  v5 = AAUICompareAchievementsByMostRecentEarnedDate(v3, v4);
  if (!v5)
  {
    v6 = v3;
    v7 = v4;
    objc_msgSend(v6, "progress");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(v7, "progress"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      objc_msgSend(v6, "progress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "progress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v11, "compare:", v12);

    }
    else
    {
      objc_msgSend(v6, "progress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

        v5 = 0;
      }
      else
      {
        objc_msgSend(v7, "progress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v5 = -1;
        else
          v5 = 0;
      }
    }

  }
  return v5;
}

uint64_t AAUICompareAchievementsByMostRecentEarnedDate(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = a1;
  if ((ACHShouldUseNewAwardsSystem() & 1) != 0)
  {
    objc_msgSend(v4, "relevantEarnedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "relevantEarnedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "earnedInstances");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "earnedInstances");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v8;
  }

  if (!v5 || v6)
  {
    if (v5 || !v6)
      v9 = objc_msgSend(v5, "compareEarnedDateWithEarnedInstance:", v6);
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
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

ValueMetadata *type metadata accessor for AAUIAwardsDataProviderSection()
{
  return &type metadata for AAUIAwardsDataProviderSection;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_21CC1B068(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22078964C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220789658](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
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

void sub_21CC1BE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double _matrix4x4_rotation(float a1, float32x4_t a2)
{
  int32x4_t v2;
  float32x2_t v3;
  float32x2_t v4;
  __float2 v5;
  float32x4_t v7;

  v2 = (int32x4_t)vmulq_f32(a2, a2);
  v2.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v2, 2), vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1))).u32[0];
  v3 = vrsqrte_f32((float32x2_t)v2.u32[0]);
  v4 = vmul_f32(v3, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v3, v3)));
  v7 = vmulq_n_f32(a2, vmul_f32(v4, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v4, v4))).f32[0]);
  v5 = __sincosf_stret(a1);
  return COERCE_DOUBLE(__PAIR64__(vmuls_lane_f32(v5.__sinval, v7, 2)+ (float)(vmuls_lane_f32(v7.f32[0], *(float32x2_t *)v7.f32, 1) * (float)(1.0 - v5.__cosval)), COERCE_UNSIGNED_INT(vmlas_n_f32(v5.__cosval, 1.0 - v5.__cosval, vmulq_f32(v7, v7).f32[0]))));
}

void freeData(int a1, void *a2)
{
  free(a2);
}

__n128 AAUIColorVectorFromColor(void *a1)
{
  id v1;
  float64x2_t v2;
  __n128 result;
  unsigned __int32 v4;
  float32x2_t v5;
  uint64_t v6;
  double v7;
  float64_t v8;
  float64_t v9;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = 0.0;
  v9 = 0.0;
  v6 = 0;
  v7 = 0.0;
  objc_msgSend(v1, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  v2.f64[0] = v9;
  v2.f64[1] = v8;
  v5 = vcvt_f32_f64(v2);
  *(float *)v2.f64 = v7;
  v4 = LODWORD(v2.f64[0]);

  result.n128_u64[0] = (unint64_t)v5;
  result.n128_u32[2] = v4;
  return result;
}

id AAUIAchievementBadgeCacheKey(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a1;
  if (AAUIAchievementBadgeCacheKey_onceToken != -1)
    dispatch_once(&AAUIAchievementBadgeCacheKey_onceToken, &__block_literal_global_269);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "hk_map:", &__block_literal_global_271);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    UIRoundToScale();
    v9 = v8;
    UIRoundToScale();
    v11 = v10;
    objc_msgSend(v5, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unearned") ^ 1;

    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@_%@_%@_%@_%@"), v7, v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void sub_21CC1FCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CC21E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_21CC21F1C(uint64_t a1)
{
  uint64_t v1;

  sub_21CC0B83C(a1, *(_QWORD *)(v1 + 16));
}

void sub_21CC21F24(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_21CC21F24(a1, &qword_25531C898);
}

uint64_t sub_21CC21F7C(uint64_t a1)
{
  return sub_21CC0AFE8(a1, qword_25531CC78);
}

uint64_t type metadata accessor for AAUIAwardsDataProvider()
{
  uint64_t result;

  result = qword_25531CC50;
  if (!qword_25531CC50)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21CC21FE0(Swift::Bool a1)
{
  AAUIAwardsDataProvider.activate(isFitnessPlusSubscriber:)(a1);
}

void sub_21CC22000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21CC0B250(a1, a2, a3, a4, (SEL *)&selRef_addObject_);
}

uint64_t sub_21CC2200C(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_observers);
}

void sub_21CC22018()
{
  uint64_t v0;

  sub_21CC0F1E8(v0);
}

uint64_t sub_21CC22020(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_achievementsPerWorkoutIdentifier);
}

uint64_t sub_21CC2202C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_isFitnessPlusSubscriber);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_21CC22074(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_achievementsPerSection);
}

void sub_21CC22080()
{
  uint64_t v0;

  sub_21CC0C004(v0, "[AAUIAwardsDataProvider] App entered foreground, cycling data provider.");
}

uint64_t sub_21CC220A0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_isActivated);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_21CC220E8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_isActivated);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21CC2212C(uint64_t a1)
{
  return sub_21CC0F9D4(a1, &OBJC_IVAR___AAUIAwardsDataProvider_mostRecentlyEarnedAchievementsPerSection);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21CC232A4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_21CC23944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t AAUIMonthlyChallengeIsEarnable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", *MEMORY[0x24BE012A8], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "template");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("_"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") != 3)
    goto LABEL_11;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  if (v11 != objc_msgSend(v6, "year") || v13 != objc_msgSend(v6, "month"))
    goto LABEL_11;
  objc_msgSend(v3, "template");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = ACHMonthlyChallengeTypeFromTemplateUniqueName();

  v17 = 0;
  if (v16 <= 0x1C)
  {
    if (((1 << v16) & 0x5FFFE0) == 0)
    {
      if (((1 << v16) & 0x1EA0001E) != 0)
      {
        objc_msgSend(v3, "progress");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValueForUnit:", v19);
        v21 = (uint64_t)v20;

        objc_msgSend(v3, "goal");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValueForUnit:", v23);
        v25 = (uint64_t)v24;

        v26 = objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 16, 8, v4);
        v28 = v26 + v27 - objc_msgSend(v6, "day");
        if (v25 - v21 > v28)
        {
          ACHLogMonthlyChallenges();
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
LABEL_10:

LABEL_11:
            v17 = 0;
            goto LABEL_12;
          }
LABEL_9:
          objc_msgSend(v3, "template");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "uniqueName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v42 = v39;
          v43 = 2048;
          v44 = v21;
          v45 = 2048;
          v46 = v25;
          v47 = 2048;
          v48 = v25 - v21;
          v49 = 2048;
          v50 = v28;
          _os_log_impl(&dword_21CC08000, v29, OS_LOG_TYPE_DEFAULT, "[%@] not earnable anymore, daysEarned = %ld, daysRequired = %ld, daysLeftToEarn = %ld, numberOfDaysLeftThisMonth = %ld", buf, 0x34u);

          goto LABEL_10;
        }
      }
      else
      {
        if (v16 != 24)
          goto LABEL_12;
        objc_msgSend(v3, "progress");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValueForUnit:", v32);
        v21 = (uint64_t)v33;

        objc_msgSend(v3, "goal");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValueForUnit:", v35);
        v25 = (uint64_t)v36;

        v37 = objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 16, 8, v4);
        v28 = v37 + v38 - objc_msgSend(v6, "day");
        if (v25 - v21 > v28)
        {
          ACHLogMonthlyChallenges();
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            goto LABEL_10;
          goto LABEL_9;
        }
      }
    }
    v17 = 1;
  }
LABEL_12:

  return v17;
}

__CFString *AAUILocalizedModalityForAchievement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;

  v1 = a1;
  objc_msgSend(v1, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    ACHLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      AAUILocalizedModalityForAchievement_cold_1(v1, v8);

    v7 = &stru_24E0B4958;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_24E0B4958, CFSTR("Localizable"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t AAUISortAchievementsByMostRecentEarnedDate(void *a1, char a2)
{
  _QWORD v3[4];
  char v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __AAUISortAchievementsByMostRecentEarnedDate_block_invoke;
  v3[3] = &__block_descriptor_33_e43_q24__0__ACHAchievement_8__ACHAchievement_16l;
  v4 = a2;
  return objc_msgSend(a1, "sortUsingComparator:", v3);
}

void sub_21CC245BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

uint64_t AAUIShouldUseNewTrophyCase()
{
  return 1;
}

void sub_21CC28800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CC28B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CC29028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AAUITrophyCaseShouldShowPerfectWeekAchievement(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;

  v5 = a2;
  v6 = a1;
  ACHStartOfFitnessWeekBeforeDateInCalendar();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v7, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "day");
  v10 = a3 >= 5.0;
  v11 = a3 >= 6.0;
  if (v9 != 6)
    v11 = 0;
  if (v9 != 5)
    v10 = v11;
  if (v9 == 4)
    v12 = a3 >= 4.0;
  else
    v12 = v10;

  return v12;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AAUIAwardsDataProvider.activate()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  void *v7;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x250))() & 1) == 0)
  {
    (*(void (**)(uint64_t))((*v1 & *v0) + 0x258))(1);
    v2 = (*(uint64_t (**)(_QWORD))((*v1 & *v0) + 0x270))(0);
    v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x238);
    v4 = (_QWORD *)((uint64_t (*)(uint64_t))v3)(v2);
    if (v4)
    {
      v5 = v4;
      (*(void (**)(void))((*v1 & *v4) + 0x68))();

    }
    v6 = (_QWORD *)v3();
    if (v6)
    {
      v7 = v6;
      (*(void (**)(void))((*v1 & *v6) + 0x60))();

    }
  }
}

void AAUIAwardsDataProvider.add(observer:)(uint64_t a1, uint64_t a2)
{
  sub_21CC2CDD0(a1, a2, (SEL *)&selRef_addObject_);
}

void AAUIAwardsDataProvider.remove(observer:)(uint64_t a1, uint64_t a2)
{
  sub_21CC2CDD0(a1, a2, (SEL *)&selRef_removeObject_);
}

void sub_21CC2CDD0(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = *(_QWORD *)(v3 + OBJC_IVAR___AAUIAwardsDataProvider_protectedObservers);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 24));
  objc_msgSend(*(id *)(v6 + 16), *a3, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 24));
}

Swift::Int __swiftcall AAUIAwardsDataProvider.achievementCount(forSection:)(ActivityAchievementsUI::AAUIAwardsDataProviderSection forSection)
{
  char *v1;
  char v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  Swift::Int result;
  Swift::Int v10;
  _QWORD aBlock[6];
  Swift::Int v12;

  v2 = *(_BYTE *)forSection;
  v12 = 0;
  v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v4 = swift_allocObject();
  *(_BYTE *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = &v12;
  *(_QWORD *)(v4 + 32) = v1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21CC2CF90;
  *(_QWORD *)(v5 + 24) = v4;
  aBlock[4] = sub_21CC0C178;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0C158;
  aBlock[3] = &block_descriptor;
  v6 = _Block_copy(aBlock);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

uint64_t sub_21CC2CF6C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21CC2CF90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = *(uint64_t **)(v0 + 24);
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 32)) + 0x1D8))();
  v4 = *(_QWORD *)(v3 + 16);
  if ((_DWORD)v1)
  {
    if (v4)
    {
      v5 = sub_21CC2EED8(v1);
      if ((v6 & 1) != 0)
      {
        v7 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v18 = MEMORY[0x24BEE4AF8];
        if (v7 >> 62)
        {
          swift_bridgeObjectRetain();
          v8 = sub_21CC3FA14();
          swift_bridgeObjectRelease();
          if (v8)
            goto LABEL_6;
        }
        else
        {
          v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v8)
          {
LABEL_6:
            if (v8 >= 1)
            {
              for (i = 0; i != v8; ++i)
              {
                if ((v7 & 0xC000000000000001) != 0)
                  v10 = (id)MEMORY[0x220788B18](i, v7);
                else
                  v10 = *(id *)(v7 + 8 * i + 32);
                v11 = v10;
                if ((objc_msgSend(v10, sel_unearned) & 1) != 0)
                {

                }
                else
                {
                  sub_21CC3F9B4();
                  sub_21CC3F9D8();
                  sub_21CC3F9E4();
                  sub_21CC3F9C0();
                }
              }
              swift_bridgeObjectRelease();
              v17 = v18;
              if (v18 < 0)
                goto LABEL_27;
LABEL_24:
              if ((v17 & 0x4000000000000000) == 0)
              {
                v15 = *(_QWORD *)(v17 + 16);
                result = swift_release();
                goto LABEL_26;
              }
LABEL_27:
              swift_bridgeObjectRetain();
              v15 = sub_21CC3FA14();
              result = swift_release_n();
              goto LABEL_26;
            }
            __break(1u);
LABEL_29:
            swift_bridgeObjectRetain();
            v15 = sub_21CC3FA14();
            result = swift_bridgeObjectRelease_n();
            goto LABEL_26;
          }
        }
        swift_bridgeObjectRelease();
        v17 = MEMORY[0x24BEE4AF8];
        if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
          goto LABEL_27;
        goto LABEL_24;
      }
    }
    goto LABEL_19;
  }
  if (!v4 || (v12 = sub_21CC2EED8(0), (v13 & 1) == 0))
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    v15 = 0;
    goto LABEL_26;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v14 >> 62)
    goto LABEL_29;
  v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRelease();
LABEL_26:
  *v2 = v15;
  return result;
}

uint64_t sub_21CC2D1E8()
{
  return swift_deallocObject();
}

uint64_t sub_21CC2D1F8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21CC2D21C()
{
  return swift_deallocObject();
}

uint64_t AAUIAwardsDataProvider.topAchievement(forSection:)(char *a1)
{
  char *v1;
  char v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v10;
  _QWORD aBlock[6];
  uint64_t v12;

  v2 = *a1;
  v12 = 0;
  v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_BYTE *)(v4 + 24) = v2;
  *(_QWORD *)(v4 + 32) = &v12;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21CC2D8CC;
  *(_QWORD *)(v5 + 24) = v4;
  aBlock[4] = sub_21CC0C198;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0C158;
  aBlock[3] = &block_descriptor_23;
  v6 = _Block_copy(aBlock);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

void sub_21CC2D374(_QWORD *a1, uint64_t a2, void **a3)
{
  _QWORD *v5;
  char **v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  void **v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char **v47;
  unsigned int v48;
  void **v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v5 = a1;
  v6 = (char **)MEMORY[0x24BEE4EA0];
  v7 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x1F0);
  v8 = v7();
  if (*(_QWORD *)(v8 + 16))
  {
    v9 = sub_21CC2EED8(a2);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v11 >> 62)
        goto LABEL_49;
      if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_5;
    }
  }
  while (2)
  {
    v15 = swift_bridgeObjectRelease();
    v6 = *(char ***)(((unint64_t)*v6 & *v5) + 0x1D8);
    v16 = ((uint64_t (*)(uint64_t))v6)(v15);
    if (*(_QWORD *)(v16 + 16))
    {
      v17 = sub_21CC2EED8(a2);
      if ((v18 & 1) != 0)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (v11 >> 62)
        {
          swift_bridgeObjectRetain();
          v46 = sub_21CC3FA14();
          swift_bridgeObjectRelease();
          if (v46)
            goto LABEL_13;
        }
        else if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_13:
          if ((v11 & 0xC000000000000001) != 0)
            goto LABEL_55;
          if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v19 = *(id *)(v11 + 32);
            goto LABEL_16;
          }
          __break(1u);
          return;
        }
      }
    }
    swift_bridgeObjectRelease();
    v20 = 0;
LABEL_18:
    v21 = *a3;
    *a3 = v20;

    sub_21CC11E70();
    sub_21CC3F828();
    sub_21CC3F828();
    if (v52 == v50 && v53 == v51)
    {
      v22 = swift_bridgeObjectRelease_n();
    }
    else
    {
      v23 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
      v22 = swift_bridgeObjectRelease();
      if ((v23 & 1) == 0)
        return;
    }
    v24 = ((uint64_t (*)(uint64_t))v7)(v22);
    v11 = (unint64_t)sub_21CC12D10(v24);
    swift_bridgeObjectRelease();
    v25 = *(_QWORD *)(v11 + 16);
    if (!v25)
    {
      v26 = (char *)MEMORY[0x24BEE4AF8];
LABEL_42:
      v36 = swift_release();
      v37 = ((uint64_t (*)(uint64_t))v6)(v36);
      if (*(_QWORD *)(v37 + 16) && (v38 = sub_21CC2EED8(a2), (v39 & 1) != 0))
      {
        v40 = a3;
        v41 = *(_QWORD *)(*(_QWORD *)(v37 + 56) + 8 * v38);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_21CC2F7FC(v41, v26);
        v43 = v42;
        a3 = v40;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v43 = 0;
      }
      v44 = *a3;
      *a3 = v43;

      return;
    }
    v47 = v6;
    v48 = a2;
    v49 = a3;
    swift_retain();
    a2 = 0;
    v26 = (char *)MEMORY[0x24BEE4AF8];
    v6 = &selRef_shallowCopyReplacingEarnedInstances_;
    a3 = (void **)&selRef_shallowCopyReplacingEarnedInstances_;
    while (1)
    {
      v27 = *(_QWORD *)(v11 + 8 * a2 + 32);
      if (v27 >> 62)
      {
        swift_bridgeObjectRetain();
        v7 = (uint64_t (*)(void))sub_21CC3FA14();
        if (!v7)
          goto LABEL_24;
      }
      else
      {
        v7 = *(uint64_t (**)(void))((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v7)
          goto LABEL_24;
      }
      if ((v27 & 0xC000000000000001) == 0)
        break;
      v28 = (id)MEMORY[0x220788B18](0, v27);
LABEL_31:
      v29 = v28;
      v5 = objc_msgSend(v28, sel_template, v47);

      v30 = objc_msgSend(v5, sel_uniqueName);
      if (v30)
      {
        v31 = sub_21CC3F7B0();
        v5 = v32;
        swift_bridgeObjectRelease();

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v26 = sub_21CC2F6FC(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
        v34 = *((_QWORD *)v26 + 2);
        v33 = *((_QWORD *)v26 + 3);
        if (v34 >= v33 >> 1)
          v26 = sub_21CC2F6FC((char *)(v33 > 1), v34 + 1, 1, v26);
        *((_QWORD *)v26 + 2) = v34 + 1;
        v35 = &v26[16 * v34];
        *((_QWORD *)v35 + 4) = v31;
        *((_QWORD *)v35 + 5) = v5;
        goto LABEL_25;
      }
LABEL_24:
      swift_bridgeObjectRelease();
LABEL_25:
      if (v25 == ++a2)
      {
        swift_release();
        a3 = v49;
        a2 = v48;
        v6 = v47;
        goto LABEL_42;
      }
    }
    if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v28 = *(id *)(v27 + 32);
      goto LABEL_31;
    }
    __break(1u);
LABEL_49:
    swift_bridgeObjectRetain();
    v45 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
    if (!v45)
      continue;
    break;
  }
LABEL_5:
  if ((v11 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v12 = *(id *)(v11 + 32);
      goto LABEL_8;
    }
    __break(1u);
LABEL_55:
    v19 = (id)MEMORY[0x220788B18](0, v11);
LABEL_16:
    v20 = v19;
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v12 = (id)MEMORY[0x220788B18](0, v11);
LABEL_8:
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = *a3;
  *a3 = v13;

}

uint64_t sub_21CC2D8A8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21CC2D8CC()
{
  uint64_t v0;

  sub_21CC2D374(*(_QWORD **)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_21CC2D8DC()
{
  return swift_deallocObject();
}

uint64_t AAUIAwardsDataProvider.achievementStack(forSection:)(unsigned __int8 *a1)
{
  char *v1;
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char isEscapingClosureAtFileLocation;
  int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  NSObject *v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  char v51;
  unsigned int v52;
  void *v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t aBlock;
  unint64_t v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  uint64_t (*v61)();
  uint64_t *v62;
  unint64_t v63;

  v52 = *a1;
  LOBYTE(v53) = 7;
  v2 = &OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue;
  v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = &v53;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21CC2E580;
  *(_QWORD *)(v5 + 24) = v4;
  v61 = sub_21CC0C198;
  v62 = (uint64_t *)v5;
  aBlock = MEMORY[0x24BDAC760];
  v58 = 1107296256;
  v59 = sub_21CC0C158;
  v60 = &block_descriptor_33;
  v6 = _Block_copy(&aBlock);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v9 = v53;
  swift_release();
  v10 = *(uint64_t *)((char *)&v7->isa + OBJC_IVAR___AAUIAwardsDataProvider_layoutMode);
  if (v10 == 1)
  {
    v11 = 1;
    v12 = 3;
    v13 = v52;
  }
  else
  {
    v13 = v52;
    if (v10)
      goto LABEL_49;
    LOBYTE(aBlock) = v52;
    if (v9 == 7 || (LOBYTE(v53) = v9, sub_21CC196FC(), (sub_21CC3F798() & 1) == 0))
    {
      v11 = 0;
      v12 = 3;
    }
    else
    {
      v11 = 0;
      v12 = 5;
    }
  }
  LOBYTE(v63) = v13;
  v56 = 0;
  sub_21CC11E70();
  sub_21CC3F828();
  sub_21CC3F828();
  v50 = v12;
  if ((void *)aBlock == v53 && v58 == v54)
    v51 = 1;
  else
    v51 = sub_21CC3FAA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v63 = MEMORY[0x24BEE4AF8];
  v53 = 0;
  v14 = *(NSObject **)((char *)&v7->isa + OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v7;
  *(_BYTE *)(v15 + 24) = v13;
  *(_QWORD *)(v15 + 32) = &v53;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_21CC2FA64;
  *(_QWORD *)(v16 + 24) = v15;
  v61 = sub_21CC0C198;
  v62 = (uint64_t *)v16;
  aBlock = MEMORY[0x24BDAC760];
  v58 = 1107296256;
  v59 = sub_21CC0C158;
  v60 = &block_descriptor_95;
  v17 = v13;
  v18 = _Block_copy(&aBlock);
  v2 = v62;
  v19 = v7;
  swift_retain();
  swift_release();
  v7 = v14;
  dispatch_sync(v14, v18);
  _Block_release(v18);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v18 & 1) != 0)
    goto LABEL_41;
  v20 = v53;
  swift_release();
  v56 = v17;
  v55 = 0;
  sub_21CC3F828();
  sub_21CC3F828();
  v21 = v17;
  if ((void *)aBlock == v53 && v58 == v54)
  {
    v22 = swift_bridgeObjectRelease_n();
    v23 = v50;
    v24 = v51;
    v25 = v7;
  }
  else
  {
    v26 = sub_21CC3FAA4();
    swift_bridgeObjectRelease();
    v22 = swift_bridgeObjectRelease();
    v23 = v50;
    v24 = v51;
    v25 = v7;
    if ((v26 & 1) == 0)
    {
      v7 = v19;
      v27 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v19->isa) + 0x1F0))(v22);
      if (!*(_QWORD *)(v27 + 16))
        goto LABEL_24;
      v28 = sub_21CC2EED8(v21);
      if ((v30 & 1) == 0)
        goto LABEL_24;
LABEL_23:
      v31 = v25;
      v32 = *(_QWORD *)(*(_QWORD *)(v27 + 56) + 8 * v28);
      swift_bridgeObjectRetain();
      goto LABEL_25;
    }
  }
  v7 = v19;
  v27 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v19->isa) + 0x1D8))(v22);
  if (*(_QWORD *)(v27 + 16))
  {
    v28 = sub_21CC2EED8(0);
    if ((v29 & 1) != 0)
      goto LABEL_23;
  }
LABEL_24:
  v31 = v25;
  v32 = 0;
LABEL_25:
  swift_bridgeObjectRelease();
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = &v63;
  *(_QWORD *)(v33 + 24) = v32;
  *(_BYTE *)(v33 + 32) = v11;
  *(_QWORD *)(v33 + 40) = v20;
  *(_BYTE *)(v33 + 48) = v24 & 1;
  *(_QWORD *)(v33 + 56) = v23;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = sub_21CC2F314;
  *(_QWORD *)(v34 + 24) = v33;
  v61 = sub_21CC0C198;
  v62 = (uint64_t *)v34;
  aBlock = MEMORY[0x24BDAC760];
  v58 = 1107296256;
  v59 = sub_21CC0C158;
  v60 = &block_descriptor_105;
  v35 = _Block_copy(&aBlock);
  v2 = v20;
  swift_retain();
  swift_release();
  dispatch_sync(v31, v35);
  _Block_release(v35);
  v36 = swift_isEscapingClosureAtFileLocation();
  v37 = swift_release();
  if ((v36 & 1) != 0)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain();
    v10 = sub_21CC3FA14();
    v37 = swift_bridgeObjectRelease();
    v38 = v52;
    if (v10)
      goto LABEL_38;
    goto LABEL_28;
  }
  if (v63 >> 62)
    goto LABEL_43;
  v10 = *(_QWORD *)((v63 & 0xFFFFFFFFFFFFF8) + 0x10);
  v38 = v52;
  if (v10)
  {
LABEL_38:

    goto LABEL_39;
  }
LABEL_28:
  if (*(Class *)((char *)&v7->isa + OBJC_IVAR___AAUIAwardsDataProvider_layoutMode) != (Class)1)
    goto LABEL_38;
  v39 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v7->isa) + 0x1D8))(v37);
  if (!*(_QWORD *)(v39 + 16))
    goto LABEL_37;
  v40 = sub_21CC2EED8(v38);
  if ((v41 & 1) == 0)
    goto LABEL_37;
  v42 = *(_QWORD *)(*(_QWORD *)(v39 + 56) + 8 * v40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v42 >> 62)
  {
    swift_bridgeObjectRetain();
    v49 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
    if (v49)
      goto LABEL_33;
    goto LABEL_37;
  }
  if (!*(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_37:
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
LABEL_33:
  if ((v42 & 0xC000000000000001) != 0)
  {
    v43 = (id)MEMORY[0x220788B18](0, v42);
    goto LABEL_36;
  }
  if (*(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v43 = *(id *)(v42 + 32);
LABEL_36:
    v44 = v43;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7C8);
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_21CC41F10;
    *(_QWORD *)(v45 + 32) = v44;
    aBlock = v45;
    sub_21CC3F864();
    v46 = aBlock;

    v63 = v46;
    swift_bridgeObjectRelease();
LABEL_39:
    v47 = v63;
    swift_release();
    return v47;
  }
  __break(1u);
LABEL_49:
  aBlock = 0;
  v58 = 0xE000000000000000;
  sub_21CC3F96C();
  sub_21CC3F7EC();
  v53 = (void *)v10;
  type metadata accessor for AAUIAchievementsDataProviderLayoutMode();
  sub_21CC3F9F0();
  result = sub_21CC3FA08();
  __break(1u);
  return result;
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional __swiftcall AAUIAwardsDataProvider.mostRecentSection()()
{
  char *v0;
  char *v1;
  char *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional result;
  char v10;
  _QWORD aBlock[6];
  char v12;

  v2 = v0;
  v12 = 7;
  v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = &v12;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21CC2FA10;
  *(_QWORD *)(v5 + 24) = v4;
  aBlock[4] = sub_21CC0C198;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0C158;
  aBlock[3] = &block_descriptor_44;
  v6 = _Block_copy(aBlock);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result.value = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = v12;
    result.value = swift_release();
    *v2 = v10;
  }
  return result;
}

uint64_t AAUIAwardsDataProvider.achievements(forSection:)(char *a1)
{
  char *v1;
  char v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v10;
  _QWORD aBlock[6];
  uint64_t v12;

  v2 = *a1;
  v12 = MEMORY[0x24BEE4AF8];
  v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &v12;
  *(_QWORD *)(v4 + 24) = v1;
  *(_BYTE *)(v4 + 32) = v2;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21CC2E620;
  *(_QWORD *)(v5 + 24) = v4;
  aBlock[4] = sub_21CC0C198;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0C158;
  aBlock[3] = &block_descriptor_54;
  v6 = _Block_copy(aBlock);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

uint64_t AAUIAwardsDataProvider.achievements(forWorkoutIdentifier:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v12;
  _QWORD aBlock[6];
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  v5 = *(NSObject **)&v2[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = &v14;
  v6[3] = v2;
  v6[4] = a1;
  v6[5] = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_21CC2E6E8;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_21CC0C198;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0C158;
  aBlock[3] = &block_descriptor_64;
  v8 = _Block_copy(aBlock);
  v9 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v12 = v14;
    swift_release();
    return v12;
  }
  return result;
}

uint64_t sub_21CC2E4E8(_QWORD *a1, _BYTE *a2)
{
  uint64_t (*v3)(void);
  unint64_t v4;
  uint64_t result;
  char v6;

  v3 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x220);
  v4 = *(_QWORD *)(v3() + 16);
  result = swift_bridgeObjectRelease();
  if (v4 >= 2)
  {
    result = ((uint64_t (*)(uint64_t))v3)(result);
    if (*(_QWORD *)(result + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      v6 = *(_BYTE *)(result + 33);
      result = swift_bridgeObjectRelease();
      *a2 = v6;
    }
  }
  return result;
}

uint64_t sub_21CC2E55C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21CC2E580()
{
  uint64_t v0;

  return sub_21CC2E4E8(*(_QWORD **)(v0 + 16), *(_BYTE **)(v0 + 24));
}

uint64_t sub_21CC2E588()
{
  return swift_deallocObject();
}

void type metadata accessor for AAUIAchievementsDataProviderLayoutMode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25531C7B0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25531C7B0);
  }
}

uint64_t sub_21CC2E5EC()
{
  return swift_deallocObject();
}

uint64_t sub_21CC2E5FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21CC2E620()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;

  v1 = *(_QWORD **)(v0 + 16);
  v2 = *(unsigned __int8 *)(v0 + 32);
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 24)) + 0x1D8))();
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_21CC2EED8(v2), (v5 & 1) != 0))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v4);
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  *v1 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC2E6AC()
{
  return swift_deallocObject();
}

uint64_t sub_21CC2E6BC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21CC2E6E8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;

  v1 = *(_QWORD **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 24)) + 0x208);
  v5 = swift_bridgeObjectRetain();
  v6 = v4(v5);
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_21CC2EF40(v3, v2), (v8 & 1) != 0))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *v1 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC2E790()
{
  return swift_deallocObject();
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional __swiftcall AAUIAwardsDataProvider.sections(atIndex:)(Swift::Int atIndex)
{
  char *v1;
  char *v2;
  char *v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  char isEscapingClosureAtFileLocation;
  ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional result;
  char v12;
  _QWORD aBlock[6];
  char v14;

  v4 = v1;
  v14 = 7;
  v5 = *(NSObject **)&v2[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = atIndex;
  v6[4] = &v14;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_21CC2E8F4;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_21CC0C198;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0C158;
  aBlock[3] = &block_descriptor_74;
  v8 = _Block_copy(aBlock);
  v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result.value = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v12 = v14;
    result.value = swift_release();
    *v4 = v12;
  }
  return result;
}

uint64_t sub_21CC2E8F4()
{
  uint64_t v0;
  _BYTE *v1;
  unint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t result;
  char v6;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_BYTE **)(v0 + 32);
  v3 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 16)) + 0x220);
  v4 = *(_QWORD *)(v3() + 16);
  result = swift_bridgeObjectRelease();
  if (v4 > (uint64_t)v2)
  {
    result = ((uint64_t (*)(uint64_t))v3)(result);
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)(result + 16) > v2)
    {
      v6 = *(_BYTE *)(result + v2 + 32);
      result = swift_bridgeObjectRelease();
      *v1 = v6;
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21CC2E980()
{
  return swift_deallocObject();
}

uint64_t AAUIAwardsDataProvider.otherSections()()
{
  char *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char *v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v8;
  _QWORD aBlock[6];
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  v1 = *(NSObject **)&v0[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)(v2 + 24) = &v10;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_21CC2EAD4;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_21CC0C198;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0C158;
  aBlock[3] = &block_descriptor_84;
  v4 = _Block_copy(aBlock);
  v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v8 = v10;
    swift_release();
    return v8;
  }
  return result;
}

uint64_t sub_21CC2EAD4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)(void);
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(uint64_t **)(v0 + 24);
  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 16)) + 0x220);
  v3 = *(_QWORD *)(v2() + 16);
  result = swift_bridgeObjectRelease();
  if (v3 >= 3)
  {
    v5 = ((uint64_t (*)(uint64_t))v2)(result);
    v6 = *(_QWORD *)(v5 + 16);
    if (v6 < 2)
    {
      __break(1u);
    }
    else
    {
      v2 = (uint64_t (*)(void))v5;
      sub_21CC3FAB0();
      swift_unknownObjectRetain_n();
      v7 = swift_dynamicCastClass();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        v7 = MEMORY[0x24BEE4AF8];
      }
      v8 = *(_QWORD *)(v7 + 16);
      swift_release();
      if (v8 == v6 - 2)
      {
        v9 = swift_dynamicCastClass();
        if (!v9)
        {
          swift_bridgeObjectRelease();
          v9 = MEMORY[0x24BEE4AF8];
        }
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    sub_21CC2F080((uint64_t)v2, (uint64_t)v2 + 32, 2, (2 * v6) | 1);
    v9 = v10;
LABEL_8:
    swift_bridgeObjectRelease();
    *v1 = v9;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21CC2EC04()
{
  return swift_deallocObject();
}

uint64_t AAUIAwardsDataProvider.shouldShowProgressBar(for:)(void *a1)
{
  _QWORD *v1;
  uint64_t result;
  id v4;
  id v5;

  result = (uint64_t)objc_msgSend(a1, sel_unearned);
  if ((_DWORD)result)
  {
    v4 = objc_msgSend(a1, sel_goal);

    if (v4 && (v5 = objc_msgSend(a1, sel_progress), v5, v5))
    {
      if (((*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x280))() & 1) != 0)
        return objc_msgSend(a1, sel_isRingsBased) ^ 1;
      else
        return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_21CC2ECD4()
{
  AAUIAwardsDataProvider.activate()();
}

void sub_21CC2ECF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_21CC0B250(a1, a2, a3, a4, (SEL *)&selRef_removeObject_);
}

Swift::Int sub_21CC2ED00(ActivityAchievementsUI::AAUIAwardsDataProviderSection a1)
{
  return AAUIAwardsDataProvider.achievementCount(forSection:)(a1);
}

uint64_t sub_21CC2ED20(char *a1)
{
  return AAUIAwardsDataProvider.topAchievement(forSection:)(a1);
}

uint64_t sub_21CC2ED40(unsigned __int8 *a1)
{
  return AAUIAwardsDataProvider.achievementStack(forSection:)(a1);
}

uint64_t sub_21CC2ED60(char *a1)
{
  return AAUIAwardsDataProvider.achievements(forSection:)(a1);
}

uint64_t sub_21CC2ED80(uint64_t a1, uint64_t a2)
{
  return AAUIAwardsDataProvider.achievements(forWorkoutIdentifier:)(a1, a2);
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional sub_21CC2EDA0()
{
  return AAUIAwardsDataProvider.mostRecentSection()();
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional sub_21CC2EDC0(Swift::Int a1)
{
  return AAUIAwardsDataProvider.sections(atIndex:)(a1);
}

uint64_t sub_21CC2EDE0()
{
  return AAUIAwardsDataProvider.otherSections()();
}

uint64_t sub_21CC2EE00(void *a1)
{
  return AAUIAwardsDataProvider.shouldShowProgressBar(for:)(a1) & 1;
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.activate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.activate(isFitnessPlusSubscriber:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.add(observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.remove(observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.topThreeAchievements()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievementCount(forSection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.topAchievement(forSection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievementStack(forSection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievements(forSection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievements(forWorkoutIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.mostRecentSection()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.sections(atIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.otherSections()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.shouldShowProgressBar(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviderObserver.didUpdate(updatedAchievements:deletedAchievements:updatedSections:deletedSections:sectionOrderChanged:topAchievementsChanged:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8))();
}

_QWORD *sub_21CC2EEBC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21CC2EECC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t sub_21CC2EED8(uint64_t a1)
{
  uint64_t v2;

  sub_21CC196AC();
  v2 = sub_21CC3F774();
  return sub_21CC2F134(a1, v2);
}

unint64_t sub_21CC2EF40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21CC3FAE0();
  sub_21CC3F7D4();
  v4 = sub_21CC3FAEC();
  return sub_21CC2F1F8(a1, a2, v4);
}

void sub_21CC2EFA4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      if (v4 != a3)
      {
LABEL_7:
        sub_21CC0B890();
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7C8);
      v7 = (_QWORD *)swift_allocObject();
      v8 = _swift_stdlib_malloc_size(v7);
      v9 = v8 - 32;
      if (v8 < 32)
        v9 = v8 - 25;
      v7[2] = v5;
      v7[3] = (2 * (v9 >> 3)) | 1;
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
    goto LABEL_11;
  }
}

void sub_21CC2F080(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  int64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_9:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
        goto LABEL_5;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7B8);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3)
      {
LABEL_5:
        memcpy(v8 + 4, (const void *)(a2 + a3), v5);
        return;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
}

unint64_t sub_21CC2F134(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    sub_21CC196FC();
    do
    {
      if ((sub_21CC3F798() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_21CC2F1F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21CC3FAA4() & 1) == 0)
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
      while (!v14 && (sub_21CC3FAA4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21CC2F2D8()
{
  return swift_deallocObject();
}

uint64_t sub_21CC2F2E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21CC2F314()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v38 = *(uint64_t **)(v0 + 16);
  v1 = *(unsigned __int8 *)(v0 + 32);
  v2 = *(void **)(v0 + 40);
  v3 = *(unsigned __int8 *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  if (*(_QWORD *)(v0 + 24))
    v5 = *(_QWORD *)(v0 + 24);
  else
    v5 = MEMORY[0x24BEE4AF8];
  v44 = MEMORY[0x24BEE4AF8];
  if (v5 >> 62)
    goto LABEL_39;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v6)
  {
    while (1)
    {
      v37 = v4;
      v42 = v5 & 0xFFFFFFFFFFFFFF8;
      v43 = v5 & 0xC000000000000001;
      v7 = 4;
      v39 = v6;
      v40 = v2;
      while (1)
      {
        v8 = v7 - 4;
        if (!v43)
          break;
        v9 = (id)MEMORY[0x220788B18](v7 - 4, v5);
LABEL_12:
        v10 = v9;
        v4 = v7 - 3;
        if (__OFADD__(v8, 1))
          goto LABEL_38;
        if ((v1 & 1) != 0)
          goto LABEL_30;
        v11 = objc_msgSend(v9, sel_template);
        v12 = objc_msgSend(v11, sel_uniqueName);

        if (v12)
        {
          v13 = sub_21CC3F7B0();
          v15 = v14;

          if (!v2)
            goto LABEL_19;
        }
        else
        {
          v13 = 0;
          v15 = 0;
          if (!v2)
          {
LABEL_19:
            v22 = 0;
            if (!v15)
              goto LABEL_20;
            goto LABEL_24;
          }
        }
        v41 = v13;
        v16 = v5;
        v17 = v3;
        v18 = v1;
        v19 = objc_msgSend(v2, sel_template, v37);
        v20 = objc_msgSend(v19, sel_uniqueName);

        if (v20)
        {
          v2 = (void *)sub_21CC3F7B0();
          v22 = v21;

        }
        else
        {
          v2 = 0;
          v22 = 0;
        }
        v1 = v18;
        v3 = v17;
        v5 = v16;
        v13 = v41;
        if (!v15)
        {
LABEL_20:
          if (!v22)
            goto LABEL_28;
LABEL_29:
          swift_bridgeObjectRelease();
          v6 = v39;
          v2 = v40;
          goto LABEL_30;
        }
LABEL_24:
        if (!v22)
          goto LABEL_29;
        if ((void *)v13 == v2 && v15 == v22)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_28:

          v6 = v39;
          v2 = v40;
          goto LABEL_8;
        }
        v23 = sub_21CC3FAA4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v6 = v39;
        v2 = v40;
        if ((v23 & 1) != 0)
          goto LABEL_32;
LABEL_30:
        if ((v3 & 1) == 0 && objc_msgSend(v10, sel_unearned))
        {
LABEL_32:

          goto LABEL_8;
        }
        sub_21CC3F9B4();
        sub_21CC3F9D8();
        sub_21CC3F9E4();
        sub_21CC3F9C0();
LABEL_8:
        ++v7;
        if (v4 == v6)
        {
          v24 = v44;
          v4 = v37;
          goto LABEL_41;
        }
      }
      if (v8 < *(_QWORD *)(v42 + 16))
        break;
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v6 = sub_21CC3FA14();
      swift_bridgeObjectRelease();
      if (!v6)
        goto LABEL_40;
    }
    v9 = *(id *)(v5 + 8 * v7);
    goto LABEL_12;
  }
LABEL_40:
  v24 = MEMORY[0x24BEE4AF8];
LABEL_41:
  swift_bridgeObjectRelease();
  v25 = sub_21CC13028(v4, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  swift_release();
  if ((v31 & 1) == 0)
    goto LABEL_42;
  sub_21CC3FAB0();
  swift_unknownObjectRetain_n();
  v34 = swift_dynamicCastClass();
  if (!v34)
  {
    swift_unknownObjectRelease();
    v34 = MEMORY[0x24BEE4AF8];
  }
  v35 = *(_QWORD *)(v34 + 16);
  swift_release();
  if (__OFSUB__(v31 >> 1, v29))
  {
    __break(1u);
    goto LABEL_51;
  }
  if (v35 != (v31 >> 1) - v29)
  {
LABEL_51:
    swift_unknownObjectRelease();
LABEL_42:
    sub_21CC2EFA4(v25, v27, v29, v31);
    v33 = v32;
    goto LABEL_49;
  }
  v33 = swift_dynamicCastClass();
  if (!v33)
  {
    swift_unknownObjectRelease();
    v33 = MEMORY[0x24BEE4AF8];
  }
LABEL_49:
  swift_unknownObjectRelease();
  *v38 = v33;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC2F6EC()
{
  return swift_deallocObject();
}

char *sub_21CC2F6FC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_21CC2F7FC(unint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v2 = a1;
  if (!(a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_30:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_29:
  swift_bridgeObjectRetain();
  v3 = sub_21CC3FA14();
  if (!v3)
    goto LABEL_30;
LABEL_3:
  v4 = 0;
  v19 = v2;
  v20 = v2 & 0xC000000000000001;
  v18 = v2 + 32;
  while (1)
  {
    if (v20)
      v5 = (id)MEMORY[0x220788B18](v4, v19);
    else
      v5 = *(id *)(v18 + 8 * v4);
    v6 = v5;
    if (__OFADD__(v4++, 1))
      goto LABEL_28;
    v8 = objc_msgSend(v5, sel_template);
    v9 = objc_msgSend(v8, sel_uniqueName);

    if (!v9)
      break;
    v10 = sub_21CC3F7B0();
    v12 = v11;

    v13 = a2[2];
    if (!v13)
      goto LABEL_25;
    v14 = a2[4] == v10 && a2[5] == v12;
    if (!v14 && (sub_21CC3FAA4() & 1) == 0)
    {
      if (v13 == 1)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      v15 = a2 + 7;
      v16 = 1;
      while (1)
      {
        v2 = v16 + 1;
        if (__OFADD__(v16, 1))
          break;
        v17 = *(v15 - 1) == v10 && *v15 == v12;
        if (v17 || (sub_21CC3FAA4() & 1) != 0)
          goto LABEL_4;
        v15 += 2;
        ++v16;
        if (v2 == v13)
          goto LABEL_25;
      }
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
LABEL_4:

    swift_bridgeObjectRelease();
    if (v4 == v3)
      goto LABEL_30;
  }
  __break(1u);
}

uint64_t sub_21CC2FA08()
{
  return swift_release();
}

uint64_t sub_21CC2FA68(uint64_t a1)
{
  return sub_21CC0AFE8(a1, qword_25531CC60);
}

uint64_t sub_21CC2FA88()
{
  return sub_21CC106B4(&qword_25531CA40, (uint64_t)qword_25531CC60);
}

uint64_t sub_21CC2FAA4@<X0>(uint64_t a1@<X8>)
{
  return sub_21CC2FADC(&qword_25531CA40, (uint64_t)qword_25531CC60, a1);
}

uint64_t sub_21CC2FAC0@<X0>(uint64_t a1@<X8>)
{
  return sub_21CC2FADC(qword_25531CA48, (uint64_t)qword_25531CC78, a1);
}

uint64_t sub_21CC2FADC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_21CC3F72C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

void sub_21CC2FB44(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  v4 = sub_21CC2FCBC(a1, a2, a3, a4);
  v6 = v5;
  swift_bridgeObjectRetain();
  oslog = sub_21CC3F714();
  v7 = sub_21CC3F8B8();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v11 = v9;
    *(_DWORD *)v8 = 136446210;
    swift_bridgeObjectRetain();
    sub_21CC0FA20(v4, v6, &v11);
    sub_21CC3F900();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21CC08000, oslog, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207896E8](v9, -1, -1);
    MEMORY[0x2207896E8](v8, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
}

uint64_t sub_21CC2FCBC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
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
  uint64_t v23;
  uint64_t v24;
  _opaque_pthread_t *v25;

  sub_21CC19F6C();
  v8 = sub_21CC3F918();
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    v10 = v8 + 16 * v9;
    a1 = *(_QWORD *)(v10 + 16);
    a2 = *(_QWORD *)(v10 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_21CC2FF40(46, 0xE100000000000000, a1, a2);
  v11 = sub_21CC3F81C();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  swift_bridgeObjectRelease();
  MEMORY[0x220788950](v11, v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_21CC2FF40(40, 0xE100000000000000, a3, a4);
  swift_bridgeObjectRetain();
  v18 = sub_21CC3F81C();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  swift_bridgeObjectRelease();
  MEMORY[0x220788950](v18, v20, v22, v24);
  swift_bridgeObjectRelease();
  v25 = pthread_self();
  pthread_mach_thread_np(v25);
  sub_21CC3FA80();
  sub_21CC3F7EC();
  swift_bridgeObjectRelease();
  sub_21CC3F7EC();
  sub_21CC3F7EC();
  swift_bridgeObjectRelease();
  sub_21CC3F7EC();
  sub_21CC3F7EC();
  swift_bridgeObjectRelease();
  return 91;
}

unint64_t sub_21CC2FF40(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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
  while (sub_21CC3F810() != a1 || v9 != a2)
  {
    v10 = sub_21CC3FAA4();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return v8;
    v8 = sub_21CC3F7E0();
    if (v7 == v8 >> 14)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21CC30030()
{
  sub_21CC3FA8C();
  return 0;
}

uint64_t sub_21CC30070(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21CC30104(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21CC302DC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21CC302DC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21CC30104(uint64_t a1, unint64_t a2)
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
      v3 = sub_21CC30278(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21CC3F978();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21CC3F9FC();
      __break(1u);
LABEL_10:
      v2 = sub_21CC3F7F8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21CC3FA50();
    __break(1u);
LABEL_14:
    result = sub_21CC3F9FC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21CC30278(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21CC302DC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7F0);
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
  result = sub_21CC3FA50();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for AAUILog()
{
  return &type metadata for AAUILog;
}

uint64_t sub_21CC30438(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

Swift::String __swiftcall AAUIAwardsDataProviderSection.localized()()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  Swift::String result;

  v1 = *v0;
  type metadata accessor for AAUIAwardsDataProvider();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  __asm { BR              X9 }
  return result;
}

uint64_t sub_21CC304BC()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (void *)sub_21CC3F7A4();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_21CC3F7A4();
  v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, v2);

  v4 = sub_21CC3F7B0();
  return v4;
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional __swiftcall AAUIAwardsDataProviderSection.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21CC3FA5C();
  result.value = swift_bridgeObjectRelease();
  v5 = 7;
  if (v3 < 7)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static AAUIAwardsDataProviderSection.allCases.getter()
{
  return &unk_24E0B3908;
}

void sub_21CC30680(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21CC306DC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21CC307A0 + 4 * byte_21CC4204E[a2]))(0x5954495649544341);
}

uint64_t sub_21CC307A0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x5954495649544341 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_21CC3FAA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_21CC308BC()
{
  char *v0;

  sub_21CC309D8(0, *v0);
}

void sub_21CC308C8(uint64_t a1)
{
  char *v1;

  sub_21CC308D0(a1, *v1);
}

void sub_21CC308D0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21CC30914()
{
  sub_21CC3F7D4();
  return swift_bridgeObjectRelease();
}

void sub_21CC309D8(uint64_t a1, char a2)
{
  sub_21CC3FAE0();
  __asm { BR              X10 }
}

uint64_t sub_21CC30A28()
{
  sub_21CC3F7D4();
  swift_bridgeObjectRelease();
  return sub_21CC3FAEC();
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional sub_21CC30B00(Swift::String *a1)
{
  return AAUIAwardsDataProviderSection.init(rawValue:)(*a1);
}

void sub_21CC30B0C(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E0B3908;
}

uint64_t sub_21CC30B1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___AAUIAwardsDataProvider_calendar;
  v4 = sub_21CC3F6A8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_21CC30B60()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_layoutMode);
}

id sub_21CC30B70()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_pauseRingsCoordinator);
}

id sub_21CC30B80()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
}

uint64_t sub_21CC30B90()
{
  return 0;
}

uint64_t (*sub_21CC30B98())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21CC30BDC()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t (*sub_21CC30BE8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

unint64_t sub_21CC30C2C()
{
  return sub_21CC13FF4(MEMORY[0x24BEE4AF8]);
}

uint64_t (*sub_21CC30C38())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t sub_21CC30C7C()
{
  return sub_21CC15B80(MEMORY[0x24BEE4AF8]);
}

uint64_t (*sub_21CC30C88())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_21CC30CCC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_21CC30D10()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue);
}

uint64_t (*sub_21CC30D20())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21CC30D64()
{
  return sub_21CC19654();
}

uint64_t (*sub_21CC30D70())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21CC30DB4()
{
  return sub_21CC19654();
}

uint64_t (*sub_21CC30DC0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21CC30E04()
{
  return sub_21CC19654();
}

uint64_t (*sub_21CC30E10())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21CC30E54()
{
  return sub_21CC19654();
}

uint64_t (*sub_21CC30E60())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_21CC30EA4()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_notifyQueue);
}

uint64_t sub_21CC30EB4()
{
  return swift_retain();
}

uint64_t sub_21CC30EC4()
{
  return 0;
}

void sub_21CC30ECC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_query);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_21CC30F1C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_21CC30F60())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_21CC30FA4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_21CC30FE8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_pauseRingsCoordinator), sel_isPaused);
}

uint64_t AAUIAwardsDataProvider.__allocating_init(healthStore:layoutMode:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, id, uint64_t))(v2 + 648))(a1, objc_msgSend(objc_allocWithZone(MEMORY[0x24BE32808]), sel_initWithHealthStore_, a1), a2);
}

_QWORD *AAUIAwardsDataProvider.__allocating_init(healthStore:pauseRingsCoordinator:layoutMode:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return AAUIAwardsDataProvider.init(healthStore:pauseRingsCoordinator:layoutMode:)(a1, a2, a3);
}

_QWORD *AAUIAwardsDataProvider.init(healthStore:pauseRingsCoordinator:layoutMode:)(void *a1, void *a2, void *a3)
{
  _BYTE *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t, uint64_t);
  id v32;
  uint64_t v33;
  __CFString *v34;
  id v35;
  __CFString *v36;
  CFIndex AppIntegerValue;
  objc_class *v38;
  id v39;
  _QWORD *v40;
  id v41;
  void **v42;
  void *v43;
  _QWORD v45[8];
  uint64_t v46;
  id v47;
  id v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  objc_super v52;

  v48 = a3;
  v50 = sub_21CC3F8D0();
  v46 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v49 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21CC3F8C4();
  MEMORY[0x24BDAC7A8](v7);
  v45[7] = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21CC3F750();
  MEMORY[0x24BDAC7A8](v9);
  v45[6] = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21CC3F6A8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3[OBJC_IVAR___AAUIAwardsDataProvider_initialAwardsBatchDelivered] = 0;
  v15 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v3[OBJC_IVAR___AAUIAwardsDataProvider_topAchievements] = MEMORY[0x24BEE4AF8];
  v16 = OBJC_IVAR___AAUIAwardsDataProvider_achievementsPerSection;
  v17 = v3;
  *(_QWORD *)&v3[v16] = sub_21CC13FF4(v15);
  v18 = OBJC_IVAR___AAUIAwardsDataProvider_mostRecentlyEarnedAchievementsPerSection;
  *(_QWORD *)&v17[v18] = sub_21CC13FF4(v15);
  v19 = OBJC_IVAR___AAUIAwardsDataProvider_achievementsPerWorkoutIdentifier;
  *(_QWORD *)&v17[v19] = sub_21CC15B80(v15);
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_orderedSections] = v15;
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_clientTopAchievements] = v15;
  v20 = OBJC_IVAR___AAUIAwardsDataProvider_clientAchievementsPerSection;
  *(_QWORD *)&v17[v20] = sub_21CC13FF4(v15);
  v21 = OBJC_IVAR___AAUIAwardsDataProvider_clientMostRecentlyEarnedAchievementsPerSection;
  *(_QWORD *)&v17[v21] = sub_21CC13FF4(v15);
  v22 = OBJC_IVAR___AAUIAwardsDataProvider_clientAchievementsPerWorkoutIdentifier;
  *(_QWORD *)&v17[v22] = sub_21CC15B80(v15);
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_clientOrderedSections] = v15;
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_query] = 0;
  v17[OBJC_IVAR___AAUIAwardsDataProvider_isActivated] = 0;
  v17[OBJC_IVAR___AAUIAwardsDataProvider_isFitnessPlusSubscriber] = 0;
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_observers] = v15;
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_layoutMode] = v48;
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_healthStore] = a1;
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_pauseRingsCoordinator] = a2;
  v23 = objc_allocWithZone(MEMORY[0x24BE01858]);
  v48 = a1;
  v47 = a2;
  v24 = objc_msgSend(v23, sel_init);
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_visibilityEvaluator] = v24;
  v25 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  sub_21CC3F66C();

  (*(void (**)(_BYTE *, char *, uint64_t))(v12 + 32))(&v17[OBJC_IVAR___AAUIAwardsDataProvider_calendar], v14, v11);
  v45[5] = sub_21CC19740(0, &qword_25531C808);
  sub_21CC3F744();
  v51 = v15;
  v45[4] = sub_21CC10710(&qword_25531C810, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531C818);
  v27 = sub_21CC10750(&qword_25531C820, &qword_25531C818, MEMORY[0x24BEE12C8]);
  v45[1] = v26;
  v45[2] = v27;
  v45[3] = v7;
  sub_21CC3F93C();
  v28 = *MEMORY[0x24BEE5750];
  v46 = *(_QWORD *)(v46 + 104);
  v29 = v50;
  ((void (*)(char *, uint64_t, uint64_t))v46)(v49, v28, v50);
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue] = sub_21CC3F8E8();
  sub_21CC3F744();
  v51 = MEMORY[0x24BEE4AF8];
  sub_21CC3F93C();
  v30 = v49;
  v31 = (void (*)(char *, uint64_t, uint64_t))v46;
  ((void (*)(char *, uint64_t, uint64_t))v46)(v49, v28, v29);
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_awardQueue] = sub_21CC3F8E8();
  sub_21CC3F744();
  v51 = MEMORY[0x24BEE4AF8];
  sub_21CC3F93C();
  v31(v30, v28, v50);
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_notifyQueue] = sub_21CC3F8E8();
  v32 = objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C828);
  v33 = swift_allocObject();
  *(_DWORD *)(v33 + 24) = 0;
  *(_QWORD *)(v33 + 16) = v32;
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_protectedObservers] = v33;
  v34 = (__CFString *)sub_21CC3F7A4();
  v35 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v36 = (__CFString *)objc_msgSend(v35, sel_bundleIdentifier);

  if (v36)
  {
    AppIntegerValue = CFPreferencesGetAppIntegerValue(v34, v36, 0);

  }
  else
  {
    AppIntegerValue = 0;
  }
  *(_QWORD *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_overrideDisplayState] = AppIntegerValue;

  v38 = (objc_class *)type metadata accessor for AAUIAwardsDataProvider();
  v52.receiver = v17;
  v52.super_class = v38;
  v39 = objc_msgSendSuper2(&v52, sel_init);
  type metadata accessor for AAUIAwardsQuery();
  *(_QWORD *)(swift_allocObject() + 16) = v39;
  *(_QWORD *)(swift_allocObject() + 16) = v39;
  *(_QWORD *)(swift_allocObject() + 16) = v39;
  *(_QWORD *)(swift_allocObject() + 16) = v39;
  v40 = v39;
  v41 = AAUIAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)();
  v42 = (void **)((char *)v40 + OBJC_IVAR___AAUIAwardsDataProvider_query);
  swift_beginAccess();
  v43 = *v42;
  *v42 = v41;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v40) + 0x2A8))();
  return v40;
}

uint64_t sub_21CC317EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21CC31810(unint64_t a1)
{
  return sub_21CC0B22C(a1);
}

uint64_t sub_21CC31830(unint64_t a1)
{
  return sub_21CC0B208(a1);
}

uint64_t sub_21CC31850(unint64_t a1)
{
  return sub_21CC32040(a1);
}

uint64_t sub_21CC31870()
{
  return sub_21CC19654();
}

uint64_t (*sub_21CC3187C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21CC318C0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_21CC318E4()
{
  uint64_t v0;

  sub_21CC0C004(v0, "[AAUIAwardsDataProvider] Significant time change, cycling data provider.");
}

void sub_21CC31904(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = sub_21CC3F72C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = MEMORY[0x22078973C](a1 + 16);
  if (v6)
  {
    v7 = (_QWORD *)v6;
    v8 = sub_21CC106F4();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    v9 = sub_21CC3F714();
    v10 = sub_21CC3F8B8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21CC08000, v9, v10, "[AAUIAwardsDataProvider] App entered background, stopping data provider query.", v11, 2u);
      MEMORY[0x2207896E8](v11, -1, -1);
    }

    v12 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v7) + 0x2B0))(v12);

  }
}

void sub_21CC31A58()
{
  uint64_t v0;

  sub_21CC31904(v0);
}

void sub_21CC31A60()
{
  uint64_t v0;

  sub_21CC0C004(v0, "[AAUIAwardsDataProvider] pause rings coordinator updated, cycling data provider.");
}

void sub_21CC31A80()
{
  uint64_t v0;

  sub_21CC0C004(v0, "[AAUIAwardsDataProvider] pause rings coordinator initial notification, cycling data provider.");
}

id AAUIAwardsDataProvider.__deallocating_deinit()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  objc_super v8;
  _QWORD v9[4];

  v1 = &v0[OBJC_IVAR___AAUIAwardsDataProvider_observers];
  swift_beginAccess();
  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = (void *)objc_opt_self();
    v5 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_21CC0FAF0(v5, (uint64_t)v9);
      v6 = objc_msgSend(v4, sel_defaultCenter);
      __swift_project_boxed_opaque_existential_0(v9, v9[3]);
      objc_msgSend(v6, sel_removeObserver_, sub_21CC3FA98());

      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      v5 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for AAUIAwardsDataProvider();
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21CC31D7C()
{
  return sub_21CC31E24((uint64_t)sub_21CC31D90, (uint64_t)&block_descriptor_32);
}

void sub_21CC31D90()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;

  swift_beginAccess();
  v1 = (_QWORD *)MEMORY[0x22078973C](v0 + 16);
  if (v1)
  {
    v2 = v1;
    v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v4 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x238))();
    if (v4)
    {
      v5 = v4;
      (*(void (**)(void))((*v3 & *v4) + 0x68))();

    }
  }
}

uint64_t sub_21CC31E24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v5 = v2;
  v6 = sub_21CC3F738();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v18 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21CC3F750();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[1] = *(_QWORD *)(v5 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = a1;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21CC0CF48;
  aBlock[3] = a2;
  v15 = _Block_copy(aBlock);
  swift_retain();
  sub_21CC3F744();
  v19 = MEMORY[0x24BEE4AF8];
  sub_21CC10710(&qword_25531C840, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C848);
  sub_21CC10750(&qword_25531C850, &qword_25531C848, MEMORY[0x24BEE12C8]);
  sub_21CC3F93C();
  MEMORY[0x220788A64](0, v13, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_21CC32030()
{
  return swift_deallocObject();
}

uint64_t sub_21CC32040(unint64_t a1)
{
  return sub_21CC10328(a1, "[AAUIAwardsDataProvider] Received %ld deleted achievements", (uint64_t)&unk_24E0B3D60, (uint64_t)sub_21CC35F84, (uint64_t)&block_descriptor_57);
}

uint64_t sub_21CC32064(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t result;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;

  v3 = sub_21CC3F75C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (uint64_t *)((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(void **)((char *)v1 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *v6 = v7;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5610], v3);
  v8 = v7;
  LOBYTE(v7) = sub_21CC3F768();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) != 0)
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v11 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x310))(a1);
    v13 = v12;
    sub_21CC140F4();
    v14 = sub_21CC10790();
    v15 = (*(uint64_t (**)(void))((*v10 & *v1) + 0x2F8))();
    (*(void (**)(void))((*v10 & *v1) + 0x2C0))();
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))((*v10 & *v1) + 0x318))(MEMORY[0x24BEE4AF8], a1, v11, v13, v14 & 1, v15 & 1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21CC321C8(id *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;

  v4 = sub_21CC3F648();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21CC3F5E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = *a1;
  if (objc_msgSend(v29, sel_unearned))
  {
    v27 = v4;
    v28 = a2;
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01830]), sel_init);
    v13 = objc_msgSend(v29, sel_template);
    v14 = objc_msgSend(v13, sel_canonicalUnit);

    if (!v14)
    {
LABEL_5:
      v18 = (id)ACHDateComponentsForYearMonthDay();
      sub_21CC3F5DC();

      v19 = (void *)sub_21CC3F5D0();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      objc_msgSend(v12, sel_setEarnedDateComponents_, v19);

      sub_21CC3F63C();
      v20 = (void *)sub_21CC3F618();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v27);
      objc_msgSend(v12, sel_setCreatedDate_, v20);

      objc_msgSend(v12, sel_setCreatorDevice_, 2);
      v21 = objc_msgSend(v29, sel_template);
      v22 = objc_msgSend(v21, sel_uniqueName);

      objc_msgSend(v12, sel_setTemplateUniqueName_, v22);
      v23 = objc_msgSend(v29, sel_shallowCopyWithRelevantEarnedInstance_, v12);

      *v28 = v23;
      return;
    }
    v15 = objc_msgSend(v29, sel_template);
    v16 = objc_msgSend(v15, sel_canonicalUnit);

    if (v16)
    {
      v17 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v16, 20.0);

      objc_msgSend(v12, sel_setValue_, v17);
      goto LABEL_5;
    }
    __break(1u);
  }
  else
  {
    v24 = v29;
    *a2 = v29;
    v25 = v24;
  }
}

char sub_21CC324C0(id *a1, uint64_t a2, uint64_t a3, _QWORD *a4, int a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  void *v24;
  _QWORD *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD *v31;
  unsigned int v32;
  unint64_t *v33;
  uint64_t (*v34)(void);
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  id v44;
  id v45;
  unint64_t v46;
  char v47;
  char v48;
  _QWORD *v49;
  id v50;
  id v51;
  unint64_t v52;
  char v53;
  char v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t *, _QWORD);
  uint64_t *v79;
  uint64_t *v80;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v82;
  uint8_t *v84;
  NSObject *v85;
  uint64_t v86;
  unsigned int v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93[4];
  unint64_t v94;

  v90 = a7;
  LODWORD(v91) = a5;
  v12 = sub_21CC3F72C();
  v89 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v88 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a1;
  v15 = objc_msgSend(*a1, sel_section);
  v16 = sub_21CC3F7B0();
  v18 = v17;

  v19._countAndFlagsBits = v16;
  v19._object = v18;
  LOBYTE(v20) = AAUIAwardsDataProviderSection.init(rawValue:)(v19);
  v21 = LOBYTE(v93[0]);
  if (LOBYTE(v93[0]) != 7)
  {
    v22 = v12;
    v23 = a6;
    v24 = *(void **)((char *)a4 + OBJC_IVAR___AAUIAwardsDataProvider_visibilityEvaluator);
    v25 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v26 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *a4) + 0x268))(v20) & 1;
    v27 = a2;
    v28 = v14;
    sub_21CC197F8(v27, a3, v24, v26, v91 & 1);
    v30 = v29;
    if ((v29 & 1) != 0)
    {
      v31 = v25;
      if (((*(uint64_t (**)(void))((*v25 & *a4) + 0x280))() & 1) != 0)
        v32 = objc_msgSend(v28, sel_isRingsBased);
      else
        v32 = 0;
      v33 = v23;
      LODWORD(v91) = v32 ^ 1;
    }
    else
    {
      LODWORD(v91) = 0;
      v31 = v25;
      v33 = v23;
    }
    v34 = *(uint64_t (**)(void))((*v31 & *a4) + 0x160);
    v35 = v34();
    v36 = v21;
    if (*(_QWORD *)(v35 + 16))
    {
      v37 = sub_21CC2EED8(v21);
      v38 = v28;
      if ((v39 & 1) != 0)
      {
        v40 = *(_QWORD *)(*(_QWORD *)(v35 + 56) + 8 * v37);
        swift_bridgeObjectRetain();
      }
      else
      {
        v40 = MEMORY[0x24BEE4AF8];
      }
    }
    else
    {
      v40 = MEMORY[0x24BEE4AF8];
      v38 = v28;
    }
    v41 = swift_bridgeObjectRelease();
    v94 = v40;
    v42 = *(_QWORD *)(((uint64_t (*)(uint64_t))v34)(v41) + 16);
    v87 = v36;
    if (v42 && (sub_21CC2EED8(v36), (v43 & 1) != 0))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v44 = objc_msgSend(v38, sel_template);
      v45 = objc_msgSend(v44, sel_uniqueName);

      if (!v45)
      {
LABEL_52:
        __break(1u);
        goto LABEL_53;
      }
      sub_21CC3F7B0();

      sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
      v46 = sub_21CC19778();
      v48 = v47;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v38 = v28;
      if ((v48 & 1) == 0)

    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v49 = a4;
    swift_bridgeObjectRetain();
    v50 = objc_msgSend(v38, sel_template);
    v51 = objc_msgSend(v50, sel_uniqueName);

    if (!v51)
    {
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    sub_21CC3F7B0();

    sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
    v52 = sub_21CC19778();
    v54 = v53;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
    {
      v86 = v22;
      v30 = v38;
      MEMORY[0x2207889BC]();
      if (*(_QWORD *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_21CC3F870();
      sub_21CC3F888();
      sub_21CC3F864();
      v55 = a4;
      if ((_DWORD)v91)
      {
        v56 = v87;
        if ((v54 & 1) != 0)
        {
          v76 = v30;
          MEMORY[0x2207889BC]();
          if (*(_QWORD *)((*v33 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((*v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          {
LABEL_38:
            sub_21CC3F888();
            sub_21CC3F864();
            sub_21CC34010((char *)v93, 0);
            goto LABEL_42;
          }
        }
        else
        {
          v57 = *v33;
          v58 = v30;
          isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
          *v33 = v57;
          if (!isUniquelyReferenced_nonNull_bridgeObject
            || (v57 & 0x8000000000000000) != 0
            || (v57 & 0x4000000000000000) != 0)
          {
            sub_21CC1A2B4(v57);
          }
          if ((v52 & 0x8000000000000000) == 0)
          {
            if (v52 < *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              v60 = *(void **)((v57 & 0xFFFFFFFFFFFFFF8) + 8 * v52 + 0x20);
              *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 8 * v52 + 0x20) = v58;

              sub_21CC3F864();
              goto LABEL_42;
            }
            __break(1u);
            goto LABEL_51;
          }
          __break(1u);
        }
        sub_21CC3F870();
        goto LABEL_38;
      }
      v91 = v52;
      v62 = sub_21CC106F4();
      v64 = v88;
      v63 = v89;
      v65 = v86;
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v88, v62, v86);
      v30 = v30;
      v66 = sub_21CC3F714();
      v67 = sub_21CC3F8B8();
      v85 = v66;
      if (os_log_type_enabled(v66, v67))
      {
        v68 = (uint8_t *)swift_slowAlloc();
        v69 = swift_slowAlloc();
        v93[0] = v69;
        *(_DWORD *)v68 = 136315138;
        v70 = objc_msgSend(v30, sel_template);
        v71 = objc_msgSend(v70, sel_uniqueName);

        if (!v71)
        {
LABEL_53:

          __break(1u);
          JUMPOUT(0x21CC32C70);
        }
        v84 = v68 + 4;
        v72 = sub_21CC3F7B0();
        v74 = v73;

        v92 = sub_21CC0FA20(v72, v74, v93);
        sub_21CC3F900();

        swift_bridgeObjectRelease();
        v75 = v85;
        _os_log_impl(&dword_21CC08000, v85, v67, "[%s] we're currently paused, not showing in go for it", v68, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2207896E8](v69, -1, -1);
        MEMORY[0x2207896E8](v68, -1, -1);

        (*(void (**)(char *, uint64_t))(v89 + 8))(v88, v86);
        v55 = v49;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v65);
      }
      v56 = v87;
      v61 = v91;
      if ((v54 & 1) != 0)
      {
LABEL_42:
        v77 = v94;
        if (v94 >> 62)
        {
          swift_bridgeObjectRetain();
          v82 = sub_21CC3FA14();
          swift_bridgeObjectRelease();
          if (v82)
            goto LABEL_44;
        }
        else if (*(_QWORD *)((v94 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_44:
          sub_21CC34010((char *)v93, v56);
          v78 = (uint64_t (*)(uint64_t *, _QWORD))(*(uint64_t (**)(uint64_t *))((*MEMORY[0x24BEE4EA0] & *v55)
                                                                                                + 0x170))(v93);
          v80 = v79;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v92 = *v80;
          *v80 = 0x8000000000000000;
          sub_21CC33BCC(v77, v56, isUniquelyReferenced_nonNull_native);
          *v80 = v92;
          swift_bridgeObjectRelease();
          LOBYTE(v20) = v78(v93, 0);
          return v20;
        }
        LOBYTE(v20) = swift_bridgeObjectRelease();
        return v20;
      }
    }
    else
    {
      v55 = a4;
      v56 = v87;
      if ((v54 & 1) != 0)
        goto LABEL_42;
      v61 = v52;
    }

    goto LABEL_42;
  }
  return v20;
}

void (*sub_21CC32CE0(_QWORD *a1, uint64_t a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_21CC348B4(v4, a2);
  return sub_21CC32D2C;
}

void sub_21CC32D2C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_21CC32D5C(char **a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char **v12;
  char *v13;
  char *v14;
  id v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char **v19;
  char isUniquelyReferenced_nonNull_native;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  _QWORD *v34;
  void (*v35)(_QWORD *);
  _QWORD *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  _QWORD *v44;
  uint64_t v45;
  _QWORD v46[5];
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;

  v3 = sub_21CC3F75C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (_QWORD **)((char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(void **)((char *)v1 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *v6 = v7;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5610], v3);
  v8 = v7;
  LOBYTE(v7) = sub_21CC3F768();
  (*(void (**)(_QWORD *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) == 0)
    goto LABEL_33;
  v48 = MEMORY[0x24BEE4B08];
  v49 = MEMORY[0x24BEE4B08];
  v47 = (_QWORD *)MEMORY[0x24BEE4B00];
  if ((unint64_t)a1 >> 62)
  {
LABEL_34:
    swift_bridgeObjectRetain();
    v9 = sub_21CC3FA14();
    if (v9)
      goto LABEL_4;
LABEL_35:
    v38 = swift_bridgeObjectRelease();
    v39 = MEMORY[0x24BEE4B00];
LABEL_36:
    MEMORY[0x24BDAC7A8](v38);
    *(&v44 - 4) = v1;
    *(&v44 - 3) = &v49;
    *(&v44 - 2) = &v48;
    sub_21CC35BF8(v39, (void (*)(_BYTE *, uint64_t))sub_21CC35644);
    swift_bridgeObjectRelease();
    v40 = swift_bridgeObjectRetain();
    v41 = sub_21CC1A1E0(v40);
    swift_bridgeObjectRelease();
    v42 = swift_bridgeObjectRetain();
    sub_21CC1A1E0(v42);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    return v41;
  }
  v9 = *(_QWORD *)(((unint64_t)a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9)
    goto LABEL_35;
LABEL_4:
  if (v9 >= 1)
  {
    v44 = v1;
    v45 = v9;
    v10 = 0;
    v11 = (unint64_t)a1 & 0xC000000000000001;
    v12 = &selRef_URLForResource_withExtension_;
    while (1)
    {
      v13 = v11 ? (char *)MEMORY[0x220788B18](v10, a1) : a1[v10 + 4];
      v14 = v13;
      v15 = objc_msgSend(v13, v12[407], v44);
      sub_21CC3F7B0();

      v16 = sub_21CC3FA5C();
      swift_bridgeObjectRelease();
      if (v16 <= 6)
        break;
LABEL_8:

      if (v9 == ++v10)
      {
        v38 = swift_bridgeObjectRelease();
        v39 = (uint64_t)v47;
        v1 = v44;
        goto LABEL_36;
      }
    }
    v1 = v47;
    if (v47[2])
    {
      sub_21CC2EED8(v16);
      if ((v17 & 1) != 0)
      {
LABEL_27:
        v35 = sub_21CC32CE0(v46, v16);
        if (*v34)
        {
          v36 = v34;
          v37 = v14;
          MEMORY[0x2207889BC]();
          if (*(_QWORD *)((*v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_21CC3F870();
          sub_21CC3F888();
          sub_21CC3F864();
        }
        ((void (*)(_QWORD *, _QWORD))v35)(v46, 0);
        goto LABEL_8;
      }
    }
    v18 = v11;
    v19 = a1;
    a1 = v12;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v46[0] = v1;
    v22 = sub_21CC2EED8(v16);
    v23 = v1[2];
    v24 = (v21 & 1) == 0;
    v25 = v23 + v24;
    if (__OFADD__(v23, v24))
    {
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    v26 = v21;
    if (v1[3] < v25)
    {
      sub_21CC1A31C(v25, isUniquelyReferenced_nonNull_native);
      v1 = (_QWORD *)v46[0];
      v27 = sub_21CC2EED8(v16);
      if ((v26 & 1) != (v28 & 1))
        goto LABEL_38;
      v22 = v27;
      v29 = (_QWORD *)v46[0];
      if ((v26 & 1) == 0)
        goto LABEL_24;
LABEL_22:
      v30 = v29[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v30 + 8 * v22) = MEMORY[0x24BEE4AF8];
LABEL_26:
      v47 = v29;
      swift_bridgeObjectRelease();
      v12 = a1;
      a1 = v19;
      v11 = v18;
      v9 = v45;
      goto LABEL_27;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v29 = (_QWORD *)v46[0];
      if ((v21 & 1) != 0)
        goto LABEL_22;
    }
    else
    {
      v1 = v46;
      sub_21CC1A040();
      v29 = (_QWORD *)v46[0];
      if ((v26 & 1) != 0)
        goto LABEL_22;
    }
LABEL_24:
    v29[(v22 >> 6) + 8] |= 1 << v22;
    *(_BYTE *)(v29[6] + v22) = v16;
    *(_QWORD *)(v29[7] + 8 * v22) = MEMORY[0x24BEE4AF8];
    v31 = v29[2];
    v32 = __OFADD__(v31, 1);
    v33 = v31 + 1;
    if (v32)
      goto LABEL_32;
    v29[2] = v33;
    goto LABEL_26;
  }
  __break(1u);
LABEL_38:
  result = sub_21CC3FAC8();
  __break(1u);
  return result;
}

id AAUIAwardsDataProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AAUIAwardsDataProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

char *sub_21CC33220(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7B8);
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
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_21CC35278(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC33318(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21CC15E08(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

_QWORD *sub_21CC33334(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7C8);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_21CC12AF4((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_21CC3FA14();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

char *sub_21CC33428(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8B0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21CC33520(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_21CC3FA50();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_21CC335C8(uint64_t a1)
{
  return sub_21CC33428(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_21CC335F8(uint64_t a1, char a2)
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
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8A8);
  v36 = a2;
  v6 = sub_21CC3FA38();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
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
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21CC3FAE0();
    sub_21CC3F7D4();
    result = sub_21CC3FAEC();
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
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_21CC3390C(unint64_t result, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v3 = result;
  v4 = a2 + 64;
  v5 = (result + 1) & ~(-1 << *(_BYTE *)(a2 + 32));
  if (((1 << v5) & *(_QWORD *)(a2 + 64 + 8 * (v5 >> 6))) != 0)
  {
    result = sub_21CC3F948();
    if ((*(_QWORD *)(v4 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 48) + v5);
      sub_21CC3FAE0();
      __asm { BR              X8 }
    }
    v7 = (uint64_t *)(v4 + 8 * (v3 >> 6));
    v8 = *v7;
    v9 = (-1 << v3) - 1;
  }
  else
  {
    v7 = (uint64_t *)(v4 + 8 * (result >> 6));
    v9 = *v7;
    v8 = (-1 << result) - 1;
  }
  *v7 = v9 & v8;
  v10 = *(_QWORD *)(a2 + 16);
  v11 = __OFSUB__(v10, 1);
  v12 = v10 - 1;
  if (v11)
  {
    __break(1u);
    JUMPOUT(0x21CC33BB0);
  }
  *(_QWORD *)(a2 + 16) = v12;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

uint64_t sub_21CC33BCC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_21CC2EED8(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_21CC1A040();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a2;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v19 = v16[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_21CC1A31C(result, a3 & 1);
  result = sub_21CC2EED8(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21CC3FAC8();
  __break(1u);
  return result;
}

uint64_t sub_21CC33D00(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_21CC2EF40(a2, a3);
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
    sub_21CC33E5C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_21CC335F8(v15, a4 & 1);
  v21 = sub_21CC2EF40(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21CC3FAC8();
  __break(1u);
  return result;
}

void *sub_21CC33E5C()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8A8);
  v2 = *v0;
  v3 = sub_21CC3FA2C();
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
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_21CC34010(char *a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t *v10;
  uint64_t v12;

  v4 = *v2;
  v5 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain();
  sub_21CC309D8(v5, a2);
  v7 = v6 & ~(-1 << *(_BYTE *)(v4 + 32));
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
    __asm { BR              X9 }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *v10;
  *v10 = 0x8000000000000000;
  sub_21CC34380(a2, v7, isUniquelyReferenced_nonNull_native);
  *v10 = v12;
  swift_bridgeObjectRelease();
  result = 1;
  *a1 = a2;
  return result;
}

void sub_21CC34380(char a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  char v15;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_21CC0BAF4();
    }
    else
    {
      if (v7 > v6)
      {
        sub_21CC34708();
        goto LABEL_10;
      }
      sub_21CC1A6F4();
    }
    v8 = *v3;
    sub_21CC309D8(*(_QWORD *)(*v3 + 40), a1);
    a2 = v9 & ~(-1 << *(_BYTE *)(v8 + 32));
    if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
      __asm { BR              X9 }
  }
LABEL_10:
  v10 = *v14;
  *(_QWORD *)(*v14 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v10 + 48) + a2) = v15;
  v11 = *(_QWORD *)(v10 + 16);
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
  {
    __break(1u);
    JUMPOUT(0x21CC346B4);
  }
  *(_QWORD *)(v10 + 16) = v13;
}

uint64_t sub_21CC34708()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t result;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C8B8);
  v2 = *v0;
  v3 = sub_21CC3F954();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = (void *)(v3 + 56);
    v6 = v2 + 56;
    v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
    if (v4 != v2 || (unint64_t)v5 >= v2 + 56 + 8 * v7)
      memmove(v5, (const void *)(v2 + 56), 8 * v7);
    v9 = 0;
    *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
    v10 = 1 << *(_BYTE *)(v2 + 32);
    v11 = -1;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    v12 = v11 & *(_QWORD *)(v2 + 56);
    v13 = (unint64_t)(v10 + 63) >> 6;
    while (1)
    {
      if (v12)
      {
        v14 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v15 = v14 | (v9 << 6);
      }
      else
      {
        v16 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_30;
        }
        if (v16 >= v13)
          break;
        v17 = *(_QWORD *)(v6 + 8 * v16);
        ++v9;
        if (!v17)
        {
          v9 = v16 + 1;
          if (v16 + 1 >= v13)
            break;
          v17 = *(_QWORD *)(v6 + 8 * v9);
          if (!v17)
          {
            v9 = v16 + 2;
            if (v16 + 2 >= v13)
              break;
            v17 = *(_QWORD *)(v6 + 8 * v9);
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v13)
                break;
              v17 = *(_QWORD *)(v6 + 8 * v18);
              if (!v17)
              {
                while (1)
                {
                  v9 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    break;
                  if (v9 >= v13)
                    goto LABEL_28;
                  v17 = *(_QWORD *)(v6 + 8 * v9);
                  ++v18;
                  if (v17)
                    goto LABEL_27;
                }
LABEL_30:
                __break(1u);
                JUMPOUT(0x21CC34898);
              }
              v9 = v18;
            }
          }
        }
LABEL_27:
        v12 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v9 << 6);
      }
      *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    }
  }
LABEL_28:
  result = swift_release();
  *v1 = v4;
  return result;
}

void (*sub_21CC348B4(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  _QWORD *v4;
  char isUniquelyReferenced_nonNull_native;

  v4 = malloc(0x50uLL);
  *a1 = v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_21CC34B54(v4);
  v4[9] = sub_21CC3496C((uint64_t)(v4 + 4), a2, isUniquelyReferenced_nonNull_native);
  return sub_21CC34930;
}

void sub_21CC34930(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 72))(*(_QWORD *)a1 + 32, 0);
  v2(v1, 0);
  free(v1);
}

unint64_t (*sub_21CC3496C(uint64_t a1, uint64_t a2, char a3))(unint64_t result, char a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t (*result)(unint64_t, char);

  v4 = v3;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 24) = a2;
  v8 = *v3;
  v10 = sub_21CC2EED8(a2);
  *(_BYTE *)(a1 + 25) = v9 & 1;
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = *(_QWORD *)(v8 + 24);
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      *(_QWORD *)(a1 + 16) = v10;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v16 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v10);
LABEL_12:
        *(_QWORD *)a1 = v16;
        return sub_21CC34A7C;
      }
LABEL_11:
      v16 = 0;
      goto LABEL_12;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_21CC1A040();
      goto LABEL_7;
    }
    sub_21CC1A31C(v13, a3 & 1);
    v17 = sub_21CC2EED8(a2);
    if ((v14 & 1) == (v18 & 1))
    {
      v10 = v17;
      *(_QWORD *)(a1 + 16) = v17;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (unint64_t (*)(unint64_t, char))sub_21CC3FAC8();
  __break(1u);
  return result;
}

unint64_t sub_21CC34A7C(unint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  char v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  uint64_t v10;

  v2 = *(_QWORD *)result;
  LOBYTE(v3) = *(_BYTE *)(result + 25);
  if ((a2 & 1) != 0)
  {
    if (!v2)
      goto LABEL_10;
    v4 = *(_QWORD *)(result + 16);
    v5 = **(_QWORD ***)(result + 8);
    if ((*(_BYTE *)(result + 25) & 1) != 0)
    {
LABEL_9:
      *(_QWORD *)(v5[7] + 8 * v4) = v2;
      return result;
    }
    v6 = *(_BYTE *)(result + 24);
    v5[(v4 >> 6) + 8] |= 1 << v4;
    *(_BYTE *)(v5[6] + v4) = v6;
    v3 = v5[7];
    *(_QWORD *)(v3 + 8 * v4) = v2;
    v7 = v5[2];
    v8 = __OFADD__(v7, 1);
    v2 = v7 + 1;
    if (!v8)
      goto LABEL_14;
    __break(1u);
  }
  if (!v2)
  {
LABEL_10:
    if ((v3 & 1) != 0)
      return sub_21CC3390C(*(_QWORD *)(result + 16), **(_QWORD **)(result + 8));
    return result;
  }
  v4 = *(_QWORD *)(result + 16);
  v5 = **(_QWORD ***)(result + 8);
  if ((v3 & 1) != 0)
    goto LABEL_9;
  v9 = *(_BYTE *)(result + 24);
  v5[(v4 >> 6) + 8] |= 1 << v4;
  *(_BYTE *)(v5[6] + v4) = v9;
  *(_QWORD *)(v5[7] + 8 * v4) = v2;
  v10 = v5[2];
  v8 = __OFADD__(v10, 1);
  v2 = v10 + 1;
  if (!v8)
  {
LABEL_14:
    v5[2] = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_21CC34B54(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_21CC34B74;
}

uint64_t sub_21CC34B74(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_21CC34B80@<X0>(char a1@<W0>, _BYTE *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;

  v4 = *v2;
  v5 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain();
  sub_21CC309D8(v5, a1);
  v7 = v6 & ~(-1 << *(_BYTE *)(v4 + 32));
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
    __asm { BR              X9 }
  result = swift_bridgeObjectRelease();
  *a2 = 7;
  return result;
}

unint64_t sub_21CC34ED4(unint64_t result)
{
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = (result + 1) & ~(-1 << *(_BYTE *)(*v1 + 32));
  if (((1 << v5) & *(_QWORD *)(v4 + 8 * (v5 >> 6))) != 0)
  {
    swift_retain();
    sub_21CC3F948();
    if ((*(_QWORD *)(v4 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(v3 + 48) + v5);
      sub_21CC3FAE0();
      __asm { BR              X8 }
    }
    *(_QWORD *)(v4 + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFSUB__(v7, 1);
  v9 = v7 - 1;
  if (v8)
  {
    __break(1u);
    JUMPOUT(0x21CC35168);
  }
  *(_QWORD *)(v3 + 16) = v9;
  ++*(_DWORD *)(v3 + 36);
  return result;
}

void (*sub_21CC35184(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_21CC35204(v6, a2, a3);
  return sub_21CC351D8;
}

void sub_21CC351D8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21CC35204(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x220788B18](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_21CC35270;
  }
  __break(1u);
  return result;
}

void sub_21CC35270(id *a1)
{

}

char *sub_21CC35278(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_21CC3FA50();
  __break(1u);
  return result;
}

uint64_t sub_21CC3535C(id *a1, id *__src, unint64_t a3, char *a4, void *a5)
{
  id *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void **v14;
  void **v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  uint64_t v20;
  id *v21;
  char *v22;
  id *v23;
  id *v24;
  id *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t result;
  char *v33;
  void **v34;
  id *v35;

  v6 = __src;
  v7 = (char *)__src - (char *)a1;
  v8 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0)
    v8 = (char *)__src - (char *)a1;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)__src;
  v11 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v11 = a3 - (_QWORD)__src;
  v12 = v11 >> 3;
  v35 = a1;
  v34 = (void **)a4;
  if (v9 >= v11 >> 3)
  {
    if (v10 >= -7)
    {
      if (a4 != (char *)__src || &__src[v12] <= (id *)a4)
        memmove(a4, __src, 8 * v12);
      v22 = &a4[8 * v12];
      v33 = v22;
      v35 = v6;
      if (a1 < v6 && v10 >= 8)
      {
        v23 = (id *)(a3 - 8);
        v24 = v6;
        do
        {
          v25 = v23 + 1;
          v26 = *--v24;
          v27 = *((id *)v22 - 1);
          v28 = v26;
          v29 = sub_21CC39FFC(v27, v28);

          if (v29 == -1)
          {
            if (v25 != v6 || v23 >= v6)
              *v23 = *v24;
            v35 = v24;
          }
          else
          {
            v33 = v22 - 8;
            if (v25 < (id *)v22 || v23 >= (id *)v22 || v25 != (id *)v22)
              *v23 = (id)*((_QWORD *)v22 - 1);
            v24 = v6;
            v22 -= 8;
          }
          if (v24 <= a1)
            break;
          --v23;
          v6 = v24;
        }
        while (v22 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v7 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v9] <= (id *)a4)
      memmove(a4, a1, 8 * v9);
    v13 = (void **)&a4[8 * v9];
    v33 = (char *)v13;
    if ((unint64_t)v6 < a3 && v7 >= 8)
    {
      v14 = (void **)a4;
      v15 = a1;
      do
      {
        v16 = *v14;
        v17 = *v6;
        v18 = v16;
        v19 = v6;
        v20 = sub_21CC39FFC(v17, v18);

        if (v20 == -1)
        {
          v21 = v19 + 1;
          if (v15 < v19 || v15 >= v21 || v15 != v19)
            *v15 = *v19;
        }
        else
        {
          if (v15 != v14)
            *v15 = *v14;
          v34 = ++v14;
          v21 = v19;
        }
        ++v15;
        if (v14 >= v13)
          break;
        v6 = v21;
      }
      while ((unint64_t)v21 < a3);
      v35 = v15;
    }
LABEL_43:
    sub_21CC33520((void **)&v35, (const void **)&v34, &v33);
    return 1;
  }

  result = sub_21CC3FA50();
  __break(1u);
  return result;
}

void sub_21CC35644(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  unint64_t v14;
  char v15;
  char v16;
  void (*v17)(char *, _QWORD);
  void (*v18)(_QWORD *);
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  id v39;
  id v40;
  unint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  void (*v45)(char *, _QWORD);
  uint64_t *v46;
  uint64_t *v47;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v49;
  unint64_t v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t (*v54)(void);
  _QWORD v55[4];
  uint64_t v56;
  char v57[32];

  v3 = a2;
  v4 = *(_QWORD **)(v2 + 16);
  v49 = *(_QWORD *)(v2 + 32);
  v5 = *a1;
  if (a2 >> 62)
  {
LABEL_38:
    swift_bridgeObjectRetain();
    v6 = sub_21CC3FA14();
    if (v6)
      goto LABEL_3;
LABEL_39:
    swift_bridgeObjectRelease();
    return;
  }
  v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_39;
LABEL_3:
  v7 = 4;
  v53 = v3 & 0xC000000000000001;
  v54 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v4) + 0x160);
  v50 = v3;
  v51 = v5;
  v52 = v6;
  while (1)
  {
    if (v53)
      v8 = (id)MEMORY[0x220788B18](v7 - 4, v3);
    else
      v8 = *(id *)(v3 + 8 * v7);
    v9 = v8;
    v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (!*(_QWORD *)(v54() + 16) || (sub_21CC2EED8(v5), (v11 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v9, sel_template);
    v13 = objc_msgSend(v12, sel_uniqueName);

    if (!v13)
      break;
    sub_21CC3F7B0();

    sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
    v14 = sub_21CC19778();
    v16 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      v17 = (void (*)(char *, _QWORD))(*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & *v4)
                                                                                   + 0x170))(v57);
      v18 = sub_21CC32CE0(v55, v5);
      if (!*v19)
      {
        ((void (*)(_QWORD *, _QWORD))v18)(v55, 0);
        v17(v57, 0);
        goto LABEL_22;
      }
      v20 = (void *)sub_21CC1AA64(v14);
      ((void (*)(_QWORD *, _QWORD))v18)(v55, 0);
      v17(v57, 0);

      v21 = sub_21CC34010(v57, v5);
      v22 = ((uint64_t (*)(uint64_t))v54)(v21);
      if (!*(_QWORD *)(v22 + 16) || (v23 = sub_21CC2EED8(v5), (v24 & 1) == 0))
      {
        swift_bridgeObjectRelease();
LABEL_31:
        sub_21CC34010(v57, v5);
        sub_21CC34B80(v5, v57);
        goto LABEL_22;
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v25 >> 62)
      {
        swift_bridgeObjectRetain();
        v26 = sub_21CC3FA14();
        swift_bridgeObjectRelease();
      }
      else
      {
        v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (!v26)
        goto LABEL_31;
    }
LABEL_22:
    v27 = objc_msgSend(v9, sel_relevantEarnedInstance, v49);
    if (v27
      && (v28 = v27,
          v29 = objc_msgSend(v27, sel_externalIdentifier),
          v28,
          v29))
    {
      v30 = sub_21CC3F7B0();
      v32 = v31;

      v33 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v4) + 0x190);
      v34 = swift_bridgeObjectRetain();
      v35 = v33(v34);
      if (*(_QWORD *)(v35 + 16) && (v36 = sub_21CC2EF40(v30, v32), (v37 & 1) != 0))
      {
        v38 = *(_QWORD *)(*(_QWORD *)(v35 + 56) + 8 * v36);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v55[0] = v38;
        swift_bridgeObjectRetain();
        v39 = objc_msgSend(v9, sel_template);
        v40 = objc_msgSend(v39, sel_uniqueName);

        if (!v40)
          goto LABEL_41;
        sub_21CC3F7B0();

        sub_21CC19740(0, (unint64_t *)&qword_25531C7D0);
        v41 = sub_21CC19778();
        v43 = v42;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v43 & 1) != 0)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {

          v44 = v55[0];
          v45 = (void (*)(char *, _QWORD))(*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & *v4)
                                                                                       + 0x1A0))(v57);
          v47 = v46;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v56 = *v47;
          *v47 = 0x8000000000000000;
          sub_21CC33D00(v44, v30, v32, isUniquelyReferenced_nonNull_native);
          *v47 = v56;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v45(v57, 0);

        }
        v3 = v50;
        v5 = v51;
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v5 = v51;
      }
    }
    else
    {

    }
    ++v7;
    if (v10 == v52)
      goto LABEL_39;
  }
  __break(1u);
LABEL_41:
  __break(1u);
}

uint64_t sub_21CC35BF8(uint64_t a1, void (*a2)(_BYTE *, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  _BYTE v17[8];
  uint64_t v18;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      return swift_release();
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v8)
        return swift_release();
      v15 = *(_QWORD *)(v4 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v8)
          return swift_release();
        v15 = *(_QWORD *)(v4 + 8 * v10);
        if (!v15)
        {
          v10 = v14 + 3;
          if (v14 + 3 >= v8)
            return swift_release();
          v15 = *(_QWORD *)(v4 + 8 * v10);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_5:
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12);
    v17[0] = *(_BYTE *)(*(_QWORD *)(a1 + 48) + v12);
    v18 = v13;
    swift_bridgeObjectRetain();
    a2(v17, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
    return swift_release();
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v15 = *(_QWORD *)(v4 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_21CC35D88()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21CC35DCC()
{
  return sub_21CC10750(&qword_25531C858, &qword_25531C860, MEMORY[0x24BEE12E0]);
}

uint64_t getEnumTagSinglePayload for AAUIAwardsDataProviderSection(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AAUIAwardsDataProviderSection(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_21CC35ED4 + 4 * byte_21CC42092[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_21CC35F08 + 4 * byte_21CC4208D[v4]))();
}

uint64_t sub_21CC35F08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC35F10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC35F18);
  return result;
}

uint64_t sub_21CC35F24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC35F2CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_21CC35F30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC35F38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21CC35F48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t sub_21CC35F50()
{
  return type metadata accessor for AAUIAwardsDataProvider();
}

uint64_t method lookup function for AAUIAwardsDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AAUIAwardsDataProvider.__allocating_init(healthStore:pauseRingsCoordinator:layoutMode:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 648))();
}

void type metadata accessor for ACHAchievementDisplayOverrideState(uint64_t a1)
{
  sub_21CC21F24(a1, &qword_25531C890);
}

void sub_21CC35F84()
{
  sub_21CC0F120((void (*)(uint64_t))sub_21CC32064);
}

uint64_t objectdestroy_53Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21CC35FC4()
{
  swift_deletedMethodError();
  __break(1u);
}

id sub_21CC36030()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC22ActivityAchievementsUI15AAUIAwardsQuery_query);
}

id AAUIAwardsQuery.init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)()
{
  void *v0;
  char *v1;
  id v2;
  objc_super v4;

  objc_allocWithZone((Class)sub_21CC3F6D8());
  v1 = v0;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(_QWORD *)&v1[OBJC_IVAR____TtC22ActivityAchievementsUI15AAUIAwardsQuery_query] = sub_21CC3F6B4();

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for AAUIAwardsQuery();
  v2 = objc_msgSendSuper2(&v4, sel_init);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

id AAUIAwardsQuery.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AAUIAwardsQuery.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AAUIAwardsQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AAUIAwardsQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AAUIAwardsQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AAUIAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AAUIAwardsQuery.activate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AAUIAwardsQuery.deactivate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t sub_21CC362A0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

id sub_21CC362D4()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query);
}

id AAUIActivityAwardsDateQuery.__allocating_init(dateComponents:initialAwardsHandler:updateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  char *v11;
  id v12;
  _QWORD v14[2];
  objc_super v15;

  v14[1] = a4;
  v6 = sub_21CC3F5E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_allocWithZone(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  objc_allocWithZone((Class)sub_21CC3F708());
  v11 = (char *)v10;
  swift_retain();
  swift_retain();
  *(_QWORD *)&v11[OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query] = sub_21CC3F6F0();

  v15.receiver = v11;
  v15.super_class = v4;
  v12 = objc_msgSendSuper2(&v15, sel_init);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v12;
}

id AAUIActivityAwardsDateQuery.init(dateComponents:initialAwardsHandler:updateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  id v11;
  _QWORD v13[2];
  objc_super v14;

  v13[1] = a4;
  v6 = sub_21CC3F5E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  objc_allocWithZone((Class)sub_21CC3F708());
  v9 = v4;
  swift_retain();
  swift_retain();
  *(_QWORD *)&v9[OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query] = sub_21CC3F6F0();

  v10 = (objc_class *)type metadata accessor for AAUIActivityAwardsDateQuery();
  v14.receiver = v9;
  v14.super_class = v10;
  v11 = objc_msgSendSuper2(&v14, sel_init);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v11;
}

uint64_t type metadata accessor for AAUIActivityAwardsDateQuery()
{
  return objc_opt_self();
}

uint64_t sub_21CC36728()
{
  return sub_21CC3F6FC();
}

uint64_t sub_21CC367D4()
{
  return sub_21CC3F6E4();
}

id AAUIActivityAwardsDateQuery.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AAUIActivityAwardsDateQuery.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AAUIActivityAwardsDateQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AAUIActivityAwardsDateQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AAUIActivityAwardsDateQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AAUIActivityAwardsDateQuery.__allocating_init(dateComponents:initialAwardsHandler:updateHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AAUIActivityAwardsDateQuery.activate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AAUIActivityAwardsDateQuery.deactivate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t sub_21CC3694C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

BOOL sub_21CC36974()
{
  void *v0;
  id v1;
  unsigned int v2;
  id v3;
  unsigned int v4;

  v1 = objc_msgSend(v0, sel_template);
  v2 = objc_msgSend(v1, sel_earnLimit);

  if (!v2)
    return 0;
  v3 = objc_msgSend(v0, sel_template);
  v4 = objc_msgSend(v3, sel_earnLimit);

  return (unint64_t)objc_msgSend(v0, sel_earnedInstanceCount) >= v4;
}

BOOL sub_21CC36A18(unint64_t a1)
{
  void *v1;
  id v3;
  _BOOL8 v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  int v10;
  int v11;
  id v12;
  unsigned int v13;
  id v14;
  unsigned int v15;
  _BOOL4 v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v3 = objc_msgSend(v1, sel_progress);
  v4 = (_BOOL8)v3;
  if (v3)
  {
    objc_msgSend(v3, sel__value);
    v6 = v5;

    v7 = objc_msgSend(v1, sel_goal);
    v4 = (_BOOL8)v7;
    if (v7)
    {
      objc_msgSend(v7, sel__value);
      v9 = v8;

      if (v9 <= 0.0)
        return 0;
      sub_21CC36C38(a1);
      v11 = v10;
      v12 = objc_msgSend(v1, sel_template);
      v13 = objc_msgSend(v12, sel_earnLimit);

      if (v13)
      {
        v14 = objc_msgSend(v1, sel_template);
        v15 = objc_msgSend(v14, sel_earnLimit);

        v16 = (unint64_t)objc_msgSend(v1, sel_earnedInstanceCount) >= v15;
      }
      else
      {
        v16 = 0;
      }
      v4 = v6 / v9 >= 0.75;
      v17 = objc_msgSend(v1, sel_template, v6 / v9);
      v18 = objc_msgSend(v17, sel_uniqueName);

      if (!v18)
      {
        if (((v11 | v16) & 1) == 0)
          return v4;
        return 0;
      }
      v19 = sub_21CC3F7B0();
      v21 = v20;

      if (v19 == 0xD000000000000019 && v21 == 0x800000021CC43460)
      {
        swift_bridgeObjectRelease();
        return ((v11 | v16) & 1) == 0;
      }
      v22 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
      if (((v11 | v16) & 1) != 0)
        return 0;
      if ((v22 & 1) != 0)
        return 1;
    }
  }
  return v4;
}

void sub_21CC36C38(unint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  char *v45;
  unsigned int (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  char *v58;
  char *v59;
  void (*v60)(char *, uint64_t);
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  void (*v71)(char *, uint64_t);
  char *v72;
  uint64_t v73;
  char *v74;
  unint64_t v75;
  char *v76;
  char v77;
  void (*v78)(char *, char *, uint64_t);
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  char v83;
  uint64_t v84;
  char *v85;
  char *v86;
  void (*v87)(char *, char *, uint64_t);
  uint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  unint64_t v101;
  char *v102;

  v2 = v1;
  v101 = a1;
  v3 = sub_21CC3F69C();
  v94 = *(_QWORD *)(v3 - 8);
  v95 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531C938);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v96 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v97 = (char *)&v87 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v87 - v11;
  v13 = sub_21CC3F648();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v91 = (char *)&v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v92 = (char *)&v87 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v89 = (char *)&v87 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v90 = (char *)&v87 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v93 = (char *)&v87 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v98 = (char *)&v87 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v99 = (char *)&v87 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v100 = (char *)&v87 - v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531C940);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v87 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_21CC3F5E8();
  v34 = *(_QWORD *)(v33 - 8);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v87 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35);
  v102 = (char *)&v87 - v38;
  v39 = objc_msgSend(v2, sel_relevantEarnedInstance);
  if (v39)
  {
    v40 = v39;
    v88 = v13;
    v41 = objc_msgSend(v39, sel_earnedDateComponents);
    if (v41)
    {
      v42 = v41;
      sub_21CC3F5DC();

      v43 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
      v43(v32, v37, v33);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v32, 0, 1, v33);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33) != 1)
      {
        v44 = v102;
        v43(v102, v32, v33);
        v45 = v44;
        sub_21CC3F678();
        v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
        v47 = v88;
        if (v46(v12, 1, v88) == 1)
        {
          (*(void (**)(char *, uint64_t))(v34 + 8))(v45, v33);

          v48 = &qword_25531C938;
          v49 = (uint64_t)v12;
LABEL_8:
          sub_21CC39E50(v49, v48);
          return;
        }
        v87 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
        v87(v100, v12, v47);
        v50 = objc_msgSend(v2, sel_template);
        v51 = objc_msgSend(v50, sel_uniqueName);

        if (!v51)
        {
          __break(1u);
          return;
        }
        v52 = sub_21CC3F7B0();
        v54 = v53;

        LOBYTE(v52) = sub_21CC374D4(v52, v54, qword_24E0B3FA8);
        swift_bridgeObjectRelease();
        swift_arrayDestroy();
        if ((v52 & 1) != 0)
        {

          (*(void (**)(char *, uint64_t))(v14 + 8))(v100, v88);
LABEL_19:
          (*(void (**)(char *, uint64_t))(v34 + 8))(v102, v33);
          return;
        }
        sub_21CC3F63C();
        v55 = objc_msgSend(v2, sel_template);
        v56 = objc_msgSend(v55, sel_duplicateRemovalCalendarUnit);

        v57 = v88;
        if (v56 != (id)0x2000)
        {
          if (v56 == (id)16)
          {
            v59 = v99;
            v58 = v100;
            sub_21CC3F690();

            v60 = *(void (**)(char *, uint64_t))(v14 + 8);
            v60(v59, v57);
            v60(v58, v57);
            (*(void (**)(char *, uint64_t))(v34 + 8))(v102, v33);
            return;
          }

          v71 = *(void (**)(char *, uint64_t))(v14 + 8);
          v71(v99, v57);
          v71(v100, v57);
          goto LABEL_19;
        }
        v61 = (void *)sub_21CC3F618();
        v62 = (void *)sub_21CC3F660();
        v63 = (id)ACHStartOfFitnessWeekBeforeDateInCalendar();

        sub_21CC3F624();
        v64 = v94;
        v65 = v95;
        (*(void (**)(char *, _QWORD, uint64_t))(v94 + 104))(v5, *MEMORY[0x24BDCF220], v95);
        v66 = (uint64_t)v96;
        sub_21CC3F684();
        v67 = v65;
        v68 = v88;
        (*(void (**)(char *, uint64_t))(v64 + 8))(v5, v67);
        if (v46((char *)v66, 1, v68) == 1)
        {
          sub_21CC39E50(v66, &qword_25531C938);
          v69 = (uint64_t)v97;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v97, 1, 1, v68);

          v70 = *(void (**)(char *, uint64_t))(v14 + 8);
LABEL_22:
          v74 = v100;
          v70(v98, v68);
          v70(v99, v68);
          v70(v74, v68);
          (*(void (**)(char *, uint64_t))(v34 + 8))(v102, v33);
          sub_21CC39E50(v69, &qword_25531C938);
          return;
        }
        v72 = v97;
        sub_21CC3F60C();
        v69 = (uint64_t)v72;
        v73 = v66;
        v70 = *(void (**)(char *, uint64_t))(v14 + 8);
        v70((char *)v73, v68);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v72, 0, 1, v68);
        if (v46(v72, 1, v68) == 1)
        {

          goto LABEL_22;
        }
        v87(v93, v72, v68);
        v75 = sub_21CC39E8C();
        v76 = v100;
        v101 = v75;
        v77 = sub_21CC3F78C();
        v78 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
        v79 = v90;
        v78(v90, v76, v68);
        v80 = v89;
        v78(v89, v98, v68);
        if ((v77 & 1) != 0)
        {
          v70(v80, v68);
          v70(v79, v68);
          v81 = v76;
          v78(v92, v76, v68);
          v82 = v91;
          v78(v91, v93, v68);
        }
        else
        {
          v83 = sub_21CC3F78C();
          v70(v80, v68);
          v70(v79, v68);
          v81 = v76;
          v78(v92, v76, v68);
          v82 = v91;
          v78(v91, v93, v68);
          if ((v83 & 1) == 0)
          {
            v84 = v88;
            sub_21CC3F78C();

            goto LABEL_28;
          }
        }

        v84 = v88;
LABEL_28:
        v85 = v102;
        v86 = v98;
        v70(v82, v84);
        v70(v92, v84);
        v70(v93, v84);
        v70(v86, v84);
        v70(v99, v84);
        v70(v81, v84);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v85, v33);
        return;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v32, 1, 1, v33);
    }

    v48 = &qword_25531C940;
    v49 = (uint64_t)v32;
    goto LABEL_8;
  }
}

uint64_t sub_21CC374D4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_21CC3FAA4();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_21CC3FAA4() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_21CC37598()
{
  void *v0;
  id v1;
  char v2;
  char v3;
  os_log_type_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v1 = v0;
  sub_21CC39ED4((uint64_t)&unk_24E0B3FD8, (uint64_t)v1);
  v3 = v2;

  if ((v3 & 1) != 0)
  {
    v4 = sub_21CC3F8AC();
    v5 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v4))
    {
      v6 = v1;
      v7 = v5;
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v15 = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = objc_msgSend(v6, sel_template);
      v11 = objc_msgSend(v10, sel_uniqueName);

      if (v11)
      {
        v12 = sub_21CC3F7B0();
        v14 = v13;

        sub_21CC0FA20(v12, v14, &v15);
        sub_21CC3F900();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21CC08000, v7, v4, "[AAUIAwardsDataProvider] Could not find unearned priority for template: %s", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2207896E8](v9, -1, -1);
        MEMORY[0x2207896E8](v8, -1, -1);

      }
      else
      {

        __break(1u);
      }
    }
  }
}

void sub_21CC3776C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC38BF0(a1, MEMORY[0x24BE01628], a2);
}

void sub_21CC37778(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC38BF0(a1, MEMORY[0x24BE01620], a2);
}

void sub_21CC37788(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC377AC(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC377C8(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC377FC(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC3782C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC3784C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC37868(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC37884(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC378A4(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC378C0(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC378F8(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC37914(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC37934()
{
  void *v0;
  id v1;
  char v2;
  char v3;
  os_log_type_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v1 = v0;
  sub_21CC39ED4((uint64_t)&unk_24E0B41F8, (uint64_t)v1);
  v3 = v2;

  if ((v3 & 1) != 0)
  {
    v4 = sub_21CC3F8AC();
    v5 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v4))
    {
      v6 = v1;
      v7 = v5;
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v15 = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = objc_msgSend(v6, sel_template);
      v11 = objc_msgSend(v10, sel_uniqueName);

      if (v11)
      {
        v12 = sub_21CC3F7B0();
        v14 = v13;

        sub_21CC0FA20(v12, v14, &v15);
        sub_21CC3F900();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21CC08000, v7, v4, "[AAUIAwardsDataProvider] Could not find earned priority for template: %s", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2207896E8](v9, -1, -1);
        MEMORY[0x2207896E8](v8, -1, -1);

      }
      else
      {

        __break(1u);
      }
    }
  }
}

void sub_21CC37B08(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001ELL && v7 == 0x800000021CC43980)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC37BF4(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001CLL && v7 == 0x800000021CC43960)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC37CE0(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001CLL && v7 == 0x800000021CC43940)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC37DCC(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC37DE4(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0x6E6F68746172614DLL && v7 == 0xEF74756F6B726F57)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_21CC37EEC(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000019 && v7 == 0x800000021CC43920)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC37FD8(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000013 && v7 == 0x800000021CC43900)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC380C4(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001DLL && v7 == 0x800000021CC438E0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC381B0(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000016 && v7 == 0x800000021CC438C0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC3829C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0x6E6F6C6874617544 && v7 == 0xEF74756F6B726F57)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_21CC383A4(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001DLL && v7 == 0x800000021CC438A0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC38490(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000022 && v7 == 0x800000021CC43870)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC3857C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000018 && v7 == 0x800000021CC43850)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC38668(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001DLL && v7 == 0x800000021CC43830)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC38754(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000014 && v7 == 0x800000021CC43810)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC38840(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001ELL && v7 == 0x800000021CC437F0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC3892C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000013 && v7 == 0x800000021CC437D0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC38A18(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001DLL && v7 == 0x800000021CC437B0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC38B04(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000019 && v7 == 0x800000021CC43460)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC38BF0(id *a1@<X0>, uint64_t (*a2)(void)@<X1>, _BYTE *a3@<X8>)
{
  id v5;

  v5 = objc_msgSend(*a1, sel_template);
  LOBYTE(a2) = a2();

  *a3 = (_BYTE)a2;
}

void sub_21CC38C44(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC38C60(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0x444B303174736542 && v7 == 0xEF6E6F6974617275)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_21CC38D68(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000019 && v7 == 0x800000021CC43770)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC38E54(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0x75444B3574736542 && v7 == 0xEE006E6F69746172)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_21CC38F5C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000018 && v7 == 0x800000021CC43750)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC39048(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC39064(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  char v5;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    sub_21CC3F7B0();

    v5 = sub_21CC3F804();
    swift_bridgeObjectRelease();
    *a2 = v5 & 1;
  }
  else
  {
    __break(1u);
  }
}

void sub_21CC39114(id *a1@<X0>, _BYTE *a2@<X8>)
{
  sub_21CC39C8C(a1, a2);
}

void sub_21CC39134(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000012 && v7 == 0x800000021CC43630)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC39220(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000012 && v7 == 0x800000021CC43610)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC3930C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0x5774636566726550 && v7 == 0xEE006C6C416B6565)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_21CC39414(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0x5774636566726550 && v7 == 0xEF65766F4D6B6565)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_21CC3951C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000013 && v7 == 0x800000021CC435D0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC39608(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000023 && v7 == 0x800000021CC435A0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC396F4(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0x74756F6B726F5737 && v7 == 0xEC0000006B656557)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_21CC397F0(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000012 && v7 == 0x800000021CC43580)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC398DC(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000013 && v7 == 0x800000021CC43560)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC399C8(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000017 && v7 == 0x800000021CC43540)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC39AB4(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000010 && v7 == 0x800000021CC43500)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC39BA0(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD00000000000001CLL && v7 == 0x800000021CC434E0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_21CC39C8C(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  char v5;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    sub_21CC3F7B0();

    sub_21CC39F74();
    sub_21CC39FB8();
    v5 = sub_21CC3F780();
    swift_bridgeObjectRelease();
    *a2 = v5 & 1;
  }
  else
  {
    __break(1u);
  }
}

void sub_21CC39D64(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(*a1, sel_template);
  v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    v5 = sub_21CC3F7B0();
    v7 = v6;

    if (v5 == 0xD000000000000018 && v7 == 0x800000021CC434A0)
    {
      swift_bridgeObjectRelease();
      v8 = 1;
    }
    else
    {
      v8 = sub_21CC3FAA4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8 & 1;
}

uint64_t sub_21CC39E50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_21CC39E8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25531C948;
  if (!qword_25531C948)
  {
    v1 = sub_21CC3F648();
    result = MEMORY[0x220789664](MEMORY[0x24BDCE948], v1);
    atomic_store(result, (unint64_t *)&qword_25531C948);
  }
  return result;
}

uint64_t sub_21CC39ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t i;
  void (*v6)(char *__return_ptr, uint64_t *);
  char v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v4 = 0;
  for (i = a1 + 40; ; i += 16)
  {
    v6 = *(void (**)(char *__return_ptr, uint64_t *))(i - 8);
    v9 = a2;
    swift_retain();
    v6(&v8, &v9);
    swift_release();
    if ((v8 & 1) != 0)
      break;
    if (v2 == ++v4)
      return 0;
  }
  return v4;
}

unint64_t sub_21CC39F74()
{
  unint64_t result;

  result = qword_25531C950;
  if (!qword_25531C950)
  {
    result = MEMORY[0x220789664](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25531C950);
  }
  return result;
}

unint64_t sub_21CC39FB8()
{
  unint64_t result;

  result = qword_25531C958;
  if (!qword_25531C958)
  {
    result = MEMORY[0x220789664](MEMORY[0x24BEE5E60], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25531C958);
  }
  return result;
}

uint64_t sub_21CC39FFC(void *a1, void *a2)
{
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  int v40;
  void *v41;
  id v42;
  double v43;
  void *v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  Swift::String v66;
  uint64_t inited;
  unint64_t v68;
  id v69;
  id v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  unsigned int (*v81)(char *, uint64_t, uint64_t);
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  unint64_t v85;
  id v86;
  uint64_t result;
  id v88;
  void *v89;
  id v90;
  id v91;
  char v92;
  char *v93;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t);
  char *v98;
  uint64_t v99;
  char *v100;
  void (*v101)(char *, uint64_t);
  void (*v102)(char *, uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  id v107;
  id v108;
  id v109;
  void (*v110)(char *, uint64_t);
  void (*v111)(char *, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(char *, uint64_t);
  void (*v117)(char *, uint64_t);
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  void *v127;
  char *v128;
  void *v129;
  unint64_t v130;
  char v131;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C938);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v121 = (char *)&v120 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v123 = (char *)&v120 - v6;
  v124 = sub_21CC3F648();
  v125 = *(_QWORD *)(v124 - 8);
  v7 = MEMORY[0x24BDAC7A8](v124);
  v120 = (char *)&v120 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v122 = (char *)&v120 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531C940);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v120 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v120 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v120 - v20;
  v22 = sub_21CC3F5E8();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v126 = (char *)&v120 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v128 = (char *)&v120 - v26;
  v129 = a1;
  v27 = objc_msgSend(a1, sel_relevantEarnedInstance);
  if (!v27)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v21, 1, 1, v22);
LABEL_7:
    v33 = &qword_25531C940;
    v34 = (uint64_t)v21;
LABEL_15:
    sub_21CC39E50(v34, v33);
    v41 = v129;
    goto LABEL_16;
  }
  v28 = v27;
  v127 = a2;
  v29 = objc_msgSend(v27, sel_earnedDateComponents);

  if (v29)
  {
    sub_21CC3F5DC();

    v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
    v30(v19, 0, 1, v22);
  }
  else
  {
    v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
    v30(v19, 1, 1, v22);
  }
  sub_21CC3E8BC((uint64_t)v19, (uint64_t)v21);
  v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v32 = v31(v21, 1, v22);
  a2 = v127;
  if (v32 == 1)
    goto LABEL_7;
  v35 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
  v35(v128, v21, v22);
  v36 = objc_msgSend(a2, sel_relevantEarnedInstance);
  if (!v36)
  {
    v30(v16, 1, 1, v22);
LABEL_14:
    (*(void (**)(char *, uint64_t))(v23 + 8))(v128, v22);
    v33 = &qword_25531C940;
    v34 = (uint64_t)v16;
    goto LABEL_15;
  }
  v37 = v36;
  v38 = objc_msgSend(v36, sel_earnedDateComponents);

  if (v38)
  {
    sub_21CC3F5DC();

    v39 = 0;
  }
  else
  {
    v39 = 1;
  }
  v30(v13, v39, 1, v22);
  sub_21CC3E8BC((uint64_t)v13, (uint64_t)v16);
  v40 = v31(v16, 1, v22);
  a2 = v127;
  if (v40 == 1)
    goto LABEL_14;
  v77 = v126;
  v35(v126, v16, v22);
  v78 = v123;
  v79 = v128;
  sub_21CC3F678();
  v80 = v125;
  v81 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v125 + 48);
  v82 = v124;
  if (v81(v78, 1, v124) == 1)
  {
    v83 = *(void (**)(char *, uint64_t))(v23 + 8);
    v83(v77, v22);
    v83(v79, v22);
    v33 = &qword_25531C938;
    v34 = (uint64_t)v78;
    goto LABEL_15;
  }
  v93 = v122;
  v123 = *(char **)(v80 + 32);
  ((void (*)(char *, char *, uint64_t))v123)(v122, v78, v82);
  v94 = (uint64_t)v121;
  sub_21CC3F678();
  v95 = v81((char *)v94, 1, v82);
  v96 = v80;
  v41 = v129;
  if (v95 != 1)
  {
    v98 = v120;
    ((void (*)(char *, uint64_t, uint64_t))v123)(v120, v94, v82);
    v99 = sub_21CC3F630();
    v100 = v93;
    if (v99)
    {
      v76 = v99;
      v101 = *(void (**)(char *, uint64_t))(v125 + 8);
      v101(v98, v82);
      v101(v100, v82);
      v102 = *(void (**)(char *, uint64_t))(v23 + 8);
      v102(v126, v22);
      v102(v128, v22);
      return v76;
    }
    sub_21CC37934();
    v104 = v103;
    sub_21CC37934();
    if (v104 == v105)
    {
      v106 = objc_msgSend(v41, sel_template);
      v107 = objc_msgSend(v106, sel_displayOrder);

      v108 = objc_msgSend(a2, sel_template);
      v109 = objc_msgSend(v108, sel_displayOrder);

      v110 = *(void (**)(char *, uint64_t))(v125 + 8);
      v110(v120, v82);
      v110(v100, v82);
      v111 = *(void (**)(char *, uint64_t))(v23 + 8);
      v111(v126, v22);
      v111(v128, v22);
      if (v107 < v109)
        return 1;
      else
        return -1;
    }
    sub_21CC37934();
    v113 = v112;
    sub_21CC37934();
    v115 = v114;
    v116 = *(void (**)(char *, uint64_t))(v125 + 8);
    v116(v120, v82);
    v116(v100, v82);
    v117 = *(void (**)(char *, uint64_t))(v23 + 8);
    v117(v126, v22);
    v117(v128, v22);
    v75 = v113 < v115;
LABEL_40:
    if (v75)
      return -1;
    else
      return 1;
  }
  (*(void (**)(char *, uint64_t))(v96 + 8))(v93, v82);
  v97 = *(void (**)(char *, uint64_t))(v23 + 8);
  v97(v126, v22);
  v97(v128, v22);
  sub_21CC39E50(v94, &qword_25531C938);
LABEL_16:
  if (objc_msgSend(v41, sel_unearned) && !objc_msgSend(a2, sel_unearned))
    return 1;
  if ((objc_msgSend(v41, sel_unearned) & 1) == 0
    && (objc_msgSend(a2, sel_unearned) & 1) != 0)
  {
    return -1;
  }
  v42 = objc_msgSend(v41, sel_progress);
  v43 = 0.0;
  if (v42)
  {
    v44 = v42;
    v45 = objc_msgSend(v41, sel_goal);
    if (v45)
    {
      v46 = v45;
      objc_msgSend(v44, sel__value);
      v48 = v47;
      objc_msgSend(v46, sel__value);
      v50 = v49;

      v43 = v48 / v50;
    }
    else
    {

    }
  }
  v51 = objc_msgSend(a2, sel_progress);
  if (v51)
  {
    v52 = v51;
    v53 = objc_msgSend(a2, sel_goal);
    if (v53)
    {
      v54 = v53;
      objc_msgSend(v52, sel__value);
      v56 = v55;
      objc_msgSend(v54, sel__value);
      v58 = v57;

      if (v56 / v58 != v43)
      {
        if (v56 / v58 >= v43)
          return 1;
        return -1;
      }
      goto LABEL_31;
    }

  }
  if (v43 != 0.0)
  {
    if (v43 <= 0.0)
      return 1;
    return -1;
  }
LABEL_31:
  sub_21CC37598();
  v60 = v59;
  sub_21CC37598();
  if (v60 != v61)
  {
LABEL_39:
    sub_21CC37598();
    v73 = v72;
    sub_21CC37598();
    v75 = v73 < v74;
    goto LABEL_40;
  }
  v62 = objc_msgSend(v41, sel_section);
  v63 = sub_21CC3F7B0();
  v65 = v64;

  v66._countAndFlagsBits = v63;
  v66._object = v65;
  AAUIAwardsDataProviderSection.init(rawValue:)(v66);
  if (v131 != 2)
  {
    if (v131 != 3)
      return -1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7C8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21CC42370;
    *(_QWORD *)(inited + 32) = v41;
    *(_QWORD *)(inited + 40) = a2;
    v130 = inited;
    sub_21CC3F864();
    v68 = v130;
    v69 = v41;
    v70 = a2;
    v71 = sub_21CC3E39C(v68);
    swift_bridgeObjectRelease();
    if (v71 >> 62)
    {
      swift_bridgeObjectRetain();
      v118 = sub_21CC3FA14();
      swift_bridgeObjectRelease();
      if (v118)
      {
LABEL_36:
        if ((v71 & 0xC000000000000001) == 0)
        {
          if (!*(_QWORD *)((v71 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_39;
          }
          goto LABEL_51;
        }
LABEL_63:
        v88 = (id)MEMORY[0x220788B18](0, v71);
LABEL_52:
        v89 = v88;
        swift_bridgeObjectRelease();
        sub_21CC0B890();
        v90 = v69;
        v91 = v89;
        v92 = sub_21CC3F8F4();

        if ((v92 & 1) != 0)
          return -1;
        return 1;
      }
    }
    else if (*(_QWORD *)((v71 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_36;
    }
LABEL_67:
    swift_bridgeObjectRelease();
    return 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C7C8);
  v84 = swift_initStackObject();
  *(_OWORD *)(v84 + 16) = xmmword_21CC42370;
  *(_QWORD *)(v84 + 32) = v41;
  *(_QWORD *)(v84 + 40) = a2;
  v130 = v84;
  sub_21CC3F864();
  v85 = v130;
  v69 = v41;
  v86 = a2;
  v71 = sub_21CC1581C(v85);
  result = swift_bridgeObjectRelease();
  if (v71 >> 62)
  {
    swift_bridgeObjectRetain();
    v119 = sub_21CC3FA14();
    result = swift_bridgeObjectRelease();
    if (!v119)
      goto LABEL_67;
  }
  else if (!*(_QWORD *)((v71 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_67;
  }
  if ((v71 & 0xC000000000000001) != 0)
    goto LABEL_63;
  if (*(_QWORD *)((v71 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_51:
    v88 = *(id *)(v71 + 32);
    goto LABEL_52;
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC3AA74(void **a1, uint64_t *a2)
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  id v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;

  v3 = *a1;
  v4 = AAUILocalizedActivityTypeForAchievement(*a1);
  if (v4)
  {
    v5 = v4;
    v6 = sub_21CC3F7B0();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xE000000000000000;
  }
  v9 = *a2;
  if (*(_QWORD *)(*a2 + 16))
  {
    swift_bridgeObjectRetain();
    v10 = sub_21CC2EF40(v6, v8);
    if ((v11 & 1) != 0)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10);
      swift_bridgeObjectRetain();
    }
    else
    {
      v12 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = MEMORY[0x24BEE4AF8];
  }
  v13 = v3;
  MEMORY[0x2207889BC]();
  if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_21CC3F870();
  sub_21CC3F888();
  sub_21CC3F864();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *a2;
  *a2 = 0x8000000000000000;
  sub_21CC33D00(v12, v6, v8, isUniquelyReferenced_nonNull_native);
  *a2 = v16;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC3ABE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  sub_21CC196FC();
  v3 = 0;
  while ((sub_21CC3F798() & 1) == 0)
  {
    if (v2 == ++v3)
      return 0;
  }
  return v3;
}

unint64_t sub_21CC3AC7C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21CC3FAD4();
  return sub_21CC3D7F4(a1, v2);
}

uint64_t sub_21CC3ACAC(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_21CC14A34();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_21CC3B4C4(v6);
  return sub_21CC3F9C0();
}

uint64_t sub_21CC3AD24(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_21CC14A34();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_21CC3BFDC(v6);
  return sub_21CC3F9C0();
}

_QWORD *sub_21CC3AD9C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25531C980);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  v6 = sub_21CC3DEFC(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21CC2FA08();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_21CC3AE80(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  char v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  unint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;

  v2 = a1;
  v3 = a1[1];
  result = sub_21CC3FA74();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_138;
    if ((unint64_t)v3 >= 2)
    {
      v76 = 0;
      v77 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v79 = *(_QWORD *)(v77 + 8 * i);
        v80 = v76;
        do
        {
          v81 = *(_QWORD *)(v77 + v80);
          if (v79 >= v81)
            break;
          if (!v77)
            goto LABEL_142;
          *(_QWORD *)(v77 + v80 + 8) = v81;
          *(_QWORD *)(v77 + v80) = v79;
          v80 -= 8;
        }
        while (v80 != -8);
        v76 += 8;
      }
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_137;
    v93 = result;
    v94 = v3;
    if (v3 > 1)
    {
      v6 = v5 >> 1;
      result = sub_21CC3F87C();
      *(_QWORD *)(result + 16) = v6;
      v3 = v94;
      v92 = result;
      v96 = (char *)(result + 32);
LABEL_13:
      v8 = 0;
      v9 = *v2;
      v90 = v2;
      v91 = *v2 - 8;
      v10 = MEMORY[0x24BEE4AF8];
      v95 = *v2;
      while (1)
      {
        v12 = v8++;
        if (v8 < v3)
        {
          v13 = *(_QWORD *)(v9 + 8 * v8);
          v14 = *(_QWORD *)(v9 + 8 * v12);
          v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            v15 = v13;
            while (1)
            {
              v16 = *(_QWORD *)(v9 + 8 * v8);
              if (v13 < v14 == v16 >= v15)
                break;
              ++v8;
              v15 = v16;
              if (v3 == v8)
              {
                v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12)
              goto LABEL_139;
            if (v12 < v8)
            {
              v17 = v8 - 1;
              v18 = v12;
              do
              {
                if (v18 != v17)
                {
                  if (!v9)
                    goto LABEL_145;
                  v19 = *(_QWORD *)(v9 + 8 * v18);
                  *(_QWORD *)(v9 + 8 * v18) = *(_QWORD *)(v9 + 8 * v17);
                  *(_QWORD *)(v9 + 8 * v17) = v19;
                }
                v58 = ++v18 < v17--;
              }
              while (v58);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12))
            goto LABEL_136;
          if (v8 - v12 < v93)
          {
            v20 = v12 + v93;
            if (__OFADD__(v12, v93))
              goto LABEL_140;
            if (v20 >= v3)
              v20 = v3;
            if (v20 < v12)
            {
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
              return result;
            }
            if (v8 != v20)
            {
              v21 = (unint64_t *)(v91 + 8 * v8);
              do
              {
                v22 = *(_QWORD *)(v9 + 8 * v8);
                v23 = v12;
                v24 = v21;
                do
                {
                  v25 = *v24;
                  if (v22 >= *v24)
                    break;
                  if (!v9)
                    goto LABEL_143;
                  *v24 = v22;
                  v24[1] = v25;
                  --v24;
                  ++v23;
                }
                while (v8 != v23);
                ++v8;
                ++v21;
              }
              while (v8 != v20);
              v8 = v20;
            }
          }
        }
        if (v8 < v12)
          goto LABEL_131;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_21CC33428(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
          v10 = result;
        }
        v27 = *(_QWORD *)(v10 + 16);
        v26 = *(_QWORD *)(v10 + 24);
        v11 = v27 + 1;
        v9 = v95;
        if (v27 >= v26 >> 1)
        {
          result = (uint64_t)sub_21CC33428((char *)(v26 > 1), v27 + 1, 1, (char *)v10);
          v9 = v95;
          v10 = result;
        }
        *(_QWORD *)(v10 + 16) = v11;
        v28 = v10 + 32;
        v29 = (uint64_t *)(v10 + 32 + 16 * v27);
        *v29 = v12;
        v29[1] = v8;
        if (v27)
        {
          while (1)
          {
            v30 = v11 - 1;
            if (v11 >= 4)
            {
              v35 = v28 + 16 * v11;
              v36 = *(_QWORD *)(v35 - 64);
              v37 = *(_QWORD *)(v35 - 56);
              v41 = __OFSUB__(v37, v36);
              v38 = v37 - v36;
              if (v41)
                goto LABEL_120;
              v40 = *(_QWORD *)(v35 - 48);
              v39 = *(_QWORD *)(v35 - 40);
              v41 = __OFSUB__(v39, v40);
              v33 = v39 - v40;
              v34 = v41;
              if (v41)
                goto LABEL_121;
              v42 = v11 - 2;
              v43 = (uint64_t *)(v28 + 16 * (v11 - 2));
              v45 = *v43;
              v44 = v43[1];
              v41 = __OFSUB__(v44, v45);
              v46 = v44 - v45;
              if (v41)
                goto LABEL_122;
              v41 = __OFADD__(v33, v46);
              v47 = v33 + v46;
              if (v41)
                goto LABEL_124;
              if (v47 >= v38)
              {
                v65 = (uint64_t *)(v28 + 16 * v30);
                v67 = *v65;
                v66 = v65[1];
                v41 = __OFSUB__(v66, v67);
                v68 = v66 - v67;
                if (v41)
                  goto LABEL_130;
                v58 = v33 < v68;
                goto LABEL_84;
              }
            }
            else
            {
              if (v11 != 3)
              {
                v59 = *(_QWORD *)(v10 + 32);
                v60 = *(_QWORD *)(v10 + 40);
                v41 = __OFSUB__(v60, v59);
                v52 = v60 - v59;
                v53 = v41;
                goto LABEL_78;
              }
              v32 = *(_QWORD *)(v10 + 32);
              v31 = *(_QWORD *)(v10 + 40);
              v41 = __OFSUB__(v31, v32);
              v33 = v31 - v32;
              v34 = v41;
            }
            if ((v34 & 1) != 0)
              goto LABEL_123;
            v42 = v11 - 2;
            v48 = (uint64_t *)(v28 + 16 * (v11 - 2));
            v50 = *v48;
            v49 = v48[1];
            v51 = __OFSUB__(v49, v50);
            v52 = v49 - v50;
            v53 = v51;
            if (v51)
              goto LABEL_125;
            v54 = (uint64_t *)(v28 + 16 * v30);
            v56 = *v54;
            v55 = v54[1];
            v41 = __OFSUB__(v55, v56);
            v57 = v55 - v56;
            if (v41)
              goto LABEL_127;
            if (__OFADD__(v52, v57))
              goto LABEL_129;
            if (v52 + v57 >= v33)
            {
              v58 = v33 < v57;
LABEL_84:
              if (v58)
                v30 = v42;
              goto LABEL_86;
            }
LABEL_78:
            if ((v53 & 1) != 0)
              goto LABEL_126;
            v61 = (uint64_t *)(v28 + 16 * v30);
            v63 = *v61;
            v62 = v61[1];
            v41 = __OFSUB__(v62, v63);
            v64 = v62 - v63;
            if (v41)
              goto LABEL_128;
            if (v64 < v52)
              goto LABEL_15;
LABEL_86:
            v69 = v30 - 1;
            if (v30 - 1 >= v11)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
              goto LABEL_141;
            }
            if (!v9)
              goto LABEL_144;
            v70 = (uint64_t *)(v28 + 16 * v69);
            v71 = *v70;
            v72 = v28;
            v73 = (_QWORD *)(v28 + 16 * v30);
            v74 = v73[1];
            result = sub_21CC3C96C((char *)(v9 + 8 * *v70), (char *)(v9 + 8 * *v73), v9 + 8 * v74, v96);
            if (v1)
              goto LABEL_114;
            if (v74 < v71)
              goto LABEL_117;
            if (v30 > *(_QWORD *)(v10 + 16))
              goto LABEL_118;
            *v70 = v71;
            *(_QWORD *)(v72 + 16 * v69 + 8) = v74;
            v75 = *(_QWORD *)(v10 + 16);
            if (v30 >= v75)
              goto LABEL_119;
            v11 = v75 - 1;
            result = (uint64_t)memmove(v73, v73 + 2, 16 * (v75 - 1 - v30));
            v28 = v72;
            *(_QWORD *)(v10 + 16) = v75 - 1;
            v9 = v95;
            if (v75 <= 2)
              goto LABEL_15;
          }
        }
        v11 = 1;
LABEL_15:
        v3 = v94;
        if (v8 >= v94)
        {
          v7 = v92;
          v2 = v90;
          goto LABEL_103;
        }
      }
    }
    v7 = MEMORY[0x24BEE4AF8];
    v96 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 == 1)
    {
      v92 = MEMORY[0x24BEE4AF8];
      goto LABEL_13;
    }
    v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v10 = MEMORY[0x24BEE4AF8];
LABEL_103:
    v92 = v7;
    if (v11 >= 2)
    {
      v82 = *v2;
      do
      {
        v83 = v11 - 2;
        if (v11 < 2)
          goto LABEL_132;
        if (!v82)
          goto LABEL_146;
        v84 = v10;
        v85 = v10 + 32;
        v86 = *(_QWORD *)(v10 + 32 + 16 * v83);
        v87 = *(_QWORD *)(v10 + 32 + 16 * (v11 - 1) + 8);
        result = sub_21CC3C96C((char *)(v82 + 8 * v86), (char *)(v82 + 8 * *(_QWORD *)(v85 + 16 * (v11 - 1))), v82 + 8 * v87, v96);
        if (v1)
          break;
        if (v87 < v86)
          goto LABEL_133;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_21CC335C8(v84);
          v84 = result;
        }
        if (v83 >= *(_QWORD *)(v84 + 16))
          goto LABEL_134;
        v88 = (_QWORD *)(v84 + 32 + 16 * v83);
        *v88 = v86;
        v88[1] = v87;
        v89 = *(_QWORD *)(v84 + 16);
        if (v11 > v89)
          goto LABEL_135;
        result = (uint64_t)memmove((void *)(v84 + 32 + 16 * (v11 - 1)), (const void *)(v84 + 32 + 16 * v11), 16 * (v89 - v11));
        v10 = v84;
        *(_QWORD *)(v84 + 16) = v89 - 1;
        v11 = v89 - 1;
      }
      while (v89 > 2);
    }
LABEL_114:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v92 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21CC3B4C4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  void **v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  unint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  BOOL v115;
  uint64_t v116;
  char v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  BOOL v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _QWORD *v144;
  unint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void (*v151)(char *, uint64_t, uint64_t);
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void **v155;
  void **v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C978);
  MEMORY[0x24BDAC7A8]();
  v159 = (char *)&v146 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = a1[1];
  result = sub_21CC3FA74();
  if (result < v5)
  {
    if (v5 >= 0)
      v7 = v5;
    else
      v7 = v5 + 1;
    if (v5 < -1)
      goto LABEL_150;
    v8 = result;
    v146 = a1;
    if (v5 <= 1)
    {
      v32 = MEMORY[0x24BEE4AF8];
      v164 = MEMORY[0x24BEE4AF8];
      v155 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
      if (v5 != 1)
      {
        v36 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
        if (v36 < 2)
          goto LABEL_127;
        goto LABEL_115;
      }
    }
    else
    {
      v9 = a1;
      v10 = v7 >> 1;
      sub_21CC0B890();
      result = sub_21CC3F87C();
      *(_QWORD *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = v10;
      a1 = v9;
      v155 = (void **)((result & 0xFFFFFFFFFFFFFF8) + 32);
      v164 = result;
    }
    v150 = v8;
    v157 = v1;
    v33 = 0;
    v34 = *a1;
    v35 = *a1 + 16;
    v147 = *a1 - 8;
    v148 = v35;
    v32 = MEMORY[0x24BEE4AF8];
    v158 = v34;
    v156 = (void **)v5;
    while (1)
    {
      v37 = v33++;
      v153 = v37;
      if (v33 < v5)
      {
        v38 = *(void **)(v34 + 8 * v37);
        v39 = *(id *)(v34 + 8 * v33);
        v40 = v38;
        result = AAUILocalizedModalityForAchievement(v39);
        if (!result)
          goto LABEL_166;
        v41 = (void *)result;
        v42 = sub_21CC3F7B0();
        v44 = v43;

        v162 = v42;
        v163 = v44;
        result = AAUILocalizedModalityForAchievement(v40);
        if (!result)
          goto LABEL_167;
        v45 = (void *)result;
        v46 = sub_21CC3F7B0();
        v48 = v47;

        v160 = v46;
        v161 = v48;
        v49 = sub_21CC3F654();
        v50 = (uint64_t)v159;
        v151 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56);
        v152 = v49;
        v151(v159, 1, 1);
        sub_21CC19F6C();
        v154 = sub_21CC3F924();
        sub_21CC39E50(v50, &qword_25531C978);
        swift_bridgeObjectRelease();

        result = swift_bridgeObjectRelease();
        v37 = v153;
        v33 = v153 + 2;
        if (v153 + 2 < (uint64_t)v156)
        {
          v149 = v32;
          v51 = (id *)(v148 + 8 * v153);
          do
          {
            v52 = *(v51 - 1);
            v53 = *v51;
            v54 = v52;
            result = AAUILocalizedModalityForAchievement(v53);
            if (!result)
              goto LABEL_162;
            v55 = (void *)result;
            v56 = sub_21CC3F7B0();
            v58 = v57;

            v162 = v56;
            v163 = v58;
            result = AAUILocalizedModalityForAchievement(v54);
            if (!result)
              goto LABEL_163;
            v59 = (void *)result;
            v60 = v154 == -1;
            v61 = sub_21CC3F7B0();
            v63 = v62;

            v160 = v61;
            v161 = v63;
            v64 = (uint64_t)v159;
            ((void (*)(char *, uint64_t, uint64_t, uint64_t))v151)(v159, 1, 1, v152);
            v65 = sub_21CC3F924();
            sub_21CC39E50(v64, &qword_25531C978);
            swift_bridgeObjectRelease();

            result = swift_bridgeObjectRelease();
            if (v60 == (v65 != -1))
              goto LABEL_34;
            ++v33;
            ++v51;
          }
          while (v156 != (void **)v33);
          v33 = (uint64_t)v156;
LABEL_34:
          v32 = v149;
          v37 = v153;
        }
        v34 = v158;
        if (v154 == -1)
        {
          if (v33 < v37)
            goto LABEL_157;
          if (v37 < v33)
          {
            v66 = (uint64_t *)(v147 + 8 * v33);
            v67 = v33;
            v68 = v37;
            v69 = (uint64_t *)(v158 + 8 * v37);
            do
            {
              if (v68 != --v67)
              {
                if (!v34)
                  goto LABEL_164;
                v70 = *v69;
                *v69 = *v66;
                *v66 = v70;
              }
              ++v68;
              --v66;
              ++v69;
            }
            while (v68 < v67);
            v37 = v153;
          }
        }
      }
      if (v33 < (uint64_t)v156)
      {
        if (__OFSUB__(v33, v37))
          goto LABEL_149;
        if (v33 - v37 >= v150)
        {
          v37 = v153;
        }
        else
        {
          if (__OFADD__(v153, v150))
            goto LABEL_152;
          v71 = v156;
          if (v153 + v150 < (uint64_t)v156)
            v71 = (void **)(v153 + v150);
          v37 = v153;
          if ((uint64_t)v71 < v153)
          {
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            __break(1u);
LABEL_165:
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
            return result;
          }
          if ((void **)v33 != v71)
          {
            v149 = v32;
            v72 = v147 + 8 * v33;
            v152 = (uint64_t)v71;
            do
            {
              v73 = *(void **)(v34 + 8 * v33);
              v154 = v72;
              while (1)
              {
                v74 = *(void **)v72;
                v75 = v73;
                v76 = v74;
                result = AAUILocalizedModalityForAchievement(v75);
                if (!result)
                  goto LABEL_158;
                v77 = (void *)result;
                v78 = sub_21CC3F7B0();
                v80 = v79;

                v162 = v78;
                v163 = v80;
                result = AAUILocalizedModalityForAchievement(v76);
                if (!result)
                  goto LABEL_159;
                v81 = (void *)result;
                v82 = sub_21CC3F7B0();
                v84 = v83;

                v160 = v82;
                v161 = v84;
                v85 = sub_21CC3F654();
                v86 = (uint64_t)v159;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v85 - 8) + 56))(v159, 1, 1, v85);
                sub_21CC19F6C();
                v87 = sub_21CC3F924();
                sub_21CC39E50(v86, &qword_25531C978);
                swift_bridgeObjectRelease();

                result = swift_bridgeObjectRelease();
                if (v87 != -1)
                  break;
                v34 = v158;
                if (!v158)
                  goto LABEL_160;
                v88 = *(void **)v72;
                v73 = *(void **)(v72 + 8);
                *(_QWORD *)v72 = v73;
                *(_QWORD *)(v72 + 8) = v88;
                v72 -= 8;
                if (v33 == ++v37)
                  goto LABEL_54;
              }
              v34 = v158;
LABEL_54:
              ++v33;
              v37 = v153;
              v72 = v154 + 8;
            }
            while (v33 != v152);
            v33 = v152;
            v32 = v149;
            if (v152 < v153)
              goto LABEL_144;
            goto LABEL_64;
          }
        }
      }
      if (v33 < v37)
        goto LABEL_144;
LABEL_64:
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_21CC33428(0, *(_QWORD *)(v32 + 16) + 1, 1, (char *)v32);
        v32 = result;
      }
      v90 = *(_QWORD *)(v32 + 16);
      v89 = *(_QWORD *)(v32 + 24);
      v36 = v90 + 1;
      v34 = v158;
      v91 = v153;
      if (v90 >= v89 >> 1)
      {
        result = (uint64_t)sub_21CC33428((char *)(v89 > 1), v90 + 1, 1, (char *)v32);
        v91 = v153;
        v34 = v158;
        v32 = result;
      }
      *(_QWORD *)(v32 + 16) = v36;
      v92 = v32 + 32;
      v93 = (uint64_t *)(v32 + 32 + 16 * v90);
      *v93 = v91;
      v93[1] = v33;
      if (v90)
      {
        while (1)
        {
          v94 = v36 - 1;
          if (v36 >= 4)
          {
            v99 = v92 + 16 * v36;
            v100 = *(_QWORD *)(v99 - 64);
            v101 = *(_QWORD *)(v99 - 56);
            v105 = __OFSUB__(v101, v100);
            v102 = v101 - v100;
            if (v105)
              goto LABEL_133;
            v104 = *(_QWORD *)(v99 - 48);
            v103 = *(_QWORD *)(v99 - 40);
            v105 = __OFSUB__(v103, v104);
            v97 = v103 - v104;
            v98 = v105;
            if (v105)
              goto LABEL_134;
            v106 = v36 - 2;
            v107 = (uint64_t *)(v92 + 16 * (v36 - 2));
            v109 = *v107;
            v108 = v107[1];
            v105 = __OFSUB__(v108, v109);
            v110 = v108 - v109;
            if (v105)
              goto LABEL_135;
            v105 = __OFADD__(v97, v110);
            v111 = v97 + v110;
            if (v105)
              goto LABEL_137;
            if (v111 >= v102)
            {
              v129 = (uint64_t *)(v92 + 16 * v94);
              v131 = *v129;
              v130 = v129[1];
              v105 = __OFSUB__(v130, v131);
              v132 = v130 - v131;
              if (v105)
                goto LABEL_143;
              v122 = v97 < v132;
              goto LABEL_100;
            }
          }
          else
          {
            if (v36 != 3)
            {
              v123 = *(_QWORD *)(v32 + 32);
              v124 = *(_QWORD *)(v32 + 40);
              v105 = __OFSUB__(v124, v123);
              v116 = v124 - v123;
              v117 = v105;
              goto LABEL_94;
            }
            v96 = *(_QWORD *)(v32 + 32);
            v95 = *(_QWORD *)(v32 + 40);
            v105 = __OFSUB__(v95, v96);
            v97 = v95 - v96;
            v98 = v105;
          }
          if ((v98 & 1) != 0)
            goto LABEL_136;
          v106 = v36 - 2;
          v112 = (uint64_t *)(v92 + 16 * (v36 - 2));
          v114 = *v112;
          v113 = v112[1];
          v115 = __OFSUB__(v113, v114);
          v116 = v113 - v114;
          v117 = v115;
          if (v115)
            goto LABEL_138;
          v118 = (uint64_t *)(v92 + 16 * v94);
          v120 = *v118;
          v119 = v118[1];
          v105 = __OFSUB__(v119, v120);
          v121 = v119 - v120;
          if (v105)
            goto LABEL_140;
          if (__OFADD__(v116, v121))
            goto LABEL_142;
          if (v116 + v121 >= v97)
          {
            v122 = v97 < v121;
LABEL_100:
            if (v122)
              v94 = v106;
            goto LABEL_102;
          }
LABEL_94:
          if ((v117 & 1) != 0)
            goto LABEL_139;
          v125 = (uint64_t *)(v92 + 16 * v94);
          v127 = *v125;
          v126 = v125[1];
          v105 = __OFSUB__(v126, v127);
          v128 = v126 - v127;
          if (v105)
            goto LABEL_141;
          if (v128 < v116)
            goto LABEL_23;
LABEL_102:
          v133 = v94 - 1;
          if (v94 - 1 >= v36)
          {
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
            goto LABEL_153;
          }
          if (!v34)
            goto LABEL_161;
          v134 = (uint64_t *)(v92 + 16 * v133);
          v135 = *v134;
          v136 = (_QWORD *)(v92 + 16 * v94);
          v137 = v136[1];
          v138 = v157;
          result = (uint64_t)sub_21CC3CB6C((void **)(v34 + 8 * *v134), (id *)(v34 + 8 * *v136), v34 + 8 * v137, v155);
          v157 = v138;
          if (v138)
            goto LABEL_127;
          if (v137 < v135)
            goto LABEL_130;
          if (v94 > *(_QWORD *)(v32 + 16))
            goto LABEL_131;
          *v134 = v135;
          *(_QWORD *)(v92 + 16 * v133 + 8) = v137;
          v139 = *(_QWORD *)(v32 + 16);
          if (v94 >= v139)
            goto LABEL_132;
          v36 = v139 - 1;
          result = (uint64_t)memmove((void *)(v92 + 16 * v94), v136 + 2, 16 * (v139 - 1 - v94));
          *(_QWORD *)(v32 + 16) = v139 - 1;
          v34 = v158;
          if (v139 <= 2)
            goto LABEL_23;
        }
      }
      v36 = 1;
LABEL_23:
      v5 = (uint64_t)v156;
      if (v33 >= (uint64_t)v156)
      {
        v2 = v157;
        if (v36 < 2)
        {
LABEL_127:
          swift_bridgeObjectRelease();
          *(_QWORD *)((v164 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_21CC3F864();
          return swift_bridgeObjectRelease();
        }
LABEL_115:
        v140 = *v146;
        while (1)
        {
          v141 = v36 - 2;
          if (v36 < 2)
            goto LABEL_145;
          if (!v140)
            goto LABEL_165;
          v142 = *(_QWORD *)(v32 + 32 + 16 * v141);
          v143 = *(_QWORD *)(v32 + 32 + 16 * (v36 - 1) + 8);
          result = (uint64_t)sub_21CC3CB6C((void **)(v140 + 8 * v142), (id *)(v140 + 8 * *(_QWORD *)(v32 + 32 + 16 * (v36 - 1))), v140 + 8 * v143, v155);
          if (v2)
            goto LABEL_127;
          if (v143 < v142)
            goto LABEL_146;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_21CC335C8(v32);
            v32 = result;
          }
          if (v141 >= *(_QWORD *)(v32 + 16))
            goto LABEL_147;
          v144 = (_QWORD *)(v32 + 32 + 16 * v141);
          *v144 = v142;
          v144[1] = v143;
          v145 = *(_QWORD *)(v32 + 16);
          if (v36 > v145)
            goto LABEL_148;
          result = (uint64_t)memmove((void *)(v32 + 32 + 16 * (v36 - 1)), (const void *)(v32 + 32 + 16 * v36), 16 * (v145 - v36));
          *(_QWORD *)(v32 + 16) = v145 - 1;
          v36 = v145 - 1;
          if (v145 <= 2)
            goto LABEL_127;
        }
      }
    }
  }
  if (v5 < 0)
    goto LABEL_151;
  if ((unint64_t)v5 >= 2)
  {
    v156 = (void **)v5;
    v157 = v1;
    v11 = *a1;
    v12 = -1;
    v13 = 1;
    v14 = *a1;
LABEL_12:
    v154 = v14;
    v155 = (void **)v13;
    v15 = *(void **)(v11 + 8 * v13);
    v158 = v12;
    while (1)
    {
      v16 = *(void **)v14;
      v17 = v15;
      v18 = v16;
      result = AAUILocalizedModalityForAchievement(v17);
      if (!result)
        goto LABEL_154;
      v19 = (void *)result;
      v20 = sub_21CC3F7B0();
      v22 = v21;

      v162 = v20;
      v163 = v22;
      result = AAUILocalizedModalityForAchievement(v18);
      if (!result)
        goto LABEL_155;
      v23 = (void *)result;
      v24 = sub_21CC3F7B0();
      v26 = v25;

      v160 = v24;
      v161 = v26;
      v27 = sub_21CC3F654();
      v28 = (uint64_t)v159;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v159, 1, 1, v27);
      sub_21CC19F6C();
      v29 = sub_21CC3F924();
      sub_21CC39E50(v28, &qword_25531C978);
      swift_bridgeObjectRelease();

      result = swift_bridgeObjectRelease();
      if (v29 == -1)
      {
        if (!v11)
          goto LABEL_156;
        v30 = *(void **)v14;
        v15 = *(void **)(v14 + 8);
        *(_QWORD *)v14 = v15;
        *(_QWORD *)(v14 + 8) = v30;
        v14 -= 8;
        if (!__CFADD__(v12++, 1))
          continue;
      }
      v13 = (uint64_t)v155 + 1;
      v14 = v154 + 8;
      v12 = v158 - 1;
      if ((void **)((char *)v155 + 1) == v156)
        return result;
      goto LABEL_12;
    }
  }
  return result;
}

void sub_21CC3BFDC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v69;
  char v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  void **v111;
  uint64_t v112;
  uint64_t v113;

  v3 = a1[1];
  v4 = sub_21CC3FA74();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_132;
    if (v3)
      sub_21CC3C76C(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_131;
  v102 = v4;
  v99 = a1;
  if (v3 > 1)
  {
    v6 = v5 >> 1;
    sub_21CC0B890();
    v7 = sub_21CC3F87C();
    *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v111 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    v113 = v7;
LABEL_12:
    v9 = 0;
    v10 = *a1;
    v100 = *a1 - 8;
    v101 = *a1 + 16;
    v8 = (char *)MEMORY[0x24BEE4AF8];
    v107 = v3;
    v112 = *a1;
    while (1)
    {
      v12 = v9++;
      v108 = v12;
      if (v9 < v3)
      {
        v103 = v8;
        v13 = *(void **)(v10 + 8 * v12);
        v14 = *(id *)(v10 + 8 * v9);
        v15 = v13;
        v16 = objc_msgSend(v14, sel_template);
        v109 = objc_msgSend(v16, sel_displayOrder);

        v17 = objc_msgSend(v15, sel_template);
        v105 = objc_msgSend(v17, sel_displayOrder);

        v9 = v12 + 2;
        if (v12 + 2 < v3)
        {
          v18 = (id *)(v101 + 8 * v12);
          while (1)
          {
            v19 = *(v18 - 1);
            v20 = *v18;
            v21 = v19;
            v22 = objc_msgSend(v20, sel_template);
            v23 = objc_msgSend(v22, sel_displayOrder);

            v24 = objc_msgSend(v21, sel_template);
            v25 = objc_msgSend(v24, sel_displayOrder);

            if (v109 < v105 == v23 >= v25)
              break;
            ++v9;
            ++v18;
            v3 = v107;
            if (v107 == v9)
            {
              v9 = v107;
              goto LABEL_22;
            }
          }
          v3 = v107;
LABEL_22:
          v12 = v108;
        }
        v8 = v103;
        v10 = v112;
        if (v109 < v105)
        {
          if (v9 < v12)
            goto LABEL_133;
          if (v12 < v9)
          {
            v26 = (uint64_t *)(v100 + 8 * v9);
            v27 = v9;
            v28 = v12;
            v29 = (uint64_t *)(v112 + 8 * v12);
            do
            {
              if (v28 != --v27)
              {
                if (!v112)
                  goto LABEL_138;
                v30 = *v29;
                *v29 = *v26;
                *v26 = v30;
              }
              ++v28;
              --v26;
              ++v29;
            }
            while (v28 < v27);
          }
        }
      }
      if (v9 < v3)
      {
        if (__OFSUB__(v9, v12))
          goto LABEL_130;
        if (v9 - v12 < v102)
        {
          if (__OFADD__(v12, v102))
            goto LABEL_134;
          if (v12 + v102 >= v3)
            v31 = v3;
          else
            v31 = v12 + v102;
          if (v31 < v12)
          {
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
            return;
          }
          if (v9 != v31)
          {
            v104 = v8;
            v106 = v31;
            v32 = v100 + 8 * v9;
            do
            {
              v33 = *(void **)(v10 + 8 * v9);
              v34 = v12;
              v110 = v32;
              while (1)
              {
                v35 = *(void **)v32;
                v36 = v33;
                v37 = v35;
                v38 = objc_msgSend(v36, sel_template);
                v39 = objc_msgSend(v38, sel_displayOrder);

                v40 = objc_msgSend(v37, sel_template);
                v41 = objc_msgSend(v40, sel_displayOrder);

                if (v39 >= v41)
                  break;
                v10 = v112;
                if (!v112)
                  goto LABEL_136;
                v42 = *(void **)v32;
                v33 = *(void **)(v32 + 8);
                *(_QWORD *)v32 = v33;
                *(_QWORD *)(v32 + 8) = v42;
                v32 -= 8;
                if (v9 == ++v34)
                  goto LABEL_42;
              }
              v10 = v112;
LABEL_42:
              ++v9;
              v12 = v108;
              v32 = v110 + 8;
            }
            while (v9 != v106);
            v9 = v106;
            v8 = v104;
          }
        }
      }
      if (v9 < v12)
        goto LABEL_125;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_21CC33428(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      v44 = *((_QWORD *)v8 + 2);
      v43 = *((_QWORD *)v8 + 3);
      v11 = v44 + 1;
      v10 = v112;
      if (v44 >= v43 >> 1)
      {
        v92 = sub_21CC33428((char *)(v43 > 1), v44 + 1, 1, v8);
        v10 = v112;
        v8 = v92;
      }
      *((_QWORD *)v8 + 2) = v11;
      v45 = v8 + 32;
      v46 = &v8[16 * v44 + 32];
      *(_QWORD *)v46 = v12;
      *((_QWORD *)v46 + 1) = v9;
      if (v44)
      {
        while (1)
        {
          v47 = v11 - 1;
          if (v11 >= 4)
          {
            v52 = &v45[16 * v11];
            v53 = *((_QWORD *)v52 - 8);
            v54 = *((_QWORD *)v52 - 7);
            v58 = __OFSUB__(v54, v53);
            v55 = v54 - v53;
            if (v58)
              goto LABEL_114;
            v57 = *((_QWORD *)v52 - 6);
            v56 = *((_QWORD *)v52 - 5);
            v58 = __OFSUB__(v56, v57);
            v50 = v56 - v57;
            v51 = v58;
            if (v58)
              goto LABEL_115;
            v59 = v11 - 2;
            v60 = &v45[16 * v11 - 32];
            v62 = *(_QWORD *)v60;
            v61 = *((_QWORD *)v60 + 1);
            v58 = __OFSUB__(v61, v62);
            v63 = v61 - v62;
            if (v58)
              goto LABEL_116;
            v58 = __OFADD__(v50, v63);
            v64 = v50 + v63;
            if (v58)
              goto LABEL_118;
            if (v64 >= v55)
            {
              v82 = &v45[16 * v47];
              v84 = *(_QWORD *)v82;
              v83 = *((_QWORD *)v82 + 1);
              v58 = __OFSUB__(v83, v84);
              v85 = v83 - v84;
              if (v58)
                goto LABEL_124;
              v75 = v50 < v85;
              goto LABEL_86;
            }
          }
          else
          {
            if (v11 != 3)
            {
              v76 = *((_QWORD *)v8 + 4);
              v77 = *((_QWORD *)v8 + 5);
              v58 = __OFSUB__(v77, v76);
              v69 = v77 - v76;
              v70 = v58;
              goto LABEL_80;
            }
            v49 = *((_QWORD *)v8 + 4);
            v48 = *((_QWORD *)v8 + 5);
            v58 = __OFSUB__(v48, v49);
            v50 = v48 - v49;
            v51 = v58;
          }
          if ((v51 & 1) != 0)
            goto LABEL_117;
          v59 = v11 - 2;
          v65 = &v45[16 * v11 - 32];
          v67 = *(_QWORD *)v65;
          v66 = *((_QWORD *)v65 + 1);
          v68 = __OFSUB__(v66, v67);
          v69 = v66 - v67;
          v70 = v68;
          if (v68)
            goto LABEL_119;
          v71 = &v45[16 * v47];
          v73 = *(_QWORD *)v71;
          v72 = *((_QWORD *)v71 + 1);
          v58 = __OFSUB__(v72, v73);
          v74 = v72 - v73;
          if (v58)
            goto LABEL_121;
          if (__OFADD__(v69, v74))
            goto LABEL_123;
          if (v69 + v74 >= v50)
          {
            v75 = v50 < v74;
LABEL_86:
            if (v75)
              v47 = v59;
            goto LABEL_88;
          }
LABEL_80:
          if ((v70 & 1) != 0)
            goto LABEL_120;
          v78 = &v45[16 * v47];
          v80 = *(_QWORD *)v78;
          v79 = *((_QWORD *)v78 + 1);
          v58 = __OFSUB__(v79, v80);
          v81 = v79 - v80;
          if (v58)
            goto LABEL_122;
          if (v81 < v69)
            goto LABEL_14;
LABEL_88:
          v86 = v47 - 1;
          if (v47 - 1 >= v11)
          {
            __break(1u);
LABEL_111:
            __break(1u);
LABEL_112:
            __break(1u);
LABEL_113:
            __break(1u);
LABEL_114:
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
            goto LABEL_135;
          }
          if (!v10)
            goto LABEL_137;
          v87 = &v45[16 * v86];
          v88 = *(_QWORD *)v87;
          v89 = &v45[16 * v47];
          v90 = *((_QWORD *)v89 + 1);
          sub_21CC3D030((void **)(v10 + 8 * *(_QWORD *)v87), (id *)(v10 + 8 * *(_QWORD *)v89), v10 + 8 * v90, v111);
          if (v1)
            goto LABEL_108;
          if (v90 < v88)
            goto LABEL_111;
          if (v47 > *((_QWORD *)v8 + 2))
            goto LABEL_112;
          *(_QWORD *)v87 = v88;
          *(_QWORD *)&v45[16 * v86 + 8] = v90;
          v91 = *((_QWORD *)v8 + 2);
          if (v47 >= v91)
            goto LABEL_113;
          v11 = v91 - 1;
          memmove(&v45[16 * v47], v89 + 16, 16 * (v91 - 1 - v47));
          *((_QWORD *)v8 + 2) = v91 - 1;
          v10 = v112;
          if (v91 <= 2)
            goto LABEL_14;
        }
      }
      v11 = 1;
LABEL_14:
      v3 = v107;
      if (v9 >= v107)
        goto LABEL_97;
    }
  }
  v8 = (char *)MEMORY[0x24BEE4AF8];
  v113 = MEMORY[0x24BEE4AF8];
  v111 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
  if (v3 == 1)
    goto LABEL_12;
  v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_97:
  if (v11 >= 2)
  {
    v93 = *v99;
    do
    {
      v94 = v11 - 2;
      if (v11 < 2)
        goto LABEL_126;
      if (!v93)
        goto LABEL_139;
      v95 = *(_QWORD *)&v8[16 * v94 + 32];
      v96 = *(_QWORD *)&v8[16 * v11 + 24];
      sub_21CC3D030((void **)(v93 + 8 * v95), (id *)(v93 + 8 * *(_QWORD *)&v8[16 * v11 + 16]), v93 + 8 * v96, v111);
      if (v1)
        break;
      if (v96 < v95)
        goto LABEL_127;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_21CC335C8((uint64_t)v8);
      if (v94 >= *((_QWORD *)v8 + 2))
        goto LABEL_128;
      v97 = &v8[16 * v94 + 32];
      *(_QWORD *)v97 = v95;
      *((_QWORD *)v97 + 1) = v96;
      v98 = *((_QWORD *)v8 + 2);
      if (v11 > v98)
        goto LABEL_129;
      memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v98 - v11));
      *((_QWORD *)v8 + 2) = v98 - 1;
      v11 = v98 - 1;
    }
    while (v98 > 2);
  }
LABEL_108:
  swift_bridgeObjectRelease();
  *(_QWORD *)((v113 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_21CC3F864();
  swift_bridgeObjectRelease();
}

void sub_21CC3C76C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v18;
  uint64_t v19;

  if (a3 != a2)
  {
    v4 = a3;
    v19 = *a4;
    v5 = *a4 + 8 * a3 - 8;
LABEL_5:
    v6 = *(void **)(v19 + 8 * v4);
    v7 = a1;
    v18 = v5;
    while (1)
    {
      v8 = *(void **)v5;
      v9 = v6;
      v10 = v8;
      v11 = objc_msgSend(v9, sel_template);
      v12 = objc_msgSend(v11, sel_displayOrder);

      v13 = objc_msgSend(v10, sel_template);
      v14 = objc_msgSend(v13, sel_displayOrder);

      if (v12 >= v14)
      {
LABEL_4:
        ++v4;
        v5 = v18 + 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
      if (!v19)
        break;
      v15 = *(void **)v5;
      v6 = *(void **)(v5 + 8);
      *(_QWORD *)v5 = v6;
      *(_QWORD *)(v5 + 8) = v15;
      v5 -= 8;
      if (v4 == ++v7)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_21CC3C8A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_21CC3FAA4(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_21CC3C96C(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  BOOL v16;
  char *v17;
  char *v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  int64_t v23;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 7;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[8 * v13] <= a4)
      memmove(a4, __src, 8 * v13);
    v14 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8)
      goto LABEL_39;
    v17 = (char *)(a3 - 8);
    v18 = v6;
    while (1)
    {
      v19 = v17 + 8;
      v21 = *((_QWORD *)v18 - 1);
      v18 -= 8;
      v20 = v21;
      if (*((_QWORD *)v14 - 1) < v21)
        break;
      v20 = *((_QWORD *)v14 - 1);
      v18 = v6;
      if (v19 != v14)
      {
        v14 -= 8;
LABEL_35:
        *(_QWORD *)v17 = v20;
        goto LABEL_36;
      }
      v22 = v17 >= v14;
      v14 -= 8;
      if (v22)
        goto LABEL_35;
LABEL_36:
      if (v18 > v7)
      {
        v17 -= 8;
        v6 = v18;
        if (v14 > v4)
          continue;
      }
      v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6)
      goto LABEL_36;
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[8 * v10] <= a4)
    memmove(a4, __dst, 8 * v10);
  v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      v15 = *(_QWORD *)v6;
      if (*(_QWORD *)v6 >= *(_QWORD *)v4)
        break;
      v16 = v7 == v6;
      v6 += 8;
      if (!v16)
        goto LABEL_16;
LABEL_17:
      v7 += 8;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v15 = *(_QWORD *)v4;
    v16 = v7 == v4;
    v4 += 8;
    if (v16)
      goto LABEL_17;
LABEL_16:
    *(_QWORD *)v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  v6 = v7;
LABEL_39:
  v23 = v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0);
  if (v6 != v4 || v6 >= &v4[v23 & 0xFFFFFFFFFFFFFFF8])
    memmove(v6, v4, 8 * (v23 >> 3));
  return 1;
}

__CFString *sub_21CC3CB6C(void **a1, id *a2, unint64_t a3, void **a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  void **v15;
  unint64_t v16;
  id *v17;
  void *v18;
  id v19;
  id v20;
  __CFString *result;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  BOOL v34;
  id *v35;
  id *v36;
  id *v37;
  void *v38;
  id *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void **v56;
  void **v57;
  id *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C978);
  MEMORY[0x24BDAC7A8]();
  v64 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0)
    v10 = (char *)a2 - (char *)a1;
  v11 = v10 >> 3;
  v59 = a3;
  v12 = a3 - (_QWORD)a2;
  v13 = v12 / 8;
  if (v10 >> 3 >= v12 / 8)
  {
    v57 = a1;
    if (a4 != a2 || &a2[v13] <= a4)
      memmove(a4, a2, 8 * v13);
    v15 = &a4[v13];
    if (v57 >= a2 || v12 < 8)
      goto LABEL_45;
    v55 = v4;
    v56 = a4;
    v35 = (id *)(v59 - 8);
    while (1)
    {
      v59 = (unint64_t)v15;
      v36 = v15 - 1;
      v37 = a2;
      v39 = a2 - 1;
      v38 = *(a2 - 1);
      v40 = *(v15 - 1);
      v41 = v38;
      result = AAUILocalizedModalityForAchievement(v40);
      if (!result)
        goto LABEL_51;
      v42 = result;
      v43 = sub_21CC3F7B0();
      v45 = v44;

      v62 = v43;
      v63 = v45;
      result = AAUILocalizedModalityForAchievement(v41);
      if (!result)
      {
LABEL_52:
        __break(1u);
        return result;
      }
      v46 = result;
      v58 = v35 + 1;
      v47 = sub_21CC3F7B0();
      v49 = v48;

      v60 = v47;
      v61 = v49;
      v50 = sub_21CC3F654();
      v51 = (uint64_t)v64;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v64, 1, 1, v50);
      sub_21CC19F6C();
      v52 = sub_21CC3F924();
      sub_21CC39E50(v51, &qword_25531C978);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (v52 == -1)
      {
        v15 = (void **)v59;
        if (v58 == v37)
        {
          a2 = v39;
          v53 = (unint64_t)v57;
          if (v35 < v37)
            goto LABEL_39;
          goto LABEL_38;
        }
        a2 = v39;
      }
      else
      {
        a2 = v37;
        v39 = v36;
        if (v58 == (id *)v59)
        {
          v15 = v36;
          v53 = (unint64_t)v57;
          if ((unint64_t)v35 < v59)
            goto LABEL_39;
          goto LABEL_38;
        }
        v15 = v36;
      }
      v53 = (unint64_t)v57;
LABEL_38:
      *v35 = *v39;
LABEL_39:
      if ((unint64_t)a2 <= v53)
      {
        a4 = v56;
        goto LABEL_45;
      }
      --v35;
      a4 = v56;
      if (v15 <= v56)
        goto LABEL_45;
    }
  }
  v14 = a1;
  if (a4 != a1 || &a1[v11] <= a4)
    memmove(a4, a1, 8 * v11);
  v15 = &a4[v11];
  if ((unint64_t)a2 < v59 && (char *)a2 - (char *)a1 >= 8)
  {
    v55 = v4;
    while (1)
    {
      v16 = (unint64_t)v15;
      v17 = a2;
      v18 = *a4;
      v19 = *a2;
      v20 = v18;
      result = AAUILocalizedModalityForAchievement(v19);
      if (!result)
      {
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
        goto LABEL_52;
      }
      v22 = result;
      v23 = sub_21CC3F7B0();
      v25 = v24;

      v62 = v23;
      v63 = v25;
      result = AAUILocalizedModalityForAchievement(v20);
      if (!result)
        goto LABEL_50;
      v26 = result;
      v27 = sub_21CC3F7B0();
      v29 = v28;

      v60 = v27;
      v61 = v29;
      v30 = sub_21CC3F654();
      v31 = (uint64_t)v64;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v64, 1, 1, v30);
      sub_21CC19F6C();
      v32 = sub_21CC3F924();
      sub_21CC39E50(v31, &qword_25531C978);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (v32 != -1)
        break;
      v33 = v17;
      a2 = v17 + 1;
      if (v14 != v17)
        goto LABEL_14;
LABEL_15:
      ++v14;
      v15 = (void **)v16;
      if ((unint64_t)a4 >= v16 || (unint64_t)a2 >= v59)
      {
        a2 = v14;
        goto LABEL_45;
      }
    }
    v33 = a4;
    v34 = v14 == a4++;
    a2 = v17;
    if (v34)
      goto LABEL_15;
LABEL_14:
    *v14 = *v33;
    goto LABEL_15;
  }
  a2 = a1;
LABEL_45:
  if (a2 != a4
    || a2 >= (void **)((char *)a4
                     + (((char *)v15 - (char *)a4 + ((char *)v15 - (char *)a4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(a2, a4, 8 * (v15 - a4));
  }
  return (__CFString *)1;
}

uint64_t sub_21CC3D030(void **__dst, id *__src, unint64_t a3, void **a4)
{
  id *v5;
  void **v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void **v14;
  void *v15;
  id v16;
  id *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void **v23;
  BOOL v24;
  id *v25;
  char *v26;
  id *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void **v40;
  void **v41;
  id *v43;
  char *v44;
  char *v45;

  v5 = __src;
  v6 = __dst;
  v7 = (char *)__src - (char *)__dst;
  v8 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0)
    v8 = (char *)__src - (char *)__dst;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)__src;
  v11 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v11 = a3 - (_QWORD)__src;
  v12 = v11 >> 3;
  if (v9 >= v11 >> 3)
  {
    v14 = a4;
    if (a4 != __src || &__src[v12] <= a4)
      memmove(a4, __src, 8 * v12);
    v13 = (char *)&a4[v12];
    if (v6 >= v5 || v10 < 8)
      goto LABEL_40;
    v25 = (id *)(a3 - 8);
    v40 = v6;
    v41 = a4;
    while (1)
    {
      v45 = v13;
      v43 = v25 + 1;
      v26 = v13 - 8;
      v27 = v5 - 1;
      v28 = *(v5 - 1);
      v29 = *((id *)v13 - 1);
      v30 = v28;
      v31 = objc_msgSend(v29, sel_template);
      v32 = objc_msgSend(v31, sel_displayOrder);

      v33 = objc_msgSend(v30, sel_template);
      v34 = objc_msgSend(v33, sel_displayOrder);

      if (v32 >= v34)
        break;
      v13 = v45;
      v35 = (unint64_t)v40;
      if (v43 != v5)
      {
        --v5;
        goto LABEL_36;
      }
      v36 = v25 >= v5--;
      v14 = v41;
      if (v36)
        goto LABEL_37;
LABEL_38:
      if ((unint64_t)v5 > v35)
      {
        --v25;
        if (v13 > (char *)v14)
          continue;
      }
      goto LABEL_40;
    }
    v35 = (unint64_t)v40;
    if (v43 == (id *)v45)
    {
      v27 = (id *)v26;
      v13 = v26;
      v14 = v41;
      if (v25 < (id *)v45)
        goto LABEL_38;
    }
    else
    {
      v27 = (id *)v26;
      v13 = v26;
LABEL_36:
      v14 = v41;
    }
LABEL_37:
    *v25 = *v27;
    goto LABEL_38;
  }
  if (a4 != __dst || &__dst[v9] <= a4)
    memmove(a4, __dst, 8 * v9);
  v13 = (char *)&a4[v9];
  v14 = a4;
  if ((unint64_t)v5 < a3 && v7 >= 8)
  {
    v44 = v13;
    while (1)
    {
      v15 = *v14;
      v16 = *v5;
      v17 = v5;
      v18 = v15;
      v19 = objc_msgSend(v16, sel_template);
      v20 = objc_msgSend(v19, sel_displayOrder);

      v21 = objc_msgSend(v18, sel_template);
      v22 = objc_msgSend(v21, sel_displayOrder);

      if (v20 >= v22)
        break;
      v23 = v17;
      v5 = v17 + 1;
      if (v6 != v17)
        goto LABEL_16;
LABEL_17:
      ++v6;
      v13 = v44;
      if (v14 >= (void **)v44 || (unint64_t)v5 >= a3)
        goto LABEL_19;
    }
    v23 = v14;
    v24 = v6 == v14++;
    v5 = v17;
    if (v24)
      goto LABEL_17;
LABEL_16:
    *v6 = *v23;
    goto LABEL_17;
  }
LABEL_19:
  v5 = v6;
LABEL_40:
  v37 = v13 - (char *)v14;
  v38 = v13 - (char *)v14 + 7;
  if (v37 < 0)
    v37 = v38;
  if (v5 != v14 || v5 >= (void **)((char *)v14 + (v37 & 0xFFFFFFFFFFFFFFF8)))
    memmove(v5, v14, 8 * (v37 >> 3));
  return 1;
}

uint64_t sub_21CC3D380(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  BOOL v20;
  BOOL v21;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 15;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 15;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4)
      memmove(a4, __src, 16 * v13);
    v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16)
      goto LABEL_48;
    v17 = (char *)(a3 - 16);
    while (1)
    {
      v18 = v17 + 16;
      v19 = v6 - 16;
      v20 = *((_QWORD *)v14 - 2) == *((_QWORD *)v6 - 2) && *((_QWORD *)v14 - 1) == *((_QWORD *)v6 - 1);
      if (v20 || (sub_21CC3FAA4() & 1) == 0)
      {
        v19 = v14 - 16;
        if (v18 != v14)
        {
          v14 -= 16;
LABEL_45:
          *(_OWORD *)v17 = *(_OWORD *)v19;
          goto LABEL_46;
        }
        v21 = v17 >= v14;
        v14 -= 16;
        if (v21)
          goto LABEL_45;
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 16;
          goto LABEL_45;
        }
        v21 = v17 >= v6;
        v6 -= 16;
        if (v21)
          goto LABEL_45;
      }
LABEL_46:
      if (v6 > v7)
      {
        v17 -= 16;
        if (v14 > v4)
          continue;
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4)
    memmove(a4, __dst, 16 * v10);
  v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v15 || (sub_21CC3FAA4() & 1) == 0)
        break;
      v16 = v6;
      v15 = v7 == v6;
      v6 += 16;
      if (!v15)
        goto LABEL_20;
LABEL_21:
      v7 += 16;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_23;
    }
    v16 = v4;
    v15 = v7 == v4;
    v4 += 16;
    if (v15)
      goto LABEL_21;
LABEL_20:
    *(_OWORD *)v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_23:
  v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0])
    memmove(v6, v4, 16 * ((v14 - v4) / 16));
  return 1;
}

uint64_t sub_21CC3D5AC(unsigned __int8 *__dst, unsigned __int8 *__src, unint64_t a3, unsigned __int8 *a4, char a5, _QWORD *a6)
{
  unsigned __int8 *v8;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  char v15;
  unsigned __int8 *v16;
  BOOL v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  char v20;
  unsigned __int8 *v21;
  BOOL v22;
  size_t v23;
  unsigned __int8 *v24;
  uint64_t v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;

  v8 = a4;
  v10 = __src;
  v11 = __dst;
  v12 = __src - __dst;
  v13 = a3 - (_QWORD)__src;
  if (__src - __dst >= (uint64_t)(a3 - (_QWORD)__src))
  {
    if (a4 != __src || a3 <= (unint64_t)a4)
      memmove(a4, __src, a3 - (_QWORD)__src);
    v14 = &v8[v13];
    if (v11 >= v10 || v13 < 1)
      goto LABEL_38;
    v18 = (unsigned __int8 *)(a3 - 1);
    while (1)
    {
      v30 = *(v14 - 1);
      v19 = v10 - 1;
      v29 = *(v10 - 1);
      v20 = sub_21CC116E4(&v30, &v29, a5 & 1, a6);
      if (v26)
        goto LABEL_38;
      v21 = v18 + 1;
      if ((v20 & 1) != 0)
      {
        if (v21 != v10)
        {
          --v10;
LABEL_35:
          *v18 = *v19;
          goto LABEL_36;
        }
        v22 = v18 >= v10--;
        if (v22)
          goto LABEL_35;
      }
      else
      {
        v19 = v14 - 1;
        if (v21 != v14)
        {
          --v14;
          goto LABEL_35;
        }
        v22 = v18 >= v14--;
        if (v22)
          goto LABEL_35;
      }
LABEL_36:
      if (v10 > v11)
      {
        --v18;
        if (v14 > v8)
          continue;
      }
      goto LABEL_38;
    }
  }
  if (a4 != __dst || __src <= a4)
    memmove(a4, __dst, v12);
  v14 = &v8[v12];
  if ((unint64_t)v10 < a3 && v12 >= 1)
  {
    while (1)
    {
      v28 = *v10;
      v27 = *v8;
      v15 = sub_21CC116E4(&v28, &v27, a5 & 1, a6);
      if (v26)
      {
        v23 = v14 - v8;
        if (v11 < v8 || v11 >= v14 || v11 != v8)
        {
          v24 = v11;
LABEL_42:
          memmove(v24, v8, v23);
        }
        goto LABEL_43;
      }
      if ((v15 & 1) == 0)
        break;
      v16 = v10;
      v17 = v11 == v10++;
      if (!v17)
        goto LABEL_13;
LABEL_14:
      ++v11;
      if (v8 >= v14 || (unint64_t)v10 >= a3)
        goto LABEL_16;
    }
    v16 = v8;
    v17 = v11 == v8++;
    if (v17)
      goto LABEL_14;
LABEL_13:
    *v11 = *v16;
    goto LABEL_14;
  }
LABEL_16:
  v10 = v11;
LABEL_38:
  v23 = v14 - v8;
  if (v10 < v8 || v10 >= v14 || v10 != v8)
  {
    v24 = v10;
    goto LABEL_42;
  }
LABEL_43:

  return 1;
}

unint64_t sub_21CC3D7F4(uint64_t a1, uint64_t a2)
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

uint64_t sub_21CC3D890(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  char v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C970);
  v34 = a2;
  result = sub_21CC3FA38();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v33 = v3;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v20 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v21 = v20 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1))
          goto LABEL_40;
        if (v8 >= v13)
        {
LABEL_31:
          if ((v34 & 1) == 0)
          {
            result = swift_release();
            v3 = v33;
            goto LABEL_38;
          }
          v32 = 1 << *(_BYTE *)(v5 + 32);
          if (v32 >= 64)
            bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v9 = -1 << v32;
          v3 = v33;
          *(_QWORD *)(v5 + 16) = 0;
          break;
        }
        v23 = v9[v8];
        if (!v23)
        {
          v24 = v8 + 1;
          if (v8 + 1 >= v13)
            goto LABEL_31;
          v23 = v9[v24];
          if (!v23)
          {
            while (1)
            {
              v8 = v24 + 1;
              if (__OFADD__(v24, 1))
                break;
              if (v8 >= v13)
                goto LABEL_31;
              v23 = v9[v8];
              ++v24;
              if (v23)
                goto LABEL_20;
            }
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_20:
        v12 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v8 << 6);
      }
      v25 = 8 * v21;
      v26 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v25);
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v25);
      if ((v34 & 1) == 0)
        swift_bridgeObjectRetain();
      result = sub_21CC3FAD4();
      v15 = -1 << *(_BYTE *)(v7 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v17 == v29;
          if (v17 == v29)
            v17 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v17);
        }
        while (v31 == -1);
        v18 = __clz(__rbit64(~v31)) + (v17 << 6);
      }
      *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v26;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v27;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

void *sub_21CC3DB40()
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
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C970);
  v2 = *v0;
  v3 = sub_21CC3FA2C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    if (!v19)
      break;
LABEL_23:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v20 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

_QWORD *sub_21CC3DCC8(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_21CC3DDDC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21CC3DCE4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25531C980);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

_QWORD *sub_21CC3DDDC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C960);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531C968);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_21CC3DEFC(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_21CC3E090(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  _QWORD *v20;
  uint64_t v21;

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
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
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

char *sub_21CC3E28C(uint64_t a1)
{
  return sub_21CC3DCE4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_21CC3E2A0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531C970);
  v3 = (_QWORD *)sub_21CC3FA44();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_21CC3AC7C(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_bridgeObjectRetain();
    result = sub_21CC3AC7C(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21CC3E39C(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char **v5;
  char **v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  char v12;
  char **v13;
  id v14;
  char **v15;
  id v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  id v44;
  uint64_t v45;
  uint64_t result;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;

  v54 = MEMORY[0x24BEE4AF8];
  v2 = sub_21CC3E2A0(MEMORY[0x24BEE4AF8]);
  if (a1 >> 62)
    goto LABEL_29;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_21CC3FA14())
  {
    if (v3 < 1)
      goto LABEL_58;
    v4 = 0;
    v48 = a1;
    v50 = a1 & 0xC000000000000001;
    v5 = &selRef_shallowCopyReplacingEarnedInstances_;
    v6 = &selRef_URLForResource_withExtension_;
    v47 = v3;
    while (1)
    {
      if (v50)
        v7 = (id)MEMORY[0x220788B18](v4, a1);
      else
        v7 = *(id *)(a1 + 8 * v4 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, v5[33]);
      v10 = objc_msgSend(v9, v6[202]);

      if (*(_QWORD *)(v2 + 16) && (v11 = sub_21CC3AC7C((uint64_t)v10), (v12 & 1) != 0))
      {
        v53 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v11);
        swift_bridgeObjectRetain();
      }
      else
      {
        v53 = MEMORY[0x24BEE4AF8];
      }
      a1 = v8;
      MEMORY[0x2207889BC]();
      if (*(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_21CC3F870();
      sub_21CC3F888();
      sub_21CC3F864();
      v13 = v5;
      v14 = objc_msgSend((id)a1, v5[33]);
      v15 = v6;
      v16 = objc_msgSend(v14, v6[202]);

      v17 = v53;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v52 = (_QWORD *)v2;
      v19 = sub_21CC3AC7C((uint64_t)v16);
      v21 = v2;
      v2 = v19;
      v22 = *(_QWORD *)(v21 + 16);
      v23 = (v20 & 1) == 0;
      v24 = v22 + v23;
      if (__OFADD__(v22, v23))
        break;
      v25 = v20;
      if (*(_QWORD *)(v21 + 24) >= v24)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v28 = v52;
          if ((v20 & 1) != 0)
            goto LABEL_5;
        }
        else
        {
          sub_21CC3DB40();
          v28 = v52;
          if ((v25 & 1) != 0)
            goto LABEL_5;
        }
      }
      else
      {
        sub_21CC3D890(v24, isUniquelyReferenced_nonNull_native);
        v26 = sub_21CC3AC7C((uint64_t)v16);
        if ((v25 & 1) != (v27 & 1))
          goto LABEL_59;
        v2 = v26;
        v28 = v52;
        if ((v25 & 1) != 0)
        {
LABEL_5:
          *(_QWORD *)(v28[7] + 8 * v2) = v53;
          swift_bridgeObjectRelease();
          v2 = (unint64_t)v28;
          goto LABEL_6;
        }
      }
      v28[(v2 >> 6) + 8] |= 1 << v2;
      v29 = 8 * v2;
      *(_QWORD *)(v28[6] + v29) = v16;
      *(_QWORD *)(v28[7] + v29) = v17;
      v30 = v28[2];
      v31 = __OFADD__(v30, 1);
      v32 = v30 + 1;
      if (v31)
        goto LABEL_28;
      v2 = (unint64_t)v28;
      v28[2] = v32;
LABEL_6:

      swift_bridgeObjectRelease();
      ++v4;
      a1 = v48;
      v5 = v13;
      v6 = v15;
      if (v47 == v4)
        goto LABEL_30;
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_bridgeObjectRetain();
  }
LABEL_30:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  v33 = sub_21CC3AD9C(v2);
  swift_bridgeObjectRelease();
  v53 = (uint64_t)v33;
  sub_21CC15D7C(&v53, (uint64_t (*)(uint64_t))sub_21CC3E28C, sub_21CC3AE80);
  swift_bridgeObjectRelease();
  v34 = *(_QWORD *)(v53 + 16);
  if (!v34)
  {
    swift_release();
    v45 = MEMORY[0x24BEE4AF8];
LABEL_56:
    swift_bridgeObjectRelease();
    return v45;
  }
  v35 = v53 + 32;
  swift_retain();
  v36 = 0;
  v49 = v35;
  v51 = v34;
  while (1)
  {
    if (!*(_QWORD *)(v2 + 16))
      goto LABEL_33;
    v37 = sub_21CC3AC7C(*(_QWORD *)(v35 + 8 * v36));
    if ((v38 & 1) == 0)
      goto LABEL_33;
    v39 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v37);
    if ((v39 & 0x8000000000000000) != 0 || (v39 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain_n();
      v40 = (uint64_t)sub_21CC33334(v39);
      swift_bridgeObjectRelease();
    }
    else
    {
      v40 = v39 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n();
    }
    v53 = v40;
    sub_21CC3ACAC(&v53);
    swift_bridgeObjectRelease();
    v41 = v53;
    if (v53 < 0 || (v53 & 0x4000000000000000) != 0)
      break;
    v42 = *(_QWORD *)(v53 + 16);
    swift_retain();
    if (v42)
      goto LABEL_42;
LABEL_32:
    swift_release_n();
    v35 = v49;
    v34 = v51;
LABEL_33:
    if (++v36 == v34)
    {
      swift_release_n();
      v45 = v54;
      goto LABEL_56;
    }
  }
  swift_retain();
  v42 = sub_21CC3FA14();
  if (!v42)
    goto LABEL_32;
LABEL_42:
  if (v42 >= 1)
  {
    for (i = 0; i != v42; ++i)
    {
      if ((v41 & 0xC000000000000001) != 0)
        MEMORY[0x220788B18](i, v41);
      else
        v44 = *(id *)(v41 + 8 * i + 32);
      MEMORY[0x2207889BC]();
      if (*(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_21CC3F870();
      sub_21CC3F888();
      sub_21CC3F864();
    }
    goto LABEL_32;
  }
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  sub_21CC3FAC8();
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_21CC3E8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531C940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CC3E904(void **__src, void **__dst, unint64_t a3, void **a4)
{
  void **v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  char *v13;
  void **v14;
  void *v15;
  void **v16;
  id v17;
  id v18;
  uint64_t v19;
  void **v20;
  BOOL v21;
  void **v22;
  void **v23;
  char *v24;
  void **v25;
  void *v26;
  void **v27;
  char *v28;
  id v29;
  id v30;
  uint64_t v31;
  BOOL v32;
  unint64_t v33;
  void **v35;
  void **v36;
  void **v38;

  v5 = __src;
  v6 = (char *)__dst - (char *)__src;
  v7 = (char *)__dst - (char *)__src + 7;
  if ((char *)__dst - (char *)__src >= 0)
    v7 = (char *)__dst - (char *)__src;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)__dst;
  v10 = a3 - (_QWORD)__dst + 7;
  if ((uint64_t)(a3 - (_QWORD)__dst) >= 0)
    v10 = a3 - (_QWORD)__dst;
  v11 = v10 >> 3;
  if (v8 >= v10 >> 3)
  {
    v14 = a4;
    if (a4 != __dst || &__dst[v11] <= a4)
    {
      v22 = __dst;
      memmove(a4, __dst, 8 * v11);
      __dst = v22;
    }
    v13 = (char *)&a4[v11];
    if (v5 >= __dst || v9 < 8)
      goto LABEL_40;
    v23 = (void **)(a3 - 8);
    v35 = v5;
    v36 = a4;
    while (1)
    {
      v38 = v23 + 1;
      v24 = v13 - 8;
      v25 = __dst - 1;
      v26 = *(__dst - 1);
      v27 = __dst;
      v28 = v13;
      v29 = *((id *)v13 - 1);
      v30 = v26;
      v31 = sub_21CC39FFC(v29, v30);

      if (v31 == -1)
        break;
      v25 = (void **)v24;
      if (v38 != (void **)v28)
      {
        v13 = v24;
        v33 = (unint64_t)v35;
        v14 = v36;
        __dst = v27;
LABEL_35:
        *v23 = *v25;
        goto LABEL_36;
      }
      v32 = v23 >= (void **)v28;
      v13 = v24;
      v14 = v36;
      __dst = v27;
      v33 = (unint64_t)v35;
      if (v32)
        goto LABEL_35;
LABEL_36:
      if ((unint64_t)__dst > v33)
      {
        --v23;
        if (v13 > (char *)v14)
          continue;
      }
      goto LABEL_40;
    }
    if (v38 == v27)
    {
      __dst = v25;
      v14 = v36;
      v13 = v28;
      v33 = (unint64_t)v35;
      if (v23 < v27)
        goto LABEL_36;
    }
    else
    {
      __dst = v25;
      v13 = v28;
      v33 = (unint64_t)v35;
      v14 = v36;
    }
    goto LABEL_35;
  }
  if (a4 != __src || &__src[v8] <= a4)
  {
    v12 = __dst;
    memmove(a4, __src, 8 * v8);
    __dst = v12;
  }
  v13 = (char *)&a4[v8];
  v14 = a4;
  if ((unint64_t)__dst < a3 && v6 >= 8)
  {
    while (1)
    {
      v15 = *v14;
      v16 = __dst;
      v17 = *__dst;
      v18 = v15;
      v19 = sub_21CC39FFC(v17, v18);

      if (v19 != -1)
        break;
      v20 = v16;
      __dst = v16 + 1;
      if (v5 != v16)
        goto LABEL_13;
LABEL_14:
      ++v5;
      if (v14 >= (void **)v13 || (unint64_t)__dst >= a3)
        goto LABEL_39;
    }
    v20 = v14;
    v21 = v5 == v14++;
    __dst = v16;
    if (v21)
      goto LABEL_14;
LABEL_13:
    *v5 = *v20;
    goto LABEL_14;
  }
LABEL_39:
  __dst = v5;
LABEL_40:
  if (__dst != v14
    || __dst >= (void **)((char *)v14 + ((v13 - (char *)v14 + (v13 - (char *)v14 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(__dst, v14, 8 * ((v13 - (char *)v14) / 8));
  }
  return 1;
}

unint64_t sub_21CC3EBD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25531C8C8;
  if (!qword_25531C8C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531C8C0);
    result = MEMORY[0x220789664](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25531C8C8);
  }
  return result;
}

void AAUILocalizedActivityTypeForAchievement_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21CC08000, a2, v5, "Could not determine Localized activity type for achievement's template: %@", v6);

  OUTLINED_FUNCTION_2();
}

void AAUILocalizedModalityForAchievement_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21CC08000, a2, v5, "Could not localized Modality for template %@", v6);

  OUTLINED_FUNCTION_2();
}

uint64_t sub_21CC3F5B8()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_21CC3F5C4()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_21CC3F5D0()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_21CC3F5DC()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_21CC3F5E8()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_21CC3F5F4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21CC3F600()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21CC3F60C()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_21CC3F618()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21CC3F624()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21CC3F630()
{
  return MEMORY[0x24BDCE898]();
}

uint64_t sub_21CC3F63C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21CC3F648()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21CC3F654()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21CC3F660()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_21CC3F66C()
{
  return MEMORY[0x24BDCF128]();
}

uint64_t sub_21CC3F678()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_21CC3F684()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_21CC3F690()
{
  return MEMORY[0x24BDCF188]();
}

uint64_t sub_21CC3F69C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21CC3F6A8()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21CC3F6B4()
{
  return MEMORY[0x24BE01B48]();
}

uint64_t sub_21CC3F6C0()
{
  return MEMORY[0x24BE01B50]();
}

uint64_t sub_21CC3F6CC()
{
  return MEMORY[0x24BE01B58]();
}

uint64_t sub_21CC3F6D8()
{
  return MEMORY[0x24BE01B60]();
}

uint64_t sub_21CC3F6E4()
{
  return MEMORY[0x24BE01B70]();
}

uint64_t sub_21CC3F6F0()
{
  return MEMORY[0x24BE01B78]();
}

uint64_t sub_21CC3F6FC()
{
  return MEMORY[0x24BE01B80]();
}

uint64_t sub_21CC3F708()
{
  return MEMORY[0x24BE01B88]();
}

uint64_t sub_21CC3F714()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21CC3F720()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21CC3F72C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21CC3F738()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21CC3F744()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21CC3F750()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21CC3F75C()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_21CC3F768()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_21CC3F774()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21CC3F780()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_21CC3F78C()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_21CC3F798()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21CC3F7A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21CC3F7B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21CC3F7BC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21CC3F7C8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_21CC3F7D4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21CC3F7E0()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_21CC3F7EC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21CC3F7F8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21CC3F804()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_21CC3F810()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21CC3F81C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21CC3F828()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_21CC3F834()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21CC3F840()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21CC3F84C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21CC3F858()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21CC3F864()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21CC3F870()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21CC3F87C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21CC3F888()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21CC3F894()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21CC3F8A0()
{
  return MEMORY[0x24BEE1938]();
}

uint64_t sub_21CC3F8AC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21CC3F8B8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21CC3F8C4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21CC3F8D0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21CC3F8DC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21CC3F8E8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21CC3F8F4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21CC3F900()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21CC3F90C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21CC3F918()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_21CC3F924()
{
  return MEMORY[0x24BDD0620]();
}

uint64_t sub_21CC3F930()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21CC3F93C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21CC3F948()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21CC3F954()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21CC3F960()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21CC3F96C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21CC3F978()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21CC3F984()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_21CC3F990()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21CC3F99C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21CC3F9A8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21CC3F9B4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21CC3F9C0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21CC3F9CC()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21CC3F9D8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21CC3F9E4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21CC3F9F0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21CC3F9FC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21CC3FA08()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21CC3FA14()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21CC3FA20()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_21CC3FA2C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21CC3FA38()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21CC3FA44()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21CC3FA50()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21CC3FA5C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21CC3FA68()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_21CC3FA74()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21CC3FA80()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21CC3FA8C()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_21CC3FA98()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21CC3FAA4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21CC3FAB0()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_21CC3FABC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21CC3FAC8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21CC3FAD4()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_21CC3FAE0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21CC3FAEC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t ACHApplyBadgePropertiesToAchievement()
{
  return MEMORY[0x24BE01240]();
}

uint64_t ACHCompareYearMonthDayDateComponents()
{
  return MEMORY[0x24BE012E0]();
}

uint64_t ACHDateComponentsForYearMonthDay()
{
  return MEMORY[0x24BE012F0]();
}

uint64_t ACHFormatCount()
{
  return MEMORY[0x24BE01348]();
}

uint64_t ACHFormatDateWithStyle()
{
  return MEMORY[0x24BE01350]();
}

uint64_t ACHFormatDistance()
{
  return MEMORY[0x24BE01358]();
}

uint64_t ACHFormatDistanceWithUserUnit()
{
  return MEMORY[0x24BE01360]();
}

uint64_t ACHFormatDistanceWithUserUnitAndUnitStyle()
{
  return MEMORY[0x24BE01368]();
}

uint64_t ACHFormatDuration()
{
  return MEMORY[0x24BE01370]();
}

uint64_t ACHFormatEnergyUnit()
{
  return MEMORY[0x24BE01378]();
}

uint64_t ACHFormatEnergyWithUserUnit()
{
  return MEMORY[0x24BE01380]();
}

uint64_t ACHFormatEnergyWithUserUnitAndFormatterUnit()
{
  return MEMORY[0x24BE01388]();
}

uint64_t ACHFormatMinutes()
{
  return MEMORY[0x24BE01390]();
}

uint64_t ACHFormatMoveMinutes()
{
  return MEMORY[0x24BE01398]();
}

uint64_t ACHFormatNumberOfDays()
{
  return MEMORY[0x24BE013A0]();
}

uint64_t ACHFormatOrdinal()
{
  return MEMORY[0x24BE013A8]();
}

uint64_t ACHFormatPercent()
{
  return MEMORY[0x24BE013B0]();
}

uint64_t ACHHKQuantityWithValueAndUnit()
{
  return MEMORY[0x24BE013D0]();
}

uint64_t ACHLogAssets()
{
  return MEMORY[0x24BE01428]();
}

uint64_t ACHLogDefault()
{
  return MEMORY[0x24BE01450]();
}

uint64_t ACHLogMonthlyChallenges()
{
  return MEMORY[0x24BE01460]();
}

uint64_t ACHLogUI()
{
  return MEMORY[0x24BE01480]();
}

uint64_t ACHMonthlyChallengeTypeFromTemplateUniqueName()
{
  return MEMORY[0x24BE01510]();
}

uint64_t ACHMonthlyChallengeTypeMoveRingTemplate()
{
  return MEMORY[0x24BE01518]();
}

uint64_t ACHMonthlyChallengeTypeStandRingTemplate()
{
  return MEMORY[0x24BE01520]();
}

uint64_t ACHMonthlyChallengeTypeTotalDistanceTemplate()
{
  return MEMORY[0x24BE01528]();
}

uint64_t ACHMonthlyChallengeTypeTotalWorkoutsTemplate()
{
  return MEMORY[0x24BE01530]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x24BE01590]();
}

uint64_t ACHStartOfFitnessWeekBeforeDateInCalendar()
{
  return MEMORY[0x24BE015C8]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x24BE0FA58]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x24BE0FA68]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x24BE0FA70]();
}

uint64_t BestWorkoutEnergyBurnedTemplateForWorkoutActivityType()
{
  return MEMORY[0x24BE016C0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t DailyExerciseRecordTemplate()
{
  return MEMORY[0x24BE016C8]();
}

uint64_t DailyMoveRecordTemplate()
{
  return MEMORY[0x24BE016D0]();
}

uint64_t FIExperienceTypeWithHealthStore()
{
  return MEMORY[0x24BE32620]();
}

uint64_t FILocalizedNameForIndoorAgnosticActivityType()
{
  return MEMORY[0x24BE32718]();
}

uint64_t FIUILocaleIsRightToLeft()
{
  return MEMORY[0x24BE37868]();
}

uint64_t FirstWorkoutTemplateForWorkoutActivityType()
{
  return MEMORY[0x24BE01728]();
}

uint64_t FiveHundredMoveGoals()
{
  return MEMORY[0x24BE01730]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x24BDD2B28]();
}

uint64_t HundredMoveGoals()
{
  return MEMORY[0x24BE01768]();
}

uint64_t LongestMoveStreakTemplate()
{
  return MEMORY[0x24BE01770]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t MoveGoal200PercentTemplate()
{
  return MEMORY[0x24BE01780]();
}

uint64_t MoveGoal300PercentTemplate()
{
  return MEMORY[0x24BE01788]();
}

uint64_t MoveGoal400PercentTemplate()
{
  return MEMORY[0x24BE01790]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

uint64_t PerfectWeekAllTemplate()
{
  return MEMORY[0x24BE01880]();
}

uint64_t PerfectWeekExerciseTemplate()
{
  return MEMORY[0x24BE01888]();
}

uint64_t PerfectWeekMoveTemplate()
{
  return MEMORY[0x24BE01890]();
}

uint64_t PerfectWeekStandTemplate()
{
  return MEMORY[0x24BE01898]();
}

uint64_t SevenWorkoutWeekTemplate()
{
  return MEMORY[0x24BE018A8]();
}

uint64_t ThousandMoveGoals()
{
  return MEMORY[0x24BE018D0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BEBDE48]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BEBE6D0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x24BDD44F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x24BDAF8A8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

