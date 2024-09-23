uint64_t sub_21759B9C4()
{
  return swift_retain();
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

uint64_t dispatch thunk of ActivityAwardsQuery.deactivate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

id sub_21759BA44()
{
  uint64_t v0;

  return sub_21759D944(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21759BA5C()
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
  v6[1] = sub_21759BB94;
  return ((uint64_t (*)(uint64_t, void *, void *, void *))((char *)&dword_254EF9E00 + dword_254EF9E00))(v2, v3, v5, v4);
}

uint64_t sub_21759BAD4()
{
  return sub_2175A62D8();
}

uint64_t sub_21759BB30()
{
  uint64_t v0;

  return sub_21759C72C(*(char **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_21759BB48(_QWORD *a1)
{
  uint64_t v1;

  return sub_2175A4D30(a1, *(uint64_t (**)(_QWORD))(v1 + 16));
}

uint64_t sub_21759BB50(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_21759BB74(uint64_t a1)
{
  return sub_2175A5060(a1);
}

uint64_t sub_21759BB94()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21759BBDC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F58);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    if (a2)
    {
      v8 = a2;
      v9 = sub_2175A62C0();
      v11 = v10;

    }
    else
    {
      v9 = 0;
      v11 = 0xF000000000000000;
    }
    v12[0] = v9;
    v12[1] = v11;
    sub_21759BCA4((uint64_t)v12, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_21759BCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F23850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21759BCEC(uint64_t a1, void *a2, void *aBlock, void *a4)
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
    v9 = sub_2175A62C0();
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

uint64_t dispatch thunk of ActivityAwardsQuery.activate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t sub_21759BDA4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v1 = v0;
  v2 = sub_2175A6398();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6374();
  v6 = sub_2175A638C();
  v7 = sub_2175A6440();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21759A000, v6, v7, "[ActivityAwardsQuery] activate", v8, 2u);
    MEMORY[0x219A0E1AC](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = sub_2175A63B0();
  v11 = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v1;
  v13 = v1;
  sub_21759CC24(v9, v11, (uint64_t)sub_21759D8E8, v12);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_21759BF08(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_21759BF7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t sub_21759BF90(uint64_t a1, uint64_t a2)
{
  return sub_21759BF7C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21759D010);
}

uint64_t sub_21759BF9C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21759BFB0(a1, a2);
  return a1;
}

uint64_t sub_21759BFB0(uint64_t a1, unint64_t a2)
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

uint64_t sub_21759BFF4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(void **)(v0 + 24);
  v4 = sub_2175A6320();
  v6 = v5;

  sub_21759C0F8(v2, v1);
  if (v6 >> 60 == 15)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v7 = sub_2175A62B4();
    sub_21759C0F8(v4, v6);
    v8 = (void *)v7;
  }
  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 32);
  v9[2](v9, v7, 0);

  _Block_release(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21759C0F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21759C10C(a1, a2);
  return a1;
}

uint64_t sub_21759C10C(uint64_t a1, unint64_t a2)
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

uint64_t sub_21759C284(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F238B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A0E11C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

id ActivityAwardsQuery.init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8;

  v8 = sub_21759C388(a1, a2, a3, a4, a5, a6, a7, a8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v8;
}

id sub_21759C388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  objc_super v23;

  *(_QWORD *)&v8[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection] = 0;
  sub_2175A62F0();
  swift_allocObject();
  v17 = v8;
  *(_QWORD *)&v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_lock] = sub_2175A62E4();
  v18 = &v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_initialAwardsHandler];
  *(_QWORD *)v18 = a1;
  *((_QWORD *)v18 + 1) = a2;
  v19 = &v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_addedAwardsHandler];
  *(_QWORD *)v19 = a3;
  *((_QWORD *)v19 + 1) = a4;
  v20 = &v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_removedAwardsHandler];
  *(_QWORD *)v20 = a5;
  *((_QWORD *)v20 + 1) = a6;
  v21 = &v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_updatedAwardsHandler];
  *(_QWORD *)v21 = a7;
  *((_QWORD *)v21 + 1) = a8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  v23.receiver = v17;
  v23.super_class = (Class)type metadata accessor for ActivityAwardsQuery();
  return objc_msgSendSuper2(&v23, sel_init);
}

uint64_t type metadata accessor for BaseQuery()
{
  return objc_opt_self();
}

uint64_t sub_21759C534(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_21759C560(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_2175A6398();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6368();
  swift_bridgeObjectRetain_n();
  v10 = sub_2175A638C();
  v11 = sub_2175A6440();
  if (os_log_type_enabled(v10, v11))
  {
    v17 = a3;
    v12 = swift_slowAlloc();
    v18 = v6;
    v13 = a1;
    v14 = (uint8_t *)v12;
    v15 = swift_slowAlloc();
    v20 = v15;
    *(_DWORD *)v14 = 136446210;
    swift_bridgeObjectRetain();
    v19 = sub_21759D624(v13, a2, &v20);
    sub_2175A644C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21759A000, v10, v11, v17, v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A0E1AC](v15, -1, -1);
    MEMORY[0x219A0E1AC](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v18);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_21759C72C(char *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  _QWORD v37[2];
  uint64_t aBlock[6];
  uint64_t v39;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F238B8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2175A6398();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)&a1[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection];
  *(_QWORD *)&a1[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection] = a2;
  v13 = a2;

  aBlock[4] = (uint64_t)sub_2175A5798;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21759ED74;
  aBlock[3] = (uint64_t)&block_descriptor_4;
  v14 = _Block_copy(aBlock);
  v15 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v14);
  _Block_release(v14);
  sub_2175A6464();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v16 = v39;
    sub_2175A6410();
    v17 = sub_2175A6428();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v7, 0, 1, v17);
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = v16;
    v18[5] = a1;
    swift_unknownObjectRetain();
    v19 = a1;
    sub_2175A4C04((uint64_t)v7, (uint64_t)&unk_254EFA028, (uint64_t)v18);
    swift_release();
    aBlock[0] = (uint64_t)v19;
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v19;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = sub_2175A6140;
    *(_QWORD *)(v21 + 24) = v20;
    type metadata accessor for ActivityAwardsQuery();
    sub_2175A635C();
    sub_21759DA20((unint64_t *)&unk_254EFA010, v22, (uint64_t (*)(uint64_t))type metadata accessor for ActivityAwardsQuery, (uint64_t)&protocol conformance descriptor for BaseQuery);
    v23 = v19;
    sub_2175A6308();
    swift_release();
    aBlock[0] = (uint64_t)v23;
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = sub_2175A6184;
    *(_QWORD *)(v25 + 24) = v24;
    v26 = v23;
    sub_2175A6308();
    swift_release();
    aBlock[0] = (uint64_t)v26;
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = v26;
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = sub_21759BB74;
    *(_QWORD *)(v28 + 24) = v27;
    v29 = v26;
    sub_2175A6308();
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    sub_2175A6368();
    v31 = sub_2175A638C();
    v32 = sub_2175A6440();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v37[1] = v2;
      aBlock[0] = v34;
      *(_DWORD *)v33 = 136446210;
      v37[0] = v8;
      v35 = sub_2175A63B0();
      v39 = sub_21759D624(v35, v36, aBlock);
      sub_2175A644C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21759A000, v31, v32, "XPC client-side connection failed to get expected proxy type for %{public}s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v34, -1, -1);
      MEMORY[0x219A0E1AC](v33, -1, -1);

      return (*(uint64_t (**)(char *, _QWORD))(v9 + 8))(v11, v37[0]);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
}

uint64_t sub_21759CC24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _BYTE v35[32];
  uint64_t aBlock;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v32 = a3;
  v33 = a4;
  v7 = sub_2175A6398();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A63B0();
  v11 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v12 = (void *)sub_2175A63A4();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithMachServiceName_options_, v12, 0);

  v14 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_254EFBA08);
  objc_msgSend(v13, sel_setRemoteObjectInterface_, v14);

  v40 = sub_21759E370;
  v41 = 0;
  v15 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v37 = 1107296256;
  v38 = sub_21759C534;
  v39 = &block_descriptor_9;
  v16 = _Block_copy(&aBlock);
  objc_msgSend(v13, sel_setInvalidationHandler_, v16);
  _Block_release(v16);
  v40 = sub_21759E37C;
  v41 = 0;
  aBlock = v15;
  v37 = 1107296256;
  v38 = sub_21759C534;
  v39 = &block_descriptor_12;
  v17 = _Block_copy(&aBlock);
  objc_msgSend(v13, sel_setInterruptionHandler_, v17);
  _Block_release(v17);
  objc_msgSend(v13, sel_resume);
  v40 = sub_21759E388;
  v41 = 0;
  aBlock = v15;
  v37 = 1107296256;
  v38 = sub_21759ED74;
  v39 = &block_descriptor_15;
  v18 = _Block_copy(&aBlock);
  v19 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);
  sub_2175A6464();
  swift_unknownObjectRelease();
  sub_21759D6F4((uint64_t)v35, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C8);
  if (swift_dynamicCast())
  {
    v20 = v34;
    v21 = (void *)sub_2175A63A4();
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v4;
    v22[3] = a1;
    v23 = v32;
    v24 = v33;
    v22[4] = a2;
    v22[5] = v23;
    v22[6] = v24;
    v40 = (uint64_t (*)())sub_21759BF90;
    v41 = v22;
    aBlock = v15;
    v37 = 1107296256;
    v38 = sub_21759BF08;
    v39 = &block_descriptor_21;
    v25 = _Block_copy(&aBlock);
    v26 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v20, sel_createEndpointNamed_completion_, v21, v25);
    _Block_release(v25);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_2175A6368();
    v27 = sub_2175A638C();
    v28 = sub_2175A6440();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_21759A000, v27, v28, "Proxy does not conform to endpoint interface", v29, 2u);
      MEMORY[0x219A0E1AC](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
}

