uint64_t IngestServiceConnection.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  IngestServiceConnection.init()();
  return v0;
}

uint64_t IngestServiceConnection.init()()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];

  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = 0;
  v1 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v2 = (void *)sub_23A374E80();
  v3 = objc_msgSend(v1, sel_initWithServiceName_, v2);

  v4 = *(void **)(v0 + 112);
  *(_QWORD *)(v0 + 112) = v3;
  v5 = v3;

  v6 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256971278);
  objc_msgSend(v5, sel_setRemoteObjectInterface_, v6);

  v7 = swift_allocObject();
  swift_weakInit();
  v10[4] = sub_23A370260;
  v10[5] = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_23A3704C4;
  v10[3] = &block_descriptor;
  v8 = _Block_copy(v10);
  swift_release();
  objc_msgSend(v5, sel_setInvalidationHandler_, v8);
  _Block_release(v8);
  objc_msgSend(v5, sel_resume);

  return v0;
}

uint64_t sub_23A37012C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A370150()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB20);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_23A374F10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v3;
  sub_23A370378((uint64_t)v1, (uint64_t)&unk_25696EB30, (uint64_t)v4);
  return swift_release();
}

uint64_t sub_23A370260()
{
  return sub_23A370150();
}

uint64_t sub_23A370268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 48) = a4;
  return swift_task_switch();
}

uint64_t sub_23A370280()
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

uint64_t sub_23A370300()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(void **)(v1 + 112);
  *(_QWORD *)(v1 + 112) = 0;

  *(_QWORD *)(v1 + 120) = 0;
  swift_release();
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A37035C()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A370378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23A374F10();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23A374F04();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23A371E14(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A374EE0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(qword_25696EB48);
  return swift_task_create();
}

uint64_t sub_23A3704C4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
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

uint64_t sub_23A370508()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_23A370520()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  if (qword_25696E998 != -1)
    swift_once();
  v1 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v1, (uint64_t)qword_25696F0E8);
  sub_23A3726CC(0x2928747365676E69, 0xE800000000000000, 0xD000000000000064, 0x800000023A3757C0, 0x2928747365676E69, 0xE800000000000000);
  v2 = sub_23A370910();
  v0[16] = v2;
  v3 = (void *)v2;
  v0[2] = v0;
  v0[3] = sub_23A37066C;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_23A370744;
  v5[3] = &block_descriptor_1;
  v5[4] = v4;
  objc_msgSend(v3, sel_ingestWithCompletionHandler_, v5);
  return swift_continuation_await();
}

uint64_t sub_23A37066C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A3706CC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A370700()
{
  uint64_t v0;

  swift_willThrow();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A370744(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB08);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_23A3707B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23A3707D0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  if (qword_25696E998 != -1)
    swift_once();
  v1 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v1, (uint64_t)qword_25696F0E8);
  sub_23A3726CC(0x7328747365676E69, 0xEF293A676E697274, 0xD000000000000064, 0x800000023A3757C0, 0x7328747365676E69, 0xEF293A676E697274);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v2;
  *v2 = v0;
  v2[1] = sub_23A3708C8;
  v2[15] = *(_QWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_23A3708C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A370910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  id v14;
  uint64_t aBlock;
  unint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;

  v1 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v0 + 120))
  {
    v4 = *(_QWORD *)(v0 + 120);
  }
  else
  {
    v5 = swift_allocObject();
    v6 = v5;
    *(_QWORD *)(v5 + 16) = 0;
    v4 = v5 + 16;
    v7 = *(void **)(v0 + 112);
    if (!v7)
      goto LABEL_9;
    v20 = sub_23A371D38;
    v21 = v5;
    aBlock = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v18 = sub_23A373304;
    v19 = &block_descriptor_18;
    v8 = _Block_copy(&aBlock);
    v9 = v7;
    swift_retain();
    swift_release();
    v10 = objc_msgSend(v9, sel_remoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);

    sub_23A374F40();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB10);
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_9:
      swift_beginAccess();
      v12 = *(void **)(v6 + 16);
      sub_23A371D40();
      swift_allocError();
      *v13 = v12;
      v14 = v12;
      swift_willThrow();
      swift_release();
      return v4;
    }
    v4 = aBlock;
    *(_QWORD *)(v0 + 120) = aBlock;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    if (qword_25696E998 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v1, (uint64_t)qword_25696F0E8);
    sub_23A3717A0(v11, (uint64_t)v3);
    aBlock = 0x203A79786F7270;
    v17 = 0xE700000000000000;
    v22 = v4;
    swift_unknownObjectRetain();
    sub_23A374E98();
    sub_23A374EA4();
    swift_bridgeObjectRelease();
    sub_23A3726CC(aBlock, v17, 0xD000000000000064, 0x800000023A3757C0, 0x292879786F7270, 0xE700000000000000);
    swift_bridgeObjectRelease();
    sub_23A37186C((uint64_t)v3);
    swift_release();
  }
  swift_unknownObjectRetain();
  return v4;
}