void sub_21759D010(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, void (*a6)(id), uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  _QWORD *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void (*v45)(id);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t aBlock;
  uint64_t v51;
  uint64_t (*v52)(uint64_t);
  void *v53;
  uint64_t (*v54)();
  uint64_t v55;
  uint64_t v56;

  v47 = a7;
  v56 = *MEMORY[0x24BDAC8D0];
  v13 = sub_2175A6398();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v43 - v18;
  if (a1)
  {
    v45 = a6;
    v48 = v14;
    v20 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v21 = a1;
    v22 = objc_msgSend(v20, sel_initWithListenerEndpoint_, v21);
    v23 = (id)AACTransportInterface();
    objc_msgSend(v22, sel_setExportedInterface_, v23);

    v24 = (id)AACTransportInterface();
    objc_msgSend(v22, sel_setRemoteObjectInterface_, v24);

    objc_msgSend(v22, sel_setExportedObject_, a3);
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = a4;
    *(_QWORD *)(v25 + 24) = a5;
    v54 = sub_21759DA70;
    v55 = v25;
    v26 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v51 = 1107296256;
    v52 = sub_21759C534;
    v53 = &block_descriptor_27;
    v27 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v22, sel_setInvalidationHandler_, v27);
    _Block_release(v27);
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = a4;
    *(_QWORD *)(v28 + 24) = a5;
    v54 = sub_21759DA84;
    v55 = v28;
    aBlock = v26;
    v51 = 1107296256;
    v52 = sub_21759C534;
    v53 = &block_descriptor_33;
    v29 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v22, sel_setInterruptionHandler_, v29);
    _Block_release(v29);
    objc_msgSend(v22, sel_resume);
    sub_2175A6368();
    swift_bridgeObjectRetain_n();
    v30 = sub_2175A638C();
    v31 = sub_2175A6440();
    if (os_log_type_enabled(v30, v31))
    {
      v44 = v21;
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      aBlock = v33;
      v46 = v13;
      *(_DWORD *)v32 = 136446210;
      swift_bridgeObjectRetain();
      v49 = sub_21759D624(a4, a5, &aBlock);
      v21 = v44;
      sub_2175A644C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21759A000, v30, v31, "XPC endpoint connection setup complete for %{public}s.", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v33, -1, -1);
      MEMORY[0x219A0E1AC](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v19, v46);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v19, v13);
    }
    v45(v22);

  }
  else
  {
    v46 = v13;
    sub_2175A6368();
    swift_bridgeObjectRetain();
    v34 = a2;
    swift_bridgeObjectRetain();
    v35 = a2;
    v36 = sub_2175A638C();
    v37 = sub_2175A6434();
    if (os_log_type_enabled(v36, v37))
    {
      v48 = v14;
      v38 = swift_slowAlloc();
      v39 = (_QWORD *)swift_slowAlloc();
      v47 = swift_slowAlloc();
      aBlock = v47;
      *(_DWORD *)v38 = 136446466;
      swift_bridgeObjectRetain();
      v49 = sub_21759D624(a4, a5, &aBlock);
      sub_2175A644C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v38 + 12) = 2114;
      if (a2)
      {
        v40 = a2;
        v41 = _swift_stdlib_bridgeErrorToNSError();
        v49 = v41;
        sub_2175A644C();
      }
      else
      {
        v49 = 0;
        sub_2175A644C();
        v41 = 0;
      }
      v14 = v48;
      *v39 = v41;

      _os_log_impl(&dword_21759A000, v36, v37, "Unable to establish XPC endpoint connection for %{public}s. Error: %{public}@", (uint8_t *)v38, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F40);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v39, -1, -1);
      v42 = v47;
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v42, -1, -1);
      MEMORY[0x219A0E1AC](v38, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();

    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v46);
  }
}

uint64_t sub_21759D624(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21759D730(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21759D6F4((uint64_t)v12, *a3);
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
      sub_21759D6F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21759D6F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21759D730(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2175A6458();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2175A12D8(a5, a6);
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
  v8 = sub_2175A6494();
  if (!v8)
  {
    sub_2175A64A0();
    __break(1u);
LABEL_17:
    result = sub_2175A64DC();
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

uint64_t sub_21759D8E8()
{
  return sub_2175A62D8();
}

id sub_21759D944(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for ActivityAwardsQuery();
  sub_21759DA20((unint64_t *)&unk_254EFA010, v2, (uint64_t (*)(uint64_t))type metadata accessor for ActivityAwardsQuery, (uint64_t)&protocol conformance descriptor for BaseQuery);
  sub_2175A62FC();
  sub_2175A62FC();
  sub_2175A62FC();
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection), sel_invalidate);
}

uint64_t type metadata accessor for ActivityAwardsQuery()
{
  return objc_opt_self();
}

uint64_t sub_21759DA20(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x219A0E134](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_21759DA70()
{
  uint64_t v0;

  return sub_21759DA78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21759DA78(uint64_t a1, unint64_t a2)
{
  return sub_21759C560(a1, a2, "XPC client-side connection invalidated for %{public}s");
}

uint64_t sub_21759DA84()
{
  uint64_t v0;

  return sub_21759DA8C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21759DA8C(uint64_t a1, unint64_t a2)
{
  return sub_21759C560(a1, a2, "XPC client-side connection interrupted for %{public}s");
}

uint64_t BaseQuery.transportDispatchService.getter()
{
  return swift_retain();
}

id BaseQuery.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id BaseQuery.init()()
{
  void *v0;
  char *v1;
  objc_super v3;

  sub_2175A6338();
  swift_allocObject();
  v1 = v0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityAwardsCore9BaseQuery_transportDispatchService] = sub_2175A632C();

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BaseQuery();
  return objc_msgSendSuper2(&v3, sel_init);
}

id BaseQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BaseQuery.transportRequest(_:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_21759DB9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2175A6320();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

void sub_21759DC9C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_21759DCA4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_21759DCB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_21759E354;
  return v6();
}

uint64_t sub_21759DD04(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_21759E354;
  return v7();
}

uint64_t sub_21759DD58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2175A6428();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2175A641C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_21759C284(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2175A6404();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21759DE9C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21759DF00;
  return v6(a1);
}

uint64_t sub_21759DF00()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _s18ActivityAwardsCore9BaseQueryC14transportEvent_4dataySo16AACTransportItemV_10Foundation4DataVSgtF_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  swift_getObjectType();
  v2 = sub_2175A6398();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6380();
  v6 = sub_2175A638C();
  v7 = sub_2175A6434();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v15 = a1;
    v9 = v8;
    v10 = swift_slowAlloc();
    v17 = v10;
    *(_DWORD *)v9 = 136315394;
    v11 = sub_2175A6560();
    v16 = sub_21759D624(v11, v12, &v17);
    sub_2175A644C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2048;
    v16 = v15;
    sub_2175A644C();
    _os_log_impl(&dword_21759A000, v6, v7, "Unexpectedly received a transport event for query %s with item: %lu", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x219A0E1AC](v10, -1, -1);
    MEMORY[0x219A0E1AC](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_21759E108()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_21759E140()
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
  v5[1] = sub_21759E354;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_254EF9E10 + dword_254EF9E10))(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21759E1E8(uint64_t a1)
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
  v7[1] = sub_21759E354;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_254EF9E20 + dword_254EF9E20))(a1, v4, v5, v6);
}

uint64_t sub_21759E26C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21759E290(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21759BB94;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254EF9E30 + dword_254EF9E30))(a1, v4);
}

void type metadata accessor for AACTransportItem()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254EF9EA0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254EF9EA0);
  }
}

uint64_t sub_21759E358(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_21759E360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_21759E368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_21759E370()
{
  return sub_21759E38C("Main XPC connection invalidated");
}

uint64_t sub_21759E37C()
{
  return sub_21759E38C("Main XPC connection interrupted");
}

uint64_t sub_21759E38C(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;

  v2 = sub_2175A6398();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6368();
  v6 = sub_2175A638C();
  v7 = sub_2175A6440();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21759A000, v6, v7, a1, v8, 2u);
    MEMORY[0x219A0E1AC](v8, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_21759E47C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_2175A6398();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6368();
  v6 = a1;
  v7 = a1;
  v8 = sub_2175A638C();
  v9 = sub_2175A6434();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v17 = v2;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc();
    v19 = v12;
    *(_DWORD *)v11 = 136446210;
    swift_getErrorValue();
    v13 = sub_2175A6500();
    v18 = sub_21759D624(v13, v14, &v19);
    sub_2175A644C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21759A000, v8, v9, "Error setting up proxy; unable to obtain query endpoint: %{public}s",
      v11,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A0E1AC](v12, -1, -1);
    MEMORY[0x219A0E1AC](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

BOOL static QueryError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t QueryError.hash(into:)()
{
  return sub_2175A6548();
}

uint64_t QueryError.hashValue.getter()
{
  sub_2175A653C();
  sub_2175A6548();
  return sub_2175A6554();
}

BOOL sub_21759E6E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21759E700()
{
  sub_2175A653C();
  sub_2175A6548();
  return sub_2175A6554();
}

uint64_t sub_21759E744()
{
  return sub_2175A6548();
}

uint64_t sub_21759E76C()
{
  sub_2175A653C();
  sub_2175A6548();
  return sub_2175A6554();
}

unint64_t sub_21759E7B0()
{
  unint64_t result;

  result = qword_254EF9F10;
  if (!qword_254EF9F10)
  {
    result = MEMORY[0x219A0E134](&protocol conformance descriptor for QueryError, &type metadata for QueryError);
    atomic_store(result, (unint64_t *)&qword_254EF9F10);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for QueryError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for QueryError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21759E8F0 + 4 * byte_2175A6B25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21759E924 + 4 * asc_2175A6B20[v4]))();
}

uint64_t sub_21759E924(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21759E92C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21759E934);
  return result;
}

uint64_t sub_21759E940(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21759E948);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21759E94C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21759E954(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21759E960(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21759E96C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for QueryError()
{
  return &type metadata for QueryError;
}

uint64_t sub_21759E988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _BYTE v35[32];
  uint64_t aBlock;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t (*v40)();
  _QWORD *v41;

  v32 = a3;
  v33 = a4;
  v7 = sub_2175A6398();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A63B0();
  v11 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v12 = (void *)sub_2175A63A4();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithMachServiceName_options_, v12, 0);

  v14 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_254EFBA08);
  objc_msgSend(v13, sel_setRemoteObjectInterface_, v14);

  v40 = sub_21759E370;
  v41 = 0;
  v15 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v37 = 1107296256;
  v38 = sub_21759C534;
  v39 = &block_descriptor_39;
  v16 = _Block_copy(&aBlock);
  objc_msgSend(v13, sel_setInvalidationHandler_, v16);
  _Block_release(v16);
  v40 = sub_21759E37C;
  v41 = 0;
  aBlock = v15;
  v37 = 1107296256;
  v38 = sub_21759C534;
  v39 = &block_descriptor_42;
  v17 = _Block_copy(&aBlock);
  objc_msgSend(v13, sel_setInterruptionHandler_, v17);
  _Block_release(v17);
  objc_msgSend(v13, sel_resume);
  v40 = sub_21759E388;
  v41 = 0;
  aBlock = v15;
  v37 = 1107296256;
  v38 = sub_21759ED74;
  v39 = &block_descriptor_45;
  v18 = _Block_copy(&aBlock);
  v19 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);
  sub_2175A6464();
  swift_unknownObjectRelease();
  sub_21759D6F4((uint64_t)v35, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C8);
  if (swift_dynamicCast())
  {
    v20 = v34;
    v21 = (void *)sub_2175A63A4();
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v4;
    v22[3] = a1;
    v23 = v32;
    v24 = v33;
    v22[4] = a2;
    v22[5] = v23;
    v22[6] = v24;
    v40 = (uint64_t (*)())sub_2175A2B48;
    v41 = v22;
    aBlock = v15;
    v37 = 1107296256;
    v38 = sub_21759BF08;
    v39 = &block_descriptor_51;
    v25 = _Block_copy(&aBlock);
    v26 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v20, sel_createEndpointNamed_completion_, v21, v25);
    _Block_release(v25);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_2175A6368();
    v27 = sub_2175A638C();
    v28 = sub_2175A6440();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_21759A000, v27, v28, "Proxy does not conform to endpoint interface", v29, 2u);
      MEMORY[0x219A0E1AC](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
}

void sub_21759ED74(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_21759EDC4(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, void (*a6)(id), uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  _QWORD *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void (*v45)(id);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t aBlock;
  uint64_t v51;
  uint64_t (*v52)(uint64_t);
  void *v53;
  uint64_t (*v54)();
  uint64_t v55;
  uint64_t v56;

  v47 = a7;
  v56 = *MEMORY[0x24BDAC8D0];
  v13 = sub_2175A6398();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v43 - v18;
  if (a1)
  {
    v45 = a6;
    v48 = v14;
    v20 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v21 = a1;
    v22 = objc_msgSend(v20, sel_initWithListenerEndpoint_, v21);
    v23 = (id)AACTransportInterface();
    objc_msgSend(v22, sel_setExportedInterface_, v23);

    v24 = (id)AACTransportInterface();
    objc_msgSend(v22, sel_setRemoteObjectInterface_, v24);

    objc_msgSend(v22, sel_setExportedObject_, a3);
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = a4;
    *(_QWORD *)(v25 + 24) = a5;
    v54 = sub_2175A37BC;
    v55 = v25;
    v26 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v51 = 1107296256;
    v52 = sub_21759C534;
    v53 = &block_descriptor_58;
    v27 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v22, sel_setInvalidationHandler_, v27);
    _Block_release(v27);
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = a4;
    *(_QWORD *)(v28 + 24) = a5;
    v54 = sub_2175A37C0;
    v55 = v28;
    aBlock = v26;
    v51 = 1107296256;
    v52 = sub_21759C534;
    v53 = &block_descriptor_65;
    v29 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v22, sel_setInterruptionHandler_, v29);
    _Block_release(v29);
    objc_msgSend(v22, sel_resume);
    sub_2175A6368();
    swift_bridgeObjectRetain_n();
    v30 = sub_2175A638C();
    v31 = sub_2175A6440();
    if (os_log_type_enabled(v30, v31))
    {
      v44 = v21;
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      aBlock = v33;
      v46 = v13;
      *(_DWORD *)v32 = 136446210;
      swift_bridgeObjectRetain();
      v49 = sub_21759D624(a4, a5, &aBlock);
      v21 = v44;
      sub_2175A644C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21759A000, v30, v31, "XPC endpoint connection setup complete for %{public}s.", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v33, -1, -1);
      MEMORY[0x219A0E1AC](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v19, v46);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v19, v13);
    }
    v45(v22);

  }
  else
  {
    v46 = v13;
    sub_2175A6368();
    swift_bridgeObjectRetain();
    v34 = a2;
    swift_bridgeObjectRetain();
    v35 = a2;
    v36 = sub_2175A638C();
    v37 = sub_2175A6434();
    if (os_log_type_enabled(v36, v37))
    {
      v48 = v14;
      v38 = swift_slowAlloc();
      v39 = (_QWORD *)swift_slowAlloc();
      v47 = swift_slowAlloc();
      aBlock = v47;
      *(_DWORD *)v38 = 136446466;
      swift_bridgeObjectRetain();
      v49 = sub_21759D624(a4, a5, &aBlock);
      sub_2175A644C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v38 + 12) = 2114;
      if (a2)
      {
        v40 = a2;
        v41 = _swift_stdlib_bridgeErrorToNSError();
        v49 = v41;
        sub_2175A644C();
      }
      else
      {
        v49 = 0;
        sub_2175A644C();
        v41 = 0;
      }
      v14 = v48;
      *v39 = v41;

      _os_log_impl(&dword_21759A000, v36, v37, "Unable to establish XPC endpoint connection for %{public}s. Error: %{public}@", (uint8_t *)v38, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F40);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v39, -1, -1);
      v42 = v47;
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v42, -1, -1);
      MEMORY[0x219A0E1AC](v38, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();

    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v46);
  }
}

id ActivityAwardsDateQuery.__allocating_init(dateComponents:initialAwardsHandler:updateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v11;
  id v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_2175A2620(a1, a2, a3, a4, a5);
  swift_release();
  swift_release();
  return v12;
}

id ActivityAwardsDateQuery.init(dateComponents:initialAwardsHandler:updateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;

  v5 = sub_2175A2620(a1, a2, a3, a4, a5);
  swift_release();
  swift_release();
  return v5;
}

uint64_t sub_21759F494()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents;
  v2 = sub_2175A629C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();

  return swift_release();
}

id ActivityAwardsDateQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F18);
  sub_2175A62D8();
  swift_release();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAwardsDateQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21759F6C4(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _BYTE *v18;
  uint64_t v19;

  v2 = v1;
  v4 = sub_2175A629C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)sub_2175A6290();
  v9 = (id)ACHYearMonthDayStringFromDateComponents();

  if (v9)
  {

    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    v10 = &v2[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v10, v7, v4);
    result = swift_endAccess();
    v12 = OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_isActive;
    if (v2[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_isActive] == 1)
    {
      MEMORY[0x24BDAC7A8](result);
      *(&v19 - 2) = (uint64_t)v2;
      sub_2175A62D8();
      v13 = sub_2175A63B0();
      v15 = v14;
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = v2;
      v17 = v2;
      sub_21759E988(v13, v15, (uint64_t)sub_2175A2828, v16);
      swift_bridgeObjectRelease();
      result = swift_release();
      v2[v12] = 1;
    }
  }
  else
  {
    sub_2175A27A8();
    swift_allocError();
    *v18 = 0;
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_21759F8C0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F90);
  v2 = (_QWORD *)sub_2175A64D0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2175A1740(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
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

uint64_t sub_21759F9D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[23] = v0;
  v2 = sub_2175A629C();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = swift_task_alloc();
  v3 = sub_2175A6398();
  v1[27] = v3;
  v1[28] = *(_QWORD *)(v3 - 8);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21759FA70()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  _QWORD *v9;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;

  sub_2175A6368();
  v1 = sub_2175A638C();
  v2 = sub_2175A6440();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21759A000, v1, v2, "Running query immediately.", v3, 2u);
    MEMORY[0x219A0E1AC](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 216);
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 184);

  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v4, v5);
  v9 = (_QWORD *)swift_task_alloc();
  v9[2] = v7;
  v9[3] = sub_2175A00CC;
  v9[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C0);
  sub_2175A62D8();
  swift_task_dealloc();
  v34 = *(id *)(v0 + 176);
  *(_QWORD *)(v0 + 248) = v34;
  sub_2175A6368();
  v11 = sub_2175A638C();
  v12 = sub_2175A6440();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21759A000, v11, v12, "Obtained proxy for query run. Sending transport request.", v13, 2u);
    MEMORY[0x219A0E1AC](v13, -1, -1);
  }
  v14 = *(_QWORD *)(v0 + 232);
  v16 = *(_QWORD *)(v0 + 208);
  v15 = *(_QWORD *)(v0 + 216);
  v18 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 200);
  v19 = *(_QWORD *)(v0 + 184);

  v8(v14, v15);
  v20 = v19 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v20, v18);
  v21 = (void *)sub_2175A6290();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  v22 = (id)ACHYearMonthDayStringFromDateComponents();

  if (v22)
  {
    v23 = sub_2175A63B0();
    v25 = v24;

    *(_QWORD *)(v0 + 144) = v23;
    *(_QWORD *)(v0 + 152) = v25;
    v26 = sub_2175A6314();
    *(_QWORD *)(v0 + 256) = 0;
    *(_QWORD *)(v0 + 264) = v26;
    *(_QWORD *)(v0 + 272) = v27;
    v29 = v26;
    v30 = v27;
    swift_bridgeObjectRelease();
    if (v30 >> 60 == 15)
    {
      v31 = 0;
    }
    else
    {
      sub_21759BFB0(v29, v30);
      v31 = sub_2175A62B4();
      sub_21759C0F8(v29, v30);
    }
    *(_QWORD *)(v0 + 280) = v31;
    *(_QWORD *)(v0 + 56) = v0 + 160;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21759FE70;
    v32 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v33 = (_QWORD *)(v0 + 80);
    v33[1] = 0x40000000;
    v33[2] = sub_21759BBDC;
    v33[3] = &block_descriptor;
    v33[4] = v32;
    objc_msgSend(v34, sel_transportRequest_data_completion_, 6, v31, v33);
    return swift_continuation_await();
  }
  else
  {
    sub_2175A27A8();
    swift_allocError();
    *v28 = 0;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21759FE70()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 288) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_21759FED0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v8;

  v1 = *(void **)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 168);

  sub_2175A635C();
  sub_21759BF9C(v2, v3);
  sub_2175A6350();
  v5 = *(_QWORD *)(v0 + 264);
  v4 = *(_QWORD *)(v0 + 272);
  if (v1)
  {

    sub_2175A27A8();
    swift_allocError();
    *v6 = 1;
    swift_willThrow();
    sub_21759C0F8(v2, v3);
    sub_21759C0F8(v5, v4);
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v8 = sub_2175A6344();
    swift_release();
    sub_21759C0F8(v2, v3);
    sub_21759C0F8(v5, v4);
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
  }
}

uint64_t sub_2175A004C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(void **)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 272);
  swift_willThrow();
  sub_21759C0F8(v2, v3);
  swift_unknownObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2175A00CC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_2175A6398();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6368();
  v6 = a1;
  v7 = a1;
  v8 = sub_2175A638C();
  v9 = sub_2175A6434();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v17 = v2;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc();
    v19 = v12;
    *(_DWORD *)v11 = 136446210;
    swift_getErrorValue();
    v13 = sub_2175A6500();
    v18 = sub_21759D624(v13, v14, &v19);
    sub_2175A644C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21759A000, v8, v9, "Unable to get proxy: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A0E1AC](v12, -1, -1);
    MEMORY[0x219A0E1AC](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_2175A02B4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t result;

  v1 = sub_2175A63B0();
  v3 = v2;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v0;
  v5 = v0;
  sub_21759E988(v1, v3, (uint64_t)sub_2175A2828, v4);
  swift_bridgeObjectRelease();
  result = swift_release();
  v5[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_isActive] = 1;
  return result;
}

uint64_t sub_2175A0358(char *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[2];
  uint64_t aBlock[6];
  uint64_t v32;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F238B8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2175A6398();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)&a1[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection];
  *(_QWORD *)&a1[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection] = a2;
  v13 = a2;

  aBlock[4] = (uint64_t)sub_2175A0750;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21759ED74;
  aBlock[3] = (uint64_t)&block_descriptor_68;
  v14 = _Block_copy(aBlock);
  v15 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v14);
  _Block_release(v14);
  sub_2175A6464();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v16 = v32;
    sub_2175A6410();
    v17 = sub_2175A6428();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v7, 0, 1, v17);
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = v16;
    v18[5] = a1;
    swift_unknownObjectRetain();
    v19 = a1;
    sub_2175A4C04((uint64_t)v7, (uint64_t)&unk_254EF9F78, (uint64_t)v18);
    swift_release();
    aBlock[0] = (uint64_t)v19;
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v19;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = sub_2175A2C18;
    *(_QWORD *)(v21 + 24) = v20;
    type metadata accessor for ActivityAwardsDateQuery();
    sub_2175A635C();
    sub_2175A2C44(&qword_254EF9F80, (uint64_t (*)(uint64_t))type metadata accessor for ActivityAwardsDateQuery, (uint64_t)&protocol conformance descriptor for BaseQuery);
    v22 = v19;
    sub_2175A6308();
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_2175A6368();
    v24 = sub_2175A638C();
    v25 = sub_2175A6440();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v30[1] = v2;
      aBlock[0] = v27;
      *(_DWORD *)v26 = 136446210;
      v30[0] = v8;
      v28 = sub_2175A63B0();
      v32 = sub_21759D624(v28, v29, aBlock);
      sub_2175A644C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21759A000, v24, v25, "XPC client-side connection failed to get expected proxy type for %{public}s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v27, -1, -1);
      MEMORY[0x219A0E1AC](v26, -1, -1);

      return (*(uint64_t (**)(char *, _QWORD))(v9 + 8))(v11, v30[0]);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
}

uint64_t sub_2175A0750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_2175A6398();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6368();
  v4 = sub_2175A638C();
  v5 = sub_2175A6440();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136446210;
    v12 = v7;
    v8 = sub_2175A63B0();
    v11 = sub_21759D624(v8, v9, &v12);
    sub_2175A644C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21759A000, v4, v5, "XPC client-side connection failed to get proxy for %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A0E1AC](v7, -1, -1);
    MEMORY[0x219A0E1AC](v6, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2175A08DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[22] = a4;
  v5[23] = a5;
  v6 = sub_2175A629C();
  v5[24] = v6;
  v5[25] = *(_QWORD *)(v6 - 8);
  v5[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2175A093C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  void *v16;
  uint64_t v17;
  _QWORD *v18;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 184) + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = (void *)sub_2175A6290();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v6 = (id)ACHYearMonthDayStringFromDateComponents();

  if (v6)
  {
    v7 = sub_2175A63B0();
    v9 = v8;

    *(_QWORD *)(v0 + 160) = v7;
    *(_QWORD *)(v0 + 168) = v9;
    v10 = sub_2175A6314();
    v12 = v11;
    *(_QWORD *)(v0 + 216) = 0;
    swift_bridgeObjectRelease();
    if (v12 >> 60 == 15)
    {
      v13 = 0;
    }
    else
    {
      v13 = sub_2175A62B4();
      sub_21759C0F8(v10, v12);
    }
    *(_QWORD *)(v0 + 224) = v13;
    v16 = *(void **)(v0 + 176);
    *(_QWORD *)(v0 + 56) = v0 + 144;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_2175A0B4C;
    v17 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v18 = (_QWORD *)(v0 + 80);
    v18[1] = 0x40000000;
    v18[2] = sub_21759BBDC;
    v18[3] = &block_descriptor_79;
    v18[4] = v17;
    objc_msgSend(v16, sel_transportRequest_data_completion_, 6, v13, v18);
    return swift_continuation_await();
  }
  else
  {
    sub_2175A27A8();
    swift_allocError();
    *v14 = 0;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2175A0B4C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 232) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2175A0BAC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v1 = *(void **)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);

  sub_2175A635C();
  sub_21759BF9C(v2, v3);
  sub_2175A6350();
  if (v1)
  {

    sub_2175A27A8();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 184);
    v6 = sub_2175A6344();
    v7 = sub_2175A2D74(v6);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t))(v5
                                    + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_initialAwardsHandler))(v7);
    swift_bridgeObjectRelease();
    swift_release();
  }
  sub_21759C0F8(v2, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2175A0CDC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 224);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2175A0D24(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;

  v3 = sub_2175A6344();
  v4 = sub_2175A2D74(v3);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(a2
                                  + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_updateAwardsHandler))(v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2175A0D80()
{
  return sub_2175A62D8();
}

id sub_2175A0DDC(uint64_t a1)
{
  type metadata accessor for ActivityAwardsDateQuery();
  sub_2175A2C44(&qword_254EF9F80, (uint64_t (*)(uint64_t))type metadata accessor for ActivityAwardsDateQuery, (uint64_t)&protocol conformance descriptor for BaseQuery);
  sub_2175A62FC();
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection), sel_invalidate);
}