void sub_23A370BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v4 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696E998 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v4, (uint64_t)qword_25696F0E8);
  sub_23A3717A0(v7, (uint64_t)v6);
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_23A374F4C();
  sub_23A374EA4();
  v12 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB08);
  sub_23A374F7C();
  sub_23A3726D8(v10, v11, 0xD000000000000064, 0x800000023A3757C0, 0x292879786F7270, 0xE700000000000000);
  swift_bridgeObjectRelease();
  sub_23A37186C((uint64_t)v6);
  v8 = sub_23A374DF0();
  swift_beginAccess();
  v9 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v8;

}

uint64_t sub_23A370D90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  v3[19] = type metadata accessor for InternalLogger();
  v3[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A370DF0()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11[2];

  if (qword_25696E998 != -1)
    swift_once();
  v1 = v0[20];
  v2 = v0[17];
  v3 = v0[16];
  v4 = __swift_project_value_buffer(v0[19], (uint64_t)qword_25696F0E8);
  sub_23A3717A0(v4, v1);
  strcpy((char *)v11, "save(event: ");
  BYTE5(v11[1]) = 0;
  HIWORD(v11[1]) = -5120;
  sub_23A3717E4(v3, v2);
  sub_23A374E2C();
  sub_23A371828(v3, v2);
  sub_23A374EA4();
  swift_bridgeObjectRelease();
  sub_23A374EA4();
  sub_23A3726CC(v11[0], v11[1], 0xD000000000000064, 0x800000023A3757C0, 0x6576652865766173, 0xEC000000293A746ELL);
  swift_bridgeObjectRelease();
  sub_23A37186C(v1);
  v5 = sub_23A370910();
  v0[21] = v5;
  v6 = (void *)v5;
  v7 = sub_23A374E38();
  v0[22] = v7;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A371000;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v9 = v0 + 10;
  v9[1] = 0x40000000;
  v9[2] = sub_23A371108;
  v9[3] = &block_descriptor_5;
  v9[4] = v8;
  objc_msgSend(v6, sel_saveWithEvent_completionHandler_, v7, v9);
  return swift_continuation_await();
}