void sub_2175A0E68(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v8 = sub_2175A63B0();
  sub_2175A3820(v8, v9);
  swift_bridgeObjectRelease();
  v10 = *(void **)(a1 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection);
  if (v10)
  {
    aBlock[4] = a2;
    aBlock[5] = a3;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21759ED74;
    aBlock[3] = &block_descriptor_36;
    v11 = _Block_copy(aBlock);
    v12 = v10;
    swift_retain();
    swift_release();
    v13 = objc_msgSend(v12, sel_synchronousRemoteObjectProxyWithErrorHandler_, v11);
    _Block_release(v11);
    sub_2175A6464();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C0);
    if ((swift_dynamicCast() & 1) != 0)
    {

      *a4 = v18;
    }
    else
    {
      v16 = sub_2175A62CC();
      sub_2175A2C44((unint64_t *)&unk_254EF9F60, (uint64_t (*)(uint64_t))MEMORY[0x24BE01BA8], MEMORY[0x24BE01BB0]);
      swift_allocError();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v17, *MEMORY[0x24BE01B98], v16);
      swift_willThrow();

    }
  }
  else
  {
    v14 = sub_2175A62CC();
    sub_2175A2C44((unint64_t *)&unk_254EF9F60, (uint64_t (*)(uint64_t))MEMORY[0x24BE01BA8], MEMORY[0x24BE01BB0]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v15, *MEMORY[0x24BE01BA0], v14);
    swift_willThrow();
  }
}

id ActivityAwardsDateQuery.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivityAwardsDateQuery.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2175A1104(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2175A1114(uint64_t (*a1)(void))
{
  uint64_t result;

  result = a1();
  if (result)
    return _swift_stdlib_bridgeErrorToNSError();
  return result;
}

_QWORD *sub_2175A113C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F88);
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
    sub_2175A2C84(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2175A1248(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2175A1268(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_21759D624(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2175A644C();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2175A12D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2175A136C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2175A1544(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2175A1544(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2175A136C(uint64_t a1, unint64_t a2)
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
      v3 = sub_2175A14E0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2175A6470();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2175A64A0();
      __break(1u);
LABEL_10:
      v2 = sub_2175A63C8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2175A64DC();
    __break(1u);
LABEL_14:
    result = sub_2175A64A0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2175A14E0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254EF9F48);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2175A1544(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254EF9F48);
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
  result = sub_2175A64DC();
  __break(1u);
  return result;
}

void sub_2175A1690(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_2175A644C();
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
}

unint64_t sub_2175A1740(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2175A653C();
  sub_2175A63BC();
  v4 = sub_2175A6554();
  return sub_2175A1DC4(a1, a2, v4);
}

uint64_t sub_2175A17A4(unint64_t a1)
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
    v3 = sub_2175A64AC();
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
    v5 = sub_2175A64AC();
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
    v4 = MEMORY[0x219A0DD38](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_2175A2054(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_2175A64AC();
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
    return sub_2175A63E0();
  }
  __break(1u);
  return result;
}

uint64_t sub_2175A195C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F90);
  v38 = a2;
  v6 = sub_2175A64C4();
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
    sub_2175A653C();
    sub_2175A63BC();
    result = sub_2175A6554();
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

void sub_2175A1C68(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_2175A1740(a2, a3);
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
    sub_2175A1EA4();
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
  sub_2175A195C(v15, a4 & 1);
  v20 = sub_2175A1740(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_2175A64F4();
  __break(1u);
}

unint64_t sub_2175A1DC4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2175A64E8() & 1) == 0)
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
      while (!v14 && (sub_2175A64E8() & 1) == 0);
    }
  }
  return v6;
}

id sub_2175A1EA4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F90);
  v2 = *v0;
  v3 = sub_2175A64B8();
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

uint64_t sub_2175A2054(unint64_t a1, uint64_t a2, unint64_t a3)
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
    v7 = sub_2175A64AC();
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
    v10 = sub_2175A64AC();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2175A3710();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9FA0);
          v12 = sub_2175A224C(v16, i, a3);
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
    sub_2175A36D4();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_2175A64DC();
  __break(1u);
  return result;
}

void (*sub_2175A224C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2175A22CC(v6, a2, a3);
  return sub_2175A22A0;
}

void sub_2175A22A0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2175A22CC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x219A0DD2C](a2, a3);
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
    return sub_2175A2338;
  }
  __break(1u);
  return result;
}

void sub_2175A2338(id *a1)
{

}

_QWORD *sub_2175A2340(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254EF9FB0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_2175A2428(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2175A37A0();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_2175A2428(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  void *v20;
  id v21;

  v5 = result;
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
    return (_QWORD *)v10;
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
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
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

id sub_2175A2620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v5;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  id v17;
  objc_super v19;

  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection] = 0;
  v5[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_isActive] = 0;
  sub_2175A62F0();
  swift_allocObject();
  v11 = v5;
  *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_lock] = sub_2175A62E4();
  v12 = &v11[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents];
  v13 = sub_2175A629C();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  v15 = &v11[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_initialAwardsHandler];
  *(_QWORD *)v15 = a2;
  *((_QWORD *)v15 + 1) = a3;
  v16 = &v11[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_updateAwardsHandler];
  *(_QWORD *)v16 = a4;
  *((_QWORD *)v16 + 1) = a5;
  swift_retain();
  swift_retain();

  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for ActivityAwardsDateQuery();
  v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v17;
}

id sub_2175A2758@<X0>(BOOL *a1@<X8>)
{
  return sub_2175A2A88(a1);
}

uint64_t type metadata accessor for ActivityAwardsDateQuery()
{
  uint64_t result;

  result = qword_253F238A0;
  if (!qword_253F238A0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2175A27A8()
{
  unint64_t result;

  result = qword_254EF9F20;
  if (!qword_254EF9F20)
  {
    result = MEMORY[0x219A0E134](&protocol conformance descriptor for QueryError, &type metadata for QueryError);
    atomic_store(result, (unint64_t *)&qword_254EF9F20);
  }
  return result;
}

id sub_2175A27EC()
{
  uint64_t v0;

  return sub_2175A0DDC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2175A2804()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2175A282C(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_2175A0E68(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_2175A2848()
{
  return sub_2175A62D8();
}

uint64_t sub_2175A28A4()
{
  return type metadata accessor for ActivityAwardsDateQuery();
}

uint64_t sub_2175A28AC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2175A629C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ActivityAwardsDateQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.__allocating_init(dateComponents:initialAwardsHandler:updateHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.validateAndSetDateComponents(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.runQueryImmediately()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x100);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2175A29F0;
  return v5();
}

uint64_t sub_2175A29F0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.activate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.deactivate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

id sub_2175A2A88@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  id result;

  v3 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection);
  if (v3)
    result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection), sel_invalidate);
  *a1 = v3 == 0;
  return result;
}

uint64_t sub_2175A2AE8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2175A2B48(uint64_t a1, uint64_t a2)
{
  return sub_21759BF7C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21759EDC4);
}