uint64_t sub_23A371000()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 184) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A371060()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_23A3710B4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 176);
  swift_willThrow();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A371108(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB08);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_23A371188(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  v3[20] = type metadata accessor for InternalLogger();
  v3[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A3711E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  if (qword_25696E998 != -1)
    swift_once();
  v1 = v0[21];
  v2 = v0[18];
  v3 = __swift_project_value_buffer(v0[20], (uint64_t)qword_25696F0E8);
  sub_23A3717A0(v3, v1);
  v0[15] = v2;
  sub_23A374FAC();
  sub_23A374EA4();
  swift_bridgeObjectRelease();
  sub_23A374EA4();
  sub_23A3726CC(0x6469286863746566, 0xEA0000000000203ALL, 0xD000000000000064, 0x800000023A3757C0, 0x6469286863746566, 0xEA0000000000293ALL);
  swift_bridgeObjectRelease();
  sub_23A37186C(v1);
  v4 = sub_23A370910();
  v0[22] = v4;
  v5 = (void *)v4;
  v6 = v0[18];
  v0[7] = v0 + 16;
  v0[2] = v0;
  v0[3] = sub_23A3713C0;
  v7 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v8 = v0 + 10;
  v8[1] = 0x40000000;
  v8[2] = sub_23A371518;
  v8[3] = &block_descriptor_7;
  v8[4] = v7;
  objc_msgSend(v5, sel_fetchWithId_completionHandler_, v6, v8);
  return swift_continuation_await();
}

uint64_t sub_23A3713C0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 184) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A371420()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  if (v1)
  {
    v3 = v1;
    sub_23A374E74();

    v4 = sub_23A374E68();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 0, 1, v4);

  }
  else
  {
    v5 = sub_23A374E68();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  swift_unknownObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A3714CC()
{
  uint64_t v0;

  swift_willThrow();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A371518(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB08);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v10 = a2;
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    v9 = a2;
    sub_23A371C8C((uint64_t)&v10, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t IngestServiceConnection.deinit()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  if (qword_25696E998 != -1)
    swift_once();
  v1 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v1, (uint64_t)qword_25696F0E8);
  sub_23A3726CC(0x61636F6C6C616544, 0xEC000000676E6974, 0xD000000000000064, 0x800000023A3757C0, 0x74696E696564, 0xE600000000000000);
  v2 = *(void **)(v0 + 112);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    v3 = *(void **)(v0 + 112);
  }
  else
  {
    v3 = 0;
  }

  swift_unknownObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t IngestServiceConnection.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  if (qword_25696E998 != -1)
    swift_once();
  v1 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v1, (uint64_t)qword_25696F0E8);
  sub_23A3726CC(0x61636F6C6C616544, 0xEC000000676E6974, 0xD000000000000064, 0x800000023A3757C0, 0x74696E696564, 0xE600000000000000);
  v2 = *(void **)(v0 + 112);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    v3 = *(void **)(v0 + 112);
  }
  else
  {
    v3 = 0;
  }

  swift_unknownObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t IngestServiceConnection.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23A37177C()
{
  uint64_t v0;

  return v0;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23A3717A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A3717E4(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A371828(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A37186C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void **initializeBufferWithCopyOfBuffer for IngestServiceError(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for IngestServiceError(id *a1)
{

}

void **assignWithCopy for IngestServiceError(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for IngestServiceError(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for IngestServiceError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IngestServiceError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_23A3719F8()
{
  return 0;
}

ValueMetadata *type metadata accessor for IngestServiceError()
{
  return &type metadata for IngestServiceError;
}

uint64_t type metadata accessor for IngestServiceConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for IngestServiceConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IngestServiceConnection.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of IngestServiceConnection.ingest()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 168) + *(_QWORD *)(*(_QWORD *)v0 + 168));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A371FA4;
  return v4();
}

uint64_t dispatch thunk of IngestServiceConnection.ingest(string:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 176) + *(_QWORD *)(*(_QWORD *)v2 + 176));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A371FA4;
  return v8(a1, a2);
}

uint64_t dispatch thunk of IngestServiceConnection.save(event:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 192) + *(_QWORD *)(*(_QWORD *)v2 + 192));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A371B80;
  return v8(a1, a2);
}

uint64_t sub_23A371B80(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of IngestServiceConnection.fetch(id:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 200) + *(_QWORD *)(*(_QWORD *)v2 + 200));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A371C44;
  return v8(a1, a2);
}

uint64_t sub_23A371C44()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A371C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B84A0E8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A371D14()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23A371D38(uint64_t a1)
{
  uint64_t v1;

  sub_23A370BF0(a1, v1);
}

unint64_t sub_23A371D40()
{
  unint64_t result;

  result = qword_25696EB18;
  if (!qword_25696EB18)
  {
    result = MEMORY[0x23B84A0F4](&protocol conformance descriptor for IngestServiceError, &type metadata for IngestServiceError);
    atomic_store(result, (unint64_t *)&qword_25696EB18);
  }
  return result;
}

uint64_t sub_23A371D84()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A371DB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A371C44;
  v5[5] = a1;
  v5[6] = v4;
  return swift_task_switch();
}

uint64_t sub_23A371E14(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A371E54(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_23A371EBC;
  return v5(v2 + 32);
}

uint64_t sub_23A371EBC()
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

uint64_t sub_23A371F0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A371F30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A371FA4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25696EB38 + dword_25696EB38))(a1, v4);
}

id IngestionExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id result;

  v6 = type metadata accessor for ConcreteConfiguration.ExportedObject(0, a1, a2, a3);
  result = sub_23A372264(v4, v6, v7, v8);
  *a4 = result;
  return result;
}

uint64_t sub_23A371FF0(void *a1, uint64_t a2)
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2569712D8);
  objc_msgSend(a1, sel_setExportedInterface_, v4);

  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  return 1;
}

uint64_t sub_23A372088(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58) + 16))(a1, a2, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50));
}

uint64_t sub_23A3720C8(void *a1, int a2, void *aBlock)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = _Block_copy(aBlock);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = a1;
  sub_23A372088((uint64_t)sub_23A3723DC, v5);

  return swift_release();
}

void sub_23A372134()
{
  sub_23A37238C();
}

id sub_23A372150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for ConcreteConfiguration.ExportedObject(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_23A37219C(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x60)]);
}

uint64_t sub_23A3721C8(void *a1)
{
  uint64_t *v1;

  sub_23A371FF0(a1, *v1);
  return 1;
}

id sub_23A3721E4(uint64_t a1)
{
  char *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  objc_super v7;

  v2 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1);
  v3 = v2[10];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(&v1[v2[12]], a1, v3);
  v5 = (objc_class *)type metadata accessor for ConcreteConfiguration.ExportedObject(0, v3, v2[11], v4);
  v7.receiver = v1;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_init);
}

id sub_23A372264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for ConcreteConfiguration.ExportedObject(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_23A3721E4(a1);
}

uint64_t dispatch thunk of IngestionExtension.ingest(reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_23A3722A8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for ConcreteConfiguration.ExportedObject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ConcreteConfiguration.ExportedObject);
}

void sub_23A372324(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for ConcreteConfiguration(255, *a1, a1[1], a4);
  JUMPOUT(0x23B84A0F4);
}

uint64_t type metadata accessor for ConcreteConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ConcreteConfiguration);
}

uint64_t sub_23A372358()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A372360(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B84A0F4](&unk_23A375600);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_23A37238C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23A3723B8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23A3723DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B84A0B8](a1, v6, a5);
}