uint64_t sub_2175A2B54()
{
  uint64_t v0;

  return sub_2175A0358(*(char **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2175A2B6C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2175A2BA0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_21759BB94;
  return sub_2175A08DC(a1, v4, v5, v7, v6);
}

uint64_t sub_2175A2C18(uint64_t a1)
{
  uint64_t v1;

  return sub_2175A0D24(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2175A2C20()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2175A2C44(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A0E134](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2175A2C84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2175A64DC();
  __break(1u);
  return result;
}

uint64_t sub_2175A2D74(unint64_t a1)
{
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  id v9;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  double v36;
  double v37;
  unint64_t v38;
  char v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  double v47;
  double v48;
  id v49;
  char v50;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v52;
  _QWORD *v53;
  uint64_t result;
  void *v55;
  void *v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;

  v2 = MEMORY[0x24BEE4AF8];
  v62 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F88);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2175A6C20;
  *(_QWORD *)(inited + 32) = 0xD000000000000012;
  *(_QWORD *)(inited + 40) = 0x80000002175A7170;
  *(_QWORD *)(inited + 48) = 0xD000000000000012;
  *(_QWORD *)(inited + 56) = 0x80000002175A7190;
  *(_QWORD *)(inited + 64) = 0xD000000000000012;
  *(_QWORD *)(inited + 72) = 0x80000002175A71B0;
  v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_2175A6C20;
  strcpy((char *)(v4 + 32), "NewMoveRecord");
  *(_WORD *)(v4 + 46) = -4864;
  *(_QWORD *)(v4 + 48) = 0xD000000000000011;
  *(_QWORD *)(v4 + 56) = 0x80000002175A71D0;
  *(_QWORD *)(v4 + 64) = 0xD000000000000011;
  *(_QWORD *)(v4 + 72) = 0x80000002175A71F0;
  v5 = sub_21759F8C0(v2);
  if (a1 >> 62)
  {
LABEL_98:
    swift_bridgeObjectRetain();
    v6 = sub_2175A64AC();
    if (v6)
      goto LABEL_3;
LABEL_99:
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v52 = swift_bridgeObjectRetain();
    v53 = sub_2175A2340(v52);
    swift_bridgeObjectRelease();
    sub_2175A17A4((unint64_t)v53);
    swift_bridgeObjectRelease();
    return v62;
  }
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_99;
LABEL_3:
  v57 = v5;
  v7 = 0;
  v61 = a1 & 0xC000000000000001;
  v59 = a1 & 0xFFFFFFFFFFFFFF8;
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v60 = a1;
  v58 = (char *)(a1 + 32);
  while (1)
  {
    if (v61)
    {
      v9 = (id)MEMORY[0x219A0DD2C](v7, v60);
    }
    else
    {
      if (v7 >= *(_QWORD *)(v59 + 16))
        goto LABEL_96;
      v9 = *(id *)&v58[8 * v7];
    }
    a1 = (unint64_t)v9;
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
      goto LABEL_98;
    }
    v11 = objc_msgSend(v9, sel_template);
    v12 = objc_msgSend(v11, sel_uniqueName);

    if (v12)
    {
      v13 = sub_2175A63B0();
      v15 = v14;

      LOBYTE(v12) = v13 == 0xD000000000000012;
      if (v13 == 0xD000000000000012 && v15 == 0x80000002175A7170)
      {
        v16 = 1;
        v15 = 0x80000002175A7170;
        v13 = 0xD000000000000012;
        goto LABEL_30;
      }
    }
    else
    {
      v13 = 0;
      v15 = 0xE000000000000000;
    }
    if ((sub_2175A64E8() & 1) != 0
      || (v15 == 0x80000002175A7190 ? (v17 = (char)v12) : (v17 = 0),
          (v17 & 1) != 0
       || (sub_2175A64E8() & 1) != 0
       || (v15 == 0x80000002175A71B0 ? (v18 = (char)v12) : (v18 = 0), (v18 & 1) != 0 || (sub_2175A64E8() & 1) != 0)))
    {
      v16 = 1;
      if (v13 == 0x5265766F4D77654ELL)
      {
        v5 = 0x5265766F4D77654ELL;
        if (v15 == 0xED000064726F6365)
        {
LABEL_43:
          v23 = v8[2];
          if (!v23)
            goto LABEL_49;
LABEL_44:
          if (v8[4] == v5 && v8[5] == v15 || (sub_2175A64E8() & 1) != 0)
          {
LABEL_47:

            goto LABEL_89;
          }
          if (v23 != 1)
          {
            if (v8[6] == v5 && v8[7] == v15 || (sub_2175A64E8() & 1) != 0)
              goto LABEL_47;
            if (v23 != 2)
            {
              v27 = v8 + 9;
              v28 = 2;
              do
              {
                v29 = v28 + 1;
                if (__OFADD__(v28, 1))
                  goto LABEL_97;
                v30 = *(v27 - 1) == v5 && *v27 == v15;
                if (v30 || (sub_2175A64E8() & 1) != 0)
                  goto LABEL_47;
                v27 += 2;
                ++v28;
              }
              while (v29 != v23);
            }
          }
LABEL_49:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v8 = sub_2175A113C(0, v23 + 1, 1, v8);
          v25 = v8[2];
          v24 = v8[3];
          if (v25 >= v24 >> 1)
            v8 = sub_2175A113C((_QWORD *)(v24 > 1), v25 + 1, 1, v8);
          v8[2] = v25 + 1;
          v26 = &v8[2 * v25];
          v26[4] = v5;
          v26[5] = v15;
          goto LABEL_54;
        }
      }
    }
    else
    {
      v16 = 0;
      if (v13 == 0x5265766F4D77654ELL)
      {
        v22 = 0x5265766F4D77654ELL;
        if (v15 == 0xED000064726F6365)
          goto LABEL_75;
      }
    }
LABEL_30:
    if ((sub_2175A64E8() & 1) == 0 && (v13 != 0xD000000000000011 || v15 != 0x80000002175A71D0))
    {
      v5 = 0xD000000000000011;
      v19 = sub_2175A64E8();
      v20 = v13 == 0xD000000000000011 && v15 == 0x80000002175A71F0;
      v21 = v20;
      if ((v19 & 1) == 0 && !v21 && (sub_2175A64E8() & 1) == 0)
      {
        if ((v16 & 1) != 0)
        {
          v5 = v13;
          v23 = v8[2];
          if (!v23)
            goto LABEL_49;
          goto LABEL_44;
        }
        swift_bridgeObjectRelease();
LABEL_54:
        a1 = (unint64_t)(id)a1;
        MEMORY[0x219A0DC84]();
        if (*(_QWORD *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2175A63EC();
        sub_2175A63F8();
        sub_2175A63E0();
        goto LABEL_5;
      }
    }
    v5 = v13;
    v22 = v13;
    if ((v16 & 1) != 0)
      goto LABEL_43;
LABEL_75:
    v31 = objc_msgSend((id)a1, sel_relevantEarnedInstance);
    if (v31)
      break;
    swift_bridgeObjectRelease();
LABEL_5:

LABEL_6:
    if (v7 == v6)
      goto LABEL_99;
  }
  v5 = (unint64_t)v31;
  v32 = objc_msgSend(v31, sel_value);
  if (!v32)
  {

    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v33 = v32;
  v34 = objc_msgSend((id)a1, sel_template);
  v35 = objc_msgSend(v34, sel_canonicalUnit);

  if (v35)
  {
    objc_msgSend(v33, sel_doubleValueForUnit_, v35);
    v37 = v36;

    if (!*(_QWORD *)(v57 + 16))
      goto LABEL_87;
    swift_bridgeObjectRetain();
    v38 = sub_2175A1740(v22, v15);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_87:
      v49 = (id)a1;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_2175A1C68((uint64_t)v49, v22, v15, isUniquelyReferenced_nonNull_native);
LABEL_88:

      swift_bridgeObjectRelease();
LABEL_89:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    v40 = *(id *)(*(_QWORD *)(v57 + 56) + 8 * v38);
    swift_bridgeObjectRelease();
    v41 = objc_msgSend(v40, sel_relevantEarnedInstance);
    if (v41)
    {
      v42 = v41;
      v43 = objc_msgSend(v41, sel_value);
      if (!v43)
      {

        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
      v44 = v43;
      v55 = v40;
      v56 = v42;
      v45 = objc_msgSend((id)a1, sel_template);
      v46 = objc_msgSend(v45, sel_canonicalUnit);

      if (!v46)
        goto LABEL_101;
      objc_msgSend(v44, sel_doubleValueForUnit_, v46);
      v48 = v47;

      if (v48 < v37)
      {
        v49 = (id)a1;
        v50 = swift_isUniquelyReferenced_nonNull_native();
        sub_2175A1C68((uint64_t)v49, v22, v15, v50);

        goto LABEL_88;
      }
      swift_bridgeObjectRelease();

    }
    else
    {
      swift_bridgeObjectRelease();

    }
    goto LABEL_5;
  }
  swift_release();
  swift_release();
  __break(1u);
LABEL_101:
  swift_release();
  result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_2175A36D4()
{
  unint64_t result;

  result = qword_254EF9F98;
  if (!qword_254EF9F98)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254EF9F98);
  }
  return result;
}

unint64_t sub_2175A3710()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254EF9FA8;
  if (!qword_254EF9FA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254EF9FA0);
    result = MEMORY[0x219A0E134](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254EF9FA8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A0E128](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2175A37A0()
{
  return swift_release();
}

id sub_2175A37A8()
{
  return sub_2175A27EC();
}

uint64_t sub_2175A3820(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD v27[2];
  _BYTE v28[32];
  uint64_t aBlock;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t (*v33)();
  _QWORD *v34;

  v5 = sub_2175A6398();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A63B0();
  v9 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v10 = (void *)sub_2175A63A4();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithMachServiceName_options_, v10, 0);

  v12 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_254EFBA08);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  v33 = sub_21759E370;
  v34 = 0;
  v13 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_21759C534;
  v32 = &block_descriptor_63;
  v14 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInvalidationHandler_, v14);
  _Block_release(v14);
  v33 = sub_21759E37C;
  v34 = 0;
  aBlock = v13;
  v30 = 1107296256;
  v31 = sub_21759C534;
  v32 = &block_descriptor_66;
  v15 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v15);
  _Block_release(v15);
  objc_msgSend(v11, sel_resume);
  v33 = sub_21759E388;
  v34 = 0;
  aBlock = v13;
  v30 = 1107296256;
  v31 = sub_21759ED74;
  v32 = &block_descriptor_69;
  v16 = _Block_copy(&aBlock);
  v17 = objc_msgSend(v11, sel_synchronousRemoteObjectProxyWithErrorHandler_, v16);
  _Block_release(v16);
  sub_2175A6464();
  swift_unknownObjectRelease();
  sub_21759D6F4((uint64_t)v28, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C8);
  if (swift_dynamicCast())
  {
    v18 = (void *)v27[1];
    v19 = (void *)sub_2175A63A4();
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = v2;
    v20[3] = a1;
    v20[4] = a2;
    v33 = (uint64_t (*)())sub_2175A6208;
    v34 = v20;
    aBlock = v13;
    v30 = 1107296256;
    v31 = sub_21759BF08;
    v32 = &block_descriptor_75;
    v21 = _Block_copy(&aBlock);
    v22 = v2;
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_createEndpointNamed_completion_, v19, v21);
    _Block_release(v21);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_2175A6368();
    v23 = sub_2175A638C();
    v24 = sub_2175A6440();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_21759A000, v23, v24, "Proxy does not conform to endpoint interface", v25, 2u);
      MEMORY[0x219A0E1AC](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
}

uint64_t sub_2175A3BF8(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD v27[2];
  _BYTE v28[32];
  uint64_t aBlock;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t (*v33)();
  _QWORD *v34;

  v5 = sub_2175A6398();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A63B0();
  v9 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v10 = (void *)sub_2175A63A4();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithMachServiceName_options_, v10, 0);

  v12 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_254EFBA08);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  v33 = sub_21759E370;
  v34 = 0;
  v13 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_21759C534;
  v32 = &block_descriptor_36_0;
  v14 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInvalidationHandler_, v14);
  _Block_release(v14);
  v33 = sub_21759E37C;
  v34 = 0;
  aBlock = v13;
  v30 = 1107296256;
  v31 = sub_21759C534;
  v32 = &block_descriptor_39_0;
  v15 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v15);
  _Block_release(v15);
  objc_msgSend(v11, sel_resume);
  v33 = sub_21759E388;
  v34 = 0;
  aBlock = v13;
  v30 = 1107296256;
  v31 = sub_21759ED74;
  v32 = &block_descriptor_42_0;
  v16 = _Block_copy(&aBlock);
  v17 = objc_msgSend(v11, sel_synchronousRemoteObjectProxyWithErrorHandler_, v16);
  _Block_release(v16);
  sub_2175A6464();
  swift_unknownObjectRelease();
  sub_21759D6F4((uint64_t)v28, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C8);
  if (swift_dynamicCast())
  {
    v18 = (void *)v27[1];
    v19 = (void *)sub_2175A63A4();
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = v2;
    v20[3] = a1;
    v20[4] = a2;
    v33 = (uint64_t (*)())sub_2175A61A8;
    v34 = v20;
    aBlock = v13;
    v30 = 1107296256;
    v31 = sub_21759BF08;
    v32 = &block_descriptor_48;
    v21 = _Block_copy(&aBlock);
    v22 = v2;
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_createEndpointNamed_completion_, v19, v21);
    _Block_release(v21);

    swift_unknownObjectRelease();
  }
  else
  {
    sub_2175A6368();
    v23 = sub_2175A638C();
    v24 = sub_2175A6440();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_21759A000, v23, v24, "Proxy does not conform to endpoint interface", v25, 2u);
      MEMORY[0x219A0E1AC](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
}