uint64_t sub_23A372414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A374E50();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_23A372450(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A374E50();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_23A372484(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A374E50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A3724C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A374E50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A37250C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A374E50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A372550(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A374E50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_23A372594()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A3725A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A374E50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_23A3725DC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A3725E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A374E50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for InternalLogger()
{
  uint64_t result;

  result = qword_25696ECB8;
  if (!qword_25696ECB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A372664()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A374E50();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A3726CC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_23A3728D0(a1, a2, a3, a4, a5, a6, MEMORY[0x24BEE7908]);
}

uint64_t sub_23A3726D8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_23A3728D0(a1, a2, a3, a4, a5, a6, MEMORY[0x24BEE7910]);
}

uint64_t sub_23A3726E4(uint64_t a1)
{
  return sub_23A37272C(a1, qword_25696F0D0, &qword_25696E9A0, (id *)&qword_25696EC50);
}

uint64_t sub_23A372708(uint64_t a1)
{
  return sub_23A37272C(a1, qword_25696F0E8, &qword_25696E9A8, (id *)&qword_25696EC58);
}

uint64_t sub_23A37272C(uint64_t a1, uint64_t *a2, _QWORD *a3, id *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v7 = sub_23A374E50();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for InternalLogger();
  __swift_allocate_value_buffer(v11, a2);
  v12 = __swift_project_value_buffer(v11, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v13 = *a4;
  sub_23A374E5C();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v12, v10, v7);
}

uint64_t sub_23A37280C()
{
  uint64_t result;

  sub_23A3732C8();
  result = sub_23A374F1C();
  qword_25696EC50 = result;
  return result;
}

uint64_t sub_23A372870()
{
  uint64_t result;

  sub_23A3732C8();
  result = sub_23A374F1C();
  qword_25696EC58 = result;
  return result;
}

uint64_t sub_23A3728C4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_23A3728D0(a1, a2, a3, a4, a5, a6, MEMORY[0x24BEE78F0]);
}

uint64_t sub_23A3728D0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE v29[4];
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v35 = a5;
  v36 = a1;
  v33 = a3;
  v34 = sub_23A374E20();
  v11 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = &v29[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = sub_23A374E50();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8]();
  v17 = &v29[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v17, v7, v14);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v37 = a2;
  swift_bridgeObjectRetain_n();
  v18 = sub_23A374E44();
  v19 = a7();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v32 = v15;
    v22 = v21;
    v31 = swift_slowAlloc();
    v39 = v31;
    *(_DWORD *)v22 = 136315650;
    sub_23A374E08();
    v30 = v20;
    v23 = sub_23A374E14();
    v33 = v14;
    v25 = v24;
    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v34);
    v38 = sub_23A372BE8(v23, v25, &v39);
    sub_23A374F28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    v38 = sub_23A372BE8(v35, a6, &v39);
    sub_23A374F28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    v26 = v37;
    swift_bridgeObjectRetain();
    v38 = sub_23A372BE8(v36, v26, &v39);
    sub_23A374F28();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A36E000, v18, (os_log_type_t)v30, "[%s: %s] %s", (uint8_t *)v22, 0x20u);
    v27 = v31;
    swift_arrayDestroy();
    MEMORY[0x23B84A160](v27, -1, -1);
    MEMORY[0x23B84A160](v22, -1, -1);

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v32 + 8))(v17, v33);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_23A372BE8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A372CB8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A373248((uint64_t)v12, *a3);
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
      sub_23A373248((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23A372CB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A374F34();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A372E70(a5, a6);
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
  v8 = sub_23A374F70();
  if (!v8)
  {
    sub_23A374F88();
    __break(1u);
LABEL_17:
    result = sub_23A374FA0();
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

uint64_t sub_23A372E70(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A372F04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A3730DC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A3730DC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A372F04(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A373078(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A374F58();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A374F88();
      __break(1u);
LABEL_10:
      v2 = sub_23A374EB0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A374FA0();
    __break(1u);
LABEL_14:
    result = sub_23A374F88();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A373078(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696ECF0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A3730DC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696ECF0);
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
  result = sub_23A374FA0();
  __break(1u);
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

uint64_t sub_23A373248(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

unint64_t sub_23A3732C8()
{
  unint64_t result;

  result = qword_25696ECF8;
  if (!qword_25696ECF8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25696ECF8);
  }
  return result;
}

void sub_23A373304(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23A373354()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = v0[1];
  *(_QWORD *)(v1 + 128) = *v0;
  *(_QWORD *)(v1 + 136) = v2;
  return swift_task_switch();
}

uint64_t sub_23A373370()
{
  _QWORD *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = objc_allocWithZone(MEMORY[0x24BDC79E8]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23A374E80();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithExtensionPointIdentifier_, v2);
  v0[18] = v3;

  v4 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED38);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23A375670;
  *(_QWORD *)(v5 + 32) = v3;
  sub_23A374ED4();
  sub_23A374DA4(0, &qword_25696ED40);
  v6 = v3;
  v7 = sub_23A374EBC();
  v0[19] = v7;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A3734F8;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A373580;
  v0[13] = &block_descriptor_12;
  v0[14] = v8;
  objc_msgSend(v4, sel_executeQueries_completionHandler_, v7, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A3734F8()
{
  return swift_task_switch();
}

uint64_t sub_23A373544()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 152);

  v2 = *(_QWORD *)(v0 + 120);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_23A373580(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  sub_23A374DA4(0, &qword_25696ED48);
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_23A374EC8();
  return swift_continuation_resume();
}

BOOL static IngestionExtensionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t IngestionExtensionError.hash(into:)()
{
  return sub_23A375000();
}

uint64_t IngestionExtensionError.hashValue.getter()
{
  sub_23A374FF4();
  sub_23A375000();
  return sub_23A37500C();
}

BOOL sub_23A373658(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A373670()
{
  sub_23A374FF4();
  sub_23A375000();
  return sub_23A37500C();
}

uint64_t sub_23A3736B4()
{
  return sub_23A375000();
}

uint64_t sub_23A3736DC()
{
  sub_23A374FF4();
  sub_23A375000();
  return sub_23A37500C();
}

DendriteIngest::IngestionExtensionHost __swiftcall IngestionExtensionHost.init()()
{
  _QWORD *v0;
  DendriteIngest::IngestionExtensionHost result;

  *v0 = 0xD000000000000032;
  v0[1] = 0x800000023A375D60;
  return result;
}

uint64_t IngestionExtensionHost.ingest()()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v1[7] = type metadata accessor for InternalLogger();
  v2 = swift_task_alloc();
  v3 = *v0;
  v4 = v0[1];
  v1[8] = v2;
  v1[9] = v3;
  v1[10] = v4;
  v1[2] = v3;
  v1[3] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v1[11] = v5;
  *v5 = v1;
  v5[1] = sub_23A3737CC;
  v6 = v1[3];
  v5[16] = v1[2];
  v5[17] = v6;
  return swift_task_switch();
}

uint64_t sub_23A3737CC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A373828()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  if (!*(_QWORD *)(v0 + 96))
  {
    if (qword_25696E990 != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v0 + 56), (uint64_t)qword_25696F0D0);
    sub_23A3726CC(0xD000000000000029, 0x800000023A375DA0, 0xD00000000000006ELL, 0x800000023A375DD0, 0x2928747365676E69, 0xE800000000000000);
    goto LABEL_15;
  }
  v1 = *(_QWORD *)(v0 + 96);
  if (qword_25696E990 != -1)
  {
    swift_once();
    v1 = *(_QWORD *)(v0 + 96);
  }
  v2 = *(_QWORD *)(v0 + 64);
  v3 = __swift_project_value_buffer(*(_QWORD *)(v0 + 56), (uint64_t)qword_25696F0D0);
  sub_23A3717A0(v3, v2);
  sub_23A374F4C();
  swift_bridgeObjectRelease();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_23A374F94();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((*(_QWORD *)(v0 + 96) & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)(v0 + 48) = v4;
  sub_23A374FAC();
  sub_23A374EA4();
  swift_bridgeObjectRelease();
  sub_23A374EA4();
  sub_23A3726CC(0x20646E756F46, 0xE600000000000000, 0xD00000000000006ELL, 0x800000023A375DD0, 0x2928747365676E69, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_23A37186C(v5);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_23A374F94();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 104) = v9;
    if (v9)
      goto LABEL_8;
    goto LABEL_14;
  }
  v6 = *(_QWORD *)((*(_QWORD *)(v0 + 96) & 0xFFFFFFFFFFFFF8) + 0x10);
  *(_QWORD *)(v0 + 104) = v6;
  if (!v6)
  {
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
LABEL_8:
  v7 = *(_QWORD *)(v0 + 96);
  if ((v7 & 0xC000000000000001) != 0)
    v8 = (id)MEMORY[0x23B849D94](0);
  else
    v8 = *(id *)(v7 + 32);
  v11 = (uint64_t)v8;
  *(_QWORD *)(v0 + 112) = v8;
  *(_QWORD *)(v0 + 120) = 1;
  v12 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 40) = v12;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v13;
  *v13 = v0;
  v13[1] = sub_23A373B24;
  return sub_23A373C98(v11);
}

uint64_t sub_23A373B24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

id sub_23A373B90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 104);

  if (v1 == v2)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 96);
    if ((v5 & 0xC000000000000001) != 0)
      result = (id)MEMORY[0x23B849D94](*(_QWORD *)(v0 + 120));
    else
      result = *(id *)(v5 + 8 * v4 + 32);
    v6 = (uint64_t)result;
    *(_QWORD *)(v0 + 112) = result;
    *(_QWORD *)(v0 + 120) = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
    }
    else
    {
      v7 = *(_QWORD *)(v0 + 80);
      *(_QWORD *)(v0 + 32) = *(_QWORD *)(v0 + 72);
      *(_QWORD *)(v0 + 40) = v7;
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 128) = v8;
      *v8 = v0;
      v8[1] = sub_23A373B24;
      return (id)sub_23A373C98(v6);
    }
  }
  return result;
}