uint64_t sub_2175A3FD0(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t aBlock;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  uint64_t (*v51)();
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v10 = sub_2175A6398();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v42 - v15;
  if (a1)
  {
    v45 = v11;
    v17 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v43 = a1;
    v18 = objc_msgSend(v17, sel_initWithListenerEndpoint_);
    v19 = (id)AACTransportInterface();
    objc_msgSend(v18, sel_setExportedInterface_, v19);

    v20 = (id)AACTransportInterface();
    objc_msgSend(v18, sel_setRemoteObjectInterface_, v20);

    objc_msgSend(v18, sel_setExportedObject_, a3);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = a4;
    *(_QWORD *)(v21 + 24) = a5;
    v51 = sub_2175A37BC;
    v52 = v21;
    v22 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v48 = 1107296256;
    v49 = sub_21759C534;
    v50 = &block_descriptor_82;
    v23 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_setInvalidationHandler_, v23);
    _Block_release(v23);
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = a4;
    *(_QWORD *)(v24 + 24) = a5;
    v51 = sub_2175A37C0;
    v52 = v24;
    aBlock = v22;
    v48 = 1107296256;
    v49 = sub_21759C534;
    v50 = &block_descriptor_89;
    v25 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_setInterruptionHandler_, v25);
    _Block_release(v25);
    objc_msgSend(v18, sel_resume);
    v26 = *(void **)(a3 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection);
    *(_QWORD *)(a3 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection) = v18;
    v27 = v18;

    sub_2175A6368();
    swift_bridgeObjectRetain_n();
    v28 = sub_2175A638C();
    v29 = sub_2175A6440();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      aBlock = v31;
      v44 = v10;
      *(_DWORD *)v30 = 136446210;
      swift_bridgeObjectRetain();
      v46 = sub_21759D624(a4, a5, &aBlock);
      sub_2175A644C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21759A000, v28, v29, "XPC endpoint setup complete for %{public}s.", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v31, -1, -1);
      MEMORY[0x219A0E1AC](v30, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v16, v44);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v16, v10);
    }
  }
  else
  {
    v44 = v10;
    sub_2175A6368();
    swift_bridgeObjectRetain();
    v33 = a2;
    swift_bridgeObjectRetain();
    v34 = a2;
    v35 = sub_2175A638C();
    v36 = sub_2175A6434();
    if (os_log_type_enabled(v35, v36))
    {
      v45 = v11;
      v37 = swift_slowAlloc();
      v38 = (_QWORD *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      aBlock = v39;
      *(_DWORD *)v37 = 136446466;
      swift_bridgeObjectRetain();
      v46 = sub_21759D624(a4, a5, &aBlock);
      sub_2175A644C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v37 + 12) = 2114;
      if (a2)
      {
        v40 = a2;
        v41 = _swift_stdlib_bridgeErrorToNSError();
        v46 = v41;
        sub_2175A644C();
      }
      else
      {
        v46 = 0;
        sub_2175A644C();
        v41 = 0;
      }
      *v38 = v41;

      _os_log_impl(&dword_21759A000, v35, v36, "Unable to establish XPC endpoint connection for %{public}s. Error: %{public}@", (uint8_t *)v37, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F40);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v38, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v39, -1, -1);
      MEMORY[0x219A0E1AC](v37, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v14, v44);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v44);
    }
  }
}

uint64_t sub_2175A45EC(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t aBlock;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  uint64_t (*v51)();
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v10 = sub_2175A6398();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v42 - v15;
  if (a1)
  {
    v45 = v11;
    v17 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v43 = a1;
    v18 = objc_msgSend(v17, sel_initWithListenerEndpoint_);
    v19 = (id)AACTransportInterface();
    objc_msgSend(v18, sel_setExportedInterface_, v19);

    v20 = (id)AACTransportInterface();
    objc_msgSend(v18, sel_setRemoteObjectInterface_, v20);

    objc_msgSend(v18, sel_setExportedObject_, a3);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = a4;
    *(_QWORD *)(v21 + 24) = a5;
    v51 = sub_21759DA70;
    v52 = v21;
    v22 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v48 = 1107296256;
    v49 = sub_21759C534;
    v50 = &block_descriptor_54;
    v23 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_setInvalidationHandler_, v23);
    _Block_release(v23);
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = a4;
    *(_QWORD *)(v24 + 24) = a5;
    v51 = sub_21759DA84;
    v52 = v24;
    aBlock = v22;
    v48 = 1107296256;
    v49 = sub_21759C534;
    v50 = &block_descriptor_60;
    v25 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_setInterruptionHandler_, v25);
    _Block_release(v25);
    objc_msgSend(v18, sel_resume);
    v26 = *(void **)(a3 + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection);
    *(_QWORD *)(a3 + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection) = v18;
    v27 = v18;

    sub_2175A6368();
    swift_bridgeObjectRetain_n();
    v28 = sub_2175A638C();
    v29 = sub_2175A6440();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      aBlock = v31;
      v44 = v10;
      *(_DWORD *)v30 = 136446210;
      swift_bridgeObjectRetain();
      v46 = sub_21759D624(a4, a5, &aBlock);
      sub_2175A644C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21759A000, v28, v29, "XPC endpoint setup complete for %{public}s.", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v31, -1, -1);
      MEMORY[0x219A0E1AC](v30, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v16, v44);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v16, v10);
    }
  }
  else
  {
    v44 = v10;
    sub_2175A6368();
    swift_bridgeObjectRetain();
    v33 = a2;
    swift_bridgeObjectRetain();
    v34 = a2;
    v35 = sub_2175A638C();
    v36 = sub_2175A6434();
    if (os_log_type_enabled(v35, v36))
    {
      v45 = v11;
      v37 = swift_slowAlloc();
      v38 = (_QWORD *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      aBlock = v39;
      *(_DWORD *)v37 = 136446466;
      swift_bridgeObjectRetain();
      v46 = sub_21759D624(a4, a5, &aBlock);
      sub_2175A644C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v37 + 12) = 2114;
      if (a2)
      {
        v40 = a2;
        v41 = _swift_stdlib_bridgeErrorToNSError();
        v46 = v41;
        sub_2175A644C();
      }
      else
      {
        v46 = 0;
        sub_2175A644C();
        v41 = 0;
      }
      *v38 = v41;

      _os_log_impl(&dword_21759A000, v35, v36, "Unable to establish XPC endpoint connection for %{public}s. Error: %{public}@", (uint8_t *)v37, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F40);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v38, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x219A0E1AC](v39, -1, -1);
      MEMORY[0x219A0E1AC](v37, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v14, v44);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v44);
    }
  }
}

uint64_t sub_2175A4C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2175A6428();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2175A641C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_21759C284(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2175A6404();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2175A4D30(_QWORD *a1, uint64_t (*a2)(_QWORD))
{
  return a2(*a1);
}

id ActivityAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  objc_class *v8;
  id v17;
  id v18;

  v17 = objc_allocWithZone(v8);
  v18 = sub_21759C388(a1, a2, a3, a4, a5, a6, a7, a8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v18;
}

uint64_t sub_2175A4E04()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

id ActivityAwardsQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254EF9F18);
  sub_2175A62D8();
  swift_release();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAwardsQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2175A5024(uint64_t a1)
{
  return sub_2175A5074(a1, "[ActivityAwardsQuery] deliverInitialAwards: %ld achievements", &OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_initialAwardsHandler);
}

uint64_t sub_2175A5038(uint64_t a1)
{
  return sub_2175A5074(a1, "[ActivityAwardsQuery] deliverAddedAwards: %ld achievements", &OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_addedAwardsHandler);
}

uint64_t sub_2175A504C(uint64_t a1)
{
  return sub_2175A5074(a1, "[ActivityAwardsQuery] deliverRemovedAwards: %ld achievements", &OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_removedAwardsHandler);
}

uint64_t sub_2175A5060(uint64_t a1)
{
  return sub_2175A5074(a1, "[ActivityAwardsQuery] deliverUpdatedAwards %ld achievements", &OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_updatedAwardsHandler);
}