uint64_t sub_23A373C58()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A373C98(uint64_t a1)
{
  _QWORD *v1;

  v1[3] = a1;
  v1[4] = type metadata accessor for InternalLogger();
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A373D20()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  id v15;

  if (qword_25696E990 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(void **)(v0 + 24);
  v3 = __swift_project_value_buffer(*(_QWORD *)(v0 + 32), (uint64_t)qword_25696F0D0);
  sub_23A3717A0(v3, v1);
  sub_23A374F4C();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_description);
  sub_23A374E8C();

  sub_23A374EA4();
  swift_bridgeObjectRelease();
  sub_23A3728C4(0xD000000000000012, 0x800000023A375E60, 0xD00000000000006ELL, 0x800000023A375DD0, 0xD000000000000011, 0x800000023A375E80);
  swift_bridgeObjectRelease();
  sub_23A37186C(v1);
  *(_QWORD *)(v0 + 16) = 0;
  v5 = objc_msgSend(v2, sel_makeXPCConnectionWithError_, v0 + 16);
  *(_QWORD *)(v0 + 48) = v5;
  v6 = *(void **)(v0 + 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)(v0 + 24);
    v9 = (void *)objc_opt_self();
    v10 = v6;
    v11 = objc_msgSend(v9, sel_interfaceWithProtocol_, &unk_2569712D8);
    objc_msgSend(v7, sel_setRemoteObjectInterface_, v11);

    objc_msgSend(v7, sel_resume);
    v12 = swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v12;
    *(_QWORD *)(v12 + 16) = v7;
    *(_QWORD *)(v12 + 24) = v8;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v13;
    *v13 = v0;
    v13[1] = sub_23A374000;
    return sub_23A374FB8();
  }
  else
  {
    v15 = v6;
    sub_23A374DFC();

    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A374000()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A3740B8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A374120()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23A374194()
{
  unint64_t result;

  result = qword_25696ED18;
  if (!qword_25696ED18)
  {
    result = MEMORY[0x23B84A0F4](&protocol conformance descriptor for IngestionExtensionError, &type metadata for IngestionExtensionError);
    atomic_store(result, (unint64_t *)&qword_25696ED18);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ExtensionPoint(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ExtensionPoint()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for ExtensionPoint(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ExtensionPoint()
{
  return &type metadata for ExtensionPoint;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IngestionExtensionError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IngestionExtensionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A374350 + 4 * byte_23A375685[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A374384 + 4 * byte_23A375680[v4]))();
}

uint64_t sub_23A374384(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A37438C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A374394);
  return result;
}

uint64_t sub_23A3743A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A3743A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A3743AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3743B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3743C0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A3743C8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IngestionExtensionError()
{
  return &type metadata for IngestionExtensionError;
}

_QWORD *_s14DendriteIngest14ExtensionPointVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14DendriteIngest14ExtensionPointVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23A37446C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IngestionExtensionHost()
{
  return &type metadata for IngestionExtensionHost;
}

uint64_t sub_23A3744B8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, char *, uint64_t);
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void (*v33)(uint64_t, char *, uint64_t);
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t aBlock;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  _BYTE v45[40];

  v6 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8]();
  v36 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED20);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8]();
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v37 = a1;
  v35 = v11;
  v11((char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v12 = *(unsigned __int8 *)(v9 + 80);
  v34 = v12 | 7;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  v14 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v14(v13 + ((v12 + 24) & ~v12), (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v43 = sub_23A374C40;
  v44 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v40 = 1107296256;
  v41 = sub_23A373304;
  v42 = &block_descriptor_0;
  v15 = _Block_copy(&aBlock);
  v16 = a3;
  swift_release();
  v17 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v15);
  _Block_release(v15);
  sub_23A374F40();
  swift_unknownObjectRelease();
  sub_23A373248((uint64_t)v45, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v31 = ~v12;
    v32 = v38;
    v33 = v14;
    if (qword_25696E990 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v6, (uint64_t)qword_25696F0D0);
    v19 = v36;
    sub_23A3717A0(v18, v36);
    aBlock = 0;
    v40 = 0xE000000000000000;
    sub_23A374F4C();
    swift_bridgeObjectRelease();
    aBlock = 0xD000000000000021;
    v40 = 0x800000023A375EE0;
    v20 = objc_msgSend(v16, sel_description);
    sub_23A374E8C();

    sub_23A374EA4();
    swift_bridgeObjectRelease();
    sub_23A3726CC(aBlock, v40, 0xD00000000000006ELL, 0x800000023A375DD0, 0xD000000000000011, 0x800000023A375E80);
    swift_bridgeObjectRelease();
    sub_23A37186C(v19);
    v35((char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v37, v8);
    v21 = (v12 + 16) & v31;
    v22 = swift_allocObject();
    v33(v22 + v21, (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    v43 = sub_23A374D44;
    v44 = v22;
    aBlock = MEMORY[0x24BDAC760];
    v40 = 1107296256;
    v41 = sub_23A3704C4;
    v42 = &block_descriptor_11;
    v23 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v32, sel_ingestWithReply_, v23);
    _Block_release(v23);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_25696E990 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v6, (uint64_t)qword_25696F0D0);
    v25 = v36;
    sub_23A3717A0(v24, v36);
    aBlock = 0;
    v40 = 0xE000000000000000;
    sub_23A374F4C();
    sub_23A374EA4();
    v26 = objc_msgSend(v16, sel_description);
    sub_23A374E8C();

    sub_23A374EA4();
    swift_bridgeObjectRelease();
    sub_23A3726D8(aBlock, v40, 0xD00000000000006ELL, 0x800000023A375DD0, 0xD000000000000011, 0x800000023A375E80);
    swift_bridgeObjectRelease();
    sub_23A37186C(v25);
    sub_23A374C9C();
    v27 = swift_allocError();
    *v28 = 1;
    aBlock = v27;
    sub_23A374EEC();
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
}

uint64_t sub_23A3749D4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A3744B8(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_23A3749DC(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[2];
  uint64_t v11;
  unint64_t v12;

  v4 = type metadata accessor for InternalLogger();
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696E990 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v4, (uint64_t)qword_25696F0D0);
  sub_23A3717A0(v7, (uint64_t)v6);
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_23A374F4C();
  sub_23A374EA4();
  v8 = objc_msgSend(a2, sel_description);
  sub_23A374E8C();

  sub_23A374EA4();
  swift_bridgeObjectRelease();
  sub_23A374EA4();
  v10[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696EB08);
  sub_23A374F7C();
  sub_23A3726D8(v11, v12, 0xD00000000000006ELL, 0x800000023A375DD0, 0xD000000000000011, 0x800000023A375E80);
  swift_bridgeObjectRelease();
  sub_23A37186C((uint64_t)v6);
  v11 = a1;
  MEMORY[0x23B84A0A0](a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED20);
  return sub_23A374EEC();
}

uint64_t sub_23A374BC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED20);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A374C40(uint64_t a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED20);
  return sub_23A3749DC(a1, *(void **)(v1 + 16));
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

unint64_t sub_23A374C9C()
{
  unint64_t result;

  result = qword_25696ED30;
  if (!qword_25696ED30)
  {
    result = MEMORY[0x23B84A0F4](&protocol conformance descriptor for IngestionExtensionError, &type metadata for IngestionExtensionError);
    atomic_store(result, (unint64_t *)&qword_25696ED30);
  }
  return result;
}

uint64_t sub_23A374CE0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED20);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23A374D44()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696ED20);
  return sub_23A374EF8();
}

uint64_t sub_23A374DA4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A374DF0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A374DFC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A374E08()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_23A374E14()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_23A374E20()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A374E2C()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_23A374E38()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23A374E44()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A374E50()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A374E5C()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_23A374E68()
{
  return MEMORY[0x24BE2BD28]();
}

uint64_t sub_23A374E74()
{
  return MEMORY[0x24BE2BD30]();
}

uint64_t sub_23A374E80()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A374E8C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A374E98()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A374EA4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A374EB0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A374EBC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A374EC8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A374ED4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A374EE0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A374EEC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23A374EF8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23A374F04()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A374F10()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A374F1C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23A374F28()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A374F34()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A374F40()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A374F4C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A374F58()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A374F64()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A374F70()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A374F7C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A374F88()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A374F94()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A374FA0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A374FAC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A374FB8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23A374FC4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A374FD0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A374FDC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A374FE8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A374FF4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A375000()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A37500C()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