uint64_t sub_2175A5074(uint64_t a1, const char *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(void);
  uint64_t v18;
  const char *v19;
  _QWORD *v20;
  uint64_t v21;

  v6 = v3;
  v7 = sub_2175A6398();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6374();
  swift_retain_n();
  v11 = sub_2175A638C();
  v12 = sub_2175A6440();
  if (os_log_type_enabled(v11, v12))
  {
    v19 = a2;
    v20 = a3;
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    v14 = sub_2175A6344();
    if (v14 >> 62)
      v15 = sub_2175A64AC();
    else
      v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_release();
    swift_bridgeObjectRelease();
    v21 = v15;
    sub_2175A644C();
    swift_release();
    _os_log_impl(&dword_21759A000, v11, v12, v19, v13, 0xCu);
    MEMORY[0x219A0E1AC](v13, -1, -1);

    a3 = v20;
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v16 = *(void (**)(void))(v6 + *a3);
  sub_2175A6344();
  v16();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2175A5240()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[19] = v0;
  v2 = sub_2175A6398();
  v1[20] = v2;
  v1[21] = *(_QWORD *)(v2 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2175A52B0()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;

  sub_2175A6374();
  v1 = sub_2175A638C();
  v2 = sub_2175A6440();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21759A000, v1, v2, "Running query immediately.", v3, 2u);
    MEMORY[0x219A0E1AC](v3, -1, -1);
  }
  v4 = v0[23];
  v5 = v0[20];
  v6 = v0[21];
  v7 = v0[19];

  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v4, v5);
  v9 = (_QWORD *)swift_task_alloc();
  v9[2] = v7;
  v9[3] = sub_2175A00CC;
  v9[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C0);
  sub_2175A62D8();
  swift_task_dealloc();
  v10 = (void *)v0[17];
  v0[24] = v10;
  sub_2175A6374();
  v11 = sub_2175A638C();
  v12 = sub_2175A6440();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21759A000, v11, v12, "Obtained proxy for query run. Sending transport request.", v13, 2u);
    MEMORY[0x219A0E1AC](v13, -1, -1);
  }
  v14 = v0[22];
  v15 = v0[20];

  v8(v14, v15);
  v0[18] = 1;
  v16 = sub_2175A6314();
  v0[25] = 0;
  v18 = v17;
  if (v17 >> 60 == 15)
  {
    v19 = 0;
  }
  else
  {
    v20 = v16;
    v19 = sub_2175A62B4();
    sub_21759C0F8(v20, v18);
  }
  v0[26] = v19;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2175A55A4;
  v21 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v22 = v0 + 10;
  v22[1] = 0x40000000;
  v22[2] = sub_21759BBDC;
  v22[3] = &block_descriptor_0;
  v22[4] = v21;
  objc_msgSend(v10, sel_transportRequest_data_completion_, 2, v19, v22);
  return swift_continuation_await();
}

uint64_t sub_2175A55A4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 216) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2175A5604()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE *v4;
  uint64_t v6;

  v1 = *(void **)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);

  sub_2175A635C();
  sub_21759BF9C(v2, v3);
  sub_2175A6350();
  if (v1)
  {

    sub_2175A27A8();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
    sub_21759C0F8(v2, v3);
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = sub_2175A6344();
    swift_release();
    sub_21759C0F8(v2, v3);
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
  }
}

uint64_t sub_2175A573C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 208);
  swift_willThrow();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2175A5798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_2175A6398();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2175A6368();
  v4 = sub_2175A638C();
  v5 = sub_2175A6440();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136446210;
    v12 = v7;
    v8 = sub_2175A63B0();
    v11 = sub_21759D624(v8, v9, &v12);
    sub_2175A644C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21759A000, v4, v5, "XPC client-side connection failed to get proxy for %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x219A0E1AC](v7, -1, -1);
    MEMORY[0x219A0E1AC](v6, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2175A5924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 136) = a4;
  *(_QWORD *)(v5 + 144) = a5;
  return swift_task_switch();
}

uint64_t sub_2175A593C()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0[10] = 1;
  v1 = sub_2175A6314();
  v0[19] = 0;
  v3 = v2;
  if (v2 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = v1;
    v4 = sub_2175A62B4();
    sub_21759C0F8(v5, v3);
  }
  v0[20] = v4;
  v6 = (void *)v0[17];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2175A5A88;
  v0[14] = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_21759BBDC;
  v0[13] = &block_descriptor_29;
  objc_msgSend(v6, sel_transportRequest_data_completion_, 2, v4, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_2175A5A88()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 168) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2175A5AE8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _BYTE *v5;

  v1 = *(void **)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);

  sub_2175A635C();
  sub_21759BF9C(v2, v3);
  v4 = sub_2175A6350();
  if (v1)
  {

    sub_2175A27A8();
    swift_allocError();
    *v5 = 1;
    swift_willThrow();
  }
  else
  {
    sub_2175A5024(v4);
    swift_release();
  }
  sub_21759C0F8(v2, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2175A5BC4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 160);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2175A5C04(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v8 = sub_2175A63B0();
  sub_2175A3BF8(v8, v9);
  swift_bridgeObjectRelease();
  v10 = *(void **)(a1 + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection);
  if (v10)
  {
    aBlock[4] = a2;
    aBlock[5] = a3;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21759ED74;
    aBlock[3] = &block_descriptor_33_0;
    v11 = _Block_copy(aBlock);
    v12 = v10;
    swift_retain();
    swift_release();
    v13 = objc_msgSend(v12, sel_synchronousRemoteObjectProxyWithErrorHandler_, v11);
    _Block_release(v11);
    sub_2175A6464();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F238C0);
    if ((swift_dynamicCast() & 1) != 0)
    {

      *a4 = v18;
    }
    else
    {
      v16 = sub_2175A62CC();
      sub_21759DA20((unint64_t *)&unk_254EF9F60, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE01BA8], MEMORY[0x24BE01BB0]);
      swift_allocError();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v17, *MEMORY[0x24BE01B98], v16);
      swift_willThrow();

    }
  }
  else
  {
    v14 = sub_2175A62CC();
    sub_21759DA20((unint64_t *)&unk_254EF9F60, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE01BA8], MEMORY[0x24BE01BB0]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v15, *MEMORY[0x24BE01BA0], v14);
    swift_willThrow();
  }
}

id ActivityAwardsQuery.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ActivityAwardsQuery.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2175A5EA8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_2175A5EDC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_2175A5EEC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_2175A64DC();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

id sub_2175A5F80@<X0>(BOOL *a1@<X8>)
{
  return sub_2175A6050(a1);
}

void sub_2175A5F94(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_2175A5C04(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_2175A5FB0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t method lookup function for ActivityAwardsQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActivityAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ActivityAwardsQuery.runQueryImmediately()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2175A29F0;
  return v5();
}

id sub_2175A6050@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  id result;

  v3 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection);
  if (v3)
    result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection), sel_invalidate);
  *a1 = v3 == 0;
  return result;
}

uint64_t sub_2175A60AC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2175A60E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_21759BB94;
  *(_OWORD *)(v2 + 136) = v3;
  return swift_task_switch();
}

uint64_t sub_2175A6140(uint64_t a1)
{
  return sub_2175A5038(a1);
}

uint64_t sub_2175A6160()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2175A6184(uint64_t a1)
{
  return sub_2175A504C(a1);
}

uint64_t sub_2175A61A8(void *a1, void *a2)
{
  uint64_t v2;

  return sub_2175A45EC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_2175A61B4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroy_44Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2175A6208(void *a1, void *a2)
{
  uint64_t v2;

  return sub_2175A3FD0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_2175A6290()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_2175A629C()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2175A62A8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2175A62B4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2175A62C0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2175A62CC()
{
  return MEMORY[0x24BE01BA8]();
}

uint64_t sub_2175A62D8()
{
  return MEMORY[0x24BE01BB8]();
}

uint64_t sub_2175A62E4()
{
  return MEMORY[0x24BE01BC0]();
}

uint64_t sub_2175A62F0()
{
  return MEMORY[0x24BE01BC8]();
}

uint64_t sub_2175A62FC()
{
  return MEMORY[0x24BE01BD8]();
}

uint64_t sub_2175A6308()
{
  return MEMORY[0x24BE01BE0]();
}

uint64_t sub_2175A6314()
{
  return MEMORY[0x24BE01BE8]();
}

uint64_t sub_2175A6320()
{
  return MEMORY[0x24BE01BF0]();
}

uint64_t sub_2175A632C()
{
  return MEMORY[0x24BE01BF8]();
}

uint64_t sub_2175A6338()
{
  return MEMORY[0x24BE01C00]();
}

uint64_t sub_2175A6344()
{
  return MEMORY[0x24BE01C10]();
}

uint64_t sub_2175A6350()
{
  return MEMORY[0x24BE01C18]();
}

uint64_t sub_2175A635C()
{
  return MEMORY[0x24BE01C28]();
}

uint64_t sub_2175A6368()
{
  return MEMORY[0x24BE01C38]();
}

uint64_t sub_2175A6374()
{
  return MEMORY[0x24BE01C40]();
}

uint64_t sub_2175A6380()
{
  return MEMORY[0x24BE01C48]();
}

uint64_t sub_2175A638C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2175A6398()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2175A63A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2175A63B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2175A63BC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2175A63C8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2175A63D4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2175A63E0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2175A63EC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2175A63F8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2175A6404()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2175A6410()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_2175A641C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2175A6428()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2175A6434()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2175A6440()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2175A644C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2175A6458()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2175A6464()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2175A6470()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2175A647C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2175A6488()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2175A6494()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2175A64A0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2175A64AC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2175A64B8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2175A64C4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2175A64D0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2175A64DC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2175A64E8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2175A64F4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2175A6500()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2175A650C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2175A6518()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2175A6524()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2175A6530()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2175A653C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2175A6548()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2175A6554()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2175A6560()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AACTransportInterface()
{
  return MEMORY[0x24BE01B28]();
}

uint64_t ACHYearMonthDayStringFromDateComponents()
{
  return MEMORY[0x24BE01688]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

